package cn.com.mapper.system.vo;

import java.io.Serializable;

public class MenuPowerVO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4894397281600860084L;

	private String userid;
	private String roleid;
	private String userfunctionid;
	private String typecode;
	private String rolefunctionid;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getUserfunctionid() {
		return userfunctionid;
	}

	public void setUserfunctionid(String userfunctionid) {
		this.userfunctionid = userfunctionid;
	}

	public String getTypecode() {
		return typecode;
	}

	public void setTypecode(String typecode) {
		this.typecode = typecode;
	}

	public String getRolefunctionid() {
		return rolefunctionid;
	}

	public void setRolefunctionid(String rolefunctionid) {
		this.rolefunctionid = rolefunctionid;
	}

}
