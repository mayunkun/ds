package cn.com.service.impl.user;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mapper.apdcn.custom.DsSystemUserWriteMapper;
import cn.com.mapper.apdcn.model.DsSystemUserModel;
import cn.com.mapper.apdcn.pojo.DsSystemUser;
import cn.com.mapper.apdcn.pojo.DsSystemUserExample;
import cn.com.mapper.apdcn.pojo.DsSystemUserExample.Criteria;
import cn.com.mapper.apdcn.vo.DsSystemUserVO;
import cn.com.service.user.DsSystemUserService;

@Service("dsSystemUserService")
public class DsSystemUserServiceImpl implements DsSystemUserService{

	@Autowired
	private DsSystemUserWriteMapper dsSystemUserWriteMapper;
	
	@Override
	public DsSystemUserModel getUserByUserName(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DsSystemUserModel> getListVO(DsSystemUserVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DsSystemUser> getList(DsSystemUser vo, Integer page, Integer size, String orderby) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DsSystemUser> getList(DsSystemUser pojo) {
		// TODO Auto-generated method stub
		DsSystemUserExample example = new DsSystemUserExample();
		Criteria criteria = example.createCriteria();
		if (StringUtils.isNotBlank(pojo.getId())) {
			criteria.andIdEqualTo(pojo.getId());
		}
		return dsSystemUserWriteMapper.selectByExample(example);
	}

	@Override
	public int getListCount(DsSystemUser pojo) {
		// TODO Auto-generated method stub
		DsSystemUserExample example = new DsSystemUserExample();
		Criteria criteria = example.createCriteria();
		if (StringUtils.isNotBlank(pojo.getId())) {
			criteria.andIdEqualTo(pojo.getId());
		}
		return dsSystemUserWriteMapper.countByExample(example);
	}

	@Override
	public DsSystemUser selectByPrimaryKey(DsSystemUser pojo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(DsSystemUser pojo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(DsSystemUser pojo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(DsSystemUser pojo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
