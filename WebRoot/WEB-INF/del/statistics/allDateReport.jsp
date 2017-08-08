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

<div class="Panel" id="Panel1" style="margin-top: 5px; min-width:900px;">
<div class="panelContent">
  <table width="50%" class="fcolorTable" border="1" cellspacing="0" cellpadding="0">
  <tr>
            <td width="240" align="right" bgcolor="#CCFFCC">已经参加训练的学生人数：</td>
            <td width="366">&nbsp;&nbsp;&nbsp;&nbsp;${statistics.flyDate}</td>
            </tr>
          <tr>
            <td align="right" bgcolor="#99CC00">总小时数：</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${statistics.c90}</td>
          </tr>
          <tr>
            <td align="right" bgcolor="#CCFFCC">已飞小时数：</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${statistics.da42}</td>
          </tr>
          <tr>
            <td align="right" bgcolor="#99CC00">未飞小时数：</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${statistics.da40}</td>
          </tr>
          <tr>
            <td align="right" bgcolor="#CCFFCC">已飞百分比：</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${statistics.da20}%</td>
          </tr>
          <tr>
            <td align="right" bgcolor="#99CC00">剩百分比：</td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;${statistics.ftd42}%</td>
          </tr>


</table>

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