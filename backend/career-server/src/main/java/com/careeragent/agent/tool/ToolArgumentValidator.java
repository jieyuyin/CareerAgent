package com.careeragent.agent.tool;
import com.careeragent.exception.InvalidToolArgumentsException;
import java.util.*;
import org.springframework.stereotype.Component;
@Component
public class ToolArgumentValidator {
 @SuppressWarnings("unchecked")
 public void validate(AgentTool tool,Map<String,Object> arguments){
  if(arguments==null)throw new InvalidToolArgumentsException("arguments must be an object");
  var schema=tool.getInputSchema();
  var required=(List<String>)schema.getOrDefault("required",List.of());
  for(var key:required)if(!arguments.containsKey(key)||arguments.get(key)==null)throw new InvalidToolArgumentsException("missing required field "+key);
  var properties=(Map<String,Map<String,Object>>)schema.getOrDefault("properties",Map.of());
  for(var entry:arguments.entrySet()){
   var property=properties.get(entry.getKey()); if(property==null)throw new InvalidToolArgumentsException("unknown field "+entry.getKey());
   var type=property.get("type"); var value=entry.getValue(); if(value==null)continue;
   if("integer".equals(type)&&!(value instanceof Number))throw new InvalidToolArgumentsException(entry.getKey()+" must be integer");
   if("string".equals(type)&&!(value instanceof String))throw new InvalidToolArgumentsException(entry.getKey()+" must be string");
  }
 }
}
