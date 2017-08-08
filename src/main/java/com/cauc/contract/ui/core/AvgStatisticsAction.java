package com.cauc.contract.ui.core;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IAvgStatisticsService;
import com.cauc.contract.pojos.Average;
import com.cauc.contract.pojos.Dictionary;
import com.cauc.contract.ui.common.BaseActionSupport;
import com.cauc.contract.util.JsonToBean;

public class AvgStatisticsAction extends  BaseActionSupport {
	/**
	 * guot
	 */
	private static final long serialVersionUID = 1L;
	private String cyear;//页面选定年份
	private String p_receive;//接收页面传递年份
	private String contractId;//合同号	
	private String targetAmount;//标的额
	private String trainPrice;//训练报价
	private String partyPrice;//合作共建
	private String trainTheory;//理论培训
	private String trainBalance;//训练费余额
	private String avgTrainB ;//平均训练费余额
	private String dealPrice; //成交价
	private String cSignTime;//签订时间
	
	private String gradeInfo;// 年级学生信息(JSON)	
	private String paymentInfo;// 付款详细信息 json
	private List<Average> AvgList;
	private List<Average> AverageList;
	private List<Dictionary> DicList;
	//private Dictionary dictionary;
	//private Average avg;
	
	//显示平均统计列表信息
	@SuppressWarnings({ "unchecked", "unused" })
	public String showAvgStatistics() throws FinanceServiceException{
		IAvgStatisticsService AvgStatistics = getFactory().getFinanceProviderInstance().getAvgStatisticsService();
		Average average = new Average();
		if(cyear==null||"".equals(cyear)){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
	        Date date = new Date();
	        cyear = sdf.format(date); //获取当前年份			
		}
		average.setP_receive(cyear);
		AvgList=AvgStatistics.showAvgList(average);
		DicList=AvgStatistics.showDicList();
		double sumTrainP=0.00;
		int sumNum=0;
		java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
		nf.setGroupingUsed(false); //避免double数据显示科学记数法
		if (CollectionUtils.isNotEmpty(AvgList)){
			Average aver = new Average();
			List<Average> AList = new ArrayList<Average>();
			for(Average avg:AvgList){  //循环选定年份所有合同contractId
				int num=0;//学生人数
				double partyPrice=0.00;//合作共建
				double trainPrice=0.00;//训练报价
				double trainTheory=0.00;//理论培训
				double trainBalance=0.00;//训练费余额				
				//循环得到学生人数,标的额
				if(avg.getGradeInfo()!=null && !avg.getGradeInfo().equals("0")){
					List<Average> jsonList = JsonToBean.makeJavaBean(avg.getGradeInfo(), Average.class);
					if (CollectionUtils.isNotEmpty(jsonList)) {
						for(Average jsonInfor:jsonList){ //循环每份合同中的学生信息GradeInfo
							num+=Integer.parseInt(jsonInfor.getStudentCount().toString());
						}
						avg.setStudentCount(String.valueOf(num));
						avg.setTargetAmount(String.valueOf(Integer.parseInt(avg.getDealPrice().toString())*num));
					}
				}
				//System.out.println(avg.getStudentCount()+"-"+avg.getTargetAmount());
				//循环计算飞行训练,合作共建,理论培训费用
				if(avg.getPaymentInfo()!=null && !avg.getPaymentInfo().equals("0")){
					List<Average> PaymentInfo =JsonToBean.makeJavaBean(avg.getPaymentInfo(), Average.class);
					//System.out.println(JSONInfor.getName());
					if(CollectionUtils.isNotEmpty(PaymentInfo)){
						for(Average JSONInfor:PaymentInfo){
							if(CollectionUtils.isNotEmpty(DicList)){
								for(Dictionary dic:DicList){ //循环topId
									// 合作共建
									if(dic.getTopId()==516 && JSONInfor.getName().equals(String.valueOf(dic.getDictionaryId()))){
										if(JSONInfor.getValue()!=null && !JSONInfor.getValue().equals("")){
											partyPrice+=Double.parseDouble(JSONInfor.getValue().toString());
										}else continue;										
									}
									// 理论培训
									if(dic.getTopId()==517 && JSONInfor.getName().equals(String.valueOf(dic.getDictionaryId()))){
										if(JSONInfor.getValue()!=null && !JSONInfor.getValue().equals("")){
											trainTheory+=Double.parseDouble(JSONInfor.getValue().toString());
										}else continue;										
									}
									// 训练报价
									if(dic.getTopId()==518 && JSONInfor.getName().equals(String.valueOf(dic.getDictionaryId()))){
										if(JSONInfor.getValue()!=null && !JSONInfor.getValue().equals("")){
											trainPrice+=Double.parseDouble(JSONInfor.getValue().toString());
										}else continue;										
									}
								}
							}
						}
					}
				}
				avg.setPartyPrice(nf.format(new Double(String.valueOf(partyPrice))));
				avg.setTrainTheory(nf.format(new Double(String.valueOf(trainTheory))));
				avg.setTrainPrice(nf.format(new Double(String.valueOf(trainPrice))));
				double temp=Double.parseDouble(avg.getPartyPrice().toString())+Double.parseDouble(avg.getTrainTheory().toString());
				double tempt=Double.parseDouble(avg.getDealPrice().toString())-temp;
				avg.setTrainBalance(nf.format(new Double(String.valueOf(tempt))));
				//System.out.println(avg.getTrainBalance());
				if(avg.getGradeInfo()!=null && !avg.getGradeInfo().equals("0")){
					//每份合同的总训练费 sumTrainP
					sumTrainP += Double.parseDouble(avg.getStudentCount().toString())*Double.parseDouble(avg.getTrainBalance().toString());
					//总人数 sumNum
					sumNum +=Double.parseDouble(avg.getStudentCount().toString());
				}else continue;
			}
			//每个年份全部合同的平均训练费 avgTrainP
			double avgTrainP=sumTrainP/sumNum;
			aver.setAvgTrainB(nf.format(new Double(String.valueOf(avgTrainP))));
			AList.add(aver);
			setAverageList(AList);
		}	
		return SUCCESS;
	}

		
	//  getter and setter
	public List<Average> getAvgList() {
		return AvgList;
	}
	public void setAvgList(List<Average> avgList) {
		AvgList = avgList;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getCyear() {
		return cyear;
	}
	public void setCyear(String cyear) {
		this.cyear = cyear;
	}
	public String getP_receive() {
		return p_receive;
	}
	public void setP_receive(String p_receive) {
		this.p_receive = p_receive;
	}
//	public Average getAvg() {
//		return avg;
//	}
//	public void setAvg(Average avg) {
//		this.avg = avg;
//	}
    public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	public String getTargetAmount() {
		return targetAmount;
	}
	public void setTargetAmount(String targetAmount) {
		this.targetAmount = targetAmount;
	}
	public String getTrainPrice() {
		return trainPrice;
	}
	public void setTrainPrice(String trainPrice) {
		this.trainPrice = trainPrice;
	}
	public String getPartyPrice() {
		return partyPrice;
	}
	public void setPartyPrice(String partyPrice) {
		this.partyPrice = partyPrice;
	}
	public String getTrainTheory() {
		return trainTheory;
	}
	public void setTrainTheory(String trainTheory) {
		this.trainTheory = trainTheory;
	}
	public String getTrainBalance() {
		return trainBalance;
	}
	public void setTrainBalance(String trainBalance) {
		this.trainBalance = trainBalance;
	}
	public String getDealPrice() {
		return dealPrice;
	}
	public void setDealPrice(String dealPrice) {
		this.dealPrice = dealPrice;
	}
	public String getcSignTime() {
		return cSignTime;
	}
	public void setcSignTime(String cSignTime) {
		this.cSignTime = cSignTime;
	}
	public String getGradeInfo() {
		return gradeInfo;
	}
	public void setGradeInfo(String gradeInfo) {
		this.gradeInfo = gradeInfo;
	}
	public String getPaymentInfo() {
		return paymentInfo;
	}
	public void setPaymentInfo(String paymentInfo) {
		this.paymentInfo = paymentInfo;
	}
	public List<Dictionary> getDicList() {
		return DicList;
	}
	public void setDicList(List<Dictionary> dicList) {
		DicList = dicList;
	}
	public String getAvgTrainB() {
		return avgTrainB;
	}
	public void setAvgTrainB(String avgTrainB) {
		this.avgTrainB = avgTrainB;
	}
	public List<Average> getAverageList() {
		return AverageList;
	}
	public void setAverageList(List<Average> averageList) {
		AverageList = averageList;
	}
	
}
