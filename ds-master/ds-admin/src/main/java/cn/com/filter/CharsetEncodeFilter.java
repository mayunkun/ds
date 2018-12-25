package cn.com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 对请求的request与response进行编码设置
 * 
 * @author is_zhoufeng
 *
 */
public class CharsetEncodeFilter implements Filter {

	private static final String DEFAULT_CHARSET = "UTF-8";
	private String request;
	private String response;

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding(this.request);
		response.setCharacterEncoding(this.response);
		chain.doFilter(request, response);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		request = config.getInitParameter("requestCharset");
		response = config.getInitParameter("responseCharset");
		if (request == null) {
			request = DEFAULT_CHARSET;
		}
		if (response == null) {
			response = DEFAULT_CHARSET;
		}
	}

}
