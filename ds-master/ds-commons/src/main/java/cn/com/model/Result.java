/*
 * @(#)Result.java 2013-12-8下午03:42:02
 * Copyright 2013 sinovatech, Inc. All rights reserved.
 */
package cn.com.model;

import java.io.Serializable;

/**
 * 结果
 * <ul>
 * <li>
 * <b>修改历史：</b><br/>
 * <p>
 * [2013-12-8下午03:42:02]sunju<br/>
 * TODO
 * </p>
 * </li>
 * </ul>
 */

public class Result implements Serializable {

	/**
	 * serialVersionUID:TODO（用一句话描述这个变量表示什么）
	 *
	 * @since v 1.1
	 */

	private static final long serialVersionUID = 1L;
	/**
	 * 是否成功：默认为true
	 */
	private boolean success = true;
	/**
	 * 附带对象
	 */
	private Object data;
	/**
	 * 消息
	 */
	private String msg;

	/**
	 * 创建一个新的实例Result.
	 *
	 */
	public Result() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * 创建一个新的实例Result.
	 *
	 * @param data
	 */
	public Result(Object data) {
		super();
		this.data = data;
	}

	/**
	 * 创建一个新的实例Result.
	 *
	 * @param data
	 * @param msg
	 */
	public Result(Object data, String msg) {
		super();
		this.data = data;
		this.msg = msg;
	}

	/**
	 * 创建一个新的实例Result.
	 *
	 * @param success
	 * @param data
	 * @param msg
	 */
	public Result(boolean success, Object data, String msg) {
		super();
		this.success = success;
		this.data = data;
		this.msg = msg;
	}

	public Result(boolean success, String msg) {
		super();
		this.success = success;

		this.msg = msg;
	}

	public boolean isSuccess() {
		return this.success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMsg() {
		return this.msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
