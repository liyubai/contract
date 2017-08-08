<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>其它飞行经历录入</title>
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
	
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		if(i==0){var d=new $.dropDownList(i,true,460);d.button.css("width", "110px");}
		else if(i==1){var d=new $.dropDownList(i,true,280);d.button.css("width", "100px");}
		else if(i==2){var d=new $.dropDownList(i,true,280);d.button.css("width", "110px");}
		else if(i==3){var d=new $.dropDownList(i,true,280);d.button.css("width", "100px");}
		else{new $.dropDownList(i,true,100);}
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
		/*
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
		*/
		
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
		var flyMoment = $("#cDFlymoment").val();
		var endMoment = $("#cDEndmoment").val();
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
		if(planeid==""){
			alert("航空器机号不能为空。");
			return;
		}
		if(planeform==""){
			alert("航空器型别不能为空。");
			return;
		}

		var bpos = $("#cVFpos").val();
		var epos = $("#cVLpos").val();
		if(bpos=="" || epos==""){
			alert("起飞站或到达站必须选择。");
			return;
		}
		$("#sDFlydate").val(cDFlydate);//飞行日期
		$("#sVFlytype").val($("#cVFlytype").val());//飞行种类
		$("#sflyMoment").val(cDFlydate + " " + flyMoment + ":00");//出发时刻
		$("#sendMoment").val(cDFlydate + " " + endMoment + ":00");//到达时刻
		$("#sVFpos").val(bpos);//起飞站
		$("#sVLpos").val(epos);//到达站
		$("#splaneid").val(planeid);//飞机

		var ntimes = $("#cILangnighttimes").val();
		if(!checkNum(ntimes)){
			alert("夜间着陆次数应为数字。");
			$("#cILangnighttimes").focus();
			return;
		}
		$("#sILangnighttimes").val(ntimes);//夜间次数
		
		var dtimes = $("#cILanddaytimes").val();
		if(!checkNum(dtimes)){
			alert("昼间着陆次数应为数字。");
			$("#cILanddaytimes").focus();
			return;
		}
		$("#sILanddaytimes").val(dtimes);//昼间次数
		$("#sDTrantime").val($("#cDTrantime").val().split(":")[0]*60 + $("#cDTrantime").val().split(":")[1]*1);//飞行时间，转化成分钟
		$("#sVBz").val(str);//借助备注字段传递其它字段。
		$("#saveRecord").submit();
	});
	
});

function getFlightTime(){
	//ajax方式判断输入时间示例的合法性
	var flyMoment = $("#cDFlymoment").val();
	var endMoment = $("#cDEndmoment").val()
	var cDFlydate = $("#cDFlydate").val();

	if(flyMoment=="" || endMoment=="" || flyMoment.indexOf("示例")!=-1  || endMoment.indexOf("示例")!=-1  || cDFlydate==""){
		return;
	}
	params = {"flyMoment":flyMoment,"endMoment":endMoment,"flyDate":cDFlydate};
	$.ajax({
		type:"post",
		url:"showOtherFlightTimeByBeginTimeAndEndTime.do",
		data:params,
		dataType:"json",
		success:function(data){

			//----------------清楚缓存结束
			if(!data.flag){
				alert(data.message);
				return;				
			}
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

function changePlane(vform){
	$("#planeform").val(vform);
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

<div class="Panel ui-corner-all-0" id="Panel2">
<div class="panelContent"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr>
    <td width="8%" align="right">飞行日期：</td>
    <td width="17%"><table width="50%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="7"></td>
        </tr>
      </table>
      <input type="text"  id="cDFlydate" class="Wdate ui-widget-content ui-corner-all text"  style="width:98px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" />
    </td>
    <td width="8%" align="right">出&nbsp;发&nbsp;时&nbsp;&nbsp;刻： </td>
    <td><div class="buttonInput" style="width:92px;height:26px; border-color:#DDDDDD"> 
    <input id="cDFlymoment" title="示例 0708"  style="width:100px;"  type="text" maxlength="4" value="示例 0708"   onMouseDown="deletebMF('cDFlymoment')" />
    </div></td>
    <td align="right">到&nbsp;达&nbsp;时&nbsp;&nbsp;刻：</td>
    <td><div class="buttonInput" style="width:90px;height:26px; border-color:#DDDDDD">
    <input id="cDEndmoment" title="示例 0840"  style="width:94px;"  type="text" maxlength="4" value="示例 0840"  onMouseDown="deletebMF('cDEndmoment')" />
    </div></td>
  </tr>
  <tr>
    <td colspan="6"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">飞行种类：</td>
    <td>其它飞行<input type="hidden"  id="cVFlytype" value="297ea69a48492c950148493011100008"/><!--<div class="dropDownList">
    <button>训练</button>
    <ul>
    <s:iterator value="flyTypeList" status="statu">
    <li><a href="#N" val="${VId}"><s:if test='#statu.index==0'><s:set name="VFlytypeid" value="VId"/><span class="ui-icon ui-icon-bullet"></span></s:if>${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="cVFlytype22" value="297ea69a48492c950148493011100008"/>
    </div>--></td>
    <td align="right">航空器机号：</td>
    <td width="17%">
    <div class="dropDownList">
    <button>航空器机号</button>
<ul><li>
<s:iterator value="planeinfoList" status="statu">
<a href="javascript:void(0)" val="${VId}" class="inline" style="width:55px;" onClick="changePlane('${planeform.VName}')">
<s:if test='#statu.index==0'><span class="ui-icon ui-icon-bullet"></span><s:set name="hid" value="VId"/>
<s:set name="pform" value="planeform.VName"/>
</s:if>${VPlanecode}</a>
</s:iterator>
</li></ul>
<input type="hidden"  id="cplaneid" value="${hid}"/>
</div>
    </td>
    <td align="right">航空器型别：</td>
    <td><input type="text" id="planeform" style="width:85px; background-color:#E9E9E9"  class="text ui-widget-content ui-corner-all"   onKeyPress="return false" onpaste="return false" value="${pform}"/></td>
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
            <a href="#N" val="${VId}" class="inline" style="width:55px;"  title="${VName}">
            <s:if test='#statu.index==0'>
                <span class="ui-icon ui-icon-bullet"></span>
                <s:set name="hid" value="VId"/>
            </s:if>
            ${VCode}</a>
        </s:iterator>
    </li></ul>
    <input type="hidden"  id="cVFpos" value="${hid}"/>
    </div></td>
    <td align="right">到&nbsp;&nbsp;&nbsp;达&nbsp;&nbsp;&nbsp;&nbsp;站：</td>
    <td><div class="dropDownList">
    <button>到达站</button>
    <ul>
    <li>
 		<s:iterator value="stationList" status="statu">
            <a href="#N" val="${VId}" class="inline" style="width:55px;"  title="${VName}">
            <s:if test='#statu.index==0'>
                <span class="ui-icon ui-icon-bullet"></span>
                <s:set name="hid" value="VId"/>
            </s:if>
            ${VCode}</a>
        </s:iterator>
    </li>
    </ul>
    <input type="hidden"  id="cVLpos" value="${hid}"/>
    </div></td>
    <td width="8%" align="right">&nbsp;</td>
    <td width="42%"></td>
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
                <th rowspan="2">备注</th>
              </tr>
			  <tr>
			    <th width="40" height="14">夜间</th>
			    <th width="40" height="14">昼间</th>
			    <th width="50">机长</th>
			    <th width="50">单飞</th>
			    <th width="50">转场</th>
			    <th width="50">夜间</th>
			    <th width="50">副驾驶</th>
			    <th width="50">带飞</th>
			    <th width="50">转场</th>
			    <th width="50">夜间</th>
			    <th width="50">模拟<br>
		        仪表</th>
			    <th width="50">真实<br>
		        仪表</th>
			    <th width="50">训练<br>
		        地点</th>
			    <th width="50">模拟机<br>
		        时间</th>
			    <th width="50">训练器<br>
		        时间</th>
		      </tr>   
		  </thead>
			<tbody>
			  <tr>
              <td align="center"><input type="text"  id="cILangnighttimes" class="text ui-widget-content ui-corner-all"  style="width:15px;" /></td>
              <td align="center"><input type="text"  id="cILanddaytimes" class="text ui-widget-content ui-corner-all"  style="width:15px;" /></td>
				<td align="center"><input type="text"  id="cDTrantime" class="text ui-widget-content ui-corner-all"  style="width:37px;background-color:#E9E9E9" onKeyPress="return false" onpaste="return false"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all" maxlength="4"  style="width:35px;"id="cflight1" onMouseDown="deletebMF('cflight1')" onBlur="viewTime('cflight1')"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" id="cflight2" onMouseDown="deletebMF('cflight2')" onBlur="viewTime('cflight2')"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" id="cflight3" onMouseDown="deletebMF('cflight3')" onBlur="viewTime('cflight3')"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" id="cflight4" onMouseDown="deletebMF('cflight4')" onBlur="viewTime('cflight4')"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"   style="width:35px;" id="cflight5" onMouseDown="deletebMF('cflight5')" onBlur="viewTime('cflight5')"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"   maxlength="4"  style="width:35px;" id="cflight6" onMouseDown="deletebMF('cflight6')" onBlur="viewTime('cflight6')"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" id="cflight7" onMouseDown="deletebMF('cflight7')" onBlur="viewTime('cflight7')"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"   maxlength="4"  style="width:35px;" id="cflight8" onMouseDown="deletebMF('cflight8')" onBlur="viewTime('cflight8')"/></td>
                <td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" id="cflight9" onMouseDown="deletebMF('cflight9')" onBlur="viewTime('cflight9')"/></td>
                <td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" id="cflight10" onMouseDown="deletebMF('cflight10')" onBlur="viewTime('cflight10')"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:35px;" /></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  maxlength="4"  style="width:35px;" id="cflight11" onMouseDown="deletebMF('cflight11')" onBlur="viewTime('cflight11')"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"   maxlength="4"  style="width:35px;" id="cflight12" onMouseDown="deletebMF('cflight12')" onBlur="viewTime('cflight12')"/></td>
				<td align="center"><input type="text"  name="cflight" class="text ui-widget-content ui-corner-all"  style="width:100px;" /></td>
			  </tr>
		    </tbody>
		</table><%request.setAttribute("k",ActionContext.getContext().getName());%>
<s:if test="#session.loginContext.urlAddress=='all'">
	<s:set name="r" value="0"/>
</s:if>
<s:else>
	<s:set name="pos" value="#session.loginContext.urlAddress.indexOf(#request.k+'.do')"/>
	<s:if test='#pos==-1'>
		<s:set name="r" value="1"/>
    </s:if>
    <s:else>
		<s:set name="r" value="#session.loginContext.urlAddress.substring(#pos+#request.k.length()+6,#pos+#request.k.length()+7)"/>
    </s:else>
</s:else>
<s:if test="#r==null || #r==0">
    <div class="panelBox buttonBox" id="divSaveReocrdButton" >
    <button class="green" primary="ui-icon-button-addnew" id="saveReocrdButton">保存记录</button>
    </div></s:if><br>
</div>
</div>

<div style="padding-left:10px; padding-right:10px; padding-top:10px;">
<s:if test='viewRecord!=null'>
<div class="panelHead"><span>记录预览 ...</span></div>
<table id="usersTable3" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2" >
  <thead>
    <tr>
      <th colspan="3">飞行种类</th>
      <th colspan="2">飞行日期</th>
      <th colspan="2">航空器机号</th>
      <th colspan="2">航空器型别</th>
      <th colspan="2">起飞站</th>
      <th>到达站</th>
      <th>出发时刻</th>
      <th height="14" colspan="8" align="left">到达时刻</th>
      </tr>
    </thead>
  <tbody>
    <tr>
      <td colspan="3" align="center">${viewRecord.VFlytype}</td>
      <td colspan="2" align="center">${viewRecord.DFlydate}</td>
      <td colspan="2" align="center">${viewRecord.planeCode}</td>
      <td colspan="2" align="center">${viewRecord.planeForm}</td>
      <td colspan="2" align="center">${viewRecord.VFpos}</td>
      <td align="center">${viewRecord.VLpos}</td>
      <td align="center">${viewRecord.DFlymoment}</td>
      <td colspan="8" align="left">${viewRecord.DEndmoment}&nbsp;</td>
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
      <th width="60" rowspan="2">教员时间<br>
        (飞\领\通\机)</th>
      <th colspan="3">领航员、飞行通信员、飞行机械员&nbsp;</th>
      <th rowspan="2" align="left">备注</th>
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
      <th width="45">通信员</th>
      <th width="45">机械员</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">${viewRecord.ILangnighttimes}</td>
      <td align="center">${viewRecord.ILanddaytimes}</td>
      <td align="center">${viewRecord.DTrantime}</td>
      <td align="center">${viewRecord.DJizhangtime}</td>
      <td align="center">${viewRecord.DDanfeitime}</td>
      <td align="center">${viewRecord.DZhuanchangtime}</td>
      <td align="center">${viewRecord.DYejiantime}</td>
      <td align="center">${viewRecord.DFujiashitime}</td>
      <td align="center">${viewRecord.DDaifeitime}</td>
      <td align="center">${viewRecord.DFjszhuanchangtime}</td>
      <td align="center">${viewRecord.DFjszcyjtime}</td>
      <td align="center">${viewRecord.DMoniyibiaotime}</td>
      <td align="center">${viewRecord.DZhenshiyibiao}</td>
      <td align="center">${viewRecord.VTranpos}</td>
      <td align="center">${viewRecord.DMnjsj}</td>
      <td align="center">${viewRecord.DXlqsj}</td>
      <td align="center">${viewRecord.DTeachertime}</td>
      <td align="center">${viewRecord.VLhy}</td>
      <td align="center">${viewRecord.VTxy}</td>
      <td align="center">${viewRecord.VJxy}</td>
      <td align="left"><img src="themes/cupertino/images/detail.png" title="${viewRecord.VBz}" border="0"/></td>
    </tr>
  </tbody>
</table>
</s:if>
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
<form id="saveRecord" method="post" action="createOtherFlightTrainingRecord.do">
<input type="hidden" name="otherRecord.DFlydate" id="sDFlydate">
<input type="hidden" name="otherRecord.DStarttime" id="sflyMoment">
<input type="hidden" name="otherRecord.DEndtime" id="sendMoment">
<input type="hidden" name="otherRecord.TDiction.VId" id="sVFlytype">
<input type="hidden" name="otherRecord.planeinfo.VId" id="splaneid" />
<input type="hidden" name="otherRecord.stationByVFlypos.VId" id="sVFpos">
<input type="hidden" name="otherRecord.stationByVLandpos.VId" id="sVLpos">
<input type="hidden" name="otherRecord.IDaytimes" id="sILanddaytimes">
<input type="hidden" name="otherRecord.INeighttimes" id="sILangnighttimes">
<input type="hidden" name="otherRecord.DJiashiyuantime" id="sDTrantime">
<input type="hidden" name="otherRecord.VBz" id="sVBz">
</form>

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
/*
var isWrite  = $("#isWrite").val();
if(isWrite==0){
	$("#divSaveReocrdButton").css('display','');
}else{
	$("#divSaveReocrdButton").css('display','none');
}
*/
</script>