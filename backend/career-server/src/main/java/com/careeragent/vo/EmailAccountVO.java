package com.careeragent.vo;
import com.careeragent.domain.entity.EmailAccount;
import com.careeragent.domain.enums.*;
import java.time.OffsetDateTime;
public record EmailAccountVO(Long id, EmailProvider provider, String email, EmailAccountStatus status, OffsetDateTime lastSyncTime) {
 public static EmailAccountVO from(EmailAccount value){return new EmailAccountVO(value.getId(),value.getProvider(),value.getEmail(),value.getStatus(),value.getLastSyncTime());}
}
