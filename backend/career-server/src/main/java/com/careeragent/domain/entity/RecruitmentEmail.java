package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.RecruitmentEmailType;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
import lombok.Data;
@Data @TableName("recruitment_email")
public class RecruitmentEmail {
 @TableId(type=IdType.AUTO) private Long id; private Long emailAccountId; private Long applicationId; private String messageUid;
 private String subject; private String sender; private String content; private RecruitmentEmailType emailType; private String company;
 private String jobName; private BigDecimal confidence; private OffsetDateTime receivedTime;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
}
