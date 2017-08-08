/*
 * @(#)ISystemUserService.java
 * Description:	user service interface
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2012
 * Create by:	fuchaohui
 */

package com.cauc.contract.business.hibernate;


import java.util.Date;
import java.util.List;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.ISystemUserService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.config.FinanceConfig;
//import com.cauc.training.pojos.TAbroadaviationschool;
//import com.cauc.training.pojos.TLesson;
//import com.cauc.training.pojos.TRoleFunction;
import com.cauc.contract.pojos.TUser;
//import com.cauc.training.pojos.TUserRights;
import com.cauc.contract.util.Utilities;
//import com.cauc.training.vo.VAbroadaviationschool;

/**
 * 管理系统用户服务实现类
 * 
 * @author fuchaohui
 * 
 */
@Service
public class SystemUserServiceImpl extends GenericHibernateDAO implements
		ISystemUserService {
	private static Log log = LogFactory.getLog(SystemUserServiceImpl.class);

	@SuppressWarnings("unchecked")
	public TUser readSysUserByLoginID(String loginId)
			throws FinanceServiceException {
		Assert.isTrue(StringUtils.isNotBlank(loginId), "用户登录ID不能为空");
		try {
			String hql = " from TUser where VUsername=?";
			List<TUser> userList = (List<TUser>) super.find(hql, loginId);
			if (userList != null && userList.size() == 1)
				return userList.get(0);
			else
				return null;
		} catch (HibernateException e) {
			log.error("读取用户信息失败", e);
			throw new FinanceServiceException("读取用户信息失败", e);
		}
	}
	@SuppressWarnings("unchecked")
	public TUser readSysUserByLdapID(String ldapId)
			throws FinanceServiceException {

		try {
			String hql = " from TUser where VLdap=? ";
			List<TUser> userList = (List<TUser>) super.find(hql, ldapId);			
			if (userList != null && userList.size()>0)
				return userList.get(0);
			else
				return null;
		} catch (HibernateException e) {
			log.error("读取用户信息失败", e);
			throw new FinanceServiceException("读取用户信息失败", e);
		}
	}
	
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public void changePassword(String loginId, String oldPsw, String newPsw)
			throws FinanceServiceException {
		//Assert.isTrue(StringUtils.isNotBlank(loginId), "用户登录ID不能为空");
		//Assert.isTrue(StringUtils.isNotBlank(oldPsw), "原密码不能为空");
		TUser user = super.findUniqueBy(TUser.class, "VUsername", loginId);
		
		if (FinanceConfig.getBooleanProperty("passwds.encryption.enabled")) {
			String encodeOldPsw = Utilities.encodePassword(oldPsw, FinanceConfig
					.getProperty("passwds.encryption.algorithm"));
			if (!encodeOldPsw.equals(user.getVPassword()))
				throw new FinanceServiceException("原密码不正确");
			user.setVPassword(Utilities.encodePassword(newPsw, FinanceConfig
					.getProperty("passwds.encryption.algorithm")));
		} else {
			if (!oldPsw.equals(user.getVPassword()))
				throw new FinanceServiceException("原密码不正确");
			user.setVPassword(newPsw);
		}
		try {
			super.update(user);
		} catch (HibernateException e) {
			log.error("修改密码失败:" + e.getMessage());
			throw new FinanceServiceException("修改密码失败", e);
		}

	}
//
//	@SuppressWarnings("unchecked")
//	public String readLoginUserFunctions(String userid)
//			throws FinanceServiceException {
//		String hql =" from TRoleFunction where TRole.VId in" +
//				" (select TRole.VId from TUserRights where TUserByVUserid.VId=?)" +
//				" order by TFunction.IOrder asc,TFunction.DCreateDate asc";
//		List<TRoleFunction> list = super.find(hql, userid);
//		String b = "";
//		String a = "";
//		int k =-1;
//		for(int i=0;i<list.size();i++){
//			k=-1;
//			if(StringUtils.isNotBlank(list.get(i).getTFunction().getVUrl())){
//				
//				if(list.get(i).getTFunction().getVUrl().indexOf("dhmain")==-1 ){
//					
//					if(b.indexOf(list.get(i).getTFunction().getIRootid().toString())==-1){	
//						k=0;
//					}
//					b+= k + ";" + list.get(i).getTFunction().getVUrl()+";"+
//					list.get(i).getTFunction().getIRootid()+";" + list.get(i).getIIsWrite() + ",";
//				}else{
//
//					a+= k + ";" + list.get(i).getTFunction().getVUrl()+";"+
//					list.get(i).getTFunction().getIRootid()+";" + list.get(i).getIIsWrite() + ",";
//				}
//					
//				
//			}
//		}
//		
//		return b+a;
//	}
//
//	@SuppressWarnings("unchecked")
//	public List<TLesson> readLessonList(String name,String type)
//			throws FinanceServiceException {
//
//		if(name==null)name = "";
//		String order = "order by IType asc,IOrder asc,VId asc";
//		String hql =" from TLesson where VLessonName like ?";
//		List<TLesson> list= super.find(hql+order, "%" + name + "%");
//		if(StringUtils.isNotBlank(type)){
//			hql+=" and IType=?";
//			list= super.find(hql + order, "%" + name + "%",Integer.parseInt(type));
//		}
//		
//		
//		return list;
//	}
//
//	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
//	public void saveLesson(TLesson lesson) throws FinanceServiceException {
//		String hql =" from TLesson where VLessonName=?";
//		if(super.find(hql, lesson.getVLessonName()).size()>0){
//			throw new FinanceServiceException("保存失败，课程名称重复。");
//		}
//		lesson.setDCreatedate(new Date());
//		super.save(lesson);
//	}
//
//	@SuppressWarnings("unchecked")
//	public List<TAbroadaviationschool> readSchoolList(String name,String order)
//			throws FinanceServiceException {
//		String orderStr = "VId";
//		if(StringUtils.isNotBlank(order)){
//			orderStr = order;
//		}
//		if(name==null)name = "";
//		String hql =" from TAbroadaviationschool where VSchoolname like ? order by " + orderStr;
//		List<TAbroadaviationschool> list = super.find(hql, "%" + name + "%");
//		return list;
//	}
//
//	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
//	public void saveSchool(TAbroadaviationschool school)
//			throws FinanceServiceException {
//		String hql =" from TAbroadaviationschool where VSchoolname=?";
//		if(super.find(hql, school.getVSchoolname()).size()>0){
//			throw new FinanceServiceException("保存失败，航校名称重复。");
//		}
//		school.setDCreatedate(new Date());
//		super.save(school);
//	}
//
//	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
//	public void deleteSchool(String id) throws FinanceServiceException {
//		super.removeById(TAbroadaviationschool.class, id);
//	}
//
//	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
//	public void updateSchool(TAbroadaviationschool school)
//			throws FinanceServiceException {
//		TAbroadaviationschool old = super.get(TAbroadaviationschool.class, school.getVId());
//		old.setVSchoolname(school.getVSchoolname());
//		old.setVIntroduction(school.getVIntroduction());
//		old.setVCountry(school.getVCountry());
//		old.setVAddress(school.getVAddress());
//		old.setVCode(school.getVCode());
//		old.setVWeb(school.getVWeb());
//		old.setDEffectdate(school.getDEffectdate());
//		super.update(old);
//	}
//	
//	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
//	public void deleteLessonBaseInfo(String id) throws FinanceServiceException {
//		super.removeById(TLesson.class, id);
//	}
//	
//	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
//	public void updateLessonBaseInfo(TLesson lesson)
//			throws FinanceServiceException {
//
//		TLesson old = super.get(TLesson.class, lesson.getVId());
//		old.setIType(lesson.getIType());
//		old.setVLessonName(lesson.getVLessonName());
//		super.update(old);
//		
//	}
//
//	public VAbroadaviationschool readVAbroadaviationschool(String id)
//			throws FinanceServiceException {
//		VAbroadaviationschool va = new VAbroadaviationschool();
//		TAbroadaviationschool old = super.get(TAbroadaviationschool.class, id);
//		va.setDEffectdate(Utilities.format(old.getDEffectdate()));
//		va.setVAddress(old.getVAddress());
//		va.setVCode(old.getVCode());
//		va.setVCountry(old.getVCountry());
//		va.setVWeb(old.getVWeb());
//		va.setVSchoolname(old.getVSchoolname());
//		return va;
//	}
//	
//	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
//	public void handOrderByNum(String id,String order,String tableName,String opt)
//			throws FinanceServiceException {
//
//		if(tableName.equals("lesson")){
//			TLesson lesson = super.get(TLesson.class, id);
//			if(opt.equals("1")){
//				if(lesson.getIOrder()==null){
//					lesson.setIOrder(100+Integer.parseInt(order));
//				}else{
//					lesson.setIOrder(lesson.getIOrder()+Integer.parseInt(order));
//				}
//			}else{
//				lesson.setIOrder(Integer.parseInt(order));
//			}
//			
//			super.update(lesson);
//		}
//		
//	}
//
	@SuppressWarnings("unchecked")
	public String readRealName(int userType,String userName) throws FinanceServiceException {
		
		String userHql = "";
		
		String tableName = "";
		
		if(userType==USERTYPE_STUDENT){
			tableName = "StudentBaseInfo";
		}else if(userType==USERTYPE_TEACHER){
			tableName = "TeacherBaseInfo";
		}else{
			tableName = "TOtheruser";
		}
		
		userHql = "select VName from "+tableName+" where VCode=?";
		List<Object> list = super.find(userHql, userName);
		if(list.size()==0){
			return "";
		}
		return list.get(0).toString();
	}
//
//	@SuppressWarnings("unchecked")
//	public Integer readIsWriteByUserId(String userid)
//			throws FinanceServiceException {
//		try{
//			String hql =" from TUserRights where TUserByVUserid.VId=?";
//			List<TUserRights> list = super.find(hql, userid);
//			if(list.size()==0){
//				return 1;
//			}
//			return list.get(0).getIIsWrite();
//		}catch(HibernateException e){
//			throw new FinanceServiceException("获取用户信息失败，数据库错误。");
//		}
//	}

	@SuppressWarnings("unchecked")
	public TUser readSysUserByUsbk(String uniqueId)
			throws FinanceServiceException {
		String hql =" from TUser where VSign=?";
		List<TUser> list = super.find(hql, uniqueId);
		if(list.size()>0){
			return list.get(0);
		}
		return null;
	}


}
