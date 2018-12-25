package cn.com.service.role;

import java.util.List;

import cn.com.mapper.apdcn.model.DsSystemRoleFunctionModel;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunction;
import cn.com.mapper.apdcn.vo.DsSystemRoleFunctionVO;

/**
 * 角色功能相关
 * @author I'amour solitaire
 *
 */
public interface DsSystemRoleFunctionService {
	
	public List<DsSystemRoleFunctionModel> getListVO(DsSystemRoleFunctionVO vo);
	
	public List<DsSystemRoleFunction> getList(DsSystemRoleFunction pojo, Integer page, Integer size, String orderby);

	public int getListCount(DsSystemRoleFunction pojo);

	public DsSystemRoleFunction selectByPrimaryKey(DsSystemRoleFunction pojo);

	public DsSystemRoleFunction selectByRoloFunid(DsSystemRoleFunction rf);

	public List<DsSystemRoleFunctionModel> getListByRoleid(DsSystemRoleFunctionVO vo);

	public boolean delete(DsSystemRoleFunction pojo);

	public boolean deleteByRoleid(String roleid);
	
	public boolean insert(DsSystemRoleFunction pojo);

	public boolean update(DsSystemRoleFunction pojo);
}
