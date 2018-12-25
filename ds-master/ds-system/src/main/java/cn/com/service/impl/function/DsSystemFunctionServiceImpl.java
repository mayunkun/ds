package cn.com.service.impl.function;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;

import cn.com.mapper.apdcn.custom.DsSystemFunctionWriteMapper;
import cn.com.mapper.apdcn.custom.DsSystemRoleWriteMapper;
import cn.com.mapper.apdcn.model.DsSystemFunctionModel;
import cn.com.mapper.apdcn.model.DsSystemRoleModel;
import cn.com.mapper.apdcn.pojo.DsSystemFunction;
import cn.com.mapper.apdcn.pojo.DsSystemFunctionExample;
import cn.com.mapper.apdcn.vo.DsSystemFunctionVO;
import cn.com.mapper.apdcn.vo.DsSystemRoleVO;
import cn.com.mapper.system.vo.MenuPowerVO;
import cn.com.service.function.DsSystemFunctionService;
import cn.com.util.ConstantsUtil;
import cn.com.util.UUIDGenerator;

@Service("dsSystemFunctionService")
public class DsSystemFunctionServiceImpl implements DsSystemFunctionService {

	@Resource
	private  DsSystemFunctionWriteMapper dsSystemFunctionWriteMapper;
	@Resource
	private DsSystemFunctionWriteMapper DsSystemFunctionWriteMapper;
	@Resource
	private DsSystemRoleWriteMapper tjSystemRoleWriteMapper;

	public List<DsSystemFunctionModel> getListVO(DsSystemFunctionVO vo) {
		return dsSystemFunctionWriteMapper.getListVO(vo);
	}

	public int getListVOCount(DsSystemFunctionVO DsSystemFunctionVO) {
		return dsSystemFunctionWriteMapper.getListVOCount(DsSystemFunctionVO);
	}

	@Override
	public List<DsSystemFunction> getList(DsSystemFunction vo, Integer page, Integer size, String orderby) {
		DsSystemFunctionExample example = new DsSystemFunctionExample();
		if (page != null) {
			example.setStart((page - 1) * size);
		}
		if (size != null) {
			example.setLimit(size);
		}

		if (StringUtils.isBlank(orderby)) {
			example.setOrderByClause(orderby);
		}
		return dsSystemFunctionWriteMapper.selectByExample(example);
	}

	@Override
	public List<DsSystemFunction> getList(DsSystemFunction vo) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.getList(vo);
	}

	@Override
	public int getListCount(DsSystemFunction vo) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.getListCount(vo);
	}

	@Override
	public DsSystemFunction selectByPrimaryKey(DsSystemFunction vo) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.selectByPrimaryKey(vo.getId());
	}

	@Override
	public int delete(DsSystemFunction vo) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.deleteByPrimaryKey(vo.getId());
	}

	@Override
	public int insert(DsSystemFunction vo) {
		// TODO Auto-generated method stub
		String id = UUIDGenerator.generate();
		vo.setId(id);
		return dsSystemFunctionWriteMapper.insert(vo);
	}

	@Override
	public int update(DsSystemFunction vo) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.updateByPrimaryKey(vo);
	}

	public List<DsSystemFunctionVO> getPList(DsSystemFunctionVO tf) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.getPList(tf);
	}

	public List<DsSystemFunctionVO> getNodeList(DsSystemFunctionVO vo) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.getNodeList(vo);
	}

	public List<DsSystemFunctionVO> getVOList(DsSystemFunctionVO vo) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.getVOList(vo);
	}

	public List<MenuPowerVO> getSuperMenuPowerList(MenuPowerVO menuPowerVO) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.getSuperMenuPowerList(menuPowerVO);
	}

	public List<MenuPowerVO> getMenuPowerListByRoleId(MenuPowerVO menuPowerVO) {
		return dsSystemFunctionWriteMapper.getMenuPowerListByRoleId(menuPowerVO);
	}

	public Map<String, List<DsSystemFunctionVO>> getRoleMenuPower() {
		Map<String, List<DsSystemFunctionVO>> roleMenuPowerMap = new HashMap<String, List<DsSystemFunctionVO>>();
		List<DsSystemRoleModel> tjSystemRoleList = tjSystemRoleWriteMapper.getListVO(new DsSystemRoleVO());
		for (DsSystemRoleModel DsSystemRoleVO : tjSystemRoleList) {
			String roleid = DsSystemRoleVO.getId();
			// 查询菜单列表
			MenuPowerVO menuPowerVO = new MenuPowerVO();
			List<MenuPowerVO> menupowerList = new ArrayList<MenuPowerVO>();
			// 获取用户权限权限
			menuPowerVO.setRoleid(roleid);
			menupowerList = getMenuPowerListByRoleId(menuPowerVO);
			List<DsSystemFunctionVO> menuplist = new ArrayList<DsSystemFunctionVO>();

			DsSystemFunctionVO DsSystemFunctionVO = new DsSystemFunctionVO();
			DsSystemFunctionVO.setRoleid(roleid);
			DsSystemFunctionVO.setPid("0");
			DsSystemFunctionVO.setPiconcode(ConstantsUtil.SYSTEM_TYPEGROUP_ID_BTNMENUICON);
			menuplist = getVOList(DsSystemFunctionVO);

			DsSystemFunctionVO.setPid("-1");
			DsSystemFunctionVO.setPiconcode(ConstantsUtil.SYSTEM_TYPEGROUP_ID_BTNMENUICON);
			List<DsSystemFunctionVO> menuclist = getVOList(DsSystemFunctionVO);

			// 子级菜单加权限
			for (MenuPowerVO mnuPowerVO : menupowerList) {
				String functionid = mnuPowerVO.getRolefunctionid();
				String typecode = mnuPowerVO.getTypecode();
				for (DsSystemFunctionVO childFunctionVO : menuclist) {
					if (functionid.equals(childFunctionVO.getId())) {
						String url = childFunctionVO.getUrl();
						if (url.indexOf("?") == -1) {
							url = url + "?" + typecode + "=true";
						} else {
							url = url + "&" + typecode + "=true";
						}
						childFunctionVO.setUrl(url);
					}
				}
			}

			// 把子级菜单添加到父级菜单的 childList上
			for (DsSystemFunctionVO fatherFunctionVO : menuplist) {
				String pid = fatherFunctionVO.getId();
				List<DsSystemFunctionVO> childlist = new ArrayList<DsSystemFunctionVO>();
				for (DsSystemFunctionVO childFunctionVO : menuclist) {
					if (pid.equals(childFunctionVO.getPid())) {
						DsSystemFunctionVO functionVO = new DsSystemFunctionVO();
						BeanUtils.copyProperties(childFunctionVO, functionVO);
						childlist.add(functionVO);
					}
				}
				fatherFunctionVO.setChildlist(childlist);
			}
			roleMenuPowerMap.put(roleid, menuplist);
		}
		return roleMenuPowerMap;
	}
	
}
