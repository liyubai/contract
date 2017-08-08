package com.cauc.contract.business;

import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.pojos.Contract;
import com.cauc.contract.pojos.Payment;

public interface IContractQuerylistService {
	 //查看合同  合同表
	List<Contract> viewContract(Contract contract);
	//查询付款表
	List<Payment> viewPayment(Payment pm);
	//合同管理  首次加载  查询全部合同
	List<Contract> allContractQuerylist();
	//查询数据的总条数
	int getTotalRowCount(String str) throws FinanceServiceException;
	//分页查询数据
	List<Object[]> getListByPage(String tbName, int cur_page, int pagesize, String primaryKey, String strWhere,
			String strOrder);
	//条件查询  查询条数
	int getPartTotalRowCount(String str, Contract contract) throws FinanceServiceException;
	
	//分页  条件查询数据
	List<Object[]> getPartListByPage(String tbName, int cur_page, int pagesize, String primaryKey, Contract contract,
			String strOrder);
	//根据数据字典中的 ID  查询对应的名称
	String getKindsName(Integer id);
	

}
