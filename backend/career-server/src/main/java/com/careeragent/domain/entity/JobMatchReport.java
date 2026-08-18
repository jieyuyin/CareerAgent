package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.agent.structured.MatchEvidence;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import java.time.OffsetDateTime;
import java.util.List;
import lombok.Data;
@Data @TableName(value="job_match_report", autoResultMap=true)
public class JobMatchReport {
 @TableId(type=IdType.AUTO) private Long id;
 private Long userId; private Long jobDescriptionId; private Long resumeId; private Integer matchScore;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private List<String> matchedSkills;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private List<String> missingSkills;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private List<String> weakExpressions;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private List<String> unsupportedClaims;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private List<String> recommendedChanges;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private List<MatchEvidence> evidence;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
 @TableField(fill=FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
