package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.*;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import java.time.OffsetDateTime;
import java.util.Map;
import lombok.Data;
@Data @TableName(value="pending_action", autoResultMap=true)
public class PendingAction {
 @TableId(type=IdType.AUTO) private Long id;
 private Long conversationId; private Long toolExecutionId; private PendingActionType actionType;
 private String toolName;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private Map<String,Object> payload;
 private String summary; private PendingActionStatus status; private OffsetDateTime expiresAt;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
 @TableField(fill=FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
