package com.cauc.contract.business.hibernate;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cauc.contract.business.IAvgStatisticsService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.Average;
import com.cauc.contract.pojos.Dictionary;

@Service
public class AvgStatisticsServiceImpl extends GenericHibernateDAO implements IAvgStatisticsService{
	//查询统计列表
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<Average> showAvgList(Average average) {
		List<Average> AvgList = new ArrayList<Average>();
		List<Object[]> obj = new ArrayList<Object[]>();
		String sql="select  C_CONTRACT_ID as id,isnull(C_GRADE_INFO,'0') as grade,"
				+ "isnull(C_PAYMENT_INFO,'0') as payment ,"
				+ "isnull(C_DEAL_PRICE,0) as price,convert(varchar(4),C_SIGN_TIME,120) as y "
				+ "from Contract where 1=1";
			if(StringUtils.isNotBlank(average.getP_receive())&&(!("null".equals(average.getP_receive())))){
				sql+=" and convert(varchar(4),C_SIGN_TIME,120) like'"+average.getP_receive()+"'";
			}
				sql+=" and C_CONTRACT_ID is not null "; 
			obj=super.createSQLQuery(sql).list();
			//System.out.println(obj);
			for(Object[] t:obj){
				Average avg = new Average();
				avg.setContractId(t[0].toString());
				avg.setGradeInfo(t[1].toString());
				avg.setPaymentInfo(t[2].toString());
				avg.setDealPrice(t[3].toString());
				avg.setcSignTime(String.valueOf(t[4]));				
				AvgList.add(avg);
			}
		return AvgList;
	}
	
	//查询数据字典DictionaryId
	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<Dictionary> showDicList() {
		List<Dictionary> dicList = new ArrayList<Dictionary>();
		try{
			String hql="from Dictionary where topId>515 and topId<519 ";
			dicList = super.createQuery(hql).list();
			return dicList;
		}catch(Exception e){
			e.printStackTrace();
		}
		return dicList;
	}
	
}
