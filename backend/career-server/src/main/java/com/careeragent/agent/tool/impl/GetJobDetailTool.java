package com.careeragent.agent.tool.impl;
import com.careeragent.agent.tool.*;
import com.careeragent.service.JobDescriptionService;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
@Component @RequiredArgsConstructor
public class GetJobDetailTool implements AgentTool {
 private final JobDescriptionService service;
 public String getName(){return "get_job_detail";} public String getDescription(){return "获取当前用户的一条岗位详情";}
 public Map<String,Object> getInputSchema(){return BaseSchemas.object(Map.of("jobId",BaseSchemas.integer("岗位ID")),List.of("jobId"));}
 public ToolResult execute(ToolContext c,Map<String,Object>a){return ToolResult.success(service.get(((Number)a.get("jobId")).longValue()));}
}
