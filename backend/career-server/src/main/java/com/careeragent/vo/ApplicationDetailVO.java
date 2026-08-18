package com.careeragent.vo;
import java.util.List;
import lombok.*;
@Data @EqualsAndHashCode(callSuper=true)
public class ApplicationDetailVO extends ApplicationVO { private JobDescriptionVO job; private ResumeVersionVO resumeVersion; private List<ApplicationEventVO> events; }
