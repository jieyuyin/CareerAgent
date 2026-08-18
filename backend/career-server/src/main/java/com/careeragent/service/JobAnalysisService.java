package com.careeragent.service;
import com.careeragent.agent.llm.LLMAdapter;
import com.careeragent.agent.prompt.JobAnalysisPrompt;
import com.careeragent.agent.structured.JobAnalysisOutput;
import com.careeragent.vo.JobDescriptionVO;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
@Service @RequiredArgsConstructor
public class JobAnalysisService {
 private final JobDescriptionService jobService; private final LLMAdapter llm;
 public JobDescriptionVO analyze(Long id){var job=jobService.get(id);var output=llm.structuredOutput(JobAnalysisPrompt.TEXT,Map.of("jobName",job.getJobName(),"rawContent",job.getRawContent()),JobAnalysisOutput.class);return jobService.applyAnalysis(id,output);}
}
