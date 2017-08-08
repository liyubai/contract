<%@page contentType="text/html; charset=UTF-8"%><%@ taglib prefix="s"
	uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增合同</title>
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
<script>
	$(function() {
		//debugger;
		/* 合同类型 */
        var  data1 =getDics(322);
        var resultHtml="";
        for(var j=1;j<data1.dics.length;j++){
        	
        	if(data1.dics[j].level==1){
        		 resultHtml+="<li><a href='#N' val='0' class='inline'>"+data1.dics[j].name+"</a></li>";
        	}
        }
        for(var i=1;i<data1.dics.length;i++){
        	if(data1.dics[i].level==""||data1.dics[i].level!=1){
        		resultHtml+="<li><a href='javascript:gettype("+data1.dics[i].id+")' val='"+data1.dics[i].id+"'><span class='ui-icon ui-icon-bullet'></span>"+data1.dics[i].name+"</span></li>"
        	}
        }
        $("#status").html(resultHtml);
        
        /* 学生类型 */
        var  data3 =getDics(3);
        var stuHtml="";
        for(var j=1;j<data3.dics.length;j++){
        	
        	if(data3.dics[j].level==1){
        		stuHtml+="<li><a href='#N' val='0' class='inline'>"+data3.dics[j].name+"</a></li>";
        	}
        }
        for(var i=1;i<data3.dics.length;i++){
        	if(data3.dics[i].level==""||data3.dics[i].level!=1){
        		stuHtml+="<li><a href='javascript:getstutype("+data3.dics[i].id+")' val='"+data3.dics[i].id+"'><span class='ui-icon ui-icon-bullet'></span>"+data3.dics[i].name+"</span></li>"
        	}
        }
        $("#stu").html(stuHtml);
        
        /* 签约单位 */
        var  data2 =getDics(2);
        var compyHtml="";
        for(var j=1;j<data2.dics.length;j++){
        	
        	if(data2.dics[j].level==1){
        		compyHtml+="<li><a href='#N' val='0' class='inline'>"+data2.dics[j].name+"</a></li>";
        	}
        }
        for(var i=1;i<data2.dics.length;i++){
        	if(data2.dics[i].level==""||data2.dics[i].level!=1){
        		compyHtml+="<li><a href='javascript:getcompy("+data2.dics[i].id+")' val='"+data2.dics[i].id+"'><span class='ui-icon ui-icon-bullet'></span>"+data2.dics[i].name+"</span></li>"
        	}
        }
        $("#compys").html(compyHtml);
        
        var  data4 =getDics(557);
        var contractNatureHtml="";
        for(var j=1;j<data4.dics.length;j++){
        	
        	if(data4.dics[j].level==1){
        		contractNatureHtml+="<li><a href='#N' val='0' class='inline'>"+data4.dics[j].name+"</a></li>";
        	}
        }
        for(var i=1;i<data4.dics.length;i++){
        	if(data4.dics[i].level==""||data4.dics[i].level!=1){
        		contractNatureHtml+="<li><a href='javascript:getstutype("+data4.dics[i].id+")' val='"+data4.dics[i].id+"'><span class='ui-icon ui-icon-bullet'></span>"+data4.dics[i].name+"</span></li>"
        	}
        }
        $("#contNature").html(contractNatureHtml);
        
		
		new $.dropDownList(0, true, 243);
		new $.dropDownList(1, true, 243);
		new $.dropDownList(2, true, 243);
		new $.dropDownList(3, true, 243);
		new $.dropDownList(4, true, 243);
		new $.dropDownList(5, true, 160);
	});
	
	function doinit(){
		getContractID();
	}
	
	//自刚生成合同编号
	function getContractID(){
		$.ajax({
			type:"post",
			cache : false,  
			url:"<%=request.getContextPath()%>/contract/showContractID.do",
			dataType:"json",
			success:function(data,statusCode ){
				if(data==null){
					alert("data is null");
				}else{
					$("#strContractID").val(data.CContractId);
				}
			}, 
			error:function(XMLHttpRequest, textStatus, errorThrown){
				alert(errorThrown);
			}
		});	
	}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>
</head>
<body onload="doinit()">
	<jsp:include page="/pages/common/topPart.jsp" ></jsp:include>
	<jsp:include page="/pages/common/leftPart.jsp" ></jsp:include>

	<div id="rightPartA" style="overflow-x: hidden;">
		<div>
			<div class="Panel">
				<div class="panelHead">
					<span>新增合同</span>
				</div>
				<div class="panelContent">
					<table class="modifyTable">
						<tr>
							<td class="col20_ textR">合同名称</td>
							<td class="col15_"><input id="strContractName"
								name="strContractName" type="text" class="tableinput" value="" /></td>
							<td class="col20_ textR">合同编号</td>
							<td><input id="strContractID" type="text"
								 readonly="readonly" name="strContractID" class="tableinput" value="${contractID}" /></td>
						</tr>
						<tr>
							<td class="col20_ textR">合同类型</td>
							<td class="col15_">
								<div class="dropDownList">
									<button class="tableselect">合同类型</button>
									<ul id="status">
									</ul>
									<input type="hidden" id="strContractType"
										name="strContractType" value="1" />
								</div>
							<td class="col20_ textR">学员类型</td>
							<td>
								<div class="dropDownList" id="Div4">
									<button class="tableselect">学员类型</button>
									<ul id="stu">
									</ul>
									<input type="hidden" id="strStudentType" name="strStudentType"
										value="1" />
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
										name="strContractStatus" value="1" />
								</div>
							</td>
							<td class="col20_ textR">合同性质</td>
							<td>
								<div class="dropDownList" id="Div6">
									<button class="tableselect">合同性质</button>
									<ul id="contNature">
									</ul>
									<input type="hidden" id="strContractNature"
										name="strContractNature" value="1" />
								</div>

							</td>
						</tr>
						<tr>
							<td class="col20_ textR">客户单位</td>
							<td class="col15_">
								<div class="dropDownList" id="Div5">
									<button class="tableselect">客户单位</button>
									<ul id="compys">
									</ul>
									<input type="hidden" id="strCompy" name="strCompy"
										name="strCompy" value="1" />
								</div>
							</td>
							<td class="col20_ textR">签订时间</td>
							<td><input id="strSignTime" name="strSignTime" type="text"
								class="tableinput date" onmouseup="WdatePicker()"
								value="${signTime}" /></td>
						</tr>
						<tr>
							<td class="col20_ textR">自费生姓名</td>
							<td class="col15_"><input id="strPrivateName"
								name="strPrivateName" type="text" class="tableinput"
								value="${privateName}" /></td>
						</tr>
						<!-- <tr>
							<td class="col20_ textR">所在年级</td>
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
									<input type="hidden" id="strStudentGrade"
										name="strStudentGrade" value="1" />
								</div>
								<button id="addStudentInfoBtn" class="greenBtn"
									style="margin-left: 10px;">+</button> <span class="ml20">学员人数</span>
								<input id="strStudentCount" name="strStudentCount" type="text"
								class="tableinput1 ml10" /> <span class="ml20">入校时间</span> <input
								id="strSchoolTime" name="strSchoolTime" type="text"
								class="tableinput1 ml10 date" onmouseup="WdatePicker()" />
							</td>
						</tr> -->
						<tr>
							<td colspan="4" class="tCenter"><!-- <input id="Button1"
								type="button"
								class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ml10"
								value="经费初始化" />  --><input id="Button2" type="button"
								class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary ml10"
								value="保存" /></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$('#Button2').click(function() {
				//保存按钮
				checkForm();
			});
			$('#Button1').click(function() {
				//经费初始化按钮
				window.location.href = 'cTrainingProgram.jsp?CID=1&gradeInfo=asdas';
			});

			var pageddlNum = 5;
			$('#addStudentInfoBtn')
					.click(
							function() {
								var str = $(this).parent().html();
								var trNode = $('<tr><td class="col20_ textR">所在年级</td><td colspan="3">'
										+ str + '</td></tr>');

								$('.modifyTable tr').eq(-2).after(trNode);

								trNode.find('.greenBtn').css('visibility',
										'hidden');

								new $.dropDownList(++pageddlNum, true, 160);
							});
		});

		
		function checkForm() {
			var tempContractName = $("#strContractName"), tempContractID = $("#strContractID");
			var flag = true;
			if ($.trim(tempContractName.val()).length == 0) {
				alert("合同名称不能为空！");
				flag = false;
				return  ;
			}
			if ($.trim(tempContractName.val()).length > 100) {
				alert("合同名称过长请控制在50字以内！");
				flag = false;
				return ;
			}
			if ($.trim(tempContractID.val()).length == 0) {
				alert("合同编号不能为空！");
				flag = false;
				return ;
			}
			 if (flag) {
				ajaxCheckCID();
			} 
		}

		function setHiddenValue() {
			$("#contractName").val($.trim($("#strContractName").val()));
			$("#contractID").val($.trim($("#strContractID").val()));
			$("#contractType").val($.trim($("#strContractType").val()));
			$("#studentType").val($.trim($("#strStudentType").val()));
			$("#contractStatus").val($.trim($("#strContractStatus").val()));
			$("#contractNature").val($.trim($("#strContractNature").val()));
			$("#compy").val($.trim($("#strCompy").val()));
			$("#signTime").val($.trim($("#strSignTime").val()));
			$("#privateName").val($.trim($("#strPrivateName").val()));
			$("#studentGrade").val($.trim($("#strStudentGrade").val()));
			$("#studentCount").val($.trim($("#strStudentCount").val()));
			$("#schoolTime").val($.trim($("#strSchoolTime").val()));
			
			$("#addContract").submit();
		}
		
		
		//验证合同主键是否存在
		 function ajaxCheckCID(){
			params = {"contractID":$.trim($("#strContractID").val())};
			$.ajax({
				type:"post",
				cache : false,  
				url:"<%=request.getContextPath()%>/contract/ajaxCheckCID.do",
				data:params,
				dataType:"text",
				success:function(data,statusCode ){
					if(data==null){
						alert("数据提交失败");
					}else{
						if(data == "true"){
						 	setHiddenValue();
						}else{
							alert("合同编号已存在，请刷新页面重新填写");
						}
					}
				}, 
				error:function(XMLHttpRequest, textStatus, errorThrown){
					alert(errorThrown);
				}
			});	
		} 
	</script>
	<form action="<%=request.getContextPath()%>/contract/addContract.do"
		method="post" id="addContract">
		<input type="hidden" name="contractName" id="contractName" value="${contractName}">
		<input type="hidden" name="contractID" id="contractID" value="${contractID}">
		<input type="hidden" name="contractType" id="contractType" value="${contractType}" /> 
  		<input type="hidden" name="studentType" id="studentType" value="${studentType}" /> 
  		<input type="hidden" name="contractStatus" id="contractStatus" value="${contractStatus}" /> 
  		<input type="hidden" name="contractNature" id="contractNature" value="${contractNature}" /> 
  		<input type="hidden" name="compy" id="compy" value="${compy}" /> 
  		<input type="hidden" name="signTime" id="signTime" value="${signTime}" /> 
  		<input type="hidden" name="privateName" id="privateName" value="${privateName}" /> 
  		<input type="hidden" name="studentGrade" id="studentGrade" value="${studentGrade}" /> 
  		<input type="hidden" name="studentCount" id="studentCount" value="${studentCount}" /> 
  		<input type="hidden" name="schoolTime" id="schoolTime" value="${schoolTime}" />
	</form>

</body>
</html>
