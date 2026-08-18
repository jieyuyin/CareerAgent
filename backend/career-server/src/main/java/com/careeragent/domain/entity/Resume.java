package com.careeragent.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import com.careeragent.domain.enums.ResumeSource;
import com.careeragent.domain.enums.ResumeStatus;
import java.time.OffsetDateTime;
import java.util.*;
import lombok.Data;

@Data
@TableName(value = "resume", autoResultMap = true)
public class Resume {
    @TableId(type = IdType.AUTO) private Long id;
    private Long userId;
    private String name;
    private String fullName;
    private String phone;
    private String email;
    private String location;
    private String targetRole;
    private ResumeSource source;
    private ResumeStatus status;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private Map<String, Object> basicInfo;
    private String fileUrl;
    private String fileName;
    private String fileType;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private List<Map<String, Object>> education;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private List<Map<String, Object>> experiences;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private List<Map<String, Object>> projects;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private List<String> skills;
    private Boolean isDefault;
    @TableField(fill = FieldFill.INSERT) private OffsetDateTime createdAt;
    @TableField(fill = FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
