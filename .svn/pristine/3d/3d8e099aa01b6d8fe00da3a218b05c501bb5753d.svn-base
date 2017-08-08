<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>飞行训练管理</title>
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
fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
.c1{padding-top:8px; padding-left:10px; padding-right:10px;}
.pview{display:block;}
.phide{display:none;}
.awidth{ width:70px;}
.bwidth{ width:45px;}
</style>
<script>

$(function() {
	
	$("div.dropDownList").find("button").css("width","120px").end().each(function(i){
		if(i==2){var d=new $.dropDownList(i,true,450);d.button.css("width", "120px");}
		else if(i==0){var d=new $.dropDownList(i,true,120);d.button.css("width", "120px");}
		else if(i==4){var d=new $.dropDownList(i,true,250);d.button.css("width", "97px");}
		else if(i==5){var d=new $.dropDownList(i,true,280);d.button.css("width", "97px");}
		//else if(i==6){var d=new $.dropDownList(i,true,280);d.button.css("width", "97px");}
		else if(i==6){var d=new $.dropDownList(i,true,280);d.button.css("width", "97px");}
		else if(i==7){var d=new $.dropDownList(i,true,250);d.button.css("width", "120px");}
		else{new $.dropDownList(i,true,120);}
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

	$("#cDFlymoment").blur(function(){
		if(!execFlyMoment()){
			return;	
		}
		
		if(!execEndMoment()){
			return;	
		}
		getFlightTime();
		
	});
	$("#cDEndmoment").blur(function(){
		
		if(!execFlyMoment()){
			return;	
		}
		
		if(!execEndMoment()){
			return;	
		}
		getFlightTime();
		
	});

	$("#saveReocrdButton").click(function(){
		//获取其它内容字段
		var other = document.getElementsByName("cflight");
		var str = "";
		var v= "";
		for(i=0;i<14;i++){//前12项
			v= other[i].value;
			if(i!=10 && v!="" && v.indexOf(":")==-1){
				other[i].value="";
				other[i].focus();
				alert("请输入正确的时间格式：如1:30代表1小时30分钟。");
				return;
			}
			if(i!=10 && v!=""){
				v = v.replace(":","");
				if(isNaN(v)){
					other[i].value="";
					other[i].focus();
					alert("请输入正确的时间格式：如1:30代表1小时30分钟。");
					return;
				}
				var v0 = "";
				var v1 = "";
				var v2 = "";
				if(v.indexOf(":")==-1){
					v1 = v.substring(0,2);
					v2 = v.substring(2,v.length);
					if(v1>23 || v1<0){
						other[i].value="";
						other[i].focus();
						alert("请输入正确的时间格式：如1:30代表1小时30分钟。");
						return false;
					}
					if(v2>59 || v2<0){
						other[i].value="";
						other[i].focus();
						alert("请输入正确的时间格式：如1:30代表1小时30分钟。");
						return false;
					}
				}
			}
		}
		
		for(i=0;i<other.length;i++){
			if(other[i].value==""){
				str+= "0,";
			}else{
				str+= other[i].value+",";
			}
		}
		var cDFlydate = $("#cDFlydate").val();
		var planeid = $("#cplaneid").val();
		var planeform = $("#planeform").val();
		var cVLessonid = $("#cVLessonid").val();
		var splaneid = $("#splaneid").val();//planeid
		var flyMoment = $("#cDFlymoment").val();
		var endMoment = $("#cDEndmoment").val();
		var cVTeacherid = $("#cVTeacherid").val();
		var astudent = $("#cVSecondstudent").val();
		if(cVLessonid==""){
			alert("训练课程必须选择。");
			return;	
		}
		if(cDFlydate==""){
			alert("请选择飞行日期。");
			return;	
		}
		if(flyMoment=="示例 0708"){
			alert("请输入出发时刻。");
			$("#cDFlymoment").focus();
			return;
		}
		if(endMoment=="示例 0840"){
			alert("请输入到达时刻。");
			$("#cDEndmoment").focus();
			return;
		}
		if(!execFlyMoment()){
			return;	
		}
		
		if(!execEndMoment()){
			return;	
		}

		if(cVTeacherid=="-1" || cVTeacherid==""){
			alert("请选择教员。");
			return;
		}
		if(planeid==""){
			alert("航空器机号不能为空。");
			return;
		}
		if(planeform==""){
			alert("航空器型别不能为空。");
			return;
		}
		var content = "";
		var bpos = $("#cVFpos").val();
		var epos = $("#cVLpos").val();
		if(bpos=="" || epos==""){
			alert("起飞站或到达站必须选择。");
			return;
		}
		$("#slessonid").val(cVLessonid);//课程
		$("#sDFlydate").val(cDFlydate);//飞行日期
		$("#sVFlytype").val($("#cVFlytype").val());//飞行种类
		$("#sflyMoment").val(cDFlydate + " " + flyMoment + ":00");//出发时刻
		$("#sendMoment").val(cDFlydate + " " + endMoment + ":00");//到达时刻
		$("#sVTeacherid").val(cVTeacherid);//教员
		$("#sVFpos").val(bpos);//起飞站
		$("#sVLpos").val(epos);//到达站
		var jk = $("#cVMonitorteacherid").val();
		if(jk!=0){
			$("#sVMonitorteacherid").val(jk);//监视教员
		}
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
		$("#sDTrantime").val($("#cDTrantime").val().split(":")[0]*60 + parseInt($("#cDTrantime").val().split(":")[1]));//飞行时间，转化成分钟
		
		//通过压座学员字段传递
		$("#sVSecondstudent").val(astudent + ";" + str);//压座的学生
		
		params = {"planeid":splaneid,"flyMoment":flyMoment,"endMoment":endMoment,"flyDate":cDFlydate};
		
		//判断是否有冲突的记录
		var d1= 0;
		$.ajax({
			async:false,//同步请求
			type:"post",
			url:"showChongTuFlightRecordByPlaneid.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data==null){
					content = "";
				}else{
					content+="<table id=\"usersTable\" class=\"colorTable\" border=\"1\" bordercolor=\"#E0E0E0\" cellspacing=\"0\" cellpadding=\"3\">";
					content+="<thead>";
					content+="<tr>";
					content+="<th colspan=\"6\" style=\"background-color:#DB6681\"><div align=\"left\" style=\"padding-left:10px; line-height:25px; color:#ffffff\">航空器"+planeid+"有冲突的飞行记录如下：</div></th>";
					content+="</tr>";
					content+="</thead>";
					content+="<thead>";
					content+="<tr>";
					content+="<th width=\"120\" style=\"padding-left: 10px;\">学号</th>";
					content+="<th width=\"120\">姓名</th>";
					content+="<th width=\"120\">教员</th>";
					content+="<th width=\"150\">出发时刻</th>";
					content+="<th width=\"150\">到达时刻</th>";
					content+="<th>&nbsp;</th>";
					content+="</tr>";
					content+="</thead>";
					content+="<tbody>";
					content+="<tr>";
					content+="<td align=\"center\" style=\"padding-left: 10px;\">"+data.VCode+"</td>";
					content+="<td align=\"center\">"+data.VName+"</td>";
					content+="<td align=\"center\">"+data.teaName+"</td>";
					content+="<td align=\"center\">"+data.DFlymoment+"</td>";
					content+="<td align=\"center\">"+data.DEndmoment+"</td>";
					content+="<td></td>";
					content+="</tr>";
					content+="</tbody>";
					content+="</table>";
					$("#chongtu").addClass("c1");
					d1= 1;
				}
				$("#chongtu").html(content);
				/*
				if(data!=null){
					alert(0);
					return;
				}
				*/

			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		//根据课程本转场性质，判断起飞站与到达站是否合法。
		var d2= 0;
		params = {"lessonid":cVLessonid,"flyStation":bpos,"endStation":epos};
		$.ajax({
			async:false,//同步请求
			type:"post",
			url:"showStationIfRightByLessonid.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data!=null && !data.flag && data.message!=null){
					alert(data.message);
				//	return;	
					d2=1;
				}
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
			}
		});	

		if(d2==1){
			return;
		}
		
		if(d1==1){
			return;
		}
		
		//alert(1);
		//return;
		$("#saveRecord").submit();
	});
	
});

function getFlightTime(){
	//ajax方式判断输入时间示例的合法性
	var flyMoment = $("#cDFlymoment").val();
	var endMoment = $("#cDEndmoment").val()
	var cDFlydate = $("#cDFlydate").val();
	var teacherids = $("#teacherids").val();
	var teacherid =  $("#teacherid").val();
	/*
	if(flyMoment=="" || endMoment=="" || flyMoment.indexOf("示例")!=-1  || endMoment.indexOf("示例")!=-1  || cDFlydate=="" || teacherids==""){
		return;
	}
	*/
	if(flyMoment=="" || endMoment=="" || flyMoment.indexOf("示例")!=-1  || endMoment.indexOf("示例")!=-1  || cDFlydate==""){
		return;
	}
	params = {"flyMoment":flyMoment,"endMoment":endMoment,"flyDate":cDFlydate};
	$.ajax({
		type:"post",
		url:"showFlightTimeByBeginTimeAndEndTime.do",
		data:params,
		dataType:"json",
		success:function(data){
			
			//----------------清楚缓存开始
			var ids = $("#teacherids").val();
			var flaga =0;
			if(ids.length>30){
				var ts = ids.split(",");
				for(j=0;j<ts.length-1;j++){
					$("#" + ts[j]).css('display','none');
				}
			}
			//----------------清楚缓存结束
			if(!data.flag){
				alert(data.message);
				return;				
			}
			if(data.teacherBaseInfoList.length==0){
				$("#cVTeacherid").val("-1");
				$("#cVTeacherid").change();
				alert("在输入的出发时刻与到达时刻的时间段内，教员没有分派飞机。");
				return;
			}
			
			for(i=0;i<data.teacherBaseInfoList.length;i++){

				if(teacherids.indexOf(data.teacherBaseInfoList[i].VId)!=-1){
				
					$("#" + data.teacherBaseInfoList[i].VId).css('display','inline-block');
					if(data.teacherBaseInfoList[i].VId==teacherid){
						$("#splaneid").val(data.teacherBaseInfoList[i].VCode);
						$("#cplaneid").val(data.teacherBaseInfoList[i].VJtzz);
						$("#planeform").val(data.teacherBaseInfoList[i].VJg);
						getcode(data.teacherBaseInfoList[i].VCode,data.teacherBaseInfoList[i].VJtzz);
						flaga++;
					}
				}
				else{
					
					$("#" + data.teacherBaseInfoList[i].VId).css('display','none');
				}
			}
			if(flaga>0){
				$("#cVTeacherid").val(teacherid);
			}else{
				$("#cVTeacherid").val("-1");
			}
			$("#cVTeacherid").change();
			$("#cDTrantime").val(data.message);
		},
		error:function(){
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}
function execFlyMoment(){
	var v = $("#cDFlymoment").val();
	if(v=="示例 0708" || v==""){
		return true;
	}

	v = v.replace(":","");
	if(isNaN(v) || v.length!=4){
		alert("出发时刻必须是4位数字。");
		$("#cDFlymoment").val("");
		$("#cDFlymoment").focus();
		return false;
	}
	var v0 = "";
	var v1 = "";
	var v2 = "";
	if(v!="示例 0708" && v!="" && v.indexOf(":")==-1){
		v1 = v.substring(0,2);
		v2 = v.substring(2,v.length);
		if(v1>23 || v1<0){
			alert("出发时刻的前两位数字应在0到23之间。");
			$("#cDFlymoment").focus();
			return false;
		}
		if(v2>59 || v2<0){
			alert("出发时刻的后两位数字应在0到59之间。");
			$("#cDFlymoment").focus();
			return false;
		}
		v0 =  v1+ ":" + v2;
		$("#cDFlymoment").val(v0);
	}
	return true;
}
function execEndMoment(){
	var ev = $("#cDEndmoment").val();
	if(ev=="示例 0840" || ev==""){
		return true;
	}
	ev = ev.replace(":","");
	if(isNaN(ev) || ev.length!=4){
		alert("到达时刻必须是4位数字。");
		$("#cDEndmoment").val("");
		$("#cDEndmoment").focus();
		return false;
	}
	var ev0 = "";
	var ev1 = "";
	var ev2 = "";
	if(ev!="示例 0840" && ev!="" && ev.indexOf(":")==-1){
		ev1 = ev.substring(0,2);
		ev2 = ev.substring(2,ev.length);
		if(ev1>23 || ev1<0){
			alert("到达时刻的前两位数字应在0到23之间。");
			$("#cDEndmoment").focus();
			return false;
		}
		if(ev2>59 || ev2<0){
			alert("到达时刻的后两位数字应在0到59之间。");
			$("#cDEndmoment").focus();
			return false;
		}
		ev0 =  ev1+ ":" + ev2;
		$("#cDEndmoment").val(ev0);
	}
	return true;
}
function selectDate(){
	var vdate = $("#vdate").val();
	if(vdate!=$("#cDFlydate").val()){
		getFlightTime();
		$("#vdate").val($("#cDFlydate").val());
	}
}
function deletebMF(){
	var v = $("#cDFlymoment").val();
	v = v.replace(":","");
	$("#cDFlymoment").val(v);
}
function deleteeMF(){
	var ev = $("#cDEndmoment").val();
	ev = ev.replace(":","");
	$("#cDEndmoment").val(ev);
}
function getPlaneid(id){

	var flyMoment = $("#cDFlymoment").val();
	var endMoment = $("#cDEndmoment").val()
	var cDFlydate = $("#cDFlydate").val();
	if(flyMoment=="" || endMoment=="" || flyMoment.indexOf("示例")!=-1 || endMoment.indexOf("示例")!=-1  || cDFlydate=="" || id==""){
		return;
	}
	params = {"teacherid":id,"flyMoment":flyMoment,"endMoment":endMoment,"flyDate":cDFlydate};

	$.ajax({
		type:"post",
		url:"showPlaneidByTeacherid.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#splaneid").val("");
				$("#cplaneid").val("");
				$("#planeform").val("");
				$("#bestNewRecord").html("");
				//alert("在输入的出发时刻与到达时刻的时间段内，教员没有分派飞机。");
				return;
			}
			/*
			if(!data.flag){
				alert(data.message);
				return;				
			}*/
			$("#splaneid").val(data.VId);
			$("#cplaneid").val(data.VParentid);
			$("#planeform").val(data.message);
			getcode(data.VId,data.VParentid);		
			

		},
		error:function(){
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	

	
}
function getcode(id,code){

	//根据id 查询最近一次飞行记录
	params = {"planeid":id};
	$.ajax({
		type:"post",
		url:"showBestNewFlightRecordByPlaneid.do",
		data:params,
		dataType:"json",
		success:function(data){
			var content="";
			if(data!=null){
				$("#bestNewRecord").addClass("c1");
				content+="<table id=\"usersTable\" class=\"colorTable\" border=\"1\" bordercolor=\"#E0E0E0\" cellspacing=\"0\" cellpadding=\"3\">";
				content+="<thead>";
				content+="<tr>";
				content+="<th colspan=\"6\"><div align=\"left\" style=\"padding-left:10px; line-height:25px; color:#333333\">航空器"+data.VPlanecode+"最近一次飞行记录如下：</a></div></th>";
				content+="</tr>";
				content+="</thead>";
				content+="<thead>";
				content+="<tr>";
				content+="<th width=\"120\" style=\"padding-left: 10px;\">学号</th>";
				content+="<th width=\"120\">姓名</th>";
				content+="<th width=\"120\">教员</th>";
				content+="<th width=\"150\">出发时刻</th>";
				content+="<th width=\"150\">到达时刻</th>";
				content+="<th>&nbsp;</th>";
				content+="</tr>";
				content+="</thead>";
				content+="<tbody>";
				content+="<tr>";
				content+="<td align=\"center\" style=\"padding-left: 10px;\">"+data.VCode+"</td>";
				content+="<td align=\"center\">"+data.VName+"</td>";
				content+="<td align=\"center\">"+data.teaName+"</td>";
				content+="<td align=\"center\">"+data.DFlymoment+"</td>";
				content+="<td align=\"center\">"+data.DEndmoment+"</td>";
				content+="<td></td>";
				content+="</tr>";
				content+="</tbody>";
				content+="</table>";
			}
			$("#bestNewRecord").html(content);
		},
		error:function(){
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	

}
function getTeaTimeType(){
	/*
	var other = document.getElementsByName("teaTimeType");
	var str = "";
	for(i=0;i<other.length;i++){
		if(other[i].checked==true){
			str+=other[i].value;
		}
	}
	*/
	//$("#teaTimeTypes").val(str);	
}
function changeunit(id){
	
	var unitValueid = $("#unitValueid").val();
	var units = unitValueid.split(",");
	var phaseids = $("#phaseids").val().split(",");//阶段
	var phase_p=-1;
	for(i=0;i<units.length-1;i++){  //阶段变化
		
		if(units[i].indexOf(id)!=-1){
			if(phase_p==-1){
				phase_p = i;
			}
			$("#" + units[i]).css('display','block');
		}else{
			$("#" + units[i]).css('display','none');
		}
	}

	$("#selphaseid").val(phaseids[phase_p]);
	$("#selphaseid").change();
	
	changephase(phaseids[phase_p]);

}
function changephase(id){

	var phaseValueid = $("#phaseValueid").val();
	var lessons = phaseValueid.split(",");
	var lessonids = $("#lessonids").val().split(",");//课程

	var phase_p=-1;
	for(i=0;i<lessons.length-1;i++){  //课程变化
		
		if(lessons[i].indexOf(id)!=-1){
			
			if(phase_p==-1){
				phase_p = i;
			}
			$("#" + lessons[i]).css('display','inline-block');
		}else{
			$("#" + lessons[i]).css('display','none');
		}
	}
	if(phase_p==-1){
		$("#cVLessonid").val("");
	}else{
		$("#cVLessonid").val(lessonids[phase_p]);
	}
	
	$("#cVLessonid").change();
	changeLesson(lessonids[phase_p]);
}
function changeLesson(id){//根据课程id获取转场的始发站到达站
	params = {"lessonid":id};
	$.ajax({
		type:"post",
		url:"showStartPosAndEndPosByLessonid.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null || data==""){
				$("#cVFpos").val($("#shid").val());
				$("#cVFpos").change();
				$("#cVLpos").val($("#ehid").val());
				$("#cVLpos").change();
			}
			if(data!=null){
				if(data.startStationId!=null && data.startStationId!=""){
					$("#cVFpos").val(data.startStationId);
					$("#cVFpos").change();
				}else{
					$("#cVFpos").val($("#shid").val());
					$("#cVFpos").change();
				}
				if(data.endStationId!=null && data.endStationId!=""){
					$("#cVLpos").val(data.endStationId);
					$("#cVLpos").change();
				}else{
					$("#cVLpos").val($("#ehid").val());
					$("#cVLpos").change();
				}
			}
		},
		error:function(){
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}
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

<div id="bestNewRecord">
<s:if test='viewFlightTrainingrecord!=null'>
    <div class="c1">
    <table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3">
    <thead>
    <tr>
    <th colspan="6"><div align="left" style="padding-left:10px; line-height:25px; color:#333333">航空器${VPlanecode}最近一次飞行记录如下：</a></div></th>
    </tr>
    </thead>
    <thead>
    <tr>
    <th width="120" style="padding-left: 10px;">学号</th>
    <th width="120">姓名</th>
    <th width="120">教员</th>
    <th width="150">出发时刻</th>
    <th width="150">到达时刻</th>
    <th >&nbsp;</th>
    </tr>
    </thead>
    <tbody>
    <tr>
    <td align="center" style="padding-left: 10px;">${VCode}</td>
    <td align="center">${VName}</td>
    <td align="center">${teaName}</td>
    <td align="center">${DFlymoment}</td>
    <td align="center">${DEndmoment}</td>
    <td></td>
    </tr>
    </tbody>
    </table>
    </div>
</s:if>
</div>
<div id="chongtu">
</div>

<div class="Panel ui-corner-all-0" id="Panel2">
<div class="panelContent"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td width="8%" align="right">课程编号：</td>
    <td width="37%"><div class="buttonBox"><div class="dropDownList barLeft"><button>单元</button><span class="bar"></span>
    <ul>
    <s:iterator value="unitList" status="statu">
    <li><a href="#N"  val="${VId}" onClick="changeunit('${VId}')">
     <s:if test="unitid==VId">
        <span class="ui-icon ui-icon-bullet"></span>
        <s:set name="uhid" value="unitid"/>
    </s:if>
    <s:elseif test='#statu.index==0'>
        <span class="ui-icon ui-icon-bullet"></span>
        <s:set name="uhid" value="VId"/>
    </s:elseif>${VName}</a>
    </li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="selunitid" value="${uhid}"/>
    </div>
    <div class="dropDownList barMiddle">
    <button>阶段</button><span class="bar"></span>
    <ul><s:set name="pid" value="-1"/><s:set name="pvalue" value="''"/><s:set name="phaseids" value="''"/>
    <s:iterator value="phaseList" status="statu"><s:set name="pvalue" value="#pvalue + 'pe' + #statu.count +VParentid+','"/><s:set name="phaseids" value="#phaseids+VId+','"/>
    <li id="pe${statu.count}${VParentid}" class="<s:if test='#uhid==VParentid'>pview</s:if><s:else>phide</s:else>"><a href="#N" val="${VId}" onClick="changephase('${VId}')">
    <s:if test='#uhid==VParentid'>
    	<s:if test='#pid==-1'>
    		<s:set name="pid" value="#statu.index"/>
        </s:if>
        <s:if test="phaseid==VId">
            <span class="ui-icon ui-icon-bullet"></span>
            <s:set name="phid" value="phaseid"/>
        </s:if>
        <s:elseif test='#statu.index==#pid'>
            <span class="ui-icon ui-icon-bullet"></span>
            <s:set name="phid" value="VId"/>
        </s:elseif>
    </s:if>
    ${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="selphaseid" value="${phid}"/>
    </div>
    <div class="dropDownList barRight">
    <button>课程</button><span class="bar"></span>
    <ul>
    <li><s:set name="lid" value="-1"/><s:set name="lvalue" value="''"/><s:set name="lessonids" value="''"/>
    <s:iterator value="phaseLessonList" status="statu"><s:set name="lvalue" value="#lvalue + 'le' + #statu.count +VParentid+','"/><s:set name="lessonids" value="#lessonids+VId+','"/><a href="#N" class="inline awidth" title="${IStatus}:${VName}" style="<s:if test='#phid!=VParentid'>display:none</s:if>" id="le${statu.count}${VParentid}"  val="${VId}" onClick="changeLesson('${VId}')">
    <s:if test='#phid==VParentid'>
    
    	<s:if test='#lid==-1'>
    		<s:set name="lid" value="#statu.index"/>
        </s:if>
        <s:if test="lessonid==VId">
            <span class="ui-icon ui-icon-bullet"></span>
            <s:set name="hid" value="lessonid"/>
            
        </s:if>
        <s:elseif test='#statu.index==#lid'>
            <span class="ui-icon ui-icon-bullet"></span>
            <s:set name="hid" value="VId"/>
        </s:elseif>
        
    </s:if>${VNo}</a></s:iterator>
    </li>
    </ul>
    <input type="hidden"  id="cVLessonid" value="${hid}"/>
    </div>
    </div>
    </td>
    <td width="9%" align="right">飞&nbsp;行&nbsp;日&nbsp;&nbsp;期：</td>
    <td>
      <table width="50%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="7"></td>
        </tr>
      </table>
      <input type="text"  id="cDFlydate" class="Wdate ui-widget-content ui-corner-all text"  style="width:85px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});selectDate()" value="${viewDate}" onKeyPress="return false" onpaste="return false" />
    </td>
    <td align="right">飞&nbsp;行&nbsp;种&nbsp;&nbsp;类：</td>
    <td>&nbsp;<div class="dropDownList">
    <button>训练</button>
    <ul>
    <s:iterator value="flyTypeList" status="statu">
    <li><a href="#N" val="${VId}"><s:if test='#statu.index==0'><s:set name="VFlytypeid" value="VId"/><span class="ui-icon ui-icon-bullet"></span></s:if>${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="cVFlytype" value="${VFlytypeid}"/>
    </div></td>
  </tr>
    <tr>
    <td colspan="6"><span class="panelLine"></span></td>
    </tr>
    <tr>
    <td align="right">出发时刻： </td>
    <td>
   <div class="buttonInput" style="width:90px;height:26px; border-color:#DDDDDD"> 
    <input id="cDFlymoment" title="示例 0708"  style="width:85px;"  type="text" maxlength="4" value="示例 0708"   onMouseDown="deletebMF()" />
    </div>
    </td>
    <td align="right">到&nbsp;达&nbsp;时&nbsp;&nbsp;刻：</td>
    <td>
     <div class="buttonInput" style="width:90px;height:26px; border-color:#DDDDDD">
    <input id="cDEndmoment" title="示例 0840"  style="width:85px;"  type="text" maxlength="4" value="示例 0840" onMouseDown="deleteeMF()" />
    </div>
    </td>
    <td align="right">压&nbsp;座&nbsp;学&nbsp;&nbsp;员：</td>
    <td>&nbsp;<input type="text"  id="cVSecondstudent" class="text ui-widget-content ui-corner-all"  style="width:108px;" /></td>
  </tr>
  <tr>
    <td colspan="6"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">教&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员：</td>
    <td><div class="dropDownList">
    <button>教员</button>
    <ul>
    <li><s:set name="teacherids" value="''"/><a href="#N" val="-1" id="-1" class="inline bwidth" onClick="getPlaneid('-1');"><s:if test="teacherid=='-1'"><span class="ui-icon ui-icon-bullet"></span></s:if>请选择</a>
    <s:iterator value="jianshiTeacherBaseInfoList" status="statu"><s:set name="teacherids" value="#teacherids+VId+','"/>
    	<a href="#N" id="${VId}" val="${VId}" class="inline bwidth" style="<s:if test='teacherid!=VId'>display:none</s:if>"  onClick="getPlaneid('${VId}');">
        <s:if test='teacherid==VId'>
        	<span class="ui-icon ui-icon-bullet"></span>
        </s:if>${VName}</a>
    </s:iterator>
    </li>
    </ul>
    <input type="hidden"  id="cVTeacherid" value="${teacherid}"/>
    </div></td>
    <td align="right">航空器机号：</td>
    <td width="16%">
    <input type="text" id="cplaneid" style="width:85px; background-color:#E9E9E9"  class="text ui-widget-content ui-corner-all"   onKeyPress="return false" onpaste="return false"/>
    </td>
    <td align="right">航空器型别：</td>
    <td>&nbsp;<input type="text" id="planeform"  style="width:108px; background-color:#E9E9E9"  class="text ui-widget-content ui-corner-all"   onKeyPress="return false" onpaste="return false"/></td>
  </tr>
  
  <tr>
    <td colspan="6"><span class="panelLine"></span></td>
    </tr>
    <tr>
    <td align="right">起&nbsp;飞&nbsp;&nbsp;站：</td>
    <td><div class="dropDownList">
    <button>起飞站</button>
    <ul><li>
        <s:iterator value="stationList" status="statu">
            <a href="#N" val="${VId}" class="inline" style="width:55px;">
            <s:if test='flyStation.indexOf(VName)!=-1'>
            	<span class="ui-icon ui-icon-bullet"></span>
            	<s:set name="shid" value="VId"/>
            </s:if>
            <s:elseif test='#statu.index==0'>
                <span class="ui-icon ui-icon-bullet"></span>
                <s:set name="shid" value="VId"/>
            </s:elseif>
            ${VName}</a>
        </s:iterator>
    </li></ul>
    <input type="hidden"  id="cVFpos" value="${shid}"/>
    </div></td>
    <td align="right">到&nbsp;&nbsp;&nbsp;达&nbsp;&nbsp;&nbsp;&nbsp;站：</td>
    <td><div class="dropDownList">
    <button>到达站</button>
    <ul>
    <li>
 		<s:iterator value="stationList" status="statu">
            <a href="#N" val="${VId}" class="inline" style="width:55px;" >
            <s:if test='endStation.indexOf(VName)!=-1'>
            	<span class="ui-icon ui-icon-bullet"></span>
            	<s:set name="ehid" value="VId"/>
            </s:if>
            <s:elseif test='#statu.index==0'>
                <span class="ui-icon ui-icon-bullet"></span>
                <s:set name="ehid" value="VId"/>
            </s:elseif>
            ${VName}</a>
        </s:iterator>
    </li>
    </ul>
    <input type="hidden"  id="cVLpos" value="${ehid}"/>
    </div></td>
    <td width="9%" align="right">监&nbsp;视&nbsp;教&nbsp;&nbsp;员：</td>
    <td width="21%">&nbsp;<div class="dropDownList">
    <button>请选择</button>
    <ul><li><a href="#N" val="0" class="inline" style="width:45px;"><span class="ui-icon ui-icon-bullet"></span>无</a><s:iterator value="jianshiTeacherBaseInfoList"><a href="#N" val="${VId}" class="inline" style="width:45px;">${VName}</a></s:iterator></li></ul>
    <input type="hidden"  id="cVMonitorteacherid" value="0"/>
    </div></td>
    </tr>

   <tr>
    <td colspan="6" height="10"></td>
    </tr>
</table>


		<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2">
        	<thead>
			  <tr>
                <th colspan="2">着陆次数</th>
                <th rowspan="2" width="55">驾驶员<br>
                  飞行时间</th>
                <th colspan="4">机长或单飞时间</th>
                <th colspan="4">副驾驶或带飞时间</th>
                <th colspan="2">仪表飞行时间</th>
                <th colspan="3">模拟机\训练器</th>
                <th width="80" rowspan="2">教员时间<br>
                飞<input type="checkbox" value="飞" name="teaTimeType" onClick="getTeaTimeType()"><b></b><br>
                领<input type="checkbox" value="领" name="teaTimeType" onClick="getTeaTimeType()"><b></b><br>
                通<input type="checkbox" value="通" name="teaTimeType" onClick="getTeaTimeType()"><b></b><br>
                机<input type="checkbox" value="机" name="teaTimeType" onClick="getTeaTimeType()"><b></b></th>
                <th colspan="3">领航员、飞行通信员、<br>
                飞行机械员&nbsp;</th>
                <th rowspan="2">备注</th>
              </tr>
			  <tr>
			    <th width="26" height="14">夜间</th>
			    <th width="26" height="14">昼间</th>
			    <th width="30">机长</th>
			    <th width="30">单飞</th>
			    <th width="30">转场</th>
			    <th width="30">夜间</th>
			    <th width="40">副驾驶</th>
			    <th width="30">带飞</th>
			    <th width="30">转场</th>
			    <th width="30">夜间</th>
			    <th width="55">模拟<br>
		        仪表</th>
			    <th width="55">真实<br>
		        仪表</th>
			    <th width="55">训练<br>
		        地点</th>
			    <th width="50">模拟机<br>
		        时间</th>
			    <th width="50">训练器<br>
		        时间</th>
			    <th width="50">领航员</th>
			    <th width="50">通信员</th>
			    <th width="50">机械员</th>
		      </tr>   
		  </thead>
			<tbody>
			  <tr>
              <td align="center"><input type="text"  id="cILangnighttimes" class="text ui-widget-content ui-corner-all"  style="width:15px;" /></td>
              <td align="center"><input type="text"  id="cILanddaytimes" class="text ui-widget-content ui-corner-all"  style="width:15px;" /></td>
				<td align="center"><input type="text"  id="cDTrantime" class="text ui-widget-content ui-corner-all"  style="width:37px;background-color:#E9E9E9" onKeyPress="return false" onpaste="return false"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all" maxlength="5"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="5"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="5"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="5"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="5"   style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"   maxlength="5"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="5"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"   maxlength="5"  style="width:30px;" /></td>
                <td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="5"  style="width:30px;" /></td>
                <td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="5"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="5"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"   maxlength="5"  style="width:30px;" /></td>
				<td align="center">
                <input type="text"   id="teaTimeTypes" name="cflight"  class="text ui-widget-content ui-corner-all"  style="width:50px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:30px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:30px;" /></td>
			  </tr>
		    </tbody>
		</table>
    <div class="panelBox buttonBox" >
    <button class="green" primary="ui-icon-button-addnew" id="saveReocrdButton">保存记录</button>
    </div><br>
</div>
</div>

<div style="padding-left:10px; padding-right:10px; padding-top:10px;"><s:set name="p" value="0"/>
<s:iterator value="recordList">
<div class="panelHead"><span>记录预览 ...</span></div>
<table id="usersTable3" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2" >
  <thead>
    <tr>
      <th colspan="2" rowspan="2">姓名</th>
      <th rowspan="2">学号</th>
      <th colspan="2" rowspan="2">飞行种类</th>
      <th colspan="2" rowspan="2">教员</th>
      <th colspan="2" rowspan="2">监视教员</th>
      <th colspan="2" rowspan="2">压座学员</th>
      <th colspan="2" rowspan="2">飞行日期</th>
      <th colspan="2" rowspan="2">航空器机号</th>
      <th rowspan="2">航空器型别</th>
      <th colspan="4">起飞\降落站</th>
      <th rowspan="2" witdh="45">飞行科目</th>
    </tr>
    <tr>
      <th width="60" height="14">起飞站</th>
      <th width="40">到达站</th>
      <th width="45">出发时刻</th>
      <th width="45">到达时刻</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td colspan="2" align="center">${studentName}</td>
      <td align="center">${studentVCode}</td>
      <td colspan="2" align="center">${VFlytype}</td>
      <td colspan="2" align="center">${teacherName}</td>
      <td colspan="2" align="center">${monitorteacherName}</td>
      <td colspan="2" align="center">${VSecondstudent}</td>
      <td colspan="2" align="center">${DFlydate}</td>
      <td colspan="2" align="center">${planeCode}</td>
      <td align="center">${planeForm}</td>
      <td align="center">${VFpos}</td>
      <td align="center">${VLpos}</td>
      <td align="center">${DFlymoment}</td>
      <td align="center">${DEndmoment}</td>
      <td align="center">${VNo}</td>
    </tr>
  </tbody>
  <thead>
    <tr>
      <th colspan="2">着陆次数</th>
      <th rowspan="2" width="60">驾驶员<br>
        飞行时间</th>
      <th colspan="4">机长或单飞时间</th>
      <th colspan="4">副驾驶或带飞时间</th>
      <th colspan="2">仪表飞行时间</th>
      <th colspan="3">模拟机\训练器</th>
      <th rowspan="2">教员时间<br>
        (飞\领\通\机)</th>
      <th colspan="3">领航员、飞行通信员、飞行机械员&nbsp;</th>
      <th rowspan="2">备注</th>
    </tr>
    <tr>
      <th width="26" height="14">夜间</th>
      <th width="26" height="14">昼间</th>
      <th width="35">机长</th>
      <th width="35">单飞</th>
      <th width="28">转场</th>
      <th width="28">夜间</th>
      <th width="36">副驾驶</th>
      <th width="30">带飞</th>
      <th width="31">转场</th>
      <th width="32">夜间</th>
      <th width="50">模拟仪表</th>
      <th width="50">真实仪表</th>
      <th width="36">训练地点</th>
      <th width="40">模拟机<br>
        时间</th>
      <th width="54">训练器<br>
        时间</th>
      <th width="40">领航员</th>
      <th>通信员</th>
      <th>机械员</th>
    </tr>
  </thead>
  <tbody>
    <tr>
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
      <td align="center">${DTeachertime}</td>
      <td align="center">${VLhy}</td>
      <td align="center">${VTxy}</td>
      <td align="center">${VJxy}</td>
      <td align="center"><img src="themes/cupertino/images/detail.png" title="${VBz}" border="0"/></td>
    </tr>
  </tbody>
</table><s:set name="p" value="#p+1"/><s:if test='p!=recordList.size()'><span class="panelLine"></span></s:if>
</s:iterator>
</div>
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
<form id="saveRecord" method="post" action="createFlightTrainingRecord.do">
<input type="hidden" name="trainingRecord.TOutline.VId" id="ountlineid" value="${outlineid}" />
<input type="hidden" name="trainingRecord.TTrainingLesson.VId" id="slessonid" />
<input type="hidden" name="trainingRecord.planeinfo.VId" id="splaneid" />
<input type="hidden" name="trainingRecord.studentBaseInfo.VId" value="${studentid}" />
<input type="hidden" name="trainingRecord.TDiction.VId" id="sVFlytype">

<input type="hidden" name="trainingRecord.DFlydate" id="sDFlydate">
<input type="hidden" name="trainingRecord.DFlymoment" id="sflyMoment">
<input type="hidden" name="trainingRecord.DEndmoment" id="sendMoment">
<input type="hidden" name="trainingRecord.VSecondstudent" id="sVSecondstudent">

<input type="hidden" name="trainingRecord.teacherBaseInfoByVTeacherid.VId" id="sVTeacherid">
<input type="hidden" name="trainingRecord.stationByVFpos.VId" id="sVFpos">
<input type="hidden" name="trainingRecord.stationByVLpos.VId" id="sVLpos">
<input type="hidden" name="trainingRecord.teacherBaseInfoByVMonitorteacherid.VId" id="sVMonitorteacherid">

<input type="hidden" name="trainingRecord.ILanddaytimes" id="sILanddaytimes">
<input type="hidden" name="trainingRecord.ILangnighttimes" id="sILangnighttimes">
<input type="hidden" name="trainingRecord.DTrantime" id="sDTrantime">
</form>
<input type="hidden" id="phaseids" value="${phaseids}">
<input type="hidden" id="unitValueid" value="${pvalue}">

<input type="hidden" id="phaseValueid" value="${lvalue}">
<input type="hidden" id="lessonids" value="${lessonids}">

<input type="hidden" id="teacherid" value="${teacherid}">
<input type="hidden" id="teacherids" value="${teacherids}">
<input type="hidden" id="shid" value="${shid}">
<input type="hidden" id="ehid" value="${ehid}">
<%@ include file="../../result.jsp"%>
<input type="hidden"  id="vdate" value="${viewDate}" />
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!="" && operateResult.indexOf("成功")==-1){
		$("#dialogForm3Warning").html(operateResult);
		$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>