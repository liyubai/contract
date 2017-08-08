package com.cauc.contract.business.hibernate;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cauc.contract.business.IQueryLoginUserService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.LoginUser;

@Service
public class QueryLoginUserServiceImpl extends GenericHibernateDAO implements IQueryLoginUserService{
	private static Log log = LogFactory.getLog(QueryLoginUserServiceImpl.class);
	private List<LoginUser> user;
    /**
     * 查询登录用户名密码
     * 
     */
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<LoginUser> queryLoginUser(LoginUser loginUser) {
		try {
			if (loginUser != null) {	 
				String hql = "from LoginUser where v_username = ? and v_password=?";
				Object[] ob=new Object[]{
						loginUser.getVUsername(),
						loginUser.getVPassword()	
				};
				user = super.find(hql,ob);
		
			return user;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return null;
	}
    //查询登录用户名
	@Override
	public List<LoginUser> queryLoginUserName(LoginUser loginUser) {
		try {
			if (loginUser != null) {	 
				String hql = "from LoginUser where v_username = ? ";
				Object[] ob=new Object[]{
						loginUser.getVUsername(),
				};
				user = super.find(hql,ob);
		
			return user;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return null;
	}

}
