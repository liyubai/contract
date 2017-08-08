<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员执照检查信息</title>

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
		var errors = "";
		
		var DCheckdate = $("#DCheckdate").val();
		var VCheckcontent = $("#VCheckcontent").val();
		var VCheckteacher = $("#VCheckteacher").val();
		var VBz = $("#VBz").val();
		var DEffectdate = $("#DEffectdate").val();
		var VFlyform = $("#VFlyform").val();
		
		if(DCheckdate==null || $.trim(DCheckdate)==""){
			errors += "【检查日期】为必填项，不能为空！\r";
		}
		if(VCheckcontent==null || $.trim(VCheckcontent)==""){
			errors += "【检查内容】为必填项，不能为空！\r";
		}
		if(VCheckteacher==null || $.trim(VCheckteacher)==""){
			errors += "【检查教员】为必填项，不能为空！\r";
		}
		if(DEffectdate==null || $.trim(DEffectdate)==""){
			errors += "【有效期】为必填项，不能为空！\r";
		}
		if(VFlyform==null || $.trim(VFlyform)==""){
			errors += "【航空器型号】为必填项，不能为空！\r";
		}
		if(errors==""){
			$("#DCheckdatef").val(DCheckdate);
			$("#VCheckcontentf").val(VCheckcontent);
			$("#VCheckteacherf").val(VCheckteacher);
			$("#VBzf").val(VBz);
			$("#DEffectdatef").val(DEffectdate);
			$("#VFlyformf").val(VFlyform);
			
			$("#peopleForm").submit();
		}else{
			alert(errors);
			return;
		}
	});
	 //取消，返回列表页
	$("#modalDialogButton2").click(function(){
	    $("#searchForm").submit();
	});
	//保存
	$("#modalDialogButton3").click(function(){
		var errors = "";
		
		var DCheckdate = $("#DCheckdate").val();
		var VCheckcontent = $("#VCheckcontent").val();
		var VCheckteacher = $("#VCheckteacher").val();
		var VBz = $("#VBz").val();
		var DEffectdate = $("#DEffectdate").val();
		var VFlyform = $("#VFlyform").val();
		
		if(DCheckdate==null || $.trim(DCheckdate)==""){
			errors += "【检查日期】为必填项，不能为空！\r";
		}
		if(VCheckcontent==null || $.trim(VCheckcontent)==""){
			errors += "【检查内容】为必填项，不能为空！\r";
		}
		if(VCheckteacher==null || $.trim(VCheckteacher)==""){
			errors += "【检查教员】为必填项，不能为空！\r";
		}
		if(DEffectdate==null || $.trim(DEffectdate)==""){
			errors += "【有效期】为必填项，不能为空！\r";
		}
		if(VFlyform==null || $.trim(VFlyform)==""){
			errors += "【航空器型号】为必填项，不能为空！\r";
		}
		if(errors==""){
			$("#DCheckdatef").val(DCheckdate);
			$("#VCheckcontentf").val(VCheckcontent);
			$("#VCheckteacherf").val(VCheckteacher);
			$("#VBzf").val(VBz);
			$("#DEffectdatef").val(DEffectdate);
			$("#VFlyformf").val(VFlyform);
			
			$("#peopleForm").submit();
		}else{
			alert(errors);
			return;
		}
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
<button id="modalDialogButton3" class="green" primary="ui-icon-button-addnew">保存</button>
<button id="modalDialogButton4" class="normal"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>
</div>

<div class="Panel" id="Panel1" style="margin-top: 53px;">
	<div class="panelHead"><span>修改教员执照检查信息　　　教员编号：${teZzJc.TTeaLicense.teacherBaseInfo.VCode}　　　教员姓名：${teZzJc.TTeaLicense.teacherBaseInfo.VName}　　　所在部门：${teZzJc.TTeaLicense.teacherBaseInfo.TOrg.VName}</span></div>
	<div class="panelContent">
		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="normal">
					<td width="60">检查类型：</td>
					<td colspan="5">
						<s:if test="teZzJc.IChecktype==0">熟练检查</s:if>　
						<s:if test="teZzJc.IChecktype==1">定检检查</s:if>　
						<s:if test="teZzJc.IChecktype==2">实践考试</s:if>
					</td>
				</tr>
				<tr class="normal">
				<td width="60">检查日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DCheckdate" name="teaZzJc.DCheckdate" value="<s:date name="teZzJc.DCheckdate" format="yyyy-MM-dd" />" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td width="60">检查内容：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VCheckcontent" name="teaZzJc.VCheckcontent" value="${teZzJc.VCheckcontent}" maxlength="100" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td width="60">检查教员：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VCheckteacher" name="teaZzJc.VCheckteacher" value="${teZzJc.VCheckteacher}" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>备注：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VBz" name="teaZzJc.VBz" value="${teZzJc.VBz}" maxlength="200" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td>有效期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DEffectdate" name="teaZzJc.DEffectdate" value="<s:date name="teZzJc.DEffectdate" format="yyyy-MM-dd" />" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td>航空器型号：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VFlyform" name="teaZzJc.VFlyform" value="${teZzJc.VFlyform}" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<div class="panelBox buttonBox">
<button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">保存</button>
<button id="modalDialogButton2" class="normal">返　回</button>
</div>
</div></div>



<form id="searchForm" action="searchZzJcHistoryListTeacherAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
<input type="hidden" id="VIdf" name="historySearch.VId" value="${historySearch.VId}" />
<input type="hidden" id="VNamef" name="historySearch.VName" value="${historySearch.VName}" />
<input type="hidden" id="ILevelf" name="historySearch.ILevel" value="${historySearch.ILevel}" />
<input type="hidden" id="VNationf" name="historySearch.VNation" value="${historySearch.VNation}" />
<input type="hidden" id="DResultdate1f" name="historySearch.DResultdate1" value="${historySearch.DResultdate1}"/>
<input type="hidden" id="DResultdatef" name="historySearch.DResultdate" value="${historySearch.DResultdate}" />
<input type="hidden" id="VDoctorf" name="historySearch.VDoctor" value="${historySearch.VDoctor}" />
<input type="hidden" id="VIssuerf" name="historySearch.VIssuer" value="${historySearch.VIssuer}" />
<input type="hidden" id="DIssueTimef" name="historySearch.DIssueTime" value="${historySearch.DIssueTime}" />
<input type="hidden" id="DUsedTimef" name="historySearch.DUsedTime" value="${historySearch.DUsedTime}" />
<input type="hidden" id="VCompanyf" name="historySearch.VCompany" value="${historySearch.VCompany}" />
<input type="hidden" id="DIssueTime1f" name="historySearch.DIssueTime1" value="${historySearch.DIssueTime1}" />
<input type="hidden" id="DUsedTime1f" name="historySearch.DUsedTime1" value="${historySearch.DUsedTime1}" />
<input type="hidden" id="deptNamef" name="historySearch.deptName" value="${historySearch.deptName}" />
</form>

<form id="peopleForm" action="upZzJcTeacherAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
<input type="hidden" name="teaZzJc.IChecktype" value="${teZzJc.IChecktype}" />
<input type="hidden" id="DCheckdatef" name="teaZzJc.DCheckdate" />
<input type="hidden" id="VCheckcontentf" name="teaZzJc.VCheckcontent" />
<input type="hidden" id="VCheckteacherf" name="teaZzJc.VCheckteacher" />
<input type="hidden" id="VBzf" name="teaZzJc.VBz" />
<input type="hidden" id="DEffectdatef" name="teaZzJc.DEffectdate" />
<input type="hidden" id="VFlyformf" name="teaZzJc.VFlyform" />
<input type="hidden" name="teaZzJc.teacherLicenseupdate.VId" value="${teZzJc.teacherLicenseupdate.VId}" />
<input type="hidden" name="teaZzJc.TTeaLicense.VId" value="${teZzJc.TTeaLicense.VId}" />
<input type="hidden" name="teaZzJc.VId" value="${teZzJc.VId}" />
<input type="hidden" id="VIdf" name="historySearch.VId" value="${historySearch.VId}" />
<input type="hidden" id="VNamef" name="historySearch.VName" value="${historySearch.VName}" />
<input type="hidden" id="ILevelf" name="historySearch.ILevel" value="${historySearch.ILevel}" />
<input type="hidden" id="VNationf" name="historySearch.VNation" value="${historySearch.VNation}" />
<input type="hidden" id="DResultdate1f" name="historySearch.DResultdate1" value="${historySearch.DResultdate1}"/>
<input type="hidden" id="DResultdatef" name="historySearch.DResultdate" value="${historySearch.DResultdate}" />
<input type="hidden" id="VDoctorf" name="historySearch.VDoctor" value="${historySearch.VDoctor}" />
<input type="hidden" id="VIssuerf" name="historySearch.VIssuer" value="${historySearch.VIssuer}" />
<input type="hidden" id="DIssueTimef" name="historySearch.DIssueTime" value="${historySearch.DIssueTime}" />
<input type="hidden" id="DUsedTimef" name="historySearch.DUsedTime" value="${historySearch.DUsedTime}" />
<input type="hidden" id="VCompanyf" name="historySearch.VCompany" value="${historySearch.VCompany}" />
<input type="hidden" id="DIssueTime1f" name="historySearch.DIssueTime1" value="${historySearch.DIssueTime1}" />
<input type="hidden" id="DUsedTime1f" name="historySearch.DUsedTime1" value="${historySearch.DUsedTime1}" />
<input type="hidden" id="deptNamef" name="historySearch.deptName" value="${historySearch.deptName}" />
</form>

</body>
</html>
