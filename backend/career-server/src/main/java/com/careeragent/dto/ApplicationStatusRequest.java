package com.careeragent.dto;
import com.careeragent.domain.enums.ApplicationStatus;
import jakarta.validation.constraints.NotNull;
import lombok.Data;
@Data public class ApplicationStatusRequest { @NotNull private ApplicationStatus status; private String remark; }
