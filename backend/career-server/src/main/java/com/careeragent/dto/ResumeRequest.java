package com.careeragent.dto;

import jakarta.validation.constraints.*;
import java.util.*;
import lombok.Data;
import com.careeragent.domain.enums.ResumeSource;
import com.careeragent.domain.enums.ResumeStatus;

@Data
public class ResumeRequest {
    @NotBlank @Size(max=200) private String name;
    @NotBlank @Size(max=100) private String fullName;
    @Size(max=50) private String phone;
    @Email @Size(max=255) private String email;
    @Size(max=200) private String location;
    @Size(max=200) private String targetRole;
    private ResumeSource source;
    private ResumeStatus status;
    private Map<String, Object> basicInfo;
    @Size(max=2000) private String fileUrl;
    @Size(max=500) private String fileName;
    @Size(max=100) private String fileType;
    private List<Map<String, Object>> education;
    private List<Map<String, Object>> experiences;
    private List<Map<String, Object>> projects;
    private List<String> skills;
    private Boolean isDefault;
}
