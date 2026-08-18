package com.careeragent.service;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.careeragent.dto.*;
import com.careeragent.exception.ResourceNotFoundException;
import com.careeragent.mapper.*;
import com.careeragent.security.CurrentUserProvider;
import java.util.Map;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.*;
import org.mockito.junit.jupiter.MockitoExtension;

@ExtendWith(MockitoExtension.class)
class CoreServiceTests {
    @Mock JobApplicationMapper applicationMapper;
    @Mock ApplicationEventMapper eventMapper;
    @Mock JobDescriptionService jobService;
    @Mock ResumeVersionService versionService;
    @Mock CurrentUserProvider currentUser;
    @Mock ResumeMapper resumeMapper;
    @Mock ResumeVersionMapper resumeVersionMapper;
    @Mock JobDescriptionMapper jobMapper;

    @Test
    void applicationStatusUpdateCreatesEvent() {
        var application = new JobApplication(); application.setId(9L); application.setUserId(1L);
        application.setStatus(ApplicationStatus.APPLIED);
        when(currentUser.getCurrentUserId()).thenReturn(1L);
        when(applicationMapper.selectOne(any())).thenReturn(application);
        var service = new ApplicationService(applicationMapper, eventMapper, jobService, versionService, currentUser);
        var request = new ApplicationStatusRequest(); request.setStatus(ApplicationStatus.INTERVIEW); request.setRemark("一面");

        service.updateStatus(9L, request);

        var event = ArgumentCaptor.forClass(ApplicationEvent.class);
        verify(eventMapper).insert(event.capture());
        assertThat(event.getValue().getFromStatus()).isEqualTo(ApplicationStatus.APPLIED);
        assertThat(event.getValue().getToStatus()).isEqualTo(ApplicationStatus.INTERVIEW);
    }

    @Test
    void settingDefaultResumeClearsPreviousDefault() {
        var resume = new Resume(); resume.setId(2L); resume.setUserId(1L); resume.setIsDefault(false);
        when(currentUser.getCurrentUserId()).thenReturn(1L);
        when(resumeMapper.selectOne(any())).thenReturn(resume);
        var service = new ResumeService(resumeMapper, resumeVersionMapper, currentUser);

        service.setDefault(2L);

        verify(resumeMapper).update(isNull(), any());
        verify(resumeMapper).updateById(resume);
        assertThat(resume.getIsDefault()).isTrue();
    }

    @Test
    void resumeVersionPersistsCompleteSnapshot() {
        when(currentUser.getCurrentUserId()).thenReturn(1L);
        var request = new ResumeVersionCreateRequest(); request.setResumeId(1L); request.setVersionName("岗位版");
        request.setStatus(ResumeVersionStatus.DRAFT); request.setSnapshotData(Map.of("fullName", "Demo", "skills", java.util.List.of("Java")));
        var service = new ResumeVersionService(resumeVersionMapper, mock(ResumeService.class), jobService, currentUser);

        service.create(request);

        var version = ArgumentCaptor.forClass(ResumeVersion.class);
        verify(resumeVersionMapper).insert(version.capture());
        assertThat(version.getValue().getSnapshotData()).isEqualTo(request.getSnapshotData());
    }

    @Test
    void missingJobThrowsResourceNotFound() {
        when(currentUser.getCurrentUserId()).thenReturn(1L);
        when(jobMapper.selectOne(any())).thenReturn(null);
        var service = new JobDescriptionService(jobMapper, resumeVersionMapper, applicationMapper, currentUser);
        assertThatThrownBy(() -> service.get(999L)).isInstanceOf(ResourceNotFoundException.class);
    }
}
