package com.cauc.contract.pojos;
// Generated 2016-8-2 9:00:47 by Hibernate Tools 3.6.0.Final

/**
 * TContractUser generated by hbm2java
 */
public class TContractUser implements java.io.Serializable {

	private int VId;
	private String VNo;
	private String VName;
	private String VRole;
	private String VDelFlg;

	public TContractUser() {
	}

	public TContractUser(int VId, String VDelFlg) {
		this.VId = VId;
		this.VDelFlg = VDelFlg;
	}

	public TContractUser(int VId, String VNo, String VName, String VRole, String VDelFlg) {
		this.VId = VId;
		this.VNo = VNo;
		this.VName = VName;
		this.VRole = VRole;
		this.VDelFlg = VDelFlg;
	}

	public int getVId() {
		return this.VId;
	}

	public void setVId(int VId) {
		this.VId = VId;
	}

	public String getVNo() {
		return this.VNo;
	}

	public void setVNo(String VNo) {
		this.VNo = VNo;
	}

	public String getVName() {
		return this.VName;
	}

	public void setVName(String VName) {
		this.VName = VName;
	}

	public String getVRole() {
		return this.VRole;
	}

	public void setVRole(String VRole) {
		this.VRole = VRole;
	}

	public String getVDelFlg() {
		return this.VDelFlg;
	}

	public void setVDelFlg(String VDelFlg) {
		this.VDelFlg = VDelFlg;
	}

}