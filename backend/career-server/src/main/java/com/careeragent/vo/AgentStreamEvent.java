package com.careeragent.vo;

import java.time.OffsetDateTime;

public record AgentStreamEvent(String type, Long conversationId, Long toolExecutionId,
                               Long pendingActionId, String toolName, Object data, OffsetDateTime timestamp) {
    public static AgentStreamEvent of(String type, Long conversationId, Long executionId,
                                      Long actionId, String toolName, Object data) {
        return new AgentStreamEvent(type, conversationId, executionId, actionId, toolName, data, OffsetDateTime.now());
    }
}
