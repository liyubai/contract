package com.cauc.contract.business;
/*
 * @(#)ISystemUserService.java
 * Description:	user service interface
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2014
 * Create by:	fuchaohui  2014-6-25
 */




import java.util.List;

import com.cauc.contract.FinanceServiceException;

import com.cauc.contract.pojos.TUser;
//import com.cauc.training.vo.VAbroadaviationschool;


/**
 * 管理系统用户服务接口
 * 
 * @author fuchaohui
 *
 */
public interface ISystemUserService {
	/**
	 * 查询key-用户名
	 */
	public static final String  QUERY_KEY_NAME="name";
	
	public static final String QUERY_KEY_TYPE="itype";
	
	public static final String QUERY_KEY_BANCI="banci";
	
	public static final String QUERY_KEY_STA="sta";
	
	public static final String QUERY_KEY_XJ="yesorno";
	
	public static final String QUERY_KEY_STATUS="status";
	
	public static final String QUERY_KEY_JIA_TYPE="itype";
	
	/**
	 * 学员
	 */
	public static final int USERTYPE_STUDENT = 1;
	
	/**
	 * 教员
	 */
	public static final int USERTYPE_TEACHER = 2;
	
	/**
	 * 管理员
	 */
	public static final int USERTYPE_ADMIN = 3;	
	
	/**
	 * 其他人员
	 */
	public static final int USERTYPE_OTHER = 4;
	
	/**
	 * 查询key-组织机构ID
	 */
	public static final String  QUERY_KEY_ORGID="orgId";	
	/**
	 * 查询key-开始时间
	 */
	public static final String  QUERY_KEY_START_DATE="startDate";
	/**
	 * 查询key-结束时间
	 */
	public static final String  QUERY_KEY_END_DATE="endDate";		
	
	/**
	 * 根据登录ID获取用户对象
	 * @param loginId
	 * @return TUser
	 * @throws ErsServiceException 抛出此异常表示在读取人事局人员的时候发生错误
	 */
	public TUser readSysUserByLoginID(String loginId)throws FinanceServiceException;	
	
	/**
	 * 根据ldap账号登录系统
	 * @param ladpId
	 * @return
	 * @throws FinanceServiceException
	 */
	public TUser readSysUserByLdapID(String ladpId)throws FinanceServiceException;	
	
	/**
	 * 根据usbk获取用户对象
	 * @param uniqueId
	 * @return
	 * @throws FinanceServiceException
	 */
	public TUser readSysUserByUsbk(String uniqueId)throws FinanceServiceException;	

	/**
	 * 修改密码
	 * @param loginId 用户ID
	 * @param oldPsw 旧密码（明文）
	 * @param newPsw 新密码（明文）
	 * @throws ErsServiceException 抛出此异常表示在修改密码的时候发生错误
	 */
	public void changePassword(String loginId,String oldPsw,String newPsw)throws FinanceServiceException;
	
//	/**
//	 * 获取用户功能栏目权限
//	 * @param userid
//	 * @return
//	 * @throws FinanceServiceException
//	 */
//	public String readLoginUserFunctions(String userid) throws FinanceServiceException;
//	
//	/**
//	 * 根据用户id读取该用户是否有写的权限
//	 * @param userid
//	 * @return
//	 * @throws FinanceServiceException
//	 */
//	public Integer readIsWriteByUserId(String userid) throws FinanceServiceException;
//	
//	/**
//	 * 课程列表
//	 * @param name
//	 * @return
//	 * @throws FinanceServiceException
//	 */
//	public List<TLesson> readLessonList(String name,String type)throws FinanceServiceException;
//	
//	/**
//	 * 保存课程信息
//	 * @param lesson
//	 * @throws FinanceServiceException
//	 */
//	public void saveLesson(TLesson lesson)throws FinanceServiceException;
//	public void updateLessonBaseInfo(TLesson lesson)throws FinanceServiceException;
//	public void deleteLessonBaseInfo(String id)throws FinanceServiceException;
//	
//	/**
//	 * 航校列表
//	 * @param name
//	 * @return
//	 * @throws FinanceServiceException
//	 */
//	public List<TAbroadaviationschool> readSchoolList(String name,String order)throws FinanceServiceException;
//	
//	/**
//	 * 保存航校
//	 * @param school
//	 * @throws FinanceServiceException
//	 */
//	public void saveSchool(TAbroadaviationschool school) throws FinanceServiceException;
//	
//	/**
//	 * 删除航校
//	 * @param id
//	 * @throws FinanceServiceException
//	 */
//	public void deleteSchool(String id) throws FinanceServiceException;
	
//	/**
//	 * 编辑航校
//	 * @param school
//	 * @throws FinanceServiceException
//	 */
//	public void updateSchool(TAbroadaviationschool school) throws FinanceServiceException;
//	
//	/**
//	 * 获取航校信息
//	 * @param id
//	 * @return
//	 * @throws FinanceServiceException
//	 */
//	public VAbroadaviationschool readVAbroadaviationschool(String id) throws FinanceServiceException;
	
//	/**
//	 * 排序，根据设置的数值
//	 * @param id
//	 * @param order
//	 * @param tableName
//	 * @param opt 区分是否为设置
//	 * @throws FinanceServiceException
//	 */
//	public void handOrderByNum(String id,String order,String tableName,String opt)throws FinanceServiceException;
//	
	/**
	 * 获取用户姓名
	 * @param userType
	 * @return
	 * @throws FinanceServiceException
	 */
	public String readRealName(int userType,String userName)throws FinanceServiceException;
}
