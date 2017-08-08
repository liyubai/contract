<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>整体课程学生执照情况基础表</title>

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
#Panel1, .buttonBox { width: auto; margin-left: 20px; margin-right: 20px; padding-top: 0; }
.Panel, .panelContent, .panelTable { background-color: transparent; box-shadow: none; filter: none; }
.nobra{white-space:nowrap;}
</style>

<script>
D_WIDTH=200;
$(function() {
	
	$("#modalDialogButton4").click(function(){
		$("#sbeginDate").val($("#startDate").val());
		$("#sendDate").val($("#endDate").val());
		$("#searchForm").submit();
	});
});
	
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149e5fcd0003</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>	
</div></div>

<div id="topPartD"><div style="margin-top:4px; margin-left:20px;">

<table border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td style=" padding-top:6px;">日期从：<input type="text"  id="startDate" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${flyMoment}"  onKeyPress="return false" onpaste="return false" />
    到 <input type="text"  id="endDate" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({endDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"   value="${endMoment}" onKeyPress="return false" onpaste="return false" />
    </td>
    <td >&nbsp;&nbsp;&nbsp;<button class="normal" id="modalDialogButton4" >查询</button></td>
    <td></td>
    </tr>
</table>

</div>
</div>

<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px; min-width:900px;">
<div class="panelContent">
<table width="96%" class="fcolorTable" border="1" cellspacing="0" cellpadding="3">
  <tr>
    <td colspan="13" align="center" bgcolor="#99CC00" >整体课程学生执照情况基础表</td>
    </tr>
  <tr class="nobra">
    <td  align="center" bgcolor="#CCFFCC">序号</td>
    <td  align="center" bgcolor="#CCFFCC">身份证类型</td>
    <td  align="center" bgcolor="#CCFFCC">执照编号</td>
    <td  align="center" bgcolor="#CCFFCC">性别</td>
    <td  align="center" bgcolor="#CCFFCC">出生年份</td>
    <td  align="center" bgcolor="#CCFFCC">注册日期</td>
    <td  align="center" bgcolor="#CCFFCC">学生状态</td>
    <td  align="center" bgcolor="#CCFFCC">学生执照颁发日期</td>
    <td  align="center" bgcolor="#CCFFCC">执照类型</td>
    <td  align="center" bgcolor="#CCFFCC">颁发日期</td>
    <td  align="center" bgcolor="#CCFFCC">类别</td>
    <td  align="center" bgcolor="#CCFFCC">执照历史</td>
    <td  align="center" bgcolor="#CCFFCC">历史颁发日期</td>
    </tr>
 <s:iterator value="stuLicenseList" status="i">
    <tr class="nobra">
      <td align="center">${i.count}</td>
      <td align="center">居民身份证</td>
      <td align="center">${VCardid}</td>
      <td align="center">${VGender}</td>
      <td align="center">${year}</td>
      <td align="center">${DChecktime}</td>
      <td align="center">${VBeizhu}</td>
      <td align="center">${DUsedTime}</td>
      <td align="center">${ILevel}</td>
      <td align="center">${DIssuetime}</td>
      <td align="center">${VHangkongqileibie}</td>
      <td align="center">
       <s:iterator value="checkList">
       ${VFlyform}<br>
       </s:iterator>
      </td>
      <td align="center"><s:iterator value="checkList">
       ${VBz}<br>
       </s:iterator></td>
    </tr>
 </s:iterator>
</table>

</div>
</div>
</div>
</div>

<form method="post" action="?" id="searchForm">
<input type="hidden" name="flyMoment" id="sbeginDate">
<input type="hidden" name="endMoment" id="sendDate">
</form>
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		alert(operateResult);
	}
});
</script>