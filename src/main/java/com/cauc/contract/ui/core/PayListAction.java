package com.cauc.contract.ui.core;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IPayListService;
import com.cauc.contract.pojos.Contract;
import com.cauc.contract.pojos.Payment;
import com.cauc.contract.pojos.PaymentExtends;
import com.cauc.contract.ui.common.BaseActionSupport;
import com.cauc.contract.ui.common.Paging;
import com.cauc.contract.util.JsonToBean;

public class PayListAction extends BaseActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 9162058262778841780L;
	private List<Contract> contract;
	private List<PaymentExtends> viewPaylist;
	//列表页的查询条件
	private String  C_PRIVATE_NAME;//自费生姓名
	private String CContractId;//合同号
	private int TrainingStatus;//训练状态
	private int payNotice;//付款状态
	private int compyId;
	private String cyear;
	
	private int PId;//序号
	private int serialHide;//
	private int serial;//序号
	private int company;//付款单位
	
	private String contractid;//合同号（列表合同号）
	private float receive_money;//预计付款金额
	private float paymentpercent;//百分比
	private Date receivedate;//预计到款时间
	private float money;//实际到款金额
	private String remark;//备注
	private float arrears;//欠款金额
	private String truedate;//实际到款日期
	private String truemoney;//实际到款金额
	
	private String picture;//图片
	private PaymentExtends  viewPayEnity;
	private Payment payment;
	//分页部分
	// 分页
	private Paging paging;

	// 每页显示多少条
	private int pagesize;
	// 当前页码
	private int cur_page;
	// 分页字符串
	private String pageStr;
	
	//查询条件回显
	private String compyName;//签约单位
	private String trainName;//训练状态
	private String year;//年份
	
	private String noticeInfor;//生成通知的字符串
	
	private String downloadUrl;//下载pdf的地址
	
	private String delUrlStr;//删除pdf的地址

	/**
	 * swq
	 * @return
	 * @throws FinanceServiceException 
	 */
	public String showPaylist() throws FinanceServiceException{
		PaymentExtends extend=new PaymentExtends();
		extend.setCPrivateName(C_PRIVATE_NAME);
		extend.setCContractId(CContractId);
		//extend.setPStatus(TrainingStatus);
		extend.setPNoticeStatus(payNotice);
		extend.setP_receivedate(cyear);
		extend.setCCompy(compyId);
		//分页
		int totalRowCount = 0; // 查询到的总条目
		IPayListService payListService =getFactory().getFinanceProviderInstance().getPayListService();
		totalRowCount = payListService.getTotalRowCount("Payment",extend);
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
		viewPaylist = payListService.getListByPage("Payment", this.cur_page, pagesize, "P_ID",extend,"order by P_ID DESC");
		pageStr = this.paging.getToolBar("showPaylist.do?C_PRIVATE_NAME="+C_PRIVATE_NAME+"&CContractId="+CContractId+"&payNotice="+payNotice+"&compyId="+compyId+"&cyear="+cyear);
		if(StringUtils.isNotBlank(extend.getP_receivedate())&&(!("null".equals(extend.getP_receivedate())))){
			year = extend.getP_receivedate();	
		}
		else 
			year =  "年份";
		if(extend.getCCompy() == 0 || extend.getCCompy() == 2){
			compyName = "签约单位";	
		}
		else 
			compyName = payListService.backgetDictionaryNameById(extend.getCCompy());
		if(extend.getPStatus() == 0 || extend.getPStatus() == 512){
			trainName = "训练状态";	
		}
		else 
			trainName = payListService.backgetDictionaryNameById(extend.getPStatus());
		if(!(StringUtils.isNotBlank(extend.getCContractId()))||("null".equals(extend.getCContractId()))){
			CContractId = null;	
		}
		if(!(StringUtils.isNotBlank(extend.getCPrivateName()))||("null".equals(extend.getCPrivateName()))){
			C_PRIVATE_NAME = null;	
		}
		return SUCCESS;
	}
	/** 通过id查询修改记录值，将值传入修改页面
	 * @throws ParseException */
	@SuppressWarnings("unchecked")
	public String updateSearch() throws FinanceServiceException, ParseException{
		IPayListService payListService =getFactory().getFinanceProviderInstance().getPayListService();
		PaymentExtends extend=new PaymentExtends();
		extend.setPId(serialHide);
		viewPayEnity =(PaymentExtends) payListService.UpSearchPayList(extend).get(0);
		// 设置日期格式
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	//	Calendar cal = Calendar.getInstance();		
		//String str = sdf.format(viewPayEnity.getP_receivedate());
		//Date preceiveDate = sdf.parse(viewPayEnity.getP_receivedate());//预收款日期
	//	Date preceiveDate = viewPayEnity.getP_receivedate();
		
		if(viewPayEnity.getP_truedate()!=null){
			List<GradeInfor> list = JsonToBean.makeJavaBean(viewPayEnity.getP_truedate(), GradeInfor.class);
			if(CollectionUtils.isNotEmpty(list)){
				float trueMoney=(float) 0.0;
				float parrears = (float) 0.0;
				for(GradeInfor jsonInfo : list){				
					if(jsonInfo.getTrueMoney()!=null && !jsonInfo.getTrueMoney().equals("")){
						// String转为Date类型							
						float truemoney = Float.parseFloat(jsonInfo.getTrueMoney());							
						//cal.setTime(d);
						trueMoney += truemoney;
					}				
				}
				//预付款
				float preceiveMoney =Float.parseFloat(viewPayEnity.getP_receive_money());
				//百分比
				//float percent = Float.parseFloat(viewPayEnity.getP_payment_percent());
				//欠款金额
				//parrears = preceiveMoney*percent/100 - trueMoney;
				parrears = preceiveMoney - trueMoney;	
				if(parrears > 0){
					viewPayEnity.setP_arrears(String.valueOf(parrears));
				}else{					
					viewPayEnity.setP_arrears(String.valueOf(0.0));
				}
			}					
		}
		return SUCCESS;
	}
	/**
	 * 保存付款修改页面
	 * pxy
	 * @throws ParseException 
	 */
	public String updatePay() throws FinanceServiceException, ParseException{
		try {
			IPayListService payListService =getFactory().getFinanceProviderInstance().getPayListService();	
			PaymentExtends pay = new PaymentExtends();
			//viewPayEnity.setP_arrears(String.valueOf(arrears));
			Payment extend = new Payment();
			extend.setPId(serial);//序号 
			extend.setCCompy(company);//付款单位 
			extend.setPReceiveMoney(receive_money);//预计付款金额
			extend.setPPaymentPercent(paymentpercent);//百分比
			extend.setPReceiveDate(receivedate);//预计到款金额
			//extend.setPMoney(money);//实际到款金额
			//extend.setPArrears(arrears);//欠款金额
			extend.setPRemark(remark);//备注
			extend.setPContractId(contractid);//合同编号
			extend.setPRealityDate(truedate);
			extend.setPPicture(picture);
			payListService.searchPayment(extend);
			
			payListService.UpdatePay(extend);
		} catch (FinanceServiceException e) {
			throw new FinanceServiceException("更新付款记录失败！");
		}
		return SUCCESS;
		
	}
	/**
	 * swq
	 * 保存结算通知
	 * @throws IOException 
	 */
	public void saveNotice() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		IPayListService payListService =getFactory().getFinanceProviderInstance().getPayListService();
	    payListService.saveNotice(noticeInfor,serial);
		response.getWriter().write("OK");			
	}
	/**
	 * swq
	 * pdf 保存与生成通知
	 * @throws IOException
	 */
	public void saveAndGenerateNotice() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		//保存结算通知
		IPayListService payListService =getFactory().getFinanceProviderInstance().getPayListService();
	    payListService.saveNotice(noticeInfor,serial);
	    //生成结算通知的pdf
	    payListService.saveAndGenerateNotice(noticeInfor,serial);
		response.getWriter().write("OK");			
	}
	/**
	 * swq
	 * 下载pdf
	 * @throws IOException 
	 */
	public void downloadPdf() throws IOException{
		String fileurl = downloadUrl;
		// System.out.println("===========文件路径==========="+fileurl);
		// 将文件读入文件流
		InputStream inStream = new FileInputStream(fileurl);
		// 获得浏览器代理信息
		final String userAgent = super.getRequest().getHeader("USER-AGENT");
		// 判断浏览器代理并分别设置响应给浏览器的编码格式
		String finalFileName = null;
		String pdfName = "";
		pdfName = downloadUrl.substring(downloadUrl.lastIndexOf("/")+1);
		if (StringUtils.contains(userAgent, "MSIE") || StringUtils.contains(userAgent, "Trident")) {// IE浏览器
			finalFileName = URLEncoder.encode(pdfName, "UTF8");
			System.out.println("IE浏览器");
		} else if (StringUtils.contains(userAgent, "Mozilla")) {// google,火狐浏览器
			finalFileName = new String(pdfName.getBytes(), "ISO8859-1");
		} else {
			finalFileName = URLEncoder.encode(pdfName, "UTF8");// 其他浏览器
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
	/**
	 * swq
	 * 删除pdf的链接
	 * @throws IOException 
	 */
	public void delNoticeUrl() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		IPayListService payListService =getFactory().getFinanceProviderInstance().getPayListService();
	    payListService.delNoticeUrl(delUrlStr,serial);
		response.getWriter().write("OK");
		
	}
	public void delPicture() throws IOException{
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		IPayListService payListService =getFactory().getFinanceProviderInstance().getPayListService();
	    payListService.delPicture(delUrlStr,serial);
		response.getWriter().write("OK");
	}
	
	
	//-----------------------getter and setter--------------------------
	
	

	public String getDownloadUrl() {
		return downloadUrl;
	}
	public String getDelUrlStr() {
		return delUrlStr;
	}
	public void setDelUrlStr(String delUrlStr) {
		this.delUrlStr = delUrlStr;
	}
	public void setDownloadUrl(String downloadUrl) {
		this.downloadUrl = downloadUrl;
	}
	public List<Contract> getContract() {
		return contract;
	}
	
	public String getNoticeInfor() {
		return noticeInfor;
	}
	public void setNoticeInfor(String noticeInfor) {
		this.noticeInfor = noticeInfor;
	}
	public void setContract(List<Contract> contract) {
		this.contract = contract;
	}
	public List<PaymentExtends> getViewPaylist() {
		return viewPaylist;
	}
	public void setViewPaylist(List<PaymentExtends> viewPaylist) {
		this.viewPaylist = viewPaylist;
	}
	public String getC_PRIVATE_NAME() {
		return C_PRIVATE_NAME;
	}
	public void setC_PRIVATE_NAME(String c_PRIVATE_NAME) {
		C_PRIVATE_NAME = c_PRIVATE_NAME;
	}
	public String getCContractId() {
		return CContractId;
	}
	public void setCContractId(String cContractId) {
		CContractId = cContractId;
	}
	public int getPId() {
		return PId;
	}
	public void setPId(int pId) {
		PId = pId;
	}
	public int getSerialHide() {
		return serialHide;
	}
	public void setSerialHide(int serialHide) {
		this.serialHide = serialHide;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public int getCompany() {
		return company;
	}
	public void setCompany(int company) {
		this.company = company;
	}
	public String getContractid() {
		return contractid;
	}
	public void setContractid(String contractid) {
		this.contractid = contractid;
	}
	public float getReceive_money() {
		return receive_money;
	}
	public void setReceive_money(float receive_money) {
		this.receive_money = receive_money;
	}
	public double getPaymentpercent() {
		return paymentpercent;
	}
	public void setPaymentpercent(float paymentpercent) {
		this.paymentpercent = paymentpercent;
	}
	public Date getReceivedate() {
		return receivedate;
	}
	public void setReceivedate(Date receivedate) {
		this.receivedate = receivedate;
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getTruedate() {
		return truedate;
	}
	public void setTruedate(String truedate) {
		this.truedate = truedate;
	}
	public String getTruemoney() {
		return truemoney;
	}
	public void setTruemoney(String truemoney) {
		this.truemoney = truemoney;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public PaymentExtends getViewPayEnity() {
		return viewPayEnity;
	}
	public void setViewPayEnity(PaymentExtends viewPayEnity) {
		this.viewPayEnity = viewPayEnity;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
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
	public String getCompyName() {
		return compyName;
	}
	public void setCompyName(String compyName) {
		this.compyName = compyName;
	}
	public String getTrainName() {
		return trainName;
	}
	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public int getTrainingStatus() {
		return TrainingStatus;
	}
	public void setTrainingStatus(int trainingStatus) {
		TrainingStatus = trainingStatus;
	}
	public String getCyear() {
		return cyear;
	}
	public void setCyear(String cyear) {
		this.cyear = cyear;
	}
	public int getCompyId() {
		return compyId;
	}
	public void setCompyId(int compyId) {
		this.compyId = compyId;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public float getArrears() {
		return arrears;
	}
	public void setArrears(float arrears) {
		this.arrears = arrears;
	}
	public int getPayNotice() {
		return payNotice;
	}
	public void setPayNotice(int payNotice) {
		this.payNotice = payNotice;
	}
    
}
