/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.model;

import cn.com.mapper.apdcn.pojo.DsSystemUser;

public class DsSystemUserModel extends DsSystemUser {
    /**
	 * 
	 */
	private static final long serialVersionUID = -5582718814720797331L;
	
	private String roleid;
	private String rolename;
	private String headImg;
	private String email;
	public String getRoleid() {
		return roleid;
	}
	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}
	public String getRolename() {
		return rolename;
	}
	public void setRolename(String rolename) {
		this.rolename = rolename;
	}
	public String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(String headImg) {
		this.headImg = headImg;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

}