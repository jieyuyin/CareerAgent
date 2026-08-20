package com.careeragent.agent.structured;
import com.careeragent.domain.enums.InterviewDecision;import java.util.List;
public record InterviewAnswerEvaluationOutput(Integer technicalCorrectness,Integer completeness,Integer communication,Integer overallScore,List<String> strengths,List<String> missingPoints,List<String> riskPoints,InterviewDecision recommendation){}
