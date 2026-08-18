package com.careeragent.vo;

import com.careeragent.domain.entity.PendingAction;
import java.time.OffsetDateTime;

public record PendingActionVO(Long id, Long toolExecutionId, String actionType, String toolName,
                              String summary, String status, OffsetDateTime expiresAt) {
    public static PendingActionVO from(PendingAction action) {
        return new PendingActionVO(action.getId(), action.getToolExecutionId(), action.getActionType().name(),
                action.getToolName(), action.getSummary(), action.getStatus().name(), action.getExpiresAt());
    }
}
