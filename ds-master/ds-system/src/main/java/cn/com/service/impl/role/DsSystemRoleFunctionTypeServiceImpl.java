package cn.com.service.impl.role;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mapper.apdcn.custom.DsSystemRoleFunctionTypeWriteMapper;
import cn.com.mapper.apdcn.model.DsSystemRoleFunctionTypeModel;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunctionType;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunctionTypeExample;
import cn.com.mapper.apdcn.pojo.DsSystemRoleFunctionTypeExample.Criteria;
import cn.com.mapper.apdcn.vo.DsSystemRoleFunctionTypeVO;
import cn.com.service.role.DsSystemRoleFunctionTypeService;

@Service("dsSystemRoleFunctionTypeService")
public class DsSystemRoleFunctionTypeServiceImpl implements DsSystemRoleFunctionTypeService{

	@Autowired
	private DsSystemRoleFunctionTypeWriteMapper dsSystemRoleFunctionTypeWriteMapper;

	@Override
	public List<DsSystemRoleFunctionTypeModel> getListVO(DsSystemRoleFunctionTypeVO vo) {
		// TODO Auto-generated method stub
		return dsSystemRoleFunctionTypeWriteMapper.getListVO(vo);
	}

	@Override
	public int getListCount(DsSystemRoleFunctionType pojo) {
		// TODO Auto-generated method stub
		DsSystemRoleFunctionTypeExample example = new DsSystemRoleFunctionTypeExample();
		Criteria criteria = example.createCriteria();
		if(StringUtils.isBlank(pojo.getId())) {
			criteria.andIdEqualTo(pojo.getId());
		}
		return dsSystemRoleFunctionTypeWriteMapper.countByExample(example);
	}

	@Override
	public int deleteByRolefunctionid(String rolefunctionid) {
		// TODO Auto-generated method stub
		return dsSystemRoleFunctionTypeWriteMapper.deleteByRolefunctionid(rolefunctionid);
	}
	


}
