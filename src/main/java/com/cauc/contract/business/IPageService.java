package com.cauc.contract.business;

import java.util.List;

import com.cauc.contract.FinanceServiceException;

public interface IPageService {

	/**
	 * 获得查询的所有行数
	 * 
	 * @return
	 */
 public	int getTotalRowCount(String tbName,String strWhere) throws FinanceServiceException;
 
	/**
	 *  获取分页显示的list
	 * 
	 * @return
	 */
public	List getListByPage(String tbFields,String tbName,int pageIndex,int pagesize,String primaryKey,String strWhere,String strOrder) throws FinanceServiceException;
 
}
