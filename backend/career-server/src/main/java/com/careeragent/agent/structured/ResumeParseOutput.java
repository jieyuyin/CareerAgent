package com.careeragent.agent.structured;

import java.util.List;
import java.util.Map;

public record ResumeParseOutput(String fullName, String phone, String email, String targetRole,
        List<Map<String, Object>> education, List<Map<String, Object>> experiences,
        List<Map<String, Object>> projects, List<String> skills, List<String> fieldsToConfirm) {}
