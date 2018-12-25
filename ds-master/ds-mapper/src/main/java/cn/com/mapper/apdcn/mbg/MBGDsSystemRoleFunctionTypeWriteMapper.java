/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.mbg;

import cn.com.mapper.apdcn.pojo.DsSystemRoleFunctionType;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunctionTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MBGDsSystemRoleFunctionTypeWriteMapper {
    /* @mbggenerated */
    int countByExample(DsSystemRoleFunctionTypeExample example);

    /* @mbggenerated */
    int deleteByExample(DsSystemRoleFunctionTypeExample example);

    /* @mbggenerated */
    int deleteByPrimaryKey(String id);

    /* @mbggenerated */
    int insert(DsSystemRoleFunctionType record);

    /* @mbggenerated */
    int insertSelective(DsSystemRoleFunctionType record);

    /* @mbggenerated */
    List<DsSystemRoleFunctionType> selectByExample(DsSystemRoleFunctionTypeExample example);

    /* @mbggenerated */
    DsSystemRoleFunctionType selectByPrimaryKey(String id);

    /* @mbggenerated */
    int updateByExampleSelective(@Param("record") DsSystemRoleFunctionType record, @Param("example") DsSystemRoleFunctionTypeExample example);

    /* @mbggenerated */
    int updateByExample(@Param("record") DsSystemRoleFunctionType record, @Param("example") DsSystemRoleFunctionTypeExample example);

    /* @mbggenerated */
    int updateByPrimaryKeySelective(DsSystemRoleFunctionType record);

    /* @mbggenerated */
    int updateByPrimaryKey(DsSystemRoleFunctionType record);
}