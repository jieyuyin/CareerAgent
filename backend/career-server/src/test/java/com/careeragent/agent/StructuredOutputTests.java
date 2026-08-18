package com.careeragent.agent;
import static org.assertj.core.api.Assertions.*;
import com.careeragent.agent.llm.*;
import com.careeragent.agent.structured.*;
import com.careeragent.domain.entity.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.*;
import org.junit.jupiter.api.Test;
class StructuredOutputTests {
 @Test void invalidJsonRetriesAtMostUntilValid(){
  class RetryAdapter extends AbstractJsonStructuredOutputAdapter{
   int calls; RetryAdapter(){super(new ObjectMapper());}
   public AgentModelResponse chat(AgentModelRequest r){return AgentModelResponse.message("ok");}
   protected String generateStructuredJson(String p,Object i,Class<?> t,int a){calls++;return a<3?"not-json":"{\"jobName\":\"Java\",\"responsibilities\":[],\"requiredSkills\":[],\"preferredSkills\":[],\"keywords\":[],\"educationRequirement\":\"\",\"experienceRequirement\":\"\",\"jobFocus\":[],\"interviewTopics\":[]}";}
  }
  var adapter=new RetryAdapter();var result=adapter.structuredOutput("prompt",Map.of(),JobAnalysisOutput.class);
  assertThat(result.jobName()).isEqualTo("Java");assertThat(adapter.calls).isEqualTo(3);
 }
 @Test void mockMatchContainsEvidenceAndDoesNotInventMissingSkill(){
  var mapper=new ObjectMapper().findAndRegisterModules();var adapter=new MockLLMAdapter(mapper);
  var job=new JobDescription();job.setRequiredSkills(List.of("Java","Agent"));var resume=new Resume();resume.setSkills(List.of("Java"));
  var out=adapter.structuredOutput("prompt",Map.of("job",job,"resume",resume),ResumeMatchOutput.class);
  assertThat(out.evidence()).hasSize(2);assertThat(out.missingSkills()).containsExactly("Agent");assertThat(out.matchedSkills()).doesNotContain("Agent");
 }
 @Test void orchestratorHasFiniteToolLimit(){assertThat(AgentOrchestrator.MAX_TOOL_STEPS).isEqualTo(8);}
}
