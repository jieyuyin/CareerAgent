package com.careeragent.service;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.careeragent.mapper.*;
import com.careeragent.security.CurrentUserProvider;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;
class ApplicationEmailLinkTests {
 @Test void interviewEmailAdvancesMatchingScreeningApplicationAndCreatesEvent(){
  var applications=mock(JobApplicationMapper.class);var events=mock(ApplicationEventMapper.class);var app=new JobApplication();app.setId(12L);app.setUserId(1L);app.setCompany("字节跳动");app.setJobName("AI应用工程师");app.setStatus(ApplicationStatus.SCREENING);when(applications.selectList(any())).thenReturn(List.of(app));
  var service=new ApplicationService(applications,events,mock(JobDescriptionService.class),mock(ResumeVersionService.class),mock(ResumeService.class),mock(CurrentUserProvider.class));
  var result=service.linkRecruitmentEmail(1L,RecruitmentEmailType.INTERVIEW,"字节跳动","AI应用工程师","字节跳动技术面试邀请 AI应用工程师","技术面试邀请");
  assertThat(result.applicationId()).isEqualTo(12L);assertThat(result.statusUpdated()).isTrue();assertThat(app.getStatus()).isEqualTo(ApplicationStatus.INTERVIEW);verify(applications).updateById(app);
  var captor=ArgumentCaptor.forClass(ApplicationEvent.class);verify(events).insert(captor.capture());assertThat(captor.getValue().getEventType()).isEqualTo(ApplicationEventType.EMAIL_RECEIVED);assertThat(captor.getValue().getFromStatus()).isEqualTo(ApplicationStatus.SCREENING);assertThat(captor.getValue().getToStatus()).isEqualTo(ApplicationStatus.INTERVIEW);
 }
 @Test void campusRecruitmentSuffixStillMatchesCompany(){var applications=mock(JobApplicationMapper.class);var events=mock(ApplicationEventMapper.class);var app=new JobApplication();app.setId(13L);app.setCompany("字节跳动");app.setJobName("前端研发工程师");app.setStatus(ApplicationStatus.APPLIED);when(applications.selectList(any())).thenReturn(List.of(app));var service=new ApplicationService(applications,events,mock(JobDescriptionService.class),mock(ResumeVersionService.class),mock(ResumeService.class),mock(CurrentUserProvider.class));var result=service.linkRecruitmentEmail(1L,RecruitmentEmailType.INTERVIEW,"字节跳动校园","前端研发工程师","面试邀请","面试邀请");assertThat(result.applicationId()).isEqualTo(13L);}
}
