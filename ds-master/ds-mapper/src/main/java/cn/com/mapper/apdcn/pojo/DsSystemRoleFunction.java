/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.pojo;

import java.io.Serializable;

public class DsSystemRoleFunction implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1752449859400303701L;

	/**
     * ds_system_role_function.id
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String id;

    /**
     * ds_system_role_function.roleid
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String roleid;

    /**
     * ds_system_role_function.functionid
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String functionid;

    /* @mbggenerated */
    public String getId() {
        return id;
    }

    /* @mbggenerated */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /* @mbggenerated */
    public String getRoleid() {
        return roleid;
    }

    /* @mbggenerated */
    public void setRoleid(String roleid) {
        this.roleid = roleid == null ? null : roleid.trim();
    }

    /* @mbggenerated */
    public String getFunctionid() {
        return functionid;
    }

    /* @mbggenerated */
    public void setFunctionid(String functionid) {
        this.functionid = functionid == null ? null : functionid.trim();
    }
}