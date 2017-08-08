package com.cauc.contract.business;

/**
 * @(#)DataDicProvider.java
 * Description:	数据字典
 * Version :	0.0.1
 * Copyright:	
 * Create by:	fuchaohui  2014-6-26
 */
import java.util.ArrayList;
import java.util.List;

public class DataDicProvider {
	private List<String> genderList = new ArrayList<String>();

	private List<String> kmList = new ArrayList<String>();

	public List<String> getGenderList() {
		return genderList;
	}

	public void setGenderList(List<String> genderList) {
		this.genderList = genderList;
	}

	public List<String> getKmList() {
		return kmList;
	}

	public void setKmList(List<String> kmList) {
		this.kmList = kmList;
	}
}
