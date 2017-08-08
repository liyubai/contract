<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>历史记录管理</title>
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
</style>
<script>
$(function() {

	$("#modalDialogButton4").click(function(){
		$("#name").val($.trim($("#cName").val()));
		$("#code").val($.trim($("#cVCode").val()));
		$("#flyMoment").val($.trim($("#DFlymoment").val()));
		$("#endMoment").val($.trim($("#DEndmoment").val()));
		$( "#searchForm" ).submit();
	});
});
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c014714a1e0b9000a</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

<div class="panelBox buttonBox" >
<table border="0" cellspacing="0" cellpadding="3" >
  <tr>
    <td style=" padding-top:8px;">姓名：<input type="text"   id="cName" class="text ui-widget-content ui-corner-all" style="width:40px;" />
     学号：<input type="text"   id="cVCode" class="text ui-widget-content ui-corner-all" style="width:70px;" />
    <!--合同编号：<input type="text"   id="htVCode" class="text ui-widget-content ui-corner-all" style="width:70px;" />--> 训练日期从：<input type="text"  id="DFlymoment" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DFlymoment:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" />
    到 <input type="text"  id="DEndmoment" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DEndmoment:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" />
    </td>
    <td>
<button class="normal" id="modalDialogButton4">查询</button></td>
  </tr>
  
</table>
</div>

 <div style="margin-top:30px; margin-left:10px;">
  <table id="usersTable" class="fcolorTable" style="width:1800px;" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >

  <thead>
    <tr>
      <th width="80" rowspan="2">姓名</th>
      <th width="80" rowspan="2">学号</th>
      <th width="100" rowspan="2">飞行日期</th>
       <th width="100" rowspan="2">操作日期</th>
      <th width="50" rowspan="2">航空器<br>
        登记号</th>
      <th colspan="4">起飞\降落站</th>
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
      <th width="55" rowspan="2">压座<br>学员</th>
      <th width="100" rowspan="2">修改原因</th>
    </tr>
    <tr>
      <th width="40">起飞站</th>
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
   <s:iterator value="page.data" status="stat">
   <s:iterator value="historyList" status="i">
    <tr>
      <td align="center">${studentName}<s:if test='#i.count==1'><font color="#4AC158">(原)</font>
      <s:set name="DFlydate0" value="DFlydate"/>
      <s:set name="planeCode0" value="planeCode"/>
      <s:set name="VFpos0" value="VFpos"/>
      <s:set name="VLpos0" value="VLpos"/>
      
      <s:set name="DFlymoment0" value="DFlymoment"/>
      <s:set name="DEndmoment0" value="DEndmoment"/>
      <s:set name="VNo0" value="VNo"/>
      <s:set name="ILanddaytimes0" value="ILanddaytimes"/>
      <s:set name="ILangnighttimes0" value="ILangnighttimes"/>
      <s:set name="DTrantime0" value="DTrantime"/>
      <s:set name="VTxy0" value="VTxy"/>
      <s:set name="VLhy0" value="VLhy"/>
      <s:set name="DJizhangtime0" value="DJizhangtime"/>
      <s:set name="DDanfeitime0" value="DDanfeitime"/>
      <s:set name="DZhuanchangtime0" value="DZhuanchangtime"/>
      
      <s:set name="DYejiantime0" value="DYejiantime"/>
      <s:set name="DFujiashitime0" value="DFujiashitime"/>
      <s:set name="DDaifeitime0" value="DDaifeitime"/>
      <s:set name="DFjszhuanchangtime0" value="DFjszhuanchangtime"/>
      <s:set name="DFjszcyjtime0" value="DFjszcyjtime"/>
      <s:set name="DMoniyibiaotime0" value="DMoniyibiaotime"/>
      <s:set name="DZhenshiyibiao0" value="DZhenshiyibiao"/>
      <s:set name="VTranpos0" value="VTranpos"/>
      <s:set name="DMnjsj0" value="DMnjsj"/>
      <s:set name="DXlqsj0" value="DXlqsj"/>
      
      <s:set name="VFlytype0" value="VFlytype"/>
      <s:set name="teacherName0" value="teacherName"/>
      <s:set name="monitorteacherName0" value="monitorteacherName"/>
      <s:set name="VSecondstudent0" value="VSecondstudent"/>
      </s:if>
      <s:else><font color="#DB6681">(改)</font></s:else></td>
      <td align="center">${studentVCode}</td>
      <td <s:if test='#DFlydate0!=DFlydate'>class="edit"</s:if> align="center">${DFlydate}</td>
      <td align="center">${DCreatedate}</td>
      <td align="center" <s:if test='#planeCode0!=planeCode'>class="edit"</s:if>>${planeCode}</td>
      <td align="center" <s:if test='#VFpos0!=VFpos'>class="edit"</s:if>>${VFpos}</td>
      <td align="center" <s:if test='#VLpos0!=VLpos'>class="edit"</s:if>>${VLpos}</td>
      <td align="center" <s:if test='#DFlymoment0!=DFlymoment'>class="edit"</s:if>>${DFlymoment}</td>
      <td align="center" <s:if test='#DEndmoment0!=DEndmoment'>class="edit"</s:if>>${DEndmoment}</td>
      <td align="center" <s:if test='#VNo0!=VNo'>class="edit"</s:if>>${VNo}</td>
      <td align="center" <s:if test='#ILanddaytimes0!=ILanddaytimes'>class="edit"</s:if>>${ILanddaytimes}</td>
      <td align="center" <s:if test='#ILangnighttimes0!=ILangnighttimes'>class="edit"</s:if>>${ILangnighttimes}</td>
      <td align="right" <s:if test='#DTrantime0!=DTrantime'>class="edit"</s:if>>${DTrantime}</td>
      <td align="right" <s:if test='#VTxy0!=VTxy'>class="edit"</s:if>>${VTxy}</td>
      <td align="right" <s:if test='#VLhy0!=VLhy'>class="edit"</s:if>>${VLhy}</td>
      <td align="center" <s:if test='#DJizhangtime0!=DJizhangtime'>class="edit"</s:if>>${DJizhangtime}</td>
      <td align="center" <s:if test='#DDanfeitime0!=DDanfeitime'>class="edit"</s:if>>${DDanfeitime}</td>
      <td align="center" <s:if test='#DZhuanchangtime0!=DZhuanchangtime'>class="edit"</s:if>>${DZhuanchangtime}</td>
      <td align="center" <s:if test='#DYejiantime0!=DYejiantime'>class="edit"</s:if>>${DYejiantime}</td>
      <td align="center" <s:if test='#DFujiashitime0!=DFujiashitime'>class="edit"</s:if>>${DFujiashitime}</td>
      <td align="center" <s:if test='#DDaifeitime0!=DDaifeitime'>class="edit"</s:if>>${DDaifeitime}</td>
      <td align="center" <s:if test='#DFjszhuanchangtime0!=DFjszhuanchangtime'>class="edit"</s:if>>${DFjszhuanchangtime}</td>
      <td align="center" <s:if test='#DFjszcyjtime0!=DFjszcyjtime'>class="edit"</s:if>>${DFjszcyjtime}</td>
      <td align="center" <s:if test='#DMoniyibiaotime0!=DMoniyibiaotime'>class="edit"</s:if>>${DMoniyibiaotime}</td>
      <td align="center" <s:if test='#DZhenshiyibiao0!=DZhenshiyibiao'>class="edit"</s:if>>${DZhenshiyibiao}</td>
      <td align="center" <s:if test='#VTranpos0!=VTranpos'>class="edit"</s:if>>${VTranpos}</td>
      <td align="center" <s:if test='#DMnjsj0!=DMnjsj'>class="edit"</s:if>>${DMnjsj}</td>
      <td align="center" <s:if test='#DXlqsj0!=DXlqsj'>class="edit"</s:if>>${DXlqsj}</td>
      <td align="center" <s:if test='#VFlytype0!=VFlytype'>class="edit"</s:if>>${VFlytype}</td>
      <td align="center" <s:if test='#teacherName0!=teacherName'>class="edit"</s:if>>${teacherName}</td>
      <td align="center" <s:if test='#monitorteacherName0!=monitorteacherName'>class="edit"</s:if>>${monitorteacherName}</td>
      <td align="center" <s:if test='#VSecondstudent0!=VSecondstudent'>class="edit"</s:if>>${VSecondstudent}</td>
      <td align="center">${DTeachertime}</td>
    </tr>
    </s:iterator>
    <tr>
      <td align="center" style="border-bottom: 2px solid #1B609E;">${studentName}<font color="#DB6681">(改)</font></td>
      <td align="center"  style="border-bottom: 2px solid #1B609E;">${studentVCode}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DFlydate0!=DFlydate'>class="edit"</s:if> >${DFlydate}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;">${DCreatedate}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#planeCode0!=planeCode'>class="edit"</s:if>>${planeCode}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#VFpos0!=VFpos'>class="edit"</s:if>>${VFpos}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#VLpos0!=VLpos'>class="edit"</s:if>>${VLpos}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DFlymoment0!=DFlymoment'>class="edit"</s:if>>${DFlymoment}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DEndmoment0!=DEndmoment'>class="edit"</s:if>>${DEndmoment}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#VNo0!=VNo'>class="edit"</s:if>>${VNo}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#ILanddaytimes0!=ILanddaytimes'>class="edit"</s:if>>${ILanddaytimes}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#ILangnighttimes0!=ILangnighttimes'>class="edit"</s:if>>${ILangnighttimes}</td>
      <td align="right" style="border-bottom: 2px solid #1B609E;" <s:if test='#DTrantime0!=DTrantime'>class="edit"</s:if>>${DTrantime}</td>
      <td align="right" style="border-bottom: 2px solid #1B609E;" <s:if test='#VTxy0!=VTxy'>class="edit"</s:if>>${VTxy}</td>
      <td align="right" style="border-bottom: 2px solid #1B609E;" <s:if test='#VLhy0!=VLhy'>class="edit"</s:if>>${VLhy}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DJizhangtime0!=DJizhangtime'>class="edit"</s:if>>${DJizhangtime}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DDanfeitime0!=DDanfeitime'>class="edit"</s:if>>${DDanfeitime}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DZhuanchangtime0!=DZhuanchangtime'>class="edit"</s:if>>${DZhuanchangtime}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DYejiantime0!=DYejiantime'>class="edit"</s:if>>${DYejiantime}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DFujiashitime0!=DFujiashitime'>class="edit"</s:if>>${DFujiashitime}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DDaifeitime0!=DDaifeitime'>class="edit"</s:if>>${DDaifeitime}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DFjszhuanchangtime0!=DFjszhuanchangtime'>class="edit"</s:if>>${DFjszhuanchangtime}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DFjszcyjtime0!=DFjszcyjtime'>class="edit"</s:if>>${DFjszcyjtime}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DMoniyibiaotime0!=DMoniyibiaotime'>class="edit"</s:if>>${DMoniyibiaotime}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DZhenshiyibiao0!=DZhenshiyibiao'>class="edit"</s:if>>${DZhenshiyibiao}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#VTranpos0!=VTranpos'>class="edit"</s:if>>${VTranpos}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DMnjsj0!=DMnjsj'>class="edit"</s:if>>${DMnjsj}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#DXlqsj0!=DXlqsj'>class="edit"</s:if>>${DXlqsj}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#VFlytype0!=VFlytype'>class="edit"</s:if>>${VFlytype}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#teacherName0!=teacherName'>class="edit"</s:if>>${teacherName}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#monitorteacherName0!=monitorteacherName'>class="edit"</s:if>>${monitorteacherName}</td>
      <td align="center" style="border-bottom: 2px solid #1B609E;" <s:if test='#VSecondstudent0!=VSecondstudent'>class="edit"</s:if>>${VSecondstudent}</td>
      <td style="border-bottom: 2px solid #1B609E;"></td>
    </tr>
    </s:iterator>
  </tbody>
</table>
<s:include value="../common/pagination_system_post.jsp" />
</div>
</div>

<form  action="open_LogListPage.do" method="post" id="searchForm">

<input type="hidden" name="flyMoment" id="flyMoment" value="${flyMoment}">
<input type="hidden" name="endMoment" id="endMoment" value="${endMoment}">
<input type="hidden" name="name" id="name" value="${name}">
<input type="hidden" name="code" id="code" value="${code}">

<input type="hidden" name="pageIndex" id="pageIndexid">
</form>
</body>
</html>