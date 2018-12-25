package cn.com.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.mapper.apdcn.custom.DsSystemUserWriteMapper;
import cn.com.mapper.apdcn.pojo.DsSystemUser;
import cn.com.service.user.SystemUserService;
import cn.com.util.RedisUtil;

@Service("systemUserService")
public class SystemUserServiceImpl implements SystemUserService {
	@SuppressWarnings("unused")
	@Autowired
	private DsSystemUserWriteMapper dsSystemUserWriteMapper;
//	@Resource
//	private RedisUtil redisUtil;

	@Override
	public int transactionTest(DsSystemUser record) {
		System.out.println(RedisUtil.get("zlkj"));
		RedisUtil.add("ssss", "sssssssssssss");
		System.out.println("ssss>>>>>>>"+RedisUtil.get("ssss"));
		return 1;
	}

}
