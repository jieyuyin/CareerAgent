package com.careeragent.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Positive;

public record AgentChatRequest(@Positive Long conversationId, @NotBlank String message) {}
