package com.careeragent.vo;
import com.careeragent.domain.entity.ApplicationEvent;
import lombok.Data;
import org.springframework.beans.BeanUtils;
@Data public class ApplicationEventVO extends ApplicationEvent { private String description; public static ApplicationEventVO from(ApplicationEvent source){var vo=new ApplicationEventVO();BeanUtils.copyProperties(source,vo);vo.setDescription(source.getRemark());return vo;} }
