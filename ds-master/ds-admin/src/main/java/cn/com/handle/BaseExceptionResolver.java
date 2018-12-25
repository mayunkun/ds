package cn.com.handle;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;

import cn.com.util.ConstantsUtil;
import cn.com.util.WebUtil;


public class BaseExceptionResolver extends SimpleMappingExceptionResolver {
	private Logger LOG = LoggerFactory.getLogger(this.getClass());

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.web.servlet.handler.SimpleMappingExceptionResolver
	 * #doResolveException(javax.servlet.http.HttpServletRequest,
	 * javax.servlet.http.HttpServletResponse, java.lang.Object,
	 * java.lang.Exception)
	 */
	@Override
	protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) {
		// TODO Auto-generated method stub
		// Expose ModelAndView for chosen error view.
		/**
		 * 记录异常信息
		 */
		LOG.error(ex.getMessage(), ex);

		/**
		 * 异常提示
		 */
		String viewName = determineViewName(ex, request);
		if (viewName != null) {
			if (WebUtil.isAjaxRequest(request)) { // ajax请求
				try {
					WebUtil.write(response, "{success:true,http_status_code_:\"exception\"}", ConstantsUtil.SYSTEM_DEFAULT_ENCODING);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					LOG.error(e.getMessage(), e);
				}
				return null;
			} else {
				// Apply HTTP status code for error views, if specified.
				// Only apply it if we're processing a top-level request.
				Integer statusCode = determineStatusCode(request, viewName);
				if (statusCode != null) {
					applyStatusCodeIfPossible(request, response, statusCode);
				}
				return getModelAndView(viewName, ex, request);
			}
		} else {
			return null;
		}
	}
}
