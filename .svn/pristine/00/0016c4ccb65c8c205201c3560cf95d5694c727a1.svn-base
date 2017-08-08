package com.cauc.contract.business.hibernate;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IRoleManagentService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.TContractRole;


@Service
public class RoleManagentServiceImpl extends GenericHibernateDAO implements IRoleManagentService {

	private static Log log = LogFactory.getLog(RoleManagentServiceImpl.class);
	@Override
	public List<TContractRole> readAllRole(){
		String hql = "from "+TContractRole.class.getSimpleName();
		List<TContractRole> list = find(hql);
		return list;
	}
	
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public void saveRole(TContractRole role) throws FinanceServiceException{
		try{
			if (role.getRole_Id()==null){
			//新增
			String hql = "from "+TContractRole.class.getSimpleName()+ " t where t.Role_Name='"+role.getRole_Name()+"'";
			
			//hql.setParameter(0, "name1",Hibernate.STRING);   
		        //query.setParameter(1, "password1",Hibernate.STRING);   
			List<TContractRole> list = find(hql);
			//role.setAdd_User(2);		
			//role.setLastModify_User(2);
			//role.setLastModify_Time(new Date());	
			if(list.size()<=0)
			{
				save(role);			}
			
			}
			else{			
				//修改
				TContractRole currentRole =get(TContractRole.class,role.getRole_Id());
				currentRole.setPower_Ids(role.getPower_Ids());
				//currentRole.setLastModify_Time(new Date());
				currentRole.setLastModify_User(3);
				update(currentRole);
				}
			}catch (HibernateException e) {
			//log.error("保持角色信息时失败", e);
			throw new FinanceServiceException("保持角色信息时失败。", e);
		}
	}
	
	
	
	
	
	
}

