package com.careeragent.service;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.careeragent.agent.llm.LLMAdapter;
import com.careeragent.agent.prompt.InterviewPrompt;
import com.careeragent.agent.structured.*;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.careeragent.dto.*;
import com.careeragent.exception.*;
import com.careeragent.mapper.*;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.*;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @RequiredArgsConstructor
public class InterviewService {
 private final InterviewSessionMapper sessionMapper;private final InterviewMessageMapper messageMapper;private final InterviewReportMapper reportMapper;
 private final ApplicationService applicationService;private final JobDescriptionService jobService;private final CurrentUserProvider currentUser;private final LLMAdapter llm;

 @Transactional public InterviewCreateVO create(InterviewCreateRequest request){
  if(!List.of(15,30,60).contains(request.duration()))throw new BusinessException(40071,"面试时长只支持 15、30 或 60 分钟");
  ApplicationDetailVO application=null;if(request.applicationId()!=null)application=applicationService.get(request.applicationId());
  var session=new InterviewSession();session.setUserId(currentUser.getCurrentUserId());session.setApplicationId(request.applicationId());
  session.setJobId(application==null?null:application.getJobDescriptionId());session.setStage(request.stage());session.setMode(request.mode());session.setDuration(request.duration());session.setModel(cleanModel(request.model()));session.setStatus(InterviewStatus.IN_PROGRESS);sessionMapper.insert(session);
  var output=llm.structuredOutput(InterviewPrompt.TURN,context(session,application,List.of()),InterviewTurnOutput.class,session.getModel());
  var first=saveMessage(session.getId(),"assistant",safeReply(output.reply()));
  return new InterviewCreateVO(session.getId(),toVO(session,application,null),InterviewMessageVO.from(first));
 }
 public List<InterviewSessionVO> list(){return sessionMapper.selectList(Wrappers.<InterviewSession>lambdaQuery().eq(InterviewSession::getUserId,currentUser.getCurrentUserId()).orderByDesc(InterviewSession::getCreatedAt)).stream().map(this::toVO).toList();}
 public InterviewSessionVO get(Long id){return toVO(owned(id));}
 public List<InterviewMessageVO> messages(Long id){owned(id);return messageEntities(id).stream().map(InterviewMessageVO::from).toList();}
 @Transactional public InterviewMessageVO reply(Long id,InterviewMessageRequest request){
  var session=owned(id);if(session.getStatus()!=InterviewStatus.IN_PROGRESS)throw new BusinessException(40971,"该模拟面试已经结束");
  saveMessage(id,"user",request.content().trim());var selectedModel=cleanModel(request.model());if(selectedModel!=null&&!selectedModel.equals(session.getModel())){session.setModel(selectedModel);sessionMapper.updateById(session);}var history=messageEntities(id);var application=session.getApplicationId()==null?null:applicationService.get(session.getApplicationId());
  var output=llm.structuredOutput(InterviewPrompt.TURN,context(session,application,history),InterviewTurnOutput.class,session.getModel());
  return InterviewMessageVO.from(saveMessage(id,"assistant",safeReply(output.reply())));
 }
 @Transactional public InterviewReportVO finish(Long id){
  var session=owned(id);var existing=reportMapper.selectOne(Wrappers.<InterviewReport>lambdaQuery().eq(InterviewReport::getSessionId,id));if(existing!=null)return InterviewReportVO.from(existing);
  var output=llm.structuredOutput(InterviewPrompt.REPORT,Map.of("stage",session.getStage(),"mode",session.getMode(),"history",historyPayload(messageEntities(id))),InterviewReportOutput.class,session.getModel());
  var report=new InterviewReport();report.setSessionId(id);report.setScore(Math.max(0,Math.min(100,Optional.ofNullable(output.score()).orElse(0))));report.setStrength(nonBlank(output.strength(),"有效回答信息不足"));report.setWeakness(nonBlank(output.weakness(),"暂未识别明确短板"));report.setSuggestion(nonBlank(output.suggestion(),"继续补充真实案例并进行结构化表达"));reportMapper.insert(report);
  session.setScore(report.getScore());session.setStatus(InterviewStatus.FINISHED);sessionMapper.updateById(session);return InterviewReportVO.from(report);
 }
 InterviewSession owned(Long id){var value=sessionMapper.selectOne(Wrappers.<InterviewSession>lambdaQuery().eq(InterviewSession::getId,id).eq(InterviewSession::getUserId,currentUser.getCurrentUserId()));if(value==null)throw new ResourceNotFoundException("InterviewSession",id);return value;}
 private InterviewMessage saveMessage(Long sessionId,String role,String content){var value=new InterviewMessage();value.setSessionId(sessionId);value.setRole(role);value.setContent(content);messageMapper.insert(value);return value;}
 private List<InterviewMessage> messageEntities(Long id){return messageMapper.selectList(Wrappers.<InterviewMessage>lambdaQuery().eq(InterviewMessage::getSessionId,id).orderByAsc(InterviewMessage::getCreatedAt).orderByAsc(InterviewMessage::getId));}
 private Map<String,Object> context(InterviewSession session,ApplicationDetailVO application,List<InterviewMessage> history){var value=new LinkedHashMap<String,Object>();value.put("stage",session.getStage());value.put("mode",session.getMode());value.put("duration",session.getDuration());if(application!=null){value.put("company",application.getCompany());value.put("job",application.getJobName());value.put("jd",application.getJob());value.put("resumeVersion",application.getResumeVersion());}value.put("history",historyPayload(history));return value;}
 private List<Map<String,String>> historyPayload(List<InterviewMessage> history){return history.stream().skip(Math.max(0,history.size()-30)).map(message->Map.of("role",message.getRole(),"content",message.getContent())).toList();}
 private InterviewSessionVO toVO(InterviewSession session){var application=session.getApplicationId()==null?null:applicationService.get(session.getApplicationId());var report=reportMapper.selectOne(Wrappers.<InterviewReport>lambdaQuery().eq(InterviewReport::getSessionId,session.getId()));return toVO(session,application,report);}
 private InterviewSessionVO toVO(InterviewSession session,ApplicationDetailVO application,InterviewReport report){String company=null,job=null;if(application!=null){company=application.getCompany();job=application.getJobName();}else if(session.getJobId()!=null){var jd=jobService.get(session.getJobId());company=jd.getCompany();job=jd.getJobName();}return new InterviewSessionVO(session.getId(),session.getApplicationId(),session.getJobId(),company,job,session.getStage(),session.getMode(),session.getDuration(),session.getModel(),session.getStatus(),session.getScore(),session.getCreatedAt(),session.getUpdatedAt(),InterviewReportVO.from(report));}
 private String safeReply(String value){return nonBlank(value,"请结合你的真实经历介绍一下这个问题。");}
 private String nonBlank(String value,String fallback){return value==null||value.isBlank()?fallback:value.trim();}
 private String cleanModel(String value){return value==null||value.isBlank()?null:value.trim();}
}
