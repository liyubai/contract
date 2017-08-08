/**
 * @(#)EntityDao.java
 * Description:	针对单个Entity对象的操作定义.不依赖于具体ORM实现方案.
 * Version :	0.1.0
 * Create by:	fuchaohui  2012-6-26
 */
package com.cauc.contract.business.dao;

import java.io.Serializable;
import java.util.List;

/**
 * 针对单个Entity对象的操作定义.不依赖于具体ORM实现方案.
 * 
 * @author calvin {@link www.springside.org.cn}
 */
public interface EntityDao<T> {
	
	T get(Serializable id);

	List<T> getAll();

	Serializable save(Object o);

	void remove(Object o);

	void removeById(Serializable id);

	/**
	 * 获取Entity对象的主键名.
	 */
	@SuppressWarnings("unchecked")
	String getIdName(Class clazz);
}
