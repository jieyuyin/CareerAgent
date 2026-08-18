package com.careeragent.agent.tool.impl;
import com.careeragent.agent.tool.*;
import com.careeragent.service.ResumeService;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
@Component @RequiredArgsConstructor
public class ListResumesTool implements AgentTool {
 private final ResumeService service;
 public String getName(){return "list_resumes";} public String getDescription(){return "查询当前用户的基础简历";}
 public Map<String,Object> getInputSchema(){return BaseSchemas.object(Map.of(),List.of());}
 public ToolResult execute(ToolContext c,Map<String,Object>a){return ToolResult.success(service.list());}
}
