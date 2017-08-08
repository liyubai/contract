<%@ page language="java"  import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程管理</title>
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
<style>
/*功能9*/
fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
</style>
<script>
$(function() {
	$("div.dropDownList").each(function(i){
		
		new $.dropDownList(i,true,100);

	});
	$( "#dialogForm1" ).dialog({//添加
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				var VLessonName = $("#cVLessonName").val();
				if(VLessonName==""){
					alert("课程名称不能为空。");
					$("#cVLessonName").focus();
					return;
				}
				$("#VLessonName").val($("#cVLessonName").val());
				$("#ITypeid").val($("#itype").val());
				$("#unitSubjectForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#editDialogForm" ).dialog({//编辑
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				var VLessonName = $.trim($("#eVLessonName").val());
				if(VLessonName==""){
					alert("课程名称不能为空。");
					$("#eVLessonName").focus();
					return;
				}
				$("#seVLessonName").val(VLessonName);
				$("#seITypeid").val($("#eitype").val());
				$("#editForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("#modalDialogButton1").click(function(){
		$("#dialogForm1").dialog( "open" );
	});
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchUser").val()=="课程名称"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($.trim($("#searchUser").val()));
		}
		$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//刷新
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});
	$("button.icon").click(function(){
		var str = this.id;
		var opt = str.split(",")[0];
		var id = str.split(",")[1];
		var name = str.split(",")[2];
		var type = str.split(",")[3];
		if(opt==0){
			$("#eitype").val(type);
			$("#eitype").change();
			$("#seid").val(id);
			$("#seITypeid").val(type);
			$("#eVLessonName").val(name);
			$( "#editDialogForm" ).dialog( "open" );
		}else{
			$("#unitSubjectDicIdListId").val(id);
			$( "#dialogForm2" ).dialog( "open" );
		}
		
	});
	$( "#dialogForm2" ).dialog({//删除内容窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#deleteForm").submit();
			},
			"取 消": function() {
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
	$( "#setDialogForm" ).dialog({
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var order = $.trim($("#iorder").val());
				if(order==""){
					alert("请输入顺序号");
					return;
				}
				var sid = $("#sid").val();
				if(sid==""){
					return;
				}
				var tab = $("#tab").val();
				var url = $("#backUrl").val();
				var opt =  $("#opt").val();
				var orgid= $("#orgid").val();
				window.location.href="handOrderByNum.do?order="+order + "&id="+sid + "&tab=" + tab + "&backUrl=" + url + "&opt=" + opt + "&orgId=" +orgid;			
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
});
function openSetWindow(d,id,tab,url,opt){
	$("#iorder").val(d);
	$("#sid").val(id);
	$("#tab").val(tab);
	$("#backUrl").val(url);
	$("#opt").val(opt);
	$( "#setDialogForm" ).dialog( "open" );
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c014714a1e0b9000a</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

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
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">添加课程</button></s:if>
    <div class="dropDownList barLeft">
    <button>课程类型</button>
    <ul>
    	<li><a href="?orgId=" val=""><span class="ui-icon ui-icon-bullet"></span>课程类型</a></li>
        <li><a href="?orgId=0" val="0">雅思课程</a></li>
        <li><a href="?orgId=1" val="1">校考课程</a></li>
        <li><a href="?orgId=2" val="2">局方课程</a></li>
        </ul><input type="hidden" id="ssitype" value="${orgId}"/>
    </div>
    <button class="normal barRight" id="modalDialogButton5">全部</button>
    
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" name="searchUser"  type="text" maxlength="50" value="课程名称" title="课程名称"/><button id="modalDialogButton4" >查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="20"></th>
				<th width="160"></th>
                <th width="160"></th>
				<th width="160"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray"></th>
				<th class="thSortableGray">课程名称</th>
                 <th class="thSortableGray">人工排序</th>
                <th class="thSortableGray">类型</th>
				<th class="thSortableGray">创建时间</th>
				<th class="thSortableGray">&nbsp;</th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="lessonList">
			  <tr>
				<td></td>
				<td>${VLessonName}</td>
                <td style="line-height:16px; padding-left:10px;"><s:if test="#r==null || #r==0"><a href="handOrderByNum.do?tab=lesson&backUrl=open_lessonList&id=${VId}&order=-1&opt=1&orgId=${orgId}" class="blue">↑</a> ${IOrder}<br>
        	<a href="handOrderByNum.do?tab=lesson&backUrl=open_lessonList&id=${VId}&order=1&opt=1&orgId=${orgId}" class="blue">↓</a><br><a href="javascript:void(0)" onClick="openSetWindow('${IOrder}','${VId}','lesson','open_lessonList','2')" class="blue">设置</a></s:if><s:else>${IOrder}</s:else>
        </td>
                <td><s:if test='IType==0'>雅思课程</s:if><s:if test='IType==1'>校考课程</s:if><s:if test='IType==2'>局方课程</s:if></td>
                <td><s:date name="DCreatedate" format="yyyy-MM-dd HH:mm:ss" /></td>
				<td><s:if test="#r==null || #r==0"><span class="hide"><button class="icon"  icon="ui-icon-pencil" title="编辑" id="0,${VId},${VLessonName},${IType}"></button><button class="icon" icon="ui-icon-trash" title="删除"  id="1,${VId},${VLessonName},${IType}"></button></span></s:if></td>
			  </tr>
              </s:iterator>
			 <s:iterator value="(20-lessonList.size).{ #this }">
			  <tr>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			  </tr>
              </s:iterator>
			</tbody>
		</table>

</div>
</div>
</div>
</div>


<div id="dialogForm1"  title="新建课程">
<fieldset>
课程类型：<div class="dropDownList">
    <button>课程类型</button>
    <ul>
        <li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>雅思课程</a></li>
        <li><a href="#N" val="1">校考课程</a></li>
        <li><a href="#N" val="2">局方课程</a></li>
        </ul><input type="hidden" id="itype" value="0"/>
    </div>
<span class="panelLine"></span>
课程名称：<input type="text"  id="cVLessonName" class="text ui-widget-content ui-corner-all"  style="width:200px;" />
</fieldset>
</div>

<div id="editDialogForm"  title="编辑课程">
<fieldset>
课程类型：<div class="dropDownList">
    <button>课程类型</button>
    <ul>
        <li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>雅思课程</a></li>
        <li><a href="#N" val="1">校考课程</a></li>
        <li><a href="#N" val="2">局方课程</a></li>
        </ul><input type="hidden" id="eitype" value="0"/>
    </div>
<span class="panelLine"></span>
课程名称：<input type="text"  id="eVLessonName" class="text ui-widget-content ui-corner-all"  style="width:200px;" />
</fieldset>
</div>

<div id="dialogForm2">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确定要删除选中的信息吗？<br/>信息删除后不可恢复。</span>
		</div>
	</fieldset>	
</div>

<div id="dialogForm4">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555; " id="dialogForm4Span"></span>
		</div>
	</fieldset>	
</div>
<div id="setDialogForm"  title="设置排序">
<br>
<fieldset>
排序号：<input type="text"  id="iorder" class="text ui-widget-content ui-corner-all" style="width:200px;"/>
</fieldset>
</div>

<form id="unitSubjectForm" method="post" action="createLssson.do">
<input type="hidden" name="lesson.VLessonName" id="VLessonName" />
<input type="hidden" name="lesson.IType" id="ITypeid" />
</form>

<form id="editForm" method="post" action="updateLessonBaseInfo.do">
<input type="hidden" name="lesson.VLessonName" id="seVLessonName" />
<input type="hidden" name="lesson.VId" id="seid" />
<input type="hidden" name="lesson.IType" id="seITypeid" />
</form>

<form  action="deleteLessonBaseInfo.do" method="post" id="deleteForm">
<input name="id" type="hidden" id="unitSubjectDicIdListId">
</form>

<form  action="?" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
</form>
<%@ include file="../../result.jsp"%>
<input type="hidden"  id="sid" />
<input type="hidden"  id="tab" />
<input type="hidden"  id="backUrl" />
<input type="hidden"  id="opt" />
<input type="hidden"  id="orgid" value="${orgId}"/>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html("<br/>"+operateResult);
		$( "#dialogForm4" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>