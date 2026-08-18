package com.careeragent.vo;

public record AgentChatResponse(Long conversationId, String status, String message, PendingActionVO pendingAction) {}
