package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import java.time.OffsetDateTime;
import lombok.Data;
@Data @TableName("ai_provider_config")
public class AiProviderConfig {
 @TableId(type=IdType.AUTO) private Long id;
 private Long userId; private String provider; private String model; private String baseUrl; private String encryptedApiKey;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
 @TableField(fill=FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
