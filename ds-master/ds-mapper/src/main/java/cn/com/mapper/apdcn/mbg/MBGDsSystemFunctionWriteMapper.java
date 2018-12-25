/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.mbg;

import cn.com.mapper.apdcn.pojo.DsSystemFunction;
import cn.com.mapper.apdcn.pojo.DsSystemFunctionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MBGDsSystemFunctionWriteMapper {
    /* @mbggenerated */
    int countByExample(DsSystemFunctionExample example);

    /* @mbggenerated */
    int deleteByExample(DsSystemFunctionExample example);

    /* @mbggenerated */
    int deleteByPrimaryKey(String id);

    /* @mbggenerated */
    int insert(DsSystemFunction record);

    /* @mbggenerated */
    int insertSelective(DsSystemFunction record);

    /* @mbggenerated */
    List<DsSystemFunction> selectByExample(DsSystemFunctionExample example);

    /* @mbggenerated */
    DsSystemFunction selectByPrimaryKey(String id);

    /* @mbggenerated */
    int updateByExampleSelective(@Param("record") DsSystemFunction record, @Param("example") DsSystemFunctionExample example);

    /* @mbggenerated */
    int updateByExample(@Param("record") DsSystemFunction record, @Param("example") DsSystemFunctionExample example);

    /* @mbggenerated */
    int updateByPrimaryKeySelective(DsSystemFunction record);

    /* @mbggenerated */
    int updateByPrimaryKey(DsSystemFunction record);
}