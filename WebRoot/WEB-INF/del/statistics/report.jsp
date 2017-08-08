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
<div class="panelBox buttonBox"><div class="right">
<button id="hideRightButton" class="icon" icon="ui-icon-arrowthickstop-1-w" title="隐藏导航"></button>
</div>
<table border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td>日期从：<input type="text"  id="startDate" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${beginDate}"  onKeyPress="return false" onpaste="return false" />
    到 <input type="text"  id="endDate" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({endDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"   value="${endDate}" onKeyPress="return false" onpaste="return false" />
    </td>
    <td>&nbsp;&nbsp;<button class="normal" id="modalDialogButton4">查询</button></td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;（说明：为了保证系统性能，开始日期与结束日期不要超六个月。）</td>
    </tr>
</table>


</div>
</div>

<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px; min-width:900px;">
<div class="panelContent">
<table width="100%" class="fcolorTable" border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td width="100" rowspan="3" align="center">日期</td>
    <td colspan="6" align="center" bgcolor="#99CC00" >日飞机、训练器使用情况</td>
    <td colspan="7" align="center" bgcolor="#99CCFF">日飞行时间</td>
    <td colspan="2" align="center" bgcolor="#CC99FF">日转场时间</td>
    </tr>
  <tr>
    <td width="50" align="center" bgcolor="#99CC00">C90</td>
    <td width="50" align="center" bgcolor="#99CC00">DA42</td>
    <td width="50" align="center" bgcolor="#99CC00">DA40</td>
    <td width="50" align="center" bgcolor="#99CC00">DA20</td>
    <td width="50" align="center" bgcolor="#99CC00">FTD42</td>
    <td width="50" align="center" bgcolor="#99CC00">FTD40</td>
    <td width="65" rowspan="2" align="center" bgcolor="#99CCFF">飞行架次</td>
    <td width="75" rowspan="2" align="center" bgcolor="#CCFFCC">飞机总时间</td>
    <td width="80" rowspan="2" align="center" bgcolor="#99CCFF">模拟机总时间</td>
    <td colspan="4" align="center" bgcolor="#99CCFF">机型时间统计</td>
    <td width="70" rowspan="2" align="center" bgcolor="#CC99FF">转场总架次</td>
    <td rowspan="2" align="center" bgcolor="#CC99FF">学员单飞转场架次统计</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#99CC00">3</td>
    <td align="center" bgcolor="#99CC00">8</td>
    <td align="center" bgcolor="#99CC00">32</td>
    <td align="center" bgcolor="#99CC00">2</td>
    <td align="center" bgcolor="#99CC00">1</td>
    <td align="center" bgcolor="#99CC00">3</td>
    <td width="50" align="center" bgcolor="#99CCFF">C90</td>
    <td width="50" align="center" bgcolor="#99CCFF">DA42</td>
    <td width="50" align="center" bgcolor="#99CCFF">DA40</td>
    <td width="50" align="center" bgcolor="#99CCFF">DA20</td>
    </tr>
    <s:iterator value="statisticsByDayList" status="i">
    <s:if test='flag==0'><s:set name="bgcolor" value="'#FF99CC'"/></s:if>
    <s:if test='flag==1'><s:set name="bgcolor" value="'#FFFFFF'"/></s:if>
    <s:if test='flag==2'><s:set name="bgcolor" value="'#FFFF99'"/></s:if>
    <s:if test='flag==3'><s:set name="bgcolor" value="'#CCFFCC'"/></s:if>
    <s:if test='#i.index==statisticsByDayList.size()-1'>
    
  <tr>
    <td align="center" bgcolor="#FFCC00">${flyDate}</td>
    <td align="center" bgcolor="#FFCC00">${c90}</td>
    <td align="center" bgcolor="#FFCC00">${da42}</td>
    <td align="center" bgcolor="#FFCC00">${da40}</td>
    <td align="center" bgcolor="#FFCC00">${da20}</td>
    <td align="center" bgcolor="#FFCC00">${ftd42}</td>
    <td align="center" bgcolor="#FFCC00">${ftd40}</td>
    <td align="center" bgcolor="#FFCC00">${flyNumber}</td>
    <td align="center" bgcolor="${bgcolor}">${flyTime}</td>
    <td align="center" bgcolor="#FFCC00">${mnjTime}</td>
    <td align="center" bgcolor="#FFCC00">${c90Time}</td>
    <td align="center" bgcolor="#FFCC00">${da42Time}</td>
    <td align="center" bgcolor="#FFCC00">${da40Time}</td>
    <td align="center" bgcolor="#FFCC00">${da20Time}</td>
    <td align="center" bgcolor="#FFCC00">${zcNumber}</td>
    <td align="center" bgcolor="#FFCC00">${zcdfNumber}</td>
  </tr>
  </s:if><s:else>
  <tr>
    <td align="center">${flyDate}</td>
    <td align="center">${c90}</td>
    <td align="center">${da42}</td>
    <td align="center">${da40}</td>
    <td align="center">${da20}</td>
    <td align="center">${ftd42}</td>
    <td align="center">${ftd40}</td>
    <td align="center">${flyNumber}</td>
    <td align="center" bgcolor="${bgcolor}">${flyTime}</td>
    <td align="center">${mnjTime}</td>
    <td align="center">${c90Time}</td>
    <td align="center">${da42Time}</td>
    <td align="center">${da40Time}</td>
    <td align="center">${da20Time}</td>
    <td align="center">${zcNumber}</td>
    <td align="center">${zcdfNumber}</td>
  </tr>
  </s:else>
  </s:iterator>

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
<form method="post" action="open_statisticalReport.do" id="searchForm">
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