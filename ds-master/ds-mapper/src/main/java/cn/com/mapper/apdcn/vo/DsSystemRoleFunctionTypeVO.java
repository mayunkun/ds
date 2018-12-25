/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.vo;

import cn.com.mapper.apdcn.model.BaseDTO;

public class DsSystemRoleFunctionTypeVO extends BaseDTO {
    /**
	 * 
	 */
	private static final long serialVersionUID = 2755911299240429104L;

	/**
     * ds_system_role_function_type.id
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String id;

    /**
     * ds_system_role_function_type.rolefunctionid
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String rolefunctionid;

    /**
     * ds_system_role_function_type.functiontypeid
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String functiontypeid;

    /* @mbggenerated */
    public String getId() {
        return id;
    }

    /* @mbggenerated */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /* @mbggenerated */
    public String getRolefunctionid() {
        return rolefunctionid;
    }

    /* @mbggenerated */
    public void setRolefunctionid(String rolefunctionid) {
        this.rolefunctionid = rolefunctionid == null ? null : rolefunctionid.trim();
    }

    /* @mbggenerated */
    public String getFunctiontypeid() {
        return functiontypeid;
    }

    /* @mbggenerated */
    public void setFunctiontypeid(String functiontypeid) {
        this.functiontypeid = functiontypeid == null ? null : functiontypeid.trim();
    }
}