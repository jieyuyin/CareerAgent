package com.careeragent.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.*;
import java.time.OffsetDateTime;
import lombok.Data;

@Data
@TableName("job_application")
public class JobApplication {
    @TableId(type = IdType.AUTO) private Long id;
    private Long userId;
    private Long jobDescriptionId;
    private Long resumeVersionId;
    private String company;
    private String jobName;
    private ApplicationChannel channel;
    private ApplicationStatus status;
    private ApplicationInterviewStage interviewStage;
    private OffsetDateTime appliedAt;
    private String nextAction;
    private OffsetDateTime nextActionAt;
    private String remark;
    @TableField(fill = FieldFill.INSERT) private OffsetDateTime createdAt;
    @TableField(fill = FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
