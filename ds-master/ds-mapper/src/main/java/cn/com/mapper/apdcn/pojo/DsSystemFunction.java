/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.pojo;

import java.io.Serializable;

public class DsSystemFunction implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 6984930628826751394L;

	/**
     * ds_system_function.id
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String id;

    /**
     * ds_system_function.name
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String name;

    /**
     * ds_system_function.url
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String url;

    /**
     * ds_system_function.pId
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String pid;

    /**
     * ds_system_function.level
     * 
     * INTEGER(10)
     *
     * @mbggenerated
     */
    private Integer level;

    /**
     * ds_system_function.num
     * 序号
     * INTEGER(10)
     *
     * @mbggenerated
     */
    private Integer num;

    /**
     * ds_system_function.icon
     * 菜单图标
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String icon;

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
    public String getUrl() {
        return url;
    }

    /* @mbggenerated */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
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
    public Integer getLevel() {
        return level;
    }

    /* @mbggenerated */
    public void setLevel(Integer level) {
        this.level = level;
    }

    /* @mbggenerated */
    public Integer getNum() {
        return num;
    }

    /* @mbggenerated */
    public void setNum(Integer num) {
        this.num = num;
    }

    /* @mbggenerated */
    public String getIcon() {
        return icon;
    }

    /* @mbggenerated */
    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }
}