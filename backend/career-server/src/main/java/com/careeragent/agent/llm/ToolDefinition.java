package com.careeragent.agent.llm;

import java.util.Map;

public record ToolDefinition(String name, String description, Map<String, Object> inputSchema) {}
