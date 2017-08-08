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
<script>
$(function() {

	$("#escid1").click(function(){//返回
		window.location.replace("open_toDoingListPage.do");
	});
	$("#escid2").click(function(){//返回
		window.location.replace("open_toDoingListPage.do");
	});
	$("#querenbutton").click(function(){//确认

		var id = $("#ids").val();
		var ids = id.split(",");
		var subjectids= "";
		var iid = "";
		var used = 0;
		for(var i=0;i<ids.length-1;i++){
			iid = ids[i].split(";")[0];
			if(getSelRadioValue('b'+iid)==""){
				used = 1;
			}else{
				used = 0;
			}
			if(getSelRadioValue('c'+iid)==""){
				subjectids+= iid+ ";0;"+used+",";
			}else{
				
				subjectids+=iid+ ";" + getSelRadioValue('c'+iid) + ";"+used+",";
			}
		}

		$("#ssubjectids").val(subjectids);
		var comment1=$.trim($("#comment1").val());
		if(comment1==""){
			$("#comment1").focus();
			alert("学员飞行前准备情况评语不能为空。");
			return;
		}
		
		var commentdate1=$.trim($("#commentdate1").val());
		if(commentdate1==""){
			$("#commentdate1").focus();
			alert("评语时间不能为空。");
			return;
		}
		var cVJishu = $.trim($("#cVJishu").val());
		if(cVJishu==""){
			$("#cVJishu").focus();
			alert("技术和程序评语不能为空。");
			return;
		}
		var cVZongjie = $.trim($("#cVZongjie").val());
		var cVCheckcomment = $.trim($("#cVCheckcomment").val());
		$("#VJishu").val(cVJishu);
		$("#VZongjie").val(cVZongjie);
		$("#VCheckcomment").val(cVCheckcomment);
		var cIPass = getSelRadioValue('cIPass');
		if(cIPass==""){
			$("#IPass").val(2);
		}else{
			$("#IPass").val(cIPass);
		}
		$("#IZpzb").val(getSelRadioValue('z1'));
		$("#IZpjs").val(getSelRadioValue('z2'));
		$("#IZp").val(getSelRadioValue('z3'));
		
		$("#VComment").val(comment1);
		$("#commentdate").val(commentdate1);
		$("#dialogForm3Warning").html("确认后学生飞行训练记录将存档，不能修改。");
		$( "#deleteDialogForm" ).dialog("open");
		
	});

	$("#backbutton").click(function(){//打回
		$( "#backDiglogForm" ).dialog( "open" );
	});
	$("#backbuttontwo").click(function(){//打回
		$( "#backDiglogForm" ).dialog( "open" );
	});
	
	$("#daishenbutton").click(function(){//代替审核
	
		var id = $("#ids").val();
		var ids = id.split(",");
		var subjectids= "";
		var iid = "";
		var used = 0;
		for(var i=0;i<ids.length-1;i++){
			iid = ids[i].split(";")[0];
			if(getSelRadioValue('b'+iid)==""){
				used = 1;
			}else{
				used = 0;
			}
			if(getSelRadioValue('c'+iid)==""){
				subjectids+= iid+ ";0;"+used+",";
			}else{
				
				subjectids+=iid+ ";" + getSelRadioValue('c'+iid) + ";"+used+",";
			}
		}
		$("#ssubjectids2").val(subjectids);
		
		if($.trim($("#comment2").val())==""){
			$("#comment2").focus();
			alert("学员飞行前准备情况评语不能为空。");
			return;
		}
		$("#scomment2").val(comment2);
		
		if($.trim($("#reason2").val())==""){
			$("#reason2").focus();
			alert("代替审核原因不能为空。");
			return;
		}
		$("#sreason2").val(reason2);
		var commentdate2=$.trim($("#commentdate2").val());
		if(commentdate2==""){
			$("#commentdate2").focus();
			alert("评语时间不能为空。");
			return;
		}
		
		var cVJishu = $.trim($("#cVJishu2").val());
		var cVZongjie = $.trim($("#cVZongjie2").val());
		var cVCheckcomment = $.trim($("#cVCheckcomment2").val());
		$("#VJishu2").val(cVJishu);
		$("#VZongjie2").val(cVZongjie);
		$("#VCheckcomment2").val(cVCheckcomment);
		var cIPass = getSelRadioValue('cIPass2');
		if(cIPass==""){
			$("#IPass2").val(2);
		}else{
			$("#IPass2").val(cIPass);
		}
		$("#IZpzb2").val(getSelRadioValue('z1'));
		$("#IZpjs2").val(getSelRadioValue('z2'));
		$("#IZp2").val(getSelRadioValue('z3'));
		$("#scommentdate2").val(commentdate2);
		//提交表单
		$("#replaceAuditForm").submit();
	});
	$( "#backDiglogForm" ).dialog({
		autoOpen: false,
		height: 260,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				if($.trim($("#comment3").val())==""){
					alert("打回原因不能为空。");
					$("#comment3").focus();
					return false;
				}
				$("#backForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#deleteDialogForm" ).dialog({//提交提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#auditForm").submit();
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
	showLessonContent($("#lessonid").val());
});
function showLessonContent(id){//显示课目
	if(id==""){
		return;	
	}
	$("#PanelLesson").html("");
	var d= "<table width=\"98%\" border=\"0\" cellpadding=\"0\" cellspacing=\"3\" style=\"line-height:20px;\"><tbody>";
	var c=getLessonContentData(id);
	$("#PanelLesson").html(d+c+ "</tbody></table>");
}
function getLessonContentData(id){//显示课目

	var content= "";
	params = {"id":id};
	$.ajax({
		async:false,
		type:"post",
		url:"showTraininglessonContentById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				//$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
				//$( "#dialogForm3" ).dialog( "open" );
				$("#PanelLesson").html("");
				return;
			}
			
			content+="<tr>";
			content+="<td height=\"24\" width=\"15%\" align=\"center\">课目名称：</td><td width=\"35%\">"+data.VName+"</td>";
			content+="<td width=\"15%\">课目编号：</td><td d width=\"35%\">"+data.VNo+"</td>";
			content+="</tr>";
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td height=\"24\" width=\"15%\" align=\"center\">版 本 &nbsp;号：</td><td width=\"35%\">"+data.VVersion+"</td>";
			content+="<td width=\"15%\">课目性质：</td><td d width=\"35%\">"+data.IKcxz+"</td>";
			content+="</tr>";
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  height=\"24\" align=\"center\">飞机性质：</td><td>"+data.IPlaneproperty+"</td>";
			content+="<td>昼夜性质：</td><td>"+data.IDaynightproperty+"</td>";
			content+="</tr>";
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  height=\"24\" align=\"center\" >本转性质：</td><td>"+data.ITrainType+"</td>";
			content+="<td>飞行性质：</td><td>"+data.IFxxz+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  height=\"24\" align=\"center\">设备类型：</td><td>"+data.IType+"</td>";
			content+="<td>训练时间：</td><td>"+data.VShebei+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td align=\"center\">是否特技：</td>";
			content+="<td  height=\"24\" colspan=\"3\">"+data.ITj+"</td>";
			content+="</tr>"

			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td align=\"center\">训练目的：</td>";
			content+="<td  height=\"24\" colspan=\"3\">"+data.VTrainpurpose.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			
			content+="<tr>";
			content+="<td align=\"center\">进入条件：</td>";
			content+="<td  height=\"24\" colspan=\"3\" >"+data.VTiaojian.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td align=\"center\">非常规项目：</td>";
			content+="<td  height=\"24\" colspan=\"3\" >"+data.VXiangmu.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
			content+="</tr>"
			
			content+="<tr>";
			content+="<td align=\"center\">特殊要求：</td>";
			content+="<td  height=\"24\" colspan=\"3\" >"+data.VTsyq.replace(/\n/g,"<br/>")+"</td>";
			content+="</tr>"
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return "";
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return "";
		}
	});	
	return content;
}
function viewSelect(sid){
	var id = $("#ids").val();
	var ids = id.split(",");
	var iid = "";
	var s = 0;
	for(var i=0;i<ids.length-1;i++){
		iid = ids[i].split(";")[0];
		if(sid=="c"+iid){
			s=ids[i].split(";")[1];
			break;
		}
	}
	if(s==100) s =0;
	var r1=document.getElementsByName(sid);
	
	for(var i=0;i<r1.length;i++){
		if(r1[i].checked==true){
			if(parseInt(r1[i].value)<parseInt(s)){
				$("#"+sid+r1[i].value).parent().css({"background":"#DB6681"});
			}
		}else{
			$("#"+sid+r1[i].value).parent().css({"background":"#FFFFFF"});
		}
	}
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div style="padding-top:8px; padding-left:6px; padding-right:6px; min-width: 1200px;">

<div class="panelHead">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="81%" height="35" style="font-weight:normal">&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="#999999">学号：</font>${flightTrainingrecordDetail.studentVCode}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="#999999">姓名：</font>${flightTrainingrecordDetail.studentName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="#999999">飞行种类：</font>${flightTrainingrecordDetail.VFlytype}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="#999999">教员：</font>${flightTrainingrecordDetail.teacherName}&nbsp;
    <s:if test='flightTrainingrecordDetail.ISeat==0'>在座</s:if><s:else>不在座</s:else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="#999999">监视教员：</font>${flightTrainingrecordDetail.monitorteacherName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="#999999">压座学员：</font>${flightTrainingrecordDetail.VSecondstudent}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font color="#999999">训练大纲：</font>${flightTrainingrecordDetail.outlineName}</td>
    <td width="19%" align="right">待审核的飞行训练记录&nbsp;&nbsp;&nbsp;</td>
  </tr>
</table></div>
<div class="panelContent">

<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2" >
        	<thead>
			  <tr>
                <th width="80" rowspan="2">日期</th>
                <th width="50" rowspan="2">航空器<br>
                型别</th>
                <th width="50" rowspan="2">航空器<br>
                登记号</th>
                <th colspan="6">起飞\降落站</th>
                <th width="50" rowspan="2">飞行科目</th>
                <th colspan="2">发动机计时器</th>
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
			    <th width="50" height="14">起飞站</th>
			    <th width="50">到达站</th>
			    <th width="28">出发</th>
			    <th width="28">起飞</th>
			    <th width="28">到达</th>
			    <th width="28">到达</th>
			    <th width="40">开始</th>
			    <th width="40">结束</th>
			    <th width="32" height="14">夜间</th>
			    <th width="32">昼间</th>
			    <th width="32">机长</th>
			    <th width="32">单飞</th>
			    <th width="32">转场</th>
			    <th width="32">夜间</th>
			    <th width="40">副驾驶</th>
			    <th width="32">带飞</th>
			    <th width="32">转场</th>
			    <th width="32">夜间</th>
			    <th width="40">模拟<br>
		        仪表</th>
			    <th width="40">真实<br>
		        仪表</th>
			    <th width="60">训练地点</th>
			    <th width="45">模拟机<br>
		        时间</th>
			    <th width="45">训练器<br>
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
              <td align="center">${flightTrainingrecordDetail.DStartmoment}</td>
              <td align="center">${flightTrainingrecordDetail.DLandmoment}</td>
              <td align="center">${flightTrainingrecordDetail.DEndmoment}</td>
              <td align="center">${flightTrainingrecordDetail.VNo}</td>
              <td align="center">${flightTrainingrecordDetail.DEngineStart}</td>
              <td align="center">${flightTrainingrecordDetail.DEngineEnd}</td>
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
	</table><br>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="40%">
<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="0" >
  
  <thead>
<tr>
<th width="52%" rowspan="2" align="center" style="padding-left:12px;">训练项目</th>
<th width="9%" rowspan="2" align="center">不适用</th>
<th width="39%" colspan="5"  align="center">成绩</th>
</tr>
<tr>
  <th  align="center">1</th>
  <th  align="center">2</th>
  <th  align="center">3</th>
  <th  align="center">4</th>
  <th  align="center">5</th>
</tr> 
  </thead>
<tbody><s:set name="lvalue" value="''"/>
<s:iterator value="lessonSubjectList" >

<s:if test='ISort==0'>
<tr>
<td colspan="7"  style="padding-left:12px; font-weight:bold"><img src="themes/cupertino/images/plane.gif" align="absmiddle"/>&nbsp;&nbsp;${VName}</td>
</tr>
</s:if>
<s:else><s:set name="lvalue" value="#lvalue + VId + ';'+DScore+','"/>
<tr>
<td style="padding-left:35px;"><s:if test='typeid==0'><font style="font-size:20px">□</font></s:if><s:else><font style="font-size:21px">■</font></s:else>&nbsp;${VName}</td>
<td align="center"><input name="b${VId}"  type="checkbox" value="0"/></td>
<td align="center"><input name="c${VId}" id="c${VId}1" type="radio" onClick="viewSelect('c${VId}')" value="1" <s:if test="DScore!=null && DScore==1">checked="CHECKED"</s:if>></td>
<td align="center"><input name="c${VId}"  id="c${VId}2" type="radio" onClick="viewSelect('c${VId}')" value="2" <s:if test="DScore!=null && DScore==2">checked="CHECKED"</s:if>></td>
<td align="center"><input name="c${VId}"  id="c${VId}3" type="radio" onClick="viewSelect('c${VId}')" value="3" <s:if test="DScore!=null && DScore==3">checked="CHECKED"</s:if>></td>
<td align="center"><input name="c${VId}" id="c${VId}4" type="radio" onClick="viewSelect('c${VId}')" value="4" <s:if test="DScore!=null && DScore==4">checked="CHECKED"</s:if>></td>
<td align="center"><input name="c${VId}" id="c${VId}5" type="radio" onClick="viewSelect('c${VId}')" value="5" <s:if test="DScore!=null && DScore==5">checked="CHECKED"</s:if>></td>
</tr >
</s:else>
</s:iterator>
</tbody>
</table><br>
<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="0" >
<thead>
<tr>
<th width="61%" rowspan="2" align="center" >总体评价</th>
<th width="39%" colspan="5"  align="center">成绩</th>
</tr>
<tr>
<th  align="center">1</th>
<th  align="center">2</th>
<th  align="center">3</th>
<th  align="center">4</th>
<th  align="center">5</th>
</tr> 
</thead>
<tbody>
<tr>
<td align="left" style="padding-left:35px;">飞行前准备情况</td>
<td align="center"><input name="z1" type="radio" value="1"></td>
<td align="center"><input name="z1" type="radio" value="2"></td>
<td align="center"><input name="z1" type="radio" value="3" checked></td>
<td align="center"><input name="z1" type="radio" value="4"></td>
<td align="center"><input name="z1" type="radio" value="5"></td>
</tr >
<tr>
<td align="left" style="padding-left:35px;">技术掌握情况</td>
<td align="center"><input name="z2" type="radio" value="1"></td>
<td align="center"><input name="z2" type="radio" value="2"></td>
<td align="center"><input name="z2" type="radio" value="3" checked></td>
<td align="center"><input name="z2" type="radio" value="4"></td>
<td align="center"><input name="z2" type="radio" value="5"></td>
</tr >
<tr>
<td align="left" style="padding-left:35px;">飞行总体评价</td>
<td align="center"><input name="z3" type="radio" value="1"></td>
<td align="center"><input name="z3" type="radio" value="2"></td>
<td align="center"><input name="z3" type="radio" value="3" checked></td>
<td align="center"><input name="z3" type="radio" value="4"></td>
<td align="center"><input name="z3" type="radio" value="5" id="abcd" ></td>
</tr >
</tbody>
</table>
<br>
<s:if test='flightTrainingrecordDetail.teacherVcode==#session.loginContext.userName'>
<table id="usersTable" class="colorTable" border="0" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
<thead>
<tr>
<th colspan="2" align="center">飞行教员评语</th>
</tr> 
</thead>
<tbody>
<tr>
<td width="27%" align="right" >学员飞行前准备情况：</td>
<td ><textarea id="comment1" style="width:350px;height:40px;" class="text ui-widget-content ui-corner-all"></textarea></td>
</tr>
<tr>
<td  align="right" >技术和程序：</td>
<td  ><textarea id="cVJishu" style="width:350px;height:40px;" class="text ui-widget-content ui-corner-all"></textarea></td>
</tr>
<tr>
<td align="right" >训练情况小结：</td>
<td ><textarea id="cVZongjie" style="width:350px;height:40px;" class="text ui-widget-content ui-corner-all"></textarea></td>
</tr>
<tr <s:if test='flightTrainingrecordDetail.kxzx==0'>style="display:none;"</s:if>>
  <td align="right" >检查结果：</td>
  <td ><input name="cIPass" type="radio" value="0">通过 &nbsp;&nbsp;<input name="IPass" type="radio" value="1">未通过</td>
</tr>
<tr <s:if test='flightTrainingrecordDetail.kxzx==0'>style="display:none;"</s:if>>
  <td align="right" >检查评语：</td>
  <td ><textarea id="cVCheckcomment" style="width:350px;height:40px;" class="text ui-widget-content ui-corner-all"></textarea></td>
</tr>
<tr>
<td align="right" >审核时间：</td>
<td ><input type="text"  id="commentdate1" class="Wdate ui-widget-content ui-corner-all text"  style="width:140px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${viewDate}"  onKeyPress="return false" onpaste="return false"  /></td>
</tr>
<tr>
  <td colspan="2" style="padding-left:12px;"><button class="green" primary="ui-icon-button-confirm" id="querenbutton">确认</button>
<button class="green" primary="ui-icon-button-addnew" id="backbutton">打回</button>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button></td>
  </tr>
</tbody>
</table>
<br>
</s:if><s:else>
<table id="usersTable" class="colorTable" border="0" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
<thead>
<tr>
<th colspan="2" align="center">飞行教员评语</th>
</tr> 
</thead>
<tbody>
<tr>
<td width="27%" align="right" >学员飞行前准备情况：</td>
<td><textarea id="comment2" style="width:350px;height:40px;" class="text ui-widget-content ui-corner-all"></textarea></td>
</tr>
<tr>
<td align="right" >技术和程序：</td>
<td ><textarea id="cVJishu2" style="width:350px;height:40px;" class="text ui-widget-content ui-corner-all"></textarea></td>
</tr>
<tr>
<td align="right" >训练情况小结：</td>
<td ><textarea id="cVZongjie2" style="width:350px;height:40px;" class="text ui-widget-content ui-corner-all"></textarea></td>
</tr>
<tr <s:if test='flightTrainingrecordDetail.kxzx==0'>style="display:none;"</s:if>>
  <td align="right" >检查结果：</td>
  <td ><input name="cIPass2" type="radio" value="0">通过 &nbsp;&nbsp;<input name="cIPass2" type="radio" value="1">未通过</td>
</tr>
<tr <s:if test='flightTrainingrecordDetail.kxzx==0'>style="display:none;"</s:if>>
  <td align="right" >检查评语：</td>
  <td ><textarea id="cVCheckcomment2" style="width:350px;height:40px;" class="text ui-widget-content ui-corner-all"></textarea></td>
</tr>
<tr>
  <td align="right" >代替审核原因：</td>
  <td ><textarea id="reason2" style="width:300px;height:60px;" class="text ui-widget-content ui-corner-all"></textarea></td>
</tr>
<tr>
<td align="right" >审核时间：</td>
<td ><input type="text"  id="commentdate2" class="Wdate ui-widget-content ui-corner-all text"  style="width:140px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${viewDate}"  onKeyPress="return false" onpaste="return false"  /></td>
</tr>
<tr>
  <td colspan="2" style="padding-left:12px;"><button class="green" primary="ui-icon-button-confirm" id="daishenbutton">代替审核</button>
    <button class="green" primary="ui-icon-button-addnew" id="backbuttontwo">打回</button>
    <button class="normal" id="escid2"><span style="font-size:13px">&lt;&lt;</span> 返回</button></td>
  </tr>
</tbody>
</table>

</s:else></td>
        <td width="60%" valign="top" id="PanelLesson"></td>
      </tr>
    </table>

</div>
</div>


<div id="backDiglogForm" title="打回">
<form id="backForm" method="post" action="saveBackTrainingRecord.do">
<input type="hidden" name="backrecord.TFlightTrainingrecord.VId" value="${id}">
<table width="98%" border="0">
    <tr>
    <td width="18%" align="right">打回原因：</td>
    <td width="82%"><textarea name="backrecord.VReason" id="comment3" style="width:300px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea></td>
    </tr>
</table>
</form>
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
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm4Span">确认评语成功。</span></td>
</tr>
</table>
</div>
</body>
</html>
<s:if test='flightTrainingrecordDetail.teacherVcode==#session.loginContext.userName'>
<form action="saveTeacherConfirm.do" method="post" id="auditForm">
<input type="hidden" name="toDoing.infoId" value="${id}">
<input type="hidden" name="toDoing.title" id="ssubjectids">
<input type="hidden" name="toDoing.type" id="VComment">
<input type="hidden" name="toDoing.submitTime" id="commentdate">

<input type="hidden" name="toDoing.VJishu" id="VJishu">
<input type="hidden" name="toDoing.VZongjie" id="VZongjie">
<input type="hidden" name="toDoing.IPass" id="IPass">
<input type="hidden" name="toDoing.VCheckcomment" id="VCheckcomment">

<input type="hidden" name="toDoing.IZpzb" id="IZpzb">
<input type="hidden" name="toDoing.IZpjs" id="IZpjs">
<input type="hidden" name="toDoing.IZp" id="IZp">
</form>
</s:if><s:else>
<form action="saveReplaceTeacherConfirm.do" method="post" id="replaceAuditForm">
<input type="hidden" name="toDoing.infoId" value="${id}">
<input type="hidden" name="toDoing.title" id="ssubjectids2">
<input type="hidden" name="toDoing.type" id="scomment2">
<input type="hidden" name="toDoing.submitTime" id="scommentdate2">
<input type="hidden" name="toDoing.submitUserName" id="sreason2">

<input type="hidden" name="toDoing.VJishu" id="VJishu2">
<input type="hidden" name="toDoing.VZongjie" id="VZongjie2">
<input type="hidden" name="toDoing.IPass" id="IPass2">
<input type="hidden" name="toDoing.VCheckcomment" id="VCheckcomment2">

<input type="hidden" name="toDoing.IZpzb" id="IZpzb2">
<input type="hidden" name="toDoing.IZpjs" id="IZpjs2">
<input type="hidden" name="toDoing.IZp" id="IZp2">
</form>
</s:else>
<%@ include file="../../result.jsp"%>
<input type="hidden"  id="lessonid" value="${flightTrainingrecordDetail.lessonId}" />
<input type="hidden"  id="ids" value="${lvalue}" />
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#backResultDialogForm" ).dialog( "open" );
	}
});
</script>