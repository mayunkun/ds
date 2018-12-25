package cn.com.service.role;

import java.util.List;

import cn.com.mapper.apdcn.model.DsSystemRoleModel;
import cn.com.mapper.apdcn.pojo.DsSystemRole;
import cn.com.mapper.apdcn.vo.DsSystemRoleVO;

/**
 * 角色相关
 * @author I'amour solitaire
 *
 */
public interface DsSystemRoleService {
	
	public List<DsSystemRoleModel> getListVO(DsSystemRoleVO vo);

	public List<DsSystemRole> getList(DsSystemRoleVO vo, Integer page, Integer size, String orderby);

	public int getListCount(DsSystemRoleVO vo);

	public DsSystemRole selectByPrimaryKey(DsSystemRole pojo);

	public boolean delete(DsSystemRole pojo);

	public boolean insert(DsSystemRole pojo);

	public boolean update(DsSystemRole pojo);
}
