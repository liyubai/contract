package com.cauc.contract.ui.core;

import java.util.ArrayList;
import java.util.List;

import com.cauc.contract.pojos.ContractGradeInfo;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonOpreat {	
	/**
	 * @param str
	 * @return
	 */
	public static List  makeGradeInfo(String str,Class clazz)  {// ContractGradeInfo，StudentNameNoNew用泛型
		try {
			JSONArray jsonArr = JSONArray.fromObject("[" + str + "]");
			List<ContractGradeInfo> returnList = new ArrayList<ContractGradeInfo>();
			if (null != jsonArr && jsonArr.size() > 0) {
				for (int i = 0; i < jsonArr.size(); i++) {
					JSONObject obj=jsonArr.getJSONObject(i);
					List<StudentNameNoNew> snnList=new ArrayList<StudentNameNoNew>();
					// studentNameNo字段对应JSON数组
					JSONArray jsonArrSNN= obj.getJSONArray("studentNameNo");
					if(null!=jsonArrSNN && jsonArrSNN.size()>0){
						for (int j = 0; j < jsonArrSNN.size(); j++) {
							JSONObject objSNN=jsonArrSNN.getJSONObject(j);
							StudentNameNoNew snnBean=(StudentNameNoNew) JSONObject.toBean(objSNN, StudentNameNoNew.class);
							snnList.add(snnBean);
						}
					}
					ContractGradeInfo mainBean=(ContractGradeInfo) JSONObject.toBean(obj, ContractGradeInfo.class);
					mainBean.setStudentNameNo(snnList);
					returnList.add(mainBean);
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
