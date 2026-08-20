package com.careeragent.agent.llm;
import com.careeragent.exception.LLMProviderException;
import com.careeragent.service.AiConfigService.RuntimeAiConfig;
import com.fasterxml.jackson.databind.*;
import java.net.URI;
import java.net.http.*;
import java.time.Duration;
import java.util.*;
import java.util.function.Consumer;
public class OpenAILLMAdapter extends AbstractJsonStructuredOutputAdapter {
 private final RuntimeAiConfig config; private final HttpClient client;
 public OpenAILLMAdapter(ObjectMapper mapper,RuntimeAiConfig config){super(mapper);this.config=config;this.client=HttpClient.newBuilder().connectTimeout(Duration.ofSeconds(5)).build();}
 @Override public AgentModelResponse chat(AgentModelRequest request){
  var messages=request.messages().stream().map(m->Map.<String,Object>of("role",role(m.role()),"content",m.content())).toList();
  var body=new LinkedHashMap<String,Object>();body.put("model",config.model());body.put("messages",messages);
  if(!request.tools().isEmpty())body.put("tools",request.tools().stream().map(t->Map.of("type","function","function",Map.of("name",t.name(),"description",t.description(),"parameters",t.inputSchema()))).toList());
  var root=call(body);var message=root.path("choices").path(0).path("message");var calls=message.path("tool_calls");
  if(calls.isArray()&&calls.size()>0){var result=new ArrayList<ToolCall>();for(var c:calls){try{result.add(new ToolCall(c.path("id").asText(UUID.randomUUID().toString()),c.path("function").path("name").asText(),objectMapper.readValue(c.path("function").path("arguments").asText("{}"),Map.class)));}catch(Exception e){throw new LLMProviderException("Invalid tool arguments from provider: "+e.getMessage());}}return new AgentModelResponse(AgentModelResponse.Type.TOOL_CALL,null,result);}
  return AgentModelResponse.message(message.path("content").asText(""));
 }
 @Override public AgentModelResponse chatStream(AgentModelRequest request,Consumer<String> onDelta){
  var messages=request.messages().stream().map(m->Map.<String,Object>of("role",role(m.role()),"content",m.content())).toList();var body=new LinkedHashMap<String,Object>();body.put("model",config.model());body.put("messages",messages);
  if(!request.tools().isEmpty())body.put("tools",request.tools().stream().map(t->Map.of("type","function","function",Map.of("name",t.name(),"description",t.description(),"parameters",t.inputSchema()))).toList());return callStream(body,onDelta);
 }
 @Override public String textStream(String prompt,Object input,String modelOverride,Consumer<String> onDelta){
  try{var body=new LinkedHashMap<String,Object>();body.put("model",config.model());body.put("max_tokens",800);body.put("messages",List.of(Map.of("role","system","content",prompt+"\n只输出面试官下一句回复正文，不要输出 JSON、字段名或 Markdown 代码块。"),Map.of("role","user","content",objectMapper.writeValueAsString(input))));var response=callStream(body,onDelta);return Objects.toString(response.content(),"");}catch(Exception e){if(e instanceof RuntimeException runtime)throw runtime;throw new LLMProviderException(e.getMessage());}
 }
 @Override protected String generateStructuredJson(String prompt,Object input,Class<?> responseType,int attempt)throws Exception{
  var fields=responseType.isRecord()?Arrays.stream(responseType.getRecordComponents()).map(c->c.getName()).toList():List.of();
  var body=new LinkedHashMap<String,Object>();body.put("model",config.model());body.put("max_tokens",500);body.put("messages",List.of(Map.of("role","system","content",prompt+"\nOnly return a JSON object. Required top-level fields: "+fields),Map.of("role","user","content",objectMapper.writeValueAsString(input))));body.put("response_format",Map.of("type","json_object"));
  return call(body).path("choices").path(0).path("message").path("content").asText();
 }
 public void testConnection(){call(Map.of("model",config.model(),"messages",List.of(Map.of("role","user","content","Reply with OK only.")),"max_tokens",8));}
 private JsonNode call(Object body){try{var builder=HttpRequest.newBuilder(URI.create(endpoint())).timeout(Duration.ofSeconds(18)).header("Content-Type","application/json");if(config.apiKey()!=null&&!config.apiKey().isBlank())builder.header("Authorization","Bearer "+config.apiKey());var response=client.send(builder.POST(HttpRequest.BodyPublishers.ofString(objectMapper.writeValueAsString(body))).build(),HttpResponse.BodyHandlers.ofString());if(response.statusCode()<200||response.statusCode()>=300)throw new LLMProviderException("Provider returned HTTP "+response.statusCode()+": "+truncate(response.body()));return objectMapper.readTree(response.body());}catch(LLMProviderException e){throw e;}catch(Exception e){throw new LLMProviderException("Provider request failed: "+e.getMessage());}}
 private AgentModelResponse callStream(Map<String,Object> body,Consumer<String> onDelta){try{body.put("stream",true);var builder=HttpRequest.newBuilder(URI.create(endpoint())).timeout(Duration.ofSeconds(18)).header("Content-Type","application/json");if(config.apiKey()!=null&&!config.apiKey().isBlank())builder.header("Authorization","Bearer "+config.apiKey());var response=client.send(builder.POST(HttpRequest.BodyPublishers.ofString(objectMapper.writeValueAsString(body))).build(),HttpResponse.BodyHandlers.ofLines());if(response.statusCode()<200||response.statusCode()>=300)throw new LLMProviderException("Provider returned HTTP "+response.statusCode());var content=new StringBuilder();var filter=new ReasoningTagFilter(text->{content.append(text);onDelta.accept(text);});var calls=new TreeMap<Integer,StreamToolCall>();try(var lines=response.body()){var iterator=lines.iterator();while(iterator.hasNext()){var line=iterator.next();if(!line.startsWith("data:"))continue;var data=line.substring(5).trim();if(data.isBlank()||"[DONE]".equals(data))continue;var delta=objectMapper.readTree(data).path("choices").path(0).path("delta");var text=delta.path("content").asText("");if(!text.isEmpty())filter.accept(text);var toolDeltas=delta.path("tool_calls");if(toolDeltas.isArray())for(var item:toolDeltas){var index=item.path("index").asInt();var call=calls.computeIfAbsent(index,key->new StreamToolCall());if(item.hasNonNull("id"))call.id.append(item.path("id").asText());var function=item.path("function");if(function.hasNonNull("name"))call.name.append(function.path("name").asText());if(function.hasNonNull("arguments"))call.arguments.append(function.path("arguments").asText());}}}filter.finish();if(!calls.isEmpty()){var result=new ArrayList<ToolCall>();for(var call:calls.values())result.add(new ToolCall(call.id.isEmpty()?UUID.randomUUID().toString():call.id.toString(),call.name.toString(),objectMapper.readValue(call.arguments.isEmpty()?"{}":call.arguments.toString(),Map.class)));return new AgentModelResponse(AgentModelResponse.Type.TOOL_CALL,null,result);}return AgentModelResponse.message(content.toString());}catch(LLMProviderException e){throw e;}catch(InterruptedException e){Thread.currentThread().interrupt();throw new LLMProviderException("Provider request interrupted");}catch(Exception e){throw new LLMProviderException("Provider stream failed: "+e.getMessage());}}
 private static final class StreamToolCall{private final StringBuilder id=new StringBuilder(),name=new StringBuilder(),arguments=new StringBuilder();}
 private String endpoint(){var base=config.baseUrl()==null||config.baseUrl().isBlank()?"https://api.openai.com/v1":config.baseUrl();return base.endsWith("/chat/completions")?base:base+"/chat/completions";}
 private String role(String role){return "ASSISTANT".equals(role)?"assistant":"user";}
 private String truncate(String s){return s==null?"":s.substring(0,Math.min(300,s.length()));}
}
