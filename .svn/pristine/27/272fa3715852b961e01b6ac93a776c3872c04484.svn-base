<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>转场课程统计</title>
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
.cscore{font-weight: bold; color:#FF0000;}
.edit{color:#DB6681;}
.old{color:#4AC158;}
.bottom{border-bottom: 2px solid #1B609E;}
</style>
<script>
$(function() {
	$("div.dropDownList").each(function(i){
		var d=new $.dropDownList(i,true,80);d.button.css("width", "80px");
	});
	$("#modalDialogButton4").click(function(){//未确认
		$("#name").val($.trim($("#cName").val()));
		$("#code").val($.trim($("#cVCode").val()));
		$("#flyMoment").val($.trim($("#DFlymoment").val()));
		$("#endMoment").val($.trim($("#DEndmoment").val()));
		$("#lesson").val($.trim($("#lessonid").val()));
		$( "#searchForm" ).submit();
	});
	
	$( "#dialogForm3" ).dialog({//操作数据库返回提示窗口
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
	$( "#contentDialogForm" ).dialog({
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	$("#noSameDayButton").click(function(){
		window.location.replace("open_zhuanChangNoSameDayRecordPage.do");
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

<div id="rightPartA"><div>

<div class="panelBox buttonBox" >
<div class="dropDownList">
<button>课程</button>
<ul>
<li><a href="#N" class="inline" style="width:40px;" val=""><span class="ui-icon ui-icon-bullet"></span>课程</a> 
<s:iterator value="lessonList">
<a href="#N" val="${VNo}" class="inline" style="width:40px;">${VNo}</a>
</s:iterator></li>
</ul><input type="hidden"  id="lessonid" value="${lesson}"/>
</div>
<div style="float:left">姓名：<input type="text"   id="cName" class="text ui-widget-content ui-corner-all" style="width:40px;" />
学号：<input type="text"    id="cVCode" class="text ui-widget-content ui-corner-all" style="width:70px;" />
训练日期从：<input type="text"  id="DFlymoment" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DFlymoment:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" />
到 <input type="text"  id="DEndmoment" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DEndmoment:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" />
</div>
<button class="normal" id="modalDialogButton4">查询</button><button class="normal" id="noSameDayButton">不是同一天记录</button>
</div>

 <div style="margin-top:20px; margin-left:10px;">
  <table id="usersTable" class="fcolorTable" style="width:1620px;" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >

  <thead>
    <tr>
      <th width="55" rowspan="2">姓名</th>
      <th width="80" rowspan="2">学号</th>
      <th width="100" rowspan="2">日期</th>
      <th width="50" rowspan="2">航空器<br>
        登记号</th>
      <th colspan="5">起飞\降落站</th>
      <th width="50" rowspan="2">飞行<br>
        科目</th>
      <th colspan="2">起落次数</th>
      <th rowspan="2" width="50">驾驶员<br>
        飞行时间</th>
      <th rowspan="2" width="50">昼间飞行时间</th>
      <th rowspan="2" width="50">夜间飞行时间</th>
      <th colspan="4">机长或单飞时间</th>
      <th colspan="4">副驾驶或带飞时间</th>
      <th colspan="2">仪表飞行时间</th>
      <th colspan="3">模拟机\训练器</th>
      <th width="65" rowspan="2">飞行种类</th>
      <th width="50" rowspan="2">教员</th>
      <th width="55" rowspan="2">监视<br>
        教员</th>
      <th width="55" rowspan="2">压座<br>
        学员</th>
    </tr>
    <tr>
      <th width="40">起飞站</th>
      <th width="40">经停站</th>
      <th width="40">降落站</th>
      <th width="35">出发时刻</th>
      <th width="35">到达时刻</th>
      <th width="30">昼间</th>
      <th width="30">夜间</th>
      <th width="30">机长</th>
      <th width="30">单飞</th>
      <th width="30">转场</th>
      <th width="30">夜间</th>
      <th width="40">副驾驶</th>
      <th width="30">带飞</th>
      <th width="30">转场</th>
      <th width="30">夜间</th>
      <th width="50">模拟<br>
        仪表</th>
      <th width="50">真实<br>
        仪表</th>
      <th width="50">训练地点</th>
      <th width="50">模拟机<br>
        时间</th>
      <th width="50">训练器<br>
        时间</th>
      </tr>
  </thead>
  <tbody>
 <s:set name="p" value="0"/>
<s:iterator value="page.data" status="stat">
<s:set name="p" value="#p+1"/>
<s:iterator value="historyList" status="i">
<tr <s:if test='#p%2==0'>bgcolor="#E6E6E6"</s:if><s:else>bgcolor="#FFFFFF"</s:else>>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${studentName}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${studentVCode}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DFlydate}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${planeCode}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${VFpos}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${VJtpos}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${VLpos}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DFlymoment}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DEndmoment}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${VNo}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${ILanddaytimes}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${ILangnighttimes}</td>
<td align="right" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DTrantime}</td>
<td align="right" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${VTxy}</td>
<td align="right" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${VLhy}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DJizhangtime}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DDanfeitime}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DZhuanchangtime}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DYejiantime}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DFujiashitime}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DDaifeitime}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DFjszhuanchangtime}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DFjszcyjtime}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DMoniyibiaotime}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DZhenshiyibiao}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${VTranpos}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DMnjsj}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${DXlqsj}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${VFlytype}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${teacherName}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${monitorteacherName}</td>
<td align="center" <s:if test='#i.count==historyList.size()'>class="bottom"</s:if>>${VSecondstudent}</td>
</tr>
</s:iterator></s:iterator>

  </tbody>
</table>
<s:include value="../common/pagination_system_post.jsp" />
</div>
</div>
<div id="contentDialogForm" title="教员评定">
<span id="pingyu"></span>
<span id="subjectScore"></span>
</div>

<div id="dialogForm3">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</div>
<form  action="open_AFL52TrainingLessonRecordPage.do" method="post" id="searchForm">
<input type="hidden" name="flyMoment" id="flyMoment" value="${flyMoment}">
<input type="hidden" name="endMoment" id="endMoment" value="${endMoment}">

<input type="hidden" name="name" id="name" value="${name}">
<input type="hidden" name="code" id="code" value="${code}">
<input type="hidden" name="lesson" id="lesson" value="${lesson}">
<input type="hidden" name="pageIndex" id="pageIndexid">
</form>
</body>
</html>