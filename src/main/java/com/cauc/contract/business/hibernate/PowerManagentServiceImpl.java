package com.cauc.contract.business.hibernate;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cauc.contract.business.IPowerManagentService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.Power;
import com.sun.org.apache.commons.logging.Log;
import com.sun.org.apache.commons.logging.LogFactory;

@Service
public class PowerManagentServiceImpl extends GenericHibernateDAO implements IPowerManagentService{
	private static Log log = LogFactory.getLog(PowerManagentServiceImpl.class);
	@Override	
	public List<Power> readAllPower(){
		
			String hql = "from "+Power.class.getSimpleName();
			List<Power> list = find(hql);
			return list;
	}
}
