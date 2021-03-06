﻿<%@page contentType="text/html; charset=UTF-8"%><%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>经费初始化</title>
<link href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
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
<script src="<%=request.getContextPath()%>/contract/scripts/dropdownlistopen.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/function.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/datepicker4.8/WdatePicker.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/pages/contract/js/cTrainingProgram.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>


</head>
<body>
	<jsp:include page="/pages/common/topPart.jsp" />
	<jsp:include page="/pages/common/leftPart.jsp" />

	<div id="rightPartA" style="overflow-x: hidden;">
		<div>
			<div class="Panel">
				<div class="panelHead">
					<span>经费初始化</span>
					<input type="hidden" id="contractId" name="contractId" value="${selConEneity.CContractId}"/>
				</div>
				<div class="panelContent">

					<div class="treeView" id="treeView0" style="float: left; width: 300px;"></div>
					<div class="payCon" id="payCon">

						<div class="paybatch pb1">
							<%--<span class="batchfont">所在年级</span>
							<div class="dropDownList ml10" id="Div2">
								<button class="tableselect1">学生年级</button>
								<ul id="classSelect">
								    <li><a href="#N" val="1" class="inline">学生年级</a></li>
									<li><a href="#N" val="2" class="inline"><span
											class="ui-icon ui-icon-bullet"></span>2006</a><a href="#N"
										val="12" class="inline">2016</a></li>
									<li><a href="#N" val="3" class="inline">2007</a><a
										href="#N" val="13" class="inline">2017</a></li>
									<li><a href="#N" val="4" class="inline">2008</a><a
										href="#N" val="14" class="inline">2018</a></li>
									<li><a href="#N" val="5" class="inline">2009</a><a
										href="#N" val="15" class="inline">2019</a></li>
									<li><a href="#N" val="6" class="inline">2010</a><a
										href="#N" val="16" class="inline">2020</a></li>
									<li><a href="#N" val="7" class="inline">2011</a><a
										href="#N" val="17" class="inline">2021</a></li>
									<li><a href="#N" val="8" class="inline">2012</a><a
										href="#N" val="18" class="inline">2022</a></li>
									<li><a href="#N" val="9" class="inline">2013</a><a
										href="#N" val="19" class="inline">2023</a></li>
									<li><a href="#N" val="10" class="inline">2014</a><a
										href="#N" val="20" class="inline">2024</a></li>
									<li><a href="#N" val="11" class="inline">2015</a><a
										href="#N" val="21" class="inline">2025</a></li>
								</ul>
								<input type="hidden" name="合同类型" value="1" />

							</div>
							<button id="addStudentInfoBtn1" class="greenBtn" style="margin-left: 10px;">+</button>
							<span class="ml20">学员人数</span> <input id="Text3" type="text" class="tableinput3 ml10" />
							<button id="bindStuBtn" class="greenBtn" style="margin-left: 10px;">绑定学号</button>
							<span class="ml20">入校时间</span> <input id="Text4" type="text" class="tableinput2 ml10 date" onmouseup="WdatePicker()" /> 
						     --%>
						</div>

						<div class="paybatch">
							<span class="batchfont">成交价</span> <input id="strDealPrice" value="${selConEneity.CDealPrice}" type="text" class="tableinput3 ml10" /> <span>&nbsp;元/人</span>
						</div>
						<div class="paybatch">
							<span class="batchfont">训练周期</span> <input id="strTrainCycle" type="text" class="tableinput3 ml10 left" value="${selConEneity.CTrainCycle}" /><span>&nbsp;个月</span>
						</div>
					</div>

					<div class="payWrap tCenter">
						<input id="Button2" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary mt10" value="保存" />
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="bindStuWrap dialogForm1" title="绑定学号">
		<!-- <div class=""> -->
		<div>
			<input id="Checkbox1" type="checkbox" class="checkAll" /> <label>全选</label>
		</div>
		<ul class="stuInfo">
			<%-- <li class="stuItem"><input id="Checkbox2" type="checkbox"
					class="stuCheck" /> <label>01</label> <span>哈哈</span></li>
				<li class="stuItem"><input id="Checkbox3" type="checkbox"
					class="stuCheck" /> <label>0001</label> <span>哈哈哈哈</span></li>
				<li class="stuItem"><input id="Checkbox4" type="checkbox"
					class="stuCheck" /> <label>0001</label> <span>哈哈哈哈</span></li>			
			    --%>
		</ul>
		<!-- </div> -->
	</div>
	<div id="dia" title="初始化经费">
		<p class="validateTips"></p>
		<div>您确定要初始化原合同的所有经费信息吗?</div>
	</div>
	<input id="hCInitFlg" type="hidden" value="${selConEneity.CInitFlg }" />
	<form action="<%=request.getContextPath()%>/contract/paymentContract.do" method="post" id="paymentContract">
		<!-- 合同主键 -->
		<input type="hidden" name="CID" id="CID" value="${selConEneity.CId}">
		<!-- 所在年级人数等 json-->
		<input type="hidden" name="gradeInfo" id="gradeInfo" value='${selConEneity.CGradeInfo}'>
		<!-- 付款项目，及金额 json-->
		<input type="hidden" name="paymentInfo" id="paymentInfo" value='${selConEneity.CPaymentInfo}'>
		<!-- 成交价格 -->
		<input type="hidden" name="dealPrice" id="dealPrice" value="${selConEneity.CDealPrice}">
		<!-- 训练周期 -->
		<input type="hidden" name="trainCycle" id="trainCycle" value="${selConEneity.CTrainCycle}">
		<!-- 节点描述 -->
		<input type="hidden" name="payMentData" id="payMentData" value='${selConEneity.CPnameInfo}'>
		<!-- 学生 -->
		<input type="hidden" name="everystudent" id="everystudent" />
	</form>
</body>
</html>