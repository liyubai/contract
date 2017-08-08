package com.cauc.contract.business;

import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.pojos.PayStatistics;

public interface IPayStatisticsService {
    //查询付款统计
	List<PayStatistics> showPayStatistics(PayStatistics payS);
	//查询付款
	List<PayStatistics> showPayList(PayStatistics pay);
	
    //查询总记录
	int getTotalRowCount(String str , PayStatistics payS) throws FinanceServiceException;
	//获取数据字典中对应Id 的值
    public String backgetDictionaryNameById(int id);

}
