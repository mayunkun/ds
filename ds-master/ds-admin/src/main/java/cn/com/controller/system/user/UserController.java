package cn.com.controller.system.user;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.mapper.apdcn.pojo.DsSystemUser;
import cn.com.mapper.apdcn.vo.DsSystemUserVO;
import cn.com.model.Grid;
import cn.com.service.user.DsSystemUserService;
import cn.com.util.BaseUtil;

@Controller
@RequestMapping("/admin/user")
public class UserController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private DsSystemUserService dsSystemUserService;

	@RequestMapping("/index")
	public String index(DsSystemUser DsSystemUser, Model model) {
		return "sysmanage/usermanage/index";
	}
	
	@RequestMapping("/model")
	public String model(DsSystemUser pojo, Model model) {
		List<DsSystemUser> list = dsSystemUserService.getList(pojo);
		model.addAttribute("dto", list.size()>0?list.get(0):null);
		return "sysmanage/usermanage/model";
	}

	@RequestMapping("/list")
	public @ResponseBody Grid getlist(DsSystemUserVO vo) {
		Grid grid = new Grid();
		try {
			DsSystemUser pojo = new DsSystemUser();
			BaseUtil.copyProperties(pojo, vo);
			int count = dsSystemUserService.getListCount(pojo);
			grid = new Grid(count, dsSystemUserService.getList(pojo), vo.getPage(), vo.getRows());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return grid;
	}

//	@RequestMapping("/delete")
//	public @ResponseBody Result delete(DsSystemUser DsSystemUser) {
//		Result result = new Result(false, ConstantsUtil.HTTPRESPONSE_STATE_ERROR);
//		try {
//			DsSystemUserApi.delete(DsSystemUser);
//
//			ClientManager clientManager = ClientManager.getInstance();
////			clientManager.removeClinet(ContextHolderUtils.getSession().getId());
////			clientManager.removeSessionMap(DsSystemUser.getId());
//			String str = null;
//			if(StringUtils.isNotEmpty(str = clientManager.getSessionIDMap().get(DsSystemUser.getId()))) {
//				clientManager.removeClinet(str);
//				clientManager.removeSessionMap(DsSystemUser.getId());
//			}
//			result = new Result(true, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
//		} catch (Exception e) {
//			logger.error(e.getMessage(), e);
//		}
//		return result;
//	}
//
//	@RequestMapping("/modelindex")
//	public String modelindex(DsSystemUserVO vo, String redirect, Model model) {
//		if (StringUtils.isNotBlank(vo.getId())) {
////			DsSystemUser = DsSystemUserApi.selectByPrimaryKey(DsSystemUser);
//			List<DsSystemUserModel> list = DsSystemUserApi.getListVO(vo);
//			DsSystemUserModel DsSystemUserModel = list.size()>0?list.get(0):null;
//			BaseUtil.copyProperties(vo, DsSystemUserModel);
//		}
//
//		model.addAttribute("dto", vo);
//		model.addAttribute("redirect", redirect);
//		
//		// 角色信息
//		model.addAttribute("roles", DsSystemRoleApi.getList(new DsSystemRoleModel()));
//		// 加载省份信息
//		model.addAttribute("provinces", ConstantsUtil.AREA_MAP.get("0"));
//		if (vo != null) {
//			String address = vo.getAddress();
//			String province = "", city = "", county = "", addrDetail = "";
//			if (StringUtils.isNotBlank(address) && address.indexOf(",") > -1) {
//				String[] tmp = address.split(",");
//				switch (tmp.length) {
//				case 1:
//					province = tmp[0];
//					break;
//				case 2:
//					province = tmp[0];
//					city = tmp[1];
//					break;
//				case 3:
//					province = tmp[0];
//					city = tmp[1];
//					county = tmp[2];
//					break;
//				case 4:
//					province = tmp[0];
//					city = tmp[1];
//					county = tmp[2];
//					addrDetail = tmp[3];
//					break;
//				}
//			}
//			model.addAttribute("province", province);
//			model.addAttribute("city", city);
//			model.addAttribute("county", county);
//			model.addAttribute("addrDetail", addrDetail);
//
//			if (StringUtils.isNotBlank(province)) {
//				DsArea DsArea = new DsArea();
//				DsArea.setName(province);
//				model.addAttribute("citys", getData(DsArea));
//			}
//
//			if (StringUtils.isNotBlank(city)) {
//				DsArea DsArea = new DsArea();
//				DsArea.setName(city);
//				model.addAttribute("countys", getData(DsArea));
//			}
//		}
//
//		return "sysmanage/usermanage/model";
//	}
//
//	public List<DsArea> getData(DsArea DsArea) {
//		List<DsArea> prvinces = DsAreaApi.getList(DsArea);
//		if (prvinces.size() > 0) {
//			DsArea = prvinces.get(0);
//			DsArea area = new DsArea();
//			area.setParentId(DsArea.getId());
//			return DsAreaApi.getList(area);
//		}
//		return null;
//	}
//
//	@RequestMapping("/model")
//	public @ResponseBody Result model(DsSystemUserVO vo, String redirect, Model model, HttpServletRequest request) {
//		Result result = new Result(false, ConstantsUtil.HTTPRESPONSE_STATE_ERROR);
//		try {
//			ClientManager clientManager = ClientManager.getInstance();
//			HttpSession session = ContextHolderUtils.getSession();
//			String sessionId = session.getId();
//			Client client = clientManager.getClient(sessionId);
////			DsSystemUserModel systemUserModel = client.getDsSystemUserModel();
////			if (systemUserModel != null && StringUtils.isNoneBlank(DsSystemUser.getId()) && !StringUtils.equals(systemUserModel.getId(), DsSystemUser.getId())) {
////				return new Result(false, ConstantsUtil.USER_REG_REPEAT);
////			}
//			DsSystemUserApi.operate(vo, vo.getRoleid());
//
//			DsSystemUserModel DsSystemUserModel = new DsSystemUserModel();
//			BaseUtil.copyProperties(DsSystemUserModel, vo);
//			client.setDsSystemUserModel(DsSystemUserModel);
//			clientManager.addClinet(sessionId, client);
//			clientManager.addSessionMap(vo.getId(), sessionId);
//
//			result = new Result(true, redirect, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
//		} catch (Exception e) {
//			logger.error(e.getMessage(), e);
//		}
//		return result;
//	}

}
