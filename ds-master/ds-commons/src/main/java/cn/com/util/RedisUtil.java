package cn.com.util;

import java.util.List;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.SetOperations;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Component;

/**
 * ValueOperations
 * @author I'amour solitaire
 *
 */
@Component
@SuppressWarnings("unchecked")
public class RedisUtil extends AbstractBaseRedis<String, Object>{
    private static Logger logger = LoggerFactory.getLogger(RedisUtil.class);
    
    /**
     * 缓存value操作
     * @param k
     * @param v
     * @param time
     * @return
     */
	public static boolean add(String key, String value, long time) {
        try {
            ValueOperations<String, String> valueOps =  redisTemplate.opsForValue();
            valueOps.set(key, value);
            if (time > 0) redisTemplate.expire(key, time, TimeUnit.SECONDS);
            return true;
        } catch (Throwable t) {
            logger.error("缓存[" + key + "]失败, value[" + value + "]", t);
        }
        return false;
    }

    /**
     * 缓存value操作
     * @param k
     * @param v
     * @return
     */
    public static boolean add(String key, String value) {
        return add(key, value, -1);
    }
    
    /**
     * 判断缓存是否存在
     * @param k
     * @return
     */
    public static boolean containsValueKey(String key) {
        return containsKey(key);
    }

    /**
     * 判断缓存是否存在
     * @param k
     * @return
     */
    public static boolean containsSetKey(String key) {
        return containsKey(key);
    }

    public static boolean containsKey(String key) {
        try {
            return redisTemplate.hasKey(key);
        } catch (Throwable t) {
            logger.error("判断缓存存在失败key[" + key + ", error[" + t + "]");
        }
        return false;
    }

    /**
     * 获取缓存
     * @param k
     * @return
     */
    public static String get(String key) {
        try {
            ValueOperations<String, String> valueOps =  redisTemplate.opsForValue();
            return valueOps.get(key);
        } catch (Throwable t) {
            logger.error("获取缓存失败key[" + key + ", error[" + t + "]");
        }
        return null;
    }
    
    /**
     * 移除缓存
     * @param key
     * @return
     */
    public static boolean remove(String key) {
        try {
            redisTemplate.delete(key);
            return true;
        } catch (Throwable t) {
            logger.error("获取缓存失败key[" + key + ", error[" + t + "]");
        }
        return false;
    }

    /**
     * 缓存set操作
     * @param k
     * @param v
     * @param time
     * @return
     */
    protected boolean cacheSet(String key, String value, long time) {
        try {
            SetOperations<String, String> valueOps =  redisTemplate.opsForSet();
            valueOps.add(key, value);
            if (time > 0) redisTemplate.expire(key, time, TimeUnit.SECONDS);
            return true;
        } catch (Throwable t) {
            logger.error("缓存[" + key + "]失败, value[" + value + "]", t);
        }
        return false;
    }

    /**
     * 缓存set
     * @param k
     * @param v
     * @return
     */
    protected boolean cacheSet(String key, String value) {
        return cacheSet(key, value, -1);
    }

    /**
     * 缓存set
     * @param k
     * @param v
     * @param time
     * @return
     */
    protected boolean cacheSet(String key, Set<String> value, long time) {
        try {
            SetOperations<String, String> setOps =  redisTemplate.opsForSet();
            setOps.add(key, value.toArray(new String[value.size()]));
            if (time > 0) redisTemplate.expire(key, time, TimeUnit.SECONDS);
            return true;
        } catch (Throwable t) {
            logger.error("缓存[" + key + "]失败, value[" + value + "]", t);
        }
        return false;
    }

    /**
     * 缓存set
     * @param k
     * @param v
     * @return
     */
    protected boolean cacheSet(String key, Set<String> value) {
        return cacheSet(key, value, -1);
    }

    /**
     * 获取缓存set数据
     * @param k
     * @return
     */
    protected Set<String> getSet(String key) {
        try {
            SetOperations<String, String> setOps = redisTemplate.opsForSet();
            return setOps.members(key);
        } catch (Throwable t) {
            logger.error("获取set缓存失败key[" + key + ", error[" + t + "]");
        }
        return null;
    }

    /**
     * list时效缓存
     * @param k
     * @param v
     * @param time
     * @return
     */
    public static boolean cacheList(String key, String value, long time) {
        try {
            ListOperations<String, String> listOps =  redisTemplate.opsForList();
            listOps.rightPush(key, value);
            if (time > 0) redisTemplate.expire(key, time, TimeUnit.SECONDS);
            return true;
        } catch (Throwable t) {
            logger.error("缓存[" + key + "]失败, value[" + value + "]", t);
        }
        return false;
    }

    /**
     * list缓存
     * @param k
     * @param v
     * @return
     */
    public static boolean cacheList(String key, String value) {
        return cacheList(key, value, -1);
    }

    /**
     * 缓存list
     * @param k
     * @param v
     * @param time
     * @return
     */
    @SuppressWarnings("unused")
	public static boolean cacheList(String key, List<String> value, long time) {
        try {
            ListOperations<String, String> listOps =  redisTemplate.opsForList();
            long l = listOps.rightPushAll(key, value);
            if (time > 0) redisTemplate.expire(key, time, TimeUnit.SECONDS);
            return true;
        } catch (Throwable t) {
            logger.error("缓存[" + key + "]失败, value[" + value + "]", t);
        }
        return false;
    }

    /**
     * 缓存list
     * @param k
     * @param v
     * @return
     */
    public static boolean cacheList(String key, List<String> value) {
       return cacheList(key, value, -1);
    }

    /**
     * 获取list缓存
     * @param k
     * @param start
     * @param end
     * @return
     */
    public static List<String> getList(String key, long start, long end) {
        try {
            ListOperations<String, String> listOps =  redisTemplate.opsForList();
            return listOps.range(key, start, end);
        } catch (Throwable t) {
//            logger.error("获取list缓存失败key[" + KEY_PREFIX_LIST + k + ", error[" + t + "]");
        }
        return null;
    }

    /**
     * 获取总条数, 可用于分页
     * @param k
     * @return
     */
    public static long getListSize(String key) {
        try {
            ListOperations<String, String> listOps =  redisTemplate.opsForList();
            return listOps.size(key);
        } catch (Throwable t) {
//            logger.error("获取list长度失败key[" + KEY_PREFIX_LIST + k + "], error[" + t + "]");
        }
        return 0;
    }

    /**
     * 获取总条数, 可用于分页
     * @param listOps
     * @param k
     * @return
     */
    public static long getListSize(ListOperations<String, String> listOps, String key) {
        try {
            return listOps.size(key);
        } catch (Throwable t) {
//            logger.error("获取list长度失败key[" + KEY_PREFIX_LIST + k + "], error[" + t + "]");
        }
        return 0;
    }

    /**
     * 移除list缓存
     * @param k
     * @return
     */
	public static boolean removeOneOfList(String key) {
        try {
            ListOperations<String, String> listOps =  redisTemplate.opsForList();
            listOps.rightPop(key);
            return true;
        } catch (Throwable t) {
//            logger.error("移除list缓存失败key[" + KEY_PREFIX_LIST + k + ", error[" + t + "]");
        }
        return false;
    }
}
