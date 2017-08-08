package com.cauc.contract.ui.core;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IContractQuerylistService;
import com.cauc.contract.pojos.Contract;
import com.cauc.contract.pojos.ContractCPnameInfo;
import com.cauc.contract.pojos.ContractExtends;
import com.cauc.contract.pojos.Payment;
import com.cauc.contract.ui.common.BaseActionSupport;
import com.cauc.contract.ui.common.Paging;
import com.cauc.contract.util.JsonToBean;

/**
 * 
 * @author swq
 *
 */
public class contractQueryListAction extends BaseActionSupport {

	/**
	 * 查询合同 sunwq
	 */
	private static final long serialVersionUID = 1L;
	//合同编号
	private String contractId;
	//签订时间（年份）
	private String signTime;
	//合同类型
	private Integer type;
	//签约单位
	private Integer compy;
	//学生类型
	private Integer stuType;
	//学生年级
	private String gradeInfo;
	
	private Payment payment;
	
	private Integer CID;
	
	private String viewContractId;
	
	private List<Contract> cont;
	
	private List<Payment> paymentList;
	
	private Contract con;
	
	private List<PaymentInfo> paymentInfoJson; 
	
	private List<ContractCPnameInfo> pNameInfoJson;
	
	private ContractCPnameInfo pNameInfolist;
	
	private PaymentInfo paymentInfolist;
	
	private List<ContractExtends> contractExtends;
	//回显值
	private String compyName;
	private String stuTypeName;
	private String typeName;
	private String year;
	private String stuYear;
	private int cstatus;
	
	
	//分页部分
	// 分页
	private Paging paging;

	// 每页显示多少条
	private int pagesize;
	// 当前页码
	private int cur_page;
	// 分页字符串
	private String pageStr;
		
		
	/**
	 * 首次进入合同管理页面，查询全部合同
	 * @return
	 * @throws FinanceServiceException 
	 */
	@SuppressWarnings("unchecked")
	public String allContractQueryList() throws FinanceServiceException{
		//分页
		int totalRowCount = 0; // 查询到的总条目
		IContractQuerylistService contractQuerylistService = getFactory().getFinanceProviderInstance().getContractQuerylistService();
		totalRowCount = contractQuerylistService.getTotalRowCount("Contract");
		this.paging = new Paging();
		// 当前页码
		if (this.cur_page == 0) {
			this.cur_page = 1;
		}
		// 每页显示数目
		this.pagesize=5;
		// 设置当前页码
		this.paging.setCurPage(this.cur_page);
		// 把得到总共显示的数据记录设置在分页总纪录中
		this.paging.setTotalRowCount(totalRowCount);
		// 设置每页显示的数据记录 （根据页面显示条数设置 ）
		this.paging.setPageRowCount(this.pagesize);
	
		List<Contract> contractList1 = new ArrayList<Contract>();
		// 获取返回list，表名，当前页，每页显示条数，主键，where语句，order 语句
		List<Object[]> tempList = contractQuerylistService.getListByPage("Contract", this.cur_page, pagesize, "C_ID"," 1=1 ","order by C_ID desc");
		
		Contract contract1 = null;
		for (Object[] o : tempList) {
			contract1 = new Contract();
			contract1.setCId(Integer.parseInt(o[0].toString()));
			contract1.setCContractId(o[1].toString());
			contract1.setCName(o[2].toString());
			contract1.setCType(Integer.parseInt(o[3].toString()));
			contract1.setCStuType(Integer.parseInt(o[4].toString()));
			contract1.setCSignTime(o[5].toString());
			if(o[6]==null){
				o[6] = "";	
			}
			contract1.setCGradeInfo(o[6].toString());
			contract1.setCCompy(Integer.parseInt(o[7].toString()));
			contract1.setCStatus(Integer.parseInt(o[8].toString()));
			contractList1.add(contract1);
		}
		setCont(contractList1);
		if(CollectionUtils.isNotEmpty(cont)){
			for(Contract c : cont){
				if(c.getCGradeInfo()!=null){
					String stuGrade = "";
					List<GradeInfor> list = JsonToBean.makeJavaBean(c.getCGradeInfo(), GradeInfor.class);
					if(CollectionUtils.isNotEmpty(list)){
						for(GradeInfor gradeInforList : list){
							if(gradeInforList.getGradeYear()!=null){
								String grade = gradeInforList.getGradeYear();
								stuGrade = stuGrade+grade+",";			
							}
						}
						c.setCGradeInfo( stuGrade.substring(0,stuGrade.length()-1))	;
					}	
				}else continue;
			}
			//判断年份是否为空
			for(Contract con :cont){
				if(con.getCSignTime()!=null&&!con.getCSignTime().equals("")){
					String signTime = con.getCSignTime();
					signTime = signTime.substring(0,4);
					con.setCSignTime(signTime);
				}
				else continue;
			}	
		}
		List<ContractExtends> contractExtends1 = new ArrayList<ContractExtends>();
		ContractExtends cExtends = null;
		for(Contract con : cont){
			cExtends = new ContractExtends();
			cExtends.setCId(con.getCId());
			cExtends.setCName(con.getCName());
			cExtends.setCContractId(con.getCContractId());
			cExtends.setCSignTime(con.getCSignTime());
			cExtends.setCStatus(con.getCStatus());
			cExtends.setCGradeInfo(con.getCGradeInfo());
			String compyStr = contractQuerylistService.getKindsName(con.getCCompy());
			String typeStr = contractQuerylistService.getKindsName(con.getCType());
			String stuStr = contractQuerylistService.getKindsName(con.getCStuType());
			cExtends.setCCompyName(compyStr);
			cExtends.setCTypeName(typeStr);
			cExtends.setCStuTypeName(stuStr);
			contractExtends1.add(cExtends);		
		}
		setContractExtends(contractExtends1);
		
		
		compyName = "签约单位";
		stuTypeName = "学生类型";
		typeName = "合同类型";
		year = "年份";
		stuYear = "学生年级";
		pageStr = this.paging.getToolBar("cAllContractQueryList.do");
		return SUCCESS;
	}
	
	/**
	 * 条件查询
	 * @return
	 * @throws FinanceServiceException 
	 * @throws UnsupportedEncodingException 
	 */
	@SuppressWarnings("unchecked")
	public String contractQueryList() throws FinanceServiceException, UnsupportedEncodingException{
		//分页
		int totalRowCount = 0; // 查询到的总条目
		IContractQuerylistService contractQuerylistService = getFactory().getFinanceProviderInstance().getContractQuerylistService();
		Contract contract = new Contract();
		contract.setCContractId(contractId);
		contract.setCSignTime(signTime);
		contract.setCType(type);
		contract.setCCompy(compy);
		contract.setCStuType(stuType);
		contract.setCGradeInfo(gradeInfo);
		contract.setCStatus(cstatus);
		
		totalRowCount = contractQuerylistService.getPartTotalRowCount("Contract",contract);
		this.paging = new Paging();
		// 当前页码
		if (this.cur_page == 0) {
			this.cur_page = 1;
		}
		// 每页显示数目
		this.pagesize=5;
		// 设置当前页码
		this.paging.setCurPage(this.cur_page);
		// 把得到总共显示的数据记录设置在分页总纪录中
		this.paging.setTotalRowCount(totalRowCount);
		// 设置每页显示的数据记录 （根据页面显示条数设置 ）
		this.paging.setPageRowCount(this.pagesize);
		
		List<Contract> contractList1 = new ArrayList<Contract>();
		// 获取返回list，表名，当前页，每页显示条数，主键，where语句，order 语句
		List<Object[]> tempList = contractQuerylistService.getPartListByPage("Contract", this.cur_page, pagesize, "C_ID",contract,"order by C_ID");
		
		Contract contract1 = null;
		for (Object[] o : tempList) {
			contract1 = new Contract();
			contract1.setCId(Integer.parseInt(o[0].toString()));
			contract1.setCContractId(o[1].toString());
			contract1.setCName(o[2].toString());
			contract1.setCType(Integer.parseInt(o[3].toString()));
			contract1.setCStuType(Integer.parseInt(o[4].toString()));
			contract1.setCSignTime(o[5].toString());
			if(o[6]==null){
				o[6] = "";	
			}
			contract1.setCGradeInfo(o[6].toString());
			contract1.setCCompy(Integer.parseInt(o[7].toString()));
			contract1.setCStatus(Integer.parseInt(o[8].toString()));
			contractList1.add(contract1);
		}
		setCont(contractList1);
		if(CollectionUtils.isNotEmpty(cont)){
			for(Contract c : cont){
				if(c.getCGradeInfo()!=null){
					String stuGrade = "";
					List<GradeInfor> list = JsonToBean.makeJavaBean(c.getCGradeInfo(), GradeInfor.class);
					if(CollectionUtils.isNotEmpty(list)){
						for(GradeInfor gradeInforList : list){
							if(gradeInforList.getGradeYear()!=null){
								String grade = gradeInforList.getGradeYear();
								stuGrade = stuGrade+grade+",";			
							}
						}
						c.setCGradeInfo( stuGrade.substring(0,stuGrade.length()-1))	;
					}	
				}else continue;
			}
			//判断年份是否为空
			for(Contract con :cont){
				if(con.getCSignTime()!=null&&!con.getCSignTime().equals("")){
					String signTime = con.getCSignTime();
					signTime = signTime.substring(0,4);
					con.setCSignTime(signTime);
				}
				else continue;
			}
		}
		
		List<ContractExtends> contractExtends1 = new ArrayList<ContractExtends>();
		ContractExtends cExtends = null;
		for(Contract con : cont){
			cExtends = new ContractExtends();
			cExtends.setCId(con.getCId());
			cExtends.setCName(con.getCName());
			cExtends.setCContractId(con.getCContractId());
			cExtends.setCSignTime(con.getCSignTime());
			cExtends.setCStatus(con.getCStatus());
			cExtends.setCGradeInfo(con.getCGradeInfo());
			String compyStr = contractQuerylistService.getKindsName(con.getCCompy());
			String typeStr = contractQuerylistService.getKindsName(con.getCType());
			String stuStr = contractQuerylistService.getKindsName(con.getCStuType());
			cExtends.setCCompyName(compyStr);
			cExtends.setCTypeName(typeStr);
			cExtends.setCStuTypeName(stuStr);
			contractExtends1.add(cExtends);		
		}
		setContractExtends(contractExtends1);
		
		//回显值
		compyName = contractQuerylistService.getKindsName(compy);
		if(compyName == null||compy == 2){
			compyName = "签约单位";
		}
		stuTypeName = contractQuerylistService.getKindsName(stuType);
		if(stuTypeName == null||stuType ==3){
			stuTypeName = "学生类型";
		}
		typeName = contractQuerylistService.getKindsName(type);
		if(typeName == null||type==322){
			typeName = "合同类型";
		}
		if(!signTime.equals("")){
			year = signTime;	
		}else
			year = "年份";
		if(!gradeInfo.equals("")){
			stuYear = gradeInfo;
		}else
			stuYear = "学生年级";
		pageStr = this.paging.getToolBar("cContractQueryList.do?contractId="+contractId+"&signTime="+signTime+"&type="+type+"&compy="+compy+"&stuType="+stuType+"&gradeInfo="+gradeInfo);
		return SUCCESS;
	}
	
	//查看合同
	@SuppressWarnings("unchecked")
	public String viewContract(){
		IContractQuerylistService contractQuerylistService = getFactory().getFinanceProviderInstance().getContractQuerylistService();
		Contract contract = new Contract();
		contract.setCId(CID);
		Payment pm = new Payment();
		//pm.setPContractId(viewContractId);
		pm.setPContractKey(CID);
		//查询合同表
		cont = contractQuerylistService.viewContract(contract);
		con = cont.get(0);
		//paymentInfoJson = JsonToBean.makeJavaBean(con.getCPaymentInfo(), PaymentInfo.class);//CPnameInfo
		//paymentInfolist = paymentInfoJson.get(0);
		//查询付款表
		paymentList = contractQuerylistService.viewPayment(pm);
		if(con!=null)
		{
			return SUCCESS;	
		}
		else 
		    return ERROR;	
	}
	
   

    //--------------------------getter and setter------------------------
	public String getContractId() {
		return contractId;
	}
	public void setContractId(String contractId) {
		this.contractId = contractId;
	}
	public String getSignTime() {
		return signTime;
	}
	public void setSignTime(String signTime) {
		this.signTime = signTime;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getCompy() {
		return compy;
	}
	public void setCompy(Integer compy) {
		this.compy = compy;
	}
	public Integer getStuType() {
		return stuType;
	}
	public void setStuType(Integer stuType) {
		this.stuType = stuType;
	}
	public String getGradeInfo() {
		return gradeInfo;
	}
	public void setGradeInfo(String gradeInfo) {
		this.gradeInfo = gradeInfo;
	}
	public Payment getPayment() {
		return payment;
	}
	public void setPayment(Payment payment) {
		this.payment = payment;
	}
	public Integer getCID() {
		return CID;
	}
	public void setCID(Integer cID) {
		CID = cID;
	}
	public String getViewContractId() {
		return viewContractId;
	}
	public void setViewContractId(String viewContractId) {
		this.viewContractId = viewContractId;
	}
	public List<Contract> getCont() {
		return cont;
	}
	public void setCont(List<Contract> cont) {
		this.cont = cont;
	}
	public Contract getCon() {
		return con;
	}
	public void setCon(Contract con) {
		this.con = con;
	}
	public void setCon(ContractExtends con) {
		this.con = con;
	}
	public List<Payment> getPaymentList() {
		return paymentList;
	}
	public void setPaymentList(List<Payment> paymentList) {
		this.paymentList = paymentList;
	}
	public List<PaymentInfo> getPaymentInfoJson() {
		return paymentInfoJson;
	}
	public void setPaymentInfoJson(List<PaymentInfo> paymentInfoJson) {
		this.paymentInfoJson = paymentInfoJson;
	}
	public PaymentInfo getPaymentInfolist() {
		return paymentInfolist;
	}
	public void setPaymentInfolist(PaymentInfo paymentInfolist) {
		this.paymentInfolist = paymentInfolist;
	}
	public List<ContractExtends> getContractExtends() {
		return contractExtends;
	}
	public void setContractExtends(List<ContractExtends> contractExtends) {
		this.contractExtends = contractExtends;
	}
	public String getCompyName() {
		return compyName;
	}
	public void setCompyName(String compyName) {
		this.compyName = compyName;
	}
	public String getStuTypeName() {
		return stuTypeName;
	}
	public void setStuTypeName(String stuTypeName) {
		this.stuTypeName = stuTypeName;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getStuYear() {
		return stuYear;
	}
	public void setStuYear(String stuYear) {
		this.stuYear = stuYear;
	}

	public Paging getPaging() {
		return paging;
	}

	public void setPaging(Paging paging) {
		this.paging = paging;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public int getCur_page() {
		return cur_page;
	}

	public void setCur_page(int cur_page) {
		this.cur_page = cur_page;
	}

	public String getPageStr() {
		return pageStr;
	}

	public void setPageStr(String pageStr) {
		this.pageStr = pageStr;
	}

	public List<ContractCPnameInfo> getpNameInfoJson() {
		return pNameInfoJson;
	}

	public void setpNameInfoJson(List<ContractCPnameInfo> pNameInfoJson) {
		this.pNameInfoJson = pNameInfoJson;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public ContractCPnameInfo getpNameInfolist() {
		return pNameInfolist;
	}

	public void setpNameInfolist(ContractCPnameInfo pNameInfolist) {
		this.pNameInfolist = pNameInfolist;
	}

	public int getCstatus() {
		return cstatus;
	}

	public void setCstatus(int cstatus) {
		this.cstatus = cstatus;
	}
	
 
}
