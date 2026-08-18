package com.careeragent.agent.tool.impl;
import com.careeragent.agent.tool.*;
import com.careeragent.service.JobAnalysisService;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
@Component @RequiredArgsConstructor
public class AnalyzeJobDescriptionTool implements AgentTool {
 private final JobAnalysisService service;
 public String getName(){return "analyze_job_description";} public String getDescription(){return "分析原始JD并更新岗位结构化字段";}
 public Map<String,Object> getInputSchema(){return BaseSchemas.object(Map.of("jobDescriptionId",BaseSchemas.integer("岗位ID")),List.of("jobDescriptionId"));}
 public ToolResult execute(ToolContext c,Map<String,Object>a){return ToolResult.success(service.analyze(((Number)a.get("jobDescriptionId")).longValue()));}
}
