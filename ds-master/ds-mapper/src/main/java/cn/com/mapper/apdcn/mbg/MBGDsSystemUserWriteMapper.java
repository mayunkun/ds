/**
 * @mbggenerated
 * @author kehui
 */
package cn.com.mapper.apdcn.mbg;

import cn.com.mapper.apdcn.pojo.DsSystemUser;
import cn.com.mapper.apdcn.pojo.DsSystemUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MBGDsSystemUserWriteMapper {
    /* @mbggenerated */
    int countByExample(DsSystemUserExample example);

    /* @mbggenerated */
    int deleteByExample(DsSystemUserExample example);

    /* @mbggenerated */
    int deleteByPrimaryKey(String id);

    /* @mbggenerated */
    int insert(DsSystemUser record);

    /* @mbggenerated */
    int insertSelective(DsSystemUser record);

    /* @mbggenerated */
    List<DsSystemUser> selectByExample(DsSystemUserExample example);

    /* @mbggenerated */
    DsSystemUser selectByPrimaryKey(String id);

    /* @mbggenerated */
    int updateByExampleSelective(@Param("record") DsSystemUser record, @Param("example") DsSystemUserExample example);

    /* @mbggenerated */
    int updateByExample(@Param("record") DsSystemUser record, @Param("example") DsSystemUserExample example);

    /* @mbggenerated */
    int updateByPrimaryKeySelective(DsSystemUser record);

    /* @mbggenerated */
    int updateByPrimaryKey(DsSystemUser record);
}