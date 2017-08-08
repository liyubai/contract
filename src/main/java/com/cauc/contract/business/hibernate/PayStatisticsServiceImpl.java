package com.cauc.contract.business.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.mapping.Array;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IPayStatisticsService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.Dictionary;
import com.cauc.contract.pojos.PayStatistics;

@Service
@SuppressWarnings("unused")
public class PayStatisticsServiceImpl extends GenericHibernateDAO implements IPayStatisticsService {
	private static Log log = LogFactory.getLog(PayStatisticsServiceImpl.class);

	@Override
	public List<PayStatistics> showPayStatistics(PayStatistics payS) {
		List<PayStatistics> PayStat = new ArrayList<PayStatistics>();
		String sql = "select isnull(c.C_CONTRACT_ID,'') as id ,isnull(c.C_COMPY,'') as cy,isnull(c.C_STATUS,'') as cs,"
				+ "isnull(c.C_TYPE,'') as ce,isnull(c.C_DEAL_PRICE,'0') as cp,isnull(c.C_GRADE_INFO,'0') as co,"
				+ "isnull(c.C_ID,'0') as cid,'" + payS.getRtime() + "' as y from Contract c where  c.C_STATUS > 1"
				+ "and c.C_ID in"
				+ "(select distinct p.P_CONTRACT_KEY  from Payment p  where convert(varchar(4),p.P_RECEIVE_DATE,120) like '"
				+ payS.getRtime() + "'";
//		 if(payS.getRpayStatus()!=0){
//			 sql+=" and p.P_NOTICE_STATUS in (1,2,3)";
//		 }
		  if(payS.getRpayStatus()!=0 && payS.getRpayStatus()==2){
			sql += "  and p.P_NOTICE_STATUS ='"+payS.getRpayStatus()+"')";
		 }
		 else if(payS.getRpayStatus()!=0 && payS.getRpayStatus()==3){
			sql += "  and p.P_NOTICE_STATUS ='"+payS.getRpayStatus()+"')"; 
		 }
		 else if (StringUtils.isNotBlank(payS.getRbeginTime()) && StringUtils.isNotBlank(payS.getRendTime())) {
			sql += " and  p.P_RECEIVE_DATE >'" + payS.getRbeginTime() + "' "
				+ "and  p.P_RECEIVE_DATE < '"+payS.getRendTime() + "') ";
		}else{
			sql+=")";
		}  
		if (StringUtils.isNotBlank(payS.getRcontractId()) && !("null".equals(payS.getRcontractId()))) {
			sql += " and c.C_CONTRACT_ID like '" + payS.getRcontractId() + "%'";
		}
		if (payS.getRcompany() != 0 && payS.getRcompany() != 2) {
			sql += " and c.C_COMPY = '" + payS.getRcompany() + "'";
		}
		if (payS.getRcontractStatus() != 0) {
			sql += " and c.C_STATUS = '" + payS.getRcontractStatus() + "' ";
		}
		if (payS.getRcontractType() != 0 && payS.getRcontractType() != 322) {
			sql += " and c.C_TYPE = '" + payS.getRcontractType() + "'";
		}
		 
		List<Object[]> strList = super.createSQLQuery(sql).list();
		for (Object[] ob : strList) {
			PayStatistics ps = new PayStatistics();
			ps.setContractId(ob[0].toString()); // 合同号
			int compyid = Integer.parseInt(ob[1].toString());
			// int cstatusid=Integer.parseInt(ob[2].toString());
			int contractTypeid = Integer.parseInt(ob[3].toString());
			if (compyid == 0) {
				ps.setCompany("");
			} else {
				ps.setCompany(getDictionaryNameById(compyid)); // 签约单位
			}
			// if(cstatusid==0){
			// ps.setCstatus("");
			// }else{
			// ps.setCstatus(getDictionaryNameById(cstatusid));//合同状态
			// }
			if (contractTypeid == 0) {
				ps.setContractType("");
			} else
				ps.setContractType(getDictionaryNameById(contractTypeid));// 合同类型
			ps.setCstatus(ob[2].toString());
			ps.setCdealPrice(ob[4].toString()); // 成交价
			ps.setGradeInfo(ob[5].toString()); // 学生信息
			ps.setCId(Integer.parseInt(ob[6].toString())); // 合同编号
			ps.setYear(ob[7].toString()); // 年份
			PayStat.add(ps);
		}
		return PayStat;
	}

	// 查询付款表
	@SuppressWarnings({ "unchecked", "unchecked" })
	@Override
	public List<PayStatistics> showPayList(PayStatistics payL) {
		List<PayStatistics> PaySt = new ArrayList<PayStatistics>();
		// showPayStatistics(payL).size();
		String str = "";
		String tempStr = "";
		// 获取Contract表的cid 存为字符串
		for (int i = 0; i < showPayStatistics(payL).size(); i++) {
			str += showPayStatistics(payL).get(i).getCId() + ",";
		}
		if (str.length() > 0) {
			tempStr = str.substring(0, str.length() - 1);
			System.out.println(tempStr);
		} else {
			return null;
		}
		// 查询付款表
		String SQL = "select isnull(p.P_RECEIVE_MONEY,'0') as pm,isnull(p.P_REALITY_DATE,'0') as pd ,"
				+ " isnull(p.P_CONTRACT_KEY,'') as pk,isnull(p.P_NOTICE_STATUS,'0') as pps,"
				+ "convert(varchar(4),P_RECEIVE_DATE,120) as years,p.P_CONTRACT_ID as pid from Payment p"
				+ " where  p.P_CONTRACT_KEY in (" + tempStr + ") "
				+ " order by p.P_CONTRACT_KEY";
		List<Object[]> object = super.createSQLQuery(SQL).list();
		for (Object[] t : object) {
			PayStatistics pay = new PayStatistics();
			pay.setPReceiveMoney(t[0].toString()); // 预收金额
			pay.setPPrealityDate(t[1].toString()); // 真实收款日期
			pay.setPContractKey(t[2].toString()); //
			pay.setPNoticeStatus(t[3].toString());// (通知)付款状态
			pay.setPReceiveDate(t[4].toString()); // 预收款日期
			pay.setPcontractId(t[5].toString()); // 合同号
			PaySt.add(pay);
		}
		return PaySt;
	}

	/**
	 * 根据Id 在数据字典中获取该Id的名字
	 * 
	 * @param id
	 * @return
	 */
	private String getDictionaryNameById(int id) {
		String hql = "from Dictionary where DictionaryId =" + id;
		List<Dictionary> dictionaryList = new ArrayList<Dictionary>();
		dictionaryList = super.find(hql);
		String name = dictionaryList.get(0).getDictionaryName();
		return name;
	}

	@Override
	public String backgetDictionaryNameById(int id) {
		String hql = "from Dictionary where DictionaryId =" + id;
		List<Dictionary> dictionaryList = new ArrayList<Dictionary>();
		dictionaryList = super.find(hql);
		String name = dictionaryList.get(0).getDictionaryName();
		return name;
	}

	/**
	 * 查询条数
	 * 
	 * @throws FinanceServiceException
	 */
	@Override
	public int getTotalRowCount(String str ,PayStatistics payS) throws FinanceServiceException {
		try {
			String hql = "select count(1) from  Contract where 1=1";
			if (StringUtils.isNotBlank(payS.getContractId())) {
				hql += " and C_CONTRACT_ID like '" + payS.getContractId() + "%'";
			}
			if (payS.getRcompany() != 0) {
				hql += " and C_COMPY = '" + payS.getRcompany() + "'";
			}
			if (payS.getRcontractStatus() != 0) {
				hql += " and C_STATUS = '" + payS.getRcontractStatus() + "'";
			}
			if (payS.getRcontractType() != 0) {
				hql += " and C_TYPE = '" + payS.getRcontractType() + "'";
			}
			if (StringUtils.isNotBlank(payS.getRtime())) {
				hql += " and C_SIGN_TIME like '" + payS.getRtime() + "%'";

			}
			/*
			 * if (payS.getRpayStatus()!=0) { hql +=
			 * " and C_GRADE_INFO like '%gradeYear\":\"" +
			 * contract.getCGradeInfo() + "%'"; }
			 */
			List<Object[]> tempList = super.createSQLQuery(hql).list();
			Object object = tempList.get(0);
			return (Integer.parseInt(object.toString()));

		} catch (HibernateException e) {
			throw new FinanceServiceException("查询失败！");
		}

	}

}
