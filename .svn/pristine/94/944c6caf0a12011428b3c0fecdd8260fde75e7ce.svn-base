package com.cauc.contract.ui.core;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.CollectionUtils;
import org.apache.struts2.ServletActionContext;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IUserManagentService;
import com.cauc.contract.pojos.LoginUser;
import com.cauc.contract.pojos.LoginUserExtends;
import com.cauc.contract.pojos.TContractRole;
import com.cauc.contract.ui.common.BaseActionSupport;
import com.cauc.contract.ui.common.Paging;

/**
 * 用户管理的Action
 * 
 * @author swq
 */
public class UserManagentAction extends BaseActionSupport {
	
    private String userName;
    private String password; 
    private String realName;
    private Integer role;
	private LoginUser user;
	private int id;
	private List<LoginUser> userList;
	private List<LoginUserExtends> userListExtends;
	private List<TContractRole> roleList;
	//系统登录用户id
	private Integer ui;
	
	
	//分页部分
	// 分页
	private Paging paging;

	// 每页显示多少条
	private int pagesize;
	// 当前页码
	private int cur_page;
	// 分页字符串
	private String pageStr;
	
	
	
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -1718773443350401081L;

	/**
	 * 查询显示用户管理页面用的数据
	 * 
	 * @return
	 * @throws FinanceServiceException 
	 */
	public String showManagent() throws FinanceServiceException {
		//分页
		int totalRowCount = 0; // 查询到的总条目
		IUserManagentService service = getFactory().getFinanceProviderInstance().getContractUserManagentService();
		totalRowCount = service.getTotalRowCount("LoginUser");
		this.paging = new Paging();
		// 当前页码
		if (this.cur_page == 0) {
			this.cur_page = 1;
		}
		// 每页显示数目
		this.pagesize=5;
		// 设置当前页码
		this.paging.setCurPage(this.cur_page);
		// 把得到总共显示的数据记录设置在分页总纪录中
		this.paging.setTotalRowCount(totalRowCount);
		// 设置每页显示的数据记录 （根据页面显示条数设置 ）
		this.paging.setPageRowCount(this.pagesize);
		
		
		//List<LoginUserExtends> loginUserExtendsList1 = new ArrayList<LoginUserExtends>();
		userListExtends = service.getListByPage("LoginUser", this.cur_page, pagesize, "v_id"," 1=1 ","order by v_id");
		roleList = service.readAllRole();
		pageStr = this.paging.getToolBar("userManagent_showManagent.do");
		return SUCCESS;
	}

	/**
	 * 增加用户信息
	 * 
	 * @return
	 */
	public String addUser() {
		HttpSession httpSession =ServletActionContext.getRequest().getSession();
		ui= (Integer) httpSession.getAttribute("ui"); 
		user.setVUsername(userName);
		user.setVPassword(password);
		user.setVRoleId(role);
		user.setVCreateUserId(ui);
		user.setVRealname(realName);
		try {
			IUserManagentService service = getFactory().getFinanceProviderInstance().getContractUserManagentService();
			service.saveUser(user);
			return showManagent();
		} catch (FinanceServiceException e) {
			return ERROR;
		}
	}

	/**
	 * 更新用户信息
	 * 
	 * @return
	 */
	public String updateUser() throws FinanceServiceException {
		HttpSession httpSession =ServletActionContext.getRequest().getSession();
		ui= (Integer) httpSession.getAttribute("ui"); 
		try {
			LoginUser updateUser = new LoginUser();
			updateUser.setVId(id);
			updateUser.setVUsername(userName);
			updateUser.setVPassword(password);
			updateUser.setVRoleId(role); 
			updateUser.setVLastModiyUser(ui);
			updateUser.setVRealname(realName);
			IUserManagentService service = getFactory().getFinanceProviderInstance().getContractUserManagentService();
			service.updateUser(updateUser);
			return SUCCESS;
		} catch (FinanceServiceException e) {
			e.printStackTrace();
			return ERROR;
		}
		
	}
	/**
	 * 查询用户表，判断用户是否已经存在
	 * @throws Exception
	 */
	public void findUserName() throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
		LoginUser user = new LoginUser();
		user.setVUsername(userName);
		List<LoginUser> userList = new ArrayList<LoginUser>();
		IUserManagentService service = getFactory().getFinanceProviderInstance().getContractUserManagentService();
		userList = service.findUserName(user);
		response.setContentType("text/html;charset=UTF-8");
		if(CollectionUtils.isNotEmpty(userList)){
			response.getWriter().write("失败");
		}else
			response.getWriter().write("OK");
	}


	
	
	//---------------------getter and setter---------------------------
	/**
	 * @return the user
	 */
	public LoginUser getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(LoginUser user) {
		this.user = user;
	}

	/**
	 * @return the userList
	 */
	public List<LoginUser> getUserList() {
		return userList;
	}

	/**
	 * @param userList the userList to set
	 */
	public void setUserList(List<LoginUser> userList) {
		this.userList = userList;
	}

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
	 * @return the role
	 */
	public Integer getRole() {
		return role;
	}

	/**
	 * @param role the role to set
	 */
	public void setRole(Integer role) {
		this.role = role;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the userListExtends
	 */
	public List<LoginUserExtends> getUserListExtends() {
		return userListExtends;
	}

	/**
	 * @param userListExtends the userListExtends to set
	 */
	public void setUserListExtends(List<LoginUserExtends> userListExtends) {
		this.userListExtends = userListExtends;
	}

	/**
	 * @return the roleList
	 */
	public List<TContractRole> getRoleList() {
		return roleList;
	}

	/**
	 * @param roleList the roleList to set
	 */
	public void setRoleList(List<TContractRole> roleList) {
		this.roleList = roleList;
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
	 * @return the realName
	 */
	public String getRealName() {
		return realName;
	}

	/**
	 * @param realName the realName to set
	 */
	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getCur_page() {
		return cur_page;
	}

	public void setCur_page(int cur_page) {
		this.cur_page = cur_page;
	}

	public String getPageStr() {
		return pageStr;
	}

	public void setPageStr(String pageStr) {
		this.pageStr = pageStr;
	}
    
	
	
	




	
	
	

}