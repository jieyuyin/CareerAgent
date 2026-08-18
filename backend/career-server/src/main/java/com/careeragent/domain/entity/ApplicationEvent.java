package com.careeragent.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.*;
import java.time.OffsetDateTime;
import lombok.Data;

@Data
@TableName("application_event")
public class ApplicationEvent {
    @TableId(type = IdType.AUTO) private Long id;
    private Long applicationId;
    private ApplicationStatus fromStatus;
    private ApplicationStatus toStatus;
    private ApplicationEventType eventType;
    private String remark;
    @TableField(fill = FieldFill.INSERT) private OffsetDateTime createdAt;
}
