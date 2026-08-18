package com.careeragent.vo;
import com.careeragent.domain.entity.JobDescription;
import lombok.Data;
import org.springframework.beans.BeanUtils;
@Data public class JobDescriptionVO extends JobDescription {
    public static JobDescriptionVO from(JobDescription source) { var vo=new JobDescriptionVO(); BeanUtils.copyProperties(source, vo); return vo; }
}
