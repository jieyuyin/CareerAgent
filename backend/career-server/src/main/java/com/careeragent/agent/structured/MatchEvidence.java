package com.careeragent.agent.structured;
import com.careeragent.domain.enums.MatchEvidenceResult;
public record MatchEvidence(String jobRequirement, String resumeSection, String resumeItemId,
                            String resumeEvidence, MatchEvidenceResult result, String reason) {}
