package com.careeragent.agent.llm;
import com.careeragent.dto.AiConfigRequest;
import com.careeragent.exception.BusinessException;
import com.careeragent.service.AiConfigService;
import com.careeragent.service.AiConfigService.RuntimeAiConfig;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.Map;
import java.util.function.Consumer;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
@Component @RequiredArgsConstructor
public class RoutingLLMAdapter implements LLMAdapter {
 private final ObjectMapper mapper; private final AiConfigService configService;
 @Override public AgentModelResponse chat(AgentModelRequest request){return current().chat(request);}
 @Override public AgentModelResponse chatStream(AgentModelRequest request,Consumer<String> onDelta){return current().chatStream(request,onDelta);}
 @Override public <T>T structuredOutput(String prompt,Object input,Class<T> type){return current().structuredOutput(prompt,input,type);}
 @Override public <T>T structuredOutput(String prompt,Object input,Class<T> type,String modelOverride){var c=configService.runtime();if(modelOverride==null||modelOverride.isBlank()||modelOverride.equals(c.model()))return current().structuredOutput(prompt,input,type);var overridden=new RuntimeAiConfig(c.provider(),modelOverride.trim(),c.baseUrl(),c.apiKey());var adapter="mock".equals(c.provider())?new MockLLMAdapter(mapper):new OpenAILLMAdapter(mapper,overridden);return adapter.structuredOutput(prompt,input,type);}
 @Override public String textStream(String prompt,Object input,String modelOverride,Consumer<String> onDelta){var c=configService.runtime();var selected=modelOverride==null||modelOverride.isBlank()?c:new RuntimeAiConfig(c.provider(),modelOverride.trim(),c.baseUrl(),c.apiKey());var adapter="mock".equals(c.provider())?new MockLLMAdapter(mapper):new OpenAILLMAdapter(mapper,selected);return adapter.textStream(prompt,input,modelOverride,onDelta);}
 public Map<String,Object> test(AiConfigRequest request){var started=System.currentTimeMillis();if("mock".equals(request.provider()))return Map.of("success",true,"message","MockLLM 连接正常","latencyMs",0);
  if(request.baseUrl()==null||request.baseUrl().isBlank())throw new BusinessException(40020,"OpenAI-compatible Base URL is required");
  var saved=configService.runtime();var key=request.apiKey()==null||request.apiKey().isBlank()?saved.apiKey():request.apiKey();new OpenAILLMAdapter(mapper,new RuntimeAiConfig(request.provider(),request.model(),request.baseUrl().replaceAll("/+$",""),key)).testConnection();return Map.of("success",true,"message","连接成功","latencyMs",System.currentTimeMillis()-started);}
 private LLMAdapter current(){var c=configService.runtime();return "mock".equals(c.provider())?new MockLLMAdapter(mapper):new OpenAILLMAdapter(mapper,c);}
}
