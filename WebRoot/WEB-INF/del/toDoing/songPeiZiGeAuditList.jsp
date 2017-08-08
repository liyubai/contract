<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${id}</title>

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
		$("#IResult").val(0);
		
		
		$( "#hegeDialog" ).dialog("open");
	});
	$("#buhegebutton").click(function(){
		var str  = getSelValue('checkboxName');
		if(str==""){
			alert("请选择学生。");
			return;
		}
		$("#infoId").val(str);
		$("#IResult").val(1);
		$( "#buhegeDialog" ).dialog("open");
	});
	$("#zanshibutton").click(function(){
		var str  = getSelValue('checkboxName');
		if(str==""){
			alert("请选择学生。");
			return;
		}
		$("#infoId").val(str);
		$("#IResult").val(2);
		$( "#zanshiDialog" ).dialog("open");
	});
	$( "#hegeDialog" ).dialog({
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#DChecktime").val($("#cDChecktime1").val());
				$("#auditForm").submit();
				$( this ).dialog( "close" );
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
				$("#DChecktime").val($("#cDChecktime2").val());
				$("#VReason").val($("#cVReason1").val());
				if($("#VReason").val()==""){
					alert("不合格原因不能为空。");
					return;
				}
				$("#auditForm").submit();
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#zanshiDialog" ).dialog({
		autoOpen: false,
		height: 350,
		width: 450,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#DChecktime").val($("#cDChecktime3").val());
				$("#VReason").val($("#cVReason2").val());
				$("#DNextchecktime").val($("#cDNextchecktime").val());
				if($("#VReason").val()==""){
					alert("暂不合格原因不能为空。");
					return;
				}
				
				$("#auditForm").submit();
				$( this ).dialog( "close" );
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
    <td width="57%" height="35" >&nbsp;&nbsp;&nbsp;&nbsp;
    送培资格审查 - <s:if test='status!=null && status==0'>成绩审查</s:if><s:if test='status!=null && status==1'>身体审查</s:if><s:if test='status!=null && status==2'>在校表现审查</s:if>（合计<span id="cnum"></span>条记录），学生名单如下：<!--<font color="999999">审核人：</font>${teacherid}--></td>
    <td width="43%" align="right" style="font-weight:normal"><!--${id}，学生名单如下：&nbsp;&nbsp;&nbsp;--></td>
  </tr>
</table></div>
<div class="panelContent">
<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
        	<thead>
			  <tr><th width="50"><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
              	<th width="80">学号</th>
                <th width="50">姓名</th>
                <th width="40">性别</th>
                <th width="60">学员类型</th>
                <th width="90">所属公司</th>
                <th width="90">学籍状态</th>
                <th width="60">招生形式</th>
                <th width="60">自费/公费</th>
                
                <th width="80">审查结果</th>
                <th width="100">审查日期</th>
                <th width="100">下次审查日期</th>
                <th><div align="left" style="padding-left:10px">原因</div></th>
              </tr>   
		  </thead>
			<tbody>
            <s:set name="p" value="0"/>
            <s:iterator value="studentList" status="statu"><s:set name="p" value="#p+1"/>
			 <tr><td align="center"><input name="checkboxName" type="checkbox" value="${VId}" ><b></b></td>
             	<td align="center">${VCode}</td>
				<td align="center">${VName}</td>
				<td align="center">${VGender}</td>
                <td align="center">${TDictionByVStuTypeid.VName}</td>
                <td align="center">${TOrg.VName}</td>
                <td align="center">${TDictionByVXjStatusid.VName}</td>
                <td align="center">${TDictionByVFormid.VName}</td>
                <td align="center">${TDictionByVFreeTypeid.VName}&nbsp;</td>
                <td align="center">${VXxlx}</td>
                <td align="center">${VLxfs}</td>
                <td align="center">${VZy}</td>
                <td>${VJg}</td>
                
              </tr>
              </s:iterator>
		    </tbody>
	</table>
<br>
<div id="hegeDialog"  title="审查合格">
<fieldset><br><input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>

审查日期： 
<input type="text"  id="cDChecktime1" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDChecktime1:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" />
</fieldset>
</div>
<div id="buhegeDialog"  title="审查不合格">

<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td width="28%" align="right">审查日期：<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/></td>
    <td width="72%"><input type="text"  id="cDChecktime2" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDChecktime2:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">不合格原因：</td>
    <td><textarea  id="cVReason1" style="width:260px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea></td>
  </tr>
</table>
</div>
<div id="zanshiDialog"  title="暂不合格">

<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td width="28%" align="right">审查日期：<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/></td>
    <td width="72%"><input type="text"  id="cDChecktime3" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDChecktime3:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">暂不合格原因：</td>
    <td><textarea  id="cVReason2" style="width:260px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea></td>
  </tr>
   <tr>
    <td width="28%" align="right">下次审查日期：</td>
    <td width="72%"><input type="text"  id="cDNextchecktime" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDNextchecktime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
</table>
</div>
&nbsp;&nbsp;<button class="green" primary="ui-icon-button-confirm" id="hegebutton">合格</button>
&nbsp;&nbsp;<button class="green" primary="ui-icon-button-confirm" id="buhegebutton">不合格</button>
&nbsp;&nbsp;<button class="green" primary="ui-icon-button-confirm" id="zanshibutton">暂不合格</button>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button></td>
<br><br>

</div>
</div>

</body>
</html>
<form action="saveSongPeiZiGeAudit.do" method="post" id="auditForm">
<input type="hidden" name="toDoing.infoId" id="infoId"><!--学生-->
<input type="hidden" name="toDoing.submitTime" id="DChecktime"><!--审查日期-->
<input type="hidden" name="toDoing.submitUserName" id="DNextchecktime"><!--下次审查日期-->
<input type="hidden" name="toDoing.title" id="VReason"><!--原因-->
<input type="hidden" name="toDoing.type" id="IResult"><!--审查结果-->
<input type="hidden" name="status" value="${status}"><!--类型-->
</form>
<input type="hidden" id="total" value="${p}"><!--总数-->
<div id="backResultDialogForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm4Span"></span></td>
</tr>
</table>
</div>
<%@ include file="../../result.jsp"%>
<script>
$("#cnum").html($("#total").val());
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#backResultDialogForm" ).dialog( "open" );
	}
});
</script>