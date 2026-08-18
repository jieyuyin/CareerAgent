package com.careeragent.agent.tool.impl;
import com.careeragent.agent.tool.*;
import com.careeragent.service.ResumeService;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
@Component @RequiredArgsConstructor
public class GetResumeDetailTool implements AgentTool {
 private final ResumeService service;
 public String getName(){return "get_resume_detail";} public String getDescription(){return "获取当前用户的一份基础简历详情";}
 public Map<String,Object> getInputSchema(){return BaseSchemas.object(Map.of("resumeId",BaseSchemas.integer("简历ID")),List.of("resumeId"));}
 public ToolResult execute(ToolContext c,Map<String,Object>a){return ToolResult.success(service.get(((Number)a.get("resumeId")).longValue()));}
}
