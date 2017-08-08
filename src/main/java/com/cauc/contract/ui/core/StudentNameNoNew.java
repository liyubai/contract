package com.cauc.contract.ui.core;

public class StudentNameNoNew implements java.io.Serializable{
	
	/**
	 * guot
	 */
	private static final long serialVersionUID = 1L;
	private String studentNo=null;
	private String studentName=null;
	public String getStudentNo() {
		return studentNo;
	}
	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	@Override
	public String toString() {
		String studentNameNo = "{\"studentNo\":\""+studentNo+"\",\"studentName\":\""+studentName+"\"}";
		return studentNameNo;
		
	}
	
}
