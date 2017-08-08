package com.cauc.contract.business;

import java.util.List;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.pojos.ConStudent;
import com.cauc.contract.pojos.Contract;
import com.cauc.contract.pojos.Payment;
import com.cauc.contract.pojos.PaymentNoticeInfo;
import com.cauc.contract.pojos.Student;



public interface IStudentManagementService {
	/**
	 * 查询所有用户信息
	 * 
	 * @return
	 */
	List<Student> readAllStudent(Student student);

	/**
	 * 保持用户信息
	 * 
	 * @param user
	 */
	void saveStudent(Student student) throws FinanceServiceException;

	String getInfoById(int studentId);
	/**
	 * 保存excel用户信息
	 * 
	 * @param user
	 */
	void saveExcelStudent(List<Student> studentList) throws FinanceServiceException;
	/**通过学生学号No获取合同号信息*/
	public ConStudent ContractListByNo(Student student) ;
	
	public void saveDetaile(Student student) throws FinanceServiceException;;
	
	List<Student> GetStudentByNo(String jsonNo);
	public PaymentNoticeInfo GetNotice(Payment payment, Contract contract) throws Exception;
	//分页
	List<Student> getListByPage(String string, int cur_page, int pagesize, String string2, Student student,
			String string3);
	//总记录
	int getTotalRowCount(String Student, Student extend) throws FinanceServiceException;
}