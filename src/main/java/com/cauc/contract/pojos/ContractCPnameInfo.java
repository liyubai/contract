package com.cauc.contract.pojos;

import java.util.Date;

public class ContractCPnameInfo {
	/**
	 * 借点描述CPnameInfo  JSON
	 */
	//节点描述
	private String PName; 
	//**经费类型
	private int PFundBudgetType; 
	//收款进程
	private int PProcessState; 
	// 1月  2年
	private int PProStatusYM;
	//**共建费收费标准
	private float PBuildFeeStandardPrice;
	//**分成培训费收费标准
	private float PTrainFeeStandardPrice;
	//百分比
	private float PPaymentPercent;
	
	
	public String getPName() {
		return PName;
	}
	public void setPName(String pName) {
		PName = pName;
	}
	public int getPFundBudgetType() {
		return PFundBudgetType;
	}
	public void setPFundBudgetType(int pFundBudgetType) {
		PFundBudgetType = pFundBudgetType;
	}
	public int getPProcessState() {
		return PProcessState;
	}
	public void setPProcessState(int pProcessState) {
		PProcessState = pProcessState;
	}
	public float getPBuildFeeStandardPrice() {
		return PBuildFeeStandardPrice;
	}
	public void setPBuildFeeStandardPrice(float pBuildFeeStandardPrice) {
		PBuildFeeStandardPrice = pBuildFeeStandardPrice;
	}
	public float getPTrainFeeStandardPrice() {
		return PTrainFeeStandardPrice;
	}
	public void setPTrainFeeStandardPrice(float pTrainFeeStandardPrice) {
		PTrainFeeStandardPrice = pTrainFeeStandardPrice;
	}
	public float getPPaymentPercent() {
		return PPaymentPercent;
	}
	public void setPPaymentPercent(float pPaymentPercent) {
		PPaymentPercent = pPaymentPercent;
	}
	public int getPProStatusYM() {
		return PProStatusYM;
	}
	public void setPProStatusYM(int pProStatusYM) {
		PProStatusYM = pProStatusYM;
	}

	
}
