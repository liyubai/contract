package com.cauc.contract.ui.core;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.cauc.contract.business.AccountService;
import com.cauc.contract.pojos.Account;
import com.cauc.contract.ui.common.BaseActionSupport;

@Controller
@Scope("prototype")
public class UpdateAccountAction extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String accountId;
	private int accountState;
	private String Url;
	private List<Account> initlist;
	private Account account;
	private String realun;
	private int aid;
	private String downloadExcelStr;// 下载Excel的文件名
	private String excelName;// 下载的文件名

	/**
	 * 初始化页面数据 CQ
	 * 
	 * @return
	 */
	public String UpdateAccountInit() {
		// 根据结算编号和结算状态查询文件路径(Url)
		AccountService accountService = getFactory().getFinanceProviderInstance().getAccountService();
		initlist = accountService.selectFileUrl(aid);
		account = initlist.get(0);
		account.setANoticeUrl(account.getANoticeUrl());
		return SUCCESS;
	}

	/**
	 * 更新结算节点信心
	 * 
	 * @return
	 * @throws IOException
	 */
	public String updateAccountById() throws IOException {
		HttpSession httpSession = ServletActionContext.getRequest().getSession();
		realun = (String) httpSession.getAttribute("realun");
		AccountService accountService = getFactory().getFinanceProviderInstance().getAccountService();
		// 获取当前系统时间
		Date date = new Date();
		Timestamp now = new Timestamp(date.getTime());
		Account account = getUpdateInfo(aid, accountId, accountState, now, realun);
		accountService.updateAccountById(account);
		return SUCCESS;
	}

	/**
	 * 封装前端参数
	 * 
	 * @param accountId
	 * @param accountState
	 * @param Url
	 * @param now
	 * @param realun
	 * @return
	 */
	public Account getUpdateInfo(int aid, String accountId, int accountState, Timestamp now, String realun) {
		Account account = new Account();
		account.setAId(aid);
		account.setAAccountId(accountId);
		account.setAAccountState(accountState);
		// account.setANoticeUrl(Url);
		account.setALastModifyTime(now);
		account.setALastModifyPerson(realun);
		return account;
	}

	/**
	 * 下载Excel文件
	 * 
	 * @throws IOException
	 */
	public void downloadExcel() throws IOException {

		/*
		 * HttpServletResponse response = ServletActionContext.getResponse();
		 * response.setContentType("text/html;charset=UTF-8"); AccountService
		 * accountService =
		 * getFactory().getFinanceProviderInstance().getAccountService(); String
		 * downlaod = accountService.downloadExcel(downloadExcelStr, excelName);
		 * if (downlaod.equals("success")) { response.getWriter().write("OK"); }
		 * else response.getWriter().write("error");
		 */
		// 根据条件得到文件路径
		String fileurl = downloadExcelStr;
		// System.out.println("===========文件路径==========="+fileurl);
		// 将文件读入文件流
		InputStream inStream = new FileInputStream(System.getProperty("user.dir") + "\\excel\\" + fileurl);
		// 获得浏览器代理信息
		final String userAgent = super.getRequest().getHeader("USER-AGENT");
		// 判断浏览器代理并分别设置响应给浏览器的编码格式
		String finalFileName = null;
		excelName = excelName + ".xls";
		if (StringUtils.contains(userAgent, "MSIE") || StringUtils.contains(userAgent, "Trident")) {// IE浏览器
			finalFileName = URLEncoder.encode(excelName, "UTF8");
			System.out.println("IE浏览器");
		} else if (StringUtils.contains(userAgent, "Mozilla")) {// google,火狐浏览器
			finalFileName = new String(excelName.getBytes(), "ISO8859-1");
		} else {
			finalFileName = URLEncoder.encode(excelName, "UTF8");// 其他浏览器
		}
		// 设置HTTP响应头
		super.getResponse().reset();// 重置 响应头
		super.getResponse().setContentType("application/x-download");// 告知浏览器下载文件，而不是直接打开，浏览器默认为打开
		super.getResponse().addHeader("Content-Disposition", "attachment;filename=\"" + finalFileName + "\"");// 下载文件的名称
		// System.out.println(excelName);
		// 循环取出流中的数据
		byte[] b = new byte[1024];
		int len;

		while ((len = inStream.read(b)) > 0) {
			super.getResponse().getOutputStream().write(b, 0, len);
		}
		inStream.close();
		super.getResponse().getOutputStream().close();

	}

	/** ------------------get/set方法-------------------------------- */
	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public int getAccountState() {
		return accountState;
	}

	public void setAccountState(int accountState) {
		this.accountState = accountState;
	}

	public String getUrl() {
		return Url;
	}

	public void setUrl(String url) {
		Url = url;
	}

	public List<Account> getInitlist() {
		return initlist;
	}

	public void setInitlist(List<Account> initlist) {
		this.initlist = initlist;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public String getRealun() {
		return realun;
	}

	public void setRealun(String realun) {
		this.realun = realun;
	}

	public int getAid() {
		return aid;
	}

	public void setAid(int aid) {
		this.aid = aid;
	}

	public String getDownloadExcelStr() {
		return downloadExcelStr;
	}

	public void setDownloadExcelStr(String downloadExcelStr) {
		this.downloadExcelStr = downloadExcelStr;
	}

	public String getExcelName() {
		return excelName;
	}

	public void setExcelName(String excelName) {
		this.excelName = excelName;
	}

}
