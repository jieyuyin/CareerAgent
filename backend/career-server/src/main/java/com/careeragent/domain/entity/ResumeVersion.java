package com.careeragent.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.ResumeVersionStatus;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import java.time.OffsetDateTime;
import java.util.Map;
import lombok.Data;

@Data
@TableName(value = "resume_version", autoResultMap = true)
public class ResumeVersion {
    @TableId(type = IdType.AUTO) private Long id;
    private Long userId;
    private Long resumeId;
    private Long jobDescriptionId;
    private String versionName;
    private String targetCompany;
    private String targetJobName;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private Map<String, Object> snapshotData;
    private String changeSummary;
    private ResumeVersionStatus status;
    @TableField(fill = FieldFill.INSERT) private OffsetDateTime createdAt;
    @TableField(fill = FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
