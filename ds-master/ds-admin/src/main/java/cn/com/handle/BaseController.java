/*
 * @(#)BaseController.java 2013-11-12下午04:16:44
 * Copyright 2013 sinovatech, Inc. All rights reserved.
 */
package cn.com.handle;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import cn.com.util.DateEditor;

/**
 * 基类控制器
 * 
 * @modificationHistory. <ul>
 *                       <li>sunju 2013-11-12下午04:16:44 TODO</li>
 *                       </ul>
 */
@Controller
public class BaseController {

	/**
	 * 初始化数据绑定
	 * 
	 * @author sunju
	 * @creationDate. 2013-12-7 下午07:46:54
	 * @param binder
	 *            数据绑定对象
	 */

	@InitBinder
	public void initBinder(ServletRequestDataBinder binder) {
		// 自动转换日期类型的字段格式
		binder.registerCustomEditor(Date.class, new DateEditor(true));
	}
}
