package com.cauc.contract.cache;

import java.util.List;

import org.apache.tools.ant.taskdefs.Sleep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.business.hibernate.DataDicManageServiceImpl;
import com.cauc.contract.pojos.Dictionary;
import com.cauc.contract.pojos.Student;

@Component
public class DictionaryCache  extends GenericHibernateDAO implements IDictionaryCacheService {

	@Autowired

	
    private static DictionaryCache diccache;
    private static List<Dictionary> dicList;
    private static List<Dictionary> dicList1;
    
    public static DictionaryCache getInstance()
    { 
        if(diccache== null) 
        { 
        	diccache = new DictionaryCache(); 
        } 
      return diccache; 
    } 
    
    public DictionaryCache(){
        
    }
    
  
	@Override
	public List<Dictionary> getAllDic() {
		// TODO Auto-generated method stub
		return dicList;
	}

	
	@Override
	public void cleanAll() {
		// TODO Auto-generated method stub
		dicList.clear();
	}


	@Override
	public void addDictionary(Dictionary dictionary) {
		// TODO Auto-generated method stub\[   
		dicList.add(dictionary);
	}

	@Override
	public void updateDictionary(Dictionary dictionary) {
		// TODO Auto-generated method stub\[   
		for(Dictionary dic:dicList)
		{

			if(dictionary.getDictionaryId()==dic.getDictionaryId())
			{
				dic.setDictionaryName(dictionary.getDictionaryName());
			}
			
		}
	}
	
	@Override
	public void deleteDictionary(Dictionary dictionary) {
		// TODO Auto-generated method stub\[   	
		for(Dictionary dic:dicList)
		{

			if(dictionary.getDictionaryId()==dic.getDictionaryId())
			{
				dicList.remove(dic);
				break;
			}
			
		}
	}
	
	
	@Override
	public void loadAll() {
		// TODO Auto-generated method stub
//		DataDicManageServiceImpl service =new DataDicManageServiceImpl();
//	    dicList = service.readAllDic();	   
		String hql = "from Dictionary ";
		dicList = super.find(hql);			
	}
	
	
	@Override
	public String getDicNameById(int dictionaryId) {
		// TODO Auto-generated method stub
		String aString="";
		for(int i=0;i<dicList.size();i++)
		{
			if(dicList.get(i).getDictionaryId()==dictionaryId)
			{
				 aString=dicList.get(i).getDictionaryName();
				 break;
			}
		}
	return aString;
	}

	@Override
	public void deleteDicList(List<Dictionary> diclist) {
		// TODO Auto-generated method stub

		for(int i=0;i<dicList.size();i++)
		{

			for(int j=0;j<diclist.size();j++)
			{
				int a=diclist.get(j).getDictionaryId();
				if(dicList.get(i).getDictionaryId()==diclist.get(j).getDictionaryId())
				{
					dicList.remove(dicList.get(i));
				}
				
			}
			
		}	
	}

}
