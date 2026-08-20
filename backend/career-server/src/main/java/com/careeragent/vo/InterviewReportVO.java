package com.careeragent.vo;
import com.careeragent.domain.entity.InterviewReport;
public record InterviewReportVO(Integer score,Integer technicalScore,Integer communicationScore,Integer completenessScore,Integer jdCoverage,String strength,String weakness,String suggestion){public static InterviewReportVO from(InterviewReport v){return v==null?null:new InterviewReportVO(v.getScore(),v.getTechnicalScore(),v.getCommunicationScore(),v.getCompletenessScore(),v.getJdCoverage(),v.getStrength(),v.getWeakness(),v.getSuggestion());}}
