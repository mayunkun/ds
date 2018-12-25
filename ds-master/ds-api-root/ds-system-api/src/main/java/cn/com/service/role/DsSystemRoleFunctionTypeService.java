package cn.com.service.role;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.mapper.apdcn.model.DsSystemRoleFunctionTypeModel;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunctionType;
import cn.com.mapper.apdcn.vo.DsSystemRoleFunctionTypeVO;

/**
 * 角色功能类型相关
 * @author I'amour solitaire
 *
 */
public interface DsSystemRoleFunctionTypeService {
	
	public List<DsSystemRoleFunctionTypeModel> getListVO(DsSystemRoleFunctionTypeVO vo);

	public int getListCount(DsSystemRoleFunctionType pojo);

	public int deleteByRolefunctionid(@Param("rolefunctionid") String rolefunctionid);
}
