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
</style>
<script>
$(function() {
	$("div.dropDownList").find("button").css("width","90px").end().each(function(i){
		new $.dropDownList(i,true,90);
	})
	$("#modalDialogButton4").click(function(){//未确认
		$("#statusid").val($("#cstatus").val());
		$("#flyMoment").val($.trim($("#DFlymoment").val()));
		$("#endMoment").val($.trim($("#DEndmoment").val()));
		$( "#searchForm" ).submit();
	});
	
	$("#querenbutton").click(function(){//审核通过
		$("#type").val(1);
		var id = getSelRadioValue('record');
		if(id==""){
			alert("请选择要审核的记录。");
			return;
		}
		var iid = id.split(",")[0];
		var status = id.split(",")[1];
		if(status==1 || status==2){
			alert("选中的记录已审核，不能再次审核。");
			return;
		}
		$("#id").val(iid);
		$("#statusid2").val($("#cstatus").val());
		$("#flyMoment2").val($.trim($("#DFlymoment").val()));
		$("#endMoment2").val($.trim($("#DEndmoment").val()));
		$("#auditForm").submit();
	});

	$("#backbutton").click(function(){//审核不通过
		$("#type").val(2);
				var id = getSelRadioValue('record');
		if(id==""){
			alert("请选择要审核的记录。");
			return;
		}
		var iid = id.split(",")[0];
		var status = id.split(",")[1];
		if(status==1 || status==2){
			alert("选中的记录已审核，不能再次审核。");
			return;
		}
		$("#id").val(iid);
		$("#statusid2").val($("#cstatus").val());
		$("#flyMoment2").val($.trim($("#DFlymoment").val()));
		$("#endMoment2").val($.trim($("#DEndmoment").val()));
		$("#auditForm").submit();
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

});
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149b5bb20001</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

<div class="panelBox buttonBox" >
<table border="0" cellspacing="0" cellpadding="3" >
  <tr><td><button class="green" primary="ui-icon-button-confirm" id="querenbutton">审核通过</button>
<button class="green" id="backbutton">审核不通过</button>
</td>
    <td style=" padding-top:8px;">
    日期从：<input type="text"  id="DFlymoment" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DFlymoment:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" />
    到 <input type="text"  id="DEndmoment" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DEndmoment:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" />
    </td>
<td><div class="dropDownList">
<button>状态</button>
<ul>
<li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>状态</a></li>
<li><a href="#N" val="0">待审核</a></li>
<li><a href="#N" val="1">审核通过</a></li>
<li><a href="#N" val="2">未通过</a></li>
</ul>
<input type="hidden" id="cstatus" value="${status}" />
</div><button class="normal" id="modalDialogButton4">查询</button></td>
  </tr>
</table>
</div>

 <div style="margin-top:30px; margin-left:10px;">
 <table id="usersTable" class="fcolorTable" style="width:1500px;" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2" >
        	<thead>
			  <tr>
                <th width="40" rowspan="2">选项</th>
                <th width="50" rowspan="2">姓名</th>
                <th width="80" rowspan="2">飞行日期</th>
                <th width="60" rowspan="2">状态</th>
               
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
                <th rowspan="2">&nbsp;</th>
              </tr>
			  <tr>
			    <th width="50" height="14">起飞站</th>
			    <th width="50">到达站</th>
			    <th width="50">出发<br>
		        时刻</th>
			    <th width="50">到达<br>
		        时刻</th>
			    <th width="50" height="14">夜间</th>
			    <th width="50">昼间</th>
			    <th width="50">机长</th>
			    <th width="50">单飞</th>
			    <th width="50">转场</th>
			    <th width="50">夜间</th>
			    <th width="50">副驾驶</th>
			    <th width="50">带飞</th>
			    <th width="50">转场</th>
			    <th width="50">夜间</th>
			    <th width="50">模拟仪表</th>
			    <th width="50">真实仪表</th>
			    <th width="50">训练地点</th>
			    <th width="50">模拟机<br>
		        时间</th>
			    <th width="50">训练器<br>
		        时间</th>
		      </tr>   
		  </thead>
			<tbody>
             <s:iterator value="page.data" status="stat">
			 <tr>
              <td align="center"><input name="record" type="radio" value="${VId},${status}"><b></b></td>
              <td align="center">${studentName}</td>
              <td align="center">${DFlydate}</td>
              <td align="center" <s:if test='status==2'>style="color:#EB7979"</s:if> <s:if test='status==1'>style="color:#50A13B"</s:if>>${VBz}</td>
              <td align="center">${planeForm}</td>
              <td align="center">${planeCode}</td>
              <td align="center">${VFpos}</td>
              <td align="center">${VLpos}</td>
              <td align="center">${DFlymoment}</td>
              <td align="center">${DEndmoment}</td>
              <td align="center">${ILangnighttimes}</td>
              <td align="center">${ILanddaytimes}</td>
				<td align="center">${DTrantime}</td>
				<td align="center">${DJizhangtime}</td>
				<td align="center">${DDanfeitime}</td>
				<td align="center">${DZhuanchangtime}</td>
				<td align="center">${DYejiantime}</td>
				<td align="center">${DFujiashitime}</td>
				<td align="center">${DDaifeitime}</td>
				<td align="center">${DFjszhuanchangtime}</td>
				<td align="center">${DFjszcyjtime}</td>
				<td align="center">${DMoniyibiaotime}</td>
				<td align="center">${DZhenshiyibiao}</td>
				<td align="center">${VTranpos}</td>
				<td align="center">${DMnjsj}</td>
				<td align="center">${DXlqsj}</td>
				<td align="center">&nbsp;</td>
			  </tr>
              </s:iterator>
		    </tbody>
	</table>
</table>
<s:include value="../common/pagination_system_post.jsp" />
</div>
</div>


<div id="dialogForm3">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</div>
<form  action="open_otherFlightTrainingRecordList.do" method="post" id="searchForm">
<input type="hidden" name="flyMoment" id="flyMoment" value="${flyMoment}">
<input type="hidden" name="endMoment" id="endMoment" value="${endMoment}">
<input type="hidden" name="status" id="statusid" value="${status}">
<input type="hidden" name="pageIndex" id="pageIndexid">
</form>
<form action="saveOtherRecordConfirm.do" method="post" id="auditForm">
<input type="hidden" name="toDoing.infoId" id="id">
<input type="hidden" name="toDoing.type" id="type">
<input type="hidden" name="flyMoment" id="flyMoment2">
<input type="hidden" name="endMoment" id="endMoment2">
<input type="hidden" name="status" id="statusid2">
</form>
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm3Warning").html(operateResult);
		$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>