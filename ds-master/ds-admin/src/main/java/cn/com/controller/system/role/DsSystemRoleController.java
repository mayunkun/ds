package cn.com.controller.system.role;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.mapper.apdcn.model.DsSystemRoleFunctionModel;
import cn.com.mapper.apdcn.model.DsSystemRoleModel;
import cn.com.mapper.apdcn.pojo.DsSystemRole;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunction;
import cn.com.mapper.apdcn.vo.DsSystemFunctionVO;
import cn.com.mapper.apdcn.vo.DsSystemRoleFunctionVO;
import cn.com.mapper.apdcn.vo.DsSystemRoleVO;
import cn.com.model.Grid;
import cn.com.model.Result;
import cn.com.service.function.DsSystemFunctionService;
import cn.com.service.role.DsSystemRoleFunctionService;
import cn.com.service.role.DsSystemRoleFunctionTypeService;
import cn.com.service.role.DsSystemRoleService;
import cn.com.util.ConstantsUtil;
import cn.com.util.UUIDGenerator;

/**
 * <p>
 * Title:RoleController
 * </p>
 * <p>
 * Description: 角色控制类
 * </p>
 * Øß
 * 
 * @author yangh
 * @date 2017年3月17日下午5:00:35
 */
@RequestMapping("/admin/role")
@Controller
public class DsSystemRoleController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private DsSystemRoleService roleService;
	@Resource
	private DsSystemFunctionService dsSystemFunctionService;
	@Resource
	private DsSystemRoleFunctionService dsSystemRoleFunctionService;
	@Resource
	private DsSystemRoleFunctionTypeService dsSystemRoleFunctionTypeService;

	@RequestMapping("/index")
	public String index(Model model, DsSystemRole DsSystemRole) {
		model.addAttribute("menupower", DsSystemRole);
		return "sysmanage/rolemanage/index";
	}

	@RequestMapping("/list")
	public @ResponseBody Grid getlist(DsSystemRoleVO vo) {
		Grid grid = new Grid();
		try {
			grid = new Grid(roleService.getListCount(vo), roleService.getListVO(vo), vo.getPage(), vo.getRows());
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return grid;
	}

	@RequestMapping("/delete")
	public @ResponseBody Result delete(DsSystemRole pojo) {
		Result result = new Result(false, ConstantsUtil.HTTPRESPONSE_STATE_ERROR);
		try {
			roleService.delete(pojo);
			result = new Result(true, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return result;
	}

	@RequestMapping("/modelindex")
	public String modelindex(DsSystemRoleVO vo, DsSystemRole DsSystemRole, Model model) {
		// 排除超级管理员的选项
		vo.setLevel("-1");
		List<DsSystemRoleModel> roleList = roleService.getListVO(vo);
		model.addAttribute("rolelist", roleList);

		if (StringUtils.isNotBlank(vo.getId())) {
			DsSystemRole = roleService.selectByPrimaryKey(DsSystemRole);
		} else {
			DsSystemRole.setLevel("");
		}
		model.addAttribute("dto", DsSystemRole);
		return "sysmanage/rolemanage/model";
	}

	@RequestMapping("/model")
	public @ResponseBody Result model(DsSystemRoleVO vo, DsSystemRole pojo, Model model) {
		Result result = new Result(false, ConstantsUtil.HTTPRESPONSE_STATE_ERROR);
		try {
			String pid = vo.getPid();
			String level = vo.getLevel();
			// 排除超级管理员
			if (StringUtils.equals(pid, "0") && StringUtils.equals(level, "1")) {
				roleService.update(pojo);
				result = new Result(true, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
			} else {
				String roleId = vo.getId();
				List<DsSystemRoleModel> roleList = roleService.getListVO(vo);
				if (StringUtils.isNotBlank(roleId)) {
					for (DsSystemRole role : roleList) {
						if (!StringUtils.equals(role.getId(), roleId)) {
							return new Result(false, ConstantsUtil.USER_ROLE_REG_REPEAT);
						}
					}
					roleService.update(pojo);
				} else {
					if (roleList != null && roleList.size() > 0) {
						return new Result(false, ConstantsUtil.USER_ROLE_REG_REPEAT);
					}
					BeanUtils.copyProperties(vo, pojo);
					pojo.setId(UUIDGenerator.generate());
					roleService.insert(pojo);
				}
				result = new Result(true, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return result;
	}

	@RequestMapping("/permissionindex")
	public String permissionindex(DsSystemRole DsSystemRole, Model model) {
		if (StringUtils.isNotBlank(DsSystemRole.getId())) {
			DsSystemRole = roleService.selectByPrimaryKey(DsSystemRole);
		}
		model.addAttribute("dto", DsSystemRole);
		return "sysmanage/rolemanage/permissionindex";
	}

	@RequestMapping("/permissionmodel")
	public @ResponseBody Result permissionmodel(String id, String menuids, String btns, Model model) {
		Result result = new Result(false, ConstantsUtil.HTTPRESPONSE_STATE_ERROR);
		try {
			if (StringUtils.isNotBlank(id)) {
				DsSystemRoleFunctionVO vo = new DsSystemRoleFunctionVO();
				vo.setRoleid(id);

				Map<String, List<DsSystemRoleFunctionModel>> dsSystemRoleFunctionModelMap = new HashMap<String, List<DsSystemRoleFunctionModel>>();
				List<DsSystemRoleFunctionModel> DsSystemRoleFunctionModelList = dsSystemRoleFunctionService.getListByRoleid(vo);
				for (DsSystemRoleFunctionModel DsSystemRoleFunctionModel : DsSystemRoleFunctionModelList) {
					String roleFunctionId = DsSystemRoleFunctionModel.getId();
					List<DsSystemRoleFunctionModel> _DsSystemRoleFunctionModelList = dsSystemRoleFunctionModelMap.get(roleFunctionId);
					if (_DsSystemRoleFunctionModelList == null || _DsSystemRoleFunctionModelList.size() == 0) {
						_DsSystemRoleFunctionModelList = new ArrayList<DsSystemRoleFunctionModel>();
					}
					_DsSystemRoleFunctionModelList.add(DsSystemRoleFunctionModel);
					dsSystemRoleFunctionModelMap.put(roleFunctionId, _DsSystemRoleFunctionModelList);
				}

				List<DsSystemRoleFunctionModel> rlist = dsSystemRoleFunctionService.getListVO(vo);
				for (DsSystemRoleFunction systemRoleFunction : rlist) {
					List<DsSystemRoleFunctionModel> rftlist = dsSystemRoleFunctionModelMap.get(systemRoleFunction.getId());
					if (rftlist != null && rftlist.size() > 0) {
						for (DsSystemRoleFunctionModel dsSystemRoleFunctionModel : rftlist) {
							dsSystemRoleFunctionTypeService.deleteByRolefunctionid(dsSystemRoleFunctionModel.getId());
						}
					}
				}
				dsSystemRoleFunctionService.deleteByRoleid(id);
			}

			Map<String, String> RoleFunctionMap = new HashMap<String, String>();
			String[] menulist = menuids.split(",");
			if (menulist.length > 0) {
				for (String str : menulist) {
					DsSystemRoleFunction dsSystemRoleFunction = new DsSystemRoleFunction();
					dsSystemRoleFunction.setId(UUIDGenerator.generate());
					dsSystemRoleFunction.setRoleid(id);
					dsSystemRoleFunction.setFunctionid(str);
					dsSystemRoleFunctionService.insert(dsSystemRoleFunction);
					RoleFunctionMap.put(id + "_" + str, dsSystemRoleFunction.getId());
				}
			}
			result = new Result(true, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return result;
	}

	@RequestMapping("/getnodelist")
	public @ResponseBody Result getnodelist(DsSystemRole DsSystemRole) {
		Result result = new Result(false, ConstantsUtil.HTTPRESPONSE_STATE_ERROR);
		try {
			String roleId = DsSystemRole.getId();
			if (!StringUtils.isBlank(roleId)) {
				DsSystemRoleFunctionVO vo = new DsSystemRoleFunctionVO();
				vo.setRoleid(roleId);
				List<DsSystemRoleFunctionModel> rflist = dsSystemRoleFunctionService.getListVO(vo);

				Map<String, List<DsSystemRoleFunctionModel>> DsSystemRoleFunctionModelMap = new HashMap<String, List<DsSystemRoleFunctionModel>>();
				List<DsSystemRoleFunctionModel> DsSystemRoleFunctionModelList = dsSystemRoleFunctionService.getListByRoleid(vo);
				for (DsSystemRoleFunctionModel DsSystemRoleFunctionModel : DsSystemRoleFunctionModelList) {
					String roleFunctionId = DsSystemRoleFunctionModel.getId();
					List<DsSystemRoleFunctionModel> _DsSystemRoleFunctionModelList = DsSystemRoleFunctionModelMap.get(roleFunctionId);
					if (_DsSystemRoleFunctionModelList == null || _DsSystemRoleFunctionModelList.size() == 0) {
						_DsSystemRoleFunctionModelList = new ArrayList<DsSystemRoleFunctionModel>();
					}
					_DsSystemRoleFunctionModelList.add(DsSystemRoleFunctionModel);
					DsSystemRoleFunctionModelMap.put(roleFunctionId, _DsSystemRoleFunctionModelList);
				}
				List<DsSystemFunctionVO> menulist = dsSystemFunctionService.getNodeList(new DsSystemFunctionVO());

				for (DsSystemRoleFunctionModel systemRoleFunction : rflist) {
					List<DsSystemRoleFunctionModel> rftlist = DsSystemRoleFunctionModelMap.get(systemRoleFunction.getId());
					String rftids = "";
					if (rftlist != null && rftlist.size() > 0) {
						for (DsSystemRoleFunctionModel dsSystemRoleFunctionModel : rftlist) {
							String rftid = dsSystemRoleFunctionModel.getFunctiontypeid() + "_" + dsSystemRoleFunctionModel.getFunctionid();
							if (StringUtils.isBlank(rftids)) {
								rftids = rftid;
							} else {
								rftids = rftids + "," + rftid;
							}
						}
					}

					for (DsSystemFunctionVO systemFunctionVO : menulist) {
						String menuid = systemFunctionVO.getId();
						systemFunctionVO.setOpen(true);
						if (menuid.equals(systemRoleFunction.getFunctionid())) {
							systemFunctionVO.setChecked(true);
						}
					}

					String[] rftidlist = rftids.split(",");
					for (String str : rftidlist) {
						for (DsSystemFunctionVO systemFunctionVO : menulist) {
							String menuid = systemFunctionVO.getId();
							systemFunctionVO.setOpen(true);
							if (menuid.equals(str)) {
								systemFunctionVO.setChecked(true);
							}
						}
					}
				}
				result = new Result(true, menulist, ConstantsUtil.HTTPRESPONSE_STATE_TRUE);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}
		return result;
	}

}
