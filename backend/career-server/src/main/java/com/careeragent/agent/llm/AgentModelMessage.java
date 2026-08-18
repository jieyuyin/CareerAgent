package com.careeragent.agent.llm;

import java.util.Map;

public record AgentModelMessage(String role, String content, Map<String, Object> metadata) {}
