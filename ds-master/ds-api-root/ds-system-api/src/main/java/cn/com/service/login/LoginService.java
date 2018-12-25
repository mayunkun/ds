package cn.com.service.login;

import java.util.List;
import java.util.Map;

import cn.com.mapper.apdcn.model.DsSystemUserModel;
import cn.com.mapper.apdcn.vo.DsSystemFunctionVO;
import cn.com.mapper.system.vo.MenuPowerVO;

/**
 * 登录相关
 * @author I'amour solitaire
 *
 */
public interface LoginService {
	
	/**
	 * 获取用户权限菜单
	 * @return
	 */
	public Map<String, List<DsSystemFunctionVO>> getRoleMenuPower();
	
	/**
	 * 获取角色权限菜单
	 * @param menuPowerVO
	 * @return
	 */
	public List<MenuPowerVO> getMenuPowerListByRoleId(MenuPowerVO menuPowerVO);
	
	public List<DsSystemFunctionVO> getVOList(DsSystemFunctionVO vo);
	
	/**
	 * 获取登录用户信息
	 * @param username
	 * @return
	 */
	public DsSystemUserModel getUserByUserName(String username);
	
	/**
	 * 事务测试
	 * @return
	 */
	public int testTrans();
}
