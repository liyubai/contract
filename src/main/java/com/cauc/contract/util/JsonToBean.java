package com.cauc.contract.util;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * json数组 返回实体类数组
 * 
 * @author baib 
 */
public class JsonToBean {

	public static List makeJavaBean(String str,Class clazz) {
		try {
			JSONArray jsonArr = JSONArray.fromObject("[" + str + "]");
			List returnList = new ArrayList();
			if (null != jsonArr && jsonArr.size() > 0) { 
				Object[] temp = null;
				for (int i = 0; i < jsonArr.size(); i++) {
					returnList.add( JSONObject.toBean(jsonArr.getJSONObject(i), clazz));     
		        }     
			}
			return returnList;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			return null;
		}
	}
}
