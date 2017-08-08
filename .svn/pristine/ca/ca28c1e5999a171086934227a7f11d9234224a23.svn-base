<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>飞行训练记录</title>
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
.c1{padding-top:8px; padding-left:10px; padding-right:10px;}
.pview{display:block;}
.phide{display:none;}
.awidth{ width:70px;}
.bwidth{ width:45px;}
</style>
<script>

$(function() {
	
	$("div.dropDownList").find("button").css("width","120px").end().each(function(i){
		
		if(i==0){var d=new $.dropDownList(i,true,140);d.button.css("width", "140px");}
		else if(i==1){var d=new $.dropDownList(i,true,140);d.button.css("width", "140px");}
		else if(i==2){var d=new $.dropDownList(i,true,430);d.button.css("width", "100px");}
		else if(i==3){var d=new $.dropDownList(i,true,90);d.button.css("width", "90px");}
		else if(i==4){var d=new $.dropDownList(i,true,330);d.button.css("width", "97px");}
		else if(i==5){var d=new $.dropDownList(i,true,330);d.button.css("width", "97px");}
		else if(i==6){var d=new $.dropDownList(i,true,480);d.button.css("width", "97px");}
		else if(i==7){var d=new $.dropDownList(i,true,200);d.button.css("width", "97px");}
		else if(i==8){var d=new $.dropDownList(i,true,200);d.button.css("width", "90px");}
		else if(i==9){var d=new $.dropDownList(i,true,200);d.button.css("width", "90px");}
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
	
	$("#escid1").click(function(){//返回
		window.location.replace("open_toDoingListPage.do");
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

	$("#cDEngineStart").blur(function(){
		execDecimal('cDEngineStart');
	});
	$("#cDEngineEnd").blur(function(){
		execDecimal('cDEngineEnd');
	});
	$("#cDStartmoment").blur(function(){
		execTime('cDStartmoment');
		
	});
	$("#cDLandmoment").blur(function(){
		execTime('cDLandmoment');
		
	});
	$("#saveReocrdButton").click(function(){
		//获取其它内容字段
		var other = document.getElementsByName("cflight");
		var str = "";
		/*
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
		*/
		
		for(i=0;i<other.length;i++){
			if(i!=10 && i!=13 && !checkNum(other[i].value.replace(":",""))){
				alert("时间格式不正确。");
				return;
			}
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
		var iSseat = getSelRadioValue('isSeat');
		if(iSseat==""){
			$("#sISeat").val(2);
		}else{
			$("#sISeat").val(iSseat);//在座
		}
		
		if($("#cDStartmoment").val()!="" &&  $("#cDStartmoment").val().indexOf("示例")==-1){
			$("#sDStartmoment").val(cDFlydate + " " + $("#cDStartmoment").val() + ":00");
		}
		
		if($("#cDLandmoment").val()!="" &&  $("#cDLandmoment").val().indexOf("示例")==-1){
			$("#sDLandmoment").val(cDFlydate + " " + $("#cDLandmoment").val() + ":00");
		}
		
		
		if($("#cDEngineStart").val()=="" || $("#cDEngineStart").val().indexOf("示例")!=-1){
			alert("请输入发动机计时器开始时刻");
			return;
		}
		if($("#cDEngineEnd").val()=="" || $("#cDEngineEnd").val().indexOf("示例")!=-1){
			alert("请输入发动机计时器结束时刻");
			return;
		}
		var ss = $("#cDEngineStart").val();
		
		var kk = ss.indexOf(":");
		if(kk<0){
			alert("请输入正确的发动机计时器开始时刻");
			return;
		}
		var v1 = 0;
		var v2 = 0;
		var v3 = 0;
		
		v1 = ss.substring(0,kk);
		v2 = ss.substring(kk+1,ss.length);
		v3 = v1*60+v2*1;
		$("#sDEngineStart").val(v3);
		
		var e = $("#cDEngineEnd").val();
		kk  = e.indexOf(":");
		if(kk<0){
			alert("请输入正确的发动机计时器结束时刻");
			return;
		}
		v1 = e.substring(0,kk);
		v2 = e.substring(kk+1,e.length);
		v3 = v1*60+v2*1;
		$("#sDEngineEnd").val(v3);
		
		$("#slessonid").val(cVLessonid);//课程
		$("#sDFlydate").val(cDFlydate);//飞行日期
		$("#sVFlytype").val($("#cVFlytype").val());//飞行种类
		$("#sflyMoment").val(cDFlydate + " " + flyMoment + ":00");//出发时刻
		$("#sendMoment").val(cDFlydate + " " + endMoment + ":00");//到达时刻
		$("#sVTeacherid").val(cVTeacherid);//教员
		$("#sVFpos").val(bpos);//起飞站
		var jtpos = $("#cJTpos").val();
		if(jtpos!=""){//经停站
			$("#sJtpos").val(jtpos);
		}
		$("#sVLpos").val(epos);//到达站
		var jk = $("#cVMonitorteacherid").val();
		if(jk!=0){
			$("#sVMonitorteacherid").val(jk);//监视教员
		}
		var ntimes = $("#cILangnighttimes").val();
		if(!checkNum(ntimes)){
			alert("夜间起落次数应为数字。");
			$("#cILangnighttimes").focus();
			return;
		}
		$("#sILangnighttimes").val(ntimes);//夜间次数
		
		var dtimes = $("#cILanddaytimes").val();
		if(!checkNum(dtimes)){
			alert("昼间起落次数应为数字。");
			$("#cILanddaytimes").focus();
			return;
		}
		$("#sILanddaytimes").val(dtimes);//昼间次数
		//$("#sDTrantime").val($("#cDTrantime").val().split(":")[0]*60 + $("#cDTrantime").val().split(":")[1]*1);//飞行时间，转化成分钟
	
		if($("#sDTrantime").val()==""){
			alert("驾驶员飞行时间不能为空。");
			return;
		}
		if(!checkNum($("#sDTrantime").val())){
			alert("驾驶员飞行时间格式不正确。");
			return;
		}
		//通过压座学员字段传递
		$("#sVSecondstudent").val(astudent + ";" + str);//压座的学生与课目时间
		var id = $("#VId").val();
		params = {"planeid":splaneid,"flyMoment":flyMoment,"endMoment":endMoment,"flyDate":cDFlydate,"id":id};
		
		
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
		/*
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
		*/
		
		if(d1==1){
			return;
		}
		
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
			/*
			var ids = $("#teacherids").val();
			var flaga =0;
			if(ids.length>30){
				var ts = ids.split(",");
				for(j=0;j<ts.length-1;j++){
					$("#" + ts[j]).css('display','none');
				}
			}
			*/
			//----------------清楚缓存结束
			if(!data.flag){
				alert(data.message);
				return;				
			}
			$("#cDTrantime").val(data.message);
			$("#sDTrantime").val(data.IStatus);
			/*
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
			*/
			
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
	params = {"planeid":id,"id":$("#VId").val()};
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
function execTime(id){

	var v = $("#"+id).val();
	if(v.indexOf("示例")!=-1 || v==""){
		return true;
	}
	v = v.replace(":","");
	if(isNaN(v) || v.length!=4){
		alert("起飞或落地时刻必须是4位数字。");
		$("#"+id).val("");
		return false;
	}
	var v0 = "";
	var v1 = "";
	var v2 = "";
	if(v!="" && v.indexOf(":")==-1){
		v1 = v.substring(0,2);
		v2 = v.substring(2,v.length);
		
		if(v1>23 || v1<0){
			alert("时刻的前两位数字应在0到23之间。");
			$("#"+id).focus();
			return false;
		}
		if(v2>59 || v2<0){
			alert("时刻的后两位数字应在0到59之间。");
			$("#"+id).focus();
			return false;
		}
		
		v0 =  v1+ ":" + v2;
		$("#"+id).val(v0);
	}
	return true;
}
function execDecimal(id){

	var v = $("#"+id).val();
	if(v.indexOf("示例")!=-1 || v==""){
		return true;
	}

	if(isNaN(v) || v.length!=6){
		alert("发动机计时器时刻必须是6位数字。");
		$("#"+id).val("");
		return false;
	}
	var v0 = "";
	var v1 = "";
	var v2 = "";
	if(v!="" && v.indexOf(":")==-1){
		v1 = v.substring(0,5);
		v2 = v.substring(5,v.length);
		var i = v2*1*6
		if(i<10){
			i="0"+i;
		}
		v0 =  v1+ ":" + i;
		$("#"+id).val(v0);
	}
	return true;
}
function deletebMFL(id){
	var v = $.trim($("#" +id).val());
	var k = v.indexOf(":");
	var v1 = "";
	var v2 = "";
	var v3 = "";
	if(k>=0){
		v1 = v.substring(0,k);
		v2 = v.substring(k+1,v.length);
		v3 = v1+(v2*1)/6;
	}else{
		v3=v;
	}

	if(v!=""){
		$("#" +id).val(v3);
	}
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
<ul class="itemList">
	<li class="active" style="cursor:default"><a>待改正的被打回飞行训练记录</a></li>
</ul>
<span class="panelLine"></span>
<ul class="itemList">
	<li><a href="open_toDoingListPage.do">返回待办列表页面</a></li>
</ul>
<span class="panelLine"></span>
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
    <td width="10%" align="right">课程编号：</td>
    <td colspan="7"><div class="buttonBox"><div style="float:left; padding-top:8px;">${flightTrainingrecordDetail.outlineName}</div> <div class="dropDownList barLeft"><button>单元</button><span class="bar"></span>
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
    </tr>
    <tr>
    <td colspan="8"><span class="panelLine"></span></td>
    </tr>
    <tr>
    <td align="right">飞行日期：</td>
    <td width="12%">
      <input type="text"  id="cDFlydate" class="Wdate ui-widget-content ui-corner-all text"  style="width:85px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});selectDate()" value="${viewDate}" onKeyPress="return false" onpaste="return false" /> </td>
    <td colspan="4">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>开车：</td>
          <td><div class="buttonInput" style="width:60px;height:26px; border-color:#DDDDDD"> 
        <input id="cDFlymoment" title="示例 0708" value="${flightTrainingrecordDetail.DFlymoment}"  style="width:60px;"  type="text" maxlength="4"   onMouseDown="deletebMF('cDFlymoment')" />
        </div></td>
          <td>起飞：</td>
          <td><div class="buttonInput" style="width:60px;height:26px; border-color:#DDDDDD"> 
        <input id="cDStartmoment" style="width:60px;"  type="text" maxlength="4" title="示例 0718"  value="${flightTrainingrecordDetail.DStartmoment}"  onMouseDown="deletebMF('cDStartmoment')"/>
        </div></td>
          <td>落地：</td>
          <td><div class="buttonInput" style="width:60px;height:26px; border-color:#DDDDDD">
        <input id="cDLandmoment"  style="width:60px"  type="text" maxlength="4" title="示例 0830"  value="${flightTrainingrecordDetail.DLandmoment}"  onMouseDown="deletebMF('cDLandmoment')"/></div></td>
          <td>关车：</td>
          <td><div class="buttonInput" style="width:60px;height:26px; border-color:#DDDDDD">
        <input id="cDEndmoment" title="示例 0840"  style="width:60px"  type="text" maxlength="4" value="${flightTrainingrecordDetail.DEndmoment}"  onMouseDown="deletebMF('cDEndmoment')" />
      </div> </td>
        </tr>
      </table>
    </td>
    <td align="right">飞行种类：</td>
    <td><div class="dropDownList">
    <button>训练</button>
    <ul>
    <s:iterator value="flyTypeList" status="statu">
    <li><a href="#N" val="${VId}"><s:if test='#statu.index==0'><s:set name="VFlytypeid" value="VId"/><span class="ui-icon ui-icon-bullet"></span></s:if>${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="cVFlytype" value="${flightTrainingrecordDetail.VFlytypeid}"/>
    </div></td>
  </tr>
  <tr>
    <td colspan="8"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">教员：</td>
    <td><div class="dropDownList">
    <button>教员</button>
    <ul>
    <li><s:set name="teacherids" value="''"/><a href="#N" val="-1" id="-1" class="inline bwidth" onClick="getPlaneid('-1');"><s:if test="teacherid=='-1'"><span class="ui-icon ui-icon-bullet"></span></s:if>请选择</a>
    <s:iterator value="jianshiTeacherBaseInfoList" status="statu"><s:set name="teacherids" value="#teacherids+VId+','"/>
    	<a href="#N" id="${VId}" val="${VId}" class="inline bwidth" >
        <s:if test='teacherid==VId'>
        	<span class="ui-icon ui-icon-bullet"></span>
        </s:if>${VName}</a>
    </s:iterator>
    </li>
    </ul>
    <input type="hidden"  id="cVTeacherid" value="${teacherid}"/>
    </div></td>
    <td width="8%" align="right">教员在座：</td>
    <td width="11%"><input name="isSeat" type="radio" value="0"  <s:if test="flightTrainingrecordDetail.ISeat==0">checked="CHECKED"</s:if>><b></b>是 <input name="isSeat" type="radio" value="1" <s:if test="flightTrainingrecordDetail.ISeat==1">checked="CHECKED"</s:if>><b></b>否</td>
    <td width="7%" align="right">监视教员：</td>
    <td width="27%"><div class="dropDownList">
    <button>请选择</button>
    <ul><li><a href="#N" val="0" class="inline" style="width:45px;"><span class="ui-icon ui-icon-bullet"></span>无</a><s:iterator value="jianshiTeacherBaseInfoList"><a href="#N" val="${VId}" class="inline" style="width:45px;">${VName}</a></s:iterator></li></ul>
    <input type="hidden"  id="cVMonitorteacherid" value="${flightTrainingrecordDetail.monitorteacherid}"/>
    </div></td>
    <td align="right">压座学员：</td>
    <td><input type="text"  id="cVSecondstudent" class="text ui-widget-content ui-corner-all"  style="width:80px;" value="${flightTrainingrecordDetail.VSecondstudent}"/></td>
  </tr>
  
  <tr>
    <td colspan="8"><span class="panelLine"></span></td>
    </tr>
    <tr>
    <td align="right">航空器机号：</td>
    <td><div class="dropDownList">
    <button>请选择</button>
    <ul><li>
    <s:iterator value="planeinfoList"><a href="#N" val="${VId}"  onClick="getXlqForm('${planeform.VName}');" class="inline" style="width:60px;">
    <s:if test='flightTrainingrecordDetail.planeid==VId'><span class="ui-icon ui-icon-bullet"></span></s:if>
    ${VPlanecode}</a></s:iterator>
    </li></ul><input type="hidden"  id="cplaneid" value="${flightTrainingrecordDetail.planeid}"/>
    </div></td>
    <td align="right">航空器型别：</td>
    <td><input type="text" id="planeform"  style="width:85px; background-color:#E9E9E9"  class="text ui-widget-content ui-corner-all"   onKeyPress="return false" onpaste="return false"  value="${flightTrainingrecordDetail.planeForm}"/></td>
    <td align="right">起飞站：</td>
    <td>
    <table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr>
    <td width="36%"><div class="dropDownList">
    <button>起飞站</button>
    <ul><li>
        <s:iterator value="stationList" status="statu">
            <a href="#N" val="${VId}" class="inline" style="width:55px;">
            <s:if test='flyStation.indexOf(VId)!=-1'>
            	<span class="ui-icon ui-icon-bullet"></span>
            </s:if>${VCode}</a>
        </s:iterator>
    </li></ul>
    <input type="hidden"  id="cVFpos" value="${flyStation}"/>
    </div></td>
    <td width="25%" align="right">经停站：</td>
    <td width="39%"><div class="dropDownList">
    <button>请选择</button>
    <ul><li><a href="#N" val="" class="inline" style="width:55px;">
    <s:if test="jtStation==''"><span class="ui-icon ui-icon-bullet"></span></s:if>无</a>
    <s:iterator value="stationList" status="statu">
    <s:if test='flightTrainingrecordDetail.VJtpos==VId'><span class="ui-icon ui-icon-bullet"></span></s:if>
    <a href="#N" val="${VId}" class="inline" style="width:55px;"  title="${VName}">${VCode}</a>
    </s:iterator>
    </li></ul>
    <input type="hidden"  id="cJTpos" value="${jtStation}"/>
    </div></td>
  </tr>
</table>
    
    </td>
    <td width="6%" align="right">到达站：</td>
    <td width="19%"><div class="dropDownList">
    <button>到达站</button>
    <ul>
    <li>
 		<s:iterator value="stationList" status="statu">
            <a href="#N" val="${VId}" class="inline" style="width:55px;" >
            <s:if test='endStation.indexOf(VId)!=-1'>
            	<span class="ui-icon ui-icon-bullet"></span>
            </s:if>
            ${VCode}</a>
        </s:iterator>
    </li>
    </ul>
    <input type="hidden"  id="cVLpos" value="${endStation}"/>
    </div></td>
    </tr>
 <tr>
    <td colspan="8" height="10"></td>
    </tr>
    <tr>
    <td colspan="8"><span class="panelLine"></span></td>
    </tr>
    <tr>
    <td colspan="3" align="right">发动机计时器开始时刻：</td>
    <td><div class="buttonInput" style="width:90px;height:26px; border-color:#DDDDDD"> 
        <input id="cDEngineStart" title="示例139421"  style="width:85px;"  type="text" maxlength="6"  value="${flightTrainingrecordDetail.DEngineStart}"   onMouseDown="deletebMFL('cDEngineStart')" />
        </div></td>
    <td align="right">结束时刻：</td>
    <td><div class="buttonInput" style="width:90px;height:26px; border-color:#DDDDDD"> 
        <input id="cDEngineEnd" title="示例139423"  style="width:85px;"  type="text" maxlength="6"  value="${flightTrainingrecordDetail.DEngineEnd}"   onMouseDown="deletebMFL('cDEngineEnd')" />
        </div></td>
    <td width="7%" align="right">&nbsp;</td>
    <td width="19%">
    

    </td>
    </tr>
   <tr>
    <td colspan="8" height="10"></td>
    </tr>
</table>


		<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2">
        	<thead>
			  <tr>
                <th colspan="2">起落次数</th>
                <th rowspan="2" width="55">驾驶员<br>
                  飞行时间</th>
                <th colspan="4">机长或单飞时间</th>
                <th colspan="4">副驾驶或带飞时间</th>
                <th colspan="2">仪表飞行时间</th>
                <th colspan="3">模拟机\训练器</th>
                <th rowspan="2">备注</th>
              </tr>
			  <tr>
			    <th width="40">夜间</th>
			    <th width="40">昼间</th>
			    <th width="50">机长</th>
			    <th width="50">单飞</th>
			    <th width="50">转场</th>
			    <th width="50">夜间</th>
			    <th width="50">副驾驶</th>
			    <th width="50">带飞</th>
			    <th width="50">转场</th>
			    <th width="50">夜间</th>
			    <th width="55">模拟<br>
		        仪表</th>
			    <th width="55">真实<br>
		        仪表</th>
			    <th width="70">训练<br>
		        地点</th>
			    <th width="55">模拟机<br>
		        时间</th>
			    <th width="55">训练器<br>
		        时间</th>
		      </tr>   
		  </thead>
			<tbody>
			  <tr>
              <td align="center"><input type="text"  id="cILangnighttimes" class="text ui-widget-content ui-corner-all"  style="width:20px;" value="${flightTrainingrecordDetail.ILangnighttimes}" /></td>
              <td align="center"><input type="text"  id="cILanddaytimes" class="text ui-widget-content ui-corner-all"  style="width:20px;"  value="${flightTrainingrecordDetail.ILanddaytimes}" /></td>
				<td align="center"><input type="text"  id="cDTrantime" class="text ui-widget-content ui-corner-all"  style="width:37px;background-color:#E9E9E9" onKeyPress="return false" onpaste="return false" value="${flightTrainingrecordDetail.DTrantime}" /></td>
				<td align="center"><input type="text"  name="cflight" id="cflight1" onMouseDown="deletebMF('cflight1')" onBlur="viewTime('cflight1')" class="text ui-widget-content ui-corner-all" maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DJizhangtime}" /></td>
				<td align="center"><input type="text"  name="cflight" id="cflight2" onMouseDown="deletebMF('cflight2')" onBlur="viewTime('cflight2')"  class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DDanfeitime}" /></td>
				<td align="center"><input type="text"  name="cflight" id="cflight3" onMouseDown="deletebMF('cflight3')" onBlur="viewTime('cflight3')"  class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DZhuanchangtime}" /></td>
				<td align="center"><input type="text"  name="cflight" id="cflight4" onMouseDown="deletebMF('cflight4')" onBlur="viewTime('cflight4')" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DYejiantime}"/></td>
				<td align="center"><input type="text"  name="cflight" id="cflight5" onMouseDown="deletebMF('cflight5')" onBlur="viewTime('cflight5')"  class="text ui-widget-content ui-corner-all"  maxlength="4"   style="width:35px;" value="${flightTrainingrecordDetail.DFujiashitime}" /></td>
				<td align="center"><input type="text"  name="cflight" id="cflight6" onMouseDown="deletebMF('cflight6')" onBlur="viewTime('cflight6')"  class="text ui-widget-content ui-corner-all"   maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DDaifeitime}"/></td>
				<td align="center"><input type="text"  name="cflight" id="cflight7" onMouseDown="deletebMF('cflight7')" onBlur="viewTime('cflight7')"  class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DFjszhuanchangtime}"/></td>
				<td align="center"><input type="text"  name="cflight" id="cflight8" onMouseDown="deletebMF('cflight8')" onBlur="viewTime('cflight8')"  class="text ui-widget-content ui-corner-all"   maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DFjszcyjtime}"/></td>
                <td align="center"><input type="text"  name="cflight" id="cflight9" onMouseDown="deletebMF('cflight9')" onBlur="viewTime('cflight9')"  class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DMoniyibiaotime}"/></td>
                <td align="center"><input type="text"  name="cflight" id="cflight10" onMouseDown="deletebMF('cflight10')" onBlur="viewTime('cflight10')"  class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DZhenshiyibiao}"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:50px;" value="${flightTrainingrecordDetail.VTranpos}"/></td>
				<td align="center"><input type="text"  name="cflight" id="cflight11" onMouseDown="deletebMF('cflight11')" onBlur="viewTime('cflight11')"  class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DMnjsj}"/></td>
				<td align="center"><input type="text"  name="cflight" id="cflight12" onMouseDown="deletebMF('cflight12')" onBlur="viewTime('cflight12')"  class="text ui-widget-content ui-corner-all"   maxlength="4"  style="width:35px;" value="${flightTrainingrecordDetail.DXlqsj}"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:100px;" value="${flightTrainingrecordDetail.VBz}"/></td>
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
<td style="padding-left:12px;"><s:property value='toDoing.title.replace("\n","<br/>")' escape="false"/></td>
<td >${toDoing.submitTime}</td>
<td>${toDoing.submitUserName}</td>
<td><button class="green" primary="ui-icon-button-confirm" id="saveReocrdButton">保存记录</button>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</td>
</tr>
</tbody>
</table>
</div>
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
<form id="saveRecord" method="post" action="updateFlightTrainingRecord.do">
<input type="hidden" name="trainingRecord.VId" value="${flightTrainingrecordDetail.VId}" id="VId" />
<input type="hidden" name="trainingRecord.TOutline.VId" id="ountlineid" value="${outlineid}" />
<input type="hidden" name="trainingRecord.TTrainingLesson.VId" id="slessonid" />
<input type="hidden" name="trainingRecord.planeinfo.VId" id="splaneid" value="${flightTrainingrecordDetail.planeid}"/>
<input type="hidden" name="trainingRecord.studentBaseInfo.VId" value="${flightTrainingrecordDetail.studentid}" />
<input type="hidden" name="trainingRecord.TDiction.VId" id="sVFlytype">

<input type="hidden" name="trainingRecord.DFlydate" id="sDFlydate">
<input type="hidden" name="trainingRecord.DFlymoment" id="sflyMoment">
<input type="hidden" name="trainingRecord.DEndmoment" id="sendMoment">

<input type="hidden" name="trainingRecord.DStartmoment" id="sDStartmoment">
<input type="hidden" name="trainingRecord.DLandmoment" id="sDLandmoment">
<input type="hidden" name="trainingRecord.DEngineStart" id="sDEngineStart">
<input type="hidden" name="trainingRecord.DEngineEnd" id="sDEngineEnd">

<input type="hidden" name="trainingRecord.VSecondstudent" id="sVSecondstudent">

<input type="hidden" name="trainingRecord.teacherBaseInfoByVTeacherid.VId" id="sVTeacherid">
<input type="hidden" name="trainingRecord.stationByVFpos.VId" id="sVFpos">
<input type="hidden" name="trainingRecord.stationByVLpos.VId" id="sVLpos">
<input type="hidden" name="trainingRecord.stationByVJtpos.VId" id="sJtpos">
<input type="hidden" name="trainingRecord.teacherBaseInfoByVMonitorteacherid.VId" id="sVMonitorteacherid">

<input type="hidden" name="trainingRecord.ILanddaytimes" id="sILanddaytimes">
<input type="hidden" name="trainingRecord.ILangnighttimes" id="sILangnighttimes">
<input type="hidden" name="trainingRecord.DTrantime" id="sDTrantime" value="${flightTrainingrecordDetail.time}">
<input type="hidden" name="trainingRecord.ISeat" id="sISeat">
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
<input type="text"  id="stime" />
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