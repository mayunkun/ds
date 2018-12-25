/*
 * @(#)Result.java 2013-12-8下午03:42:02
 * Copyright 2013 sinovatech, Inc. All rights reserved.
 */
package cn.com.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class ResultFiles implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3024754473441716287L;

	private boolean success = true;
	private List<Obj> files = new ArrayList<Obj>();
	private String msg;

	public class Obj {
		private String url;
		private String name;

		public String getUrl() {
			return url;
		}

		public void setUrl(String url) {
			this.url = url;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}
	}

	public ResultFiles() {
		super();
	}

	public ResultFiles(List<Obj> files) {
		super();
		this.files = files;
	}

	public ResultFiles(List<Obj> files, String msg) {
		super();
		this.files = files;
		this.msg = msg;
	}

	public ResultFiles(boolean success, List<Obj> files, String msg) {
		super();
		this.success = success;
		this.files = files;
		this.msg = msg;
	}

	public ResultFiles(boolean success, String msg) {
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

	public List<Obj> getFiles() {
		return files;
	}

	public void setFiles(List<Obj> files) {
		this.files = files;
	}
}
