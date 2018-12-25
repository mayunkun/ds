package cn.com.service.impl.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mapper.apdcn.custom.DsSystemFunctionWriteMapper;
import cn.com.mapper.apdcn.custom.DsSystemRoleWriteMapper;
import cn.com.mapper.apdcn.custom.DsSystemUserWriteMapper;
import cn.com.mapper.apdcn.model.DsSystemRoleModel;
import cn.com.mapper.apdcn.model.DsSystemUserModel;
import cn.com.mapper.apdcn.pojo.DsSystemUser;
import cn.com.mapper.apdcn.vo.DsSystemFunctionVO;
import cn.com.mapper.apdcn.vo.DsSystemRoleVO;
import cn.com.mapper.system.vo.MenuPowerVO;
import cn.com.service.login.LoginService;
import cn.com.util.ConstantsUtil;
import cn.com.util.UUIDGenerator;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	@Autowired
	private DsSystemRoleWriteMapper dsSystemRoleWriteMapper;
	@Autowired
	private DsSystemFunctionWriteMapper dsSystemFunctionWriteMapper;
	@Autowired
	private DsSystemUserWriteMapper dsSystemUserWriteMapper;
	
	@Override
	public Map<String, List<DsSystemFunctionVO>> getRoleMenuPower() {
		Map<String, List<DsSystemFunctionVO>> roleMenuPowerMap = new HashMap<String, List<DsSystemFunctionVO>>();
		List<DsSystemRoleModel> dsSystemRoleList = dsSystemRoleWriteMapper.getListVO(new DsSystemRoleVO());
		for (DsSystemRoleModel model : dsSystemRoleList) {
			String roleid = model.getId();
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

	@Override
	public List<MenuPowerVO> getMenuPowerListByRoleId(MenuPowerVO menuPowerVO) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.getMenuPowerListByRoleId(menuPowerVO);
	}
	
	@Override
	public List<DsSystemFunctionVO> getVOList(DsSystemFunctionVO vo) {
		// TODO Auto-generated method stub
		return dsSystemFunctionWriteMapper.getVOList(vo);
	}

	@Override
	public DsSystemUserModel getUserByUserName(String username) {
		// TODO Auto-generated method stub
		return dsSystemUserWriteMapper.getUserByUserName(username);
	}

	@Override
	public int testTrans() {
		// TODO Auto-generated method stub
		DsSystemUser record = new DsSystemUser();
		record.setId(UUIDGenerator.generate());
		record.setName("rpc事务测试");
		dsSystemUserWriteMapper.insert(record);
		throw new RuntimeException();
	}

}
