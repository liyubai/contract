
package com.cauc.contract.business.dao.support;

import java.io.Serializable;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.usertype.UserType;

/**
 * 与数据库映射的ID 列表类
 * 把数据库中以逗号','分的字段映射为 List<String>
 * 
 * @author fuchaohui 
 */
public class IDList implements UserType {
	
	private static final String SPLITTER = ",";

	private static final int[] TYPES = new int[] { Types.VARCHAR };
	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#assemble(java.io.Serializable, java.lang.Object)
	 */
	public Object assemble(Serializable cached, Object owner)
			throws HibernateException {
		// TODO 自动生成方法存根
		return null;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#deepCopy(java.lang.Object)
	 */
	@SuppressWarnings("unchecked")
	public Object deepCopy(Object value) throws HibernateException {
		if (value == null) return new ArrayList(0);
		List sourceList=(List)value;
		List targetList=new ArrayList();
		targetList.addAll(sourceList);
		return targetList;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#disassemble(java.lang.Object)
	 */
	public Serializable disassemble(Object value) throws HibernateException {
		// TODO 自动生成方法存根
		return null;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#equals(java.lang.Object, java.lang.Object)
	 */
	public boolean equals(Object x, Object y) throws HibernateException {
		if (x == y)
			return true;
		if (x != null && y != null) {
			List xlist = (List) x;
			List ylist = (List) y;
			if (xlist.size() != ylist.size())
				return false;
			for (int i = 0; i < xlist.size(); i++) {
				String strx = (String) xlist.get(i);
				String stry = (String) ylist.get(i);
				if (!(strx.equals(stry)))
					return false;
			}
			return true;
		}
		return false;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#hashCode(java.lang.Object)
	 */
	public int hashCode(Object x) throws HibernateException {
		int result = 17;
		result=result*37+this.hashCode();
		return result;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#isMutable()
	 */
	public boolean isMutable() {
		return false;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#nullSafeGet(java.sql.ResultSet, java.lang.String[], java.lang.Object)
	 */
	public Object nullSafeGet(ResultSet rs, String[] names, Object owner)
			throws HibernateException, SQLException {
		String value = (String) Hibernate.STRING.nullSafeGet(rs, names[0]);
		if (value != null)
			return parse(value);
		else
			return null;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#nullSafeSet(java.sql.PreparedStatement, java.lang.Object, int)
	 */
	public void nullSafeSet(PreparedStatement st, Object value, int index)
			throws HibernateException, SQLException {
		List list=(List)value;
		if (list!= null&&list.size()>0) {
			String str = assemble((List) value);
			Hibernate.STRING.nullSafeSet(st, str, index);
		} else
			Hibernate.STRING.nullSafeSet(st, "", index);
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#replace(java.lang.Object, java.lang.Object, java.lang.Object)
	 */
	public Object replace(Object original, Object target, Object owner)
			throws HibernateException {
		// TODO 自动生成方法存根
		return null;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#returnedClass()
	 */
	public Class returnedClass() {
		// TODO 自动生成方法存根
		return List.class;
	}

	/* (non-Javadoc)
	 * @see org.hibernate.usertype.UserType#sqlTypes()
	 */
	public int[] sqlTypes() {
		return TYPES;
	}
	/**
	 * 以','分割的字符串解析为字符串数组
	 * 
	 * @param value
	 * @return
	 */	
	@SuppressWarnings("unchecked")
	private List parse(String value) {
		String[] strs = value.split(SPLITTER);
		List purviewList = new ArrayList();
		for (int i = 0; i < strs.length; i++) {
			purviewList.add(strs[i]);
		}
		return purviewList;
	}
	/**
	 * 将String 拼装为一个字符串，以","分割
	 * 
	 * @param list
	 * @return 字符串
	 */
	private String assemble(List list) {
		StringBuffer strBuffer = new StringBuffer();
		for (int i = 0; i < list.size() - 1; i++) {
			strBuffer.append(list.get(i)).append(SPLITTER);
		}
		strBuffer.append(list.get(list.size() - 1));
		return strBuffer.toString();
	}	
}
