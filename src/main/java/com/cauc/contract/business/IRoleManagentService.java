package com.cauc.contract.business;

import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.pojos.TContractRole;



/**
 * 角色管理的Service
 * 
 * @author Wangbaoru
 */
public interface IRoleManagentService {


	/**
	 * 查询所有角色信息
	 * 
	 * @return
	 */
	List<TContractRole> readAllRole();

	/**
	 * 信息保存
	 * 
	 * @param user
	 */
	void saveRole(TContractRole role) throws FinanceServiceException;

}
