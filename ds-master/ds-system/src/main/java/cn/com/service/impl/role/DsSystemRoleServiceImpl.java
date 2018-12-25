package cn.com.service.impl.role;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mapper.apdcn.custom.DsSystemRoleWriteMapper;
import cn.com.mapper.apdcn.model.DsSystemRoleModel;
import cn.com.mapper.apdcn.pojo.DsSystemRole;
import cn.com.mapper.apdcn.pojo.DsSystemRoleExample;
import cn.com.mapper.apdcn.pojo.DsSystemRoleExample.Criteria;
import cn.com.mapper.apdcn.vo.DsSystemRoleVO;
import cn.com.service.role.DsSystemRoleService;

@Service("dsSystemRoleService")
public class DsSystemRoleServiceImpl implements DsSystemRoleService{

	@Autowired
	private DsSystemRoleWriteMapper dsSystemRoleWriteMapper;

	@Override
	public List<DsSystemRoleModel> getListVO(DsSystemRoleVO vo) {
		// TODO Auto-generated method stub
		return dsSystemRoleWriteMapper.getListVO(vo);
	}

	@Override
	public List<DsSystemRole> getList(DsSystemRoleVO vo, Integer page, Integer size, String orderby) {
		// TODO Auto-generated method stub
		DsSystemRoleExample example = new DsSystemRoleExample();
		Criteria criteria = example.createCriteria();
		if (StringUtils.isNotBlank(vo.getName())) {
			criteria.andNameLike(vo.getName());
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
		return dsSystemRoleWriteMapper.selectByExample(example);
	}

	@Override
	public int getListCount(DsSystemRoleVO vo) {
		// TODO Auto-generated method stub
		DsSystemRoleExample example = new DsSystemRoleExample();
		Criteria criteria = example.createCriteria();
		if (StringUtils.isNotBlank(vo.getName())) {
			criteria.andNameLike(vo.getName());
		}
		return dsSystemRoleWriteMapper.countByExample(example);
	}

	@Override
	public DsSystemRole selectByPrimaryKey(DsSystemRole pojo) {
		// TODO Auto-generated method stub
		return dsSystemRoleWriteMapper.selectByPrimaryKey(pojo.getId());
	}

	@Override
	public boolean delete(DsSystemRole pojo) {
		// TODO Auto-generated method stub
		return dsSystemRoleWriteMapper.deleteByPrimaryKey(pojo.getId())>0?true:false;
	}

	@Override
	public boolean insert(DsSystemRole pojo) {
		// TODO Auto-generated method stub
		return dsSystemRoleWriteMapper.insert(pojo)>0?true:false;
	}

	@Override
	public boolean update(DsSystemRole pojo) {
		// TODO Auto-generated method stub
		return dsSystemRoleWriteMapper.updateByPrimaryKey(pojo)>0?true:false;
	}
	

}
