package com.cauc.contract.vo;

public class WarningInfo implements java.io.Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -174052469851844829L;
	private String VId;//主键
	private String VName;//名称
	private String VCode;//编号
	private String userType;//区分是学员还是教员。
	private Integer warningType; 
	private String DResultdate;
	private String DIssueTime;
	private String DUsedTime;
	private Integer iday;
	
	private String checkType;
	private String planeCode;
	private String checkTeacher;
	
	private Integer high;
	private Integer middle;
	private Integer low;
	public Integer getHigh() {
		return high;
	}
	public void setHigh(Integer high) {
		this.high = high;
	}
	public Integer getMiddle() {
		return middle;
	}
	public void setMiddle(Integer middle) {
		this.middle = middle;
	}
	public Integer getLow() {
		return low;
	}
	public void setLow(Integer low) {
		this.low = low;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public Integer getWarningType() {
		return warningType;
	}
	public void setWarningType(Integer warningType) {
		this.warningType = warningType;
	}
	public String getCheckType() {
		return checkType;
	}
	public void setCheckType(String checkType) {
		this.checkType = checkType;
	}
	public String getPlaneCode() {
		return planeCode;
	}
	public void setPlaneCode(String planeCode) {
		this.planeCode = planeCode;
	}
	public String getCheckTeacher() {
		return checkTeacher;
	}
	public void setCheckTeacher(String checkTeacher) {
		this.checkTeacher = checkTeacher;
	}
	
	
	
	public String getVId() {
		return VId;
	}
	public void setVId(String vId) {
		VId = vId;
	}
	public String getVName() {
		return VName;
	}
	public void setVName(String vName) {
		VName = vName;
	}
	public String getVCode() {
		return VCode;
	}
	public void setVCode(String vCode) {
		VCode = vCode;
	}
	public String getDResultdate() {
		return DResultdate;
	}
	public void setDResultdate(String dResultdate) {
		DResultdate = dResultdate;
	}
	public String getDIssueTime() {
		return DIssueTime;
	}
	public void setDIssueTime(String dIssueTime) {
		DIssueTime = dIssueTime;
	}
	public String getDUsedTime() {
		return DUsedTime;
	}
	public void setDUsedTime(String dUsedTime) {
		DUsedTime = dUsedTime;
	}
	public Integer getIday() {
		return iday;
	}
	public void setIday(Integer iday) {
		this.iday = iday;
	}
	
}
