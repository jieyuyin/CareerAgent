package com.careeragent.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.careeragent.agent.llm.LLMAdapter;
import com.careeragent.agent.prompt.RecruitmentEmailPrompt;
import com.careeragent.agent.structured.EmailAnalysisOutput;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.careeragent.dto.EmailAccountRequest;
import com.careeragent.dto.EmailSyncSettingsRequest;
import com.careeragent.email.*;
import com.careeragent.exception.BusinessException;
import com.careeragent.mapper.*;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.*;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

@Service @RequiredArgsConstructor
public class EmailAccountService {
 private static final List<String> RECRUITMENT_KEYWORDS=List.of("招聘","面试","offer","笔试","测评","投递","录用","未通过","不合适");
 private final EmailAccountMapper accountMapper; private final RecruitmentEmailMapper emailMapper; private final EmailInboxClient inboxClient;
 private final SecretCryptoService crypto; private final CurrentUserProvider currentUser; private final LLMAdapter llm; private final ApplicationService applicationService;

 public void test(EmailAccountRequest request){inboxClient.test(request.email(),request.authorizationCode());}
 @Transactional public EmailAccountVO bind(EmailAccountRequest request){
  inboxClient.test(request.email(),request.authorizationCode());var account=currentEntity();if(account==null)account=new EmailAccount();
  account.setUserId(currentUser.getCurrentUserId());account.setProvider(EmailProvider.NETEASE_163);account.setEmail(request.email());
  account.setEncryptedAuthorizationCode(crypto.encrypt(request.authorizationCode()));account.setStatus(EmailAccountStatus.CONNECTED);
  if(account.getAutoSyncEnabled()==null)account.setAutoSyncEnabled(false);if(account.getSyncIntervalHours()==null)account.setSyncIntervalHours(4);
  if(account.getId()==null)accountMapper.insert(account);else accountMapper.updateById(account);return EmailAccountVO.from(account);
 }
 public EmailAccountVO current(){var value=currentEntity();return value==null?null:EmailAccountVO.from(value);}
 @Transactional public EmailAccountVO updateSyncSettings(EmailSyncSettingsRequest request){
  var account=currentEntity();if(account==null)throw new BusinessException(40461,"请先绑定 163 邮箱");
  account.setAutoSyncEnabled(request.enabled());account.setSyncIntervalHours(request.intervalHours());
  account.setNextSyncTime(request.enabled()?OffsetDateTime.now().plusHours(request.intervalHours()):null);accountMapper.updateById(account);return EmailAccountVO.from(account);
 }
 public List<RecruitmentEmailVO> emails(){var account=currentEntity();if(account==null)return List.of();return emailMapper.selectList(Wrappers.<RecruitmentEmail>lambdaQuery()
   .eq(RecruitmentEmail::getEmailAccountId,account.getId()).orderByDesc(RecruitmentEmail::getReceivedTime).last("LIMIT 100")).stream().map(RecruitmentEmailVO::from).toList();}
 public EmailSyncResultVO sync(){
  var account=currentEntity();if(account==null)throw new BusinessException(40461,"请先绑定 163 邮箱");
  return syncAccount(account);
 }
 public EmailSyncResultVO syncAccount(EmailAccount account){
  try{var since=Optional.ofNullable(account.getLastSyncTime()).orElse(OffsetDateTime.now().minusDays(30));var incoming=inboxClient.fetch(account.getEmail(),crypto.decrypt(account.getEncryptedAuthorizationCode()),since);
   var recruitment=0;var linked=0;var updated=0;
   for(var message:incoming){if(!isRecruitment(message)||exists(account.getId(),message.uid()))continue;recruitment++;
    var analysis=normalizeAnalysis(message.subject(),llm.structuredOutput(RecruitmentEmailPrompt.TEXT,Map.of("subject",message.subject(),"content",message.content()),EmailAnalysisOutput.class));
    var type=Optional.ofNullable(analysis.type()).orElse(RecruitmentEmailType.UNKNOWN);
    var link=applicationService.linkRecruitmentEmail(account.getUserId(),type,analysis.company(),analysis.job(),message.subject()+"\n"+message.content(),message.subject());
    if(link.applicationId()!=null)linked++;if(link.statusUpdated())updated++;saveEmail(account.getId(),message,analysis,link.applicationId());}
   account.setLastSyncTime(OffsetDateTime.now());account.setStatus(EmailAccountStatus.CONNECTED);account.setLastSyncError(null);scheduleNext(account);accountMapper.updateById(account);
   return new EmailSyncResultVO(incoming.size(),recruitment,linked,updated);
  }catch(RuntimeException exception){account.setStatus(EmailAccountStatus.ERROR);account.setLastSyncError(limit(exception.getMessage(),1000));scheduleNext(account);accountMapper.updateById(account);throw exception;}
 }
 @Scheduled(fixedDelayString="${career.email.scheduler-delay-ms:60000}",initialDelayString="${career.email.scheduler-initial-delay-ms:60000}")
 public void syncDueAccounts(){
  var now=OffsetDateTime.now();var due=accountMapper.selectList(Wrappers.<EmailAccount>lambdaQuery().eq(EmailAccount::getAutoSyncEnabled,true)
    .and(query->query.isNull(EmailAccount::getNextSyncTime).or().le(EmailAccount::getNextSyncTime,now)));
  for(var account:due){try{syncAccount(account);}catch(RuntimeException ignored){/* Error details are persisted for the user; other accounts must still run. */}}
 }
 @Transactional public RecruitmentEmailVO reanalyze(Long id){var email=ownedEmail(id);var analysis=normalizeAnalysis(email.getSubject(),llm.structuredOutput(RecruitmentEmailPrompt.TEXT,Map.of("subject",email.getSubject(),"content",email.getContent()),EmailAnalysisOutput.class));email.setEmailType(analysis.type());email.setCompany(blankToNull(analysis.company()));email.setJobName(blankToNull(analysis.job()));email.setConfidence(BigDecimal.valueOf(Math.max(0d,Math.min(1d,Optional.ofNullable(analysis.confidence()).orElse(0d)))));emailMapper.updateById(email);return RecruitmentEmailVO.from(email);}
 @Transactional public RecruitmentEmailVO link(Long id,Long applicationId){var email=ownedEmail(id);applicationService.linkRecruitmentEmailToApplication(applicationId,email.getEmailType(),email.getSubject());email.setApplicationId(applicationId);emailMapper.updateById(email);return RecruitmentEmailVO.from(email);}
 private boolean isRecruitment(InboundEmail message){var text=(message.subject()+"\n"+message.content()).toLowerCase();return RECRUITMENT_KEYWORDS.stream().anyMatch(text::contains);}
 private boolean exists(Long accountId,String uid){return emailMapper.selectCount(Wrappers.<RecruitmentEmail>lambdaQuery().eq(RecruitmentEmail::getEmailAccountId,accountId).eq(RecruitmentEmail::getMessageUid,uid))>0;}
 private void saveEmail(Long accountId,InboundEmail message,EmailAnalysisOutput analysis,Long applicationId){var value=new RecruitmentEmail();value.setEmailAccountId(accountId);value.setApplicationId(applicationId);value.setMessageUid(message.uid());value.setSubject(limit(message.subject(),1000));value.setSender(limit(message.sender(),1000));value.setContent(limit(message.content(),50000));value.setEmailType(Optional.ofNullable(analysis.type()).orElse(RecruitmentEmailType.UNKNOWN));value.setCompany(blankToNull(analysis.company()));value.setJobName(blankToNull(analysis.job()));var confidence=Math.max(0d,Math.min(1d,Optional.ofNullable(analysis.confidence()).orElse(0d)));value.setConfidence(BigDecimal.valueOf(confidence));value.setReceivedTime(message.receivedTime());emailMapper.insert(value);}
 private EmailAccount currentEntity(){return accountMapper.selectOne(Wrappers.<EmailAccount>lambdaQuery().eq(EmailAccount::getUserId,currentUser.getCurrentUserId()));}
 private RecruitmentEmail ownedEmail(Long id){var account=currentEntity();if(account==null)throw new BusinessException(40461,"请先绑定 163 邮箱");var email=emailMapper.selectOne(Wrappers.<RecruitmentEmail>lambdaQuery().eq(RecruitmentEmail::getId,id).eq(RecruitmentEmail::getEmailAccountId,account.getId()));if(email==null)throw new BusinessException(40462,"招聘邮件不存在");return email;}
 private EmailAnalysisOutput normalizeAnalysis(String subject,EmailAnalysisOutput analysis){var text=Optional.ofNullable(subject).orElse("").toLowerCase();var type=analysis.type();if(text.contains("面试"))type=RecruitmentEmailType.INTERVIEW;else if(text.contains("笔试")||text.contains("测评"))type=RecruitmentEmailType.ASSESSMENT;else if(text.contains("拒绝")||text.contains("未通过")||text.contains("不合适")||text.contains("遗憾"))type=RecruitmentEmailType.REJECTED;else if(text.contains("offer")||text.contains("录用"))type=RecruitmentEmailType.OFFER;var company=Optional.ofNullable(analysis.company()).orElse("").replaceAll("(校园招聘|社会招聘|校园|校招|招聘)$","");return new EmailAnalysisOutput(type,company,analysis.job(),analysis.confidence());}
 private String limit(String value,int max){if(value==null)return "";return value.substring(0,Math.min(max,value.length()));}
 private String blankToNull(String value){return value==null||value.isBlank()?null:value;}
 private void scheduleNext(EmailAccount account){account.setNextSyncTime(Boolean.TRUE.equals(account.getAutoSyncEnabled())?OffsetDateTime.now().plusHours(Optional.ofNullable(account.getSyncIntervalHours()).orElse(4)):null);}
}
