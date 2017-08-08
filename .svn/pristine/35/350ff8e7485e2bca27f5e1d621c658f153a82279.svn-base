package com.cauc.contract.business.hibernate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cauc.contract.business.AccountService;
import com.cauc.contract.business.FinanceProvider;
import com.cauc.contract.business.IAvgStatisticsService;
import com.cauc.contract.business.IContractModifyService;
import com.cauc.contract.business.IDataDicManageService;
import com.cauc.contract.business.IContractQuerylistService;
import com.cauc.contract.business.IContractWaitDealService;
import com.cauc.contract.business.IDataDictionaryListService;
import com.cauc.contract.business.IPageService;
import com.cauc.contract.business.IStudentManagementService;
import com.cauc.contract.business.IPayListService;
import com.cauc.contract.business.IPayStatisticsService;
import com.cauc.contract.business.IPowerManagentService;
import com.cauc.contract.business.IQueryLoginUserService;
import com.cauc.contract.business.IRoleManagentService;
//import com.cauc.training.business.ISequenceManager;
import com.cauc.contract.business.ISystemUserService;
import com.cauc.contract.business.IUserManagentService;
import com.cauc.contract.business.ISumStatisticService;




/**
 * 服务提供者默认实现类
 * 
 * @author
 * 
 */

@Service("hibernateFinanceProviderImpl")
public class HibernateFinanceProviderImpl implements FinanceProvider {
//
//	@Autowired
//	@Qualifier("sequenceManagerImpl")
//	private ISequenceManager sequenceManager;
//	
	@Autowired
	@Qualifier("systemUserServiceImpl")
	private ISystemUserService systemUserService;
	@Autowired
	@Qualifier("accountServiceImpl")
	//结算部分
	private AccountService accountService;
	
	//数据字典管理 Service
	@Autowired
	@Qualifier("dataDicManageServiceImpl")
	private IDataDicManageService dataDicManageService;
	public IDataDictionaryListService getDataDictionaryListService() {
		return dataDictionaryListService;
	}

	public void setDataDictionaryListService(IDataDictionaryListService dataDictionaryListService) {
		this.dataDictionaryListService = dataDictionaryListService;
	}
	//增加合同部分Service baib
	@Autowired
	@Qualifier("contractModifyImpl")
	private IContractModifyService contractModifyService;
		//增加学生管理部分Service CY
	@Autowired
	@Qualifier("studentManagementServiceImpl")
	private IStudentManagementService studentManagementService;
	//查询付款列表 Service
	@Autowired
	@Qualifier("payListImpl")
	private IPayListService payListService;
	
	//yinjx 2016年7月21日10:11:36
	@Autowired
	@Qualifier("dataDictionaryListImpl")
	private IDataDictionaryListService dataDictionaryListService;
	//查询合同部分Service sunwq
	@Autowired
	@Qualifier("contractQuerylistServiceImpl")
	private IContractQuerylistService contractQuerylistService;
	
	
	//角色管理  wbr
	@Autowired
	@Qualifier("roleManagentServiceImpl")
	private IRoleManagentService roleManagentService;
	//角色管理
	@Autowired
	@Qualifier("powerManagentServiceImpl")
    private IPowerManagentService powerManagentService;
    //用户管理
	@Autowired
	@Qualifier("userManagentServiceImpl")
	private IUserManagentService contractUserManagentService;
	//用户登录
	
	@Autowired
	@Qualifier("queryLoginUserServiceImpl")
	private IQueryLoginUserService queryLoginUserService;
	
	//主页  guot -----------------------------
	@Autowired
	@Qualifier("contractWaitDealServiceImpl")
	private IContractWaitDealService contractWaitDealService;
	//汇总统计
	@Autowired
	@Qualifier("sumStatisticServiceImpl")
	private ISumStatisticService sumStatisticService;
	//平均统计
	@Autowired
 	@Qualifier("avgStatisticsServiceImpl")
	private IAvgStatisticsService avgStatisticsService;
	
	
	@Autowired
	@Qualifier("pageServiceImpl")
	private IPageService pageService;
	@Autowired
	@Qualifier("payStatisticsServiceImpl")
	private IPayStatisticsService payStatisticsService;
	// --------------baib 注释掉多余部分代码----star----------------
	// @Autowired
	// @Qualifier("dataDictionaryImpl")
	// private IDataDictionary dataDictionaryService;
	//
	// //大纲管理
	// @Autowired
	// @Qualifier("outLineServiceImpl")
	// private IOutLineService outLineService;
	//
	// //学员管理
	// @Autowired
	// @Qualifier("studentServiceImpl")
	// private IStudentService studentService;
	//
	//
	// @Autowired
	// @Qualifier("teacherManagentImpl")
	// private ITeacherManagentService teacherManagentService;
	//
	// //组织机构
	// @Autowired
	// @Qualifier("orgServiceImpl")
	// private IOrgService orgService;
	//
	// //功能模块
	// @Autowired
	// @Qualifier("functionServiceImpl")
	// private IFunctionService functionService;
	//
	//// ------GQY------------
	// //角色
	// @Autowired
	// @Qualifier("roleImpl")
	// private IRole roleService;
	//
	// //数据库备份
	// @Autowired
	// @Qualifier("backupDataBaseImpl")
	// private IBackupDataBase backupDataBaseImpl;
	//
	// //局方文件
	// @Autowired
	// @Qualifier("tFileManagerServiceImpl")
	// private ITFileManager tFileManagerService;
	//
	// //字典类型
	// @Autowired
	// @Qualifier("tDictionaryTypeServiceImpl")
	// private IDictionaryType tDictionaryTypeServiceImpl;
	//
	// //字典信息
	// @Autowired
	// @Qualifier("tDictionaryInfomationImpl")
	// private IDictionaryInfomation tDictionaryInfomationImpl;
	//
	// //角色-功能
	// @Autowired
	// @Qualifier("roleFunctionManagerServiceImpl")
	// private IRoleFunctionsService roleFunctionsService;
	//
	// //用户管理
	// @Autowired
	// @Qualifier("systemUserManagerServiceImpl")
	// private ISystemUserManagerService systemUserManagerServiceImpl;
	//
	// //用户-角色绑定管理
	// @Autowired
	// @Qualifier("userRightsManagerServiceImpl")
	// private IUserRightsService userRightsServiceImpl;
	//
	// //政策法规量化信息管理
	// @Autowired
	// @Qualifier("policyLawsInfomationManagerServiceImpl")
	// private IPolicyLawsService policyLawsInfomationManagerServiceImpl;
	//
	// //学籍状态与学生状态关系绑定
	// @Autowired
	// @Qualifier("studentAndStatusRelationServiceImpl")
	// private IStudentAndStatusRelationService
	// studentAndStatusRelationServiceImpl;
	//
	// //用户在线时长统计
	// @Autowired
	// @Qualifier("onlineCounterServiceImpl")
	// private IOnlineCounterService onlineCounterServiceImpl;
	//
	// //飞行训练管理
	// @Autowired
	// @Qualifier("flightTrainingRecordServiceImpl")
	// private IFlightTrainingRecordService flightTrainingRecordService;
	//
	// //待办实现管理
	// @Autowired
	// @Qualifier("toDoingServiceImpl")
	// private IToDoingService toDoingService;
	// --------------baib 注释掉多余部分代码----End----------------
	
//-------------------------------------------------------------------------	
	// --------------baib 注释掉多余部分代码----star----------------
	// // 其他人员所在部门
	// @Autowired
	// @Qualifier("anotherDeptImpl")
	// private IAnotherDeptService anotherDeptService;
	//
	// // 其他人员管理
	// @Autowired
	// @Qualifier("anotherPeopleImpl")
	// private IAnotherPeopleService anotherPeopleService;
	//
	// // 日志管理
	// @Autowired
	// @Qualifier("logServiceImpl")
	// private ILogService logService;
	//
	// // 航空器管理
	// @Autowired
	// @Qualifier("planeServiceImpl")
	// private IPlaneService planeService;
	//
	// public IPlaneService getPlaneService() {
	// return planeService;
	// }
	//
	// public IAnotherDeptService getAnotherDeptService() {
	// return anotherDeptService;
	// }
	//
	// public IAnotherPeopleService getAnotherPeopleService() {
	// return anotherPeopleService;
	// }
	//
	// public ILogService getLogService() {
	// return this.logService;
	// }
	// --------------baib 注释掉多余部分代码----End----------------
//---------------------
	
	
//	public ISequenceManager getSequenceManager() {
//		
//		return this.sequenceManager;
//	}
	@Override
	public IRoleManagentService getRoleManagentService()
	{
		return this.roleManagentService;
	}
	@Override
	public IPowerManagentService getPowerManagentService()
	{
		return this.powerManagentService;
	}
	@Override
	public IStudentManagementService getStudentManagementService() {
		return studentManagementService;
	}

	public void setStudentManagementService(IStudentManagementService studentManagementService) {
		this.studentManagementService = studentManagementService;
	}

	@Override
	public IPayListService getPayListService() {
		return payListService;
	}

	public void setPayListService(IPayListService payListService) {
		this.payListService = payListService;
	}

	public ISystemUserService getSystemUserService() {
		return systemUserService;
	}

	public void setSystemUserService(ISystemUserService systemUserService) {
		this.systemUserService = systemUserService;
	}

	@Override
	public IContractModifyService getContractModifyService() {
		return contractModifyService;
	}

	public void setContractModifyService(IContractModifyService contractModifyService) {
		this.contractModifyService = contractModifyService;
	}

	@Override
	public ISystemUserService getSysUserService() {

		return this.systemUserService;
	}

	public AccountService accountService() {
		// TODO Auto-generated method stub
		return this.accountService;
	}
	
	
	public AccountService getAccountService() {
		return accountService;
	}
	
	
	
	
	//------------------sunwq  合同管理  合同查询---------------
	@Override
	public IContractQuerylistService getContractQuerylistService() {
		return contractQuerylistService;
	}

	public void setContractQuerylistService(IContractQuerylistService contractQuerylistService) {
		this.contractQuerylistService = contractQuerylistService;
	}
	
	public IDataDicManageService getDataDicManageService() {
		return dataDicManageService;
	}

	public void setDataDicManageService(IDataDicManageService dataDicManageService) {
		this.dataDicManageService = dataDicManageService;
	}


	
	public void setAccountService(AccountService accountService) {
		this.accountService = accountService;
	}

	@Override
	public IUserManagentService getContractUserManagentService() {
		// TODO Auto-generated method stub
		return contractUserManagentService;
	}

	/**
	 * @param contractUserManagentService the contractUserManagentService to set
	 */
	public void setContractUserManagentService(IUserManagentService contractUserManagentService) {
		this.contractUserManagentService = contractUserManagentService;
	}

	@Override
	public IQueryLoginUserService getQueryLoginUserService() {
		// TODO Auto-generated method stub
		return queryLoginUserService;
	}

	/**
	 * @param roleManagentService the roleManagentService to set
	 */
	public void setRoleManagentService(IRoleManagentService roleManagentService) {
		this.roleManagentService = roleManagentService;
	}

	/**
	 * @param queryLoginUserService the queryLoginUserService to set
	 */
	public void setQueryLoginUserService(IQueryLoginUserService queryLoginUserService) {
		this.queryLoginUserService = queryLoginUserService;
	}
	//guot-
	@Override
	public IContractWaitDealService getContractWaitDealService() {
		return contractWaitDealService;
	}
	public void setContractWaitDealService(IContractWaitDealService contractWaitDealService) {
		this.contractWaitDealService = contractWaitDealService;
	}

	@Override
	public IPageService getPageService() {
		// TODO Auto-generated method stub
		return pageService;
	}

	@Override
	public ISumStatisticService getSumStatisticService() {
		return sumStatisticService;
	}
	public void setSumStatisticService(ISumStatisticService sumStatisticService) {
		this.sumStatisticService = sumStatisticService;
	}

	@Override
	public IPayStatisticsService getPayStatisticsService() {
		return payStatisticsService;
	}

	public void setPayStatisticsService(IPayStatisticsService payStatisticsService) {
		this.payStatisticsService = payStatisticsService;
	}

	@Override
	public IAvgStatisticsService getAvgStatisticsService() {
		return avgStatisticsService;
	}
	
	
	
	
	// --------------baib 注释掉多余部分代码----star----------------
	// public IDataDictionary getDataDictionaryService() {
	//
	// return this.dataDictionaryService;
	// }
	//
	// public IOutLineService getOutLineService() {
	//
	// return this.outLineService;
	// }
	//
	// public ITeacherManagentService getTeacherManagentService() {
	// return this.teacherManagentService;
	// }
	// /**
	// * 组织机构实现类
	// */
	// public IOrgService getOrgService() {
	// return this.orgService;
	// }
	//
	// /**
	// * 功能模块信息实现类
	// *
	// */
	// public IFunctionService getFunctionService() {
	// return this.functionService;
	// }
	// --------------baib 注释掉多余部分代码----End----------------
//-----------------------------GQY--------------------------
	// --------------baib 注释掉多余部分代码----star----------------
	// /**
	// * 角色维护实现类
	// *
	// */
	// public IRole getRoleService() {
	// return roleService;
	// }
	//
	// /**
	// * 数据库备份实现类
	// *
	// */
	// public IBackupDataBase getBackupDataBaseService(){
	// return backupDataBaseImpl;
	// }
	//
	// /**
	// * 局方文件实现类
	// *
	// */
	// public ITFileManager getTFileManagerService(){
	// return tFileManagerService;
	// }
	//
	// /**
	// * 字典类型实现类
	// *
	// */
	// public IDictionaryType getDictionaryTypeManagerService(){
	// return tDictionaryTypeServiceImpl;
	// }
	//
	// /**
	// * 字典信息实现类
	// *
	// */
	//
	// public IDictionaryInfomation getDictionaryInfomationManagerService() {
	//
	// return this.tDictionaryInfomationImpl;
	// }
	//
	// /**
	// * 角色-权限绑定实现类
	// *
	// */
	// public IRoleFunctionsService getRoleFunctionsManagerService() {
	// return this.roleFunctionsService;
	// }
	//
	// /**
	// * 用户管理实现类
	// *
	// */
	// public ISystemUserManagerService getSystemUserManagerService() {
	//
	// return this.systemUserManagerServiceImpl;
	// }
	//
	// /**
	// * 用户-角色绑定实现类
	// *
	// */
	//
	// public IUserRightsService getUserRightsManagerService() {
	//
	// return this.userRightsServiceImpl;
	// }
	//
	// /**
	// * 政策法规量化信息实现类
	// * @return
	// */
	// public IPolicyLawsService getPolicyLawsInfomationManagerService() {
	//
	// return this.policyLawsInfomationManagerServiceImpl;
	// }
	//
	// /**
	// * 学籍与学生关系绑定
	// * @return
	// */
	// public IStudentAndStatusRelationService
	// getStudentAndStatusRelationService() {
	//
	// return this.studentAndStatusRelationServiceImpl;
	// }
	//
	// /**
	// * 用户在线时长统计
	// *
	// */
	// public IOnlineCounterService getOnlineCounterService() {
	//
	// return this.onlineCounterServiceImpl;
	// }
	//
	// public IStudentService getStudentService() {
	//
	// return this.studentService;
	// }
	// public IFlightTrainingRecordService getFlightTrainingRecordService() {
	//
	// return this.flightTrainingRecordService;
	// }
	//
	// public IToDoingService getToDoingService() {
	// return this.toDoingService;
	// }


	// 合同系统用户管理
	//	@Autowired
	//	@Qualifier("userManagentServiceImpl")
	//	private IUserManagentService contractUserManagentService;
	//
	//	@Override
	//	public IUserManagentService getContractUserManagentService() {
	//		return this.contractUserManagentService;
	//	}
	// --------------baib 注释掉多余部分代码----End----------------
}
