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
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>
<style>
.bwidth{ width:45px;}
</style>

<script>
$(function() {
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		if(i==2){var d=new $.dropDownList(i,true,335);d.button.css("width", "100px");}
		else if(i==1){var d=new $.dropDownList(i,true,335);d.button.css("width", "100px");}
		else if(i==0){var d=new $.dropDownList(i,true,110);d.button.css("width", "110px");}
		else{new $.dropDownList(i,true,100);}
	});
	$("#escid1").click(function(){//返回
		window.location.replace("open_toDoingListPage.do");
	});

	$("#querenone").click(function(){//确认

		var other = document.getElementsByName("cflight");
		var str = "";
		var v= "";
		for(i=0;i<12;i++){//前12项
			v= other[i].value;
			if(i!=10 && v!="" && isNaN(v)){
				
				alert("请输入正确的时间格式：如0140代表1小时40分钟。");
				other[i].focus();
				return;
			}
			if(i!=10 && v!="" && v.length!=4){
				alert("请输入正确的时间格式：如0140代表1小时40分钟。");
				other[i].focus();
				return;
			}
			
		}

		for(i=0;i<other.length;i++){
			if(other[i].value==""){
				str+= "0,";
			}else{
				str+= other[i].value+",";
			}
		}
		
		$("#sothers").val(str);
		$("#sVFlytype").val($("#cVFlytype").val());
		$("#sVTeacherid").val($("#cVTeacherid").val());
		$("#sVMonitorteacherid").val($("#cVMonitorteacherid").val());
		$("#sVSecondstudent").val($("#cVSecondstudent").val());
		$("#sDFlydate").val($("#cDFlydate").val());
		$("#splaneid").val($("#cplaneid").val());
		$("#sVFpos").val($("#cVFpos").val());
		$("#sVLpos").val($("#cVLpos").val());
		$("#sflyMoment").val($("#cDFlymoment").val());
		$("#sendMoment").val($("#cDEndmoment").val());
		$("#slessonid").val($("#clessonid").val());
		$("#sDTrantime").val($("#cDTrantime").val());
		var ntimes = $("#cILangnighttimes").val();
		if(!checkisNum(ntimes)){
			alert("夜间着陆次数应为数字。");
			$("#cILangnighttimes").focus();
			return;
		}
		$("#sILangnighttimes").val(ntimes);//夜间次数
		var dtimes = $("#cILanddaytimes").val();
		if(!checkisNum(dtimes)){
			alert("昼间着陆次数应为数字。");
			$("#cILanddaytimes").focus();
			return;
		}
		$("#sILanddaytimes").val(dtimes);//昼间次数
		$("#saveRecord").submit();
		//$( "#deleteDialogForm" ).dialog( "open" );
	});


	$( "#deleteDialogForm" ).dialog({//提交提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
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

<div class="panelHeadFch">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="82%" height="35" style="font-weight:normal">&nbsp;&nbsp;
    <font color="999999">学号：</font>${flightTrainingrecordDetail.studentVCode}&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="999999">姓名：</font>${flightTrainingrecordDetail.studentName}&nbsp;&nbsp;&nbsp;
    <font color="999999">飞行种类：</font><div class="dropDownList">
    <button>训练</button>
    <ul>
    <s:iterator value="flyTypeList" status="statu">
    <li><a href="#N" val="${VId}">
    	<s:if test='flightTrainingrecordDetail.VFlytypeid==VId'>
        <span class="ui-icon ui-icon-bullet"></span>
        </s:if>${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="cVFlytype" value="${flightTrainingrecordDetail.VFlytypeid}"/>
    </div>&nbsp;&nbsp;&nbsp;
    <font color="999999">教员：</font>
    <div class="dropDownList">
    <button>教员</button>
    <ul>
    <li>
    <s:iterator value="teacherBaseInfoList" status="statu">
    	<a href="#N" val="${VId}" class="inline bwidth">
        <s:if test='flightTrainingrecordDetail.teacherid==VId'>
        	<span class="ui-icon ui-icon-bullet"></span>
        </s:if>
    	${VName}</a>
    </s:iterator>
    </li>
    </ul>
    <input type="hidden"  id="cVTeacherid" value="${flightTrainingrecordDetail.teacherid}"/>
    </div>
    &nbsp;&nbsp;&nbsp;
    <font color="999999">监视教员：</font>
<div class="dropDownList">
<button>监视教员</button>
<ul>
<li><a href="#N" class="inline bwidth" val="0"><s:if test='flightTrainingrecordDetail.monitorteacherid==0'><span class="ui-icon ui-icon-bullet"></span></s:if>无</a>
<s:iterator value="teacherBaseInfoList" status="statu">
<a href="#N" val="${VId}" class="inline bwidth">
<s:if test='flightTrainingrecordDetail.monitorteacherid==VId'>
<span class="ui-icon ui-icon-bullet"></span>
</s:if>
${VName}</a>
</s:iterator>
</ul>
<input type="hidden"  id="cVMonitorteacherid" value="${flightTrainingrecordDetail.monitorteacherid}"/>
</div>
    &nbsp;&nbsp;
    <font color="999999">压座学员：</font><input type="text"  id="cVSecondstudent" class="text ui-widget-content ui-corner-all"  style="width:50px;"  value="${flightTrainingrecordDetail.VSecondstudent}"/>&nbsp;&nbsp;<font color="999999">日期：</font><input type="text"  id="cDFlydate" class="Wdate ui-widget-content ui-corner-all text"  style="width:90px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDFlydate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${flightTrainingrecordDetail.DFlydate}" onKeyPress="return false" onpaste="return false" /></td>
    <td width="18%" align="right">待改正的被打回飞行训练记录&nbsp;&nbsp;</td>
  </tr>
</table></div>
<div class="panelContent">

<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="0" >
        	<thead>
			  <tr>
                <th width="50" rowspan="2">航空器<br>
                登记号</th>
                <th colspan="4">起飞\降落站</th>
                <th width="50" rowspan="2">飞行<br>
科目</th>
                <th colspan="2">着陆次数</th>
                <th rowspan="2" width="50">驾驶员<br>
                  飞行时间</th>
                <th colspan="4">机长或单飞时间</th>
                <th colspan="4">副驾驶或带飞时间</th>
                <th colspan="2">仪表飞行时间</th>
                <th colspan="3">模拟机\训练器</th>
                <th rowspan="2">备注</th>
              </tr>
			  <tr>
			    <th width="50" height="14">起飞站</th>
			    <th width="50">到达站</th>
			    <th width="50">出发<br>
		        时刻</th>
			    <th width="50">到达<br>
		        时刻</th>
			    <th width="40" height="14">夜间</th>
			    <th width="40">昼间</th>
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
              <tr>
              <td align="center"><input type="text"  id="cplaneid" class="text ui-widget-content ui-corner-all"  style="width:40px;" value="${flightTrainingrecordDetail.planeCode}" /></td>
              <td align="center"><input type="text"  id="cVFpos" class="text ui-widget-content ui-corner-all"  style="width:35px;" value="${flightTrainingrecordDetail.VFpos}" /></td>
              <td align="center"><input type="text"  id="cVLpos" class="text ui-widget-content ui-corner-all"  style="width:35px;" value="${flightTrainingrecordDetail.VLpos}" /></td>
              <td align="center"><input type="text"  id="cDFlymoment" class="text ui-widget-content ui-corner-all"  style="width:35px;" value="${flightTrainingrecordDetail.DFlymoment}" /></td>
              <td align="center"><input type="text"  id="cDEndmoment" class="text ui-widget-content ui-corner-all"  style="width:35px;" value="${flightTrainingrecordDetail.DEndmoment}" /></td>
              <td align="center"><input type="text"  id="clessonid" class="text ui-widget-content ui-corner-all"  style="width:35px;" value="${flightTrainingrecordDetail.VNo}" /></td>
              <td align="center"><input type="text"  id="cILangnighttimes" class="text ui-widget-content ui-corner-all"  style="width:35px;" value="${flightTrainingrecordDetail.ILangnighttimes}" /></td>
              <td align="center"><input type="text"  id="cILanddaytimes" class="text ui-widget-content ui-corner-all"  style="width:35px;" value="${flightTrainingrecordDetail.ILanddaytimes}" /></td>
				<td align="center"><input type="text"  id="cDTrantime" class="text ui-widget-content ui-corner-all" style="width:35px;"  value="${flightTrainingrecordDetail.DTrantime}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all" maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DJizhangtime}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DDanfeitime}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DZhuanchangtime}"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DYejiantime}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"   style="width:35px;"  value="${flightTrainingrecordDetail.DFujiashitime}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"   maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DDaifeitime}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DFjszhuanchangtime}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"   maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DFjszcyjtime}" /></td>
                <td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DMoniyibiaotime}" /></td>
                <td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DZhenshiyibiao}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:35px;" value="${flightTrainingrecordDetail.VTranpos}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DMnjsj}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"   maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DXlqsj}" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:80px;" value="${flightTrainingrecordDetail.VBz}" /></td>
			  </tr>
		    </tbody>
	</table>
<span class="panelLine"></span>
<table id="usersTable" class="colorTable" border="0" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
        	<thead>
			  <tr>
                <th width="600" align="left" style="padding-left:12px;">打回原因</th>
                <th width="150"  align="left">打回时间</th>
                <th width="60"  align="left">审核人</th>
                <th>&nbsp;</th>
              </tr> 
		  </thead>
			<tbody>
			  <tr>
              <td style="padding-left:12px;">${toDoing.title}</td>
              <td >${toDoing.submitTime}</td>
              <td>${toDoing.submitUserName}</td>
              <td><button class="green" primary="ui-icon-button-confirm" id="querenone">保存</button>
    <button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
    </td>
              </tr>
		    </tbody>
	</table>
</div>
</div>

<div id="deleteDialogForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</div>

<div id="backResultDialogForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm4Span">记录修改成功。</span></td>
</tr>
</table>
</div>
</body>
</html>
<form id="saveRecord" method="post" action="updateFlightTrainingRecord.do">
<input type="hidden" name="editTrainingRecord.t1"  value="${id}" />
<input type="hidden" name="editTrainingRecord.t2" id="sVFlytype" value="${flightTrainingrecordDetail.VFlytypeid}">
<input type="hidden" name="editTrainingRecord.t3" id="sVTeacherid" value="${flightTrainingrecordDetail.teacherid}">
<input type="hidden" name="editTrainingRecord.t4" id="sVMonitorteacherid" value="${flightTrainingrecordDetail.monitorteacherid}">
<input type="hidden" name="editTrainingRecord.t5" id="sVSecondstudent">
<input type="hidden" name="editTrainingRecord.t6" id="sDFlydate">
<input type="hidden" name="editTrainingRecord.t7" id="splaneid" />
<input type="hidden" name="editTrainingRecord.t8" id="sVFpos">
<input type="hidden" name="editTrainingRecord.t9" id="sVLpos">
<input type="hidden" name="editTrainingRecord.t10" id="sflyMoment">
<input type="hidden" name="editTrainingRecord.t11" id="sendMoment">
<input type="hidden" name="editTrainingRecord.t12" id="slessonid" />
<input type="hidden" name="editTrainingRecord.t13" id="sILangnighttimes">
<input type="hidden" name="editTrainingRecord.t14" id="sILanddaytimes">
<input type="hidden" name="editTrainingRecord.t15" id="sDTrantime">
<input type="hidden" name="editTrainingRecord.t16" id="sothers">
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