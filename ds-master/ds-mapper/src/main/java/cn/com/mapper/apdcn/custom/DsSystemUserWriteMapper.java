package cn.com.mapper.apdcn.custom;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.com.mapper.apdcn.mbg.MBGDsSystemUserWriteMapper;
import cn.com.mapper.apdcn.model.DsSystemUserModel;
import cn.com.mapper.apdcn.vo.DsSystemUserVO;

public interface DsSystemUserWriteMapper extends MBGDsSystemUserWriteMapper {
	
	public List<DsSystemUserModel> getListVO(DsSystemUserVO vo);

	public DsSystemUserModel loginUser(@Param("phone") String phone, @Param("pwd") String pwd);

	public DsSystemUserModel loginUserByNameAndPwd(@Param("name") String name, @Param("pwd") String pwd);

	public DsSystemUserModel getUserByUserName(@Param("username") String username);
}