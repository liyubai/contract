package com.cauc.contract.business;
import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.pojos.Dictionary;


/**
 * 
 * @author yinjx  2016年7月20日10:51:58
 *获取数据字典  接口
 */
public interface IDataDictionaryListService {
	
	
	

	public List<Dictionary> dataDictionaryList()throws FinanceServiceException;
	

	/**
	 * 创建
	 * @param dic
	 * @throws FinanceServiceException
	 */
	public void saveDataDic(Dictionary dic) throws FinanceServiceException;
}
