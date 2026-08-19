package com.careeragent.vo;
import com.careeragent.domain.entity.InterviewSession;import com.careeragent.domain.enums.*;import java.time.OffsetDateTime;
public record InterviewSessionVO(Long id,Long applicationId,Long jobId,String company,String job,InterviewStage stage,InterviewMode mode,Integer duration,String model,InterviewStatus status,Integer score,OffsetDateTime createdTime,OffsetDateTime updatedTime,InterviewReportVO report){}
