package com.careeragent.service;
import com.careeragent.exception.BusinessException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
@Service
public class SecretCryptoService {
 private final SecretKeySpec key; private final SecureRandom random=new SecureRandom();
 public SecretCryptoService(@Value("${career.config.encryption-key:${POSTGRES_PASSWORD:career_agent_dev}}") String master){try{this.key=new SecretKeySpec(MessageDigest.getInstance("SHA-256").digest(master.getBytes(StandardCharsets.UTF_8)),"AES");}catch(Exception e){throw new IllegalStateException(e);}}
 public String encrypt(String plain){if(plain==null||plain.isBlank())return null;try{byte[] iv=new byte[12];random.nextBytes(iv);var c=Cipher.getInstance("AES/GCM/NoPadding");c.init(Cipher.ENCRYPT_MODE,key,new GCMParameterSpec(128,iv));var encrypted=c.doFinal(plain.getBytes(StandardCharsets.UTF_8));return Base64.getEncoder().encodeToString(ByteBuffer.allocate(iv.length+encrypted.length).put(iv).put(encrypted).array());}catch(Exception e){throw new BusinessException(50020,"Unable to encrypt API key");}}
 public String decrypt(String encoded){if(encoded==null||encoded.isBlank())return "";try{var all=Base64.getDecoder().decode(encoded);var iv=java.util.Arrays.copyOfRange(all,0,12);var encrypted=java.util.Arrays.copyOfRange(all,12,all.length);var c=Cipher.getInstance("AES/GCM/NoPadding");c.init(Cipher.DECRYPT_MODE,key,new GCMParameterSpec(128,iv));return new String(c.doFinal(encrypted),StandardCharsets.UTF_8);}catch(Exception e){throw new BusinessException(50021,"Unable to decrypt API key; check encryption key");}}
}
