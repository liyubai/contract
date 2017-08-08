<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>统计报表</title>

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
</style>

<script>
D_WIDTH=200;

$(function() {
	$("div.dropDownList").each(function(i){
		if(i==0){var d=new $.dropDownList(i,true,180);d.button.css("width", "80px");}
		else if(i==1){var d=new $.dropDownList(i,true,180);d.button.css("width", "65px");}
		else{new $.dropDownList(i,true,110);}

	});
	//隐藏右侧内容的代码：
	$("#hideRightButton").click(function(){
		var $icon=$(this).find(".ui-icon");
		if($icon.hasClass("ui-icon-arrowthickstop-1-w")) {$("#leftPartA").hide(); modWidthD(0); $(this).attr("title","显示导航");}
		else {$("#leftPartA").show(); modWidthD(D_WIDTH); $(this).attr("title","隐藏导航");} //这个页有D_WIDTH，则用D_WIDTH，否则应该用默认的数值200
		$icon.toggleClass("ui-icon-arrowthickstop-1-e").toggleClass("ui-icon-arrowthickstop-1-w");
	});
	
	$("#modalDialogButton4").click(function(){
		$("#sbeginDate").val($("#startDate").val());
		$("#sendDate").val($("#endDate").val());
		$("#searchForm").submit();
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

<div id="topPartD">
<div class="panelBox buttonBox">
<div class="right">
<button id="hideRightButton" class="icon" icon="ui-icon-arrowthickstop-1-w" title="隐藏导航"></button>
</div>
</div>
</div>

<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px; min-width:1000px;">
<div class="panelContent">
<table  class="fcolorTable" border="1" cellspacing="0" cellpadding="0">
<tr>
<td width="70" align="center" bgcolor="#99CC00">学号</td>
<td width="60" align="center" bgcolor="#99CC00">姓名</td>
<td width="100" align="center" bgcolor="#99CC00">训练基地</td>
<td width="100" align="center" bgcolor="#99CC00">训练大队</td>
<td width="60" align="center" bgcolor="#99CC00">训练周期</td>
<td width="80" align="center" bgcolor="#99CC00">所属公司</td>
<td width="120" align="center" bgcolor="#99CC00">训练大纲</td>
<td width="90" align="center" bgcolor="#99CC00">进入训练日期</td>
<td width="60" align="center" bgcolor="#99CC00">已飞<br>
  小时数</td>
<td width="70" align="center" bgcolor="#99CC00">本周<br>
  飞行小时数</td>
<td width="70" align="center" bgcolor="#99CC00">剩余<br>
  飞行小时数</td>
<td width="50" align="center" bgcolor="#99CC00">已训练<br>
  周数</td>
<td align="center" width="70" bgcolor="#99CC00">剩余训练<br>周数</td>
</tr>
<s:iterator value="page.data" status="stat">
<tr>
<td align="center">${VCode}</td>
<td align="center">${VName}</td>
<td align="center">${jg}</td>
<td align="center">${byyx}</td>
<td align="center">${Iday}${VSyd}</td>
<td align="center">${companyName}</td>
<td align="center">${outlineName}</td>
<td align="center">${createTime}</td>
<td align="center">${zy}</td>
<td align="center">${syd}</td>
<td align="center">${jtzz}</td>
<td align="center">${xlxz}</td>
<td align="center">${xxlx}</td>
</tr>
</s:iterator> 
</table>
<s:include value="../common/pagination_system.jsp" />
</div>
</div>

</div>
</div>

<div id="dialogForm4">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555; " id="dialogForm4Span"></span>
		</div>
	</fieldset>	
</div>
<form method="post" action="open_statisticalMonthReport.do" id="searchForm">
<input type="hidden" name="beginDate" id="sbeginDate">
<input type="hidden" name="endDate" id="sendDate">
</form>
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#dialogForm4" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>