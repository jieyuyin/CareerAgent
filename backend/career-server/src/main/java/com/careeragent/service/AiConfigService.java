package com.careeragent.service;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.careeragent.domain.entity.AiProviderConfig;
import com.careeragent.dto.AiConfigRequest;
import com.careeragent.mapper.AiProviderConfigMapper;
import com.careeragent.security.CurrentUserProvider;
import com.careeragent.vo.AiConfigVO;
import com.careeragent.vo.AiModelLibraryItemVO;
import java.util.List;
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
 public RuntimeAiConfig runtime(){var entity=findActive();if(entity==null)return new RuntimeAiConfig(normalize(envProvider),envModel,envBaseUrl,envApiKey);return new RuntimeAiConfig(entity.getProvider(),entity.getModel(),entity.getBaseUrl(),crypto.decrypt(entity.getEncryptedApiKey()));}
 public AiConfigVO get(){var entity=findActive();if(entity==null)return new AiConfigVO(normalize(envProvider),envModel,envBaseUrl,StringUtils.hasText(envApiKey),true,mask(envApiKey));var key=readKey(entity);return new AiConfigVO(entity.getProvider(),entity.getModel(),entity.getBaseUrl(),key.configured(),true,key.masked());}
 public List<AiModelLibraryItemVO> list(){return mapper.selectList(Wrappers.<AiProviderConfig>lambdaQuery().eq(AiProviderConfig::getUserId,currentUser.getCurrentUserId()).orderByDesc(AiProviderConfig::getActive).orderByDesc(AiProviderConfig::getUpdatedAt)).stream().map(this::toLibraryItem).toList();}
 @Transactional public AiConfigVO save(AiConfigRequest request){var userId=currentUser.getCurrentUserId();var provider=normalize(request.provider());var model=request.model().trim();var baseUrl=clean(request.baseUrl());
  var entity=mapper.selectOne(Wrappers.<AiProviderConfig>lambdaQuery().eq(AiProviderConfig::getUserId,userId).eq(AiProviderConfig::getProvider,provider).eq(AiProviderConfig::getModel,model).eq(AiProviderConfig::getBaseUrl,baseUrl));
  mapper.update(null,Wrappers.<AiProviderConfig>lambdaUpdate().eq(AiProviderConfig::getUserId,userId).set(AiProviderConfig::getActive,false));
  if(entity==null){entity=new AiProviderConfig();entity.setUserId(userId);}
  entity.setProvider(provider);entity.setModel(model);entity.setBaseUrl(baseUrl);entity.setActive(true);
  if(request.apiKey()!=null&&!request.apiKey().isBlank()&&!request.apiKey().contains("••••"))entity.setEncryptedApiKey(crypto.encrypt(request.apiKey().trim()));
  else if("mock".equals(request.provider()))entity.setEncryptedApiKey(null);
  if(entity.getId()==null)mapper.insert(entity);else mapper.updateById(entity);return get();}
 private AiProviderConfig findActive(){return mapper.selectOne(Wrappers.<AiProviderConfig>lambdaQuery().eq(AiProviderConfig::getUserId,currentUser.getCurrentUserId()).eq(AiProviderConfig::getActive,true).last("LIMIT 1"));}
 private AiModelLibraryItemVO toLibraryItem(AiProviderConfig entity){var key=readKey(entity);return new AiModelLibraryItemVO(entity.getId(),entity.getProvider(),entity.getModel(),entity.getBaseUrl(),key.configured(),key.masked(),Boolean.TRUE.equals(entity.getActive()),entity.getCreatedAt(),entity.getUpdatedAt());}
 private KeyView readKey(AiProviderConfig entity){if(!StringUtils.hasText(entity.getEncryptedApiKey()))return new KeyView(false,"");try{var plain=crypto.decrypt(entity.getEncryptedApiKey());return new KeyView(StringUtils.hasText(plain),mask(plain));}catch(RuntimeException ignored){return new KeyView(true,"••••••••（需重新输入）");}}
 private String normalize(String p){return "openai".equalsIgnoreCase(p)?"openai-compatible":p;}
 private String clean(String value){if(value==null)return "";return value.trim().replaceAll("/+$","");}
 private String mask(String key){if(!StringUtils.hasText(key))return "";return key.length()<8?"••••••••":key.substring(0,3)+"••••••••"+key.substring(key.length()-4);}
 private record KeyView(boolean configured,String masked){}
 public record RuntimeAiConfig(String provider,String model,String baseUrl,String apiKey){}
}
