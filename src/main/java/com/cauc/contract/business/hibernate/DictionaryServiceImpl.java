package com.cauc.contract.business.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.stereotype.Service;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IDictionaryService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.Dictionary;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class DictionaryServiceImpl extends GenericHibernateDAO implements IDictionaryService {

	@Override
	public String getChildDicById(int parentId) throws FinanceServiceException {
		
		JSONObject jsonObj = null;
		JSONArray jsonArr = null;
		JSONObject dicJson = null;
		
		// 取得父级对象
		Dictionary parentDic = super.get(Dictionary.class, parentId);
		
		if(parentDic!=null){
			jsonObj = new JSONObject();
			dicJson = new JSONObject();
			jsonArr = new JSONArray();
			dicJson.put("id", parentDic.getDictionaryId());
			dicJson.put("name", parentDic.getDictionaryName());
			dicJson.put("level", parentDic.getLevel());
			jsonArr.add(dicJson);
		}else{
			return null;
		}
		
		// 取得子级对象s
		String hql =" from Dictionary where parentId = ?";
		List<Dictionary> childDics = super.find(hql, parentId);
		
		if(childDics!=null&&childDics.size()>0){
			for(Dictionary dic : childDics){
				dicJson = new JSONObject();
				dicJson.put("id", dic.getDictionaryId());
				dicJson.put("name", dic.getDictionaryName());
				dicJson.put("level", dic.getLevel());
				jsonArr.add(dicJson);
			}
		}
		
		jsonObj.put("dics", jsonArr);
		return jsonObj.toString();
	}
	
	
	// 查询所有topId节点
	@Override
	@SuppressWarnings("unused")
	public String getAllChildDicById(int parentId) throws FinanceServiceException {
		JSONObject jsonObj = null;
		JSONArray jsonArr = null;
		JSONObject dicJson = null;
		// 取得父级对象
		Dictionary parentDic = super.get(Dictionary.class, parentId);
		if(parentDic!=null){
			jsonObj = new JSONObject();
			dicJson = new JSONObject();
			jsonArr = new JSONArray();
			dicJson.put("id", parentDic.getDictionaryId());
			dicJson.put("name", parentDic.getDictionaryName());
			dicJson.put("level", parentDic.getLevel());
			dicJson.put("TopId", parentDic.getTopId());
			dicJson.put("ParentId", parentDic.getParentId());
			jsonArr.add(dicJson);
		}else{
			return null;
		}
		// 取得子级对象s
		String hql =" from Dictionary where topId = ?";
		List<Dictionary> childDics = super.find(hql, parentId);
				
		if(childDics!=null&&childDics.size()>0){
			for(Dictionary dic : childDics){
				dicJson = new JSONObject();
				dicJson.put("id", dic.getDictionaryId());
				dicJson.put("name", dic.getDictionaryName());
				dicJson.put("level", dic.getLevel());
				dicJson.put("TopId", dic.getTopId());
				dicJson.put("ParentId", dic.getParentId());
				jsonArr.add(dicJson);
			}
		}		
		jsonObj.put("dics", jsonArr);
		return jsonObj.toString();
	}
	
	public static void main(String[]args){
		JSONObject obj = new JSONObject();
		JSONArray arr = new JSONArray();
		
		JSONObject obj1 = new JSONObject();
		obj1.put("id", 1);
		obj1.put("name", "libin");
		arr.add(obj1);
		
		JSONObject obj2 = new JSONObject();
		obj2.put("id", 2);
		obj2.put("name", "lixia");
		arr.add(obj2);
		
		obj.put("peoples", arr);
		
		System.out.println(obj.toString());
	}

	/**
	 * 根据Id 在数据字典中获取该Id的名字
	 * 
	 * @param id
	 * @return
	 */
	@Override
	public String backgetDictionaryNameById(int id) {
		String hql = "from Dictionary where DictionaryId =" + id;
		List<Dictionary> dictionaryList = new ArrayList<Dictionary>();
		dictionaryList = super.find(hql);
		String name = dictionaryList.get(0).getDictionaryName();
		return name;
	}

}
