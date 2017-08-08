package com.cauc.contract.ui.core;

import java.util.List;

import org.aspectj.weaver.AjAttribute.PrivilegedAttribute;
import org.springframework.beans.factory.annotation.Autowired;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IContractModifyService;
import com.cauc.contract.business.IDataDicManageService;
import com.cauc.contract.cache.DictionaryCache;
import com.cauc.contract.pojos.Contract;
import com.cauc.contract.pojos.Dictionary;
import com.cauc.contract.ui.common.BaseActionSupport;
import com.sun.corba.se.spi.activation.Server;

/**
 * 数据字典管理的Action
 * 
 * @author necares
 *
 */
public class DataDictionaryManagentAction extends BaseActionSupport {
	
	

	//新建子分类的父级id
	private String parentdictionaryId;
	
	public String getParentdictionaryId() {
			return parentdictionaryId;
		}

		public void setParentdictionaryId(String parentdictionaryId) {
			this.parentdictionaryId = parentdictionaryId;
		}

	private Dictionary dictionary;
	// 插入子分类的父类
	private Dictionary parentdictionary;
	public Dictionary getDictionary() {
		return dictionary;
	}

	public void setDictionary(Dictionary dictionary) {
		this.dictionary = dictionary;
	}
	
	private String ReturnStr;
	public String getReturnStr() {
		return ReturnStr;
	}

	public void setReturnStr(String returnStr) {
		ReturnStr = returnStr;
	}

	
	private String DelReturnStr;
	public String getDelReturnStr() {
		return DelReturnStr;
	}

	public void setDelReturnStr(String delReturnStr) {
		DelReturnStr = delReturnStr;
	}
	
	
	private int dictionaryId;
	


	/**
	 * 
	 */
	private static final long serialVersionUID = 4418781867342310148L;
	private List<Dictionary> dictList;

	public List<Dictionary> getDictList() {
		return dictList;
	}

	public void setDictList(List<Dictionary> dictList) {
		this.dictList = dictList;
	}

	public String showManagent() throws FinanceServiceException{
	
//		DictionaryCache dictionaryCache=DictionaryCache.getInstance();
//		dictList=dictionaryCache.getAllDic();
//		DictionaryCache dictionaryCache=DictionaryCache.getInstance();
//		String aString=dictionaryCache.getDicNameById(1);
		IDataDicManageService service = getFactory().getFinanceProviderInstance().getDataDicManageService();
		dictList = service.readAllDicByTopId(dictionaryId);		
		return SUCCESS;
	}

	/**
	 * 更新数据字典
	 * 
	 * @return
	 * @throws FinanceServiceException
	 */
	public String updateDataDictionary() {
		try {
			IDataDicManageService service = getFactory().getFinanceProviderInstance().getDataDicManageService();
			service.savedataDictionary(dictionary);
			// 更新缓存
			DictionaryCache dictionaryCache=DictionaryCache.getInstance();
			dictionaryCache.updateDictionary(dictionary);				
			return SUCCESS;
		} catch (FinanceServiceException e) {
			return ERROR;
		}
	}
	
	/**
	 * 删除数据字典
	 * 
	 * @return
	 * @throws FinanceServiceException
	 */
	public String deleteDataDictionary() {
		try {

			IDataDicManageService service = getFactory().getFinanceProviderInstance().getDataDicManageService();
			// 通过dictionaryid 获取实体类
			Dictionary currentdictionary= service.getdataDictionary(Integer.parseInt(parentdictionaryId));
			// 删除数据字典
			service.deleteDataDictionary(currentdictionary);

			// 获取删除数据字典下面的所有子分类
			List<Dictionary> dictionarylist= service.getAllDataDicByParentId(currentdictionary);
			// 删除所有子分类
			service.deleteDataDictionaryAllChild(dictionarylist);					
			// 删除缓存
			DictionaryCache dictionaryCache=DictionaryCache.getInstance();			
			dictionaryCache.deleteDictionary(currentdictionary);	
			dictionaryCache.deleteDicList(dictionarylist);
	
			DelReturnStr="SUCCESS";
			return SUCCESS;
		} catch (FinanceServiceException e) {
			DelReturnStr="ERROR";
			return ERROR;
		}		
	}
	
	/**
	 * 添加数据字典，新建子分类
	 * 
	 * @return
	 * @throws FinanceServiceException
	 */
	public String addDataDictionary() {
		try {

			dictionary.setAddUser(1);
			dictionary.setLastModifyUser(1);

			// 更新缓存
			DictionaryCache dictionaryCache=DictionaryCache.getInstance();		
			dictionaryCache.addDictionary(dictionary);			
			
			getFactory().getFinanceProviderInstance().getDataDicManageService().addDataDicChild(dictionary);
		} catch (FinanceServiceException e) {
		
			return ERROR;
		}
		
		return SUCCESS;
	}
	
	public String ajaxGetDictionary(){
		try {
			IDataDicManageService service = getFactory().getFinanceProviderInstance().getDataDicManageService();		
			parentdictionary= service.getdataDictionary(Integer.parseInt(parentdictionaryId));
		  	int topId=parentdictionary.getTopId();
		  	int level= parentdictionary.getLevel();
		  	ReturnStr=topId+","+level;
			return SUCCESS;
		} catch (FinanceServiceException e) {
			return ERROR;
		}
	}


	public int getDictionaryId() {
		return dictionaryId;
	}

	public void setDictionaryId(int dictionaryId) {
		this.dictionaryId = dictionaryId;
	}


}
