package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.ToolExecutionStatus;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import java.time.OffsetDateTime;
import java.util.Map;
import lombok.Data;
@Data @TableName(value="tool_execution", autoResultMap=true)
public class ToolExecution {
 @TableId(type=IdType.AUTO) private Long id;
 private Long conversationId; private String toolCallId; private String toolName;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private Map<String,Object> inputData;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private Map<String,Object> outputData;
 private ToolExecutionStatus status; private String errorMessage;
 private OffsetDateTime startedAt; private OffsetDateTime finishedAt; private Long durationMs;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
}
