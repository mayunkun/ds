package cn.com.handle;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.mysql.jdbc.StringUtils;

import cn.com.manager.Client;
import cn.com.util.ContextHolderUtils;
import cn.com.util.RedisUtil;
import cn.com.util.ResourceUtil;

/**
 * <b>原因：<br/>
 * <p>
 * [2014-10-21]gaozhanglei<br/>
 */
public class AuthInterceptor implements HandlerInterceptor {
	private List<String> excludeUrls;

	/**
	 * <b>原因：<br/>
	 * <p>
	 * [2014-10-21]gaozhanglei<br/>
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	}

	/**
	 * <b>原因：<br/>
	 * <p>
	 * [2014-10-21]gaozhanglei<br/>
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}

	/**
	 * 前置拦截器 <b>原因：<br/>
	 * <p>
	 * [2014-10-21]gaozhanglei<br/>
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String requestPath = ResourceUtil.getRequestPath(request);// 用户访问的资源地址
		Gson gson = new Gson();
		Client client = gson.fromJson(RedisUtil.get(ContextHolderUtils.getSession().getId()), Client.class);
		if (excludeUrls.contains(requestPath) || requestPath.indexOf("view/resource/") > -1 || requestPath.indexOf("upload/") > -1
				|| requestPath.indexOf("system/verifyCodeImage.html") > -1 || requestPath.indexOf("interestactivities/getContentList.html") > -1
				|| requestPath.indexOf("instructsos/getLongPollinglist.html") > -1) {
			return true;
		} else {
			if (client == null || client.getQklSystemUserModel() == null) {
				request.getRequestDispatcher("/admin/login.html").forward(request, response);
				return false;
			}
			if (!ContextHolderUtils.getSession().getId().equals(RedisUtil.get(client.getDsSystemUserModel().getId()))) {
				if (StringUtils.isNullOrEmpty(requestPath)) {
					request.getRequestDispatcher("/admin/index.html").forward(request, response);
					return false;
				}
				return true;
			}
		}
		return true;
	}

	public List<String> getExcludeUrls() {
		return excludeUrls;
	}

	public void setExcludeUrls(List<String> excludeUrls) {
		this.excludeUrls = excludeUrls;
	}

	/**
	 * 转发 <b>原因：<br/>
	 * <p>
	 * [2014-10-21]gaozhanglei<br/>
	 */
	@SuppressWarnings("unused")
	private void redictURL(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/").forward(request, response);
	}
}
