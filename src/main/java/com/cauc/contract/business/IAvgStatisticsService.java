package com.cauc.contract.business;

import java.util.List;
import com.cauc.contract.pojos.Average;
import com.cauc.contract.pojos.Dictionary;

public interface IAvgStatisticsService {
	//查看平均统计列表
	List<Average> showAvgList(Average average);
	//查询数据字典
	List<Dictionary> showDicList();
}
