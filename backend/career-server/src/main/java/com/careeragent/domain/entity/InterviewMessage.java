package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import java.time.OffsetDateTime;
import lombok.Data;
@Data @TableName("interview_message")
public class InterviewMessage {
 @TableId(type=IdType.AUTO) private Long id; private Long sessionId; private String role; private String content; private Integer turnNumber; private String topic; private Integer questionLevel; private String messageStatus;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
}
