package com.careeragent.service;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.careeragent.domain.entity.AiProviderConfig;
import com.careeragent.dto.AiConfigRequest;
import com.careeragent.mapper.AiProviderConfigMapper;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.AiConfigVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
@Service @RequiredArgsConstructor
public class AiConfigService {
 private final AiProviderConfigMapper mapper; private final CurrentUserProvider currentUser; private final SecretCryptoService crypto;
 @Value("${career.ai.provider:mock}") private String envProvider;
 @Value("${career.ai.model:mock-career-agent}") private String envModel;
 @Value("${career.ai.base-url:}") private String envBaseUrl;
 @Value("${career.ai.api-key:}") private String envApiKey;
 public RuntimeAiConfig runtime(){var entity=find();if(entity==null)return new RuntimeAiConfig(normalize(envProvider),envModel,envBaseUrl,envApiKey);return new RuntimeAiConfig(entity.getProvider(),entity.getModel(),entity.getBaseUrl(),crypto.decrypt(entity.getEncryptedApiKey()));}
 public AiConfigVO get(){var c=runtime();return new AiConfigVO(c.provider(),c.model(),c.baseUrl(),StringUtils.hasText(c.apiKey()),true,mask(c.apiKey()));}
 @Transactional public AiConfigVO save(AiConfigRequest request){var entity=find();if(entity==null){entity=new AiProviderConfig();entity.setUserId(currentUser.getCurrentUserId());}
  entity.setProvider(request.provider());entity.setModel(request.model().trim());entity.setBaseUrl(clean(request.baseUrl()));
  if(request.apiKey()!=null&&!request.apiKey().isBlank()&&!request.apiKey().contains("••••"))entity.setEncryptedApiKey(crypto.encrypt(request.apiKey().trim()));
  else if("mock".equals(request.provider()))entity.setEncryptedApiKey(null);
  if(entity.getId()==null)mapper.insert(entity);else mapper.updateById(entity);return get();}
 private AiProviderConfig find(){return mapper.selectOne(Wrappers.<AiProviderConfig>lambdaQuery().eq(AiProviderConfig::getUserId,currentUser.getCurrentUserId()));}
 private String normalize(String p){return "openai".equalsIgnoreCase(p)?"openai-compatible":p;}
 private String clean(String value){if(value==null)return "";return value.trim().replaceAll("/+$","");}
 private String mask(String key){if(!StringUtils.hasText(key))return "";return key.length()<8?"••••••••":key.substring(0,3)+"••••••••"+key.substring(key.length()-4);}
 public record RuntimeAiConfig(String provider,String model,String baseUrl,String apiKey){}
}
