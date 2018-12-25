package cn.com.service.user;

import java.util.List;

import cn.com.mapper.apdcn.model.DsSystemUserModel;
import cn.com.mapper.apdcn.pojo.DsSystemUser;
import cn.com.mapper.apdcn.vo.DsSystemUserVO;

/**
 * 
 * @author MAYUNKUN
 *
 */
public interface DsSystemUserService {

	public DsSystemUserModel getUserByUserName(String username);

	public List<DsSystemUserModel> getListVO(DsSystemUserVO vo);

	public List<DsSystemUser> getList(DsSystemUser pojo, Integer page, Integer size, String orderby);

	public List<DsSystemUser> getList(DsSystemUser pojo);

	public int getListCount(DsSystemUser pojo);

	public DsSystemUser selectByPrimaryKey(DsSystemUser pojo);

	public int delete(DsSystemUser pojo);

	public int insert(DsSystemUser pojo);

	public int update(DsSystemUser pojo);

}
