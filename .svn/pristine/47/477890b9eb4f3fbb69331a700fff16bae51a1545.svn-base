<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改合同</title>
<link
	href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/contract/themes/cupertino/date.css"
	rel="stylesheet" type="text/css" />
<script
	src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/jquery-ui.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.position.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.core.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.widget.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.button.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.tabs.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.dialog.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.menu.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/function.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/datepicker4.8/WdatePicker.js"
	type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/pages/contract/js/cUpdateContract.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/pages/payment/js/ajaxfileupload.js" type="text/javascript"></script>
 <script>
        $(document).ready(function() {
        	$('.fpWrap').hover(function() {
                $(this).find('.removeClose').show();
            }, function() {
                $(this).find('.removeClose').hide();
            });

            $('.fpWrap .removeClose').click(function() {
                $(this).parent().remove();
            });
           
        });
    </script>

<!-- 此js务必放在所有页面自带的js后面加载 -->
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
					<span>修改合同</span>
				</div>
				<div class="panelContent">
					<table class="modifyTable">
						<tr>
							<td class="col20_ textR">合同名称</td>
							<td class="col15_"><input id="strContractName" type="text"
								class="tableinput" value="${selConEneity.CName }" /></td>
							<td class="col20_ textR">合同编号</td>
							<td><input id="strContractID"  readonly="readonly" type="text" value="${selConEneity.CContractId }" class="tableinput" /></td>
						</tr>
						<tr>
							<td class="col20_ textR">合同类型</td>
							<td class="col15_">
								<div class="dropDownList" id="Div1">
									<button class="tableselect">合同类型</button>
									<ul id="status">
										<%-- <li><a href="#N" val="1"><span
												class="ui-icon ui-icon-bullet"></span>合同类型</a></li>
										<li><a href="#N" val="2">自费通航</a></li>
										<li><a href="#N" val="3">自费整体</a></li>
										<li><a href="#N" val="4">整体大包</a></li>
										<li><a href="#N" val="5">整体课程</a></li>
										<li><a href="#N" val="6">通航</a></li>
										<li><a href="#N" val="7">军转民</a></li>
										<li><a href="#N" val="8">自费高性能</a></li>
										<li><a href="#N" val="9">基础理论+招飞</a></li>
										<li><a href="#N" val="10">基础理论+执照理论</a></li>
										<li><a href="#N" val="11">执照理论</a></li>
										<li><a href="#N" val="8">基础理论</a></li>
										<li><a href="#N" val="9">合作共建</a></li> --%>
									</ul>
										<input type="hidden" id="strContractType"
										name="strContractType" value="${selConEneity.CType }" />
								</div>
							</td>
							<td class="col20_ textR">学员类型</td>
							<td>
								<div class="dropDownList" id="Div4">
									<button class="tableselect">学员类型</button>
									<ul id="stu">
										<%-- <li><a href="#N" val="1"><span
												class="ui-icon ui-icon-bullet"></span>学员类型</a></li>
										<li><a href="#N" val="2">4+1</a></li>
										<li><a href="#N" val="3">高招生</a></li>
										<li><a href="#N" val="4">高中生</a></li>
										<li><a href="#N" val="5">军转民</a></li>
										<li><a href="#N" val="6">通航</a></li>
										<li><a href="#N" val="7">通航转整体</a></li>
										<li><a href="#N" val="8">整体大包</a></li>
										<li><a href="#N" val="9">整体课程</a></li>
										<li><a href="#N" val="10">整体自费</a></li> --%>
									</ul>
									<input type="hidden" id="strStudentType" name="strStudentType" value="${selConEneity.CStuType }"/>
								</div>
							</td>
						</tr>
						<tr>
							<td class="col20_ textR">合同状态</td>
							<td class="col15_">
								<div class="dropDownList" id="Div3">
									<button class="tableselect">合同状态</button>
									<ul>
										<li><a href="#N" val="1"><span
												class="ui-icon ui-icon-bullet"></span>意向</a></li>
										<li><a href="#N" val="2">初稿</a></li>
										<li><a href="#N" val="3">定稿</a></li>
										<li><a href="#N" val="4">生效</a></li>
										<li><a href="#N" val="5">完成</a></li>
										<li><a href="#N" val="6">终止</a></li>
									</ul>
									<input type="hidden" id="strContractStatus"
										name="strContractStatus" value="${selConEneity.CStatus }" />
								</div>
							</td>
							<td class="col20_ textR">合同性质</td>
							<td>
								<div class="dropDownList" id="Div6">
									<button class="tableselect">合同性质</button>
									<ul id="ContractNature">
										<%-- <li><a href="#N" val="1"><span
												class="ui-icon ui-icon-bullet"></span>飞行培训</a></li>
										<li><a href="#N" val="2">整体大包</a></li>
										<li><a href="#N" val="3">通航</a></li>
										<li><a href="#N" val="4">合作共建</a></li>
										<li><a href="#N" val="5">基础理论</a></li>
										<li><a href="#N" val="6">生源基地</a></li>
										<li><a href="#N" val="7">招飞+基础理论</a></li>
										<li><a href="#N" val="8">招飞/基础理论</a></li>
										<li><a href="#N" val="9">基础理论/执照理论</a></li>
										<li><a href="#N" val="10">理论+飞行</a></li>
										<li><a href="#N" val="11">执照理论</a></li>
										<li><a href="#N" val="12">高性能训练</a></li>
										<li><a href="#N" val="13">实践考试</a></li>
										<li><a href="#N" val="14">私照外包</a></li>
										<li><a href="#N" val="15">招飞</a></li>
										<li><a href="#N" val="16">6+1</a></li> --%>
									</ul>
									<input type="hidden" id="strContractNature"
										name="strContractNature" value="${selConEneity.CNature }" />
								</div>

							</td>
						</tr>
						<tr>
							<td class="col20_ textR">客户单位</td>
							<td class="col15_">
								<div class="dropDownList" id="Div5">
									<button class="tableselect">客户单位</button>
									<ul id="compys">
										<%-- <li><a href="#N" val="1"><span
												class="ui-icon ui-icon-bullet"></span>客户单位</a></li>
										<li><a href="#N" val="2">客户单位</a></li> --%>
									</ul>
									<input type="hidden" id="strCompy" name="strCompy"
										name="strCompy" value="${selConEneity.CCompy }" />
								</div>
							</td>
							<td class="col20_ textR">签订时间</td>
							<td><input id="strSignTime" name="strSignTime" type="text"
								class="tableinput date" onmouseup="WdatePicker()"
								value="${selConEneity.CSignTime }" /></td>
						</tr>
						<tr>
							<td class="col20_ textR">自费生姓名</td>
							<td class="col15_"><input id="strPrivateName"
								name="strPrivateName" type="text" class="tableinput"
								value="${selConEneity.CPrivateName }" /></td>
						</tr>
						<tr>
							<%-- <td></td>
							 <form action="<%=request.getContextPath()%>/contract/ProcessUpload.do" method="post" id="picPayForm" enctype="multipart/form-data" >
                    		<td colspan="2">
	                       		 <a href="javascript:;" class="file-box">
	                            <input  id="btnupload" name="file" type="file" class="file" onchange="addMore(this)"/>上传合同
	                       		<input type="hidden" id="aaa" name="serialHide" value="${selConEneity.CId}"/></a>
                    		</td>
                   			 </form> --%>
						</tr>
						 <tr>
		                    <%-- <td class="col15_ textR" >合同文本</td>
		                    <td colspan="10" id="picture">
		                    <input type="hidden" id="pic" name="COntractText" value="${selConEneity.COntractText}"/>
		                    </td> --%>
              			 </tr>
						
						<tr>
							<%-- <td class="col20_ textR">所在年级</td>
							<td colspan="3">
								<div class="dropDownList" id="Div2">
									<button class="tableselect1">学生年级</button>
									<ul>
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
									<input type="hidden" id="gradeYear_0"
										name="gradeYear_0" value="1" />
								</div>
								
								<s:if test="selConEneity.CInitFlg==0">
								
									<button id="addStudentInfoBtn" class="greenBtn"
										style="margin-left: 10px;">+</button>
								</s:if> 
								 <s:else>
								 <button id="addStudentInfoBtn" class="greenBtn" style="margin-left: 10px;visibility:hidden;">+</button> 
								 </s:else>
								<span class="ml20">学员人数</span> <input
								id="studentCount_0" name="studentCount_0" id="studentCount_0"
								type="text" class="tableinput1 ml10" /> <span class="ml20">入校时间</span>
								<input id="schoolTime_0" name="schoolTime_0" type="text"
								class="tableinput1 ml10 date" onmouseup="WdatePicker()" />
							</td>  --%>
						</tr>
					
						<tr>
							<td colspan="4" class="tCenter"><input id="Button1"
								type="button"
								class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ml10"
								value="经费初始化" /> <input id="Button2" type="button"
								class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ml10"
								value="保存" /></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<input id="hCInitFlg" type="hidden" value="${selConEneity.CInitFlg }" />
	<form action="<%=request.getContextPath()%>/contract/contractRecPayment.do?CID=${selConEneity.CId}" method="post" id="contractRecPayment">
		  <!-- 合同主键 -->
		<%-- <input type="hidden" name="CID" id="CID" value="${selConEneity.CId}"> --%>
		<input type="hidden" name="contractName" id="contractName" value="${selConEneity.CName}">
		<input type="hidden" name="contractID" id="contractID" value="${selConEneity.CContractId}">
		<input type="hidden" name="contractType" id="contractType" value="${selConEneity.CType}" /> 
  		<input type="hidden" name="studentType" id="studentType" value="${selConEneity.CStuType}" /> 
  		<input type="hidden" name="contractStatus" id="contractStatus" value="${selConEneity.CStatus}" /> 
  		<input type="hidden" name="contractNature" id="contractNature" value="${selConEneity.CNature}" /> 
  		<input type="hidden" name="compy" id="compy" value="${selConEneity.CCompy}" /> 
  		<input type="hidden" name="signTime" id="signTime" value="${selConEneity.CSignTime}" /> 
  		<input type="hidden" name="privateName" id="privateName" value="${selConEneity.CPrivateName}" /> 
  		<input type="hidden" name="gradeInfo" id="gradeInfo" value='${selConEneity.CGradeInfo}' />
  	</form>
  	<form action="<%=request.getContextPath()%>/contract/updateContract.do" method="post" id="updateContract">
		  <!-- 合同主键 -->
		<input type="hidden" name="CID" id="CID" value="${selConEneity.CId}">
		<input type="hidden" name="contractName" id="contractName1" value="${selConEneity.CName}">
		<input type="hidden" name="contractID" id="contractID1" value="${selConEneity.CContractId}">
		<input type="hidden" name="contractType" id="contractType1" value="${selConEneity.CType}" /> 
  		<input type="hidden" name="studentType" id="studentType1" value="${selConEneity.CStuType}" /> 
  		<input type="hidden" name="contractStatus" id="contractStatus1" value="${selConEneity.CStatus}" /> 
  		<input type="hidden" name="contractNature" id="contractNature1" value="${selConEneity.CNature}" /> 
  		<input type="hidden" name="compy" id="compy1" value="${selConEneity.CCompy}" /> 
  		<input type="hidden" name="signTime" id="signTime1" value="${selConEneity.CSignTime}" /> 
  		<input type="hidden" name="privateName" id="privateName1" value="${selConEneity.CPrivateName}" /> 
  		<input type="hidden" name="gradeInfo" id="gradeInfo1" value='${selConEneity.CGradeInfo}' />
  		<input type="hidden" name="picture" id="pictureHide"/>
  </form>

</body>
</html>
