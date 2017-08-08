package com.cauc.contract.pojos;

import java.util.Date;

public class PaymentExtends {

	
	private int PId;
	private String PName;//付款节点（节点描述）
	private int PFundBudgetType;
	private int PProcessState;
	private float PBuildFeeStandardPrice;
	private float PTrainFeeStandardPrice;
	private float PPaymentPercent;
	private String PContractId;
	private int PContractKey;
	private int PContractGrade;//年级
	private int PGradeStudentCount;
	private float PReceiveMoney;//接收金额
	private Date PReceiveDate;//接收日期
	private float PTotalPrice;
	private Date PAddTime;
	private String PAddUser;
	private Date PLastModifyTime;
	private String PLastModifyUser;
	private int PCurrentStage;
	private int PGeneralPhase;
	private int PStatus;
	private int PNoticeStatus;
	private float PMoney;
	
	private int CId;
	private String CName;
	private String CContractId;//合同编号
	private Integer CType;
	private Integer CStuType;
	private Integer CStatus;//
	private Integer CNature;
	private Integer CCompy;//客户单位	联系人电话
	private String CSignTime;
	private String CPrivateName;
	private String CGradeInfo;
	private String CPaymentInfo;
	private Integer CDealPrice;
	private String CTrainCycle;
	private Integer CDelFlg;
	private Integer CInitFlg;
	private Date CAddTime;
	private String CAddUser;
	private Date CLastModifyTime;
	private String CLastModifyUser;
	
	
	
	private String p_id;
	private String c_id;
	private String p_name; 
	private String c_compy;
	private String c_contract_id;
	private String p_receive_money;
	private String p_payment_percent;//百分比
	private String p_money;//到款金额
	private String p_remark;//备注
	private String p_arrears;//欠款金额
	private String p_receivedate;//接收日期
	private String p_contractgrade;//所在年级
	private String p_status;//训练状态
	private String p_truedate;//实际到款日期
	private String p_picture;//图片
	
	private String p_pictureId;//图片id
	
	private String noticeUrl;
	
	
	
	
	
	public String getNoticeUrl() {
		return noticeUrl;
	}
	public void setNoticeUrl(String noticeUrl) {
		this.noticeUrl = noticeUrl;
	}
	public int getPStatus() {
		return PStatus;
	}
	public void setPStatus(int pStatus) {
		PStatus = pStatus;
	}
	public String getP_pictureId() {
		return p_pictureId;
	}
	public void setP_pictureId(String p_pictureId) {
		this.p_pictureId = p_pictureId;
	}
	public String getP_picture() {
		return p_picture;
	}
	public void setP_picture(String p_picture) {
		this.p_picture = p_picture;
	}
	public String getP_truedate() {
		return p_truedate;
	}
	public void setP_truedate(String p_truedate) {
		this.p_truedate = p_truedate;
	}
	public String getP_status() {
		return p_status;
	}
	public void setP_status(String p_status) {
		this.p_status = p_status;
	}
	public String getP_contractgrade() {
		return p_contractgrade;
	}
	public void setP_contractgrade(String p_contractgrade) {
		this.p_contractgrade = p_contractgrade;
	}
	public String getP_receivedate() {
		return p_receivedate;
	}
	public void setP_receivedate(String p_receivedate) {
		this.p_receivedate = p_receivedate;
	}
	public String getP_remark() {
		return p_remark;
	}
	public void setP_remark(String p_remark) {
		this.p_remark = p_remark;
	}
	public String getP_arrears() {
		return p_arrears;
	}
	public void setP_arrears(String p_arrears) {
		this.p_arrears = p_arrears;
	}
	public String getP_money() {
		return p_money;
	}
	public void setP_money(String p_money) {
		this.p_money = p_money;
	}
	public String getP_payment_percent() {
		return p_payment_percent;
	}
	public void setP_payment_percent(String p_payment_percent) {
		this.p_payment_percent = p_payment_percent;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getC_compy() {
		return c_compy;
	}
	public void setC_compy(String c_compy) {
		this.c_compy = c_compy;
	}
	public String getC_contract_id() {
		return c_contract_id;
	}
	public void setC_contract_id(String c_contract_id) {
		this.c_contract_id = c_contract_id;
	}
	public String getP_receive_money() {
		return p_receive_money;
	}
	public void setP_receive_money(String p_receive_money) {
		this.p_receive_money = p_receive_money;
	}
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public int getPId() {
		return PId;
	}
	public void setPId(int pId) {
		PId = pId;
	}
	public String getPName() {
		return PName;
	}
	public void setPName(String pName) {
		PName = pName;
	}
	public int getPFundBudgetType() {
		return PFundBudgetType;
	}
	public void setPFundBudgetType(int pFundBudgetType) {
		PFundBudgetType = pFundBudgetType;
	}
	public int getPProcessState() {
		return PProcessState;
	}
	public void setPProcessState(int pProcessState) {
		PProcessState = pProcessState;
	}
	public float getPBuildFeeStandardPrice() {
		return PBuildFeeStandardPrice;
	}
	public void setPBuildFeeStandardPrice(float pBuildFeeStandardPrice) {
		PBuildFeeStandardPrice = pBuildFeeStandardPrice;
	}
	public float getPTrainFeeStandardPrice() {
		return PTrainFeeStandardPrice;
	}
	public void setPTrainFeeStandardPrice(float pTrainFeeStandardPrice) {
		PTrainFeeStandardPrice = pTrainFeeStandardPrice;
	}
	public float getPPaymentPercent() {
		return PPaymentPercent;
	}
	public void setPPaymentPercent(float pPaymentPercent) {
		PPaymentPercent = pPaymentPercent;
	}
	public String getPContractId() {
		return PContractId;
	}
	public void setPContractId(String pContractId) {
		PContractId = pContractId;
	}
	public int getPContractKey() {
		return PContractKey;
	}
	public void setPContractKey(int pContractKey) {
		PContractKey = pContractKey;
	}
	public int getPContractGrade() {
		return PContractGrade;
	}
	public void setPContractGrade(int pContractGrade) {
		PContractGrade = pContractGrade;
	}
	public int getPGradeStudentCount() {
		return PGradeStudentCount;
	}
	public void setPGradeStudentCount(int pGradeStudentCount) {
		PGradeStudentCount = pGradeStudentCount;
	}
	public float getPReceiveMoney() {
		return PReceiveMoney;
	}
	public void setPReceiveMoney(float pReceiveMoney) {
		PReceiveMoney = pReceiveMoney;
	}
	public Date getPReceiveDate() {
		return PReceiveDate;
	}
	public void setPReceiveDate(Date pReceiveDate) {
		PReceiveDate = pReceiveDate;
	}
	public float getPTotalPrice() {
		return PTotalPrice;
	}
	public void setPTotalPrice(float pTotalPrice) {
		PTotalPrice = pTotalPrice;
	}
	public Date getPAddTime() {
		return PAddTime;
	}
	public void setPAddTime(Date pAddTime) {
		PAddTime = pAddTime;
	}
	public String getPAddUser() {
		return PAddUser;
	}
	public void setPAddUser(String pAddUser) {
		PAddUser = pAddUser;
	}
	public Date getPLastModifyTime() {
		return PLastModifyTime;
	}
	public void setPLastModifyTime(Date pLastModifyTime) {
		PLastModifyTime = pLastModifyTime;
	}
	public String getPLastModifyUser() {
		return PLastModifyUser;
	}
	public void setPLastModifyUser(String pLastModifyUser) {
		PLastModifyUser = pLastModifyUser;
	}
	public int getCId() {
		return CId;
	}
	public void setCId(int cId) {
		CId = cId;
	}
	public String getCName() {
		return CName;
	}
	public void setCName(String cName) {
		CName = cName;
	}
	public String getCContractId() {
		return CContractId;
	}
	public void setCContractId(String cContractId) {
		CContractId = cContractId;
	}
	public Integer getCType() {
		return CType;
	}
	public void setCType(Integer cType) {
		CType = cType;
	}
	public Integer getCStuType() {
		return CStuType;
	}
	public void setCStuType(Integer cStuType) {
		CStuType = cStuType;
	}
	public Integer getCStatus() {
		return CStatus;
	}
	public void setCStatus(Integer cStatus) {
		CStatus = cStatus;
	}
	public Integer getCNature() {
		return CNature;
	}
	public void setCNature(Integer cNature) {
		CNature = cNature;
	}
	public Integer getCCompy() {
		return CCompy;
	}
	public void setCCompy(Integer cCompy) {
		CCompy = cCompy;
	}
	public String getCSignTime() {
		return CSignTime;
	}
	public void setCSignTime(String cSignTime) {
		CSignTime = cSignTime;
	}
	public String getCPrivateName() {
		return CPrivateName;
	}
	public void setCPrivateName(String cPrivateName) {
		CPrivateName = cPrivateName;
	}
	public String getCGradeInfo() {
		return CGradeInfo;
	}
	public void setCGradeInfo(String cGradeInfo) {
		CGradeInfo = cGradeInfo;
	}
	public String getCPaymentInfo() {
		return CPaymentInfo;
	}
	public void setCPaymentInfo(String cPaymentInfo) {
		CPaymentInfo = cPaymentInfo;
	}
	public Integer getCDealPrice() {
		return CDealPrice;
	}
	public void setCDealPrice(Integer cDealPrice) {
		CDealPrice = cDealPrice;
	}
	public String getCTrainCycle() {
		return CTrainCycle;
	}
	public void setCTrainCycle(String cTrainCycle) {
		CTrainCycle = cTrainCycle;
	}
	public Integer getCDelFlg() {
		return CDelFlg;
	}
	public void setCDelFlg(Integer cDelFlg) {
		CDelFlg = cDelFlg;
	}
	public Integer getCInitFlg() {
		return CInitFlg;
	}
	public void setCInitFlg(Integer cInitFlg) {
		CInitFlg = cInitFlg;
	}
	public Date getCAddTime() {
		return CAddTime;
	}
	public void setCAddTime(Date cAddTime) {
		CAddTime = cAddTime;
	}
	public String getCAddUser() {
		return CAddUser;
	}
	public void setCAddUser(String cAddUser) {
		CAddUser = cAddUser;
	}
	public Date getCLastModifyTime() {
		return CLastModifyTime;
	}
	public void setCLastModifyTime(Date cLastModifyTime) {
		CLastModifyTime = cLastModifyTime;
	}
	public String getCLastModifyUser() {
		return CLastModifyUser;
	}
	public void setCLastModifyUser(String cLastModifyUser) {
		CLastModifyUser = cLastModifyUser;
	}
	public int getPCurrentStage() {
		return PCurrentStage;
	}
	public void setPCurrentStage(int pCurrentStage) {
		PCurrentStage = pCurrentStage;
	}
	public int getPGeneralPhase() {
		return PGeneralPhase;
	}
	public void setPGeneralPhase(int pGeneralPhase) {
		PGeneralPhase = pGeneralPhase;
	}
	public int getPNoticeStatus() {
		return PNoticeStatus;
	}
	public void setPNoticeStatus(int pNoticeStatus) {
		PNoticeStatus = pNoticeStatus;
	}
	public float getPMoney() {
		return PMoney;
	}
	public void setPMoney(float pMoney) {
		PMoney = pMoney;
	}
	
	
}
