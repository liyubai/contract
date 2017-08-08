<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>处理待办事项</title>

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

<script>
$(function() {

	$("#escid1").click(function(){//返回
		window.location.replace("open_toDoingListPage.do");
	});

	$("#querenone").click(function(){//确认
		var cresult = $.trim($("#cresult").val());
		if(cresult==""){
			alert("处理结果不能为空。");
			$("#cresult").focus();
			return false;
		}
		//提交表单
		$("#sresult").val(cresult);
		$("#saveForm").submit();
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
    <td width="81%" height="35" style="font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">学号：</font>${flightTrainingrecordDetail.studentVCode}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">姓名：</font>${flightTrainingrecordDetail.studentName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">飞行种类：</font>${flightTrainingrecordDetail.VFlytype}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">教员：</font>${flightTrainingrecordDetail.teacherName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">监视教员：</font>${flightTrainingrecordDetail.monitorteacherName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">压座学员：</font>${flightTrainingrecordDetail.VSecondstudent}</td>
    <td width="19%" align="right">待处理的学生申诉教员的评语&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table></div>
<div class="panelContent">
<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2" >
        	<thead>
			  <tr>
                <th width="95" rowspan="2">日期</th>
                <th width="50" rowspan="2">航空器型别</th>
                <th width="50" rowspan="2">航空器登记号</th>
                <th colspan="4">起飞\降落站</th>
                <th width="50" rowspan="2">飞行<br>
科目</th>
                <th colspan="2">着陆次数</th>
                <th rowspan="2" width="60">驾驶员<br>
                  飞行时间</th>
                <th colspan="4">机长或单飞时间</th>
                <th colspan="4">副驾驶或带飞时间</th>
                <th colspan="2">仪表飞行时间</th>
                <th colspan="3">模拟机\训练器</th>
                <th rowspan="2">备注</th>
              </tr>
			  <tr>
			    <th width="40" height="14">起飞站</th>
			    <th width="40">到达站</th>
			    <th width="40">出发<br>
		        时刻</th>
			    <th width="40">到达<br>
		        时刻</th>
			    <th width="40" height="14">夜间</th>
			    <th width="40">昼间</th>
			    <th width="40">机长</th>
			    <th width="40">单飞</th>
			    <th width="40">转场</th>
			    <th width="40">夜间</th>
			    <th width="40">副驾驶</th>
			    <th width="40">带飞</th>
			    <th width="40">转场</th>
			    <th width="40">夜间</th>
			    <th width="40">模拟仪表</th>
			    <th width="40">真实仪表</th>
			    <th width="40">训练地点</th>
			    <th width="40">模拟机<br>
		        时间</th>
			    <th width="40">训练器<br>
		        时间</th>
		      </tr>   
		  </thead>
			<tbody>
			 <tr>
              <td align="center">${flightTrainingrecordDetail.DFlydate}</td>
              <td align="center">${flightTrainingrecordDetail.planeForm}</td>
              <td align="center">${flightTrainingrecordDetail.planeCode}</td>
              <td align="center">${flightTrainingrecordDetail.VFpos}</td>
              <td align="center">${flightTrainingrecordDetail.VLpos}</td>
              <td align="center">${flightTrainingrecordDetail.DFlymoment}</td>
              <td align="center">${flightTrainingrecordDetail.DEndmoment}</td>
              <td align="center">${flightTrainingrecordDetail.VNo}</td>
              <td align="center">${flightTrainingrecordDetail.ILangnighttimes}</td>
              <td align="center">${flightTrainingrecordDetail.ILanddaytimes}</td>
				<td align="center">${flightTrainingrecordDetail.DTrantime}</td>
				<td align="center">${flightTrainingrecordDetail.DJizhangtime}</td>
				<td align="center">${flightTrainingrecordDetail.DDanfeitime}</td>
				<td align="center">${flightTrainingrecordDetail.DZhuanchangtime}</td>
				<td align="center">${flightTrainingrecordDetail.DYejiantime}</td>
				<td align="center">${flightTrainingrecordDetail.DFujiashitime}</td>
				<td align="center">${flightTrainingrecordDetail.DDaifeitime}</td>
				<td align="center">${flightTrainingrecordDetail.DFjszhuanchangtime}</td>
				<td align="center">${flightTrainingrecordDetail.DFjszcyjtime}</td>
				<td align="center">${flightTrainingrecordDetail.DMoniyibiaotime}</td>
				<td align="center">${flightTrainingrecordDetail.DZhenshiyibiao}</td>
				<td align="center">${flightTrainingrecordDetail.VTranpos}</td>
				<td align="center">${flightTrainingrecordDetail.DMnjsj}</td>
				<td align="center">${flightTrainingrecordDetail.DXlqsj}</td>
				<td align="center"><img src="themes/cupertino/images/detail.png" title="${flightTrainingrecordDetail.VBz}"  border="0"/></td>
			  </tr>
		    </tbody>
	</table>
<br>


<table id="usersTable" class="colorTable" border="0" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
        	<thead>
			  <tr>
                <th width="200" align="left" style="padding-left:12px;">教员评语</th>
                <th width="200" align="left" style="padding-left:12px;">申诉理由</th>
                <th width="140"  align="left">申诉时间</th>
                <th width="70"  align="left">被申诉教员</th>
                <th width="310"  align="left">处理结果</th>
                <th></th>
              </tr> 
		  </thead>
			<tbody>
			  <tr>
              <td style="padding-left:12px;">${toDoing.title}</td>
              <td style="padding-left:12px;">${toDoing.submitUserId}</td>
              <td >${toDoing.submitTime}</td>
              <td>${toDoing.submitUserName}</td>
              <td><textarea  id="cresult" style="width:300px;height:60px;" class="text ui-widget-content ui-corner-all"></textarea></td>
              <td><button class="green" primary="ui-icon-button-addnew" id="querenone">处理申诉</button>
                <button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
              </td>
              </tr>
		    </tbody>
	</table>
</div>

</div>


<div id="backResultDialogForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm4Span">确认评语成功。</span></td>
</tr>
</table>
</div>
</body>
</html>
<form id="saveForm" method="post" action="saveDoWithAppeal.do">
<input type="hidden" name="appeal.VResult" id="sresult">
<input type="hidden" name="appeal.VId" value="${toDoing.infoId}">
</form>
<%@ include file="../../result.jsp"%>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#backResultDialogForm" ).dialog( "open" );
	}
});
</script>