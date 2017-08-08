/**
 * 
 */
package com.cauc.contract.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * 文件过虑器
 *   	<filter-name>URlFilter</filter-name> 
 *   	<filter-class>com.highcom.proposal.ui.rendering.filters.UrlFilter</filter-class>
 *		<init-param>
 *			<param-name>params</param-name>
 *			<param-value>jsp,asp,php</param-value>
 *		</init-param>  
 * </p>
 * 
 * @author zhaochunhui
 *
 */
public class UrlFilter implements Filter {

	protected FilterConfig filterConfig;
	
	protected String extNames="jsp";
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	public void init(FilterConfig arg0) throws ServletException {
		filterConfig=arg0;
		if(filterConfig.getInitParameter("FileExtends")!=null)
			extNames=filterConfig.getInitParameter("FileExtends");

	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain chain) throws IOException, ServletException {
		request=(HttpServletRequest)arg0;
		response=(HttpServletResponse)arg1;
		String uri=request.getRequestURI();
		uri=uri.substring(uri.lastIndexOf("/")+1);
		uri=Utilities.stripJsessionId(uri);
		String extend="";
		if(uri.indexOf("?")!=-1)
			extend=uri.substring(uri.lastIndexOf(".")+1,uri.indexOf("?"));
		else
			extend=uri.substring(uri.lastIndexOf(".")+1);
		boolean flag=Boolean.FALSE;//过虑标志位 如果和配置文件中所配置的文件扩展名匹配则 置为true
		String[] extList=extNames.split(",");
		for(int i=0;i<extList.length;i++){
			if(extend.equalsIgnoreCase(extList[i])){
				flag=Boolean.TRUE;
				break;
			}
		}
		if(flag){
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			String strURL = "<script   language=\"javascript\">";
			strURL += "window.open('" + request.getContextPath()
					+ "/index.do" + "','_self')";
			strURL += "</script>";
			out.println(strURL);
			return;
		}
		chain.doFilter(request,response);
	}

	public void destroy() {
		filterConfig=null;

	}

}
