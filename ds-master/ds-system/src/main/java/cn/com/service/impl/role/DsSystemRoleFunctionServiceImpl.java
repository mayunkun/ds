package cn.com.service.impl.role;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mapper.apdcn.custom.DsSystemRoleFunctionWriteMapper;
import cn.com.mapper.apdcn.model.DsSystemRoleFunctionModel;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunction;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunctionExample;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunctionExample.Criteria;
import cn.com.mapper.apdcn.vo.DsSystemRoleFunctionVO;
import cn.com.service.role.DsSystemRoleFunctionService;

@Service("dsSystemRoleFunctionService")
public class DsSystemRoleFunctionServiceImpl implements DsSystemRoleFunctionService{

	@Autowired
	private DsSystemRoleFunctionWriteMapper dsSystemRoleFunctionWriteMapper;
	
	@Override
	public List<DsSystemRoleFunction> getList(DsSystemRoleFunction pojo, Integer page, Integer size, String orderby) {
		// TODO Auto-generated method stub
		DsSystemRoleFunctionExample example = new DsSystemRoleFunctionExample();
		Criteria criteria = example.createCriteria();
		if (StringUtils.isNotBlank(pojo.getId())) {
			criteria.andIdEqualTo(pojo.getId());
		}
		if (page != null) {
			example.setStart((page - 1) * size);
		}
		if (size != null) {
			example.setLimit(size);
		}
		if (StringUtils.isNotBlank(orderby)) {
			example.setOrderByClause(orderby);
		}
		return dsSystemRoleFunctionWriteMapper.selectByExample(example);
	}

	@Override
	public int getListCount(DsSystemRoleFunction pojo) {
		// TODO Auto-generated method stub
		DsSystemRoleFunctionExample example = new DsSystemRoleFunctionExample();
		Criteria criteria = example.createCriteria();
		if (StringUtils.isNotBlank(pojo.getId())) {
			criteria.andIdEqualTo(pojo.getId());
		}
		return dsSystemRoleFunctionWriteMapper.countByExample(example);
	}

	@Override
	public DsSystemRoleFunction selectByPrimaryKey(DsSystemRoleFunction pojo) {
		// TODO Auto-generated method stub
		return dsSystemRoleFunctionWriteMapper.selectByPrimaryKey(pojo.getId());
	}

	@Override
	public DsSystemRoleFunction selectByRoloFunid(DsSystemRoleFunction pojo) {
		// TODO Auto-generated method stub
		return dsSystemRoleFunctionWriteMapper.selectByRoloFunid(pojo);
	}

	@Override
	public List<DsSystemRoleFunctionModel> getListByRoleid(DsSystemRoleFunctionVO vo) {
		// TODO Auto-generated method stub
		return dsSystemRoleFunctionWriteMapper.getListByRoleid(vo);
	}

	@Override
	public boolean delete(DsSystemRoleFunction pojo) {
		// TODO Auto-generated method stub
		return dsSystemRoleFunctionWriteMapper.deleteByPrimaryKey(pojo.getId())>0?true:false;
	}

	@Override
	public boolean deleteByRoleid(String roleid) {
		// TODO Auto-generated method stub
		return dsSystemRoleFunctionWriteMapper.deleteByRoleid(roleid)>0?true:false;
	}

	@Override
	public boolean insert(DsSystemRoleFunction pojo) {
		// TODO Auto-generated method stub
		return dsSystemRoleFunctionWriteMapper.insert(pojo)>0?true:false;
	}

	@Override
	public boolean update(DsSystemRoleFunction pojo) {
		// TODO Auto-generated method stub
		return dsSystemRoleFunctionWriteMapper.updateByPrimaryKeySelective(pojo)>0?true:false;
	}

	@Override
	public List<DsSystemRoleFunctionModel> getListVO(DsSystemRoleFunctionVO vo) {
		// TODO Auto-generated method stub
		return dsSystemRoleFunctionWriteMapper.getListVO(vo);
	}

}
