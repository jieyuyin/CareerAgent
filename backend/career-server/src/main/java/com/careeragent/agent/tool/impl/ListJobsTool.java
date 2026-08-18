package com.careeragent.agent.tool.impl;
import com.careeragent.agent.tool.*;
import com.careeragent.service.JobDescriptionService;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
@Component @RequiredArgsConstructor
public class ListJobsTool implements AgentTool {
 private final JobDescriptionService service;
 public String getName(){return "list_jobs";} public String getDescription(){return "查询当前用户的岗位，最多返回20条";}
 public Map<String,Object> getInputSchema(){return BaseSchemas.object(Map.of("company",BaseSchemas.string("公司"),"city",BaseSchemas.string("城市"),"keyword",BaseSchemas.string("公司或岗位关键词")),List.of());}
 public ToolResult execute(ToolContext c,Map<String,Object>a){return ToolResult.success(service.list(text(a,"company"),text(a,"city"),null,null,text(a,"keyword"),1,20));}
 private String text(Map<String,Object>a,String k){var v=a.get(k);return v==null?null:v.toString();}
}
