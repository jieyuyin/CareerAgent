package com.careeragent.vo;
import java.util.List;
import lombok.*;
@Data @EqualsAndHashCode(callSuper=true)
public class ApplicationDetailVO extends ApplicationVO { private JobDescriptionVO job; private JobDescriptionVO jobDescription; private ResumeVersionVO resumeVersion; private List<RecruitmentEmailVO> emails; private List<InterviewSessionVO> interviews; private List<ApplicationEventVO> events; }
