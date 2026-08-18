package com.careeragent.domain.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.careeragent.domain.enums.UserStatus;
import java.time.OffsetDateTime;
import lombok.Data;

@Data
@TableName("app_user")
public class User {
    @TableId(type = IdType.AUTO) private Long id;
    private String username;
    private String email;
    private String avatarUrl;
    private UserStatus status;
    @TableField(fill = FieldFill.INSERT) private OffsetDateTime createdAt;
    @TableField(fill = FieldFill.INSERT_UPDATE) private OffsetDateTime updatedAt;
}
