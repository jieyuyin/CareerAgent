package com.careeragent.domain.entity;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.careeragent.domain.enums.OfficialSourceType;
import com.careeragent.domain.enums.SourceSyncStatus;
import java.time.OffsetDateTime;
import lombok.Data;

@Data
@TableName("job_source_config")
public class JobSourceConfig {
    @TableId(type = IdType.AUTO) private Long id;
    private Long userId;
    private String company;
    private OfficialSourceType sourceType;
    private String apiUrl;
    private String careerUrl;
    private Boolean enabled;
    private SourceSyncStatus lastSyncStatus;
    private OffsetDateTime lastSyncAt;
    private OffsetDateTime lastSuccessAt;
    private String lastError;
    private Integer lastDiscoveredCount;
    @TableField(fill = FieldFill.INSERT) private OffsetDateTime createdAt;
    @TableField(fill = FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
