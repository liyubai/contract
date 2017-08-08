package com.cauc.contract.ui.core;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.cauc.contract.business.IContractWaitDealService;
import com.cauc.contract.pojos.Contract;
import com.cauc.contract.pojos.Payment;
import com.cauc.contract.pojos.PaymentExt;
import com.cauc.contract.ui.common.BaseActionSupport;
import com.cauc.contract.util.JsonToBean;

/**
 * @author Guot
 */
public class contractWaitDealAction extends BaseActionSupport {

	private static final long serialVersionUID = 1L;
	private int id;
	private int PId;
	private Integer cname;
	private Integer status;
	private String contractId;
	private String strLine;
	private List<Contract> cont;
	private List<Payment> pay;
	private List<PaymentExt> paymen;

	// 首页 加载合同信息
	@SuppressWarnings("unchecked")
	public String contractWaitDeal() throws ParseException {
		IContractWaitDealService contractWaitDealService = getFactory().getFinanceProviderInstance().getContractWaitDealService();
			cont = contractWaitDealService.viewContractWaitDeal();
			
			pay = contractWaitDealService.viewPaymentWaitDeal();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			int day1 = cal.get(Calendar.DAY_OF_YEAR);
			List<PaymentExt>  paylist= new ArrayList<PaymentExt>();
			if (CollectionUtils.isNotEmpty(pay)) {
				for(Payment payment:pay){
					Date receiveDate =df.parse(df.format(payment.getPReceiveDate()));
					cal.setTime(receiveDate);
					int day2 = cal.get(Calendar.DAY_OF_YEAR);
					String JSONstr = "";
					PaymentExt payl = new PaymentExt();					
					float trueMoney = (float) 0.0;
					if (payment.getPRealityDate().length() > 1)  { //如果有还款
						JSONstr = payment.getPRealityDate().substring(0, payment.getPRealityDate().length() - 1);
						List<PaymentExt> list = JsonToBean.makeJavaBean(payment.getPRealityDate(), PaymentExt.class);
						if (CollectionUtils.isNotEmpty(list)) {
							for (PaymentExt json : list) { 
								trueMoney += Float.parseFloat(json.getTrueMoney());
							}	
						}
						if(trueMoney<payment.getPReceiveMoney()){
							payl.setPArrears(-1); //有欠款
						}else {
							payl.setPArrears(0);
							if(day1-7>day2){
								payl.setPReceiveDate(1);//将到收款日
							}else
								payl.setPReceiveDate(0);
						}					
					}else { //如果从未还款
						if(day1-7>day2){
							payl.setPReceiveDate(1);//将到收款日
						}else
							payl.setPReceiveDate(0);
					}
					payl.setPId(payment.getPId());
					payl.setPContractId(payment.getPContractId());
					paylist.add(payl);
				}
				setPaymen(paylist);
			}
		return SUCCESS;

	}
	//cid查看合同
	@SuppressWarnings("unchecked")
	public String showContractWaitDeal() {
		IContractWaitDealService contractWaitDealService = getFactory().getFinanceProviderInstance().getContractWaitDealService();
		System.out.println(id);
		Contract con = new Contract();
		con.setCId(id);
		cont = contractWaitDealService.showContractWaitDeal(con);
		return SUCCESS;
	}
	//pid查看付款
		@SuppressWarnings("unchecked")
		public String viewPayWaitDeal() {
			IContractWaitDealService contractWaitDealService = getFactory().getFinanceProviderInstance().getContractWaitDealService();
			Payment payment= new Payment();
			payment.setPId(PId);
			pay = contractWaitDealService.showPayWaitDeal(payment);
			
			return SUCCESS;
		}


	// ---getter setter---
	
	public Integer getCname() {
		return cname;
	}
	
	public void setCname(Integer cname) {
		this.cname = cname;
	}
	public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<Contract> getCont() {
		return cont;
	}

	public void setCont(List<Contract> cont) {
		this.cont = cont;
	}

	public String getStrLine() {
		return strLine;
	}

	// 获得连接字符串
	public void setStrLine(String strLine) {
		this.strLine = strLine;
	}
	public List<Payment> getPay() {
		return pay;
	}
	public void setPay(List<Payment> pay) {
		this.pay = pay;
	}
	public int getPId() {
		return PId;
	}
	public void setPId(int PId) {
		this.PId = PId;
	}
	public List<PaymentExt> getPaymen() {
		return paymen;
	}
	public void setPaymen(List<PaymentExt> paymen) {
		this.paymen = paymen;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

	
}
