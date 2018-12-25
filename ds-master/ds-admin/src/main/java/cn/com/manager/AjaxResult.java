package cn.com.manager;

import java.io.Serializable;

/**
 * Ajax返回对象
 * 
 * @author is_zhoufeng@163.com 2015年1月25日 下午5:00:26
 */
public class AjaxResult implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -9107114652498812085L;

	/**
	 * 返回的数据
	 */
	private Object data;

	/**
	 * 返回消息
	 */
	private String message;

	/**
	 * Code
	 */
	private String code;

	/**
	 * 自定义一个返回值
	 * 
	 * @param data
	 * @param message
	 * @param code
	 * @return
	 */
	public static AjaxResult newAjaxResult(Object data, String message, String code) {
		AjaxResult result = new AjaxResult();
		result.setCode(code);
		result.setData(data);
		result.setMessage(message);
		return result;
	}

	/**
	 * 创建一个成功的返回值
	 * 
	 * @param data
	 * @return
	 */
	public static AjaxResult newSuccessResult(Object data) {
		AjaxResult result = new AjaxResult();
		result.setCode(AjaxResultType.SUCCESS.getValue());
		result.setData(data);
		return result;
	}

	/**
	 * 创建一个失败的返回值
	 * 
	 * @param data
	 * @param msg
	 * @param code
	 * @return
	 */
	public static AjaxResult newFailResult(Object data, String message) {
		AjaxResult result = new AjaxResult();
		result.setCode(AjaxResultType.FAIL.getValue());
		result.setData(data);
		result.setMessage(message);
		return result;
	}

	/**
	 * 创建一个异常返回值
	 * 
	 * @param e
	 * @param msg
	 * @param code
	 * @return
	 */
	public static AjaxResult newExceptionResult(Exception e, String message) {
		AjaxResult result = new AjaxResult();
		result.setCode(AjaxResultType.ERROR.getValue());
		result.setMessage(message);
		return result;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}
