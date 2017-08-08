<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单位付款通知</title>
<link href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/contract/themes/cupertino/printcss.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css" rel="stylesheet" type="text/css" />
<script src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.position.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.core.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.widget.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.button.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.tabs.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.dialog.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.menu.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/function.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>
</head>
<body>
	<div id="rightPartA" style="overflow-x: hidden; top: 10px;">
		<div class="pdfWrapper">
			<div class="pdfHeader">
				<div class="title">付款通知</div>
				<div class="number">编号：${NoticeInfo.noticeNo}</div>
			</div>
			<ul class="baseinfoSection">
				<li class="biItem biw1">合同名称：${contract.CName}</li>
				<li class="biItem biw">合同号：${payment.PContractId}</li>
				<li class="biItem biw">付款单位：${compyName}</li>
				<li class="biItem biw1">付款阶段：${payment.PCurrentStage}</li>
				<li class="biItem biw">年级：${payment.PContractGrade}</li>
				<li class="biItem biw">付款期限：<fmt:formatDate value="${payment.PReceiveDate}" pattern="yyyy年M月d日" />
				</li>
			</ul>
			<div class="oneRow">
				<span class="payDetailDes">付款明细：</span>
				<div class="payDetail">
					进入训练${payment.PGradeStudentCount - NoticeInfo.grounded}人，停飞${NoticeInfo.grounded}人，收取${payment.PGradeStudentCount - NoticeInfo.grounded}名学生的费用，${contract.CDealPrice}元/人*${NoticeInfo.grounded}人*${payment.PPaymentPercent}%=${NoticeInfo.totalCost}元(${NoticeInfo.totalCostCap})。
					<c:forEach items="${NoticeInfo.noticeList }" var="gstu" varStatus="noticeList">
						<c:forEach items="${gstu }" var="stu" varStatus="gstat">
							<c:if test="${gstat.index == 0 }">${stu.stuName }已完成</c:if>
							<c:choose>
								<c:when test="${stu.topId == 516 }">${stu.lessonName }${stu.value }元，</c:when>
								<c:otherwise> ${stu.lessonName }（${stu.val }）小时、${stu.value }元/小时，</c:otherwise>
							</c:choose>
						</c:forEach>
						相应的飞行训练费为
						<c:forEach items="${gstu }" var="stu" varStatus="gstat">
							<c:if test="${gstat.index > 0 }">+</c:if>
							<c:choose>
								<c:when test="${stu.topId == 516 }">${stu.value}元</c:when>
								<c:otherwise>${stu.val }小时 *${stu.value }元/小时</c:otherwise>
							</c:choose>
							<c:if test="${gstat.last}">，实际发生费用为${stu.cumulativeCost }元，前期已支付${stu.prePaid }元。</c:if>
						</c:forEach>
					</c:forEach>
				</div>
			</div>
			<div class="oneRow">
				本期付款：${NoticeInfo.strCale}
				=${NoticeInfo.balance}（${NoticeInfo.balanceCap}）
			</div>
			<ul class="baseinfoSection">
				<li class="biItem biw1"><span class="pr6">开&nbsp;户&nbsp;行</span>：中国工商银行天津市滨海国际机场支行</li>
				<li class="biItem biw">账户：中国民航大学</li>
				<li class="biItem biw">账号：0302015109100467065</li>
			</ul>
			<div class="oneRow">
				<span class="pr4">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注</span>：飞行培训费
			</div>
			<div class="oneRow">本通知书一式两份，双方各保留一份。</div>
			<div class="oneRow">
				<span class="timeflight">中国民航大学</span>
			</div>
			<div class="oneRow">
				<span class="timeflight"><fmt:formatDate value="${now}" type="both" dateStyle="long" pattern="yyyy年M月d日" /></span>
			</div>
			<div class="attachedListHeader">附表1 学生信息</div>
			<table class="attachedList">
				<tr>
					<td>序号</td>
					<td>姓名</td>
					<td>学号</td>
					<td>年级</td>
					<td>学生状态</td>
					<td>备注</td>
				</tr>
				<c:forEach items="${stuednts }" var="stu" varStatus="stat">
					<tr>
						<td>${stat.index + 1 }</td>
						<td>${stu.studentName }</td>
						<td>${stu.no }</td>
						<td>${stu.grade }</td>
						<td><c:choose>
								<c:when test="${stu.state == 607 }">未入校</c:when>
								<c:when test="${stu.state == 608 }">入校</c:when>
								<c:when test="${stu.state == 609 }">进入训练</c:when>
								<c:otherwise>停飞</c:otherwise>
							</c:choose></td>
						<td></td>
					</tr>
				</c:forEach>
			</table>
			<div class="pdfbtnbox">
				<input id="Button3" type="button" value="打 印" class="greenBtn" />
			</div>
		</div>
	</div>
</body>
</html>