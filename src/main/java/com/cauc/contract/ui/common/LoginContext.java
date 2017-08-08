/*
 * @(#)LoginContext.java
 * Description:	user service interface
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2014
 * Create by:	fuchaohui  2014-6-25
 */
package com.cauc.contract.ui.common;

import java.util.Date;

import com.cauc.contract.vo.WarningInfo;

/**
 * 系统内用户登录上下文对象
 * 
 * @author fuchaohui
 *
 */
public class LoginContext implements java.io.Serializable {

	private static final long serialVersionUID = 5433041976988427885L;

	private String loginId;//登录ID
	
	private String userId;//用户标识ID
	
	private String userName;//用户名称
	
	private String userType;//用户类型区分前后台
	
	private int loginUserType;//用户类型1：学员；2：教员；3：管理员；4：其他
	
	private int status;//用户状态：0：正常;1停用;-1代表删除;
	
	private int level;//用户级别：0普通;1超级用户 
	
	private String urlAddress;//存储用户能访问的权限页面地址。
	
	private boolean superAdmin=false;
	
	private String loginIP;//登录IP
	
	private Date loginTime;//登录时间
	
	private WarningInfo warn;//告警提示
	
	private String realName;//真实姓名
	
	private int isWrite;//读写 0写1读
	
	public LoginContext(){
		
	}

	/**
	 * 获取登录ID
	 * @return loginId
	 */
	public String getLoginId() {
		return loginId;
	}

	/**
	 * 设置登录ID
	 * @param loginId 要设置的 loginId
	 */
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	/**
	 * 获取登录IP
	 * @return loginIP
	 */
	public String getLoginIP() {
		return loginIP;
	}

	/**
	 * 设置登录IP
	 * @param loginIP 要设置的 loginIP
	 */
	public void setLoginIP(String loginIP) {
		this.loginIP = loginIP;
	}

	/**
	 * 获取登录时间
	 * @return loginTime
	 */
	public Date getLoginTime() {
		return loginTime;
	}

	/**
	 * 设置登录时间
	 * @param loginTime 要设置的 loginTime
	 */
	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}


	/**
	 * 是否为超级管理员
	 * @return superAdmin
	 */
	public boolean isSuperAdmin() {
		return superAdmin;
	}

	/**
	 * 设置是否为超级管理员
	 * @param superAdmin 要设置的 superAdmin
	 */
	public void setSuperAdmin(boolean superAdmin) {
		this.superAdmin = superAdmin;
	}

	/**
	 * 获取用户ID
	 * @return userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * 设置用户ID
	 * @param userId 要设置的 userId
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * 获取用户名称
	 * @return userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * 设置用户名称
	 * @param userName 要设置的 userName
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * 获取用户类型
	 * 
	 * @return Constants.USER_TYPE_CANDIDATES or Constants.USER_TYPE_PERSONNEL
	 *         or Constants.USER_TYPE_EMPLOYERS
	 */
	public String getUserType() {
		return userType;
	}

	/**
	 * 设置用户类型 Constants.USER_TYPE_CANDIDATES or Constants.USER_TYPE_PERSONNEL or
	 * Constants.USER_TYPE_EMPLOYERS
	 * 
	 * @param userType
	 *            要设置的 userType
	 */
	public void setUserType(String userType) {
		this.userType = userType;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getLoginUserType() {
		return loginUserType;
	}

	public void setLoginUserType(int loginUserType) {
		this.loginUserType = loginUserType;
	}

	public String getUrlAddress() {
		return urlAddress;
	}

	public void setUrlAddress(String urlAddress) {
		this.urlAddress = urlAddress;
	}

	public WarningInfo getWarn() {
		return warn;
	}

	public void setWarn(WarningInfo warn) {
		this.warn = warn;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public int getIsWrite() {
		return isWrite;
	}

	public void setIsWrite(int isWrite) {
		this.isWrite = isWrite;
	}
	
}