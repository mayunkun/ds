/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.mbg;

import cn.com.mapper.apdcn.pojo.DsSystemRole;
import cn.com.mapper.apdcn.pojo.DsSystemRoleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MBGDsSystemRoleWriteMapper {
    /* @mbggenerated */
    int countByExample(DsSystemRoleExample example);

    /* @mbggenerated */
    int deleteByExample(DsSystemRoleExample example);

    /* @mbggenerated */
    int deleteByPrimaryKey(String id);

    /* @mbggenerated */
    int insert(DsSystemRole record);

    /* @mbggenerated */
    int insertSelective(DsSystemRole record);

    /* @mbggenerated */
    List<DsSystemRole> selectByExample(DsSystemRoleExample example);

    /* @mbggenerated */
    DsSystemRole selectByPrimaryKey(String id);

    /* @mbggenerated */
    int updateByExampleSelective(@Param("record") DsSystemRole record, @Param("example") DsSystemRoleExample example);

    /* @mbggenerated */
    int updateByExample(@Param("record") DsSystemRole record, @Param("example") DsSystemRoleExample example);

    /* @mbggenerated */
    int updateByPrimaryKeySelective(DsSystemRole record);

    /* @mbggenerated */
    int updateByPrimaryKey(DsSystemRole record);
}