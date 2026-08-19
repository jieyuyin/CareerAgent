package com.careeragent.service;

import com.careeragent.agent.llm.LLMAdapter;
import com.careeragent.agent.structured.EmailAnalysisOutput;
import com.careeragent.domain.entity.*;
import com.careeragent.domain.enums.*;
import com.careeragent.dto.EmailAccountRequest;
import com.careeragent.email.*;
import com.careeragent.mapper.*;
import com.careeragent.security.CurrentUserProvider;
import java.time.OffsetDateTime;
import java.util.List;
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;
import static org.assertj.core.api.Assertions.assertThat;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;

class EmailAccountServiceTests {
 @Test void bindEncryptsAuthorizationCodeBeforeSaving(){
  var accounts=mock(EmailAccountMapper.class);var inbox=mock(EmailInboxClient.class);var current=mock(CurrentUserProvider.class);
  when(current.getCurrentUserId()).thenReturn(1L);when(accounts.selectOne(any())).thenReturn(null);
  var service=new EmailAccountService(accounts,mock(RecruitmentEmailMapper.class),inbox,new SecretCryptoService("test-key"),current,mock(LLMAdapter.class),mock(ApplicationService.class));
  service.bind(new EmailAccountRequest("career@163.com","imap-code-123"));
  var captor=ArgumentCaptor.forClass(EmailAccount.class);verify(accounts).insert(captor.capture());
  assertThat(captor.getValue().getEncryptedAuthorizationCode()).isNotEqualTo("imap-code-123");
  assertThat(captor.getValue().getStatus()).isEqualTo(EmailAccountStatus.CONNECTED);
  verify(inbox).test("career@163.com","imap-code-123");
 }

 @Test void syncFiltersRecruitmentEmailAndLinksApplication(){
  var accounts=mock(EmailAccountMapper.class);var emails=mock(RecruitmentEmailMapper.class);var inbox=mock(EmailInboxClient.class);
  var current=mock(CurrentUserProvider.class);var llm=mock(LLMAdapter.class);var applications=mock(ApplicationService.class);var crypto=new SecretCryptoService("test-key");
  var account=new EmailAccount();account.setId(7L);account.setUserId(1L);account.setEmail("career@163.com");account.setStatus(EmailAccountStatus.CONNECTED);account.setEncryptedAuthorizationCode(crypto.encrypt("imap-code"));
  when(current.getCurrentUserId()).thenReturn(1L);when(accounts.selectOne(any())).thenReturn(account);when(emails.selectCount(any())).thenReturn(0L);
  when(inbox.fetch(eq("career@163.com"),eq("imap-code"),any())).thenReturn(List.of(
   new InboundEmail("101","字节跳动技术面试邀请","hr@bytedance.com","AI应用工程师面试安排",OffsetDateTime.now()),
   new InboundEmail("102","产品周报","news@example.com","本周更新",OffsetDateTime.now())));
  when(llm.structuredOutput(anyString(),any(),eq(EmailAnalysisOutput.class))).thenReturn(new EmailAnalysisOutput(RecruitmentEmailType.INTERVIEW,"字节跳动","AI应用工程师",0.95));
  when(applications.linkRecruitmentEmail(anyLong(),any(),any(),any(),any(),any())).thenReturn(new EmailApplicationLinkResult(9L,true));
  var service=new EmailAccountService(accounts,emails,inbox,crypto,current,llm,applications);var result=service.sync();
  assertThat(result.recruitmentEmails()).isEqualTo(1);assertThat(result.linkedApplications()).isEqualTo(1);assertThat(result.statusUpdates()).isEqualTo(1);
  var captor=ArgumentCaptor.forClass(RecruitmentEmail.class);verify(emails).insert(captor.capture());
  assertThat(captor.getValue().getMessageUid()).isEqualTo("101");assertThat(captor.getValue().getApplicationId()).isEqualTo(9L);
 }
}
