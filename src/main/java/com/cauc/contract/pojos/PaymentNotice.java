package com.cauc.contract.pojos;

public class PaymentNotice {
	private String StuName;//学员姓名
	private String LessonName;//课程名称
	private int Id;
	private int Val;//数量
	private int Value;//单价
	private int TopId;
	private int PrePaid;// 前期已支付
	private int CumulativeCost;//当前发生费用

	public String getStuName() {
		return StuName;
	}

	public void setStuName(String stuName) {
		StuName = stuName;
	}

	public String getLessonName() {
		return LessonName;
	}

	public void setLessonName(String lessonName) {
		LessonName = lessonName;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public int getVal() {
		return Val;
	}

	public void setVal(int val) {
		Val = val;
	}

	public int getValue() {
		return Value;
	}

	public void setValue(int value) {
		Value = value;
	}

	public int getTopId() {
		return TopId;
	}

	public void setTopId(int topId) {
		TopId = topId;
	}

	public int getPrePaid() {
		return PrePaid;
	}

	public void setPrePaid(int prePaid) {
		PrePaid = prePaid;
	}

	public int getCumulativeCost() {
		return CumulativeCost;
	}

	public void setCumulativeCost(int cumulativeCost) {
		CumulativeCost = cumulativeCost;
	}
}
