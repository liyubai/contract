package com.cauc.contract.business.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.springframework.stereotype.Service;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IPageService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.Dictionary;
@Service
public class PageServiceImpl  extends GenericHibernateDAO implements IPageService{

	/*
	 * 获取总条目数
	 * @see com.cauc.contract.business.IPageService#getTotalRowCount(java.lang.String)
	 */
	@Override
	public int getTotalRowCount(String tbName,String strWhere) throws FinanceServiceException {
		// TODO Auto-generated method stub

		try {
			String hql = "select count(1) from  "+tbName;
			if(strWhere!="")
			{
				hql+=" where "+strWhere;
			}
			
		    List<Object[]> tempList = super.createSQLQuery(hql).list();
	 	    Object object=  tempList.get(0);
	 	    String aString= object.toString();
            return (Integer.parseInt(object.toString()));  
			
		} catch (HibernateException e) {			
			throw new FinanceServiceException("查询失败！");
		}	
	
		//return count;
	}
	
	/*
	 * 获取分页显示的list
	 * @see com.cauc.contract.business.IPageService#getTotalRowCount(java.lang.String)
	 */
	@Override
	public List getListByPage(String tbFields,String tbName ,int pageIndex,int pageSize,String primaryKey,String strWhere,String strOrder) throws FinanceServiceException 
	{
		   if (strWhere != "")
           {
               strWhere = " where " + strWhere;
           }
           String hql = "select top " + pageSize + " " + tbFields + " from " + tbName + strWhere + " " + strOrder;
           if (pageIndex > 1)
           {

        		String afieleds=tbFields.replace(",", ",a.");
        		afieleds="a."+afieleds;
               hql = "select " + afieleds + " from " + tbName + " as a inner join (select rownum," + tbFields +
                       " from (select row_number() over(" + strOrder + ") as rownum," + tbFields + " from " + tbName + strWhere +
                       ") as t where rownum between " + ((pageIndex - 1) * pageSize + 1) + " and " + pageIndex * pageSize +
                       ") as b on a." + primaryKey + "=b." + primaryKey + " order by b.rownum";

           }
     
        List<Object[]> tempList = super.createSQLQuery(hql).list();
		return tempList;
	}
}
