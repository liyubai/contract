<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员执照升级历史信息查询</title>

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
		var VDengji = document.getElementsByName("VDengji");
		var VDengjis = ",";
		for(i=0; i<VDengji.length; i++){
			if(VDengji[i].checked == true){
				VDengjis += VDengji[i].value+",";
			}
		}
		var VJyzzlx = document.getElementsByName("VJyzzlx");
		var VJyzzlxs = ",";
		for(i=0; i<VJyzzlx.length; i++){
			if(VJyzzlx[i].checked == true){
				VJyzzlxs += VJyzzlx[i].value+",";
			}
		}
		var VZzlx = document.getElementsByName("VZzlx");
		var VZzlxs = ",";
		for(i=0; i<VZzlx.length; i++){
			if(VZzlx[i].checked == true){
				VZzlxs += VZzlx[i].value+",";
			}
		}
		var VYbdj = document.getElementsByName("VYbdj");
		var VYbdjs = ",";
		for(i=0; i<VYbdj.length; i++){
			if(VYbdj[i].checked == true){
				VYbdjs += VYbdj[i].value+",";
			}
		}
		var VFjjbdj = document.getElementsByName("VFjjbdj");
		var VFjjbdjs = ",";
		for(i=0; i<VFjjbdj.length; i++){
			if(VFjjbdj[i].checked == true){
				VFjjbdjs += VFjjbdj[i].value+",";
			}
		}
		var VHkqlb = document.getElementsByName("VHkqlb");
		var VHkqlbs = ",";
		for(i=0; i<VHkqlb.length; i++){
			if(VHkqlb[i].checked == true){
				VHkqlbs += VHkqlb[i].value+",";
			}
		}
		var VHkqdj = document.getElementsByName("VHkqdj");
		var VHkqdjs = ",";
		for(i=0; i<VHkqdj.length; i++){
			if(VHkqdj[i].checked == true){
				VHkqdjs += VHkqdj[i].value+",";
			}
		}
		var VXyjdj = document.getElementsByName("VXyjdj");
		var VXyjdjs = ",";
		for(i=0; i<VXyjdj.length; i++){
			if(VXyjdj[i].checked == true){
				VXyjdjs += VXyjdj[i].value+",";
			}
		}
		var VYszzdj = document.getElementsByName("VYszzdj");
		var VYszzdjs = ",";
		for(i=0; i<VYszzdj.length; i++){
			if(VYszzdj[i].checked == true){
				VYszzdjs += VYszzdj[i].value+",";
			}
		}
		$("#deptNamef").val($("#deptName").val());
		$("#VIdf").val($("#VId").val());
		$("#VNamef").val($("#VName").val());
		$("#VCardidf").val($("#VCardid").val());
		$("#DEffectdatef").val($("#DEffectdate").val());
		$("#DEffectdate1f").val($("#DEffectdate1").val());
		$("#VIssuerf").val($("#VIssuer").val());
		$("#VCompanyf").val($("#VCompany").val());
		$("#DIssuetimef").val($("#DIssuetime").val());
		$("#DUpdatedatef").val($("#DUpdatedate").val());
		$("#DIssuetime1f").val($("#DIssuetime1").val());
		$("#DUpdatedate1f").val($("#DUpdatedate1").val());
		$("#VHgzf").val($("#VHgz").val());
		$("#IJiankongf").val($("#IJiankong").val());
		$("#VXingzhif").val($("#VXingzhi").val());
		$("#VDengjif").val(VDengjis);
		$("#VJyzzlxf").val(VJyzzlxs);
		$("#VZzlxf").val(VZzlxs);
		$("#VYbdjf").val(VYbdjs);
		$("#VFjjbdjf").val(VFjjbdjs);
		$("#VHkqlbf").val(VHkqlbs);
		$("#VHkqdjf").val(VHkqdjs);
		$("#VXyjdjf").val(VXyjdjs);
		$("#VYszzdjf").val(VYszzdjs);
		$("#peopleForm").submit();
	});
	
	 //取消，返回列表页
	$("#modalDialogButton2").click(function(){
	    $("#searchForm").submit();
	});
	//保存
	$("#modalDialogButton3").click(function(){
		var VDengji = document.getElementsByName("VDengji");
		var VDengjis = ",";
		for(i=0; i<VDengji.length; i++){
			if(VDengji[i].checked == true){
				VDengjis += VDengji[i].value+",";
			}
		}
		var VJyzzlx = document.getElementsByName("VJyzzlx");
		var VJyzzlxs = ",";
		for(i=0; i<VJyzzlx.length; i++){
			if(VJyzzlx[i].checked == true){
				VJyzzlxs += VJyzzlx[i].value+",";
			}
		}
		var VZzlx = document.getElementsByName("VZzlx");
		var VZzlxs = ",";
		for(i=0; i<VZzlx.length; i++){
			if(VZzlx[i].checked == true){
				VZzlxs += VZzlx[i].value+",";
			}
		}
		var VYbdj = document.getElementsByName("VYbdj");
		var VYbdjs = ",";
		for(i=0; i<VYbdj.length; i++){
			if(VYbdj[i].checked == true){
				VYbdjs += VYbdj[i].value+",";
			}
		}
		var VFjjbdj = document.getElementsByName("VFjjbdj");
		var VFjjbdjs = ",";
		for(i=0; i<VFjjbdj.length; i++){
			if(VFjjbdj[i].checked == true){
				VFjjbdjs += VFjjbdj[i].value+",";
			}
		}
		var VHkqlb = document.getElementsByName("VHkqlb");
		var VHkqlbs = ",";
		for(i=0; i<VHkqlb.length; i++){
			if(VHkqlb[i].checked == true){
				VHkqlbs += VHkqlb[i].value+",";
			}
		}
		var VHkqdj = document.getElementsByName("VHkqdj");
		var VHkqdjs = ",";
		for(i=0; i<VHkqdj.length; i++){
			if(VHkqdj[i].checked == true){
				VHkqdjs += VHkqdj[i].value+",";
			}
		}
		var VXyjdj = document.getElementsByName("VXyjdj");
		var VXyjdjs = ",";
		for(i=0; i<VXyjdj.length; i++){
			if(VXyjdj[i].checked == true){
				VXyjdjs += VXyjdj[i].value+",";
			}
		}
		var VYszzdj = document.getElementsByName("VYszzdj");
		var VYszzdjs = ",";
		for(i=0; i<VYszzdj.length; i++){
			if(VYszzdj[i].checked == true){
				VYszzdjs += VYszzdj[i].value+",";
			}
		}
		$("#deptNamef").val($("#deptName").val());
		$("#VIdf").val($("#VId").val());
		$("#VNamef").val($("#VName").val());
		$("#VCardidf").val($("#VCardid").val());
		$("#DEffectdatef").val($("#DEffectdate").val());
		$("#DEffectdate1f").val($("#DEffectdate1").val());
		$("#VIssuerf").val($("#VIssuer").val());
		$("#VCompanyf").val($("#VCompany").val());
		$("#DIssuetimef").val($("#DIssuetime").val());
		$("#DUpdatedatef").val($("#DUpdatedate").val());
		$("#DIssuetime1f").val($("#DIssuetime1").val());
		$("#DUpdatedate1f").val($("#DUpdatedate1").val());
		$("#VHgzf").val($("#VHgz").val());
		$("#IJiankongf").val($("#IJiankong").val());
		$("#VXingzhif").val($("#VXingzhi").val());
		$("#VDengjif").val(VDengjis);
		$("#VJyzzlxf").val(VJyzzlxs);
		$("#VZzlxf").val(VZzlxs);
		$("#VYbdjf").val(VYbdjs);
		$("#VFjjbdjf").val(VFjjbdjs);
		$("#VHkqlbf").val(VHkqlbs);
		$("#VHkqdjf").val(VHkqdjs);
		$("#VXyjdjf").val(VXyjdjs);
		$("#VYszzdjf").val(VYszzdjs);
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
	<div class="panelHead"><span>执照升级历史查询</span></div>
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
				<td>执照编号：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VCardid" name="teacherZz.VCardid" value="" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td>有效（开始）日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DEffectdate" name="teacherZz.DEffectdate" value="" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td>有效（截至）日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DEffectdate1" name="teacherZz.DEffectdate" value="" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>局长授权签发：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VIssuer" name="teacherZz.VIssuer" value="" maxlength="20" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td>签发单位：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VCompany" name="teacherZz.VCompany" value="" maxlength="100" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td>签发（开始）时间：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DIssuetime" name="teacherZz.DIssuetime" value="" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>签发（截至）时间：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DIssuetime1" name="teacherZz.DIssuetime" value="" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td>更新（开始）时间：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DUpdatedate" name="teacherZz.DUpdatedate" value="" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td>更新（截至）时间：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="DUpdatedate1" name="teacherZz.DUpdatedate" value="" class="text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>合格证：</td>
				<td width="180">
					<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="1"><span class="ui-icon ui-icon-bullet"></span>学员合格证</a></li>
							<li><a href="#N" val="2">教员合格证</a></li>
						</ul>
						<input type="hidden" id="IHgz" name="teacherZz.IHgz" value="" />
					</div>
				</td>
				<td>是否监控：</td>
				<td width="180">
					<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="1"><span class="ui-icon ui-icon-bullet"></span>监控</a></li>
							<li><a href="#N" val="2">不监控</a></li>
						</ul>
						<input type="hidden" id="IJiankong" name="teacherZz.IJiankong" value="" />
					</div>
				</td>
				<td>执照性质：</td>
				<td width="180">
					<div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="正式执照"><span class="ui-icon ui-icon-bullet"></span>正式执照</a></li>
							<li><a href="#N" val="临时执照">临时执照</a></li>
						</ul>
						<input type="hidden" id="VXingzhi" name="teacherZz.VXingzhi" value="" />
					</div>
				</td>
				</tr>
				<tr class="normal">
				<td>教员执照等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="jyzzDjList">
						<input type="checkbox" name="VDengji" value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>教员执照类型：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="jyzzLxList">
							<input type="checkbox" name="VJyzzlx" value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>执照类型：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="zzLxList">
						<input type="checkbox" name="VZzlx" value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>仪表等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="ybDjList">
						<input type="checkbox" name="VYbdj" value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>飞机级别等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="fjJbList">
						<input type="checkbox" name="VFjjbdj" value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>航空器类别：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="hkqLbList">
						<input type="checkbox" name="VHkqlb" value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>航空器型别等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="hkqXbList">
						<input type="checkbox" name="VHkqdj" value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td>旋翼机级别等级：</td>
				<td colspan="5">
				<div style="margin-top:5px;">
					<s:iterator value="xyjJbList">
						<input type="checkbox" name="VXyjdj" value="${VId}"/><b></b>${VName}　
					</s:iterator>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td colspan="2" width="160">运输航空公司飞行教员执照等级：</td>
				<td colspan="4">
				<div style="margin-top:5px;">
					<s:iterator value="ysHkgsList">
						<input type="checkbox" name="VYszzdj" value="${VId}"/><b></b>${VName}　
					</s:iterator>
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

<form id="peopleForm" action="searchZzHistoryListTeacherAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
<input type="hidden" id="VIdf" name="vteacherZz.VId" />
<input type="hidden" id="VNamef" name="vteacherZz.VName" />
<input type="hidden" id="deptNamef" name="vteacherZz.deptName" />
<input type="hidden" id="VCardidf" name="vteacherZz.VCardid" />
<input type="hidden" id="DEffectdatef" name="vteacherZz.DEffectdate" />
<input type="hidden" id="DEffectdate1f" name="vteacherZz.DEffectdate1" />
<input type="hidden" id="VIssuerf" name="vteacherZz.VIssuer"/>
<input type="hidden" id="VCompanyf" name="vteacherZz.VCompany" />
<input type="hidden" id="DIssuetimef" name="vteacherZz.DIssuetime" />
<input type="hidden" id="DUpdatedatef" name="vteacherZz.DUpdatedate" />
<input type="hidden" id="DIssuetime1f" name="vteacherZz.DIssuetime1" />
<input type="hidden" id="DUpdatedate1f" name="vteacherZz.DUpdatedate1" />
<input type="hidden" id="VHgzf" name="vteacherZz.IHgz" />
<input type="hidden" id="IJiankongf" name="vteacherZz.IJiankong" />
<input type="hidden" id="VXingzhif" name="vteacherZz.VXingzhi" />
<input type="hidden" id="VDengjif" name="vteacherZz.VDengji" />
<input type="hidden" id="VJyzzlxf" name="vteacherZz.VJyzzlx" />
<input type="hidden" id="VZzlxf" name="vteacherZz.VZzlx" />
<input type="hidden" id="VYbdjf" name="vteacherZz.VYbdj" />
<input type="hidden" id="VFjjbdjf" name="vteacherZz.VFjjbdj"/>
<input type="hidden" id="VHkqlbf" name="vteacherZz.VHkqlb" />
<input type="hidden" id="VHkqdjf" name="vteacherZz.VHkqdj" />
<input type="hidden" id="VXyjdjf" name="vteacherZz.VXyjdj" />
<input type="hidden" id="VYszzdjf" name="vteacherZz.VYszzdj" />
</form>
<input type="hidden" id="tjId" value="${tjId}" />
</body>
</html>
