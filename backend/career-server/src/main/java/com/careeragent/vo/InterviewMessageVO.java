package com.careeragent.vo;
import com.careeragent.domain.entity.InterviewMessage;import java.time.OffsetDateTime;
public record InterviewMessageVO(Long id,Long sessionId,String role,String content,OffsetDateTime createdAt){public static InterviewMessageVO from(InterviewMessage v){return new InterviewMessageVO(v.getId(),v.getSessionId(),v.getRole(),v.getContent(),v.getCreatedAt());}}
