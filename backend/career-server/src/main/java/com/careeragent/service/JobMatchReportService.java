package com.careeragent.service;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.careeragent.agent.llm.LLMAdapter;
import com.careeragent.agent.prompt.ResumeMatchPrompt;
import com.careeragent.agent.structured.ResumeMatchOutput;
import com.careeragent.domain.entity.JobMatchReport;
import com.careeragent.mapper.JobMatchReportMapper;
import com.careeragent.security.CurrentUserProvider;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service @RequiredArgsConstructor
public class JobMatchReportService {
 private final JobMatchReportMapper mapper; private final JobDescriptionService jobService; private final ResumeService resumeService;
 private final CurrentUserProvider currentUser; private final LLMAdapter llm;
 @Transactional public JobMatchReport generate(Long jobId, Long resumeId) {
  var job=jobService.get(jobId); var resume=resumeService.get(resumeId);
  var out=llm.structuredOutput(ResumeMatchPrompt.TEXT,Map.of("job",job,"resume",resume),ResumeMatchOutput.class);
  var e=new JobMatchReport();e.setUserId(currentUser.getCurrentUserId());e.setJobDescriptionId(jobId);e.setResumeId(resumeId);e.setMatchScore(out.matchScore());
  e.setMatchedSkills(out.matchedSkills());e.setMissingSkills(out.missingSkills());e.setWeakExpressions(out.weakExpressions());e.setUnsupportedClaims(out.unsupportedClaims());e.setRecommendedChanges(out.recommendedChanges());e.setEvidence(out.evidence());mapper.insert(e);return e;
 }
 public JobMatchReport latest(Long jobId,Long resumeId){jobService.get(jobId);resumeService.get(resumeId);return mapper.selectOne(Wrappers.<JobMatchReport>lambdaQuery().eq(JobMatchReport::getUserId,currentUser.getCurrentUserId()).eq(JobMatchReport::getJobDescriptionId,jobId).eq(JobMatchReport::getResumeId,resumeId).orderByDesc(JobMatchReport::getId).last("LIMIT 1"));}
}
