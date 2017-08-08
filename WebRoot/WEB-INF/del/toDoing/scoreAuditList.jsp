<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>成绩审核</title>

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
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>
<script>
$(function() {
	
	var $checkboxes=$("input[name='checkboxName']"),$checkAllUsersBox=$("#checkAllUsersBox");
	$checkboxes.change(function(){
		if(!this.checked) $checkAllUsersBox[0].checked=false;
		if($checkboxes.size()==$checkboxes.filter(":checked").size()) $checkAllUsersBox[0].checked=true;
		$checkAllUsersBox.trigger("change");
	});
	$checkAllUsersBox.click(function(){
		$checkboxes.each(function(){
			this.checked = $checkAllUsersBox[0].checked;
			$(this).trigger("change");
		});
	});
	
	$("#escid1").click(function(){//返回
		window.location.replace("open_toDoingListPage.do");
	});

	$("#hegebutton").click(function(){
		
		var str  = getSelValue('checkboxName');
		if(str==""){
			alert("请选择学生。");
			return;
		}
		$("#infoId").val(str);
		$("#type").val("2");
		$( "#hegeDialog" ).dialog("open");
	});
	$("#buhegebutton").click(function(){
		
		var str  = getSelValue('checkboxName');
		if(str==""){
			alert("请选择学生。");
			return;
		}
		$("#infoId").val(str);
		$("#type").val("3");
		$( "#buhegeDialog" ).dialog("open");
	});
	$( "#hegeDialog" ).dialog({
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#submitTime").val($("#cDAuditDate").val());
				$("#auditForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#buhegeDialog" ).dialog({
		autoOpen: false,
		height: 300,
		width: 450,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#VReason").val($.trim($("#cVReason").val()));
				if($("#VReason").val()==""){
					alert("请输入不合格的原因。");
					return;
				}
				$("#submitTime").val($("#cDAuditDate2").val());
				$("#auditForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#backResultDialogForm" ).dialog({//操作数据库返回提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				$( this ).dialog( "close" );
			}
		}
	});
});

</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div style="padding-top:8px; padding-left:6px; padding-right:6px;">
<div class="panelHead">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="57%" height="35" style="font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">审核人：</font>${teacherid}</td>
    <td width="43%" align="right">成绩审核，学生名单如下：&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table></div>
<div class="panelContent">
<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
<thead>
<tr><th width="50"><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
<th width="80">学号</th>
<th width="80">姓名</th>
<th width="80">性别</th>
<th width="80">课程</th>
<th width="80">成绩</th>
<th width="100">考试日期</th>
<th></th>
</tr>   
</thead>
<tbody>
<s:iterator value="scoreList">
<tr><td align="center"><input name="checkboxName" type="checkbox" value="${VId}" ><b></b></td>
<td align="center">${studentBaseInfo.VCode}</td>
<td align="center">${studentBaseInfo.VName}</td>
<td align="center">${studentBaseInfo.VGender}</td>
<td align="center">${TLesson.VLessonName}</td>
<td align="center"><s:if test='DScore!=null'><s:text name="format.number2"><s:param value="DScore"/></s:text></s:if></td>
<td align="center"><s:date name="DExamTime" format="yyyy-MM-dd" /></td>
<td align="center"></td>

</tr>
</s:iterator>
</tbody>
</table><br><button class="green" primary="ui-icon-button-confirm" id="hegebutton">合格</button>
&nbsp;&nbsp;<button class="green" primary="ui-icon-button-confirm" id="buhegebutton">不合格</button>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button></td>
</div>
</div>

<div id="hegeDialog"  title="成绩审核合格">
<fieldset><br><input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>

审核日期： 
<input type="text"  id="cDAuditDate" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDAuditDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" />
</fieldset>
</div>
<div id="buhegeDialog"  title="成绩审核不合格">

<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td width="28%" align="right">审核日期：<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/></td>
    <td width="72%"><input type="text"  id="cDAuditDate2" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDAuditDate2:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">不合格原因：</td>
    <td><textarea  id="cVReason" style="width:260px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea></td>
  </tr>
</table>
</div>
<div id="backResultDialogForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm4Span"></span></td>
</tr>
</table>
</div>
</body>
</html>
<form action="saveLessonScoreAudit.do" method="post" id="auditForm">
<input type="hidden" name="toDoing.infoId" id="infoId">
<input type="hidden" name="toDoing.title" id="VReason">
<input type="hidden" name="toDoing.type" id="type">
<input type="hidden" name="toDoing.submitTime" id="submitTime">

<input type="hidden" name="id" value="${id}">
<input type="hidden" name="teacherid" value="${teacherid}">
</form><%@ include file="../../result.jsp"%>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#backResultDialogForm" ).dialog( "open" );
	}
});
</script>