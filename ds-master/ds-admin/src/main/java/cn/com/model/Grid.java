/*
 * @(#)Grid.java 2013-11-28下午02:21:07
 * Copyright 2013 sinovatech, Inc. All rights reserved.
 */
package cn.com.model;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @author gaozl
 *
 */
@SuppressWarnings("rawtypes")
public class Grid implements Serializable {

	/**
	 * serialVersionUID:TODO（用一句话描述这个变量表示什么）
	 *
	 * @since v 1.1
	 */

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 总记录数
	 */
	private int total;
	/**
	 * 记录行（数据集合）
	 */
	private List rows;

	private int page;

	/**
	 * 创建一个新的实例Grid.
	 *
	 */
	public Grid() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * 创建一个新的实例Grid.
	 *
	 * @param total
	 * @param rows
	 * @param footer
	 */
	public Grid(int total, List list, int page, int rows) {
		super();
		this.total = (int) (Math.ceil(total / (rows + 0.0d)));
		this.rows = list;
		this.page = page;
	}

	/**
	 * 创建一个新的实例Grid.
	 *
	 * @param total
	 * @param rows
	 */
	public Grid(int total, List rows) {
		super();
		this.total = total;
		this.rows = rows;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

}
