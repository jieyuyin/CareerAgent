package com.careeragent.service;

import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.careeragent.dto.*;
import com.careeragent.exception.*;
import com.careeragent.mapper.*;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.*;
import com.careeragent.web.PageResponse;
import java.util.List;
import java.util.Comparator;
import java.util.Map;
import java.util.Optional;
import java.time.ZoneId;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
public class ApplicationService {
    private final JobApplicationMapper mapper;
    private final ApplicationEventMapper eventMapper;
    private final JobDescriptionService jobService;
    private final ResumeVersionService versionService;
    private final ResumeService resumeService;
    private final CurrentUserProvider currentUser;

    @Transactional
    public ApplicationVO create(ApplicationRequest request) {
        jobService.owned(request.getJobDescriptionId());
        var version = versionService.owned(request.getResumeVersionId());
        if (version.getJobDescriptionId() != null && !version.getJobDescriptionId().equals(request.getJobDescriptionId()))
            throw new BusinessException(40003, "ResumeVersion belongs to a different job");
        var entity = toEntity(request, new JobApplication());
        entity.setUserId(currentUser.getCurrentUserId());
        mapper.insert(entity);
        addEvent(entity.getId(), null, entity.getStatus(), request.getRemark());
        return ApplicationVO.from(entity);
    }
    @Transactional
    public ApplicationVO createManual(ManualApplicationRequest request) {
        var master = resumeService.currentEntity();
        if (master == null) throw new BusinessException(40005, "请先创建基础简历，再新增求职进展");
        var jobRequest = new JobDescriptionRequest(); jobRequest.setCompany(request.company()); jobRequest.setJobName(request.jobName());
        jobRequest.setRecruitmentType(RecruitmentType.UNKNOWN); jobRequest.setSource(JobSource.MANUAL);
        jobRequest.setRawContent(request.jdContent() == null || request.jdContent().isBlank() ? "手动创建，JD 待补充" : request.jdContent());
        jobRequest.setStatus(JobStatus.OPEN); var job = jobService.create(jobRequest);
        var versionRequest = new ResumeVersionCreateRequest(); versionRequest.setResumeId(master.getId());
        versionRequest.setJobDescriptionId(job.getId()); versionRequest.setVersionName(request.jobName() + "基础投递版");
        versionRequest.setTargetCompany(request.company()); versionRequest.setTargetJobName(request.jobName());
        versionRequest.setSnapshotData(Map.of("resumeId", master.getId(), "name", master.getName(), "fullName", master.getFullName(),
                "education", Optional.ofNullable(master.getEducation()).orElse(List.of()), "experiences", Optional.ofNullable(master.getExperiences()).orElse(List.of()),
                "projects", Optional.ofNullable(master.getProjects()).orElse(List.of()), "skills", Optional.ofNullable(master.getSkills()).orElse(List.of())));
        versionRequest.setChangeSummary("手动新增求职进展时保存的 Master Resume 快照"); versionRequest.setStatus(ResumeVersionStatus.CONFIRMED);
        var version = versionService.create(versionRequest);
        var applicationRequest = new ApplicationRequest(); applicationRequest.setJobDescriptionId(job.getId()); applicationRequest.setResumeVersionId(version.getId());
        applicationRequest.setCompany(request.company()); applicationRequest.setJobName(request.jobName());
        applicationRequest.setChannel(Optional.ofNullable(request.channel()).orElse(ApplicationChannel.OTHER)); applicationRequest.setStatus(request.status());
        applicationRequest.setInterviewStage(request.status() == ApplicationStatus.INTERVIEW ? Optional.ofNullable(request.interviewStage()).orElse(ApplicationInterviewStage.TECH_ONE) : null);
        applicationRequest.setAppliedAt(Optional.ofNullable(request.appliedAt()).orElse(java.time.OffsetDateTime.now()));
        applicationRequest.setNextAction(request.nextAction()); applicationRequest.setRemark(request.remark());
        return create(applicationRequest);
    }
    public PageResponse<ApplicationVO> list(ApplicationStatus status, long page, long size) {
        var result = mapper.selectPage(Page.of(page, size), Wrappers.<JobApplication>lambdaQuery()
                .eq(JobApplication::getUserId, currentUser.getCurrentUserId())
                .eq(status != null, JobApplication::getStatus, status).orderByDesc(JobApplication::getUpdatedAt));
        return new PageResponse<>(result.getRecords().stream().map(ApplicationVO::from).toList(), result.getTotal(),
                result.getCurrent(), result.getSize(), result.getPages());
    }
    public ApplicationDetailVO get(Long id) {
        var entity = owned(id);
        var vo = new ApplicationDetailVO(); BeanUtils.copyProperties(entity, vo);
        vo.setJob(jobService.get(entity.getJobDescriptionId()));
        vo.setJobDescription(vo.getJob());
        vo.setResumeVersion(versionService.get(entity.getResumeVersionId()));
        vo.setEvents(events(id));
        return vo;
    }
    @Transactional
    public ApplicationVO update(Long id, ApplicationRequest request) {
        jobService.owned(request.getJobDescriptionId());
        var version = versionService.owned(request.getResumeVersionId());
        if (version.getJobDescriptionId() != null && !version.getJobDescriptionId().equals(request.getJobDescriptionId()))
            throw new BusinessException(40003, "ResumeVersion belongs to a different job");
        var entity = owned(id); var oldStatus = entity.getStatus();
        toEntity(request, entity); mapper.updateById(entity);
        if (oldStatus != entity.getStatus()) addEvent(id, oldStatus, entity.getStatus(), request.getRemark());
        return ApplicationVO.from(entity);
    }
    @Transactional
    public ApplicationVO updateStatus(Long id, ApplicationStatusRequest request) {
        var entity = owned(id); var oldStatus = entity.getStatus();
        if (oldStatus == request.getStatus()) throw new BusinessException(40004, "Application already has this status");
        entity.setStatus(request.getStatus()); entity.setInterviewStage(request.getStatus()==ApplicationStatus.INTERVIEW?Optional.ofNullable(entity.getInterviewStage()).orElse(ApplicationInterviewStage.TECH_ONE):null); mapper.updateById(entity);
        addEvent(id, oldStatus, request.getStatus(), request.getRemark());
        return ApplicationVO.from(entity);
    }
    public List<ApplicationEventVO> events(Long id) {
        owned(id);
        return eventMapper.selectList(Wrappers.<ApplicationEvent>lambdaQuery().eq(ApplicationEvent::getApplicationId, id)
                .orderByAsc(ApplicationEvent::getCreatedAt).orderByAsc(ApplicationEvent::getId)).stream()
                .map(ApplicationEventVO::from).toList();
    }
    public ApplicationStatsVO stats() {
        var values=mapper.selectList(Wrappers.<JobApplication>lambdaQuery().eq(JobApplication::getUserId,currentUser.getCurrentUserId()));
        var monthStart=java.time.LocalDate.now(ZoneId.systemDefault()).withDayOfMonth(1).atStartOfDay(ZoneId.systemDefault()).toOffsetDateTime();
        var inProgress=values.stream().filter(value->List.of(ApplicationStatus.APPLIED,ApplicationStatus.SCREENING,ApplicationStatus.ASSESSMENT,ApplicationStatus.INTERVIEW).contains(value.getStatus())).count();
        var offers=values.stream().filter(value->value.getStatus()==ApplicationStatus.OFFER).count();var rejected=values.stream().filter(value->value.getStatus()==ApplicationStatus.REJECTED).count();
        var thisMonth=values.stream().filter(value->Optional.ofNullable(value.getAppliedAt()).orElse(value.getCreatedAt()).isAfter(monthStart)).count();
        return new ApplicationStatsVO(values.size(),inProgress,offers,rejected,thisMonth);
    }
    @Transactional public ApplicationVO updateProgress(Long id,ApplicationProgressRequest request){var entity=owned(id);var old=entity.getStatus();entity.setStatus(request.status());entity.setInterviewStage(request.status()==ApplicationStatus.INTERVIEW?Optional.ofNullable(request.interviewStage()).orElse(Optional.ofNullable(entity.getInterviewStage()).orElse(ApplicationInterviewStage.TECH_ONE)):null);entity.setNextAction(request.nextAction());entity.setRemark(request.remark());mapper.updateById(entity);if(old!=entity.getStatus())addEvent(id,old,entity.getStatus(),request.remark());return ApplicationVO.from(entity);}
    @Transactional
    public EmailApplicationLinkResult linkRecruitmentEmail(Long userId, RecruitmentEmailType emailType, String company,
                                                           String job, String sourceText, String subject) {
        var applications = mapper.selectList(Wrappers.<JobApplication>lambdaQuery().eq(JobApplication::getUserId, userId));
        var normalizedSource = normalize(sourceText);
        var match = applications.stream().map(application -> Map.entry(application, matchScore(application, company, job, normalizedSource)))
                .filter(entry -> entry.getValue() >= 3).max(Comparator.comparingInt(Map.Entry::getValue)).map(Map.Entry::getKey).orElse(null);
        if (match == null) return EmailApplicationLinkResult.none();
        var target = targetStatus(emailType); var previous = match.getStatus(); var updated = false;
        if (target != null && shouldAdvance(previous, target)) { match.setStatus(target);if(target==ApplicationStatus.INTERVIEW&&match.getInterviewStage()==null)match.setInterviewStage(ApplicationInterviewStage.TECH_ONE); mapper.updateById(match); updated = true; }
        var event = new ApplicationEvent(); event.setApplicationId(match.getId()); event.setFromStatus(previous);
        event.setToStatus(updated ? target : previous); event.setEventType(ApplicationEventType.EMAIL_RECEIVED);
        event.setRemark("收到招聘邮件：" + subject); eventMapper.insert(event);
        return new EmailApplicationLinkResult(match.getId(), updated);
    }
    @Transactional
    public void linkRecruitmentEmailToApplication(Long applicationId, RecruitmentEmailType type, String subject) {
        var application = owned(applicationId); applyEmailProgress(application, type, subject);
    }

    private void applyEmailProgress(JobApplication match, RecruitmentEmailType emailType, String subject) {
        var target = targetStatus(emailType); var previous = match.getStatus(); var updated = false;
        if (target != null && shouldAdvance(previous, target)) { match.setStatus(target);if(target==ApplicationStatus.INTERVIEW&&match.getInterviewStage()==null)match.setInterviewStage(ApplicationInterviewStage.TECH_ONE); mapper.updateById(match); updated = true; }
        var event = new ApplicationEvent(); event.setApplicationId(match.getId()); event.setFromStatus(previous);
        event.setToStatus(updated ? target : previous); event.setEventType(ApplicationEventType.EMAIL_RECEIVED);
        event.setRemark("收到招聘邮件：" + subject); eventMapper.insert(event);
    }

    private int matchScore(JobApplication value,String company,String job,String source){
        var score=0;var appCompany=normalizeCompany(value.getCompany());var appJob=normalize(value.getJobName());
        if(!appCompany.isBlank()&&source.contains(appCompany))score+=4;
        else if(!normalizeCompany(company).isBlank()&&(appCompany.contains(normalizeCompany(company))||normalizeCompany(company).contains(appCompany)))score+=3;
        if(!appJob.isBlank()&&source.contains(appJob))score+=2;
        else if(!normalize(job).isBlank()&&(appJob.contains(normalize(job))||normalize(job).contains(appJob)))score+=1;
        return score;
    }
    private String normalize(String value){return value==null?"":value.toLowerCase().replaceAll("[\\s·_-]","");}
    private String normalizeCompany(String value){return normalize(value).replaceAll("(校园招聘|社会招聘|校园|校招|招聘)$","");}
    private ApplicationStatus targetStatus(RecruitmentEmailType type){return switch(type){case ASSESSMENT->ApplicationStatus.ASSESSMENT;case INTERVIEW->ApplicationStatus.INTERVIEW;case OFFER->ApplicationStatus.OFFER;case REJECTED->ApplicationStatus.REJECTED;default->null;};}
    private boolean shouldAdvance(ApplicationStatus from,ApplicationStatus to){if(from==to||from==ApplicationStatus.REJECTED)return false;if(to==ApplicationStatus.REJECTED)return true;var order=List.of(ApplicationStatus.APPLIED,ApplicationStatus.SCREENING,ApplicationStatus.ASSESSMENT,ApplicationStatus.INTERVIEW,ApplicationStatus.OFFER);return order.indexOf(to)>order.indexOf(from);}
    JobApplication owned(Long id) {
        var value = mapper.selectOne(Wrappers.<JobApplication>lambdaQuery().eq(JobApplication::getId, id)
                .eq(JobApplication::getUserId, currentUser.getCurrentUserId()));
        if (value == null) throw new ResourceNotFoundException("Application", id);
        return value;
    }
    private JobApplication toEntity(ApplicationRequest request, JobApplication entity) {
        BeanUtils.copyProperties(request, entity); entity.setInterviewStage(entity.getStatus()==ApplicationStatus.INTERVIEW?Optional.ofNullable(entity.getInterviewStage()).orElse(ApplicationInterviewStage.TECH_ONE):null); return entity;
    }
    private void addEvent(Long applicationId, ApplicationStatus from, ApplicationStatus to, String remark) {
        var event = new ApplicationEvent(); event.setApplicationId(applicationId); event.setFromStatus(from);
        event.setToStatus(to); event.setEventType(ApplicationEventType.STATUS_CHANGE); event.setRemark(remark);
        eventMapper.insert(event);
    }
}
