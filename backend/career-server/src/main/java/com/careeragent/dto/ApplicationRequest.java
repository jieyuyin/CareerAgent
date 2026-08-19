package com.careeragent.dto;

import com.careeragent.domain.enums.*;
import jakarta.validation.constraints.*;
import java.time.OffsetDateTime;
import lombok.Data;

@Data
public class ApplicationRequest {
    @NotNull private Long jobDescriptionId;
    @NotNull private Long resumeVersionId;
    @NotBlank @Size(max=200) private String company;
    @NotBlank @Size(max=200) private String jobName;
    @NotNull private ApplicationChannel channel;
    @NotNull private ApplicationStatus status;
    private ApplicationInterviewStage interviewStage;
    private OffsetDateTime appliedAt;
    @Size(max=500) private String nextAction;
    private OffsetDateTime nextActionAt;
    private String remark;
}
