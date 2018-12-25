package cn.com.listener;

import javax.servlet.ServletContextEvent;

import org.springframework.web.context.ContextLoaderListener;

//import com.qkl.api.system.QklAreaApi;
//import com.qkl.common.ConstantsUtil;
//import com.qkl.common.handle.SpringContextHolder;

/**
 * 启动的时候加载系统配置到application里面去
 */
public class SystemApplicationListener extends ContextLoaderListener {
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		super.contextInitialized(event);

		// 加载区域缓存
//		QklAreaApi tjAreaApi = SpringContextHolder.getBean(QklAreaApi.class);
//		ConstantsUtil.AREA_MAP.putAll(tjAreaApi.getMapAreas(""));
		
	}
}
