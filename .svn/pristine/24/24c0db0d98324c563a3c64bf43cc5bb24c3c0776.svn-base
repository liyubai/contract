package com.cauc.contract.business;

import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.pojos.LoginUser;
import com.cauc.contract.pojos.LoginUserExtends;
import com.cauc.contract.pojos.TContractRole;

public interface IUserManagentService {
    /**
     * 查询所有用户信息
     * @param user
     * @throws FinanceServiceException 
     */
	void saveUser(LoginUser user) throws FinanceServiceException;
    /**
     * 保持用户信息
     * @return
     */
	List<LoginUserExtends> readAllUser();
	/**
	 * 修改用户信息
	 * @param user
	 * @throws FinanceServiceException 
	 */
	void updateUser(LoginUser updateUser) throws FinanceServiceException;
	/**
	 * 查询角色表的所有角色
	 * @return
	 */
	List<TContractRole> readAllRole();
	/**
	 * 判断用户名是否已经存在
	 * @param user
	 * @return
	 */
	List<LoginUser> findUserName(LoginUser user);
	//查询数据条数
	int getTotalRowCount(String str) throws FinanceServiceException;
	
	//分页查询全部用户
	List<LoginUserExtends> getListByPage(String tbName, int cur_page, int pagesize, String primaryKey, String strWhere,
			String strOrder);


}
