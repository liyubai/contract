<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>待办事项</title>

<link rel="stylesheet" href="themes/cupertino/jquery.ui.all.css">
<script src="scripts/jquery.min.js"></script>
<script src="scripts/jquery-ui.min.js"></script>
<script src="scripts/ui/jquery.ui.position.min.js"></script>
<script src="scripts/ui/jquery.ui.core.min.js"></script>
<script src="scripts/ui/jquery.ui.widget.min.js"></script>
<script src="scripts/ui/jquery.ui.button.min.js"></script>
<script src="scripts/ui/jquery.ui.tabs.min.js"></script>
<script src="scripts/ui/jquery.ui.dialog.min.js"></script>
<script src="scripts/ui/jquery.ui.menu.min.js"></script>
<script src="scripts/function.min.js"></script>
<script src="scripts/teacher.js"></script>
<script>
$(function() {
	$( "#baseDialog" ).dialog({//基础信息
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {	
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#tjdialogContent" ).dialog({//体检信息
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#zzdialogContent" ).dialog({//执照信息
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#selectOutlineDialog" ).dialog({
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var outline = getSelRadioValue("outline");
				window.location.href="open_createHistoryFlightTrainingRecordPage.do?outlineid="+outline;
			},
			"关 闭": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#backResultDialogForm" ).dialog({//操作数据库返回提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("button.icon").click(function(){
		var id = this.id;
		var iid = id.split(",")[0];
		var opt = id.split(",")[1];
		var type = "";
		var name = "";
		
		if(opt==1){
			type = id.split(",")[2];
			if(type==1){
				window.location.replace("open_doWithListPage.do?id=" + iid);
			}else{
				window.location.replace("open_doWithEditListPage.do?id="+iid);
			}
		}else if(opt==3){
			type = id.split(",")[2];
			if(type==0){
				window.location.replace("open_doWithAuditListPage.do?id="+ iid);
			}else{
				window.location.replace("open_doWithAppealListPage.do?id="+ iid);
			}
		}else if(opt==2){
			type = id.split(",")[2];
			//window.location.replace("open_doWithExamAskListPage.do?id="+ iid + "&teacherid=" + type);
			$("#id1").val(iid);
			$("#teacherid1").val(type);
			$("#form1").submit();
		}else if(opt==5){
			name = id.split(",")[2];
			type = id.split(",")[3];
			if(type==0){
				
				//window.location.replace("open_doWithAddHoursAndAddLessonListPage.do?id="+ iid + "&teacherid=" + name);
				$("#id2").val(iid);
				$("#teacherid2").val(name);
				$("#form2").submit();
			}else if(type==1){
				
				//window.location.replace("open_doWithBackExamAskListPage.do?id="+ iid + "&teacherid=" + name);
				$("#id3").val(iid);
				$("#teacherid3").val(name);
				$("#form3").submit();
			}else{
				
				//window.location.replace("open_doWithExamAskStudentAssignTeacher.do?id="+ iid + "&teacherid=" + name);
				$("#id4").val(iid);
				$("#teacherid4").val(name);
				$("#form5").submit();
			}
		}else if(opt==4){
			type = id.split(",")[3];
			$("#id5").val(iid);
			$("#statusid").val(type);
			$("#form5").submit();
			//window.location.replace("open_doWithSongPeiZiGeAuditList.do?id="+ iid + "&status=" + type);
		}
		else if(opt==6){
			type = id.split(",")[2];
			$("#id6").val(iid);
			$("#teacherid6").val(type);
			$("#form6").submit();
			//window.location.replace("open_doWithScoreAuditList.do?id="+ iid + "&teacherid=" + type);
		}
		else if(opt==9){
			type = id.split(",")[2];
			$("#id7").val(iid);
			$("#teacherid7").val(type);
			$("#form7").submit();
			//window.location.replace("open_doWithOtherRecordListPage.do?id="+ iid + "&teacherid=" + type);
		}
		else{
			
		}
	});
	$("#searchButton").click(function(){
		var key = $.trim($("#searchName").val());
		if(key=="学号/姓名"){
			key = "";
		}
		$("#name").val(key);
		$("#formid").submit();
	});
});
function opensel(){
	$( "#selectOutlineDialog" ).dialog("open");
}
function openView(type){
	if(type==1){//基础
		showTeacherBaseInfo();
	}else if(type==2){//体检
		showTeacherTjInfo();
	}else if(type==3){//执照
		showTeacherZzInfo();
	}else{}
	
}

</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">

<div id="leftPartA"><div>
<s:if test='isOpen==2 && #session.loginContext.loginUserType==3'>
<ul class="itemList">
<li class="active"><a href="javascript:void(0)" onClick="opensel()">历史记录录入</a></li>
</ul>
</s:if>
<s:if test='isOpen==1 && (#session.loginContext.loginUserType==3 ||#session.loginContext.loginUserType==1)'>
<ul class="itemList">
<li class="active"><a href="javascript:void(0)" onClick="opensel()">历史记录录入</a></li>
</ul>
</s:if>
<s:if test='#session.loginContext.loginUserType==2'>

<ul class="itemList">
<li><a href="javascript:void(0)" onClick="openView(1)">教员基础信息</a></li>
<li><a href="javascript:void(0)" onClick="openView(2)">教员体检信息</a></li>
<li><a href="javascript:void(0)" onClick="openView(3)">教员执照信息</a></li>
</ul>
<span class="panelLine"></span>
<div class="buttonInput relative" width="160" height="28" style="margin-left:10px; margin-top:10px;">
    <input id="searchName"  name="searchName"  title="学号/姓名" type="text" maxlength="50" value="学号/姓名" /><button id="searchButton">查询</button></div>
<form action="open_toDoingListPage.do" method="post" id="formid">
<input type="hidden" name="name" id="name">
</form>
</s:if>
</div></div>

<div id="rightPartA"><div>
<div class="Panel" id="Panel1">
<div class="panelHead"><span>待办事项</span></div>

<div class="panelContent">

<table class="panelTable" border="0" cellspacing="0" cellpadding="3">
<thead>
<tr class="trSpliter">
<th width="150"></th>
<th width="350"></th>
<th width="180"></th>
<th ></th>
</tr>
<tr class="trGray">
<th style="padding-left:50px;">提交人</th>
<th>主题</th>
<th>提交时间</th>
<th>操作</th>
</tr>
</thead>
<tbody>
<s:iterator value="studentToDoingList" status="statu">
<tr>
<td style="padding-left:50px;">${submitUserName}</td>
<td>${title}</td>
<td>${submitTime}</td>
<td><button class="icon"  icon="ui-icon-pencil" title="<s:if test='type==1'>确认</s:if><s:else>修改</s:else>" id="${infoId},1,${type}"></button></td>
</tr>
</s:iterator>

<s:iterator value="teacherToDoingList" status="statu">
<tr>
<td style="padding-left:50px;">${submitUserName}</td>
<td>${title}</td>
<td>${submitTime}</td>
<td><button class="icon"  icon="ui-icon-pencil" title="<s:if test='type==0'>审核</s:if><s:else>处理申诉</s:else>" id="${infoId},3,${type}"></button></td>
</tr>
</s:iterator>
<s:iterator value="addHoursAndAddLessonToDoingList" status="statu">
<tr>
<td style="padding-left:50px;"><s:property value="submitUserName.split(',')[0]"/></td>
<td>${title}</td>
<td>${submitTime}</td>
<td><button class="icon"  icon="ui-icon-pencil" title="审核" id="${infoId},5,${submitUserName}"></button></td>
</tr>
</s:iterator>
<s:iterator value="assignTeacherToDoingList" status="statu">
<tr>
<td style="padding-left:50px;"><s:property value="submitUserName.split(',')[0]"/></td>
<td>${title}</td>
<td>${submitTime}</td>
<td><button class="icon"  icon="ui-icon-pencil" title="审核" id="${infoId},5,${submitUserName}"></button></td>
</tr>
</s:iterator>
<s:iterator value="examAskToDoingList" status="statu">
<tr>
<td style="padding-left:50px;">${submitUserName}</td>
<td>${title}</td>
<td>${submitTime}</td>
<td><button class="icon"  icon="ui-icon-pencil" title="审核" id="${infoId},2,${submitUserName}"></button></td>
</tr>
</s:iterator>

<s:iterator value="otherToDoingList">
<tr>
<td style="padding-left:50px;">${submitUserName}</td>
<td>${title}</td>
<td>${submitTime}</td>
<td><button class="icon"  icon="ui-icon-pencil" title="审核" id="${infoId},9,${submitUserName}"></button></td>
</tr>
</s:iterator>

<s:iterator value="songPeiAuditToDoingList">
<tr>
<td style="padding-left:50px;">${submitUserName}</td>
<td>${title}</td>
<td>${submitTime}</td>
<td><button class="icon"  icon="ui-icon-pencil" title="审核" id="${title},4,${submitUserName},${infoId}"></button></td>
</tr>
</s:iterator>
<s:iterator value="scoreToDoingList">
<tr>
<td style="padding-left:50px;">${submitUserName}</td>
<td>${title}</td>
<td>${submitTime}</td>
<td><button class="icon"  icon="ui-icon-pencil" title="审核" id="成绩审核,6,${submitUserName}"></button></td>
</tr>
</s:iterator>
</tbody>
</table>

</div>
</div>
</div>
</div>

<div id="backResultDialogForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm4Span"></span></td>
</tr>
</table>
</div>

<div id="selectOutlineDialog" title="选择大纲">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="3">
<s:iterator value="outlineList" status="statu">
<tr><td><input name="outline" type="radio" value="${VId}" <s:if test='#statu.index==0'>checked</s:if> >${VName}</td></tr>
</s:iterator>
</table>
</div>

<div id="baseDialog"  title="教员基础信息">
<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
<tbody id="basecontentid">
</tbody>
</table>
</div>
<div id="tjdialogContent"  title="教员体检信息">
<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
<tbody id="tjcontentid">
</tbody>
</table>
</div>
<div id="zzdialogContent"  title="教员执照信息">
<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
<tbody id="zzcontentid">
</tbody>
</table>
</div>
<form action="open_doWithExamAskListPage.do" method="post" id="form1">
<input type="hidden" name="id" id="id1">
<input type="hidden" name="teacherid" id="teacherid1">
</form>
<form action="open_toDoingListPage.do" method="post" id="form2">
<input type="hidden" name="id" id="id2">
<input type="hidden" name="teacherid" id="teacherid2">
</form>
<form action="open_toDoingListPage.do" method="post" id="form3">
<input type="hidden" name="id" id="id3">
<input type="hidden" name="teacherid" id="teacherid3">
</form>
<form action="open_toDoingListPage.do" method="post" id="form4">
<input type="hidden" name="id" id="id4">
<input type="hidden" name="teacherid" id="teacherid4">
</form>
<form action="open_toDoingListPage.do" method="post" id="form5">
<input type="hidden" name="id" id="id5">
<input type="hidden" name="status" id="statusid">
</form>
<form action="open_toDoingListPage.do" method="post" id="form6">
<input type="hidden" name="id" id="id6">
<input type="hidden" name="teacherid" id="teacherid6">
</form>
<form action="open_toDoingListPage.do" method="post" id="form7">
<input type="hidden" name="id" id="id7">
<input type="hidden" name="teacherid" id="teacherid7">
</form>
<%@ include file="../../result.jsp"%>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#backResultDialogForm" ).dialog( "open" );
	}
});
</script>
</body>
</html>