package com.careeragent.agent.llm;

import java.util.List;

public record AgentModelResponse(Type type, String content, List<ToolCall> toolCalls) {
    public enum Type { MESSAGE, TOOL_CALL }

    public static AgentModelResponse message(String content) {
        return new AgentModelResponse(Type.MESSAGE, content, List.of());
    }

    public static AgentModelResponse toolCall(ToolCall toolCall) {
        return new AgentModelResponse(Type.TOOL_CALL, null, List.of(toolCall));
    }
}
