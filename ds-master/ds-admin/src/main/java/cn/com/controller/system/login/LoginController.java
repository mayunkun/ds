package cn.com.controller.system.login;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import cn.com.manager.Client;
import cn.com.mapper.apdcn.model.DsSystemUserModel;
import cn.com.mapper.apdcn.vo.DsSystemFunctionVO;
import cn.com.model.Result;
import cn.com.service.login.LoginService;
import cn.com.util.ConstantsUtil;
import cn.com.util.ContextHolderUtils;
import cn.com.util.RedisUtil;
import cn.com.util.WebUtil;

/**
 * <p>
 * Title:IndexController
 * </p>
 * <p>
 * Description: 登录控制类
 * </p>
 * 
 * @author yangh
 * @date 2017年3月10日下午8:05:16
 */
@RequestMapping("/admin")
@Controller
public class LoginController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Resource
	private LoginService loginService;

	@RequestMapping("/index.html")
	public String index(ModelMap model) {
		try {
			Gson gson = new Gson();
			// 从session中获取用户的属性
			Client client = gson.fromJson(RedisUtil.get(ContextHolderUtils.getSession().getId()), Client.class);
			if (client == null) {
				return "redirect:/admin/login.html";
			}
			DsSystemUserModel systemUserModel = client.getDsSystemUserModel();
			if (systemUserModel == null || StringUtils.isBlank(systemUserModel.getId())) {
				return "redirect:/admin/login.html";
			}
			model.addAttribute("user", systemUserModel);
			// 获取用户权限菜单
			String roleid = systemUserModel.getRoleid();
			Map<String, List<DsSystemFunctionVO>> map = loginService.getRoleMenuPower();
			if (map != null && map.size() > 0) {
				model.addAttribute("menulist", map.get(roleid));
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

		return "main";
	}

	@RequestMapping("/login")
	public String login() {
		return "login";
	}

	@RequestMapping("/loginCheck")
	public @ResponseBody Result loginCheck(String phone, String pwd, String verifyCode, HttpServletRequest request) {
		Result result = new Result(false, ConstantsUtil.HTTPRESPONSE_STATE_ERROR);
		Gson gson = new Gson();
		try {
			if (!verifyCode.equalsIgnoreCase(String.valueOf(request.getSession().getAttribute(ConstantsUtil.SESSION_KEY_OF_RAND_CODE)))) {
				return new Result(false, ConstantsUtil.RANDOM_CODE_ERROR);
			}

			DsSystemUserModel systemUserModel = loginService.getUserByUserName(phone);
			if (null == systemUserModel) {
				return new Result(false, ConstantsUtil.USER_LOGIN_NOTEXITS);
			}

			if (null != systemUserModel) {
				String _pwd = systemUserModel.getPwd();
				if (!StringUtils.equals(_pwd, pwd)) {
					return new Result(false, ConstantsUtil.USER_NAMEORPASS_ERROR);
				}
			}
			Client client = gson.fromJson(RedisUtil.get(ContextHolderUtils.getSession().getId()), Client.class);
			if(null == client) {
				String ip = WebUtil.getIpAddr(request);
				HttpSession session = ContextHolderUtils.getSession();
				String sessionId = session.getId();
				String cuserid = systemUserModel.getId();
				client = new Client();
				client.setIp(ip);
				client.setLogindatetime(new Date());
				client.setDsSystemUserModel(systemUserModel);
				// 先清除无效的信息
				RedisUtil.remove(RedisUtil.get(cuserid));
				RedisUtil.add(cuserid, sessionId);
				RedisUtil.add(sessionId, gson.toJson(client));
			} else {
				String ip = WebUtil.getIpAddr(request);
				HttpSession session = ContextHolderUtils.getSession();
				String sessionId = session.getId();
				String cuserid = systemUserModel.getId();
				client.setIp(ip);
				client.setLogindatetime(new Date());
				client.setDsSystemUserModel(systemUserModel);
				// 先清除无效的信息
				RedisUtil.remove(RedisUtil.get(cuserid));
				RedisUtil.add(cuserid, sessionId);
				RedisUtil.add(sessionId, gson.toJson(client));
			}
			result = new Result(true, systemUserModel.getId(), ConstantsUtil.USER_LOGIN_STATE_TRUE);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return result;
	}

	// 检测当前的sessionid是否一致
	@RequestMapping("/checksession")
	public @ResponseBody Result checkSession() {
		Result result = new Result(false, ConstantsUtil.HTTPRESPONSE_STATE_ERROR);
		HttpSession session = ContextHolderUtils.getSession();
		Gson gson = new Gson();
		Client client = gson.fromJson(RedisUtil.get(ContextHolderUtils.getSession().getId()), Client.class);
		if (session.getId().equals(RedisUtil.get(client.getDsSystemUserModel().getId()))) {
			result = new Result(true, ConstantsUtil.USER_LOGIN_STATE_TRUE, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
		} else {
			result = new Result(false, ConstantsUtil.USER_LOGIN_KICKEDOUT, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
		}
		return result;
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		RedisUtil.remove(ContextHolderUtils.getSession().getId());
		return "redirect:/admin/login.html";
	}

}
