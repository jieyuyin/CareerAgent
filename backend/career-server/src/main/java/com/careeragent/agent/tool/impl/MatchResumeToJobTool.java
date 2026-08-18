package com.careeragent.agent.tool.impl;
import com.careeragent.agent.tool.*;
import com.careeragent.service.JobMatchReportService;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
@Component @RequiredArgsConstructor
public class MatchResumeToJobTool implements AgentTool {
 private final JobMatchReportService service;
 public String getName(){return "match_resume_to_job";} public String getDescription(){return "匹配岗位与基础简历并保存带证据的报告";}
 public Map<String,Object> getInputSchema(){return BaseSchemas.object(Map.of("jobDescriptionId",BaseSchemas.integer("岗位ID"),"resumeId",BaseSchemas.integer("简历ID")),List.of("jobDescriptionId","resumeId"));}
 public ToolResult execute(ToolContext c,Map<String,Object>a){return ToolResult.success(service.generate(((Number)a.get("jobDescriptionId")).longValue(),((Number)a.get("resumeId")).longValue()));}
}
