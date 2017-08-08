/*
 * @(#)LoginInterceptor.java
 * Description:	Finance
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2014
 * Create by:	fuchaohui  2014-6-25
 */
package com.cauc.contract.ui.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.StrutsStatics;

import com.cauc.contract.util.Constants;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 * 是否为合法用户登录拦截器 是用于此系统 所有需要登录访问的 命名空间
 * 
 * @author fuchaohui
 * 
 */
public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = -2936813857432258615L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		ActionContext actionContext = invocation.getInvocationContext();// 获取Action上下文信息
		HttpServletRequest request = (HttpServletRequest) actionContext
				.get(StrutsStatics.HTTP_REQUEST);
		HttpServletResponse response  = (HttpServletResponse)
				actionContext.get(StrutsStatics.HTTP_RESPONSE);
		HttpSession session = request.getSession();
		String queryString = request.getQueryString();// url参数字符串：a=1&b=2
		String nameSpace = invocation.getProxy().getNamespace();
		String actionName = invocation.getProxy().getActionName();
		Object action = invocation.getAction();
		if (action instanceof LoginSupportAction
				|| actionName.equals("open_error")) 
			return invocation.invoke();
		if (nameSpace.equals("/"))
			return invocation.invoke();
		String redirectToURL = getRedirectToURL(nameSpace, actionName,
				queryString);
		request.setAttribute("redirectTo", redirectToURL);
		if (session.getAttribute(Constants.LOGIN_CONTEXT) == null){
			if(request.getHeader("x-requested-with") != null && //判断是ajax请求
					request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")){
				response.setHeader("sessionstatus", "timeout");  
			}else{
				return Action.LOGIN;
			}
		}
		// 获取登陆上下文信息
		LoginContext context = (LoginContext) session
				.getAttribute(Constants.LOGIN_CONTEXT);
		if (StringUtils.isBlank(context.getLoginId())
				|| StringUtils.isBlank(context.getUserId())
				|| StringUtils.isBlank(context.getUserType()))
			return Action.LOGIN;
		
		// 判断用户类型
		if (context.getUserType().equals(Constants.USER_TYPE_STUDENT)) {
			if (!nameSpace.startsWith(Constants.SYSTEM_TYPE_STUDENT))
				return Action.LOGIN;

		} else if (context.getUserType().equals(Constants.USER_TYPE_SYSTEM)) {
			if (!nameSpace.startsWith(Constants.SYSTEM_TYPE_ADMIN)
					&& !nameSpace.startsWith(Constants.SYSTEM_TYPE_CONTRACT))
				return Action.LOGIN;
		} else {
			request.setAttribute("errorMessage", "非法用户");
			return Action.ERROR;
		}
		
		//判断是否有权限
		/*
		String defaultStr = "open_toDoingListPageindexopen_leftList";
		//System.out.println(context.getUrlAddress()+defaultStr + "-" + actionName);
		if(context.getUrlAddress().indexOf("all")!=-1){
			return invocation.invoke();
		}
		else if(context.getUrlAddress().indexOf("all")==-1
			&&	(context.getUrlAddress()+defaultStr).indexOf(actionName)!=-1
		){
			return invocation.invoke();
			//request.setAttribute("errorMessage", "您没有访问该功能的权限。");
			//return Action.ERROR;
		}else{
			return Action.ERROR;
		}
		*/
		return invocation.invoke();
	}

	/**
	 * 取得登录前请求action的URL
	 * 
	 * @param nameSpace
	 *            -命名空间
	 * @param packageName
	 *            -报名
	 * @param queryString
	 *            -URL参数
	 * @return 请求action的URL
	 */
	private String getRedirectToURL(String nameSpace, String actionName,
			String queryString) {
		actionName = "index";//返回到首页
		String resultURL = "";
		if (StringUtils.isNotBlank(nameSpace) && !nameSpace.equals("/")) {
			resultURL += nameSpace;
		}
		if (StringUtils.isNotBlank(actionName)) {
			if (StringUtils.isNotBlank(resultURL) && !resultURL.equals("/"))
				resultURL += "/" + actionName + ".do";
			else
				resultURL = actionName + ".do";
		}
		if (StringUtils.isNotBlank(queryString))
			resultURL += "?" + queryString;
		return resultURL;
	}
}
