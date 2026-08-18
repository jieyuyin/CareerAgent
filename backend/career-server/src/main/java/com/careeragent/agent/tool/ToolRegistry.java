package com.careeragent.agent.tool;
import com.careeragent.exception.ToolNotFoundException;
import java.util.*;
import java.util.function.Function;
import java.util.stream.Collectors;
import org.springframework.stereotype.Component;
@Component
public class ToolRegistry {
 private final Map<String,AgentTool> tools;
 public ToolRegistry(List<AgentTool> toolBeans){
  this.tools=toolBeans.stream().collect(Collectors.toUnmodifiableMap(AgentTool::getName,Function.identity()));
 }
 public AgentTool getTool(String name){var tool=tools.get(name);if(tool==null)throw new ToolNotFoundException(name);return tool;}
 public Collection<AgentTool> getAllTools(){return tools.values();}
 public List<Map<String,Object>> getToolDefinitions(){return tools.values().stream().map(t->Map.<String,Object>of("name",t.getName(),"description",t.getDescription(),"parameters",t.getInputSchema())).toList();}
}
