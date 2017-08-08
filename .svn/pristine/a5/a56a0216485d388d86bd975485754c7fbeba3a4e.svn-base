/*
 * @(#)LoginSupportAction.java
 * Description:	user login Action
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2012
 * Create by:	fuchaohui 2012-6-27
 */
package com.cauc.contract.ui.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IDictionaryService;

/**
 * 系统内用户登录辅助类
 * 
 * @author fuchaohui
 * 
 */
@Controller
@Scope("prototype")
public class DictionaryAction extends BaseActionSupport {

	@Autowired
	private IDictionaryService dictionaryServiceImpl;

	/**
	 * 用户登录方法
	 * 
	 * @return Action.SUCCESS or Action.INPUT
	 * @throws IOException 
	 */
	@SuppressWarnings("unchecked")
	public String getDics() throws FinanceServiceException, IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		int id = Integer.parseInt(request.getParameter("id"));
		String resultStr = dictionaryServiceImpl.getChildDicById(id);
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resultStr);
        out.flush();
        out.close();
        return null;
	}
	
	@SuppressWarnings("unchecked")
	public String getAllDics() throws FinanceServiceException, IOException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		int id = Integer.parseInt(request.getParameter("id"));
		String resultStr = dictionaryServiceImpl.getAllChildDicById(id);
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.print(resultStr);
        out.flush();
        out.close();
        return null;
	}

}
