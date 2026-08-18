package com.careeragent.vo;
import com.careeragent.domain.entity.Resume;
import lombok.Data;
import org.springframework.beans.BeanUtils;
@Data public class ResumeVO extends Resume { public static ResumeVO from(Resume source){var vo=new ResumeVO();BeanUtils.copyProperties(source,vo);return vo;} }
