<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员执照列表管理</title>

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
<script src="scripts/ui/jquery.ui.progressbar.min.js"></script>
<script src="scripts/function.min.js"></script>
<!-- 树形相关开始-->
<link rel="STYLESHEET" type="text/css" href="../codebase/dhtmlxtree.css">
<script src="../codebase/dhtmlxcommon.js"></script>
<script src="../codebase/dhtmlxtree.js"></script>
<!-- 树形相关结束-->
<style>
.tdb{border-bottom: solid 0px}
#rightPartC > div {
	min-width: 820px;
}
</style>
<script>
A_WIDTH=200; //注意，不要写成var A_WIDTH，这个值已经在function.js中定义好了，只需要重新赋值
C_WIDTH=250; //注意，不要写成var C_WIDTH，这个值已经在function.js中定义好了，只需要重新赋
$(function() {

     //新建执照信息
	$("#modalDialogButton1").click(function(){
		var count =0;
		var id="";
		var r1 = document.getElementsByName('contractIdList');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				count++;
				id = r1[i].value;
			}
		}

		if(count==0 || id==""){
			$("#dialogForm3Warning").html("<br/>请选择一个教员来添加执照信息！"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		if(id.split(",")[1]!=""){
			$("#dialogForm3Warning").html("选中的教员已经有执照信息，不能再次添加。"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#tjid").val("tjid");
		$("#showPeople").val("");
		$("#peopleId").val(id);
		var deptid = tree.getSelectedItemId();
		$("#deptId").val(deptid);
		
		$( "#dialogFormNewPeople" ).submit();
		
	});
     
      //执照检查信息
	$("#modalDialogButton7").click(function(){
		var count =0;
		var id="";
		var r1 = document.getElementsByName('contractIdList');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				count++;
				id = r1[i].value;
			}
		}
		if(count==0 || id==""){
			$("#dialogForm3Warning").html("<br/>请选择教员的执照添加检查信息。"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		if(id.split(",")[1]==""){
			$("#dialogForm3Warning").html("选中的教员没有执照信息，不能添加检查信息。"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#peopleIdss").val(id);
		var deptid = tree.getSelectedItemId();
		$("#deptIdss").val(deptid);
		
		$( "#dialogFormNewPeoples" ).submit();
		
	});
	
	$("#modalDialogButton3").click(function(){//刷新
		$("#searchKey").val("");
		gotoPage(1);
		$("#peopleName").val("教员姓名");
	});
	
	$("#modalDialogButton4").click(function(){//查询
		if($("#peopleName").val()=="教员姓名"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($("#peopleName").val());
		}
		//$("#VParentid").val("");
		//$( "#searchForm" ).submit();
		gotoPage(1);
	});
	
	$("#modalDialogButton5").click(function(){//升级执照信息
		var count =0;
		var id="";
		var r1 = document.getElementsByName('contractIdList');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				count++;
				id = r1[i].value;
			}
		}
		if(count==0 || id==""){
			$("#dialogForm3Warning").html("<br/>请选择要升级执照的人员！"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
				
		if(id.split(",")[1]==""){
			$("#dialogForm3Warning").html("<br/>选中的教员没有执照信息，不能升级执照。"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		var deptid = tree.getSelectedItemId();
		var deptname = tree.getSelectedItemText();
		$("#deptIdup").val(deptid);
		$("#tjidup").val("1");
		$("#peopleIdup").val(id);
		$("#showPeopleup").val("");
		$( "#dialogFormNewPeopleUp" ).submit();
		
	});
	
	$("#modalDialogButton6").click(function(){//历史执照

		var id="";
		var r1 = document.getElementsByName('contractIdList');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				id = r1[i].value;
			}
		}
		if(id==""){
			$("#dialogForm3Warning").html("<br/>请选择教员查看历史执照。"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
				
		if(id.split(",")[1]==""){
			$("#dialogForm3Warning").html("<br/>选中的教员没有执照信息，不存在历史执照。"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}

		$("#hisid").val(id.split(",")[0]);
		var deptid = tree.getSelectedItemId();
		$("#depthistory").val(deptid);
		$( "#searchHistory" ).submit();
	});
	

	$( "#dialogForm3" ).dialog({//警告信息窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#dialogForm4" ).dialog({//操作数据库返回提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
	$( "#dialogContent" ).dialog({//内容窗口
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"检查信息": function() {
				if($("#ischeck").val()>0){
					showCheckMsg($("#teaid").val());
				}else{
					alert("该执照无检查信息。");
				}
				$( this ).dialog( "close" );
			},
			"关 闭": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#checkContent" ).dialog({
		autoOpen: false,
		height: 480,
		width: 660,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
});

function editinfo(id){
	$("#tjid").val("");
	$("#showPeople").val("");
	$("#peopleId").val(id);
	var deptid = tree.getSelectedItemId();
	$("#deptId").val(deptid);
	
	$( "#dialogFormNewPeople" ).submit();
}

//查看人员信息
function showPeopleMsg(id,ischeck){

	if(id==""){
		return;	
	}
	$("#ischeck").val(ischeck);
	$("#teaid").val(id);
	params = {"id":id};
	$.ajax({
		type:"post",
		url:"showMessageZzTeacherAjaxAction.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
			$("#contentid").html(getContent(data));
			$("#dialogContent").dialog('option', 'title',  "所选教员："+data.teacherBaseInfo);
			$( "#dialogContent" ).dialog( "open" );
		}, 
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}
function getContent(data){
	var content = "";
	var yxq = "";
	var qfsj = "";
	var gxsj = "";
	var hgz = "";
	var sfjk = "";
	if(data.DEffectdate != null && data.DEffectdate != "" && data.DEffectdate != "null"){
		yxq = (new Date(data.DEffectdate)).dateformat("yyyy-MM-dd");
	}
	if(data.DIssuetime != null && data.DIssuetime != "" && data.DIssuetime != "null"){
		qfsj = (new Date(data.DIssuetime)).dateformat("yyyy-MM-dd");
	}
	if(data.DUpdatedate != null && data.DUpdatedate != "" && data.DUpdatedate != "null"){
		gxsj = (new Date(data.DUpdatedate)).dateformat("yyyy-MM-dd");
	}
	if(data.IHgz == 1){
		hgz = "学员合格证";
	}else if(data.IHgz == 2){
		hgz = "教员合格证";
	}
	if(data.IJiankong == 1){
		sfjk = "监控";
	}else if(data.IJiankong == 2){
		sfjk = "不监控";
	}
	content+="<tr>";
	content+="<td width='80'>教员姓名：</td>";
	content+="<td width='140' height=\"24\">"+data.teacherBaseInfo+"</td>";
	content+="<td width='80'>教员编号：</td>";
	content+="<td width='140' height=\"24\">"+data.teacherCode+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>所在部门：</td>";
	content+="<td height=\"24\">"+data.deptName+"</td>";
	content+="<td>执照编号：</td>";
	content+="<td height=\"24\">"+data.VCardid+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>有效期：</td>";
	content+="<td height=\"24\">"+yxq+"</td>";
	content+="<td>局长授权签发：</td>";
	var jzsq = "";
	if(data.VIssuer != null && data.VIssuer != "null"){
		jzsq = data.VIssuer;
	}
	content+="<td height=\"24\">"+jzsq+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>签发单位：</td>";
	var qfdw = "";
	if(data.VCompany != null && data.VCompany != "null"){
		qfdw = data.VCompany;
	}
	content+="<td height=\"24\">"+qfdw+"</td>";
	content+="<td>签发时间：</td>";
	content+="<td height=\"24\">"+qfsj+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>更新时间：</td>";
	content+="<td height=\"24\">"+gxsj+"</td>";
	content+="<td>合格证：</td>";
	content+="<td height=\"24\">"+hgz+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>是否监控：</td>";
	content+="<td height=\"24\">"+sfjk+"</td>";
	content+="<td>执照性质：</td>";
	var zzxz = "";
	if(data.VXingzhi != null && data.VXingzhi != "null"){
		zzxz = data.VXingzhi;
	}
	content+="<td height=\"24\">"+zzxz+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>教员执照等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VDengji+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>教员执照类型：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VJyzzlx+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>执照类型：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VZzlx+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>仪表等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VYbdj+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>飞机级别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VFjjbdj+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>航空器类别：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VHkqlb+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>航空器型别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VHkqdj+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>旋翼机级别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VXyjdj+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"2\">运输航空公司飞行教员执照等级：</td>";
	content+="<td colspan=\"2\" height=\"24\">"+data.VYszzdj+"</td>";
	content+="</tr>"
	
	return content;
}
function showCheckMsg(id){//显示检查信息

	if(id==null)
		return;
		
	params = {"id":id};

	$.ajax({
		type:"post",
		url:"showTeaLicenseCheckList.do",
		data:params,
		dataType:"json",
		success:function(data){

			var ht = "";
			var vday = "";
			var img = "";
			var col = "";
			for(var i=0;i<data.length;i++){

				if(data[i].iday<=31){
					col = "#FF0000";
					img = " <img src=\"themes/cupertino/images/top1.gif\"  align=\"absmiddle\"/>";
				}else if(31<data[i].iday && data[i].iday<=61){
					img = " <img src=\"themes/cupertino/images/top2.gif\"  align=\"absmiddle\"/>";
					col = "#EBA600";
				}else if(61<data[i].iday && data[i].iday<=90){
					img = " <img src=\"themes/cupertino/images/top3.gif\"  align=\"absmiddle\"/>";
					col = "#00A2BE";
				}else{
					img = "";
					col = "#000000";
				}
				vday = data[i].iday + img;
				ht+="<tr>"+
				"<td>"+data[i].viewDCheckdate+"</td>"+
				"<td>"+data[i].typeName+"</td>"+
				"<td>"+data[i].VFlyform+"</td>"+
				"<td>"+data[i].VCheckteacher+"</td>"+
				"<td>"+data[i].viewDEffectdate+"</td>"+
				"<td>&nbsp;&nbsp;&nbsp;&nbsp;<font color="+col+">"+vday+"</font></td>"+
				"</tr>";
			}
			$("#checkContentid").html(ht);

		},
		error:function(){
			alert("数据库连接错误，获取部门失败，请重试！");
			return;
		}
	});
	$( "#checkContent" ).dialog( "open" );
}
$(document).ready(function() {
	gotoPage(1);
});
</script>

<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>

</head>
<body class="hide">
<div id="leftPartA"><div>
<s:action name="open_leftList" executeResult="true">
<s:param name="parentid">4028816a4714304c0147149e89190004</s:param>
<s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
</s:action>
</div></div>

<div id="leftPartC"><div>

<div id="treeboxbox_tree"></div>

</div></div>

<div id="rightPartC"><div>
<div class="panelBox buttonBox">
<%request.setAttribute("k",ActionContext.getContext().getName());%>
<s:if test="#session.loginContext.urlAddress=='all'">
	<s:set name="r" value="0"/>
</s:if>
<s:else>
	<s:set name="pos" value="#session.loginContext.urlAddress.indexOf(#request.k+'.do')"/>
	<s:if test='#pos==-1'>
		<s:set name="r" value="1"/>
    </s:if>
    <s:else>
		<s:set name="r" value="#session.loginContext.urlAddress.substring(#pos+#request.k.length()+6,#pos+#request.k.length()+7)"/>
    </s:else>
</s:else>
<s:if test="#r==null || #r==0">
	<button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">添加执照</button> 
    <button class="green" id="modalDialogButton7" primary="ui-icon-button-addnew">添加检查信息</button>
    <button class="green" id="modalDialogButton5">升级执照</button>
    <button class="green" id="modalDialogButton6">历史执照</button>
</s:if>
	<button class="normal" id="modalDialogButton3">全部</button>
    <div class="buttonInput relative left" width="160" height="28">
     <input id="peopleName" name="peopleName"  type="text" maxlength="50" title="教员姓名" value="教员姓名" /><button id="modalDialogButton4">查询</button>
    </div>

</div>


<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="20"></th>
				<th width="72"></th>
				<th width="145"></th>
				<th width="90"></th>
				<th width="90"></th>
				<th width="100"></th>
                <th width="88"></th>
                <th width="88"></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"></th>
				<th class="thSortableGray">姓名</th>
				<th class="thSortableGray">执照编号</th>
				<th class="thSortableGray">签发日期</th>
				<th class="thSortableGray">到期日期</th>
				<th class="thSortableGray">剩余有效期(天)</th>
				<th class="thSortableGray">上一次<br/>熟练检查日期</th>
                <th class="thSortableGray">下一次<br/>熟练检查日期</th>
                <th class="thSortableGray"></th>
			  </tr>
			</thead>
			<tbody id="searchPage">
		
			</tbody>
		</table>

</div>
</div>
</div>
</div>


<div id="dialogForm3">

<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
<div class="panelRight" style="margin-left: 75px;">
    <span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span>
</div>
</div>

<div id="dialogForm4">
<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
<div class="panelRight" style="margin-left: 75px;">
<span style="font-size: 14px; font-weight: bold; color: #555555; " id="dialogForm4Span"></span>
</div>
</div>

<div id="dialogContent"  title="查看教员执照信息">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
    <tbody id="contentid">
    </tbody>
    </table>
</div>

<div id="checkContent"  title="执照检查信息">
<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
<thead>
<tr class="trSpliter">
<th width="90"></th>
<th width="90"></th>
<th width="90"></th>
<th width="90"></th>
<th width="90"></th>
<th width="100"></th>
</tr>
<tr>
<th class="thSortableGray">检查日期</th>
<th class="thSortableGray">检查类型</th>
<th class="thSortableGray">航空器编号</th>
<th class="thSortableGray">检查教员</th>
<th class="thSortableGray">到期日期</th>
<th class="thSortableGray">剩余有效期(天)</th>

</tr>
</thead>
<tbody id="checkContentid">
</tbody>
</table>
</div>

<!-- 教员执照信息管理 -->
<form id="dialogFormNewPeople" action="toAddOrUpZzTeacherAction.do" method="post">
	<input type="hidden" id="peopleId" name="id"/>
	<input type="hidden" id="tjid" name="tjId"/>
	<input type="hidden" id="deptId" name="deptId"/>
	<input type="hidden" id="showPeople" name="showPeople"/>
	<input type="hidden" name="key" value="${key}"/>
</form>
<!-- 教员执照升级信息管理 -->
<form id="dialogFormNewPeopleUp" action="toUpZzTeacherAction.do" method="post">
	<input type="hidden" id="peopleIdup" name="id"/>
	<input type="hidden" id="tjidup" name="tjId"/>
	<input type="hidden" id="deptIdup" name="deptId"/>
	<input type="hidden" id="showPeopleup" name="showPeople"/>
	<input type="hidden" name="key" value="${key}"/>
</form>
<!-- 教员执照检查信息管理 -->
<form id="dialogFormNewPeoples" action="toAddOrUpZzJcTeacherAction.do" method="post">
	<input type="hidden" id="peopleIdss" name="id"/>
	<input type="hidden" id="deptIdss" name="deptId"/>
	<input type="hidden" name="key" value="${key}"/>
</form>

<form  action="searchZzListTeacherAction.do" method="post" id="searchForm">
  <input name="key" type="hidden" id="searchKey">
</form>

<form  action="searchZzHistoryTeacherById.do" method="post" id="searchHistory">
  <input type="hidden" id="depthistory" name="deptId"/>
  <input type="hidden" id="hisid" name="id"/>
  <input type="hidden" name="key" value="${key}"/>
</form>

<form  action="searchZzJcHistoryTeacherAction.do" method="post" id="searchJcHistory">
  <input type="hidden" id="depthistory" name="deptId"/>
  <input type="hidden" name="key" value="${key}"/>
</form>

<form  action="deleteTeacherAction.do" method="post" id="deleteForm">
    <input name="peopleids" type="hidden" id="peopleids">
    <input name="deptId" type="hidden" id="delPDeptId">
    <input type="hidden" name="key" value="${key}"/>
</form>

<input type="hidden" id="VParentid" name="VParentid" value="1"/>
<input type="hidden" id="VDeptid" value="${deptId}"/>
<%@ include file="../../result.jsp"%>
<input type="hidden"  id="ischeck" />
<input type="hidden"  id="teaid" />
<input type="hidden"  id="isWrite" value='<s:property value="#r"/>'/>
<script>

//用于显示添加、修改、删除等的提示信息
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult !=null && operateResult!="" ){
		$("#dialogForm4Span").html("<br/>"+operateResult);
		$( "#dialogForm4" ).dialog( "open" );//dialogForm4：用于显示操作成功后返回提示页面
	}
});

//初始化树
tree=new dhtmlXTreeObject("treeboxbox_tree","300px","100%",0);

tree.setSkin('dhx_skyblue');
tree.setImagePath("../common/images/");
tree.enableDragAndDrop(false);

tree.setOnClickHandler(tonclick);
tree.enableTreeLines(true);
tree.setImageArrays("plus","plus2.gif","plus3.gif","plus4.gif","plus.gif","plus5.gif");
tree.setImageArrays("minus","minus2.gif","minus3.gif","minus4.gif","minus.gif","minus5.gif");
tree.setStdImages("book.gif","books_open.gif","books_close.gif");		
reloadPlan();

//鼠标单击事件
function tonclick() {
	$("#VParentid").val(tree.getSelectedItemId());//获取选中树形节点的ID
	if($("#peopleName").val()=="教员姓名"){
		$("#searchKey").val("");
	}else{
		$("#searchKey").val($("#peopleName").val());
	}

	gotoPage(1);
}
//加载树
function reloadPlan(){

	params = {};
	$.ajax({
		type:"post",
		url:"showOrgTree.do",
		data:params,
		dataType:"json",
		success:function(data){
			setTreeFromOrgList(data);
			tree.closeAllItems(1);//1节点全部打开，0节点全部关闭  组织机构内容很少，都打开了。
		},
		error:function(){
			alert("数据库连接错误，获取附件列表失败，请重试。");
			return;
		}
	});	
}
function setTreeFromOrgList(data){
	tree.deleteChildItems(0);
	for(i=0;i<data.length;i++){
		tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].message);
		tree.closeAllItems(data[i].VParentid);
	}
	//用于返回时选中树节点
	var VDeptId = $("#VDeptid").val();
	if(VDeptId != null && VDeptId!=""){
		tree.selectItem(VDeptId);
		tonclick();//调用选中的节点单击方法
	}
}

Date.prototype.dateformat = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
function gotoPage(pageIndex){
	pageIndex=pageIndex<1?1:pageIndex;
	var treeids = tree.getAllSubItems(tree.getSelectedItemId())+","+tree.getSelectedItemId();
	if(treeids=="0,"){
		treeids = "";
	}
	//$("#searchKey").val($("#peopleName").val());
	var key = $("#searchKey").val();
	if(key=="教员姓名"){
		key="";
	}
	params = {"deptId":treeids,"key":key,"pageIndex":pageIndex};

	$.ajax({
		type:"post",
		url:"searchZzListTeacherAjaxAction.do",
		data:params,
		dataType:"json",
		success:function(data){

			var ht = "";
			var selects = "";
			var selstr = "";
			var vday = "";
			var img = "";
			var col = "";
			var img0 = "";
			var vbutton = "";
			var str = "";
			var isWrite =$("#isWrite").val();
			if(data.data.length>0){
				for(var i=0;i<data.data.length;i++){
					if(data.data[i].VSfz==""){
						vday = "";
						vbutton = "";
						str= "&nbsp;" + data.data[i].VName;
						img0 = "";
					}else{
						if(data.data[i].iday<=31){
							col = "#FF0000";
							img = " <img src=\"themes/cupertino/images/top1.gif\"  align=\"absmiddle\"/>";
						}else if(31<data.data[i].iday && data.data[i].iday<=61){
							img = " <img src=\"themes/cupertino/images/top2.gif\"  align=\"absmiddle\"/>";
							col = "#EBA600";
						}else if(61<data.data[i].iday && data.data[i].iday<=90){
							img = " <img src=\"themes/cupertino/images/top3.gif\"  align=\"absmiddle\"/>";
							col = "#00A2BE";
						}else{
							img = "";
							col = "#000000";
						}
						vday = data.data[i].iday + img;
						if(isWrite==0){
						vbutton = "<a href=\"javascript:void(0)\" onclick=\"editinfo('"+data.data[i].VId+"');\"><img src=\"themes/cupertino/images/edit.gif\" title=\"编辑执照信息\"  align=\"absmiddle\" border=\"0\" /></a>";
						}
						if(data.data[i].IExam==0){
							img0 = "";
						}else{
							img0 = "<a href='javascript:void(0)' title=\"显示检查信息\" onclick=\"showCheckMsg('"+data.data[i].VId+"');\"><img src=\"themes/cupertino/images/jiahao.gif\"  align=\"absmiddle\"/></a>";
						}
						
						str = "<a href='javascript:void(0)' title=\"显示执照信息\" onclick=\"showPeopleMsg('"+data.data[i].VId+"','"+data.data[i].IExam+"');\" class=\"blue\">" + data.data[i].VName + "</a>";
					}
					ht+="<tr><td><input name=\"contractIdList\" type=\"radio\" value=\""+data.data[i].VId+","+data.data[i].VSfz+"\"><b></b></td>"+
						"<td>"+ img0 +str+"</td>"+
						"<td>"+data.data[i].VSfz+"</td>"+
						"<td>"+data.data[i].DIssueTime+"</td>"+
						"<td>"+data.data[i].DUsedTime+"</td>"+
						"<td>&nbsp;&nbsp;&nbsp;&nbsp;<font color="+col+">"+vday+"</font></td>"+
						"<td>"+data.data[i].DResultdate+"</td>"+
						"<td>"+data.data[i].VDoctor+"</td>"+
						"<td>"+vbutton+"</td></tr>";
				}
			}

			var start = data.pageStart;
			var end = data.pageEnd;
			var totalPageCount=data.totalPageCount;
			var totalCount=data.totalCount;
			var pageCount=totalPageCount;
			var pageIndex=data.currentPageNo; //当前页号
			
			for(var j=1;j<=pageCount;j++){
				if(pageIndex==j){
					selstr = " selected=\"selected\"";
				}else{
					selstr = "";
				}
				selects+="<option value="+j+selstr+">"+j+"</option>";
			}
			ht+="<tr><td colspan=\"9\" align=\"right\"><a href=\"javascript:firstPage("+pageIndex+");\" class=\"blue\">首页</a>&nbsp;<a href=\"javascript:prePage("+pageIndex+");\" class=\"blue\">上一页</a>&nbsp;<a href=\"javascript:nextPage("+pageIndex+","+pageCount+");\" class=\"blue\">下一页</a>&nbsp;<a href=\"javascript:lastPage("+pageIndex+","+pageCount+");\" class=\"blue\">尾页</a>&nbsp;<select id =\"seliid\" onchange=\"jumpPage()\">"+selects+"</select>本页显示"+start+"-"+end+"条/共"+totalPageCount+"页"+totalCount+"条&nbsp;&nbsp;</td></tr>";
			
			$("#searchPage").html(ht);
			execbase();//显示checkbox与radio样式。
		},
		error:function(){
			alert("数据库连接错误，获取部门失败，请重试！");
			return;
		}
	});
}

function jumpPage(){
	var s = $("#seliid").val();
	gotoPage(s);
}

function firstPage(pageIndex){
	if (pageIndex!=1){
		gotoPage(1);
	}
}   
function nextPage(pageIndex,pageCount){
	if (pageIndex<pageCount){
		gotoPage(pageIndex+1);
	}     
}
function prePage(pageIndex){
	if (pageIndex>1){
		gotoPage(pageIndex-1);
	}
} 
function lastPage(pageIndex,pageCount){
	if (pageIndex!=pageCount){
		gotoPage(pageCount);
	}     
}
</script>

</body>
</html>
