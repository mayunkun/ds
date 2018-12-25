/**
 * Copyright 2013 Sinovatech
 */
package cn.com.mapper.apdcn.model;

import java.io.Serializable;

import org.apache.commons.lang3.builder.HashCodeBuilder;
import org.apache.commons.lang3.builder.ToStringBuilder;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * 
 * @author gaozl
 *
 */
@JsonIgnoreProperties(value = { "insertRole", "updateRole", "deleteRole", "searchRole", "pwd" })
public abstract class BaseDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int page = 1;
	private int rows = 99999;
	@SuppressWarnings("unused")
	private int start;
	protected String orderby = " id desc ";

	private int allcount;
	@SuppressWarnings("unused")
	private int allpage;
	private String insertRole;
	private String updateRole;
	private String deleteRole;
	private String searchRole;

	public String getSearchRole() {
		return searchRole;
	}

	public void setSearchRole(String searchRole) {
		this.searchRole = searchRole;
	}

	public int getAllcount() {
		return allcount;
	}

	public void setAllcount(int allcount) {
		this.allcount = allcount;
	}

	public int getAllpage() {
		if (allcount == 0)
			return 0;
		else if (allcount <= 0)
			return 0;
		return (int) (Math.ceil(this.allcount / (this.rows + 0.0d)));
	}

	public void setAllpage(int allpage) {
		this.allpage = allpage;
	}

	public String getInsertRole() {
		return insertRole;
	}

	public void setInsertRole(String insertRole) {
		this.insertRole = insertRole;
	}

	public String getUpdateRole() {
		return updateRole;
	}

	public void setUpdateRole(String updateRole) {
		this.updateRole = updateRole;
	}

	public String getDeleteRole() {
		return deleteRole;
	}

	public void setDeleteRole(String deleteRole) {
		this.deleteRole = deleteRole;
	}

	public int getStart() {
		return (page - 1) * rows;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public String getOrderby() {
		return orderby;
	}

	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}

	public BaseDTO() {
		super();
	}

	@Override
	public int hashCode() {
		return new HashCodeBuilder().hashCode();
	}

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this);
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

}
