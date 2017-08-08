package com.cauc.contract.ui.core;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.ISumStatisticService;
import com.cauc.contract.pojos.Payment;
import com.cauc.contract.pojos.PaymentExt;
import com.cauc.contract.ui.common.BaseActionSupport;
import com.cauc.contract.util.JsonToBean;

/**
 * guot
 */
public class SumStatisticAction extends BaseActionSupport {

	private static final long serialVersionUID = 1L;
	private Date PReceiveDate;// 到款日期
	private String PReceiveMoney;// 到款金额
	private String Pnotice;// 通知

	private int Year;// 年份
	private int Month;// 月份
	private String cyear;// 页面选择的年份
	private String YPReceiveMoney;// 预计收款金额和
	private String TPReceiveMoney;// 通知收款金额和
	private String trueMoney;// 实际到款金额
	private String trueDate;// 实际到款日期
	private String unpaid;// 未到帐合计

	private String sumYPReceiveMoney;
	private String sumTPReceiveMoney;
	private String sumTrueMoney;
	private String sumUnpaid;

	private List<PaymentExt> list;
	private List<Payment> list2;
	private List<PaymentExt> extend;
	private List<PaymentExt> extendE;
	private PaymentExt payment;
	private Payment paym;

	private List<PaymentExt> paylist;
	private List<Payment> Jsonlist;

	// 显示年汇总统计结果
	@SuppressWarnings("unchecked")
	public String showStatistic() throws FinanceServiceException {
		ISumStatisticService sumStatisticService = getFactory().getFinanceProviderInstance().getSumStatisticService();
		list = sumStatisticService.showPayList(payment);
		list2 = sumStatisticService.viewPayList(paym);
		double sumYPReceiveMoney1 = 0.00;
		double sumTPReceiveMoney1 = 0.00;
		double sumTrueMoney1 = 0.00;
		double sumUnpaid1 = 0.00;
		java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
		nf.setGroupingUsed(false); // 避免double数据显示科学记数法
		if (CollectionUtils.isNotEmpty(list)) {
			PaymentExt PE = new PaymentExt();
			List<PaymentExt> pay = new ArrayList<PaymentExt>();
			for (PaymentExt Year : list) {// 循环 list中每一年
				double trueMoney = 0.00; // 实际到款金额 ,每循环一年结束清空tureMoney
				if (CollectionUtils.isNotEmpty(list2)) {
					for (Payment p1 : list2) { // 循list2中PRealityDate字段的每条记录
						if (!p1.getPRealityDate().equals("NULL")) {
							String JSONstr = "";
							if (p1.getPRealityDate().length() > 1) {
								JSONstr = p1.getPRealityDate().substring(0, p1.getPRealityDate().length() - 1);
								List<PaymentExt> list3 = JsonToBean.makeJavaBean(JSONstr, PaymentExt.class);
								if (CollectionUtils.isNotEmpty(list3)) {
									for (PaymentExt json : list3) { // 获取jsontobean对象
																	// TureMoney,TrueDate
										if (json.getTrueDate() != null) {
											int jsonYear = Integer
													.parseInt(json.getTrueDate().toString().substring(0, 4));
											if (jsonYear == Year.getYear()) {
												trueMoney = trueMoney
														+ Double.parseDouble(json.getTrueMoney().toString());
												// System.out.println(trueMoney);
											}
										}
										Year.setTrueMoney(nf.format(new Double(String.valueOf(trueMoney))));
										Year.setUnpaid(nf.format(new Double(Year.getYPReceiveMoney().toString())
												- Double.parseDouble(Year.getTrueMoney().toString())));
									}
								}
							}
						} else {
							Year.setTrueMoney("0");
							Year.setUnpaid("0");
						}
					}
				}
				sumYPReceiveMoney1 += Double.parseDouble(Year.getYPReceiveMoney().toString());
				sumTPReceiveMoney1 += Double.parseDouble(Year.getTPReceiveMoney().toString());
				if (Year.getTrueMoney().equals("0")) {
					sumTrueMoney1 += 0;
				} else {
					sumTrueMoney1 += Double.parseDouble(Year.getTrueMoney().toString());
				}
				if (Year.getUnpaid().equals("0")) {
					sumUnpaid1 += 0;
				} else {
					sumUnpaid1 += Double.parseDouble(Year.getUnpaid().toString());
				}
			}
			if (sumUnpaid1 == 0) {
				PE.setSumUnpaid("0");
			} else {
				PE.setSumUnpaid(nf.format(new Double(String.valueOf(sumUnpaid1))));
			}
			if (sumTrueMoney1 == 0) {
				PE.setSumTrueMoney("0");
			} else {
				PE.setSumTrueMoney(nf.format(new Double(String.valueOf(sumTrueMoney1))));
			}
			PE.setSumTPReceiveMoney(nf.format(new Double(String.valueOf(sumTPReceiveMoney1))));
			PE.setSumYPReceiveMoney(nf.format(new Double(String.valueOf(sumYPReceiveMoney1))));
			pay.add(PE);
			setExtend(pay);
		}
		return SUCCESS;
	}

	// 显示月汇总统计结果
	@SuppressWarnings("unchecked")
	public String sumStatisticMonth() throws FinanceServiceException {
		ISumStatisticService sumMonth = getFactory().getFinanceProviderInstance().getSumStatisticService();
		PaymentExt payl = new PaymentExt();
		if (cyear == null || "".equals(cyear)) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
			Date date = new Date();
			cyear = sdf.format(date); // 获取当前年份
		}
		payl.setP_receivedate(cyear);
		paylist = sumMonth.showMonthList(payl);
		Jsonlist = sumMonth.viewMonthList(payl);
		double sumYPReceiveMoney2 = 0.00;
		double sumTPReceiveMoney2 = 0.00;
		double sumTrueMoney2 = 0.00;
		double sumUnpaid2 = 0.00;
		java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
		nf.setGroupingUsed(false); // 避免double数据显示科学记数法
		if (CollectionUtils.isNotEmpty(paylist)) {
			PaymentExt PEt = new PaymentExt();
			List<PaymentExt> pay = new ArrayList<PaymentExt>();
			for (PaymentExt Month : paylist) { // 循环选定年份中的每一个月
				double trueMoney = 0.00; // 实际到款金额 ,每循环一个月结束清空tureMoney
				if (CollectionUtils.isNotEmpty(Jsonlist)) {
					for (Payment py : Jsonlist) { // 循list2中PRealityDate字段的每条记录
						// if (!py.getPRealityDate().equals("NULL")) {
						String JSONstr = "";
						if (py.getPRealityDate().length() > 1) {
							JSONstr = py.getPRealityDate().substring(0, py.getPRealityDate().length() - 1);
							List<PaymentExt> list3 = JsonToBean.makeJavaBean(JSONstr, PaymentExt.class);
							if (CollectionUtils.isNotEmpty(list3)) {
								for (PaymentExt json : list3) { // 获取jsontobean对象
																// TureMoney,TrueDate
									if (json.getTrueDate() != null && payl.getP_receivedate()
											.equals(json.getTrueDate().toString().substring(0, 4))) {
										int jsonMonth = Integer.parseInt(json.getTrueDate().toString().substring(5, 7));
										if (jsonMonth == Month.getMonth()) {
											trueMoney = trueMoney + Double.parseDouble(json.getTrueMoney().toString());
										}
									}
									Month.setTrueMoney(nf.format(new Double(String.valueOf(trueMoney))));
									Month.setUnpaid(nf.format(new Double(Month.getYPReceiveMoney().toString())
											- Double.parseDouble(Month.getTrueMoney().toString())));
								}
							}
							// }else{
							// Month.setTrueMoney("0");
							// Month.setUnpaid("0");
							// }
						}
					}
				} else {
					Month.setTrueMoney("0");
					Month.setUnpaid("0");
				}
				sumYPReceiveMoney2 += Double.parseDouble(Month.getYPReceiveMoney().toString());
				sumTPReceiveMoney2 += Double.parseDouble(Month.getTPReceiveMoney().toString());
				if (Month.getTrueMoney().equals("0")) {
					sumTrueMoney2 = 0;
				} else {
					sumTrueMoney2 += Double.parseDouble(Month.getTrueMoney().toString());
				}
				if (Month.getUnpaid().equals("0")) {
					sumUnpaid2 = 0;
				} else {
					sumUnpaid2 += Double.parseDouble(Month.getUnpaid().toString());
				}
			}
			if (sumUnpaid2 == 0) {
				PEt.setSumUnpaid("0");
			} else {
				PEt.setSumUnpaid(nf.format(new Double(String.valueOf(sumUnpaid2))));
			}
			if (sumTrueMoney2 == 0) {
				PEt.setSumTrueMoney("0");
			} else {
				PEt.setSumTrueMoney(nf.format(new Double(String.valueOf(sumTrueMoney2))));
			}
			PEt.setSumTPReceiveMoney(nf.format(new Double(String.valueOf(sumTPReceiveMoney2))));
			PEt.setSumYPReceiveMoney(nf.format(new Double(String.valueOf(sumYPReceiveMoney2))));
			// System.out.println(PEt.getSumYPReceiveMoney().toString());
			pay.add(PEt);
			setExtendE(pay);
			// System.out.println(extend.get(0).getSumUnpaid().toString());
		}
		return SUCCESS;
	}

	// getter and setter
	public List<PaymentExt> getExtend() {
		return extend;
	}

	public void setExtend(List<PaymentExt> extend) {
		this.extend = extend;
	}

	public List<Payment> getList2() {
		return list2;
	}

	public void setList2(List<Payment> list2) {
		this.list2 = list2;
	}

	public String getUnpaid() {
		return unpaid;
	}

	public void setUnpaid(String unpaid) {
		this.unpaid = unpaid;
	}

	public Date getPReceiveDate() {
		return PReceiveDate;
	}

	public void setPReceiveDate(Date pReceiveDate) {
		PReceiveDate = pReceiveDate;
	}

	public String getPReceiveMoney() {
		return PReceiveMoney;
	}

	public void setPReceiveMoney(String pReceiveMoney) {
		PReceiveMoney = pReceiveMoney;
	}

	public String getPnotice() {
		return Pnotice;
	}

	public void setPnotice(String pnotice) {
		Pnotice = pnotice;
	}

	public int getYear() {
		return Year;
	}

	public void setYear(int year) {
		Year = year;
	}

	public String getYPReceiveMoney() {
		return YPReceiveMoney;
	}

	public void setYPReceiveMoney(String yPReceiveMoney) {
		YPReceiveMoney = yPReceiveMoney;
	}

	public String getTPReceiveMoney() {
		return TPReceiveMoney;
	}

	public void setTPReceiveMoney(String tPReceiveMoney) {
		TPReceiveMoney = tPReceiveMoney;
	}

	public String getTrueMoney() {
		return trueMoney;
	}

	public void setTrueMoney(String Money) {
		trueMoney = Money;
	}

	public String getTrueDate() {
		return trueDate;
	}

	public void setTrueDate(String trueDate) {
		this.trueDate = trueDate;
	}

	public List<PaymentExt> getList() {
		return list;
	}

	public void setList(List<PaymentExt> list) {
		this.list = list;
	}

	public PaymentExt getPayment() {
		return payment;
	}

	public void setPayment(PaymentExt payment) {
		this.payment = payment;
	}

	public Payment getPaym() {
		return paym;
	}

	public void setPaym(Payment paym) {
		this.paym = paym;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	// -------------------------

	public String getSumYPReceiveMoney() {
		return sumYPReceiveMoney;
	}

	public void setSumYPReceiveMoney(String sumYPReceiveMoney) {
		this.sumYPReceiveMoney = sumYPReceiveMoney;
	}

	public String getSumTPReceiveMoney() {
		return sumTPReceiveMoney;
	}

	public void setSumTPReceiveMoney(String sumTPReceiveMoney) {
		this.sumTPReceiveMoney = sumTPReceiveMoney;
	}

	public String getSumTrueMoney() {
		return sumTrueMoney;
	}

	public void setSumTrueMoney(String sumTrueMoney) {
		this.sumTrueMoney = sumTrueMoney;
	}

	public String getSumUnpaid() {
		return sumUnpaid;
	}

	public void setSumUnpaid(String sumUnpaid) {
		this.sumUnpaid = sumUnpaid;
	}

	public List<PaymentExt> getPaylist() {
		return paylist;
	}

	public void setPaylist(List<PaymentExt> paylist) {
		this.paylist = paylist;
	}

	public int getMonth() {
		return Month;
	}

	public void setMonth(int month) {
		Month = month;
	}

	public List<Payment> getJsonlist() {
		return Jsonlist;
	}

	public void setJsonlist(List<Payment> jsonlist) {
		Jsonlist = jsonlist;
	}

	public String getCyear() {
		return cyear;
	}

	public void setCyear(String cyear) {
		this.cyear = cyear;
	}

	public List<PaymentExt> getExtendE() {
		return extendE;
	}

	public void setExtendE(List<PaymentExt> extendE) {
		this.extendE = extendE;
	}

}
