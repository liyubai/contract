package com.cauc.contract.pojos;

import java.util.List;

public class PaymentNoticeInfo {
	List<List<PaymentNotice>> NoticeList;
	String NoticeNo;// 编号
	int IntoTraining;// 进入训练
	int TrainingTheory;// 理论培训
	int extendStudies;// 延长学业
	int Grounded;// 停飞
	int TotalCost;// 已收取费用
	String TotalCostCap;// 已收取费用大写
	int CumPercent;// 累计百分比
	List<Integer> OccCost;// 发生费用
	int Balance;// 结余
	String BalanceCap;// 结余大写
	String strCale;// 计算过程展示

	public List<List<PaymentNotice>> getNoticeList() {
		return NoticeList;
	}

	public void setNoticeList(List<List<PaymentNotice>> noticeList) {
		NoticeList = noticeList;
	}

	public String getNoticeNo() {
		return NoticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		NoticeNo = noticeNo;
	}

	public int getIntoTraining() {
		return IntoTraining;
	}

	public void setIntoTraining(int intoTraining) {
		IntoTraining = intoTraining;
	}

	public int getTrainingTheory() {
		return TrainingTheory;
	}

	public void setTrainingTheory(int trainingTheory) {
		TrainingTheory = trainingTheory;
	}

	public int getExtendStudies() {
		return extendStudies;
	}

	public void setExtendStudies(int extendStudies) {
		this.extendStudies = extendStudies;
	}

	public int getGrounded() {
		return Grounded;
	}

	public void setGrounded(int grounded) {
		Grounded = grounded;
	}

	public int getTotalCost() {
		return TotalCost;
	}

	public void setTotalCost(int totalCost) {
		TotalCost = totalCost;
	}

	public String getTotalCostCap() {
		return TotalCostCap;
	}

	public void setTotalCostCap(String totalCostCap) {
		TotalCostCap = totalCostCap;
	}

	public int getCumPercent() {
		return CumPercent;
	}

	public void setCumPercent(int cumPercent) {
		CumPercent = cumPercent;
	}

	public List<Integer> getOccCost() {
		return OccCost;
	}

	public void setOccCost(List<Integer> occCost) {
		OccCost = occCost;
	}

	public int getBalance() {
		return Balance;
	}

	public void setBalance(int balance) {
		Balance = balance;
	}

	public String getBalanceCap() {
		return BalanceCap;
	}

	public void setBalanceCap(String balanceCap) {
		BalanceCap = balanceCap;
	}

	public String getStrCale() {
		return strCale;
	}

	public void setStrCale(String strCale) {
		this.strCale = strCale;
	}
}
