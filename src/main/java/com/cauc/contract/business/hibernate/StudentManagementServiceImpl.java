package com.cauc.contract.business.hibernate;

import java.math.BigDecimal;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.cauc.contract.FinanceServiceException;
import com.cauc.contract.business.IStudentManagementService;
import com.cauc.contract.business.dao.GenericHibernateDAO;
import com.cauc.contract.cache.DictionaryCache;
import com.cauc.contract.pojos.ConStudent;
import com.cauc.contract.pojos.Contract;
import com.cauc.contract.pojos.Dictionary;
import com.cauc.contract.pojos.Payment;
import com.cauc.contract.pojos.PaymentNotice;
import com.cauc.contract.pojos.PaymentNoticeInfo;
import com.cauc.contract.pojos.Student;
import com.cauc.contract.ui.common.NumberToCN;
import com.cauc.contract.util.CommonUtils;

/** 此类所有注释暂时保留 */

@Service
public class StudentManagementServiceImpl extends GenericHibernateDAO implements IStudentManagementService {
	private static Log log = LogFactory.getLog(StudentManagementServiceImpl.class);

	public List<Student> readAllStudent(Student student) {
		String hql = "";
		String strWhere = "";
		hql = "from " + Student.class.getSimpleName() + " t ";
		if (!student.getStudentName().equals("")) {
			if (strWhere == "")
				strWhere = " where t.studentName like '" + student.getStudentName() + "%'";
			else {
				strWhere += " and t.studentName like '" + student.getStudentName() + "%'";
			}
		}
		if (!student.getNo().equals("")) {
			if (strWhere == "")
				strWhere = " where t.no='" + student.getNo() + "'";
			else {
				strWhere += " and t.no='" + student.getNo() + "'";
			}
		}
		if (!student.getGrade().equals(0)) {
			if (strWhere == "")
				strWhere = " where t.grade=" + student.getGrade();
			else {
				strWhere += " and t.grade=" + student.getGrade();
			}
		}
		if (!student.getState().equals(0)) {
			if (strWhere == "")
				strWhere = " where t.state=" + student.getState();
			else {
				strWhere += " and t.state=" + student.getState();
			}
		}
		if (!student.getContractNo().equals("")) {
			if (strWhere == "")
				strWhere = " where t.contractNo like '" + student.getContractNo() + "%'";
			else {
				strWhere += " and t.contractNo like '" + student.getContractNo() + "%'";
			}
		}
		if (!student.getCompany().equals("0")) {
			if (strWhere == "")
				strWhere = " where t.company='" + student.getCompany() + "'";
			else {
				strWhere += " and t.company='" + student.getCompany() + "'";
			}
		}
		hql = hql + strWhere;
		List<Student> list = find(hql);

		return list;
	}

	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public void saveStudent(Student student) throws FinanceServiceException {
		try {
			if (student.getStudentId() == 0) {
				try {
					super.save(student);
				} catch (HibernateException e) {
					log.error("录入学生失败", e);
					throw new FinanceServiceException("录入学生失败", e);
				}

			} else {
				// 更新
				Student currentStudent = get(Student.class, student.getStudentId());
				currentStudent.setState(student.getState());
				// if(student .getJoinTime()!=null)
				// currentStudent .setJoinTime(student.getJoinTime());
				if (student.getStopTime() != null)
					currentStudent.setStopTime(student.getStopTime());
				if (student.getStopReason() != null)
					currentStudent.setStopReason(student.getStopReason());
				if (student.getLastModifyTime() != null)
					currentStudent.setLastModifyTime(student.getLastModifyTime());
				update(currentStudent);
			}
		} catch (HibernateException e) {
			log.error("保持学生信息时失败", e);
			throw new FinanceServiceException("保持学生信息时失败。", e);
		}
	}

	@Override
	public String getInfoById(int studentId) {
		JSONObject jsonObj = null;
		JSONArray jsonArr = null;
		JSONObject dicJson = null;
		// 取得对象
		Student currentStudent = get(Student.class, studentId);

		if (currentStudent != null) {
			jsonObj = new JSONObject();
			dicJson = new JSONObject();
			jsonArr = new JSONArray();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			// String jointime="";
			String stoptime = "";
			// if(null!=currentStudent.getJoinTime())
			// {
			// jointime=sdf.format(currentStudent.getJoinTime());
			// }
			if (null != currentStudent.getStopTime()) {
				stoptime = sdf.format(currentStudent.getStopTime());
			}
			dicJson.put("studentId", currentStudent.getStudentId());
			dicJson.put("state", currentStudent.getState());
			// dicJson.put("joinTime", jointime);
			dicJson.put("stopTime", stoptime);
			dicJson.put("stopReason", currentStudent.getStopReason());
			jsonArr.add(dicJson);
		} else {
			return null;
		}

		jsonObj.put("dics", jsonArr);
		return jsonObj.toString();
	}

	/** 通过学生学号No获取合同号信息 */
	@Override
	public ConStudent ContractListByNo(Student student) {
		List<ConStudent> returnlist = new ArrayList<ConStudent>();
		String sql = "select a.ContractNo as Cont,a.CourseInfo as Cour,a.No as NO," + "b.C_Grade_Info as CGrad,b.C_CONTRACT_ID  as CCONT,b.C_Payment_Info as CPay,a.StudentName as stud from " + "(select CourseInfo,ContractNo,No,StudentName FROM Student where No ='" + student.getNo() + "') a " + "LEFT JOIN " + "(select C_Grade_Info,C_CONTRACT_ID,C_Payment_Info from Contract where C_Grade_Info like '%" + student.getNo() + "%') b " + "on b.C_CONTRACT_ID=a.ContractNo";
		List<Object[]> list = super.createSQLQuery(sql).list();
		for (Object[] ob : list) {
			ConStudent cons = new ConStudent();
			cons.setContractNo(ob[0].toString());
			cons.setCourseInfo(CommonUtils.ObjecttoString(ob[1]));
			cons.setNO(ob[2].toString());
			cons.setC_Grade_Info(CommonUtils.ObjecttoString(ob[3]));
			cons.setC_CONTRACT_ID(ob[4].toString());
			cons.setCPaymentInfo(CommonUtils.ObjecttoString(ob[5]));
			cons.setStudentName(ob[6].toString());
			returnlist.add(cons);
		}
		return returnlist.get(0);
	}

	// 保存课程信息
	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public void saveDetaile(Student student) throws FinanceServiceException {
		if (student.getStudentId() != 0) {
			Student stu = get(Student.class, student.getStudentId());
			stu.setCourseInfo(student.getCourseInfo());
			update(stu);
		}
	}

	@Override
	public List<Student> GetStudentByNo(String jsonNo) {
		List<Student> students = new ArrayList<Student>();
		JSONArray ListNo = JSONArray.fromObject(jsonNo);
		String hql = "from Student where No in (";
		for (int i = 0; i < ListNo.size(); i++) {
			JSONObject jo = (JSONObject) ListNo.get(i);
			hql += "'" + jo.get("studentNo") + "',";
		}
		hql = hql.substring(0, hql.length() - 1) + ")";
		students = find(hql);
		return students;
	}

	// 总记录
	@Override
	public int getTotalRowCount(String Student, Student extend) throws FinanceServiceException {
		try {
			String hql = "select  count(1) from " + Student + " where 1=1";
			if (!extend.getCompany().equals("0")) {
				hql += " and Company ='" + extend.getCompany() + "'";
			}
			if (StringUtils.isNotBlank(extend.getStudentName()) && !("".equals(extend.getStudentName()))) {
				hql += " and StudentName like '" + extend.getStudentName() + "%'";
			}
			if (extend.getGrade() != 0) {
				hql += " and Grade ='" + extend.getGrade() + "'";
			}
			if (extend.getState() != 0) {
				hql += " and State ='" + extend.getState() + "'";
			}
			if (StringUtils.isNotBlank(extend.getNo()) && !("".equals(extend.getNo()))) {
				hql += " and No like '" + extend.getNo() + "%'";
			}
			if (StringUtils.isNotBlank(extend.getContractNo()) && !("".equals(extend.getContractNo()))) {
				hql += " and ContractNo like '" + extend.getContractNo() + "%'";
			}
			List<Object[]> tempList = super.createSQLQuery(hql).list();
			Object object = tempList.get(0);
			return (Integer.parseInt(object.toString()));
		} catch (HibernateException e) {
			throw new FinanceServiceException("查询失败！");
		}
	}

	/**
	 * 初次加载分页
	 */
	@Override
	public List<Student> getListByPage(String tbName, int pageIndex, int pageSize, String primaryKey, Student extend, String strOrder) {
		String afieleds = " StudentId ,StudentName, IdCard , No, Grade, Company, ContractNo, State ";
		String strWhere = " where 1=1 ";
		if (!extend.getCompany().equals("0")) {
			strWhere += " and Company ='" + extend.getCompany() + "'";
		}
		if (StringUtils.isNotBlank(extend.getStudentName()) && !("".equals(extend.getStudentName()))) {
			strWhere += " and StudentName like '" + extend.getStudentName() + "%'";
		}
		if (extend.getGrade() != 0) {
			strWhere += " and Grade ='" + extend.getGrade() + "'";
		}
		if (extend.getState() != 0) {
			strWhere += " and State ='" + extend.getState() + "'";
		}
		if (StringUtils.isNotBlank(extend.getNo()) && !("".equals(extend.getNo()))) {
			strWhere += " and No like '" + extend.getNo() + "%'";
		}
		if (StringUtils.isNotBlank(extend.getContractNo()) && !("".equals(extend.getContractNo()))) {
			strWhere += " and ContractNo like '" + extend.getContractNo() + "%'";
		}
		String hql = "select top " + pageSize + " " + afieleds + " from " + tbName + strWhere + " " + strOrder;
		if (pageIndex > 1) {
			String addafieleds = " a.StudentId ,a.StudentName, a.IdCard , a.No, a.Grade, a.Company, a.ContractNo, a.State ";
			hql = "select " + addafieleds + " from " + tbName + " as a inner join (select " + afieleds + " from (select row_number() over(" + strOrder + ") as rownum," + afieleds + " from " + tbName + strWhere + ") as t where rownum between " + ((pageIndex - 1) * pageSize + 1) + " and " + pageIndex * pageSize + ") as b on a." + primaryKey + "=b." + primaryKey + " order by b.StudentId Desc";
		}
		List<Object[]> tempList = super.createSQLQuery(hql).list();
		List<Student> StuList = new ArrayList<Student>();
		for (Object[] ob : tempList) {
			Student student = new Student();
			student.setStudentId(Integer.parseInt(ob[0].toString()));
			student.setStudentName(ob[1].toString());
			student.setIdCard(ob[2].toString());
			student.setNo(ob[3].toString());
			student.setGrade(ob[4].hashCode());
			student.setCompany(ob[5].toString());
			String tempstr = ob[6] + "";
			if (!tempstr.equals("") && tempstr != null && !tempstr.equals("NULL")) {
				student.setContractNo(tempstr);
			} else {
				student.setContractNo("");
			}
			student.setState(Integer.parseInt(ob[7].toString()));
			StuList.add(student);
		}
		return StuList;
	}

	@Override
	@Transactional(readOnly = false, isolation = Isolation.READ_COMMITTED)
	public void saveExcelStudent(List<Student> studentList) throws FinanceServiceException {
		Session session = getHibernateTemplate().getSessionFactory().getCurrentSession();
		session = this.getHibernateTemplate().getSessionFactory().openSession();
		Query query = session.getNamedQuery("getInfo");
		CallableStatement cs = null;
		if (studentList != null) {
			for (int i = 0; i < studentList.size(); i++) {
				try {
					if (studentList.get(i).getStudentId() == 0) {
						try {
							cs = session.connection().prepareCall(String.valueOf(query));
							cs.setInt(1, studentList.get(i).getStudentId());
							cs.setString(2, studentList.get(i).getStudentName());
							cs.setString(3, studentList.get(i).getIdCard());
							cs.setString(4, studentList.get(i).getNo());
							cs.setInt(5, studentList.get(i).getGrade());
							cs.setString(6, studentList.get(i).getCompany());
							cs.setInt(7, 1);
							cs.execute();
						} catch (SQLException e) {
							log.error("录入学生失败", e);
							throw new FinanceServiceException("录入学生失败", e);
						}
					} else {
						// 更新
						Student currentStudent = get(Student.class, studentList.get(i).getStudentId());
						currentStudent.setState(studentList.get(i).getState());
						if (studentList.get(i).getJoinTime() != null)
							currentStudent.setJoinTime(studentList.get(i).getJoinTime());
						if (studentList.get(i).getStopTime() != null)
							currentStudent.setStopTime(studentList.get(i).getStopTime());
						if (studentList.get(i).getStopReason() != null)
							currentStudent.setStopReason(studentList.get(i).getStopReason());
						if (studentList.get(i).getLastModifyTime() != null)
							currentStudent.setLastModifyTime(studentList.get(i).getLastModifyTime());
						update(currentStudent);
					}
				} catch (HibernateException e) {
					log.error("保持学生信息时失败", e);
					throw new FinanceServiceException("保持学生信息时失败。", e);
				}
			}
		}
		session.close();
	}

	@Override
	public PaymentNoticeInfo GetNotice(Payment payment, Contract contract) throws Exception {
		PaymentNoticeInfo NoticeInfo = new PaymentNoticeInfo();
		List<List<PaymentNotice>> PaymentNotice = new ArrayList<List<PaymentNotice>>();
		String jsonStudent = "[" + payment.getPStudentInfo() + "]";
		String jsonPayInfo = "[" + contract.getCPaymentInfo() + "]";
		JSONArray ListStudent = JSONArray.fromObject(jsonStudent);// 付款信息中的学生列表
		JSONArray ListPayInfo = JSONArray.fromObject(jsonPayInfo);// 付款项目和金额信息
		if (payment.getPAymentNumber() != null && payment.getPAymentNumber() != "") {
			NoticeInfo.setNoticeNo(payment.getPAymentNumber());// 编号
		} else {
			NoticeInfo.setNoticeNo(GetPaymentNumber());// 编号
		}

		NoticeInfo.setIntoTraining(CountStudentState(jsonStudent, 609));// 进入训练
		NoticeInfo.setTrainingTheory(CountStudentState(jsonStudent, 608));// 理论培训
		NoticeInfo.setExtendStudies(CountStudentState(jsonStudent, 609));// 延长学业
		NoticeInfo.setGrounded(CountStudentState(jsonStudent, 610));// 停飞
		int CumPercent = GetPercent(payment.getPId());// 计算截止到上一阶段的百分比
		NoticeInfo.setCumPercent(CumPercent);
		int TotalCost = contract.getCDealPrice() * NoticeInfo.getGrounded() * (int) payment.getPPaymentPercent() / 100;
		NoticeInfo.setTotalCost(TotalCost);
		BigDecimal numberOfMoney = new BigDecimal(TotalCost);// 前期收取的费用
		NoticeInfo.setTotalCostCap(NumberToCN.number2CNMontrayUnit(numberOfMoney));// 将前期收取的费用转为人民币大写
		List<Integer> OccCost = new ArrayList<Integer>();// 发生费用
		List<Integer> PrePaid = new ArrayList<Integer>();// 前期已支付
		String strCale = TotalCost + "";
		for (int i = 0; i < ListStudent.size(); i++) {
			List<PaymentNotice> ListPn = new ArrayList<PaymentNotice>();// 一个学生的课程信息
			JSONObject jo = (JSONObject) ListStudent.get(i);
			Student stu = GetStudentInfoByNo(jo.get("studentNo").toString());
			if (stu != null && stu.getState() == 610 && stu.getCourseInfo() != null) { // 如果该学生已停飞，则计算目前已发生的费用
				JSONArray ListCourseInfo = JSONArray.fromObject("[" + stu.getCourseInfo() + "]");// 该学员已学课程列表
				int CumulativeCost = 0;
				for (int j = 0; j < ListCourseInfo.size(); j++) {
					JSONObject joCourse = (JSONObject) ListCourseInfo.get(j);// 单项课程信息
					PaymentNotice pn = new PaymentNotice();
					pn.setStuName(stu.getStudentName());
					Dictionary dic = getDict(Integer.parseInt(joCourse.get("id").toString()));// 从字典表里查找该课程的名字
					pn.setTopId(dic.getTopId());
					pn.setLessonName(dic.getDictionaryName());
					pn.setId(Integer.parseInt(joCourse.get("id").toString()));
					pn.setVal(Integer.parseInt(joCourse.get("val").toString()));
					if (pn.getTopId() == 516) {
						pn.setValue(Integer.parseInt(joCourse.get("val").toString()));// 如果TopId是516，直接把val的值赋给value
						pn.setVal(1);
					} else {
						for (Object Pi : ListPayInfo) {// 在付款项目和金额信息中查找该课程的单价
							JSONObject joPi = (JSONObject) Pi;
							if (joPi.get("name").toString().equals(joCourse.get("id").toString())) {
								pn.setValue(Integer.parseInt(joPi.get("value").toString()));// 把查找到的单价信息赋给value
								break;
							}
						}
					}
					CumulativeCost += pn.getVal() * pn.getValue();
					pn.setCumulativeCost(CumulativeCost);// 累计该学员发生的费用
					pn.setPrePaid(contract.getCDealPrice() * CumPercent / 100);
					ListPn.add(pn);// 将课程信息添加到单个学员
				}
				PaymentNotice.add(ListPn);// 添加单个学员
				OccCost.add(CumulativeCost);
				PrePaid.add(contract.getCDealPrice() * CumPercent / 100);
				strCale += "+（" + (CumulativeCost);
				strCale += "-" + contract.getCDealPrice() * CumPercent / 100 + "）";// 拼出计算公式
				CumulativeCost = 0;
			}
		}
		NoticeInfo.setNoticeList(PaymentNotice);
		int Balance = NoticeInfo.getTotalCost();
		for (Integer paid : PrePaid) { // 计算本期应付款
			Balance -= paid;
		}
		for (Integer cost : OccCost) { // 计算本期应付款
			Balance += cost;
		}
		NoticeInfo.setStrCale(strCale);
		NoticeInfo.setBalance(Balance);
		NoticeInfo.setOccCost(OccCost);
		BigDecimal numberOfBalance = new BigDecimal(Balance);
		NoticeInfo.setBalanceCap(NumberToCN.number2CNMontrayUnit(numberOfBalance));// 将结余转为人民币大写
		return NoticeInfo;
	}

	private Student GetStudentInfoByNo(String No) {
		List<Student> students = new ArrayList<Student>();
		String hql = "from Student where No = '" + No + "'";
		students = find(hql);
		if (students.size() > 0) {
			return students.get(0);
		} else {
			return null;
		}
	}

	private Dictionary getDict(int DictionaryId) {
		DictionaryCache dictionaryCache = DictionaryCache.getInstance();
		List<Dictionary> dictList = dictionaryCache.getAllDic();

		if (dictList != null && dictList.size() > 0) {
			for (Dictionary dic : dictList) {
				if (dic.getDictionaryId() == DictionaryId) {
					return dic;
				}
			}
		}
		return null;
	}

	private int CountStudentState(String jsonStu, int state) {
		List<Student> ListStu = GetStudentByNo(jsonStu);
		int sum = 0;
		for (Student stu : ListStu) {
			if (stu.getState() == state) {
				sum++;
			}
		}
		return sum;
	}

	/*
	 * 获取百分比
	 */
	private int GetPercent(int PID) {
		int percent = 0;
		int currentStage = 0;
		List<Payment> lPayment = new ArrayList<Payment>();
		int contractKey = 0;
		String hql = "from Payment where PId = " + PID;
		lPayment = find(hql);
		if (lPayment.size() > 0) {
			contractKey = lPayment.get(0).getPContractKey();
			currentStage = lPayment.get(0).getPCurrentStage();
			hql = "from Payment where PContractKey = " + contractKey;
			lPayment = find(hql);
			for (Payment payment : lPayment) {
				if (payment.getPCurrentStage() < currentStage) {
					percent += payment.getPPaymentPercent();
				}
			}
		}
		return percent;
	}

	private String GetPaymentNumber() {
		String PaymentNumber = "";
		String hql = "select max(P_AYMENT_NUMBER) from Payment";
		List<Object[]> tempList = super.createSQLQuery(hql).list();
		Object object = tempList.get(0);
		if (object != null) {
			String str = object.toString().replaceAll("[^0-9]", "");// 把数字滤出来
			str = str.substring(4); // 去掉前面的年份
			if (str != "") {
				int id = Integer.parseInt(str) + 1;
				PaymentNumber = String.format("%03d", id); // 补齐前面的0，一共是3位
			} else {
				PaymentNumber = "001";
			}
		} else {
			PaymentNumber = "001";
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		Date date = new Date();
		return "飞训" + sdf.format(date) + "-" + PaymentNumber;
	}
}
