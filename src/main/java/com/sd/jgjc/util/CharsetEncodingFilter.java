package com.sd.jgjc.util;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.Filter; 
import javax.servlet.FilterConfig;

public class CharsetEncodingFilter implements Filter 
{
	private String encoding;
    public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain)throws ServletException, IOException 
    {
    	HttpServletRequest req = (HttpServletRequest)request;
    	//HttpServletResponse res = (HttpServletResponse)response;
    	
    	req.setCharacterEncoding(encoding);
    	//res.setCharacterEncoding(encoding);
    	//res.setHeader("Charset", encoding);
    	//response.setContentType("text/xml; charset=UTF-8");
    	chain.doFilter(request,response);    	
    	//System.out.println("|"+encoding+"|");
    }
	public void init(FilterConfig config)throws ServletException 
	{
		
		encoding  = config.getInitParameter("encoding");
	}
	public void destroy() 
	{
		
	}
}