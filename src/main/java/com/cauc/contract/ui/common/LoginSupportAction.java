/*
 * @(#)LoginSupportAction.java
 * Description:	user login Action
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2012
 * Create by:	fuchaohui 2012-6-27
 */
package com.cauc.contract.ui.common;

import java.util.Date;
import java.util.Hashtable;

import org.apache.commons.lang.StringUtils;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import cn.org.bjca.client.security.SecurityEngineDeal;

import com.cauc.contract.FinanceServiceException;
//import com.cauc.training.business.IOnlineCounterService;
import com.cauc.contract.config.FinanceConfig;
import com.cauc.contract.pojos.TUser;
//import com.cauc.training.pojos.TUserOnline;
import com.cauc.contract.util.Constants;

/**
 * 系统内用户登录辅助类
 * 
 * @author fuchaohui
 * 
 */
@Controller
@Scope("prototype")
public class LoginSupportAction extends BaseActionSupport {

	private static final long serialVersionUID = 5422831962422682556L;

	// private static Log log = LogFactory.getLog(LoginSupportAction.class);

	private String loginID;

	private String password;

	private String loginType;// 登录类型

	private String redirectTo;

	private String loginPage;// 登录页面

	private String verifyCode;// 验证码

	private String nameSpace;//

	// 用户注册名称
	private String userName;

	private String UserCert;
	private String UserSignedData;
	private String ContainerName;
	private String UserList;
	private String pwd1;
	private static String signPath = FinanceConfig.getProperty("default.crt.path");
	private static String ladpPath = FinanceConfig.getProperty("default.crt.ladp");

	/**
	 * 用户登录方法
	 * 
	 * @return Action.SUCCESS or Action.INPUT
	 */
	@SuppressWarnings("unchecked")
	public String systemUserLogin() {
		// baib 0713 Star
		// this.setLoginPage(buildLoginPage(Constants.SYSTEM_TYPE_ADMIN,Constants.GENERIC_LOGIN_PAGE));
		this.setLoginPage("/pages/login/login.jsp");
		// baib 0713 End
		if (StringUtils.isBlank(loginID)) {
			this.addActionError("登录ID不能为空");
			return INPUT;
		}
		if (StringUtils.isBlank(password)) {
			this.addActionError("登录密码不能为空");
			return INPUT;
		}
		String vCode = getRequest().getSession().getAttribute(Constants.VERIFY_CODE) == null ? null
				: getRequest().getSession().getAttribute(Constants.VERIFY_CODE).toString();
		if (vCode == null || !vCode.equalsIgnoreCase(verifyCode)) {
			this.addActionError("验证码错误");
			return INPUT;
		}

		/*
		 * DirContext dc = null; Hashtable env = new Hashtable();
		 * env.put(Context.INITIAL_CONTEXT_FACTORY,
		 * "com.sun.jndi.ldap.LdapCtxFactory"); env.put(Context.PROVIDER_URL,
		 * ladpPath); env.put(Context.SECURITY_AUTHENTICATION, "simple");
		 * env.put(Context.SECURITY_PRINCIPAL, loginID + "@cauc");
		 * env.put(Context.SECURITY_CREDENTIALS, password);
		 * 
		 * try { dc = new InitialDirContext(env);//初始化上下文
		 * 
		 * } catch (javax.naming.AuthenticationException e) {
		 * e.printStackTrace(); this.addActionError("认证失败：认证中心账户错误"); return
		 * INPUT;
		 * 
		 * } catch (Exception e) { e.printStackTrace();
		 * this.addActionError("认证出错：网络连接超时"); return INPUT; }finally { if (dc
		 * != null) { try { dc.close(); } catch (NamingException e) {
		 * this.addActionError("网络连接超时.."); return INPUT; } } }
		 */
		Authenticator authenticator = new Authenticator(this.getFactory());
		try {
			authenticator.userLogin(loginID.trim(), password.trim(), getRequest(), getResponse(), verifyCode, "0");
		} catch (FinanceServiceException e) {

			this.addActionError(e.getMessage());
			return INPUT;
		}
		return SUCCESS;
	}
	
	// -----------------------------baib 0713 删除以前业务登录部分 star---------------------------
	// @SuppressWarnings("unchecked")
	// public String usbKeyUserSecondLogin() {
	// if(getRequest().getSession().getAttribute("uniqueId")==null){
	//
	// return LOGIN;
	// }
	// this.setLoginPage(buildLoginPage(Constants.SYSTEM_TYPE_ADMIN,Constants.GENERIC_LOGIN_PAGE));
	// if (StringUtils.isBlank(loginID)) {
	// this.addActionError("登录ID不能为空");
	// return INPUT;
	// }
	// if (StringUtils.isBlank(password)) {
	// this.addActionError("登录密码不能为空");
	// return INPUT;
	// }
	// String vCode =
	// getRequest().getSession().getAttribute(Constants.VERIFY_CODE) == null ?
	// null
	// :
	// getRequest().getSession().getAttribute(Constants.VERIFY_CODE).toString();
	// if(vCode==null||!vCode.equalsIgnoreCase(verifyCode)){
	// this.addActionError("验证码错误");
	// return INPUT;
	// }
	//
	// DirContext dc = null;
	// Hashtable env = new Hashtable();
	// env.put(Context.INITIAL_CONTEXT_FACTORY,
	// "com.sun.jndi.ldap.LdapCtxFactory");
	// env.put(Context.PROVIDER_URL, ladpPath);
	// env.put(Context.SECURITY_AUTHENTICATION, "simple");
	// env.put(Context.SECURITY_PRINCIPAL, loginID + "@cauc");
	// env.put(Context.SECURITY_CREDENTIALS, password);
	//
	// try {
	// dc = new InitialDirContext(env);//初始化上下文
	//
	// } catch (javax.naming.AuthenticationException e) {
	// e.printStackTrace();
	// this.addActionError("认证失败：认证中心账户错误");
	// return INPUT;
	//
	// } catch (Exception e) {
	// e.printStackTrace();
	// this.addActionError("认证出错：网络连接超时");
	// return INPUT;
	// }finally {
	// if (dc != null) {
	// try {
	// dc.close();
	// } catch (NamingException e) {
	// this.addActionError("网络连接超时..");
	// return INPUT;
	// }
	// }
	// }
	//
	// Authenticator authenticator = new Authenticator(this.getFactory());
	// try {
	// authenticator.userLogin(loginID.trim(),
	// password.trim(),getRequest(),getResponse(),verifyCode,"1");
	// } catch (FinanceServiceException e) {
	//
	// this.addActionError(e.getMessage());
	// return INPUT;
	// }
	// return SUCCESS;
	// }
	// public String usbKeyUserLogin(){
	//
	// //验证客户端证书
	// SecurityEngineDeal.setProfilePath(signPath);
	// SecurityEngineDeal sed = null;
	// String clientCert = "";
	// String UserSignedData = "";
	// String ContainerName = "";
	// //String certPub = "";
	// String ranStr = "";
	// String uniqueId = "";
	//
	// try {
	//
	// sed = SecurityEngineDeal.getInstance("SVSDefault");
	// clientCert = this.getUserCert();
	// UserSignedData = this.getUserSignedData();
	// ContainerName = this.getContainerName();
	//
	// ranStr = getSession().getAttribute("Random").toString();
	// int retValue = sed.validateCert(clientCert);
	//
	// if (retValue == 1) {
	//
	// getSession().setAttribute("ContainerName", ContainerName);
	//
	// String uniqueIdStr = "";
	// try {
	// uniqueIdStr = sed.getCertInfo(clientCert, 17);
	// } catch (Exception e) {
	// this.setStatusMsg("客户端证书验证失败1:" + e.getMessage());
	// return INPUT;
	// }
	// getSession().setAttribute("UniqueID", uniqueIdStr);
	//
	// try {
	// //获得登陆用户ID
	// uniqueId = sed.getCertInfoByOid(clientCert,
	// "1.2.156.112562.2.1.1.1");
	// } catch (Exception e) {
	// }
	// if(uniqueId==null||(uniqueId!=null&&uniqueId.equals(""))){
	// try {
	// //获得登陆用户ID
	// uniqueId = sed.getCertInfoByOid(clientCert,
	// "2.16.840.1.113732.2");
	// } catch (Exception e) {
	// this.setStatusMsg("客户端证书验证失败2:" + e.getMessage());
	// return INPUT;
	// }
	// }
	// } else {
	// String error="客户端证书验证失败4：";
	//
	// if (retValue == -1) {
	// error+="登录证书的根不被信任。";
	// } else if (retValue == -2) {
	// error+="登录证书超过有效期。";
	// } else if (retValue == -3) {
	// error+="登录证书为作废证书。";
	// } else if (retValue == -4) {
	// error+="登录证书被临时冻结。";
	// } else if (retValue == -5) {
	// error+="登录证书未生效。";
	// }
	// this.setStatusMsg(error);
	// return INPUT;
	// }
	// } catch (Exception ex) {
	// this.setStatusMsg("客户端证书验证失败3:" + ex.getMessage());
	// return INPUT;
	// }
	// //验证客户端签名
	// try {
	// if (sed.verifySignedData(clientCert, ranStr, UserSignedData)) {
	// } else {
	// this.setStatusMsg("验证客户端签名错误。");
	// return INPUT;
	// }
	// } catch (Exception e) {
	// this.setStatusMsg("验证客户端签名错误:" + e.getMessage());
	// return INPUT;
	// }
	//
	// getRequest().getSession().setAttribute("uniqueId",uniqueId);
	//
	// //uniqueId获取用户对象
	// /*
	// Authenticator authenticator = new Authenticator(this.getFactory());
	// try {
	// authenticator.userUsbkLogin(uniqueId,getRequest(),getResponse());
	// } catch (FinanceServiceException e) {
	// this.setStatusMsg(e.getMessage());
	// return INPUT;
	// }
	// */
	//
	// return SUCCESS;
	// }
	//
	// /**
	// * 跳转个子系统登录页面
	// *
	// * @return Action.SUCCESS or Action.ERROR
	// */
	// public String openLogin() {
	// if (StringUtils.isBlank(redirectTo)) {
	// this.setLoginPage(buildLoginPage(Constants.SYSTEM_TYPE_STUDENT,Constants.GENERIC_LOGIN_PAGE));
	// return SUCCESS;
	// }
	// if (getRedirectTo().startsWith(Constants.SYSTEM_TYPE_ADMIN))// 判断是否为
	// this.setLoginPage(buildLoginPage(Constants.SYSTEM_TYPE_ADMIN,
	// Constants.GENERIC_LOGIN_PAGE));
	// else {
	// this.setLoginPage(buildLoginPage(Constants.SYSTEM_TYPE_STUDENT,Constants.GENERIC_LOGIN_PAGE));
	// }
	// return SUCCESS;
	// }
	//
	// public String openSignLoginPage(){
	// this.getRequest().setAttribute("usbkPath", signPath);
	// return SUCCESS;
	// }
	// public String openSignSecondLoginPage(){
	//
	//
	// if(getRequest().getSession().getAttribute("uniqueId")==null){
	//
	// return INPUT;
	// }
	// return SUCCESS;
	// }
	// -----------------------------baib 0713 删除以前业务登录部门 End---------------------------
	

	/**
	 * 退出系统
	 * 
	 * @return
	 */
	public String logout() {
		try {
			LoginContext context = getLoginContext();
			if (context != null) {
				//TUserOnline tuser = new TUserOnline();
				//tuser.setDOffDate(new Date());
				TUser t = new TUser();
				t.setVId(context.getLoginId());
				//tuser.setTUser(t);
				//---------------baib 用户在线时常统计业务----star-------------------
				//	try {
				//	IOnlineCounterService onc = getFactory().getFinanceProviderInstance().getOnlineCounterService();
				//	onc.update(tuser);
				//	} catch (FinanceServiceException e) {
				//	e.printStackTrace();
				//	}
				//---------------baib 用户在线时常统计业务----End-------------------
			}
			String userType = "";
			if (context != null) {
				userType = context.getUserType();
			}
			if (userType.equals(Constants.USER_TYPE_STUDENT)) {
				this.nameSpace = "/";
			} else if (userType.equals(Constants.USER_TYPE_SYSTEM)) {
				this.nameSpace = "/system";
			}
			if (getSession() != null)
				getSession().invalidate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	// -----------------------------baib 0713 删除以前业务登录部门 star---------------------------
	// /**
	// * 构造个子系统的登录页面
	// *
	// * @param system_type
	// * @param login_page
	// * @return 登录页面的URL（相对路径）
	// */
	// private String buildLoginPage(String system_type, String login_page) {
	// return "WEB-INF/" + system_type.substring(1) + "/" + login_page;
	// }
	// -----------------------------baib 0713 删除以前业务登录部门 End---------------------------
	public String getLoginPage() {
		return loginPage;
	}

	public void setLoginPage(String loginPage) {
		this.loginPage = loginPage;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRedirectTo() {
		return redirectTo;
	}

	public void setRedirectTo(String redirectTo) {
		this.redirectTo = redirectTo;
	}

	public String getNameSpace() {
		return nameSpace;
	}

	public void setNameSpace(String nameSpace) {
		this.nameSpace = nameSpace;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public String getUserCert() {
		return UserCert;
	}

	public void setUserCert(String userCert) {
		UserCert = userCert;
	}

	public String getUserSignedData() {
		return UserSignedData;
	}

	public void setUserSignedData(String userSignedData) {
		UserSignedData = userSignedData;
	}

	public String getContainerName() {
		return ContainerName;
	}

	public void setContainerName(String containerName) {
		ContainerName = containerName;
	}

	public String getUserList() {
		return UserList;
	}

	public void setUserList(String userList) {
		UserList = userList;
	}

	public String getPwd1() {
		return pwd1;
	}

	public void setPwd1(String pwd1) {
		this.pwd1 = pwd1;
	}

}
