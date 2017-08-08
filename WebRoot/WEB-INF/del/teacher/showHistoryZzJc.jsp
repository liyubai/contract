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
	
	 //取消，返回列表页
	$("#modalDialogButton2").click(function(){
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
<div class="panelBox buttonBox">
	
	<button id="modalDialogButton2" class="normal">返　回</button>
		
</div>

<div class="Panel" id="Panel1">
	<div class="panelHead"><span>查看教员执照检查信息</span></div>
	<div class="panelContent">
	<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="60"></td>
				<td>姓名：</td>
				<td width="180">
					${teZzJc.TTeaLicense.teacherBaseInfo.VName}
				</td>
				<td width="82"></td>
				<td>编号：</td>
				<td width="180">
					${teZzJc.TTeaLicense.teacherBaseInfo.VCode}
				</td>
				<td width="60"></td>
				<td>所在部门：</td>
				<td width="240">
					${teZzJc.TTeaLicense.teacherBaseInfo.TOrg.VName}
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 30px;">
			<table>
				<tr>
				<td width="12"></td>
				<td>执照升级标识：</td>
				<td width="180">
				${teZzJc.teacherLicenseupdate.VCardid}
				</td>
				<td width="58"></td>
				<td>执照标识：</td>
				<td width="180">
					${teZzJc.TTeaLicense.VCardid}
				</td>
				<td width="60"></td>
				<td>检查日期：</td>
				<td width="180">
				<s:date name="teZzJc.DCheckdate" format="yyyy-MM-dd" />
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="38"></td>
				<td>检查内容：</td>
				<td width="180">
				${teZzJc.VCheckcontent}
				</td>
				<td width="56"></td>
				<td>检查教员：</td>
				<td width="180">
					${teZzJc.VCheckteacher}
				</td>
				<td width="84"></td>
				<td>备注：</td>
				<td width="180">
					${teZzJc.VBz}
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="26"></td>
				<td>航空器型别：</td>
				<td width="180">
					${teZzJc.VFlyform}
				</td>
				<td width="68"></td>
				<td>有效期：</td>
				<td width="180">
					<s:date name="teZzJc.DEffectdate" format="yyyy-MM-dd" />
				</td>
				<td width="60"></td>
				<td>检查类型：</td>
				<td width="180">
				        <s:if test="teZzJc.IChecktype==0">熟练检查</s:if>
						<s:if test="teZzJc.IChecktype==1">定检检查</s:if>
						<s:if test="teZzJc.IChecktype==2">实践考试</s:if>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="48"></td>
				<td>创建人：</td>
				<td width="180">
					${teZzJc.TUser.VUsername}
				</td>
				<td width="57"></td>
				<td>创建时间：</td>
				<td width="180">
					<s:date name="teZzJc.DCreatedate" format="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td width="56"></td>
				<td></td>
				<td width="180">
				</td>
				</tr>
			</table>
		</div>

	</div>

</div>
</div></div>



<form id="searchForm" action="searchZzJcHistoryListTeacherAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
<input type="hidden" id="VIdf" name="historySearch.VId" value="${historySearch.VId}" />
<input type="hidden" id="VNamef" name="historySearch.VName" value="${historySearch.VName}" />
<input type="hidden" id="ILevelf" name="historySearch.ILevel" value="0" />
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
