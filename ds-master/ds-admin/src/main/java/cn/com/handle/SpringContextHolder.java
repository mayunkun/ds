/*
 * @(#)SpringContextHolder.java 2013-11-7下午06:10:02
 * Copyright 2013 sinovatech, Inc. All rights reserved.
 */
package cn.com.handle;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * Spring上下文持有类
 * 
 * @author gaozhanglei
 *
 */
@SuppressWarnings("unchecked")
public class SpringContextHolder implements ApplicationContextAware {
	/**
	 * 以静态变量保存Spring ApplicationContext,可在任何代码任何地方任何时�?中取出ApplicaitonContext.
	 */
	private static ApplicationContext applicationContext;

	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		// TODO Auto-generated method stub
		SpringContextHolder.applicationContext = context;
	}

	/**
	 * 
	 * 
	 * <ul>
	 * <li>
	 * <b>功能：取得存储在静态变量中的ApplicationContext<br/>
	 * <p>
	 * 2016年4月25日 gaozhanglei<br/>
	 * 
	 * @return </p>
	 *         </li>
	 *         </ul>
	 */
	public static ApplicationContext getApplicationContext() {
		checkApplicationContext();
		return applicationContext;
	}

	/**
	 * 
	 * 
	 * <ul>
	 * <li>
	 * <b>功能：<br/>
	 * <p>
	 * 2016年4月25日 gaozhanglei<br/>
	 * 
	 * @param name
	 * @return </p>
	 *         </li>
	 *         </ul>
	 */
	public static <T> T getBean(String name) {
		checkApplicationContext();
		return (T) applicationContext.getBean(name);
	}

	/**
	 * 
	 * 
	 * <ul>
	 * <li>
	 * <b>功能：<br/>
	 * <p>
	 * 2016年4月25日 gaozhanglei<br/>
	 * 
	 * @param clazz
	 * @return </p>
	 *         </li>
	 *         </ul>
	 */
	public static <T> T getBean(Class<T> clazz) {
		checkApplicationContext();
		Object o = applicationContext.getBean(clazz);
		return (T) o;
	}

	/**
	 * 
	 * 
	 * <ul>
	 * <li>
	 * <b>功能：<br/>
	 * <p>
	 * 2016年4月25日 gaozhanglei<br/>
	 * </p>
	 * </li>
	 * </ul>
	 */
	public static void cleanApplicationContext() {
		applicationContext = null;
	}

	/**
	 * 
	 * 
	 * <ul>
	 * <li>
	 * <b>功能：<br/>
	 * <p>
	 * 2016年4月25日 gaozhanglei<br/>
	 * </p>
	 * </li>
	 * </ul>
	 */
	private static void checkApplicationContext() {
		if (applicationContext == null) {
			throw new IllegalStateException("applicaitonContext未注入,请在xml中定义SpringContextHolder");
		}
	}

}
