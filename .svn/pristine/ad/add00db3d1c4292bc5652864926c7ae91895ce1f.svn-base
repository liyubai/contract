<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>实践考试申请打回</title>

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

	$("#escid1").click(function(){//返回
		window.location.replace("open_toDoingListPage.do");
	});

	$("#querenbutton").click(function(){//审核通过

		var examdate=$.trim($("#examdate").val());
		if(examdate==""){
			$("#examdate").focus();
			alert("申请时间不能为空。");
			return;
		}
		$("#submitTime").val(examdate);
		$("#auditForm").submit();
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
    <td width="43%" align="right">待改正的被打回实践考试申请，推荐参加考试的学生名单如下：&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table></div>
<div class="panelContent">
<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
        	<thead>
			  <tr>
              	<th width="100">学号</th>
                <th width="50">姓名</th>
                <th width="40">性别</th>
                <th width="60">学员类型</th>
                <th width="90">所属公司</th>
                <th width="90">学籍状态</th>
                <th width="60">招生形式</th>
                <th width="60">自费/公费</th>
                <th></th>
              </tr>   
		  </thead>
			<tbody>
            <s:iterator value="practiceAskList" status="statu">
            <s:set name="p" value="practiceAsk.VBz"/>
			 <tr>
             	<td align="center">${studentBaseInfo.VCode}</td>
				<td align="center">${studentBaseInfo.VName}</td>
				<td align="center">${studentBaseInfo.VGender}</td>
                <td align="center">${studentBaseInfo.TDictionByVStuTypeid.VName}</td>
                <td align="center">${studentBaseInfo.TOrg.VName}</td>
                <td align="center">${studentBaseInfo.TDictionByVXjStatusid.VName}</td>
                <td align="center">${studentBaseInfo.TDictionByVFormid.VName}</td>
                <td align="center">${studentBaseInfo.TDictionByVFreeTypeid.VName}&nbsp;</td>
                <td align="center"></td>
              </tr>
              </s:iterator>
		    </tbody>
	</table>

<br>
<table  class="colorTable" border="0" bordercolor="#E0E0E0" cellspacing="0" cellpadding="0" >
  <thead>
    <tr>
      <th align="left" width="400" style="padding-left:10px; line-height:20px;">打回原因</th>
      <th align="left" width="200" >重新申请时间</th>
      <th align="left" >&nbsp;&nbsp;处理</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="padding-left:10px; line-height:20px;">${p}</td>
      <td ><input type="text" id="examdate" class="Wdate ui-widget-content ui-corner-all text"  style="width:140px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})"  value="${viewDate}" onKeyPress="return false" onpaste="return false"  /></td>
      <td>
&nbsp;&nbsp;<button class="green" primary="ui-icon-button-confirm" id="querenbutton">重新申请</button>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button></td>
    </tr>
  </tbody>
</table>
<br>

</div>
</div>
</body>
</html>
<form action="savePracticeBackExamAskConfirmToAsk.do" method="post" id="auditForm">
<input type="hidden" name="ask.VId"  value="${id}">
<input type="hidden" name="ask.DAskTime" id="submitTime">
</form>