<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员执照检查信息查询</title>

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
<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>
<style>
/*功能4*/
#Panel1 .panelLeft { width: 60px; } /*可以单独为不同的左面板设定内容的宽度*/
#Panel1 .panelRight { margin-left: 90px; /*这个margin-left的值是左面板的宽度加上横向padding的(15*2)，所以是230*/ }
/*功能4*/
</style>
<script>
$(function() {

	//功能5
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		new $.dropDownList(i,true,100);
	})
	//功能5
	
	//保存
	$("#modalDialogButton1").click(function(){
		var IChecktype = document.getElementsByName("IChecktype");
		var IChecktypes = ",";
		for(var i=0; i<IChecktype.length; i++){
			if(IChecktype[i].checked == true){
				IChecktypes += IChecktype[i].value+",";
			}
		}
		$("#deptNamef").val($("#deptName").val());
		$("#VIdf").val($("#VId").val());
		$("#VNamef").val($("#VName").val());
		$("#VNationf").val(IChecktypes);
		$("#DResultdate1f").val($("#DResultdate1").val());
		$("#DResultdatef").val($("#DResultdate").val());
		$("#VDoctorf").val($("#VDoctor").val());
		$("#VIssuerf").val($("#VIssuer").val());
		$("#DIssueTimef").val($("#DIssueTime").val());
		$("#DUsedTimef").val($("#DUsedTime").val());
		$("#VCompanyf").val($("#VCompany").val());
		$("#DIssueTime1f").val($("#DIssueTime1").val());
		$("#DUsedTime1f").val($("#DUsedTime1").val());
		$("#peopleForm").submit();
	});
	
	 //取消，返回列表页
	$("#modalDialogButton2").click(function(){
	    $("#searchForm").submit();
	});
	//保存
	$("#modalDialogButton3").click(function(){
		var IChecktype = document.getElementsByName("IChecktype");
		var IChecktypes = ",";
		for(var i=0; i<IChecktype.length; i++){
			if(IChecktype[i].checked == true){
				IChecktypes += IChecktype[i].value+",";
			}
		}
		$("#deptNamef").val($("#deptName").val());
		$("#VIdf").val($("#VId").val());
		$("#VNamef").val($("#VName").val());
		$("#VNationf").val(IChecktypes);
		$("#DResultdate1f").val($("#DResultdate1").val());
		$("#DResultdatef").val($("#DResultdate").val());
		$("#VDoctorf").val($("#VDoctor").val());
		$("#VIssuerf").val($("#VIssuer").val());
		$("#DIssueTimef").val($("#DIssueTime").val());
		$("#DUsedTimef").val($("#DUsedTime").val());
		$("#VCompanyf").val($("#VCompany").val());
		$("#DIssueTime1f").val($("#DIssueTime1").val());
		$("#DUsedTime1f").val($("#DUsedTime1").val());
		$("#peopleForm").submit();
	});
	
	 //取消，返回列表页
	$("#modalDialogButton4").click(function(){
	    $("#searchForm").submit();
	});
});
</script>

<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>

</head>
<body class="hide">
<div id="leftPartA"><div>
<ul class="foldList">
	<li><span class="ui-icon ui-icon-carat-1-s"></span>学员管理(4)</li>
	<ul class="itemList hide">
		<li><a>基础信息管理</a></li>
		<li><a class="navLink" href="Func11_1.html" id="navLink1">学籍管理</a></li>
        <li><a class="navLink" href="Func11_2.html" id="navLink1">学生状态管理</a></li>
        <li><a class="navLink" href="Func11_3.html" id="navLink1">国外航校面试管理</a></li>
        <li><a class="navLink" href="Func11_3.html" id="navLink1">执照信息</a></li>
        <li><a class="navLink" href="Func11_3.html" id="navLink1">体检合格证</a></li>
	</ul>
</ul>
<span class="panelLine"></span>
<ul class="foldList">
	<li><span class="ui-icon ui-icon-carat-1-s"></span>教员管理(3)</li>
	<ul class="itemList">
		<li><a href="searchListTeacherAction.do">教员基础信息管理</a></li>
		<li><a href="searchTjListTeacherAction.do">教员体检信息管理</a></li>
		<li class="active" style="cursor:default"><a href="searchZzListTeacherAction.do">教员执照信息管理</a></li>
	</ul>
</ul>
<span class="panelLine"></span>
<ul class="foldList">
	<li><span class="ui-icon ui-icon-carat-1-s"></span>其他人员管理(1)</li>
	<ul class="itemList hide">
		<li><a href="searchPeopleListAnotherPeopleAction.do">其他人员管理</a></li></li>
	</ul>
</ul>
</div></div>

<div id="rightPartA"><div>
<div id="topPartD">
<div class="panelBox buttonBox">
<button id="modalDialogButton3" class="green" primary="ui-icon-button-addnew">查询</button>
<button id="modalDialogButton4" class="normal">返　回</button>
</div>
</div>

<input type="hidden" name="statusMsg" />

<div class="Panel" id="Panel1" style="margin-top: 53px;">
	<div class="panelHead"><span>执照检查信息查询</span></div>
	<div class="panelContent">
		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="normal">
				<td width="100">教员ID：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VId" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td width="100">教员姓名：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VName" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td width="100">教员所在部门：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="deptName" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>检查类型：</td>
				<td>
					<input type="checkbox" name="IChecktype" value="0"/><b></b>熟练检查
					<input type="checkbox" name="IChecktype" value="1"/><b></b>定检检查
					<input type="checkbox" name="IChecktype" value="2"/><b></b>实践考试
				</td>
				<td>检查（起始）日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DResultdate" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td>检查（截至）日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DResultdate1" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>检查内容：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VDoctor" maxlength="20" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td>检查教员：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VIssuer" maxlength="20" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td>航空器型号：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VCompany" maxlength="200" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>有效（起始）日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DIssueTime" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td>有效（截至）日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DIssueTime1" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="panelBox buttonBox">
<button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">查询</button>
<button id="modalDialogButton2" class="normal">返　回</button>
</div>
</div></div>



<form id="searchForm" action="searchZzListTeacherAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
</form>

<form id="peopleForm" action="searchZzJcHistoryListTeacherAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
<input type="hidden" id="VIdf" name="historySearch.VId" />
<input type="hidden" id="VNamef" name="historySearch.VName" />
<input type="hidden" id="ILevelf" name="historySearch.ILevel" value="0" />
<input type="hidden" id="VNationf" name="historySearch.VNation" />
<input type="hidden" id="DResultdate1f" name="historySearch.DResultdate1"/>
<input type="hidden" id="DResultdatef" name="historySearch.DResultdate" />
<input type="hidden" id="VDoctorf" name="historySearch.VDoctor" />
<input type="hidden" id="VIssuerf" name="historySearch.VIssuer" />
<input type="hidden" id="DIssueTimef" name="historySearch.DIssueTime" />
<input type="hidden" id="DUsedTimef" name="historySearch.DUsedTime" />
<input type="hidden" id="VCompanyf" name="historySearch.VCompany" />
<input type="hidden" id="DIssueTime1f" name="historySearch.DIssueTime1" />
<input type="hidden" id="DUsedTime1f" name="historySearch.DUsedTime1" />
<input type="hidden" id="deptNamef" name="historySearch.deptName" />
</form>
<input type="hidden" id="tjId" value="${tjId}" />
</body>
</html>
