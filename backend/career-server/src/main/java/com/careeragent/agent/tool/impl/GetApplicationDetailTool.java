package com.careeragent.agent.tool.impl;
import com.careeragent.agent.tool.*;
import com.careeragent.service.ApplicationService;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
@Component @RequiredArgsConstructor
public class GetApplicationDetailTool implements AgentTool {
 private final ApplicationService service;
 public String getName(){return "get_application_detail";} public String getDescription(){return "获取当前用户的一条投递详情和状态历史";}
 public Map<String,Object> getInputSchema(){return BaseSchemas.object(Map.of("applicationId",BaseSchemas.integer("投递ID")),List.of("applicationId"));}
 public ToolResult execute(ToolContext c,Map<String,Object>a){return ToolResult.success(service.get(((Number)a.get("applicationId")).longValue()));}
}
