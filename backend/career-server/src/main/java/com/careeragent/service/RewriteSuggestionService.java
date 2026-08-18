package com.careeragent.service;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.careeragent.agent.llm.LLMAdapter;
import com.careeragent.agent.prompt.ExperienceRewritePrompt;
import com.careeragent.agent.structured.ExperienceRewriteOutput;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.careeragent.exception.*;
import com.careeragent.mapper.RewriteSuggestionMapper;
import com.careeragent.security.CurrentUserProvider;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service @RequiredArgsConstructor
public class RewriteSuggestionService {
 private final RewriteSuggestionMapper mapper; private final JobDescriptionService jobService; private final ResumeService resumeService;
 private final CurrentUserProvider currentUser; private final LLMAdapter llm;
 @Transactional public RewriteSuggestion generate(Long jobId,Long resumeId,RewriteItemType type,String itemId){
  var job=jobService.get(jobId);var resume=resumeService.get(resumeId);var original=findItem(resume,type,itemId);
  var requirements=new ArrayList<String>();requirements.addAll(job.getRequiredSkills());requirements.addAll(job.getResponsibilities());
  var out=llm.structuredOutput(ExperienceRewritePrompt.TEXT,Map.of("itemType",type.name(),"itemId",itemId,"originalText",original,"jobRequirements",requirements),ExperienceRewriteOutput.class);
  var e=new RewriteSuggestion();e.setUserId(currentUser.getCurrentUserId());e.setJobDescriptionId(jobId);e.setResumeId(resumeId);e.setItemType(type);e.setItemId(itemId);e.setOriginalContent(original);e.setSuggestedContent(out.suggestedText());e.setReason(out.reason());e.setMatchedJobRequirements(out.matchedJobRequirements());e.setFactsToConfirm(out.factsToConfirm());e.setWarnings(out.warnings());e.setStatus(RewriteSuggestionStatus.PENDING);mapper.insert(e);return e;
 }
 @Transactional public RewriteSuggestion accept(Long id){var e=owned(id);ensurePending(e);e.setStatus(RewriteSuggestionStatus.ACCEPTED);mapper.updateById(e);return e;}
 @Transactional public RewriteSuggestion reject(Long id){var e=owned(id);ensurePending(e);e.setStatus(RewriteSuggestionStatus.REJECTED);mapper.updateById(e);return e;}
 @Transactional public RewriteSuggestion regenerate(Long id){var old=owned(id);ensurePending(old);old.setStatus(RewriteSuggestionStatus.SUPERSEDED);mapper.updateById(old);return generate(old.getJobDescriptionId(),old.getResumeId(),old.getItemType(),old.getItemId());}
 public RewriteSuggestion get(Long id){return owned(id);}
 private RewriteSuggestion owned(Long id){var e=mapper.selectOne(Wrappers.<RewriteSuggestion>lambdaQuery().eq(RewriteSuggestion::getId,id).eq(RewriteSuggestion::getUserId,currentUser.getCurrentUserId()));if(e==null)throw new ResourceNotFoundException("RewriteSuggestion",id);return e;}
 private void ensurePending(RewriteSuggestion e){if(e.getStatus()!=RewriteSuggestionStatus.PENDING)throw new BusinessException(40920,"Suggestion already processed: "+e.getStatus());}
 private String findItem(com.careeragent.vo.ResumeVO resume,RewriteItemType type,String itemId){var items=type==RewriteItemType.EXPERIENCE?resume.getExperiences():resume.getProjects();return items.stream().filter(i->itemId.equals(Objects.toString(i.get("id"),""))).findFirst().map(this::content).orElseThrow(()->new ResourceNotFoundException(type.name()+" item",0L));}
 private String content(Map<String,Object> item){for(var key:List.of("content","description","summary","text")){var value=item.get(key);if(value!=null&&!value.toString().isBlank())return value instanceof Collection<?> c?String.join("；",c.stream().map(Object::toString).toList()):value.toString();}return item.toString();}
}
