package cn.com.test;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.com.util.RedisUtil;

/**
 * 启动Dubbo服务用的MainClass
 * @author I'amour solitaire
 *
 */
public class DubboProvider {
	
	private static final Log log = LogFactory.getLog(DubboProvider.class);

	@SuppressWarnings({ "resource", "static-access" })
	public static void main(String[] args) {
		try {
			ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
			context.start();
			RedisUtil redisUtil = context.getBean(RedisUtil.class);
			redisUtil.add("sss", "SSSSSSSSSS");
			context.stop();
		} catch (Exception e) {
			log.error("== DubboProvider context start error:",e);
		}
		synchronized (DubboProvider.class) {
			while (true) {
				try {
					DubboProvider.class.wait();
				} catch (InterruptedException e) {
					log.error("== synchronized error:",e);
				}
			}
		}
	}
    
}