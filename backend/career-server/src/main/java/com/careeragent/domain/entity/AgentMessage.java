package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.MessageRole;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import java.time.OffsetDateTime;
import java.util.Map;
import lombok.Data;
@Data @TableName(value="agent_message", autoResultMap=true)
public class AgentMessage {
 @TableId(type=IdType.AUTO) private Long id;
 private Long conversationId; private MessageRole role; private String content;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private Map<String,Object> metadata;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
}
