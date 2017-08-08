package com.cauc.contract.business.hibernate;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.tools.ant.taskdefs.Copy;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IDataDicManageService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.pojos.Contract;
import com.cauc.contract.pojos.Dictionary;

@Service
public class DataDicManageServiceImpl extends GenericHibernateDAO implements IDataDicManageService {

	@Override
	public List<Dictionary> readAllDicByTopId(int topId) {
		// TODO Auto-generated method stub
		String hql = "from Dictionary t where TopId=? order by Level,ParentId,TopId";
		List<Dictionary> list = super.find(hql, topId);
		return list;
	}

	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public void addDataDicChild(Dictionary dic) throws FinanceServiceException {
		// TODO Auto-generated method stub
		try {
			super.save(dic);
		} catch (HibernateException e) {
			throw new FinanceServiceException("保存用户字典失败", e);
		}
	}

	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public void savedataDictionary(Dictionary dictionary) throws FinanceServiceException {
		// TODO Auto-generated method stub
		try {
			if (StringUtils.isBlank(Integer.toString(dictionary.getDictionaryId()))) {
				// 新增
			} else {
				// 更新
				Dictionary currentdictionary = get(Dictionary.class, dictionary.getDictionaryId());
				currentdictionary.setDictionaryName(dictionary.getDictionaryName());
				update(currentdictionary);
			}
		} catch (HibernateException e) {
			throw new FinanceServiceException("提交数据字典时失败", e);
		}
	}

	@Override
	public Dictionary getdataDictionary(int parentdictionaryId) throws FinanceServiceException {
		// TODO Auto-generated method stub
		Dictionary dictonary = super.get(Dictionary.class, parentdictionaryId);
		return dictonary;
	}

	/**
	 * 删除子分类
	 */
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public boolean deleteDataDictionary(Dictionary dictionary) throws FinanceServiceException {
		// TODO Auto-generated method stub
		try {
			super.remove(dictionary);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	/**
	 * 通过父id获取其下面的所有子分类
	 */
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public List<Dictionary> getAllDataDicByParentId(Dictionary dictionary) throws FinanceServiceException {
		// TODO Auto-generated method stub
		String hql = "from Dictionary t where ParentId=?";
		// List<Dictionary> list = super.find(hql, dictionary.getParentId());
		if (dictionary.getLevel() == 1) {
			List<Dictionary> list1 = super.find("from Dictionary t where  topId=?", dictionary.getDictionaryId());
			return list1;
		}

		else if (dictionary.getLevel() == 2) {
			List<Dictionary> list2 = super.find("from Dictionary t where  parentId=?", dictionary.getDictionaryId()); // 获取所有parentId下的3级
			List<Dictionary> alllist= super.find("from Dictionary t where  parentId=?", dictionary.getDictionaryId()); // 获取所有parentId下的3级 ;
			for (Dictionary dic2 : list2) //
			{
				List<Dictionary> list3 = super.find("from Dictionary t where  parentId=?", dic2.getDictionaryId()); // 获取所有parentId下的4级 ;
				alllist.addAll(list3);				
			}
			return alllist;
		}
		else if (dictionary.getLevel() == 3) {
			List<Dictionary> alllist= super.find("from Dictionary t where  parentId=?", dictionary.getDictionaryId()); // 获取所有parentId下的4级 ;			
			return alllist;
		} 
		else {

			return null;
		}
	}

	/**
	 * 删除父分类下属的所有子分类
	 */
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public boolean deleteDataDictionaryAllChild(List<Dictionary> dictionarylist) throws FinanceServiceException {
		// TODO Auto-generated method stub
		try {
			super.removeALL(dictionarylist);
			return true;
		} catch (HibernateException e) {
			return false;
		}
	}

	@Override
	public List<Dictionary> readAllDic() {
		// TODO Auto-generated method stub
		String hql = "from Dictionary ";
		List<Dictionary> list = super.find(hql);
		return list;
	}

}
