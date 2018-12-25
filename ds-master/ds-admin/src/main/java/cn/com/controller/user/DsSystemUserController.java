package cn.com.controller.user;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.handle.BaseController;
import cn.com.mapper.apdcn.pojo.DsSystemUser;
import cn.com.util.RedisUtil;

@Controller
@RequestMapping("/area")
public class DsSystemUserController extends BaseController {

//	@Autowired
//	private DsSystemUserService dsSystemUserService;
	
	@RequestMapping("/getdata")
	public @ResponseBody List<DsSystemUser> getAreaPageModel(DsSystemUser pojo) {
		RedisUtil.add("sss", "sssssssssssssssss");
//		pojo.setId(UUIDGenerator.generate());
//		pojo.setName("事务测试");
//		dsSystemUserService.transactionTest(pojo);
		return null;
	}
}
