package com.cauc.contract.ui.core;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.cauc.contract.business.IQueryLoginUserService;
import com.cauc.contract.pojos.LoginUser;
import com.cauc.contract.ui.common.BaseActionSupport;

/**
 * 
 * @author swq
 *
 */

public class UserLoginAction extends BaseActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//用户名
	private String userName;
	//密码
	private String password;
	
	private List<LoginUser> user;
	//用户登录账号
	private String un;
	//用户id
	private Integer ui;
	//用户真实姓名
	private String realun;
	/**
	 * 用户登录
	 * @throws Exception
	 */
	public void queryLoginUser() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		IQueryLoginUserService queryLoginUserService = getFactory().getFinanceProviderInstance().getQueryLoginUserService();
		LoginUser loginUser = new LoginUser();
		loginUser.setVUsername(userName);
		user = queryLoginUserService.queryLoginUserName(loginUser);
		if(!user.get(0).toString().isEmpty()){
			if(password.equals(user.get(0).getVPassword())){
				session.setAttribute("un", userName);
				session.setAttribute("ui", user.get(0).getVId());
				session.setAttribute("realun", user.get(0).getVRealname());
				
				response.getWriter().write("OK");	
			}
			else  
				response.getWriter().write("halfOK");	
			
		}else
			response.getWriter().write("error");
	}
	//用户名密码输入正确进入主界面
	public String toMain(){
		HttpSession httpSession =ServletActionContext.getRequest().getSession();
	    un = (String) httpSession.getAttribute("un");
		ui= (Integer) httpSession.getAttribute("ui"); 
		realun =  (String) httpSession.getAttribute("realun");
		return SUCCESS;
		
		
	}
	//安全退出系统
	public String back(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		session.invalidate();
		return SUCCESS;	
	}
	
	
	//-------------------------getter and setter------------------
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param password the password to set
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the user
	 */
	public List<LoginUser> getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(List<LoginUser> user) {
		this.user = user;
	}

	/**
	 * @return the un
	 */
	public String getUn() {
		return un;
	}

	/**
	 * @param un the un to set
	 */
	public void setUn(String un) {
		this.un = un;
	}

	/**
	 * @return the ui
	 */
	public Integer getUi() {
		return ui;
	}

	/**
	 * @param ui the ui to set
	 */
	public void setUi(Integer ui) {
		this.ui = ui;
	}

	/**
	 * @return the realun
	 */
	public String getRealun() {
		return realun;
	}

	/**
	 * @param realun the realun to set
	 */
	public void setRealun(String realun) {
		this.realun = realun;
	}
	
	

}
