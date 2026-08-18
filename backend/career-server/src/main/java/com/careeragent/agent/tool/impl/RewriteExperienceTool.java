package com.careeragent.agent.tool.impl;
import com.careeragent.agent.tool.*;
import com.careeragent.domain.enums.RewriteItemType;
import com.careeragent.service.RewriteSuggestionService;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
@Component @RequiredArgsConstructor
public class RewriteExperienceTool implements AgentTool {
 private final RewriteSuggestionService service;
 public String getName(){return "rewrite_experience";} public String getDescription(){return "为一条经历或项目生成可审核改写建议，不修改简历";}
 public Map<String,Object> getInputSchema(){return BaseSchemas.object(Map.of("jobDescriptionId",BaseSchemas.integer("岗位ID"),"resumeId",BaseSchemas.integer("简历ID"),"itemType",BaseSchemas.string("EXPERIENCE或PROJECT"),"itemId",BaseSchemas.string("条目ID")),List.of("jobDescriptionId","resumeId","itemType","itemId"));}
 public ToolResult execute(ToolContext c,Map<String,Object>a){return ToolResult.success(service.generate(((Number)a.get("jobDescriptionId")).longValue(),((Number)a.get("resumeId")).longValue(),RewriteItemType.valueOf(a.get("itemType").toString()),a.get("itemId").toString()));}
}
