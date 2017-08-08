package com.cauc.contract.business.hibernate;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IContractModifyService;
import com.cauc.contract.business.IDataDictionaryListService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.cache.DictionaryCache;
import com.cauc.contract.pojos.Dictionary;
@Service
public class DataDictionaryListImpl extends GenericHibernateDAO implements IDataDictionaryListService{
	private static Log log = LogFactory.getLog(ContractModifyImpl.class);
	
	
     @Override
	public List<Dictionary> dataDictionaryList() throws FinanceServiceException {
		// TODO Auto-generated method stub
		String hql = "from " + Dictionary.class.getSimpleName() + " t  where  level=1";
		List<Dictionary> list = find(hql);
		return list;
		
	}


	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public void saveDataDic(Dictionary dic) throws FinanceServiceException {
		// TODO Auto-generated method stub
		try{
			super.save(dic);
			int id=dic.getDictionaryId();
		    System.out.print(id);
		    dic.setTopId(id);
		    dic.setParentId(id);
		    super.update(dic);
			// 更新缓存
			DictionaryCache dictionaryCache=DictionaryCache.getInstance();		
			dictionaryCache.addDictionary(dic);		
		}catch (HibernateException e) {
			throw new FinanceServiceException("保存用户字典失败", e);
		}
	}

	
}
