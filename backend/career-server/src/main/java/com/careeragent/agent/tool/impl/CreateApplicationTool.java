package com.careeragent.agent.tool.impl;
import com.careeragent.agent.tool.*;
import com.careeragent.domain.enums.*;
import com.careeragent.dto.ApplicationRequest;
import com.careeragent.service.*;
import java.util.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
@Component @RequiredArgsConstructor
public class CreateApplicationTool implements AgentTool {
 private final ApplicationService applicationService; private final JobDescriptionService jobService;
 public String getName(){return "create_application";} public String getDescription(){return "使用岗位专属简历版本创建真实投递记录";}
 public boolean requiresConfirmation(){return true;} public PendingActionType getActionType(){return PendingActionType.CREATE_APPLICATION;}
 public Map<String,Object> getInputSchema(){return BaseSchemas.object(Map.of("jobDescriptionId",BaseSchemas.integer("岗位ID"),"resumeVersionId",BaseSchemas.integer("简历版本ID"),"channel",BaseSchemas.string("投递渠道"),"remark",BaseSchemas.string("备注")),List.of("jobDescriptionId","resumeVersionId","channel"));}
 public String confirmationSummary(Map<String,Object>a){var job=jobService.get(((Number)a.get("jobDescriptionId")).longValue());return "创建「"+job.getCompany()+" - "+job.getJobName()+"」投递记录";}
 public ToolResult execute(ToolContext c,Map<String,Object>a){
  var job=jobService.get(((Number)a.get("jobDescriptionId")).longValue()); var r=new ApplicationRequest();
  r.setJobDescriptionId(job.getId());r.setResumeVersionId(((Number)a.get("resumeVersionId")).longValue());r.setCompany(job.getCompany());r.setJobName(job.getJobName());
  r.setChannel(ApplicationChannel.valueOf(a.get("channel").toString()));r.setStatus(ApplicationStatus.TO_APPLY);r.setRemark((String)a.get("remark"));
  return ToolResult.success(applicationService.create(r));
 }
}
