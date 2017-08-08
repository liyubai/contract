package com.cauc.contract.business;

import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.pojos.Account;

public interface AccountService {
	//初次加载查询全部  分页
	public List<Account> selectAllAccount(String tbName, int cur_page, int pagesize, String primaryKey, String strWhere, String strOrder);
	public List<Account> selectAccountById(int accountState,int paymentState);
	//public List<Account> selectFileUrl(String accountId,int accountState);
	public void updateAccountById(Account account);
	public List<Account> selectFileUrl(int aid);
	//初次加载，查询数据总条数
	public int getTotalRowCount(String string) throws FinanceServiceException;
	//部分查询，查询数据的条数
	public int getPartTotalRowCount(String string, int accountState, int paymentState) throws FinanceServiceException;
	
    //部分查询  分页
	public List<Account> getPartListByPage(String tbName, int cur_page, int pagesize, String primaryKey, int accountState,
			int paymentState, String strOrder);
	//根据结算编号生成新的结算Id
	public String newAccountId();
	//将新生成的结算添加到列表中
	public void addAccount(String accountId, String[] accountIdArray) throws FinanceServiceException;
	//下载Excel 文件
	public String downloadExcel(String downloadExcelStr, String excelName);
}
