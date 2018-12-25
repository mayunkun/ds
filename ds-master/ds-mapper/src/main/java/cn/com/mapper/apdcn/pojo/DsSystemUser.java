/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.pojo;

import java.io.Serializable;

public class DsSystemUser implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = -5341929340887458725L;

	/**
     * ds_system_user.id
     * 
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String id;

    /**
     * ds_system_user.name
     * 姓名
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String name;

    /**
     * ds_system_user.sex
     * 性别 1:男 2:女
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String sex;

    /**
     * ds_system_user.user_image
     * 用户头像
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String userImage;

    /**
     * ds_system_user.phone
     * 电话
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String phone;

    /**
     * ds_system_user.address
     * 地址
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String address;

    /**
     * ds_system_user.idcard
     * 身份证号
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String idcard;

    /**
     * ds_system_user.username
     * 账号
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String username;

    /**
     * ds_system_user.pwd
     * 密码
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String pwd;

    /**
     * ds_system_user.state
     * -1 删除，1有效
     * VARCHAR(255)
     *
     * @mbggenerated
     */
    private String state;

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
    public String getSex() {
        return sex;
    }

    /* @mbggenerated */
    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }

    /* @mbggenerated */
    public String getUserImage() {
        return userImage;
    }

    /* @mbggenerated */
    public void setUserImage(String userImage) {
        this.userImage = userImage == null ? null : userImage.trim();
    }

    /* @mbggenerated */
    public String getPhone() {
        return phone;
    }

    /* @mbggenerated */
    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    /* @mbggenerated */
    public String getAddress() {
        return address;
    }

    /* @mbggenerated */
    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    /* @mbggenerated */
    public String getIdcard() {
        return idcard;
    }

    /* @mbggenerated */
    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    /* @mbggenerated */
    public String getUsername() {
        return username;
    }

    /* @mbggenerated */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /* @mbggenerated */
    public String getPwd() {
        return pwd;
    }

    /* @mbggenerated */
    public void setPwd(String pwd) {
        this.pwd = pwd == null ? null : pwd.trim();
    }

    /* @mbggenerated */
    public String getState() {
        return state;
    }

    /* @mbggenerated */
    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }
}