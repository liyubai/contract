<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员执照升级历史信息</title>

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
	<div class="panelHead"><span>查看执照升级历史信息</span></div>
	<div class="panelContent">
	<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="60"></td>
				<td>姓名：</td>
				<td width="180">
					${tlsu.teacherBaseInfo.VName}
				</td>
				<td width="140"></td>
				<td>编号：</td>
				<td width="180">
					${tlsu.teacherBaseInfo.VCode}
				</td>
				<td width="40"></td>
				<td>所在部门：</td>
				<td width="240">
					${tlsu.teacherBaseInfo.TOrg.VName}
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 30px;">
			<table>
				<tr>
				<td width="47"></td>
				<td>执照号：</td>
				<td width="180">
					${tlsu.VCardid}
				</td>
				<td width="128"></td>
				<td>有效期：</td>
				<td width="180">
					<s:date name="tlsu.DEffectdate" format="yyyy-MM-dd" />
				</td>
				<td width="17"></td>
				<td>局长授权签发：</td>
				<td width="240">
					${tlsu.VIssuer}
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="35"></td>
				<td>签发单位：</td>
				<td width="180">
					${tlsu.VQfdw}
				</td>
				<td width="120"></td>
				<td>签发时间：</td>
				<td width="180">
					<s:date name="tlsu.DQfsj" format="yyyy-MM-dd" />
				</td>
				<td width="35"></td>
				<td>更新日期：</td>
				<td width="180">
					<s:date name="tlsu.DUpdatedate" format="yyyy-MM-dd" />
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="35"></td>
				<td>执照性质：</td>
				<td width="180">
					${tlsu.VXingzhi}
				</td>
				<td width="60"></td>
				<td>上一次熟练检查时间：</td>
				<td width="180">
					<s:date name="tlsu.DLastchecktime" format="yyyy-MM-dd" />
				</td>
				<td width="12"></td>
				<td>定期检查时间：</td>
				<td width="180">
					<s:date name="tlsu.DChecktime" format="yyyy-MM-dd" />
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="13"></td>
				<td>实践考试时间：</td>
				<td width="180">
					<s:date name="tlsu.DExamtime" format="yyyy-MM-dd" />
				</td>
				<td width="60"></td>
				<td>下一次熟练检查时间：</td>
				<td width="180">
					<s:date name="tlsu.DNextchecktime" format="yyyy-MM-dd" />
				</td>
				<td width="45"></td>
				<td>合格证：</td>
				<td width="180">
					<s:if test="tlsu.IHgz==1">学员合格证</s:if><s:elseif test="tlsu.IHgz==2">教员合格证</s:elseif>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="37"></td>
				<td>是否监控：</td>
				<td width="180">
					<s:if test="tlsu.IJiankong==1">监控</s:if><s:elseif test="tlsu.IJiankong==2">不监控</s:elseif>
				</td>
				<td width="128"></td>
				<td>创建人：</td>
				<td width="180">
					${tlsu.TUser.VUsername}
				</td>
				<td width="38"></td>
				<td>创建时间：</td>
				<td width="180">
					<s:date name="tlsu.DCreatedate" format="yyyy-MM-dd HH:mm:ss" />
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="37"></td>
				<td>执照类型：</td>
				<td>
					<s:iterator value="zzLxList">
						<s:if test="(tlsu.VZzlx).contains(VId)">${VName}</s:if>&nbsp;&nbsp;
					</s:iterator>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="13"></td>
				<td>教员执照类型：</td>
				<td>
					<s:iterator value="jyzzLxList">
						<s:if test="(tlsu.VJyzzlx).contains(VId)">${VName}</s:if>&nbsp;&nbsp;
					</s:iterator>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="13"></td>
				<td>教员执照等级：</td>
				<td>
					<s:iterator value="jyzzDjList">
						<s:if test="(tlsu.VDengji).contains(VId)">${VName}</s:if>&nbsp;&nbsp;
					</s:iterator>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="13"></td>
				<td>飞机级别等级：</td>
				<td>
					<s:iterator value="fjJbList">
						<s:if test="(tlsu.VFjjbdj).contains(VId)">${VName}</s:if>&nbsp;&nbsp;
					</s:iterator>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="35"></td>
				<td>仪表等级：</td>
				<td>
					<s:iterator value="ybDjList">
						<s:if test="(tlsu.VYbdj).contains(VId)">${VName}</s:if>&nbsp;&nbsp;
					</s:iterator>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="24"></td>
				<td>航空器类别：</td>
				<td>
					<s:iterator value="hkqLbList">
						<s:if test="(tlsu.VHkqlb).contains(VId)">${VName}</s:if>&nbsp;&nbsp;
					</s:iterator>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="0"></td>
				<td>航空器型别等级：</td>
				<td>
					<s:iterator value="hkqXbList">
						<s:if test="(tlsu.VHkqdj).contains(VId)">${VName}</s:if>&nbsp;&nbsp;
					</s:iterator>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="0"></td>
				<td>旋翼机级别等级：</td>
				<td>
					<s:iterator value="xyjJbList">
						<s:if test="(tlsu.VXyjdj).contains(VId)">${VName}</s:if>&nbsp;&nbsp;
					</s:iterator>
				</td>
				</tr>
			</table>
		</div>
<span class="panelLine"></span>
		<div class="panelFull" style="height: 10px;">
			<table>
				<tr>
				<td width="0"></td>
				<td>运输航空公司飞行教员执照等级：</td>
				<td>
					<s:iterator value="ysHkgsList">
						<s:if test="(tlsu.VYszzdj).contains(VId)">${VName}</s:if>&nbsp;&nbsp;
					</s:iterator>
				</td>
				</tr>
			</table>
		</div>
	</div>

</div>
</div></div>



<form id="searchForm" action="searchZzHistoryListTeacherAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
<input type="hidden" id="VIdf" name="vteacherZz.VId" value="${vteacherZz.VId}" />
<input type="hidden" id="VNamef" name="vteacherZz.VName" value="${vteacherZz.VName}" />
<input type="hidden" id="deptNamef" name="vteacherZz.deptName" value="${vteacherZz.deptName}" />
<input type="hidden" id="VCardidf" name="vteacherZz.VCardid" value="${vteacherZz.VCardid}" />
<input type="hidden" id="DEffectdatef" name="vteacherZz.DEffectdate" value="${vteacherZz.DEffectdate}" />
<input type="hidden" id="VIssuerf" name="vteacherZz.VIssuer" value="${vteacherZz.VIssuer}"/>
<input type="hidden" id="VCompanyf" name="vteacherZz.VCompany" value="${vteacherZz.VCompany}" />
<input type="hidden" id="DIssuetimef" name="vteacherZz.DIssuetime" value="${vteacherZz.DIssuetime}" />
<input type="hidden" id="DUpdatedatef" name="vteacherZz.DUpdatedate" value="${vteacherZz.DUpdatedate}" />
<input type="hidden" id="VHgzf" name="vteacherZz.IHgz" value="${vteacherZz.IHgz}" />
<input type="hidden" id="IJiankongf" name="vteacherZz.IJiankong" value="${vteacherZz.IJiankong}" />
<input type="hidden" id="VXingzhif" name="vteacherZz.VXingzhi" value="${vteacherZz.VXingzhi}" />
<input type="hidden" id="VDengjif" name="vteacherZz.VDengji" value="${vteacherZz.VDengji}" />
<input type="hidden" id="VJyzzlxf" name="vteacherZz.VJyzzlx" value="${vteacherZz.VJyzzlx}" />
<input type="hidden" id="VZzlxf" name="vteacherZz.VZzlx" value="${vteacherZz.VZzlx}" />
<input type="hidden" id="VYbdjf" name="vteacherZz.VYbdj" value="${vteacherZz.VYbdj}" />
<input type="hidden" id="VFjjbdjf" name="vteacherZz.VFjjbdj" value="${vteacherZz.VFjjbdj}"/>
<input type="hidden" id="VHkqlbf" name="vteacherZz.VHkqlb" value="${vteacherZz.VHkqlb}" />
<input type="hidden" id="VHkqdjf" name="vteacherZz.VHkqdj" value="${vteacherZz.VHkqdj}" />
<input type="hidden" id="VXyjdjf" name="vteacherZz.VXyjdj" value="${vteacherZz.VXyjdj}" />
<input type="hidden" id="VYszzdjf" name="vteacherZz.VYszzdj" value="${vteacherZz.VYszzdj}" />
</form>

</body>
</html>
