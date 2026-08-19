package com.careeragent.email;
import java.time.OffsetDateTime;
public record InboundEmail(String uid,String subject,String sender,String content,OffsetDateTime receivedTime) {}
