package cn.com.manager;

import java.util.Map;

import cn.com.mapper.apdcn.model.DsSystemUserModel;
import cn.com.mapper.apdcn.pojo.DsSystemFunction;

/**
 * 在线用户对象
 * 
 * @version 1.0
 */
public class Client implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private DsSystemUserModel dsSystemUserModel;
	
	private Map<String, DsSystemFunction> functions;
	/**
	 * 用户IP
	 */
	private java.lang.String ip;
	/**
	 * 登录时间
	 */
	private java.util.Date logindatetime;

	public Map<String, DsSystemFunction> getFunctions() {
		return functions;
	}

	public void setFunctions(Map<String, DsSystemFunction> functions) {
		this.functions = functions;
	}

	public java.lang.String getIp() {
		return ip;
	}

	public void setIp(java.lang.String ip) {
		this.ip = ip;
	}

	public java.util.Date getLogindatetime() {
		return logindatetime;
	}

	public void setLogindatetime(java.util.Date logindatetime) {
		this.logindatetime = logindatetime;
	}

	public DsSystemUserModel getQklSystemUserModel() {
		return getDsSystemUserModel();
	}

	public void setQklSystemUserModel(DsSystemUserModel dsSystemUserModel) {
		this.setDsSystemUserModel(dsSystemUserModel);
	}

	public DsSystemUserModel getDsSystemUserModel() {
		return dsSystemUserModel;
	}

	public void setDsSystemUserModel(DsSystemUserModel dsSystemUserModel) {
		this.dsSystemUserModel = dsSystemUserModel;
	}

}
