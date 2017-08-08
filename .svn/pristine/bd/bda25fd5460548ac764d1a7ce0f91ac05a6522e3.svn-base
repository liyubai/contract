/*
 * @(#)GenericHibernateDAO.java
 * Description:	Finance
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2012 Newage Microsystems, Inc. All rights reserved.
 * Create by:	fuchaohui  2012-6-27
 */
package com.cauc.contract.business.dao;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.beanutils.PropertyUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.impl.CriteriaImpl;
import org.hibernate.metadata.ClassMetadata;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.util.Assert;
import org.springframework.util.ReflectionUtils;

import com.cauc.contract.business.dao.support.Page;
import com.cauc.contract.util.BeanUtils;

/**
 * <p>
 * Hibernate Dao的泛型基类 继承于Spring的<code>HibernateDaoSupport</code>,
 * 提供分页函数和若干便捷查询方法，并对返回值作了泛型类型转换.
 * </p>
 * 
 * @author calvin (springside) {@link www.springside.org.cn}
 * @author tin (springside) {@link www.springside.org.cn}
 * @see HibernateDaoSupport
 */
@SuppressWarnings("unchecked")
public class GenericHibernateDAO extends HibernateDaoSupport {
	@Autowired
	public void setHibernateSessionFactory(@Qualifier("sessionFactory")SessionFactory sessionFactory){
		super.setSessionFactory(sessionFactory);
	}
	/**
	 * 根据ID获取对象. 实际调用Hibernate的session.get()方法返回实体对象. 如果对象不存在，抛出异常.
	 */
	public <T> T get(Class<T> entityClass, Serializable id) {
		return (T) getHibernateTemplate().get(entityClass, id);
	}

	/**
	 * 根据ID获取对象. 实际调用Hibernate的session.load()方法返回其proxy对象. 如果对象不存在，抛出异常.
	 */
	public <T> T load(Class<T> entityClass, Serializable id) {
		return (T) getHibernateTemplate().load(entityClass, id);
	}

	/**
	 * 获取全部对象.
	 */
	public <T> List<T> getAll(Class<T> entityClass) {
		return getHibernateTemplate().loadAll(entityClass);
	}

	/**
	 * 获取全部对象,带排序字段与升降序参数.
	 */
	public <T> List<T> getAll(Class<T> entityClass, String orderBy,
			boolean isAsc) {
		Assert.hasText(orderBy);
		if (isAsc)
			return getHibernateTemplate().findByCriteria(
					DetachedCriteria.forClass(entityClass).addOrder(
							Order.asc(orderBy)));
		else
			return getHibernateTemplate().findByCriteria(
					DetachedCriteria.forClass(entityClass).addOrder(
							Order.desc(orderBy)));
	}

	/**
	 * 批量保存
	 * @param list
	 */
	public void saveOrUpdateALL(List list) {
		getHibernateTemplate().saveOrUpdateAll(list);
	}
	
	/**
	 * 批量删除
	 * @param list
	 */
	public void removeALL(List list){
		getHibernateTemplate().deleteAll(list);
	}
	
	/**
	 * 保存对象.
	 * 
	 * @return Serializable id
	 */
	public Serializable save(Object o) {
		return getHibernateTemplate().save(o);
	}

	/**
	 * 保存或更新对象.
	 */
	public void saveOrUpdate(Object o) {
		getHibernateTemplate().saveOrUpdate(o);
	}
	
	/**
	 * 更新对象
	 * @param Object 需要更新的对象
	 */
	public void update(Object o){
		getHibernateTemplate().update(o);
	}
	/**
	 * 删除对象.
	 */
	public void remove(Object o) {
		getHibernateTemplate().delete(o);
	}

	/**
	 * 根据ID删除对象.
	 */
	public <T> void removeById(Class<T> entityClass, Serializable id) {
		remove(get(entityClass, id));
	}

	public void flush() {
		getHibernateTemplate().flush();
	}

	public void clear() {
		getHibernateTemplate().clear();
	}

	/**
	 * 创建Query对象.
	 * 对于需要first,max,fetchsize,cache,cacheRegion等诸多设置的函数,可以在返回Query后自行设置.
	 * 留意可以连续设置,如下：
	 * 
	 * <pre>
	 * dao.createQuery(hql).setMaxResult(100).setCacheable(true).list();
	 * </pre>
	 * 
	 * 调用方式如下：
	 * 
	 * <pre>
	 *        dao.createQuery(hql)
	 *        dao.createQuery(hql,arg0);
	 *        dao.createQuery(hql,arg0,arg1);
	 *        dao.createQuery(hql,new Object[arg0,arg1,arg2])
	 * </pre>
	 * 
	 * @param values
	 *            可变参数.
	 * @return org.hibernate.Query
	 */
	public Query createQuery(String hql, Object... values) {
		Assert.hasText(hql);
		Query query = getSession().createQuery(hql);
		for (int i = 0; i < values.length; i++) {
			query.setParameter(i, values[i]);
		}
		return query;
	}
	/**
	 * 创建Query对象(SQL).
	 * 对于需要first,max,fetchsize,cache,cacheRegion等诸多设置的函数,可以在返回Query后自行设置.
	 * 留意可以连续设置,如下：
	 * 
	 * <pre>
	 * dao.createQuery(sql).setMaxResult(100).setCacheable(true).list();
	 * </pre>
	 * 
	 * 调用方式如下：
	 * 
	 * <pre>
	 *        dao.createQuery(sql)
	 *        dao.createQuery(sql,arg0);
	 *        dao.createQuery(sql,arg0,arg1);
	 *        dao.createQuery(sql,new Object[arg0,arg1,arg2])
	 * </pre>
	 * 
	 * @param values
	 *            可变参数.
	 * @return org.hibernate.Query
	 */
	public Query createSQLQuery(String sql, Object... values) {
		Assert.hasText(sql);

		Query query = getSession().createSQLQuery(sql);
		for (int i = 0; i < values.length; i++) {
			query.setParameter(i, values[i]);
		}

		return query;
	}
	/**
	 * 创建Criteria对象.
	 * 
	 * @param criterions
	 *            可变的Restrictions条件列表,见{@link #createQuery(String,Object...)}
	 * @return org.hibernate.Criteria
	 */
	public <T> Criteria createCriteria(Class<T> entityClass,
			Criterion... criterions) {
		Criteria criteria = getSession().createCriteria(entityClass);
		for (Criterion c : criterions) {
			criteria.add(c);
		}
		return criteria;
	}

	/**
	 * 创建Criteria对象，带排序字段与升降序字段.
	 * 
	 * @see #createCriteria(Class,Criterion[])
	 */
	public <T> Criteria createCriteria(Class<T> entityClass, String orderBy,
			boolean isAsc, Criterion... criterions) {
		Assert.hasText(orderBy);

		Criteria criteria = createCriteria(entityClass, criterions);

		if (isAsc)
			criteria.addOrder(Order.asc(orderBy));
		else
			criteria.addOrder(Order.desc(orderBy));

		return criteria;
	}

	/**
	 * 根据hql查询,直接使用HibernateTemplate的find函数.
	 * 
	 * @param values
	 *            可变参数,见{@link #createQuery(String,Object...)}
	 * @return 符合条件的对象列表
	 */
	public List find(String hql, Object... values) {
		Assert.hasText(hql);
		return getHibernateTemplate().find(hql, values);
	}
	
	/**
	 * 根据hql查询
	 */
	public List find(StringBuffer hql,Object... values){
		Assert.hasText(hql.toString());
		return getHibernateTemplate().find(hql.toString(), values);
	}
	/**
	 * 根据属性名和属性值查询对象
	 * 
	 * @param entityClass
	 *            要查询的 类
	 * @param propertyName
	 *            属性名称
	 * @param value
	 *            值
	 * @return 符合条件的 对象列表
	 */
	public <T> List<T> findBy(Class<T> entityClass, String propertyName,
			Object value) {
		Assert.hasText(propertyName);
		return createCriteria(entityClass, Restrictions.eq(propertyName, value))
				.list();
	}

	/**
	 * 根据属性名和属性值查询对象,带排序参数.
	 * 
	 * @param entityClass
	 *            要查询的 类
	 * @param propertyName
	 *            属性名称
	 * @param value
	 *            值
	 * @param orderBy
	 *            排序的字段
	 * @param isAsc
	 *            是否为正序
	 * @return 符合条件的对象列表
	 */
	public <T> List<T> findBy(Class<T> entityClass, String propertyName,
			Object value, String orderBy, boolean isAsc) {
		Assert.hasText(propertyName);
		Assert.hasText(orderBy);
		return createCriteria(entityClass, orderBy, isAsc,
				Restrictions.eq(propertyName, value)).list();
	}

	/**
	 * 根据属性名和属性值查询唯一对象.
	 * 
	 * @return 符合条件的唯一对象 or null if not found.
	 */
	public <T> T findUniqueBy(Class<T> entityClass, String propertyName,
			Object value) {
		Assert.hasText(propertyName);
		return (T) createCriteria(entityClass,
				Restrictions.eq(propertyName, value)).uniqueResult();
	}

	/**
	 * 
	 * 根据HQL查询记录集,使用系统默认pageSize
	 * 
	 * 调用方式如下：
	 * 
	 * <pre>
	 *        dao.pagedQuery(hql,1)
	 *        dao.pagedQuery(hql,1,arg0);
	 *        dao.pagedQuery(hql,1,arg0,arg1);
	 *        dao.pagedQuery(hql,1,new Object[arg0,arg1,arg2])
	 * </pre>
	 * 
	 * @param hql
	 *            hibernate HQL 如： from User where userId=?
	 * @param pageNo
	 *            页号,从1开始.
	 * @param values
	 *            可变参数
	 * @return com.highcom.bill.business.dao.support.Page 分页辅助对象
	 */
	public Page pagedQuery(String hql, int pageNo, Object... values) {
		return pagedQuery(hql, pageNo, Page.DEFAULT_PAGE_SIZE, values);
	}

	/**
	 * 
	 * 根据HQL查询记录集
	 * 
	 * 调用方式如下：
	 * 
	 * <pre>
	 *        dao.pagedQuery(hql,1,15)
	 *        dao.pagedQuery(hql,1,15,arg0);
	 *        dao.pagedQuery(hql,1,15,arg0,arg1);
	 *        dao.pagedQuery(hql,1,15,new Object[arg0,arg1,arg2])
	 * </pre>
	 * 
	 * @param hql
	 *            hibernate HQL 如： from User where userId=?
	 * @param pageNo
	 *            页号,从1开始.
	 * @param pageSize
	 *            每页显示记录数
	 * @param values
	 *            可变参数
	 * @return com.highcom.bill.business.dao.support.Page 分页辅助对象
	 */
	public Page pagedQuery(String hql, int pageNo, int pageSize,
			Object... values) {
		Assert.hasText(hql);
		Assert.isTrue(pageNo >= 1, "pageNo should start from 1");
		// Count查询
		String countQueryString = " select count (*) "
				+ removeSelect(removeOrders(hql));
		List countlist = getHibernateTemplate().find(countQueryString, values);
		int totalCount = 0;
		if (countlist != null){
			totalCount = ((Long) countlist.get(0)).intValue();
		}
		if (totalCount < 1)
			return new Page(0, 0, pageSize, new ArrayList());
		// 实际查询返回分页对象
		int startIndex = Page.getStartOfPage(pageNo, pageSize);
		Query query = createQuery(hql, values);
		List list = query.setFirstResult(startIndex).setMaxResults(pageSize)
				.list();

		return new Page(startIndex, totalCount, pageSize, list);
	}

	/**
	 * 分页查询函数，使用已设好查询条件与排序的<code>Criteria</code> 使用默认的pageSize
	 * 
	 * @param criteria
	 *            构造好的<code>Criteria</code>
	 * @param pageNo
	 *            页号(从1开始)
	 * @return com.highcom.bill.business.dao.support.Page 分页辅助对象
	 */
	public Page pagedQuery(Criteria criteria, int pageNo) {
		return pagedQuery(criteria, pageNo, Page.DEFAULT_PAGE_SIZE);
	}

	/**
	 * 分页查询函数，使用已设好查询条件与排序的<code>Criteria</code>
	 * 
	 * @param criteria
	 *            构造好的<code>Criteria</code>
	 * @param pageNo
	 *            页号(从1开始)
	 * @param pageSize
	 *            每页显示的 数据记录总数
	 * @return com.highcom.bill.business.dao.support.Page 分页辅助对象
	 */
	public Page pagedQuery(Criteria criteria, int pageNo, int pageSize) {
		Assert.notNull(criteria);
		Assert.isTrue(pageNo >= 1, "pageNo should start from 1");
		CriteriaImpl impl = (CriteriaImpl) criteria;

		// 先把Projection和OrderBy条件取出来,清空两者来执行Count操作
		Projection projection = impl.getProjection();
		List<CriteriaImpl.OrderEntry> orderEntries;
		try {
			orderEntries = (List) BeanUtils.forceGetProperty(impl,
					"orderEntries");
			BeanUtils.forceSetProperty(impl, "orderEntries", new ArrayList());
		} catch (Exception e) {
			throw new InternalError(" Runtime Exception impossibility throw ");
		}
		
		// 执行查询
		long totalCount = 0;
		
		if (criteria.setProjection(Projections.rowCount()).uniqueResult() != null)
			totalCount = ((Long) criteria.setProjection(
					Projections.rowCount()).uniqueResult()).longValue();//hibernate3.5返回的是long，之前版本返回int
		
		if (totalCount < 1)
			return new Page();
		// 将之前的Projection和OrderBy条件重新设回去

		criteria.setProjection(projection);
		if (projection == null) {
			criteria.setResultTransformer(CriteriaSpecification.ROOT_ENTITY);
		}

		try {
			BeanUtils.forceSetProperty(impl, "orderEntries", orderEntries);
		} catch (Exception e) {
			throw new InternalError(" Runtime Exception impossibility throw ");
		}

		// 返回分页对象
		if (totalCount < 1)
			return new Page();
		int startIndex = Page.getStartOfPage(pageNo, pageSize);
		List list = criteria.setFirstResult(startIndex).setMaxResults(pageSize)
				.list();

		return new Page(startIndex, (int)totalCount, pageSize, list);
	}
	
	public Page pagedSQLQuery(String sql, int pageNo, int pageSize,
			Object... values) {
		Assert.hasText(sql);
		Assert.isTrue(pageNo >= 1, "pageNo should start from 1");
		// Count查询
		sql =sql.replaceAll("order by d_createdate desc", "");
		String countQueryString = " select count(*) from ("
				+ removeOrders(sql) + ") ctotal";

		List countlist = createSQLQuery(countQueryString, values).list();
		int totalCount = 0;
		if (countlist != null)
			totalCount = ((Integer)countlist.get(0)).intValue();
		if (totalCount < 1)
			return new Page(0, 0, pageSize, new ArrayList());
		// 实际查询返回分页对象
		int startIndex = Page.getStartOfPage(pageNo, pageSize);

		Query query = createSQLQuery(sql, values);
		List list = query.setFirstResult(startIndex).setMaxResults(pageSize)
				.list();

		return new Page(startIndex, totalCount, pageSize, list);
	}
	
	public Page pagedSQLHasOrderQuery(String sql, int pageNo, int pageSize,
			Object... values) {
		Assert.hasText(sql);
		Assert.isTrue(pageNo >= 1, "pageNo should start from 1");

		String countQueryString = " select count(*) from ("+sql + ") ctotal";

		List countlist = createSQLQuery(countQueryString, values).list();

		int totalCount = 0;
		if (countlist != null)
			totalCount = ((Integer)countlist.get(0)).intValue();

		if (totalCount < 1)
			return new Page(0, 0, pageSize, new ArrayList());
		// 实际查询返回分页对象
		int startIndex = Page.getStartOfPage(pageNo, pageSize);

		sql = sql.replace("top 100000000","");
		Query query = createSQLQuery(sql, values);
		List list = query.setFirstResult(startIndex).setMaxResults(pageSize)
				.list();
	
		return new Page(startIndex, totalCount, pageSize, list);
	}
	/**
	 * 分页查询函数，根据entityClass和查询条件参数创建默认的<code>Criteria</code>.
	 * 使用系统默认的pageSize
	 * 
	 * @param entityClass
	 *            需要检查对象的Class
	 * @param pageNo
	 *            页号(从1开始)
	 * @param criterions
	 *            查询的条件
	 * @return com.highcom.bill.business.dao.support.Page 分页辅助对象
	 */
	public Page pagedQuery(Class entityClass, int pageNo,
			Criterion... criterions) {
		return pagedQuery(entityClass, pageNo, Page.DEFAULT_PAGE_SIZE,
				criterions);
	}

	/**
	 * 分页查询函数，根据entityClass和查询条件参数创建默认的<code>Criteria</code>.
	 * 使用系统默认的pageSize
	 * 
	 * @param entityClass
	 *            需要检查对象的Class
	 * @param pageNo
	 *            页号(从1开始)
	 * @param criterions
	 *            查询的条件
	 * @return com.highcom.bill.business.dao.support.Page 分页辅助对象
	 */
	public Page pagedQuery(Class entityClass, int pageNo, int pageSize,
			Criterion... criterions) {
		Criteria criteria = createCriteria(entityClass, criterions);
		return pagedQuery(criteria, pageNo, pageSize);
	}
	/**
	 * 
	 * 分页查询函数，根据entityClass和查询条件参数创建默认的<code>Criteria</code>.
	 * 
	 * @param entityClass
	 *            需要检查对象的Class
	 * @param pageNo
	 *            页号(从1开始)
	 * @param pageSize
	 *            每页显示的 数据记录总数
	 * @param criterions
	 *            查询的条件
	 * @return com.highcom.bill.business.dao.support.Page 分页辅助对象
	 */
	public Page pagedQuery(Class entityClass, int pageNo, String orderBy,
			boolean isAsc, Criterion... criterions) {
		return pagedQuery(entityClass, pageNo, Page.DEFAULT_PAGE_SIZE, orderBy,
				isAsc, criterions);
	}

	/**
	 * 
	 * 分页查询函数，根据entityClass和查询条件参数,排序参数创建默认的<code>Criteria</code>.
	 * 
	 * @param entityClass
	 *            需要检查对象的Class
	 * @param pageNo
	 *            页号(从1开始)
	 * @param pageSize
	 *            每页显示的 数据记录总数
	 * @param orderBy
	 *            需要排序的属性名
	 * @param isAsc
	 *            是否为正序
	 * @param criterions
	 *            查询的条件
	 * @return com.highcom.bill.business.dao.support.Page 分页辅助对象
	 */
	public Page pagedQuery(Class entityClass, int pageNo, int pageSize,
			String orderBy, boolean isAsc, Criterion... criterions) {
		Criteria criteria = createCriteria(entityClass, orderBy, isAsc,
				criterions);
		return pagedQuery(criteria, pageNo, pageSize);
	}

	/**
	 * 
	 * 判断对象某些属性的值在数据库中是否唯一.
	 * 
	 * @param entityClass
	 *            需要检查对象的Class
	 * @param entity
	 *            需要检查的对象
	 * @param uniquePropertyNames
	 *            在POJO里不能重复的属性列表,以逗号分割 如"name,loginid,password"
	 * @return true or false
	 */
	public <T> boolean isUnique(Class<T> entityClass, Object entity,
			String uniquePropertyNames) {
		Assert.hasText(uniquePropertyNames);
		Criteria criteria = createCriteria(entityClass).setProjection(
				Projections.rowCount());
		String[] nameList = uniquePropertyNames.split(",");
		try {
			// 循环加入唯一列
			for (String name : nameList) {
				criteria.add(Restrictions.eq(name, PropertyUtils.getProperty(
						entity, name)));
			}
			// 以下代码为了如果是update的情况,排除entity自身.
			String idName = getIdName(entityClass);
			// 取得entity的主键值
			Serializable id = getId(entityClass, entity);

			// 如果id!=null,说明对象已存在,该操作为update,加入排除自身的判断
			if (id != null)
				criteria.add(Restrictions.not(Restrictions.eq(idName, id)));
		} catch (Exception e) {
			ReflectionUtils.handleReflectionException(e);
		}
		return (Integer) criteria.uniqueResult() == 0;
	}

	/**
	 * 取得对象的主键值,辅助函数.
	 * 
	 * @param entityClass
	 *            需要检查对象的Class
	 * @param entity
	 *            需要检查的对象
	 * @return 序列化的ID
	 * @throws NoSuchMethodException
	 * @throws IllegalAccessException
	 * @throws InvocationTargetException
	 */
	public Serializable getId(Class entityClass, Object entity)
			throws NoSuchMethodException, IllegalAccessException,
			InvocationTargetException {
		Assert.notNull(entity);
		Assert.notNull(entityClass);
		return (Serializable) PropertyUtils.getProperty(entity,
				getIdName(entityClass));
	}

	/**
	 * 
	 * 取得对象的主键名,辅助函数.
	 * 
	 * @param clazz
	 *            需要查找对象的Class
	 * @return String idName 对象的主键名
	 */
	public String getIdName(Class clazz) {
		Assert.notNull(clazz);
		ClassMetadata meta = getSessionFactory().getClassMetadata(clazz);
		Assert.notNull(meta, "Class " + clazz
				+ " not define in hibernate session factory.");
		String idName = meta.getIdentifierPropertyName();
		Assert.hasText(idName, clazz.getSimpleName()
				+ " has no identifier property define.");
		return idName;
	}

	/**
	 * 去除hql的select 子句，未考虑union的情况,用于pagedQuery.
	 * 
	 * @see #pagedQuery(String,int,int,Object[])
	 */
	private static String removeSelect(String hql) {
		Assert.hasText(hql);
		int beginPos = hql.toLowerCase().indexOf("from");
		Assert.isTrue(beginPos != -1, " hql : " + hql
				+ " must has a keyword 'from'");
		return hql.substring(beginPos);
	}

	/**
	 * 去除hql的orderby 子句，用于pagedQuery.
	 * 
	 * @see #pagedQuery(String,int,int,Object[])
	 */
	private static String removeOrders(String hql) {
		Assert.hasText(hql);
		Pattern p = Pattern.compile("order\\s*by[\\w|\\W|\\s|\\S]*",
				Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(hql);
		StringBuffer sb = new StringBuffer();
		while (m.find()) {
			m.appendReplacement(sb, "");
		}
		m.appendTail(sb);
		return sb.toString();
	}
}
