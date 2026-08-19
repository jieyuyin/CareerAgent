package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.*;
import java.time.OffsetDateTime;
import lombok.Data;
@Data @TableName("interview_session")
public class InterviewSession {
 @TableId(type=IdType.AUTO) private Long id; private Long userId; private Long applicationId; private Long jobId;
 private InterviewStage stage; private InterviewMode mode; private Integer duration; private String model; private InterviewStatus status; private Integer score;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
 @TableField(fill=FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
