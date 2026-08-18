package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.*;
import com.careeragent.persistence.PostgresJsonbTypeHandler;
import java.time.OffsetDateTime;
import java.util.List;
import lombok.Data;
@Data @TableName(value="rewrite_suggestion", autoResultMap=true)
public class RewriteSuggestion {
 @TableId(type=IdType.AUTO) private Long id;
 private Long userId; private Long jobDescriptionId; private Long resumeId; private RewriteItemType itemType;
 private String itemId; private String originalContent; private String suggestedContent; private String reason;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private List<String> matchedJobRequirements;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private List<String> factsToConfirm;
 @TableField(typeHandler=PostgresJsonbTypeHandler.class) private List<String> warnings;
 private RewriteSuggestionStatus status;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
 @TableField(fill=FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
