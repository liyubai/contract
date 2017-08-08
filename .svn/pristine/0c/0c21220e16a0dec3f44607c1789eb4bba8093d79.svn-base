<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>其它飞行经历记录审核</title>

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
		$("#type").val(1);
		$("#auditForm").submit();
	});

	$("#backbutton").click(function(){//审核不通过
		$("#type").val(2);
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
    <td width="81%" height="35" style="font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">姓名：</font>${teacherid}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">飞行种类：</font>${viewRecord.VFlytype}</td>
    <td width="19%" align="right">待审核的其它飞行经历记录&nbsp;&nbsp;&nbsp;</td>
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
              <td align="center">${viewRecord.DFlydate}</td>
              <td align="center">${viewRecord.planeForm}</td>
              <td align="center">${viewRecord.planeCode}</td>
              <td align="center">${viewRecord.VFpos}</td>
              <td align="center">${viewRecord.VLpos}</td>
              <td align="center">${viewRecord.DFlymoment}</td>
              <td align="center">${viewRecord.DEndmoment}</td>
              <td align="center">${viewRecord.ILangnighttimes}</td>
              <td align="center">${viewRecord.ILanddaytimes}</td>
				<td align="center">${viewRecord.DTrantime}</td>
				<td align="center">${viewRecord.DJizhangtime}</td>
				<td align="center">${viewRecord.DDanfeitime}</td>
				<td align="center">${viewRecord.DZhuanchangtime}</td>
				<td align="center">${viewRecord.DYejiantime}</td>
				<td align="center">${viewRecord.DFujiashitime}</td>
				<td align="center">${viewRecord.DDaifeitime}</td>
				<td align="center">${viewRecord.DFjszhuanchangtime}</td>
				<td align="center">${viewRecord.DFjszcyjtime}</td>
				<td align="center">${viewRecord.DMoniyibiaotime}</td>
				<td align="center">${viewRecord.DZhenshiyibiao}</td>
				<td align="center">${viewRecord.VTranpos}</td>
				<td align="center">${viewRecord.DMnjsj}</td>
				<td align="center">${viewRecord.DXlqsj}</td>
				<td align="center"><img src="themes/cupertino/images/detail.png" title="${viewRecord.VBz}"  border="0"/></td>
			  </tr>
		    </tbody>
	</table>
<br>
<button class="green" primary="ui-icon-button-confirm" id="querenbutton">审核通过</button>
<button class="green" primary="ui-icon-button-addnew" id="backbutton">审核不通过</button>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button></td>
<br>
</div>
</div>

</body>
</html>

<form action="saveOtherRecordConfirm.do" method="post" id="auditForm">
<input type="hidden" name="toDoing.infoId" value="${id}">
<input type="hidden" name="toDoing.type" id="type">
</form>