package cn.com.mapper.apdcn.custom;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.mapper.apdcn.mbg.MBGDsSystemRoleFunctionWriteMapper;
import cn.com.mapper.apdcn.model.DsSystemRoleFunctionModel;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunction;
import cn.com.mapper.apdcn.vo.DsSystemRoleFunctionVO;

public interface DsSystemRoleFunctionWriteMapper extends MBGDsSystemRoleFunctionWriteMapper {
	
	public List<DsSystemRoleFunctionModel> getListVO(DsSystemRoleFunctionVO vo);
	
	public int getListCount(DsSystemRoleFunction pojo);

	public DsSystemRoleFunction selectByRoloFunid(DsSystemRoleFunction pojo);

	public List<DsSystemRoleFunctionModel> getListByRoleid(DsSystemRoleFunctionVO vo);

	public int deleteByRoleid(@Param("roleid") String roleid);
}