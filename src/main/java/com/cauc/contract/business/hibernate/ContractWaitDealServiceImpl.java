package com.cauc.contract.business.hibernate;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cauc.contract.business.IContractWaitDealService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.Contract;
import com.cauc.contract.pojos.Payment;

@Service
public class ContractWaitDealServiceImpl extends GenericHibernateDAO implements IContractWaitDealService{
	
	private static Log log = LogFactory.getLog(ContractWaitDealServiceImpl.class);
	private List<Contract> cont;
	private List<Contract> con;
	
	//查看合同表
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<Contract> viewContractWaitDeal() {
		try{
			String hql = "from Contract";		
			cont = super.find(hql);
			return cont;	
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return null;
	}
	
	//CID查看合同表
		@SuppressWarnings("unchecked")
		@Override
		@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
		public List<Contract> showContractWaitDeal(Contract contract) {
			try{
				String hql = "from Contract where CId = ?";	
				Object[] ob = new Object[]{contract.getCId()};
				con= super.find(hql,ob);
				return con;			
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			return null;			
		}

		//查看待付款
		@SuppressWarnings("unchecked")
		@Override
		@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
		public List<Payment> viewPaymentWaitDeal() {
			try{
				List<Payment> pay2 = new ArrayList<Payment>();
				String hql = "from Payment where PRealityDate is not null";
				pay2=super.find(hql);
				return pay2;					
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
			return null;
		}
	
	//查看付款
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<Payment> showPayWaitDeal(Payment payment) {
		try{
			List<Payment> pay = new ArrayList<Payment>();
			String hql="from Payment where PId=? ";
			/*String hql="select isnull(p.PArrears,''),isnull(p.PContractId,''),isnull(p.PReceiveDate,'')"
					+ " from Payment p "
					+ " where p.PArrears>0 "
					+ " and GetDate()>p.PReceiveDate-7 ";*/
			Object[] ob = new Object[]{payment.getPId()};
			pay = super.createQuery(hql,ob).list();
			return pay;	
		}catch(Exception e){
			System.out.println(e.getMessage());
		}
		return null;
	}
}

