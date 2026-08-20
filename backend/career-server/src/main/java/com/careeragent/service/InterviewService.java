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
import com.careeragent.interview.agent.InterviewAgentOrchestrator;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.function.Consumer;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service @RequiredArgsConstructor
public class InterviewService {
 private final Map<Long,RunningReply> runningReplies=new ConcurrentHashMap<>();
 private final InterviewSessionMapper sessionMapper;private final InterviewMessageMapper messageMapper;private final InterviewReportMapper reportMapper;
 private final ApplicationService applicationService;private final JobDescriptionService jobService;private final CurrentUserProvider currentUser;private final LLMAdapter llm;
 private final ResumeVersionService resumeVersionService;private final ResumeService resumeService;private final InterviewAgentOrchestrator agent;

 @Transactional public InterviewCreateVO create(InterviewCreateRequest request){
  if(!List.of(15,30,60).contains(request.duration()))throw new BusinessException(40071,"面试时长只支持 15、30 或 60 分钟");
  ApplicationDetailVO application=null;if(request.applicationId()!=null)application=applicationService.get(request.applicationId());
  var session=new InterviewSession();session.setUserId(currentUser.getCurrentUserId());session.setApplicationId(request.applicationId());
  if(request.resumeId()==null&&request.resumeVersionId()==null)throw new BusinessException(40072,"请选择本场面试使用的简历");var resume=request.resumeVersionId()==null?null:resumeVersionService.get(request.resumeVersionId());var master=request.resumeId()==null?null:resumeService.get(request.resumeId());session.setResumeId(request.resumeId());session.setResumeVersionId(request.resumeVersionId());session.setJobId(application==null?(resume==null?null:resume.getJobDescriptionId()):application.getJobDescriptionId());session.setStage(request.stage());session.setMode(request.mode());session.setDuration(request.duration());session.setModel(cleanModel(request.model()));session.setStatus(InterviewStatus.IN_PROGRESS);session.setAgentState(InterviewAgentState.INIT);session.setCurrentDepth(0);session.setCurrentTurn(0);sessionMapper.insert(session);
  var jd=application==null?"":Optional.ofNullable(application.getJob()).map(JobDescriptionVO::getRawContent).orElse("");var jobName=application==null?(resume==null?Optional.ofNullable(master.getTargetRole()).orElse("通用技术岗位"):Optional.ofNullable(resume.getTargetJobName()).orElse("通用技术岗位")):application.getJobName();var resumeContent=resume==null?master.toString():Optional.ofNullable(resume.getContentMarkdown()).orElseGet(()->Objects.toString(resume.getSnapshotData(),""));
  var firstQuestion=agent.prepare(session,jobName,jd,resumeContent,delta->{});var first=saveMessage(session,"assistant",safeReply(firstQuestion));
  return new InterviewCreateVO(session.getId(),toVO(session,application,null),InterviewMessageVO.from(first));
 }
 public List<InterviewSessionVO> list(){return sessionMapper.selectList(Wrappers.<InterviewSession>lambdaQuery().eq(InterviewSession::getUserId,currentUser.getCurrentUserId()).orderByDesc(InterviewSession::getCreatedAt)).stream().map(this::toVO).toList();}
 public InterviewSessionVO get(Long id){return toVO(owned(id));}
 public List<InterviewMessageVO> messages(Long id){owned(id);return messageEntities(id).stream().map(InterviewMessageVO::from).toList();}
 public List<InterviewEvaluation> evaluations(Long id){owned(id);return agent.evaluations(id);}
 @Transactional public InterviewMessageVO reply(Long id,InterviewMessageRequest request){
  var session=owned(id);if(session.getStatus()!=InterviewStatus.IN_PROGRESS)throw new BusinessException(40971,"该模拟面试已经结束");
  var running=new RunningReply(Thread.currentThread(),new AtomicBoolean(false));if(runningReplies.putIfAbsent(id,running)!=null)throw new BusinessException(40972,"该模拟面试正在生成回复");
  try{var history=messageEntities(id);var question=lastQuestion(history);var answer=saveMessage(session,"user",request.content().trim());var selectedModel=cleanModel(request.model());if(selectedModel!=null&&!selectedModel.equals(session.getModel())){session.setModel(selectedModel);sessionMapper.updateById(session);}var result=agent.answer(session,question,answer,messageEntities(id),delta->{});if(result.decision()==InterviewDecision.FINISH){var report=agent.report(session);return InterviewMessageVO.from(saveMessage(session,"assistant","本次面试已完成，综合评分 "+report.getScore()+" 分。请查看右侧面试报告。"));}return InterviewMessageVO.from(saveMessage(session,"assistant",safeReply(result.nextQuestion())));
  }catch(RuntimeException exception){if(running.cancelled().get())throw new BusinessException(40973,"已停止生成");throw exception;}finally{runningReplies.remove(id,running);}
 }
 public boolean cancelReply(Long id){owned(id);var running=runningReplies.get(id);if(running==null)return false;running.cancelled().set(true);running.thread().interrupt();return true;}
 @Transactional public InterviewMessageVO streamReply(Long id,InterviewMessageRequest request,Consumer<String> onDelta){
  var session=owned(id);if(session.getStatus()!=InterviewStatus.IN_PROGRESS)throw new BusinessException(40971,"该模拟面试已经结束");
  var running=new RunningReply(Thread.currentThread(),new AtomicBoolean(false));if(runningReplies.putIfAbsent(id,running)!=null)throw new BusinessException(40972,"该模拟面试正在生成回复");
  try{var history=messageEntities(id);var question=lastQuestion(history);var answer=saveMessage(session,"user",request.content().trim());var selectedModel=cleanModel(request.model());if(selectedModel!=null&&!selectedModel.equals(session.getModel())){session.setModel(selectedModel);sessionMapper.updateById(session);}var result=agent.answer(session,question,answer,messageEntities(id),delta->{if(running.cancelled().get())throw new BusinessException(40973,"已停止生成");onDelta.accept(delta);});if(running.cancelled().get())throw new BusinessException(40973,"已停止生成");if(result.decision()==InterviewDecision.FINISH){var report=agent.report(session);var text="本次面试已完成，综合评分 "+report.getScore()+" 分。请查看右侧面试报告。";onDelta.accept(text);return InterviewMessageVO.from(saveMessage(session,"assistant",text));}return InterviewMessageVO.from(saveMessage(session,"assistant",safeReply(result.nextQuestion())));
  }catch(RuntimeException exception){if(running.cancelled().get())throw new BusinessException(40973,"已停止生成");throw exception;}finally{runningReplies.remove(id,running);}
 }
 @Transactional public InterviewReportVO finish(Long id){
  var session=owned(id);var existing=reportMapper.selectOne(Wrappers.<InterviewReport>lambdaQuery().eq(InterviewReport::getSessionId,id));if(existing!=null)return InterviewReportVO.from(existing);
  return InterviewReportVO.from(agent.report(session));
 }
 InterviewSession owned(Long id){var value=sessionMapper.selectOne(Wrappers.<InterviewSession>lambdaQuery().eq(InterviewSession::getId,id).eq(InterviewSession::getUserId,currentUser.getCurrentUserId()));if(value==null)throw new ResourceNotFoundException("InterviewSession",id);return value;}
 private InterviewMessage saveMessage(InterviewSession session,String role,String content){var value=new InterviewMessage();value.setSessionId(session.getId());value.setRole(role);value.setContent(content);value.setTurnNumber(session.getCurrentTurn());value.setTopic(session.getCurrentTopic());value.setQuestionLevel(session.getCurrentDepth());value.setMessageStatus("COMPLETED");messageMapper.insert(value);return value;}
 private InterviewMessage lastQuestion(List<InterviewMessage> history){return history.stream().filter(v->"assistant".equals(v.getRole())).reduce((a,b)->b).orElseThrow(()->new BusinessException(40974,"当前面试缺少待回答问题"));}
 private List<InterviewMessage> messageEntities(Long id){return messageMapper.selectList(Wrappers.<InterviewMessage>lambdaQuery().eq(InterviewMessage::getSessionId,id).orderByAsc(InterviewMessage::getCreatedAt).orderByAsc(InterviewMessage::getId));}
 private Map<String,Object> context(InterviewSession session,ApplicationDetailVO application,List<InterviewMessage> history){var value=new LinkedHashMap<String,Object>();value.put("stage",session.getStage());value.put("mode",session.getMode());value.put("duration",session.getDuration());if(application!=null){value.put("company",application.getCompany());value.put("job",application.getJobName());value.put("jd",application.getJob());value.put("resumeVersion",application.getResumeVersion());}value.put("history",historyPayload(history));return value;}
 private List<Map<String,String>> historyPayload(List<InterviewMessage> history){return history.stream().skip(Math.max(0,history.size()-30)).map(message->Map.of("role",message.getRole(),"content",message.getContent())).toList();}
 private InterviewSessionVO toVO(InterviewSession session){var application=session.getApplicationId()==null?null:applicationService.get(session.getApplicationId());var report=reportMapper.selectOne(Wrappers.<InterviewReport>lambdaQuery().eq(InterviewReport::getSessionId,session.getId()));return toVO(session,application,report);}
 private InterviewSessionVO toVO(InterviewSession session,ApplicationDetailVO application,InterviewReport report){String company=null,job=null;if(application!=null){company=application.getCompany();job=application.getJobName();}else if(session.getJobId()!=null){var jd=jobService.get(session.getJobId());company=jd.getCompany();job=jd.getJobName();}return new InterviewSessionVO(session.getId(),session.getApplicationId(),session.getJobId(),session.getResumeId(),session.getResumeVersionId(),company,job,session.getStage(),session.getMode(),session.getDuration(),session.getModel(),session.getStatus(),session.getAgentState(),session.getDecision(),session.getCurrentTopic(),session.getCurrentDepth(),session.getCurrentTurn(),session.getScore(),session.getCreatedAt(),session.getUpdatedAt(),InterviewReportVO.from(report));}
 private String safeReply(String value){return nonBlank(value,"请结合你的真实经历介绍一下这个问题。");}
 private String nonBlank(String value,String fallback){return value==null||value.isBlank()?fallback:value.trim();}
 private String cleanModel(String value){return value==null||value.isBlank()?null:value.trim();}
 private record RunningReply(Thread thread,AtomicBoolean cancelled){}
}
