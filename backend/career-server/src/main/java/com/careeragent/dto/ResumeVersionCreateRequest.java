package com.careeragent.dto;

import com.careeragent.domain.enums.ResumeVersionStatus;
import jakarta.validation.constraints.*;
import java.util.Map;
import lombok.Data;

@Data
public class ResumeVersionCreateRequest {
    @NotNull private Long resumeId;
    private Long jobDescriptionId;
    @NotBlank @Size(max=200) private String versionName;
    @Size(max=200) private String targetCompany;
    @Size(max=200) private String targetJobName;
    @NotNull @NotEmpty private Map<String, Object> snapshotData;
    private String changeSummary;
    @NotNull private ResumeVersionStatus status;
}
