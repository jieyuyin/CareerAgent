package com.careeragent.vo;
import com.careeragent.domain.entity.InterviewReport;
public record InterviewReportVO(Integer score,String strength,String weakness,String suggestion){public static InterviewReportVO from(InterviewReport v){return v==null?null:new InterviewReportVO(v.getScore(),v.getStrength(),v.getWeakness(),v.getSuggestion());}}
