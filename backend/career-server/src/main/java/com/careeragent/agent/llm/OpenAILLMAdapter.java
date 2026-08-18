package com.careeragent.agent.llm;
import com.careeragent.exception.LLMProviderException;
import com.careeragent.service.AiConfigService.RuntimeAiConfig;
import com.fasterxml.jackson.databind.*;
import java.net.URI;
import java.net.http.*;
import java.time.Duration;
import java.util.*;
public class OpenAILLMAdapter extends AbstractJsonStructuredOutputAdapter {
 private final RuntimeAiConfig config; private final HttpClient client;
 public OpenAILLMAdapter(ObjectMapper mapper,RuntimeAiConfig config){super(mapper);this.config=config;this.client=HttpClient.newBuilder().connectTimeout(Duration.ofSeconds(10)).build();}
 @Override public AgentModelResponse chat(AgentModelRequest request){
  var messages=request.messages().stream().map(m->Map.<String,Object>of("role",role(m.role()),"content",m.content())).toList();
  var body=new LinkedHashMap<String,Object>();body.put("model",config.model());body.put("messages",messages);
  if(!request.tools().isEmpty())body.put("tools",request.tools().stream().map(t->Map.of("type","function","function",Map.of("name",t.name(),"description",t.description(),"parameters",t.inputSchema()))).toList());
  var root=call(body);var message=root.path("choices").path(0).path("message");var calls=message.path("tool_calls");
  if(calls.isArray()&&calls.size()>0){var result=new ArrayList<ToolCall>();for(var c:calls){try{result.add(new ToolCall(c.path("id").asText(UUID.randomUUID().toString()),c.path("function").path("name").asText(),objectMapper.readValue(c.path("function").path("arguments").asText("{}"),Map.class)));}catch(Exception e){throw new LLMProviderException("Invalid tool arguments from provider: "+e.getMessage());}}return new AgentModelResponse(AgentModelResponse.Type.TOOL_CALL,null,result);}
  return AgentModelResponse.message(message.path("content").asText(""));
 }
 @Override protected String generateStructuredJson(String prompt,Object input,Class<?> responseType,int attempt)throws Exception{
  var fields=responseType.isRecord()?Arrays.stream(responseType.getRecordComponents()).map(c->c.getName()).toList():List.of();
  var body=new LinkedHashMap<String,Object>();body.put("model",config.model());body.put("messages",List.of(Map.of("role","system","content",prompt+"\nOnly return a JSON object. Required top-level fields: "+fields),Map.of("role","user","content",objectMapper.writeValueAsString(input))));body.put("response_format",Map.of("type","json_object"));
  return call(body).path("choices").path(0).path("message").path("content").asText();
 }
 public void testConnection(){call(Map.of("model",config.model(),"messages",List.of(Map.of("role","user","content","Reply with OK only.")),"max_tokens",8));}
 private JsonNode call(Object body){try{var builder=HttpRequest.newBuilder(URI.create(endpoint())).timeout(Duration.ofSeconds(45)).header("Content-Type","application/json");if(config.apiKey()!=null&&!config.apiKey().isBlank())builder.header("Authorization","Bearer "+config.apiKey());var response=client.send(builder.POST(HttpRequest.BodyPublishers.ofString(objectMapper.writeValueAsString(body))).build(),HttpResponse.BodyHandlers.ofString());if(response.statusCode()<200||response.statusCode()>=300)throw new LLMProviderException("Provider returned HTTP "+response.statusCode()+": "+truncate(response.body()));return objectMapper.readTree(response.body());}catch(LLMProviderException e){throw e;}catch(Exception e){throw new LLMProviderException("Provider request failed: "+e.getMessage());}}
 private String endpoint(){var base=config.baseUrl()==null||config.baseUrl().isBlank()?"https://api.openai.com/v1":config.baseUrl();return base.endsWith("/chat/completions")?base:base+"/chat/completions";}
 private String role(String role){return "ASSISTANT".equals(role)?"assistant":"user";}
 private String truncate(String s){return s==null?"":s.substring(0,Math.min(300,s.length()));}
}
