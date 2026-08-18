package com.careeragent.agent.llm;

import java.util.List;

public record AgentModelRequest(List<AgentModelMessage> messages, List<ToolDefinition> tools) {}
