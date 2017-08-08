<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程设置</title>
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

fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }

</style>
<script>
$(function() {
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchOutlineName").val()=="班级名称"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($.trim($("#searchOutlineName").val()));
		}
		$( "#searchForm" ).submit();
	});

	$("#lessonButton").click(function(){
		var str = getSelRadioValue('lessonName');
		if(str==""){
			alert("请选择班级。");
			return;
		}
		$("#classid").val(str.split(";")[0]);
		$("#lessonDialog").dialog('option', 'title', "所选班级：《"+str.split(";")[1] +"》设置课程。");
		$( "#lessonDialog" ).dialog("open");
	})
	$( "#lessonDialog" ).dialog({
		autoOpen: false,
		height: 480,
		width: 640,
		modal: true,
		resizable: false,
		buttons: {
			"下一步": function() {
				var lessons = getSelValue('lessonCheckName');
				if(lessons==""){
					alert("请选择课程。");
					return;
				}
				$("#selIds").val(lessons);
				$("#addLessonForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
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
	$( "#editPointLineDialog" ).dialog({
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#DPointLine").val($("#cDPointLine").val());
				$("#IBktimes").val($("#cIBktimes").val());
				$("#IDays").val($("#cIDays").val());
				$("#editForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
});
function getSelRadioValue(name){
	var str="";
	var r1=document.getElementsByName(name);
	for(i=0;i<r1.length;i++){
		if(r1[i].checked==true){
			str=r1[i].value;
		}
	}
	return str;
}
function getSelValue(name){
	var str="";
	var r1=document.getElementsByName(name);
	for(i=0;i<r1.length;i++){
		if(r1[i].checked==true){
			str+=r1[i].value + ",";
		}
	}
	return str;
}
function showEditDiaLog(id,lessonname,score,IBktimes,IDays,classname){
	$("#lessonname").html(lessonname);
	$("#classname").html(classname);
	$("#VId").val(id);
	$("#cDPointLine").val(score);
	$("#cIBktimes").val(IBktimes);
	$("#cIDays").val(IDays);
	$("#editPointLineDialog").dialog( "open" );
}
function deleteLessonScore(id){

	window.location.replace("deletePointLineById.do?id=" + id);
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4a9df179014a9e3beb0c0003</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>
<div class="panelBox buttonBox" ><%request.setAttribute("k",ActionContext.getContext().getName());%>
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
</s:else><s:if test="#r==null || #r==0">
<button class="green"  id="lessonButton">设置课程</button></s:if>

<div class="buttonInput relative left" width="160" height="28">
<input id="searchOutlineName" title="班级名称"  name="searchOutlineName"  type="text" maxlength="50" value="班级名称" /><button id="modalDialogButton4">查询</button>
</div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2" >

	<div class="panelContent">

	
        <table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
        	<thead>
             	<tr class="trSpliter">
				<th width="30"></th>
				<th width="160"></th>
                <th width="150"></th>
                <th width="100"></th>
                <th width="100"></th>
                <th width="100"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortableGray" ></th>
                <th class="thSortableGray" >班级名称</th>
                <th class="thSortableGray" >课程</th>
                <th class="thSortableGray" >类型</th>
                 <th class="thSortableGray" >分数线</th>
                 <th class="thSortableGray" >补考次数</th>
                 <th class="thSortableGray" >两次考试间隔</th>
			  </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
			  <tr class="normal">
              	<td><input name="lessonName" type="radio" value="${setClass.VId};${setClass.VName}"><b></b></td>
				<td>${setClass.VName}</td>
				<td colspan="5">
                <s:iterator value="list">
                <span class="inline" style="width:145px;">${TLesson.VLessonName}</span>
                <span class="inline" style="width:100px;"><s:if test='TLesson.IType==0'>理论</s:if><s:if test='TLesson.IType==1'>校考</s:if><s:if test='TLesson.IType==2'>局方</s:if></span>
                <span class="inline" style="width:100px;"><s:text name="format.number2"><s:param value="DPointLine"/></s:text></span>
                <span class="inline" style="width:100px;">${IBktimes}</span>
                <span class="inline" style="width:80px;">${IDays}</span>
                <span class="inline" style="width:100px;"><a href="javascript:void(0)" onClick="showEditDiaLog('${VId}','${TLesson.VLessonName}','<s:text name="format.number2"><s:param value="DPointLine"/></s:text>','${IBktimes}','${IDays}','${setClass.VName}')"><img src="themes/cupertino/images/edit.png"  title="编辑" border="0" align="absmiddle"/></a> <a href="javascript:void(0)" onClick="deleteLessonScore('${VId}')"><img src="themes/cupertino/images/subfu.png" title="删除" border="0" align="absmiddle"/></a></span>
                <br>
                </s:iterator>
                </td>
			  </tr>
              </s:iterator>
             <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
			  <tr class="normal">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			  </tr>
              </s:iterator>
			</tbody>
		</table><s:include value="../common/pagination_system.jsp" />
</div>
</div>
</div>
</div>

<div id="dialogForm3">
  <fieldset>
     <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
      </tr>
    </table>
  </fieldset>
</div>
<div id="editPointLineDialog" title="编辑科目信息"><br>

<table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="35%" height="24" align="right">班级名称：</td>
    <td width="65%"><span id="classname"></span></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td height="24" align="right">课程名称：</td>
    <td><span id="lessonname"></span></td>
  </tr>
  <tr>
    <td colspan="2" align="right"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td height="24" align="right">分数线：</td>
    <td><input type="text"  id="cDPointLine" class="text ui-widget-content ui-corner-all" style="width:40px;" /></td>
  </tr>
  <tr>
    <td  colspan="2" align="right"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td height="24" align="right">补考次数：</td>
    <td><input type="text"  id="cIBktimes" class="text ui-widget-content ui-corner-all" style="width:40px;" /></td>
  </tr>
  <tr>
    <td  colspan="2" align="right"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td height="24" align="right">两次考试间隔：</td>
    <td><input type="text"  id="cIDays" class="text ui-widget-content ui-corner-all" style="width:40px;" /></td>
  </tr>
</table>

</div>
<div id="lessonDialog" title="设置课程">
<br>理论课程：
<span class="panelLine"></span>
<s:iterator value="lessonList">
<s:if test='IType==0'>
<div style="width:120px; float:left;line-height:28px">&nbsp;&nbsp;&nbsp;<input name="lessonCheckName" type="checkbox" value="${VId};${VLessonName}"/><b></b>${VLessonName}</div>
</s:if>
</s:iterator>
<span class="panelLine"></span>
校考课程：
<span class="panelLine"></span>
<s:iterator value="lessonList">
<s:if test='IType==1'>
<div style="width:120px; float:left;line-height:28px">&nbsp;&nbsp;&nbsp;<input name="lessonCheckName" type="checkbox" value="${VId};${VLessonName}"/><b></b>${VLessonName}</div>
</s:if>
</s:iterator>
<span class="panelLine"></span>
局方课程：
<span class="panelLine"></span>
<s:iterator value="lessonList">
<s:if test='IType==2'>
<div style="width:120px; float:left;line-height:28px">&nbsp;&nbsp;&nbsp;<input name="lessonCheckName" type="checkbox" value="${VId};${VLessonName}"/><b></b>${VLessonName}</div>
</s:if>
</s:iterator>
</div>
<form  action="updatePointLine.do" method="post" id="editForm">
<input name="pointLine.VId" type="hidden" id="VId">
<input name="pointLine.DPointLine" type="hidden" id="DPointLine">
<input name="pointLine.IBktimes" type="hidden" id="IBktimes">
<input name="pointLine.IDays" type="hidden" id="IDays">

</form>

<form  action="open_addClassLesson.do" method="post" id="addLessonForm">
<input name="selIds" type="hidden" id="selIds">
<input name="id" type="hidden" id="classid">
</form>
<form  action="?" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey" value="${name}">
</form>
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm3Warning").html(operateResult);
		$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>