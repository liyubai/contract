package com.cauc.contract.business;

import java.util.List;

import com.cauc.contract.pojos.Power;



public interface IPowerManagentService {

	/**
	 * 查询所有权限
	 */
	
	List<Power> readAllPower();
}
