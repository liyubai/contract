package com.cauc.contract.business.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IContractQuerylistService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.Contract;
import com.cauc.contract.pojos.Dictionary;
import com.cauc.contract.pojos.Payment;

@Service
public class ContractQuerylistServiceImpl extends GenericHibernateDAO implements IContractQuerylistService{

	private static Log log = LogFactory.getLog(ContractQuerylistServiceImpl.class);
	
	private List<Contract> cont;

	private List<Payment> payment;
	/**
     * 查看合同表
     */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<Contract> viewContract(Contract contract) {
		try {
			if (contract != null) {	 
				String hql = "from Contract where C_ID = ? ";
				Object[] ob=new Object[]{
						contract.getCId()	
				};
			cont = super.find(hql,ob);
		
			return cont;
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return null;
	}
    /**
     * 查询付款表
     */
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<Payment> viewPayment(Payment pm) {
		try {
			if (pm != null) {	 
				String hql = "from Payment where PContractKey = ? ";
				Object[] ob=new Object[]{
						pm.getPContractKey()
				};
			    payment = super.find(hql,ob);
				return payment;
				
			} else {
				return null;
			}
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return null;
	}
     // 合同管理  查詢全部合同
	@SuppressWarnings("unchecked")
	@Override
	public List<Contract> allContractQuerylist() {
		try {
			
				String hql = "from Contract ";
				cont = super.find(hql);
				return cont;
		}
		 catch (Exception e) {
			System.out.print(e.getMessage());
		}
		return null;
	}
    /**
     * 初次加载页面查询数据的总条数
     * @throws FinanceServiceException 
     */

	@Override
	public int getTotalRowCount(String str) throws FinanceServiceException {

		try {
			String hql = "select count(1) from  "+str;
		    List<Object[]> tempList = super.createSQLQuery(hql).list();
	 	    Object object=  tempList.get(0);
	 	    String aString= object.toString();
            return (Integer.parseInt(object.toString()));  
			
		} catch (HibernateException e) {			
			throw new FinanceServiceException("查询失败！");
		}	
	
	}
    /**
     * 全部查询的分页
     */
	@Override
	public List<Object[]> getListByPage(String tbName, int pageIndex, int pageSize, String primaryKey, String strWhere,
			String strOrder) {
		String afieleds=" C_ID , C_CONTRACT_ID  ,C_NAME , C_TYPE , C_STU_TYPE , C_SIGN_TIME , C_GRADE_INFO , C_COMPY ,C_STATUS ";

		   if (strWhere != "")
        {
            strWhere = " where " + strWhere;
        }
        String hql = "select top " + pageSize + " " + afieleds + " from " + tbName + strWhere + " " + strOrder;
        if (pageIndex > 1)
        {
        	String addafieleds=" a.C_ID , a.C_CONTRACT_ID  ,a.C_NAME ,  a.C_TYPE ,  a.C_STU_TYPE ,  a.C_SIGN_TIME ,  a.C_GRADE_INFO ,  a.C_COMPY , a.C_STATUS ";
            hql = "select " + addafieleds + " from " + tbName + " as a inner join (select " + afieleds +
                    " from (select row_number() over(" + strOrder + ") as rownum," + afieleds + " from " + tbName + strWhere +
                    ") as t where rownum between " + ((pageIndex - 1) * pageSize + 1) + " and " + pageIndex * pageSize +
                    ") as b on a." + primaryKey + "=b." + primaryKey + " order by b.C_ID DESC";

        }
  
     List<Object[]> tempList = super.createSQLQuery(hql).list();
		return tempList;
	}
    /**
     * 部分查询数据的条数
     * @throws FinanceServiceException 
     */
	@Override
	public int getPartTotalRowCount(String str, Contract contract) throws FinanceServiceException {
		try {
			String hql = "select count(1) from  "+str;
			
			if (contract != null) {
			    hql += " where  1=1 ";
				if (!contract.getCContractId().equals("") && contract.getCContractId() != null) {
					hql += " and C_CONTRACT_ID like '"+contract.getCContractId()+"%'";
				}
				if(!contract.getCCompy().equals("") && contract.getCCompy()!=0 && contract.getCCompy()!=2 && contract.getCCompy()!=null){
					hql += " and C_COMPY = '"+contract.getCCompy()+"'";	
				}
				if(!contract.getCStuType().equals("") && contract.getCStuType() !=0 && contract.getCStuType() !=3 && contract.getCStuType() !=null ){
					hql += " and C_STU_TYPE = '"+contract.getCStuType()+"'";	
				} 
				if(!contract.getCType().equals("") && contract.getCType() !=0 && contract.getCType() !=322 && contract.getCType() !=null){
					hql += " and C_TYPE = '"+contract.getCType()+"'";	
				}
				if(!contract.getCSignTime().equals("") && contract.getCSignTime() != null){
					hql += " and C_SIGN_TIME like '"+contract.getCSignTime()+"%'";
					
				}
				if(!contract.getCGradeInfo().equals("") && contract.getCGradeInfo() != null){
					hql += " and C_GRADE_INFO like '%gradeYear\":\""+contract.getCGradeInfo()+"%'";
				}
				if(contract.getCStatus()!=0 && contract.getCStatus()!=null){
					hql += " and  C_STATUS ='"+contract.getCStatus()+"'";
				}
			}
		    List<Object[]> tempList = super.createSQLQuery(hql).list();
	 	    Object object=  tempList.get(0);
	 	   // String aString= object.toString();
            return (Integer.parseInt(object.toString()));  
			
		} catch (HibernateException e) {			
			throw new FinanceServiceException("查询失败！");
		}	
	}
    /**
     * 分页  条件查询
     */
	@Override
	public List<Object[]> getPartListByPage(String tbName, int pageIndex, int pageSize, String primaryKey,
			Contract con, String strOrder) {
		String afieleds = " C_ID , C_CONTRACT_ID  ,C_NAME , C_TYPE , C_STU_TYPE , C_SIGN_TIME , C_GRADE_INFO , C_COMPY ,C_STATUS ";
         String  hql = "";
		if (con != null) {
			hql += " where  1=1";
			if (!con.getCContractId().equals("") && con.getCContractId() != null) {
				hql += " and C_CONTRACT_ID like '"+con.getCContractId()+"%'";
			}
			if(!con.getCCompy().equals("") && con.getCCompy()!=0 && con.getCCompy()!=2 && con.getCCompy()!=null){
				hql += " and C_COMPY = '"+con.getCCompy()+"'";	
			}
			if(!con.getCStuType().equals("") && con.getCStuType() !=0 && con.getCStuType() !=3 && con.getCStuType() !=null ){
				hql += " and C_STU_TYPE = '"+con.getCStuType()+"'";	
			} 
			if(!con.getCType().equals("") && con.getCType() !=0 && con.getCType() !=322 && con.getCType() !=null){
				hql += " and C_TYPE = '"+con.getCType()+"'";	
			}
			if(!con.getCSignTime().equals("") && con.getCSignTime() != null){
				hql += " and C_SIGN_TIME like '"+con.getCSignTime()+"%'";
				
			}
			if(!con.getCGradeInfo().equals("") && con.getCGradeInfo() != null){
				hql += " and C_GRADE_INFO like '%gradeYear\":\""+con.getCGradeInfo()+"%'";
			}
			if(con.getCStatus()!=0 && con.getCStatus()!=null){
				hql += " and  C_STATUS ='"+con.getCStatus()+"'";
			}
		}
		String parthql = "select top " + pageSize + " " + afieleds + " from " + tbName + hql + " " + strOrder;
		if (pageIndex > 1) {
			String addafieleds = " a.C_ID , a.C_CONTRACT_ID  ,a.C_NAME ,  a.C_TYPE ,  a.C_STU_TYPE ,  a.C_SIGN_TIME ,  a.C_GRADE_INFO ,  a.C_COMPY , a.C_STATUS ";
			parthql = "select " + addafieleds + " from " + tbName + " as a inner join (select " + afieleds
					+ " from (select row_number() over(" + strOrder + ") as rownum," + afieleds + " from " + tbName
					+ hql + ") as t where rownum between " + ((pageIndex - 1) * pageSize + 1) + " and "
					+ pageIndex * pageSize + ") as b on a." + primaryKey + "=b." + primaryKey + " order by b.C_ID desc";

		}

		List<Object[]> tempList = super.createSQLQuery(parthql).list();
		return tempList;
	}

    /**
     * 根据数据字典中的ID 查询对应的名称
     */
	@Override
	public String getKindsName(Integer id) {
		try {
		    List<Dictionary> dictionaryList = new ArrayList<Dictionary>();
			String hql = "from Dictionary where DictionaryId ="+id;
			dictionaryList = super.find(hql);
			String name = dictionaryList.get(0).getDictionaryName();
			return name;
	        } catch (Exception e) {
	        	System.out.println(e.getMessage().toString());
	    }
	    return null;
	}

}
