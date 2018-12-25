package cn.com.service.function;

import java.util.List;
import java.util.Map;

import cn.com.mapper.apdcn.model.DsSystemFunctionModel;
import cn.com.mapper.apdcn.pojo.DsSystemFunction;
import cn.com.mapper.apdcn.vo.DsSystemFunctionVO;
import cn.com.mapper.system.vo.MenuPowerVO;

/**
 * 角色相关
 * @author I'amour solitaire
 *
 */
public interface DsSystemFunctionService {
	

	public List<DsSystemFunctionModel> getListVO(DsSystemFunctionVO DsSystemFunctionVO);

	public int getListVOCount(DsSystemFunctionVO DsSystemFunctionVO);

	public List<DsSystemFunction> getList(DsSystemFunction vo, Integer page, Integer size, String orderby);

	public List<DsSystemFunction> getList(DsSystemFunction vo);

	public int getListCount(DsSystemFunction vo);

	public DsSystemFunction selectByPrimaryKey(DsSystemFunction vo);

	public int delete(DsSystemFunction vo);

	public int insert(DsSystemFunction vo);

	public int update(DsSystemFunction vo);

	public List<DsSystemFunctionVO> getPList(DsSystemFunctionVO tf);

	public List<DsSystemFunctionVO> getNodeList(DsSystemFunctionVO vo);

	public List<DsSystemFunctionVO> getVOList(DsSystemFunctionVO vo);

	public List<MenuPowerVO> getSuperMenuPowerList(MenuPowerVO menuPowerVO);

	public List<MenuPowerVO> getMenuPowerListByRoleId(MenuPowerVO menuPowerVO);

	public Map<String, List<DsSystemFunctionVO>> getRoleMenuPower();
}
