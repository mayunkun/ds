/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.vo;

import java.util.List;

import cn.com.mapper.apdcn.model.BaseDTO;

public class DsSystemFunctionVO extends BaseDTO {
    /**
	 * 
	 */
	private static final long serialVersionUID = 826915940864576768L;

	private String roleid;
	private String piconcode;
	private String iconcode;
	private String ismenu;
	private List<DsSystemFunctionVO> childlist;
	private boolean open;
	private boolean checked;
	
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

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public String getPiconcode() {
		return piconcode;
	}

	public void setPiconcode(String piconcode) {
		this.piconcode = piconcode;
	}

	public String getIconcode() {
		return iconcode;
	}

	public void setIconcode(String iconcode) {
		this.iconcode = iconcode;
	}

	public String getIsmenu() {
		return ismenu;
	}

	public void setIsmenu(String ismenu) {
		this.ismenu = ismenu;
	}

	public List<DsSystemFunctionVO> getChildlist() {
		return childlist;
	}

	public void setChildlist(List<DsSystemFunctionVO> childlist) {
		this.childlist = childlist;
	}

	public boolean isOpen() {
		return open;
	}

	public void setOpen(boolean open) {
		this.open = open;
	}

	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
    
}