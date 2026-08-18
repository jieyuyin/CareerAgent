package com.careeragent.agent.structured;
import java.util.List;
public record JobAnalysisOutput(String jobName, List<String> responsibilities, List<String> requiredSkills,
        List<String> preferredSkills, List<String> keywords, String educationRequirement,
        String experienceRequirement, List<String> jobFocus, List<String> interviewTopics) {}
