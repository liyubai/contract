package com.cauc.contract.business;

import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.pojos.Dictionary;

public interface IDataDicManageService {
	/**
	 * 查询所有topid下的数据字典信息
	 * 
	 * @return
	 */
	List<Dictionary> readAllDicByTopId(int topId) throws FinanceServiceException;
	
	/**
	 * 查询所有数据字典信息
	 * 
	 * @return
	 */
	List<Dictionary> readAllDic();
	
	/**
	 * 保持数据信息
	 * @throws FinanceServiceException
	 */
    void savedataDictionary(Dictionary dictionary) throws FinanceServiceException;
    
	/**
	 * 获取dataDictionary内容
	 * @throws FinanceServiceException
	 */
    Dictionary getdataDictionary(int parentdictionaryId) throws FinanceServiceException;
    
    /**
     * 删除数据字典
     * @param parentdictionaryId
     * @return
     * @throws FinanceServiceException
     */
    boolean deleteDataDictionary(Dictionary dictionary) throws FinanceServiceException;

    /**
     * 通过父id获取其下面的所有子分类
     * @param parentdictionaryId
     * @return
     * @throws FinanceServiceException
     */
    List<Dictionary> getAllDataDicByParentId(Dictionary dictionary) throws FinanceServiceException;    

    /**
     * 通过父id获取其下面的所有子分类
     * @param parentdictionaryId
     * @return
     * @throws FinanceServiceException
     */
    boolean deleteDataDictionaryAllChild(List<Dictionary> dictionarylist) throws FinanceServiceException;    

   /**
    * 新增子类字典数据信息
    * @param dictionary
    * @return
    * @throws FinanceServiceException
    */
    void addDataDicChild(Dictionary dictionary) throws FinanceServiceException;    
    
}
