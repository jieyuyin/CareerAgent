package com.careeragent.agent.tool.impl;

import com.careeragent.agent.tool.AgentTool;
import com.careeragent.agent.tool.BaseSchemas;
import com.careeragent.agent.tool.ToolContext;
import com.careeragent.agent.tool.ToolResult;
import com.careeragent.service.ResumeIntelligenceService;
import java.util.List;
import java.util.Map;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class ParseResumeTool implements AgentTool {
    private final ResumeIntelligenceService service;
    public String getName() { return "parse_resume"; }
    public String getDescription() { return "将简历原文提取为待用户确认的结构化 Resume，不写数据库"; }
    public Map<String, Object> getInputSchema() { return BaseSchemas.object(Map.of("text", BaseSchemas.string("简历原文")), List.of("text")); }
    public ToolResult execute(ToolContext context, Map<String, Object> arguments) { return ToolResult.success(service.parse(arguments.get("text").toString())); }
}
