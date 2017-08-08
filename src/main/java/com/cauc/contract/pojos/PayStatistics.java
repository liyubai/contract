package com.cauc.contract.pojos;

import java.util.ArrayList;
import java.util.List;

import com.cauc.contract.ui.core.StudentNameNoNew;

public class PayStatistics {
	/**
	 * List
	 */
	private int CId;
	//年份
	private String year;
	//合同编号
	private String contractId;
	private String pcontractId;
	//状态
	private String cstatus;
	//客户单位
	private String company;
	//合同类型
	private String contractType;
	//成交价
	private String cdealPrice;
	
	//private int payStatus;//付款状态
	private String contractStatus;//状态
	private String quantities ;  //标的额
	private String expectedPayment ;//预计收款
	private String noticePayment;//通知收款
	private String sumQuan; //标的额合计
	private String sumEPay; //预计收款合计
	private String sumNpay; //通知收款合计
	private String sumTMoney;//实际收款合计
	
	private String PPrealityDate;
	private String PContractKey;
	private String PNoticeStatus; //通知状态（付款状态）
	private String PReceiveMoney;
	private String PReceiveDate;
	private String trueMoney;//实际到款金额
	private String trueDate;//实际到款日期
	private String gradeInfo;// 年级学生信息(JSON)	
	private String studentCount;//学生人数
	private List<StudentNameNoNew> studentNameNo=new ArrayList<StudentNameNoNew>();
	
	//接收界面参数
	private String rtime;//年份
	private String rcontractId;//合同号
	private int  rcontractType;//合同类型
	private int rcontractStatus;//合同
	private int rcompany;//付款单位
	private int rpayStatus;//付款状态
	private String rbeginTime;//开始时间
	private String rendTime;//结束时间


	
	//-----------------------getter and setter-------------------
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getContractType() {
		return contractType;
	}
	public void setContractType(String contractType) {
		this.contractType = contractType;
	}
	public String getContractStatus() {
		return contractStatus;
	}
	public void setContractStatus(String contractStatus) {
		this.contractStatus = contractStatus;
	}
	
//	public int getPayStatus() {
//		return payStatus;
//	}
//	public void setPayStatus(int payStatus) {
//		this.payStatus = payStatus;
//	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getRcontractId() {
		return rcontractId;
	}
	public void setRcontractId(String rcontractId) {
		this.rcontractId = rcontractId;
	}
	public int getRcontractType() {
		return rcontractType;
	}
	public void setRcontractType(int rcontractType) {
		this.rcontractType = rcontractType;
	}
	public int getRcontractStatus() {
		return rcontractStatus;
	}
	public void setRcontractStatus(int rcontractStatus) {
		this.rcontractStatus = rcontractStatus;
	}
	public int getRcompany() {
		return rcompany;
	}
	public void setRcompany(int rcompany) {
		this.rcompany = rcompany;
	}
	public int getRpayStatus() {
		return rpayStatus;
	}
	public void setRpayStatus(int rpayStatus) {
		this.rpayStatus = rpayStatus;
	}
	public String getRbeginTime() {
		return rbeginTime;
	}
	public void setRbeginTime(String rbeginTime) {
		this.rbeginTime = rbeginTime;
	}
	public String getRendTime() {
		return rendTime;
	}
	public void setRendTime(String rendTime) {
		this.rendTime = rendTime;
	}

	public String getCdealPrice() {
		return cdealPrice;
	}
	public void setCdealPrice(String cdealPrice) {
		this.cdealPrice = cdealPrice;
	}
	public int getCId() {
		return CId;
	}
	public void setCId(int cId) {
		CId = cId;
	}
	public String getCstatus() {
		return cstatus;
	}
	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}
	public String getQuantities() {
		return quantities;
	}
	public void setQuantities(String quantities) {
		this.quantities = quantities;
	}
	public String getExpectedPayment() {
		return expectedPayment;
	}
	public void setExpectedPayment(String expectedPayment) {
		this.expectedPayment = expectedPayment;
	}
	public String getNoticePayment() {
		return noticePayment;
	}
	public void setNoticePayment(String noticePayment) {
		this.noticePayment = noticePayment;
	}
	public String getPPrealityDate() {
		return PPrealityDate;
	}
	public void setPPrealityDate(String pPrealityDate) {
		PPrealityDate = pPrealityDate;
	}
	public String getPContractKey() {
		return PContractKey;
	}
	public void setPContractKey(String pContractKey) {
		PContractKey = pContractKey;
	}
	public String getPNoticeStatus() {
		return PNoticeStatus;
	}
	public void setPNoticeStatus(String pNoticeStatus) {
		PNoticeStatus = pNoticeStatus;
	}
	public String getPReceiveMoney() {
		return PReceiveMoney;
	}
	public void setPReceiveMoney(String pReceiveMoney) {
		PReceiveMoney = pReceiveMoney;
	}
	public String getPReceiveDate() {
		return PReceiveDate;
	}
	public void setPReceiveDate(String pReceiveDate) {
		PReceiveDate = pReceiveDate;
	}
	public String getGradeInfo() {
		return gradeInfo;
	}
	public void setGradeInfo(String gradeInfo) {
		this.gradeInfo = gradeInfo;
	}
	public String getStudentCount() {
		return studentCount;
	}
	public void setStudentCount(String studentCount) {
		this.studentCount = studentCount;
	}
	public String getPcontractId() {
		return pcontractId;
	}
	public void setPcontractId(String pcontractId) {
		this.pcontractId = pcontractId;
	}
	public String getTrueMoney() {
		return trueMoney;
	}
	public void setTrueMoney(String trueMoney) {
		this.trueMoney = trueMoney;
	}
	public String getTrueDate() {
		return trueDate;
	}
	public void setTrueDate(String trueDate) {
		this.trueDate = trueDate;
	}
	public String getSumQuan() {
		return sumQuan;
	}
	public void setSumQuan(String sumQuan) {
		this.sumQuan = sumQuan;
	}
	public String getSumEPay() {
		return sumEPay;
	}
	public void setSumEPay(String sumEPay) {
		this.sumEPay = sumEPay;
	}
	public String getSumNpay() {
		return sumNpay;
	}
	public void setSumNpay(String sumNpay) {
		this.sumNpay = sumNpay;
	}
	public String getSumTMoney() {
		return sumTMoney;
	}
	public void setSumTMoney(String sumTMoney) {
		this.sumTMoney = sumTMoney;
	}
	public List<StudentNameNoNew> getStudentNameNo() {
		return studentNameNo;
	}
	public void setStudentNameNo(List<StudentNameNoNew> studentNameNo) {
		this.studentNameNo = studentNameNo;
	}
	
	
}

