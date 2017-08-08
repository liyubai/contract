/*
 * @(#)Authenticator.java
 * Description:	validate user login 
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2014
 * Create by:	fuchaohui	2014-6-25
 */
package com.cauc.contract.ui.common;

import java.util.Date;


import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.util.Assert;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.FinanceFactory;
import com.cauc.contract.business.ISystemUserService;
import com.cauc.contract.config.FinanceConfig;

import com.cauc.contract.pojos.TUser;
import com.cauc.contract.util.Constants;
import com.cauc.contract.util.Utilities;
import com.cauc.contract.vo.WarningInfo;

/**
 * 用户登录校验
 * 
 * @author fuchaohui
 *
 */
public class Authenticator {	
	
	private int maxInactiveInterval = 30 * 60;
	
	//private int maxInactiveInterval = 1 * 60;
	
	private FinanceFactory factory;
	
	/**空的构造方法
	 * 
	 */
	public Authenticator(){
		
	}
	/**
	 * 跟据 FinanceFactory构造 Authenticator的实例
	 * @param factory -FinanaceFactory
	 */
	public Authenticator(FinanceFactory factory){
		this.factory=factory;
	}	
	

	/**
	 * 用户登录
	 * 
	 * @param loginID 登录ID
	 * @param password 密码(明文）
	 * @param request
	 * @throws ErsServiceException
	 */

	public void userLogin(String loginID, String password,
			HttpServletRequest request, HttpServletResponse response,String verifyCode,String isUsbkLogined)
			throws FinanceServiceException {
		//Assert.notNull(loginID, "登录ID不能为空");
		//Assert.notNull(password, "登录密码不能为空");
		/*
		String vCode = request.getSession().getAttribute(Constants.VERIFY_CODE) == null ? null
				: request.getSession().getAttribute(Constants.VERIFY_CODE).toString();
		if(vCode==null||!vCode.equalsIgnoreCase(verifyCode))
			throw new FinanceServiceException("验证码错误");
		*/
		ISystemUserService systemUserService = getFactory().getFinanceProviderInstance().getSysUserService();
		//TUser user=systemUserService.readSysUserByLoginID(loginID);
		TUser user=systemUserService.readSysUserByLdapID(loginID);
		
		if(user==null)
			throw new FinanceServiceException("用户在训练系统中不存在");	
		
		if(isUsbkLogined.equals("0") && user.getVSign()!=null && user.getVSign().length()>0){
			throw new FinanceServiceException("用户已绑定数字证书，请用数字证书登录。");	
		}
		
		if(user.getIStatus()==-1){//删除
			throw new FinanceServiceException("用户已删除。");	
		}
		if(user.getIStatus()==1){//停用
			throw new FinanceServiceException("用户已停用。");	
		}
		
		/*
		if(FinanceConfig.getBooleanProperty("passwds.encryption.enabled")){
			String encodePsw=Utilities.encodePassword(password, FinanceConfig
					.getProperty("passwds.encryption.algorithm"));
			if(!encodePsw.equals(user.getVPassword()))
				throw new FinanceServiceException("密码错误");
		}else{
			if(!password.equals(user.getVPassword()))
				throw new FinanceServiceException("密码错误");			
		}
		*/
		
		//构造登录上下文
		LoginContext loginContext=new LoginContext();
		loginContext.setLoginId(user.getVUsername());
		loginContext.setUserName(user.getVUsername());
		//System.out.println(user.getVUsername());
		loginContext.setUserId(user.getVId());
		loginContext.setLevel(user.getIAdminStatus());
		loginContext.setUserType(Constants.USER_TYPE_SYSTEM);
		loginContext.setLoginUserType(user.getIUserType());
		loginContext.setStatus(user.getIStatus());//用户状态
		loginContext.setLoginTime(new Date());
		loginContext.setLoginIP(getIpAddr(request));
		
		//用户姓名
		if(user.getIUserType()==ISystemUserService.USERTYPE_ADMIN){
			loginContext.setRealName(user.getVRealname());
		}else{
			loginContext.setRealName(systemUserService.readRealName(user.getIUserType(),user.getVUsername()));
		}
		WarningInfo warn = new WarningInfo();//初始化警告信息
		warn.setHigh(0);
		warn.setMiddle(0);
		warn.setLow(0);
		loginContext.setWarn(warn);
		
		/**
		 * 向LoginContext对象（即登录者对象）中存储当前登录者所拥有的权限，这里存储的是当前登录者所拥有功能模块的访问路径 
		*/
		
		//用户级别：0普通;1超级用户 
		int level = user.getIAdminStatus();
		if(level == 1){
			//loginContext.setUserName(user.getVRealname());
			loginContext.setUrlAddress("all");
			loginContext.setIsWrite(0);//管理员可写
		}
		// -----------------------------baib 获取教员告警信息 star------------------------
		
		//		if(level == 0){//用户栏目权限
		//				
		//			loginContext.setUrlAddress(systemUserService.readLoginUserFunctions(user.getVId()));
		//			//loginContext.setIsWrite(systemUserService.readIsWriteByUserId(user.getVId()));
		//		} 		
		//		
		//		//获取学生告警信息
		//		if (user.getIUserType() == ISystemUserService.USERTYPE_STUDENT) {
		//			
		//		}
		//获取教员告警信息
		//		if(user.getIUserType()==ISystemUserService.USERTYPE_TEACHER){
		//			loginContext.setWarn(getFactory().getFinanceProviderInstance()
		//					.getTeacherManagentService()
		//					.readTeacherWarningInfoById(user.getVUsername()));
		//		}
		// -----------------------------baib 获取教员告警信息 star------------------------
		
		//其他人员获取用户名
		if (user.getIUserType() == ISystemUserService.USERTYPE_OTHER) {
			
		}
		// -----------------------------baib 用户在线时常部分统计 star------------------------
		//		TUserOnline tuser = new TUserOnline();
		//        tuser.setDLoginDate(new Date());
		//        TUser t = new TUser();
		//        t.setVId(loginContext.getLoginId());
		//        t.setVUsername(loginContext.getLoginId());
        // tuser.setTUser(t);
        
        
        //getFactory().getFinanceProviderInstance().getOnlineCounterService().save(tuser);
        // -----------------------------baib 用户在线时常部分统计 end------------------------
        
		//在HttpSession中存放 登录上下文
		request.getSession().setAttribute(Constants.LOGIN_CONTEXT, loginContext);	
		//request.getSession().setMaxInactiveInterval(maxInactiveInterval);
		
		OnlineCounterListener.getOnlineSession();
		//将cookie中的tab默认成首页
		Cookie cookie = new Cookie("activeLinkId","0");
		cookie.setPath("/");
		cookie.setMaxAge(maxInactiveInterval);
		response.addCookie(cookie);
		
	}
	
	
//	   ----------------baib 删除多余登录业务逻辑 star--------------------
//	public void userUsbkLogin(String loginID,HttpServletRequest request, HttpServletResponse response)
//			throws FinanceServiceException {
//		Assert.notNull(loginID, "登录ID不能为空");
//		
//		ISystemUserService systemUserService = getFactory().getFinanceProviderInstance().getSysUserService();
//		TUser user=systemUserService.readSysUserByUsbk(loginID);
//		
//		if(user==null)
//			throw new FinanceServiceException("所选数字证书未与系统用户绑定。");	
//		if(user.getIStatus()==-1){//删除
//			throw new FinanceServiceException("用户已删除。");	
//		}
//		if(user.getIStatus()==1){//停用
//			throw new FinanceServiceException("用户已停用。");	
//		}
//		
//		//构造登录上下文
//		LoginContext loginContext=new LoginContext();
//		loginContext.setLoginId(user.getVUsername());
//		loginContext.setUserName(user.getVUsername());
//		loginContext.setUserId(user.getVId());
//		loginContext.setLevel(user.getIAdminStatus());
//		loginContext.setUserType(Constants.USER_TYPE_SYSTEM);
//		loginContext.setLoginUserType(user.getIUserType());
//		loginContext.setStatus(user.getIStatus());//用户状态
//		loginContext.setLoginTime(new Date());
//		loginContext.setLoginIP(getIpAddr(request));
//		
//		//用户姓名
//		if(user.getIUserType()==ISystemUserService.USERTYPE_ADMIN){
//			loginContext.setRealName(user.getVRealname());
//		}else{
//			loginContext.setRealName(systemUserService.readRealName(user.getIUserType(),user.getVUsername()));
//		}
//		WarningInfo warn = new WarningInfo();//初始化警告信息
//		warn.setHigh(0);
//		warn.setMiddle(0);
//		warn.setLow(0);
//		loginContext.setWarn(warn);
//		
//		/**
//		 * 向LoginContext对象（即登录者对象）中存储当前登录者所拥有的权限，这里存储的是当前登录者所拥有功能模块的访问路径 
//		*/
//		
//		//用户级别：0普通;1超级用户 
//		int level = user.getIAdminStatus();
//		if(level == 1){
//			//loginContext.setUserName(user.getVRealname());
//			loginContext.setUrlAddress("all");
//			loginContext.setIsWrite(0);//管理员可写
//		}
//		if(level == 0){//用户栏目权限
//				
//			loginContext.setUrlAddress(systemUserService.readLoginUserFunctions(user.getVId()));
//			//loginContext.setIsWrite(systemUserService.readIsWriteByUserId(user.getVId()));
//		} 		
//		
//		//获取学生告警信息
//		if (user.getIUserType() == ISystemUserService.USERTYPE_STUDENT) {
//			
//		}
//		//获取教员告警信息
//		if(user.getIUserType()==ISystemUserService.USERTYPE_TEACHER){
//			loginContext.setWarn(getFactory().getFinanceProviderInstance()
//					.getTeacherManagentService()
//					.readTeacherWarningInfoById(user.getVUsername()));
//		}
//		//其他人员获取用户名
//		if (user.getIUserType() == ISystemUserService.USERTYPE_OTHER) {
//			
//		}
//		TUserOnline tuser = new TUserOnline();
//        tuser.setDLoginDate(new Date());
//        TUser t = new TUser();
//        t.setVId(loginContext.getLoginId());
//        t.setVUsername(loginContext.getLoginId());
//        tuser.setTUser(t);
//        getFactory().getFinanceProviderInstance().getOnlineCounterService().save(tuser);
//        
//		//在HttpSession中存放 登录上下文
//		request.getSession().setAttribute(Constants.LOGIN_CONTEXT, loginContext);	
//		//request.getSession().setMaxInactiveInterval(maxInactiveInterval);
//		
//		OnlineCounterListener.getOnlineSession();
//		//将cookie中的tab默认成首页
//		Cookie cookie = new Cookie("activeLinkId","0");
//		cookie.setPath("/");
//		cookie.setMaxAge(maxInactiveInterval);
//		response.addCookie(cookie);
//		
//	}
//	   ----------------baib 删除多余登录业务逻辑 end--------------------	
	
	/**
	 * 获取客户端访问IP地址
	 * @param request
	 * @return ip
	 */
	public String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader(" x-forwarded-for ");
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getHeader(" Proxy-Client-IP ");
		}
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getHeader(" WL-Proxy-Client-IP ");
		}
		if (ip == null || ip.length() == 0 || " unknown ".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}	
	/**
	 * 设置HttpSession过期时间
	 * 
	 * @return the maxInactiveInterval 整型 秒
	 */
	public int getMaxInactiveInterval() {
		return maxInactiveInterval;
	}

	/**
	 * 获取HttpSession过期时间(单位：秒)
	 * 
	 * @param maxInactiveInterval
	 *            the maxInactiveInterval to set
	 */
	public void setMaxInactiveInterval(int maxInactiveInterval) {
		this.maxInactiveInterval = maxInactiveInterval;
	}
	
	public FinanceFactory getFactory() {
		return factory;
	}
	public void setFactory(FinanceFactory factory) {
		this.factory = factory;
	}
}
