package com.careeragent.vo;
import com.careeragent.domain.entity.ResumeVersion;
import lombok.Data;
import org.springframework.beans.BeanUtils;
@Data public class ResumeVersionVO extends ResumeVersion { public static ResumeVersionVO from(ResumeVersion source){var vo=new ResumeVersionVO();BeanUtils.copyProperties(source,vo);return vo;} }
