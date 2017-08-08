package com.cauc.contract.ui.core;
import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IDataDictionaryListService;
import com.cauc.contract.cache.DictionaryCache;
import com.cauc.contract.pojos.Dictionary;
import com.cauc.contract.ui.common.BaseActionSupport;


import jxl.write.DateTime;

public class dataDictionaryListAction extends BaseActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1732683254850372939L;
	//数据字典管理
		private int 	dictionaryId;
		private String 	dictionaryName;
		private int 	level;
		private int 	parentId;
		private int 	topId;
		private int 	addUser;
		private DateTime 	addTime;
		private DateTime 	lastModifyTime;
		private String 	lastModifyUser;
		private List<Dictionary> dictionarylist;
		private Dictionary dic;
        


		public Dictionary getDic() {
			return dic;
		}

		public void setDic(Dictionary dic) {
			this.dic = dic;
		}

		public String getDataDictionary_list() {
			
	    	IDataDictionaryListService dataDictionaryListService=getFactory().getFinanceProviderInstance().getDataDictionaryListService();
	  
	    	 try {
	    		 dictionarylist= dataDictionaryListService.dataDictionaryList();
				
				
			} catch (FinanceServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		

			return SUCCESS;
		}
		
	 /***
	  * 
	  * yinjx
	  * 添加数据字典
	  * @return
	  */
		
		
		public String saveDataDictionary(){
			
			try {
				dic.setLevel(1);				
				dic.setAddUser(1);
				dic.setLastModifyUser(1);	
				
				getFactory().getFinanceProviderInstance().getDataDictionaryListService().saveDataDic(dic);
			} catch (FinanceServiceException e) {
			
				return SUCCESS;
			}
			
			return SUCCESS;
		}

		
		public String  test() {
			
			return SUCCESS;
		}
		
		
		public int getDictionaryId() {
			return dictionaryId;
		}
		public void setDictionaryId(int dictionaryId) {
			this.dictionaryId = dictionaryId;
		}
		public String getDictionaryName() {
			return dictionaryName;
		}
		public void setDictionaryName(String dictionaryName) {
			this.dictionaryName = dictionaryName;
		}
		public int getLevel() {
			return level;
		}
		public void setLevel(int level) {
			this.level = level;
		}
		public int getParentId() {
			return parentId;
		}
		public void setParentId(int parentId) {
			this.parentId = parentId;
		}
		public int getTopId() {
			return topId;
		}
		public void setTopId(int topId) {
			this.topId = topId;
		}
		public int getAddUser() {
			return addUser;
		}
		public void setAddUser(int addUser) {
			this.addUser = addUser;
		}
		public DateTime getAddTime() {
			return addTime;
		}
		public void setAddTime(DateTime addTime) {
			this.addTime = addTime;
		}
		public DateTime getLastModifyTime() {
			return lastModifyTime;
		}
		public void setLastModifyTime(DateTime lastModifyTime) {
			this.lastModifyTime = lastModifyTime;
		}
		public String getLastModifyUser() {
			return lastModifyUser;
		}
		public void setLastModifyUser(String lastModifyUser) {
			this.lastModifyUser = lastModifyUser;
		}
		public static long getSerialversionuid() {
			return serialVersionUID;
		}
	    public List<Dictionary> getDictionarylist() {
			return dictionarylist;
		}

		public void setDictionarylist(List<Dictionary> dictionarylist) {
			this.dictionarylist = dictionarylist;
		}
	

}
