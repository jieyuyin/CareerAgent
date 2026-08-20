package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.*;
import java.time.OffsetDateTime;
import java.util.Map;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import lombok.Data;
@Data @TableName(value="interview_session",autoResultMap=true)
public class InterviewSession {
 @TableId(type=IdType.AUTO) private Long id; private Long userId; private Long applicationId; private Long jobId;
 private Long resumeId; private Long resumeVersionId; private InterviewAgentState agentState; private InterviewDecision decision; private String currentTopic; private Integer currentDepth; private Integer currentTurn;
 private String jdSnapshot; private String resumeSnapshot;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private Map<String,Object> jdAnalysis;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private Map<String,Object> resumeAnalysis;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private Map<String,Object> interviewStrategy;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private Map<String,Object> sessionMemory;
 private InterviewStage stage; private InterviewMode mode; private Integer duration; private String model; private InterviewStatus status; private Integer score;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
 @TableField(fill=FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
