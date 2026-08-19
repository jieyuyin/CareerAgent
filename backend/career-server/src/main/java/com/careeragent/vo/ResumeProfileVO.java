package com.careeragent.vo;

import java.util.List;
import java.util.Map;

public record ResumeProfileVO(ResumeVO profile, List<Map<String, Object>> education,
                              List<Map<String, Object>> experience, List<Map<String, Object>> projects,
                              List<String> skills) {
    public static ResumeProfileVO from(ResumeVO resume) {
        if (resume == null) return null;
        return new ResumeProfileVO(resume, resume.getEducation(), resume.getExperiences(), resume.getProjects(), resume.getSkills());
    }
}
