package com.cauc.contract.util;

import java.io.Serializable;

public class AccountListBean implements Serializable{
	private Integer aid; 
	private String accountNo;//结算编号
	private Integer paymentNo;//付款编号
	private String contractNo;//合同号
	private String fundsType;//经费类型
	private Float fundsSubtotal;//经费小计
	private Integer accountState;//结算状态
	private Integer paymentState;//付款状态
	private Float PBuildFeeStandardPrice;//飞行技术学院应分配合作共建费收费标准
	private Float PTrainFeeStandardPrice;//飞行技术学院应分配参与分成培训费收费标准
	private Integer PGradeStudentCount; //飞行技术学院收费人数
	public Integer getPGradeStudentCount() {
		return PGradeStudentCount;
	}
	public void setPGradeStudentCount(Integer pGradeStudentCount) {
		PGradeStudentCount = pGradeStudentCount;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public Float getPBuildFeeStandardPrice() {
		return PBuildFeeStandardPrice;
	}
	public void setPBuildFeeStandardPrice(Float pBuildFeeStandardPrice) {
		PBuildFeeStandardPrice = pBuildFeeStandardPrice;
	}
	public Float getPTrainFeeStandardPrice() {
		return PTrainFeeStandardPrice;
	}
	public void setPTrainFeeStandardPrice(Float pTrainFeeStandardPrice) {
		PTrainFeeStandardPrice = pTrainFeeStandardPrice;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public Integer getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(Integer paymentNo) {
		this.paymentNo = paymentNo;
	}
	public String getContractNo() {
		return contractNo;
	}
	public void setContractNo(String contractNo) {
		this.contractNo = contractNo;
	}
	public String getFundsType() {
		return fundsType;
	}
	public void setFundsType(String fundsType) {
		this.fundsType = fundsType;
	}
	public Float getFundsSubtotal() {
		return fundsSubtotal;
	}
	public void setFundsSubtotal(Float fundsSubtotal) {
		this.fundsSubtotal = fundsSubtotal;
	}
	public Integer getAccountState() {
		return accountState;
	}
	public void setAccountState(Integer accountState) {
		this.accountState = accountState;
	}
	public Integer getPaymentState() {
		return paymentState;
	}
	public void setPaymentState(Integer paymentState) {
		this.paymentState = paymentState;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	
	
}
