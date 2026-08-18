package com.careeragent.agent.tool;
import java.util.*;
public final class BaseSchemas {
 private BaseSchemas(){}
 public static Map<String,Object> object(Map<String,Object> properties,List<String> required){return Map.of("type","object","properties",properties,"required",required,"additionalProperties",false);}
 public static Map<String,Object> string(String description){return Map.of("type","string","description",description);}
 public static Map<String,Object> integer(String description){return Map.of("type","integer","description",description);}
}
