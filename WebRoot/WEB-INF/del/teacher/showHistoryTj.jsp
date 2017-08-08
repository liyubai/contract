<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员体检历史信息</title>

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
		<li class="active" style="cursor:default"><a href="searchTjListTeacherAction.do">教员体检信息管理</a></li>
		<li><a href="searchZzListTeacherAction.do">教员执照信息管理</a></li>
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
	<div class="panelHead"><span>查看教员体检历史信息</span></div>
	<div class="panelContent">
	<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="50"></td>
				<td>姓名：</td>
				<td width="180">
					${historytj.teacherBaseInfo.VName}
				</td>
				<td width="80"></td>
				<td>编号：</td>
				<td width="180">
					${historytj.teacherBaseInfo.VCode}
				</td>
				<td width="40"></td>
				<td>所在部门：</td>
				<td width="240">
					${historytj.teacherBaseInfo.TOrg.VName}
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 30px;">
			<table>
				<tr>
				<td width="14"></td>
				<td>合格证等级：</td>
				<td width="180">
				<div class="dropDownList">
					<button>一级</button>
					<ul>
						<li><a href="#N" val="1"><span class="ui-icon ui-icon-bullet"></span>一级</a></li>
						<li><a href="#N" val="2">二级</a></li>
					</ul>
					<input type="hidden" id="ILevel" name="teachertj.ILevel" value="${historytj.ILevel}" />
				</div>
				</td>
				<td width="80"></td>
				<td>国籍：</td>
				<td width="180">
					${historytj.VNation}
				</td>
				<td width="64"></td>
				<td>限制：</td>
				<td width="240">
					<textarea  id="VLimit"  style="width:240px;height:50px;" class="text ui-widget-content ui-corner-all">${historytj.VLimit}</textarea>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="26"></td>
				<td>结论日期：</td>
				<td width="180">
					<s:date name="historytj.DResultdate" format="yyyy-MM-dd" />
				</td>
				<td width="56"></td>
				<td>主检医生：</td>
				<td width="180">
					${historytj.VDoctor}
				</td>
				<td width="52"></td>
				<td>签发人：</td>
				<td width="180">
					${historytj.VIssuer}
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="26"></td>
				<td>发证日期：</td>
				<td width="180">
					<s:date name="historytj.DIssueTime" format="yyyy-MM-dd" />
				</td>
				<td width="68"></td>
				<td>有效期：</td>
				<td width="180">
					<s:date name="historytj.DUsedTime" format="yyyy-MM-dd" />
				</td>
				<td width="40"></td>
				<td>发证单位：</td>
				<td width="180">
					${historytj.VCompany}
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="38"></td>
				<td>创建人：</td>
				<td width="180">
					${historytj.TUser.VUsername}
				</td>
				<td width="56"></td>
				<td>创建时间：</td>
				<td width="180">
					<s:date name="historytj.DCreatedate" format="yyyy-MM-dd HH:mm:ss" />
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



<form id="searchForm" action="searchTjHistoryListTeacherAction.do" method="post">
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

</body>
</html>
