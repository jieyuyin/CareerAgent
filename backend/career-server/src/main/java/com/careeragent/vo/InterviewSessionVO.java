package com.careeragent.vo;
import com.careeragent.domain.entity.InterviewSession;import com.careeragent.domain.enums.*;import java.time.OffsetDateTime;
public record InterviewSessionVO(Long id,Long applicationId,Long jobId,Long resumeId,Long resumeVersionId,String company,String job,InterviewStage stage,InterviewMode mode,Integer duration,String model,InterviewStatus status,InterviewAgentState agentState,InterviewDecision decision,String currentTopic,Integer currentDepth,Integer currentTurn,Integer score,OffsetDateTime createdTime,OffsetDateTime updatedTime,InterviewReportVO report){}
