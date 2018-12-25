/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.mbg;

import cn.com.mapper.apdcn.pojo.DsSystemRoleFunction;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunctionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MBGDsSystemRoleFunctionWriteMapper {
    /* @mbggenerated */
    int countByExample(DsSystemRoleFunctionExample example);

    /* @mbggenerated */
    int deleteByExample(DsSystemRoleFunctionExample example);

    /* @mbggenerated */
    int deleteByPrimaryKey(String id);

    /* @mbggenerated */
    int insert(DsSystemRoleFunction record);

    /* @mbggenerated */
    int insertSelective(DsSystemRoleFunction record);

    /* @mbggenerated */
    List<DsSystemRoleFunction> selectByExample(DsSystemRoleFunctionExample example);

    /* @mbggenerated */
    DsSystemRoleFunction selectByPrimaryKey(String id);

    /* @mbggenerated */
    int updateByExampleSelective(@Param("record") DsSystemRoleFunction record, @Param("example") DsSystemRoleFunctionExample example);

    /* @mbggenerated */
    int updateByExample(@Param("record") DsSystemRoleFunction record, @Param("example") DsSystemRoleFunctionExample example);

    /* @mbggenerated */
    int updateByPrimaryKeySelective(DsSystemRoleFunction record);

    /* @mbggenerated */
    int updateByPrimaryKey(DsSystemRoleFunction record);
}