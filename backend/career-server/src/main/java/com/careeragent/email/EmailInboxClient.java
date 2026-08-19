package com.careeragent.email;
import java.time.OffsetDateTime;
import java.util.List;
public interface EmailInboxClient {
 void test(String email,String authorizationCode);
 List<InboundEmail> fetch(String email,String authorizationCode,OffsetDateTime since);
}
