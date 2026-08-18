package com.careeragent.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.*;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import java.time.OffsetDateTime;
import java.util.*;
import lombok.Data;

@Data
@TableName(value = "job_description", autoResultMap = true)
public class JobDescription {
    @TableId(type = IdType.AUTO) private Long id;
    private Long userId;
    private String company;
    private String jobName;
    private String department;
    private String city;
    private RecruitmentType recruitmentType;
    private JobSource source;
    private String sourceUrl;
    private Long sourceConfigId;
    private String sourceJobId;
    private String rawContent;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private List<String> responsibilities;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private List<String> requiredSkills;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private List<String> preferredSkills;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private List<String> keywords;
    private String educationRequirement;
    private String experienceRequirement;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private List<String> jobFocus;
    @TableField(typeHandler = PostgresJsonbTypeHandler.class) private List<String> interviewTopics;
    private JobStatus status;
    private OffsetDateTime publishedAt;
    private OffsetDateTime lastVerifiedAt;
    @TableField(fill = FieldFill.INSERT) private OffsetDateTime createdAt;
    @TableField(fill = FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
