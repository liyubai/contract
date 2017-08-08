package com.cauc.contract.ui.common;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.util.ServletContextAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.cauc.contract.business.FinanceFactory;
import com.cauc.contract.business.dao.support.Page;
import com.cauc.contract.config.FinanceConfig;
import com.cauc.contract.util.Constants;
import com.opensymphony.xwork2.ActionSupport;


/**
 * struts2 Action 基类 此类中封装一些公用的信息 如：上传文件 request reponse
 * 
 * @author fuchaohui
 */
@Controller
@Scope("prototype")
public class BaseActionSupport extends ActionSupport implements
		ServletRequestAware, ServletResponseAware, ServletContextAware {

	@Autowired
	private FinanceFactory factory;
	
//	@Autowired
//	@Qualifier("dataDicProvider")
//	private DataDicProvider dataDirProvider;
//	
	private static final long serialVersionUID = -2581357479368166034L;

	private HttpServletRequest request;

	private HttpServletResponse response;

	private ServletContext context;

	private List<File> upload;

	private List<String> uploadContentType;

	private List<String> uploadFileName;

	private Page page;

	private String errorMessage;

	private String statusMsg;
	
	private String pageIndex="1";
	
	private String viewDate;//当前日期
	
	private String write;

	/**
	 * @return the ersYear
	 */
	public String getErsYear() {
		return FinanceConfig.getProperty("default.ersYear");
	}

	/**
	 * @return the statusMsg
	 */
	public String getStatusMsg() {
		return statusMsg;
	}

	/**
	 * 设置 action返回 提示信息
	 * 
	 * @param statusMsg
	 *            the statusMsg to set
	 */
	public void setStatusMsg(String statusMsg) {
		this.statusMsg = statusMsg;
	}

	/**
	 * 公共跳转方法
	 * 
	 * return Struts2 Action.SUCCESS
	 */
	public String forward() throws Exception {
		return SUCCESS;
	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}

	public void setServletContext(ServletContext context) {
		this.context = context;

	}

	/**
	 * 获取上传文件列表
	 * 
	 * @return the upload
	 */
	public List<File> getUpload() {
		return upload;
	}

	/**
	 * 设置上传文件列表
	 * 
	 * @param upload
	 *            the upload to set
	 */
	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	/**
	 * 获取上传文件类型列表
	 * 
	 * @return the uploadContentType
	 */
	public List<String> getUploadContentType() {
		return uploadContentType;
	}

	/**
	 * 设置上传文件类型列表
	 * 
	 * @param uploadContentType
	 *            the uploadContentType to set
	 */
	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	/**
	 * 获取上传文件名称列表
	 * 
	 * @return the uploadFileName
	 */
	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	/**
	 * 设置上传文件名称列表
	 * 
	 * @param uploadFileName
	 *            the uploadFileName to set
	 */
	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	/**
	 * 获取分页辅助类
	 * 
	 * @return the page
	 */
	public Page getPage() {
		return page;
	}

	/**
	 * 设置分页辅助类
	 * 
	 * @param page
	 *            the page to set
	 */
	public void setPage(Page page) {
		this.page = page;
	}

	/**
	 * 获取服务器URL
	 * 
	 * @return String-url 如：http://www.query.com/proposal_qs
	 */
	protected String getServerURL() {
		String uri = request.getRequestURI();
		String servletPath = request.getServletPath();
		String projectName = uri.substring(0, uri.lastIndexOf(servletPath));
		if (request.getServerPort() == 80) {
			return "http://" + request.getServerName() + projectName;
		} else
			return "http://" + request.getServerName() + ":"
					+ request.getServerPort() + projectName;
	}

	/**
	 * 获取绝对路径
	 * 
	 * @param relativePath
	 *            相对路径
	 * @return String real path 如：c:\windows\system32
	 */
	protected String getRealPath(String relativePath) {
		return context.getRealPath(relativePath);
	}

	/**
	 * 获取HttpRequest对象
	 * 
	 * @return the request
	 */
	public HttpServletRequest getRequest() {
		return request;
	}

	/**
	 * 获取HttpReponse对象
	 * 
	 * @return the response
	 */
	public HttpServletResponse getResponse() {
		return response;
	}

	/**
	 * 获取 HttpSession 对象
	 * 
	 * @return the HttpSession
	 */
	public HttpSession getSession() {
		return this.request.getSession();
	}

	/**
	 * @return the errorMsg
	 */
	public String getErrorMessage() {
		return errorMessage;
	}

	/**
	 * @param errorMsg
	 *            the errorMsg to set
	 */
	public void setErrorMessage(String errorMsg) {
		this.errorMessage = errorMsg;
	}

	@Override
	public void addActionError(String errorMessage) {
		this.setErrorMessage(errorMessage);
		super.addActionError(errorMessage);
	}

	public String getPageIndex() {
		if(pageIndex.matches("\\d+"))
			return pageIndex;
		else
			return "1";
	}

	public void setPageIndex(String pageIndex) {
		this.pageIndex = pageIndex;
	}

	/**
	 * 获取 服务提高工厂
	 * @return factory
	 */
	public FinanceFactory getFactory() {
		return factory;
	}
	/**
	 * 获取用户登录上下文对象
	 *  
	 * @return LoginContext
	 */
	public LoginContext getLoginContext(){
		if(getSession()!=null && getSession().getAttribute(Constants.LOGIN_CONTEXT)!=null)
			return (LoginContext)getSession().getAttribute(Constants.LOGIN_CONTEXT);
		else
			return null;
	}

//	/**
//	 * 获取数据字典
//	 * @return dataDirProvider
//	 */
//	public DataDicProvider getDataDirProvider() {
//		return dataDirProvider;
//	}

	public String getViewDate() {
		return viewDate;
	}

	public void setViewDate(String viewDate) {
		this.viewDate = viewDate;
	}

	public String getWrite() {
		return write;
	}

	public void setWrite(String write) {
		this.write = write;
	}
	
}