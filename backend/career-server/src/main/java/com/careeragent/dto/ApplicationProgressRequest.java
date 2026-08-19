package com.careeragent.dto;
import com.careeragent.domain.enums.ApplicationInterviewStage;
import com.careeragent.domain.enums.ApplicationStatus;
import jakarta.validation.constraints.*;
public record ApplicationProgressRequest(@NotNull ApplicationStatus status,ApplicationInterviewStage interviewStage,
        @Size(max=500) String nextAction,@Size(max=10000) String remark){}
