package cn.com.mapper.apdcn.custom;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.mapper.apdcn.mbg.MBGDsSystemRoleFunctionTypeWriteMapper;
import cn.com.mapper.apdcn.model.DsSystemRoleFunctionTypeModel;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunctionType;
import cn.com.mapper.apdcn.vo.DsSystemRoleFunctionTypeVO;

public interface DsSystemRoleFunctionTypeWriteMapper extends MBGDsSystemRoleFunctionTypeWriteMapper {
	
	public List<DsSystemRoleFunctionTypeModel> getListVO(DsSystemRoleFunctionTypeVO vo);

	public int getListCount(DsSystemRoleFunctionType pojo);

	public int deleteByRolefunctionid(@Param("rolefunctionid") String rolefunctionid);
}