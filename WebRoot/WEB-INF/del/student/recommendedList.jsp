<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>推荐考试</title>
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

fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }

</style>
<script>
$(function() {

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
	$( "#dialogForm2" ).dialog({//排序
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var sel = getSelValue('checkboxName');
				$("#ids").val(sel);
				if(sel==""){
					$( this ).dialog( "close" );
					return;
				}
				$("#assignForm").submit();
			}
		}
	});
	$("#modalDialogButton4").click(function(){
	
		var key = $("#code").val();
		if(key=="学号/姓名"){
			$("#key").val("");
		}else{
			$("#key").val(key);
			
		}
		$("#examTime").val($("#riqi").val());
		$("#lessonName").val($("#kecheng").val());
		$("#id").val($.trim($("#tuijian").val()));
		$("#assignForm").submit();
	});
	$("#orderButton").click(function(){
		$( "#dialogForm2" ).dialog("open");
	});
});
function orderByStyle(id){
	$("#orderid").val(id);
	$("#assignForm").submit();
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

<div class="panelBox buttonBox">

<span class="left" style="line-height:24px;">考试日期：</span>
<input type="text"  id="riqi" class="left Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({riqi:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" />
<span class="left" style="line-height:24px;">&nbsp;推荐人：</span>
<input type="text"  id="tuijian" class="left ui-widget-content ui-corner-all text"  style="width:60px; height:16px;"/>
<span class="left" style="line-height:24px;">&nbsp;课程：</span>
<input type="text"  id="kecheng" class="left ui-widget-content ui-corner-all text"  style="width:60px; height:16px;"/>
<div class="buttonInput relative left" width="160" height="28" style="margin-left:5px;">
<input id="code" title="学号/姓名"  name="code"  type="text" maxlength="50" value="学号/姓名" /><button id="modalDialogButton4">查询</button>
</div><button class="normal" id="orderButton">组合排序</button>
</div>

<div class="Panel ui-corner-all-0" id="Panel2" >
<div class="panelContent">
        <table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
        	<thead>
             	<tr class="trSpliter">
				<th width="100"></th>
				<th width="100"></th>
				<th width="100"></th>
                <th width="140"></th>
                <th width="100"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortable" onClick="orderByStyle('VCode')">学号<span class="ui-icon ui-icon-arrow-1-n" role="presentation" >↑</span></th>
                <th class="thSortableGray">姓名</th>
                <th class="thSortable" onClick="orderByStyle('Lesson')">课程<span class="ui-icon ui-icon-arrow-1-n" role="presentation" >↑</span></th>
                <th class="thSortable"  onClick="orderByStyle('DExamDate')">推荐考试日期<span class="ui-icon ui-icon-arrow-1-n" role="presentation" >↑</span></th>
                <th class="thSortable"  onClick="orderByStyle('Other')">推荐人<span class="ui-icon ui-icon-arrow-1-n" role="presentation" >↑</span></th>
                <th class="thSortable"  onClick="orderByStyle('DTjdate')">推荐时间<span class="ui-icon ui-icon-arrow-1-n" role="presentation" >↑</span></th>
   			  </tr>   
			</thead>
			<tbody> 
            <s:iterator value="page.data" status="stat">
			  <tr>
              	<td>${studentBaseInfo.VCode}</td>
				<td>${studentBaseInfo.VName}</td>
				<td>${TLesson.VLessonName}</td>
				<td><s:date name="DExamDate" format="yyyy-MM-dd" /></td>
				<td>${TOtheruser.VName}</td>
				<td><s:date name="DTjdate" format="yyyy-MM-dd HH:mm:ss" /></td>
			  </tr>
              </s:iterator>
             <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
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
<div id="dialogForm2" title="请选择排序内容">
  <fieldset>
     <table width="100%" border="0" align="center" cellpadding="3" cellspacing="3" >
      <tr>
        <td width="10%" align="left" valign="middle"></td>
        <td width="90%" align="left" valign="middle"></td>
      </tr>
      <tr>
        <td width="10%" align="left" valign="middle"></td>
        <td width="90%" align="left" valign="middle"><input name="checkboxName" type="checkbox" value="lesson"><b></b> 课程</td>
      </tr>
      <tr>
        <td width="10%" align="left" valign="middle"></td>
        <td width="90%" align="left" valign="middle"><input name="checkboxName" type="checkbox" value="person"><b></b> 推荐人</td>
      </tr>
      <tr>
        <td width="10%" align="left" valign="middle"></td>
        <td width="90%" align="left" valign="middle"><input name="checkboxName" type="checkbox" value="date"><b></b> 考试日期</td>
      </tr>
    </table>
  </fieldset>
</div>
<form method="post" action="open_recommendedList.do" id="assignForm">
<input type="hidden"  name="name" id="key" value="${name}">
<input type="hidden"  name="examTime" id="examTime" value="${examTime}">
<input type="hidden"  name="lessonName" id="lessonName" value="${lessonName}">
<input type="hidden"  name="id" id="id" value="${id}"><!-- 推荐人 -->
<input name="order" type="hidden" id="orderid" value="${order}">
<input name="ids" type="hidden" id="ids" value="${ids}">
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