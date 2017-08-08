/*
 * @(#)Constants.java
 * Description:	final field
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2009 Newage Microsystems, Inc. All rights reserved.
 * Create by:	zhaochunhui  2010-1-6
 */
package com.cauc.contract.util;

/**
 * 常量标识
 * 
 * @author fuchaohui
 *
 */
public final class Constants {
	
	/**
	 * 合同编号前缀 baib
	 */
	public final static String CONTRACT_ID="CAUC";
	
	/**
	 * 合同编号中间符号 baib
	 */
	public final static String CONTRACT_ID_MIDDLE="-G";
	
	
	/**
	 * 校验码
	 */
	public final static String VERIFY_CODE="verifyCode";
	/**
	 * 登录上下文
	 */
	public final static String LOGIN_CONTEXT = "loginContext";	
	//用户类型
	/**
	 * 学生
	 */
	public final static String USER_TYPE_STUDENT="student";
	/**
	 * 管理员
	 */
	public final static String USER_TYPE_SYSTEM="admin";	
	
	//登录系统
	/**
	 * 管理员系统
	 */	
	public final static String SYSTEM_TYPE_ADMIN="/system";
	/**
	 * 学生登录系统
	 */
	public final static String SYSTEM_TYPE_STUDENT="/website";
	/**
	 * 合同管理系统
	 */	
	public final static String SYSTEM_TYPE_CONTRACT="/contract";
	/**
	 * 通用登录页面
	 */
	public final static String GENERIC_LOGIN_PAGE="login.jsp";	
}
