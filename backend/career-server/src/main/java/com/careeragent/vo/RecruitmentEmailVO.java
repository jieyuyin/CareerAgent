package com.careeragent.vo;
import com.careeragent.domain.entity.RecruitmentEmail;
import com.careeragent.domain.enums.RecruitmentEmailType;
import java.math.BigDecimal;
import java.time.OffsetDateTime;
public record RecruitmentEmailVO(Long id,Long applicationId,String subject,String sender,String content,RecruitmentEmailType emailType,
 String company,String jobName,BigDecimal confidence,OffsetDateTime receivedTime){
 public static RecruitmentEmailVO from(RecruitmentEmail v){return new RecruitmentEmailVO(v.getId(),v.getApplicationId(),v.getSubject(),v.getSender(),v.getContent(),v.getEmailType(),v.getCompany(),v.getJobName(),v.getConfidence(),v.getReceivedTime());}
}
