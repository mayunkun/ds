/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.vo;

import cn.com.mapper.apdcn.model.BaseDTO;

public class DsSystemRoleVO extends BaseDTO {
    /**
	 * 
	 */
	private static final long serialVersionUID = 747483886776133523L;

	/**
     * ds_system_role.id
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String id;

    /**
     * ds_system_role.name
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String name;
    
    /**
     * ds_system_role.image_url
     * 头像
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String imageUrl;

    /**
     * ds_system_role.detail
     * 
     * VARCHAR(500)
     *
     * @mbggenerated
     */
    private String detail;

    /**
     * ds_system_role.pid
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String pid;

    /**
     * ds_system_role.level
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String level;

    /* @mbggenerated */
    public String getId() {
        return id;
    }

    /* @mbggenerated */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /* @mbggenerated */
    public String getName() {
        return name;
    }

    /* @mbggenerated */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /* @mbggenerated */
    public String getDetail() {
        return detail;
    }

    /* @mbggenerated */
    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    /* @mbggenerated */
    public String getPid() {
        return pid;
    }

    /* @mbggenerated */
    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
    }

    /* @mbggenerated */
    public String getLevel() {
        return level;
    }

    /* @mbggenerated */
    public void setLevel(String level) {
        this.level = level == null ? null : level.trim();
    }

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
}