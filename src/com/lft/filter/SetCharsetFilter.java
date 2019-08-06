package com.lft.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 同一设置编码过滤器：
 * 
 * 		1.自定类实现javax.servlet.Filter接口
 * 
 * 		2.实现doFilter() 方法
 * 
 * 		3.配置过滤路径
 * 			方式一：在类定义上使用【注解】方式配置
 * 				@WebFilter("/SetCharsetFilter")//拦截路径
				public class SetCharsetFilter implements Filter {}
				
			方式二：在web.xml中使用【非注解】方式配置
				<filter>
			  		<filter-name>SetCharsetFilter</filter-name>
			  		<filter-class>com.neuedu.filter.SetCharsetFilter</filter-class>
			   </filter>
			   <filter-mapping>
			  		<filter-name>SetCharsetFilter</filter-name>
			  		<url-pattern>/*</url-pattern>
			   </filter-mapping>
 */
//@WebFilter("/*")//拦截路径
public class SetCharsetFilter implements Filter {

    /**
     * 构造函数
     */
    public SetCharsetFilter() {
      	System.out.println("new SetCharsetFilter() 实例化");
    }
    /**
	 * 初始化
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		System.out.println("SetCharsetFilter.init 初始化");
	}
	/**
	 * doFilter
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("过滤.....................开始");
		
		//处理post请求的乱码
		request.setCharacterEncoding("utf-8");
		
		//处理response响应的乱码
		response.setCharacterEncoding("utf-8");//指定响应输出的内容为utf-8编码
		response.setContentType("text/plain;charset=utf-8");//告诉浏览器使用utf-8编码格式解析我们的内容  text/plain 纯文本 
		
		//放行
		chain.doFilter(request, response);
		
		System.out.println("过滤.....................结束");
	}
	
	/**
	 * 销毁
	 */
	public void destroy() {
		System.out.println("SetCharsetFilter.destroy 销毁");
	}
	

}
