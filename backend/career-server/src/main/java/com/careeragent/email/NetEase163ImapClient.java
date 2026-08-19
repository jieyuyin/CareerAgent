package com.careeragent.email;
import com.careeragent.exception.BusinessException;
import jakarta.mail.*;
import jakarta.mail.internet.MimeMultipart;
import org.eclipse.angus.mail.imap.IMAPStore;
import java.time.*;
import java.util.*;
import org.springframework.stereotype.Component;

@Component
public class NetEase163ImapClient implements EmailInboxClient {
 private Properties properties(){var p=new Properties();p.put("mail.store.protocol","imaps");p.put("mail.imaps.host","imap.163.com");p.put("mail.imaps.port","993");p.put("mail.imaps.ssl.enable","true");p.put("mail.imaps.connectiontimeout","10000");p.put("mail.imaps.timeout","20000");return p;}
 public void test(String email,String code){try(var store=connect(email,code)){}catch(Exception e){throw connectionError(e);}}
 public List<InboundEmail> fetch(String email,String code,OffsetDateTime since){
  try(var store=connect(email,code)){var inbox=store.getFolder("INBOX");inbox.open(Folder.READ_ONLY);try{
   var messages=inbox.getMessages();var result=new ArrayList<InboundEmail>();
   for(int i=messages.length-1;i>=0&&result.size()<200;i--){var m=messages[i];var received=toTime(Optional.ofNullable(m.getReceivedDate()).orElse(m.getSentDate()));if(received.isBefore(since))break;
    var uid=inbox instanceof UIDFolder u?Long.toString(u.getUID(m)):messageId(m,i);result.add(new InboundEmail(uid,Objects.toString(m.getSubject(),"(无主题)"),addresses(m.getFrom()),content(m),received));}
   return result;
  }finally{if(inbox.isOpen())inbox.close(false);}}
  catch(Exception e){throw connectionError(e);}
 }
 private Store connect(String email,String code)throws MessagingException{var store=Session.getInstance(properties()).getStore("imaps");store.connect("imap.163.com",993,email,code);if(store instanceof IMAPStore imap)imap.id(Map.of("name","CareerAgent","version","0.1.0","vendor","CareerAgent"));return store;}
 private String content(Part part)throws Exception{if(part.isMimeType("text/plain"))return Objects.toString(part.getContent(),"");if(part.isMimeType("text/html"))return Objects.toString(part.getContent(),"").replaceAll("<[^>]+>"," ");if(part.getContent() instanceof MimeMultipart multi){var out=new StringBuilder();for(int i=0;i<multi.getCount();i++)out.append(content(multi.getBodyPart(i))).append('\n');return out.toString();}return "";}
 private String addresses(Address[] values){return values==null?"":Arrays.stream(values).map(Object::toString).reduce((a,b)->a+", "+b).orElse("");}
 private OffsetDateTime toTime(Date value){return value==null?OffsetDateTime.now():value.toInstant().atOffset(ZoneOffset.UTC);}
 private String messageId(Message m,int fallback)throws MessagingException{var values=m.getHeader("Message-ID");return values!=null&&values.length>0?values[0]:"fallback-"+fallback+"-"+m.getMessageNumber();}
 private BusinessException connectionError(Exception e){return new BusinessException(40061,"163 邮箱 IMAP 连接失败，请确认已开启 IMAP 服务并使用授权码："+Objects.toString(e.getMessage(),"连接失败"));}
}
