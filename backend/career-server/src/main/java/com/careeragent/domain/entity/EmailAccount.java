package com.careeragent.domain.entity;
import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.*;
import java.time.OffsetDateTime;
import lombok.Data;
@Data @TableName("email_account")
public class EmailAccount {
 @TableId(type=IdType.AUTO) private Long id; private Long userId; private EmailProvider provider; private String email;
 private String encryptedAuthorizationCode; private EmailAccountStatus status; private OffsetDateTime lastSyncTime;
 @TableField(fill=FieldFill.INSERT) private OffsetDateTime createdAt;
 @TableField(fill=FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
