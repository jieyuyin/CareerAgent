package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import java.time.OffsetDateTime;
import lombok.Data;
@Data @TableName("interview_report")
public class InterviewReport {
 @TableId(type=IdType.AUTO) private Long id; private Long sessionId; private Integer score; private String strength; private String weakness; private String suggestion;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
}
