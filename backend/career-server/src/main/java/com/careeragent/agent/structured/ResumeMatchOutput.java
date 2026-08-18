package com.careeragent.agent.structured;
import java.util.List;
public record ResumeMatchOutput(Integer matchScore, List<String> matchedSkills, List<String> missingSkills,
        List<String> weakExpressions, List<String> unsupportedClaims, List<String> recommendedChanges,
        List<MatchEvidence> evidence) {}
