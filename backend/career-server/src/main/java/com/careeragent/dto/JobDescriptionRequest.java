package com.careeragent.dto;

import com.careeragent.domain.enums.*;
import jakarta.validation.constraints.*;
import java.time.OffsetDateTime;
import java.util.List;
import lombok.Data;

@Data
public class JobDescriptionRequest {
    @NotBlank @Size(max=200) private String company;
    @NotBlank @Size(max=200) private String jobName;
    @Size(max=200) private String department;
    @Size(max=100) private String city;
    @NotNull private RecruitmentType recruitmentType;
    @NotNull private JobSource source;
    @Size(max=2000) private String sourceUrl;
    @NotBlank private String rawContent;
    private List<String> responsibilities;
    private List<String> requiredSkills;
    private List<String> preferredSkills;
    private List<String> keywords;
    @Size(max=500) private String educationRequirement;
    @Size(max=500) private String experienceRequirement;
    private List<String> jobFocus;
    private List<String> interviewTopics;
    @NotNull private JobStatus status;
    private OffsetDateTime publishedAt;
    private OffsetDateTime lastVerifiedAt;
}
