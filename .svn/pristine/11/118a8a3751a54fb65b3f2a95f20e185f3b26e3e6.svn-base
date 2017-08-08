package com.cauc.contract.business;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.pojos.Payment;
import com.cauc.contract.pojos.PaymentExtends;

public interface IPayListService {
	/**
	 * 通过序号查询记录，赋值到修改页面
	 */
	public List UpSearchPayList(PaymentExtends paymentExtends)  throws FinanceServiceException;
	/**
	 * 修改付款页面保存
	 */
	void UpdatePay(Payment paymentExtends) throws FinanceServiceException;
	/**
	 * swq
	 * @param extend 
	 * @param string
	 * @return
	 * 首次加载查询总条数
	 * @throws FinanceServiceException 
	 */
	public int getTotalRowCount(String str, PaymentExtends extend) throws FinanceServiceException;
    /**
     * 
     * @param tbName
     * @param cur_page
     * @param pagesize
     * @param primaryKey
     * @param extend
     * @param strOrder
     * @return
     * 初次加载 分页
     */
/*	public List<PaymentExtends> getListByPage(String tbName, int cur_page, int pagesize, String primaryKey, String strWhere,
			String strOrder);*/
	public List<PaymentExtends> getListByPage(String tbName, int cur_page, int pagesize, String primaryKey, PaymentExtends extend,
			String strOrder);
	//获取数据字典中对应Id 的值
	public String backgetDictionaryNameById(int id);
	//保存生成的通知
	public void saveNotice(String noticeInfor, int serial);
	//生成结算通知的pdf
	public void saveAndGenerateNotice(String noticeInfor, int serial) throws IOException;
	//删除pdf的地址
	public void delNoticeUrl(String delUrlStr, int serial);
	//
	public void noticeStatus(Payment payment);
	//删除发票图片
	public void delPicture(String picture,int serial) throws IOException;
	//根据合同编号查找
	public void searchPayment(Payment payment) throws FinanceServiceException, ParseException;
	//根据付款节点PID查找
	public Payment searchPaymentById(Payment payment) throws FinanceServiceException, ParseException;
}
