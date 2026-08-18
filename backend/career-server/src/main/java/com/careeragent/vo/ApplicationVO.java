package com.careeragent.vo;
import com.careeragent.domain.entity.JobApplication;
import lombok.Data;
import org.springframework.beans.BeanUtils;
@Data public class ApplicationVO extends JobApplication { public static ApplicationVO from(JobApplication source){var vo=new ApplicationVO();BeanUtils.copyProperties(source,vo);return vo;} }
