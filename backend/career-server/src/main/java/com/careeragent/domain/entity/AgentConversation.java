package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.ConversationStatus;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import java.time.OffsetDateTime;
import java.util.Map;
import lombok.Data;
@Data @TableName(value="agent_conversation", autoResultMap=true)
public class AgentConversation {
 @TableId(type=IdType.AUTO) private Long id;
 private Long userId; private String title; private ConversationStatus status;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private Map<String,Object> contextData;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
 @TableField(fill=FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
