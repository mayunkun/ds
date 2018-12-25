package cn.com.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;

/**
 * redis 基础持久层操作类
 * @author I'amour solitaire
 *
 * @param <K>
 * @param <V>
 */
public class AbstractBaseRedis<K, V> {

	@SuppressWarnings("rawtypes")
	@Autowired 
    protected static RedisTemplate redisTemplate;
  
	/**
	 * spring annotation不支持静态变量注入
	 * set方法加上 @Autowired
	 * @param redisTemplate
	 */
	@SuppressWarnings("static-access")
	@Autowired
	public void setRedisTemplate(RedisTemplate<K, V> redisTemplate) {  
        this.redisTemplate = redisTemplate;  
    }  
      
    /**
     * 
     * @Description: TODO 获取 RedisSerializer 
     * @param @return   
     * @throws
     * @author Guyl
     * @date 2016年7月8日
     */
	@SuppressWarnings("unchecked")
	protected RedisSerializer<String> getRedisSerializer() {  
        return redisTemplate.getStringSerializer();  
    }  
	
}
