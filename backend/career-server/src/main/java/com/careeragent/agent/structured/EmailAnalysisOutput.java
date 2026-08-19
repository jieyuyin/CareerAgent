package com.careeragent.agent.structured;
import com.careeragent.domain.enums.RecruitmentEmailType;
public record EmailAnalysisOutput(RecruitmentEmailType type, String company, String job, Double confidence) {}
