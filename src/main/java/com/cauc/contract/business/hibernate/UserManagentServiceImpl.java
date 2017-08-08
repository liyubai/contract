package com.cauc.contract.business.hibernate;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IUserManagentService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.LoginUser;
import com.cauc.contract.pojos.LoginUserExtends;
import com.cauc.contract.pojos.TContractRole;

/**
 * 用户管理的Service
 * 
 * @author litie
 */
@Service
public class UserManagentServiceImpl extends GenericHibernateDAO implements IUserManagentService {

	private static Log log = LogFactory.getLog(UserManagentServiceImpl.class);
   /**
    * 查询所有用户信息
    */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<LoginUserExtends> readAllUser() {		
		String hql = "from LoginUser";
		List<LoginUser> loginUser;
		loginUser = find(hql); 
		List<LoginUserExtends> listextends = new ArrayList<LoginUserExtends>();
		for (int i = 0; i < loginUser.size(); i++) {
			LoginUserExtends userListExtends = new LoginUserExtends();
			int id = loginUser.get(i).getVRoleId();
			String hqlId = "from " + TContractRole.class.getSimpleName() + " where Role_Id =" + id;
			List<TContractRole> role = find(hqlId);
			userListExtends.setRolename(role.get(0).getRole_Name());
			userListExtends.setVId(loginUser.get(i).getVId());
			userListExtends.setVPassword(loginUser.get(i).getVPassword());
			userListExtends.setVRoleId(loginUser.get(i).getVRoleId());
			userListExtends.setVUsername(loginUser.get(i).getVUsername());
			userListExtends.setVRealname(loginUser.get(i).getVRealname());
			listextends.add(i, userListExtends);
		}
		return listextends;
	}
	/**
	 * 添加用户
	 */
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public void saveUser(LoginUser user) throws FinanceServiceException {
		try {
			LoginUser addUser = new LoginUser();
			addUser.setVUsername(user.getVUsername());
			addUser.setVPassword(user.getVPassword());
			addUser.setVRoleId(user.getVRoleId());
			addUser.setVCreateDate(new Date());
			addUser.setVLastModifyTime(new Date());
			addUser.setVCreateUserId(user.getVCreateUserId());
			addUser.setVRealname(user.getVRealname());
			try {
				save(addUser);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (HibernateException e) {
			log.error("保持用户信息时失败", e);
			throw new FinanceServiceException("保持用户信息时失败。", e);
		}
	}
    /**
     * 修改用户
     */
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public void updateUser(LoginUser updateUser) throws FinanceServiceException {
		try {
			LoginUser upUser = get(LoginUser.class, updateUser.getVId());
			upUser.setVUsername(updateUser.getVUsername());
			upUser.setVPassword(updateUser.getVPassword());
			upUser.setVRoleId(updateUser.getVRoleId());
			upUser.setVLastModifyTime(new Date());
			upUser.setVLastModiyUser(updateUser.getVLastModiyUser());
			upUser.setVRealname(updateUser.getVRealname());
			update(upUser);
		} catch (HibernateException e) {
			log.error("保持用户信息时失败", e);
			throw new FinanceServiceException("保持用户信息时失败。", e);
		}
	}
	/**
	 * 初次加载页面  查询全部角色
	 */
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<TContractRole> readAllRole() {
		String hql = "from " + TContractRole.class.getSimpleName();
		List<TContractRole> role;
		role = find(hql); 
		return role;
	}
	/**
	 * 添加用户，判断用户是否存在
	 */
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<LoginUser> findUserName(LoginUser user) {
		String hql = "from "+ LoginUser.class.getSimpleName()+" where VUsername = '"+user.getVUsername()+"'";
		List<LoginUser> userList = new ArrayList<LoginUser>();
		userList = find(hql);
		return userList;
	}
	/**
	 * 查询条数
	 * @throws FinanceServiceException 
	 */
	@Override
	public int getTotalRowCount(String str) throws FinanceServiceException {
		try {
			String hql = "select count(1) from  "+str;
		    List<Object[]> tempList = super.createSQLQuery(hql).list();
	 	    Object object=  tempList.get(0);
            return (Integer.parseInt(object.toString()));  
			
		} catch (HibernateException e) {			
			throw new FinanceServiceException("查询失败！");
		}	
	}
	/**
	 * 查询全部  分页
	 */
	@Override
	public List<LoginUserExtends> getListByPage(String tbName, int pageIndex, int pageSize, String primaryKey, String strWhere,
			String strOrder) {
		String afieleds = " v_id , v_username  ,v_password , v_roleId , v_realname ";

		if (strWhere != "") {
			strWhere = " where " + strWhere;
		}
		String hql = "select top " + pageSize + " " + afieleds + " from " + tbName + strWhere + " " + strOrder;
		if (pageIndex > 1) {
			String addafieleds = " a.v_id , a.v_username  ,a.v_password ,  a.v_roleId ,  a.v_realname  ";
			hql = "select " + addafieleds + " from " + tbName + " as a inner join (select " + afieleds
					+ " from (select row_number() over(" + strOrder + ") as rownum," + afieleds + " from " + tbName
					+ strWhere + ") as t where rownum between " + ((pageIndex - 1) * pageSize + 1) + " and "
					+ pageIndex * pageSize + ") as b on a." + primaryKey + "=b." + primaryKey + " order by b.v_id";
		}
		List<Object[]> tempList = super.createSQLQuery(hql).list();
		List<LoginUserExtends> listextends = new ArrayList<LoginUserExtends>();
	//	List<Object[]> backtempList = new ArrayList<Object[]>();
		for (Object[] o : tempList) {
			LoginUserExtends userListExtends = new LoginUserExtends();
			int id = Integer.parseInt(o[3].toString());
			//查询角色名   角色表
			String hqlId = "from " + TContractRole.class.getSimpleName() + " where Role_Id =" + id;
			List<TContractRole> role = find(hqlId);
			//set 值
			userListExtends.setRolename(role.get(0).getRole_Name());
			userListExtends.setVId(Integer.parseInt(o[0].toString()));
			userListExtends.setVPassword(o[2].toString());
			userListExtends.setVRoleId(Integer.parseInt(o[3].toString()));
			userListExtends.setVUsername(o[1].toString());
			userListExtends.setVRealname(o[4].toString());
			listextends.add(userListExtends);
		}
		return listextends;
	}

}
