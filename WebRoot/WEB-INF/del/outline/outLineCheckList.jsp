<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>大纲符合性校验</title>
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
<style>

fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
.imgs{cursor:pointer;}

.thnone { border-top: 1px solid #665E64; border-right: 1px solid #665E64; border-bottom: 1px solid #665E64; border-left: 0;}
.tdnone { border-top: 0; border-right: 1px solid #665E64; border-bottom: 1px solid #665E64; border-left: 0; }
.lastrow{ border-bottom: 0;}
.lastCol { border-right: 0; }  
</style>
<script>
$(function() {

	$("#modalDialogButton4").click(function(){//查询
		if($("#searchOutlineName").val()=="大纲名称"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($("#searchOutlineName").val());
		}
		$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//刷新
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});
	$("#submitAudit").click(function(){
		var k = getSelRadioValue('radioName');
		if(k==""){
			$("#dialogForm3Warning").html("请选择要提交审核的大纲。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	params = {"id":k};
	$.ajax({
		type:"post",
		url:"execOutlineSubmitAuditById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag==false){
				alert(data.message);
				return;
			}
			alert("大纲提交成功。");
			window.location.replace('open_outlineCheckList.do');
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
		
	});
	$( "#dialogContent" ).dialog({//内容窗口
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#dialogForm3" ).dialog({//警告信息窗口
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

	$( "#addLessonDialog" ).dialog({//大纲详细
		autoOpen: false,
		height: 480,
		width: 960,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {

				$( this ).dialog( "close" );
			}
		}
	});

});
function viewContent(id){//查看大纲内容

	if(id==""){
		return;	
	}
	params = {"id":id};
	$.ajax({
		type:"post",
		url:"showTrainingOutlineContentById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
			$("#contentid").html(getContent(data));
			$("#dialogContent").dialog('option', 'title',  "所选大纲《"+data.VName+"》");
			$( "#dialogContent" ).dialog( "open" );
		}, 
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}
function getContent(data){
	content="";
	content+="<tr>";
	content+="<td>大纲名称：</td>";
	content+="<td  height=\"24\" colspan=\"3\">"+data.VName+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td height=\"24\" width=\"15%\">大纲编号：</td><td width=\"35%\">"+data.VCode+"</td>";
	content+="<td width=\"15%\">版本号：</td><td d width=\"35%\">"+data.VBc+"</td>";
	content+="</tr>";
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\" >单元数量：</td><td>"+data.IUnits+"</td>";
	content+="<td>阶段数量：</td><td>"+data.IStages+"</td>";
	content+="</tr>";
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">课程数量：</td><td>"+data.ILessons+"</td>";
	content+="<td>训练时间：</td><td>"+getFormatTime(data.DTraintime)+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">飞机时间：</td><td>"+getFormatTime(data.DPlanetime)+"</td>";
	content+="<td>训练器时间：</td><td>"+getFormatTime(data.DTrainningdevicetime)+"</td>";
	content+="</tr>"
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	content+="<tr>";
	content+="<td  height=\"24\">当前状态：</td><td>"+getStatusName(data.IStatus)+"</td>";
	content+="<td>创建日期：</td><td>"+data.viewCreatedate+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">仪表等级：</td><td>"+data.VMeterclass+"</td>";
	content+="<td>训练设备：</td><td>"+data.VTrainequipment+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">多发等级：</td><td>"+data.VMultipleclass+"</td>";
	content+="<td>训练机型：</td><td>"+data.VTrainform+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>使用范围：</td>";
	content+="<td  height=\"24\" colspan=\"3\">"+data.VRange.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>课程目标：</td>";
	content+="<td  height=\"24\" colspan=\"3\">"+data.VTarget.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>进入条件：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VConditions.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>训练周期：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VTraincycle.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>转学规定：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VChangeschool.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>训练终止：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VStoptrain.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>成绩评定：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VScorejudge.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>培训方法：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VTrainmethod.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>训练记录：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VTrainrecord.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"	
	return content;
}
function getStatusName(type){
	var sName = "";
	if(type==0){
		sName="<font color=\"#50A13B\">已生效</font>";
	}else if(type==1){
		sName="<font color=\"#CC9900\">已取消</font>";
	}else if(type==3){
		sName="<font color=\"#3399FF\">未审批</font>";
	}else if(type==2){
		sName="<font color=\"#EB7979\">未通过</font>";
	}else{
		sName="未提交";
	}		
	return sName;
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149eb4aa0005</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

<div class="panelBox buttonBox">
 	 <%request.setAttribute("k",ActionContext.getContext().getName());%>
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
<s:if test="#r==null || #r==0"><button class="green" id="submitAudit">提交审核</button></s:if>
    <!--<button class="normal barLeft"  id="modalDialogButton6">符合</button>
    <button class="normal barMiddle" id="modalDialogButton3">不符合</button>-->
    <button class="normal" id="modalDialogButton5">全部</button>
   
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchOutlineName" title="大纲名称"  name="searchOutlineName"  type="text" maxlength="50" value="大纲名称" /><button id="modalDialogButton4">查询</button>
    </div>
</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3">
        	<thead>
			  <tr>
				<th width="30" rowspan="2">&nbsp;</th>
				<th width="290" rowspan="2">大纲名称</th>
				<th colspan="3">已创建/大纲标准</th>
				<th colspan="4">已创建时间/大纲标准时间</th>
               	<th width="40" rowspan="2">符合度</th>
                <th width="40" rowspan="2">详细</th>
                <th rowspan="2"><div align="left">&nbsp;&nbsp;状态</div></th>
			  </tr>
			  <tr>
			    <th width="40">单元数</th>
			    <th width="40">阶段数</th>
			    <th width="40">课程数</th>
			    <th width="90">飞行训练</th>
			    <th width="90">训练器</th>
			    <th width="90">飞机</th>
			    <th width="90">模拟机</th>
               
		      </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
			  <tr>
				<td align="center"><input name="radioName" type="radio" value="${VId}"><b></b></td>
				<td><A href="javascript:void(0)" onclick="viewContent('${VId}')" class="blue">${VName}</A></td>
				<td align="center">${ILessonUnits}/${IUnits}</td>
				<td align="center">${ILessonStages}/${IStages}</td>
				<td align="center">${ILessonLessons}/${ILessons}</td>
				<td align="right">${SLessonTraintime}/${STraintime}&nbsp;</td>
                <td align="right">${SLessonDTrainningdevicetime}${STrainningdevicetime}&nbsp;</td>
				<td align="right">${SLessonDPlanetime}${SPlanetime}&nbsp;</td>
				<td align="right">${SLessonMonijitime}${SMonijitime}&nbsp;</td>						                 
                <td align="center"><s:if test='hege==0'><font color="#EB7979">不符合</font></s:if><s:else>符合</s:else></td>
				<td align="center"><A href="javascript:void(0)" onClick="viewDetail('${VId}','${VName}','${ILessons}','${STraintime}','${STrainningdevicetime}','${SPlanetime}','${ILessonLessons}','${SLessonTraintime}','${SLessonDTrainningdevicetime}','${SLessonDPlanetime}','${SMonijitime}','${SLessonMonijitime}')" class="blue">查看</A></td>
				<td><div align="left">&nbsp;
     <s:if test='0==IStatus'><font color="#50A13B">已生效</font></s:if>
	<s:if test='1==IStatus'><font color="#CC9900">已取消</font></s:if>
	<s:if test='3==IStatus'><font color="#3399FF">未审批</font></s:if>
	<s:if test='2==IStatus'><font color="#EB7979">未通过</font></s:if>
	<s:if test='4==IStatus'>未提交</s:if></div></td>
			  </tr>
              </s:iterator>
             <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			  </tr>
              </s:iterator>
			</tbody>
		</table><s:include value="../common/pagination_system.jsp" />
</div>
</div>
</div>
</div>
<div id="dialogForm3">
  <fieldset>
    <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
      </tr>
    </table>
  </fieldset>
</div>

<div id="dialogContent"  title="所选大纲内容详单">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
    <tbody id="contentid">
    </tbody>
    </table>
</div>
<div id="addLessonDialog">
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:26px;border-collapse:collapse;  border-color:#665E64" >
<tbody id="outline">
</tbody>
</table>

<table width="100%" cellspacing="0" cellpadding="0" id="unit1" border="0"  style="display:none;line-height:26px;border-collapse:collapse;  border-color:#665E64">
</table>
</div>
<form  action="open_outlineCheckList.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
</form>
<input type="hidden"  id="selLessons"/>
<input type="hidden"  id="selPhases"/>
<input type="hidden"  id="selUnits"/>
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
function viewDetail(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11){
	var os = "";
	os+="<tr bgcolor=\"#F6F6F6\">";
	os+="<td width=\"20\" class=\"thnone\"></td>";
	os+="<td width=\"45\" class=\"thnone\">&nbsp;大纲</td>";
	os+="<td width=\"70\" class=\"thnone\">&nbsp;课目编号</td>";
	os+="<td width=\"70\" class=\"thnone\">&nbsp;版本号</td>";
	os+="<td class=\"thnone\">&nbsp;名称</td>";
	os+="<td width=\"60\" align=\"center\" class=\"thnone\">课目数量</td>";
	os+="<td align=\"right\" width=\"90\" class=\"thnone\">训练时间&nbsp;</td>";
	os+="<td align=\"right\" width=\"90\" class=\"thnone\">训练器时间&nbsp;</td>";
	os+="<td align=\"right\" width=\"90\" class=\"thnone\">飞机时间&nbsp;</td>";
	os+="<td align=\"right\" width=\"90\" class=\"thnone lastCol\">模拟机时间&nbsp;</td>";
	os+="</tr>";
	os+="<tr>";
	os+="<td align=\"right\" class=\"tdnone\"><img src=\"themes/cupertino/images/jiahao.gif\" class=\"imgs\" ";
	os+="id=\""+ a0 + "-0-1\" ";
	os+="onclick=\"execDot('"+a0 + "-0-1')\"/>";
	os+="&nbsp;</td>";
	os+="<td colspan=\"4\" class=\"tdnone\">&nbsp;"+a1+"</td>";
	os+="<td align=\"center\" class=\"tdnone\">"+a6+"/" + a2+"</td>";
	os+="<td align=\"right\" class=\"tdnone\">"+a7 +"/" +a3+"&nbsp;</td>";
	os+="<td align=\"right\" class=\"tdnone\">"+a8+a4+"&nbsp;</td>";
	os+="<td align=\"right\" class=\"tdnone\">"+a9+a5+"&nbsp;</td>";
	os+="<td align=\"right\" class=\"tdnone lastCol\">"+a11+a10+"&nbsp;</td>";
	os+="</tr>";
	$("#outline").html(os);
	$("#selLessons").val("");
	$("#selPhases").val("");
	$("#selUnits").val("");
	$("#unit1").css("display","none");
	$("#addLessonDialog").dialog('option', 'title',  "所选大纲预览");
	$( "#addLessonDialog" ).dialog( "open" );
}
function execDot(ids){

	var str = ids;//id，类型，数量；
	var id = str.split("-")[0];	
	var level = str.split("-")[1];
	var num = str.split("-")[2];
	var os = "";
	if(level==0){//大纲
		os="";
		var stra = $("#selUnits").val();
		if(stra.indexOf(id)!=-1){
			if($("#unit1")[0].style.display==''){
				$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
				$("#unit1")[0].style.display='none';
			}else{
				$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
				$("#unit1")[0].style.display='';	
			}
			return;	
		}
		$("#selUnits").val(stra+id);
		//获取大纲单元
		params = {"outlineid":id};
		$.ajax({
			async:false,//同步请求，默认异步
			type:"post",
			url:"showOutlineCheckListUnitListByOutlineId.do",
			data:params,
			dataType:"json",
			success:function(data){
				for(i=0;i<data.length;i++){
					os+="<tr>";
					//os+="<td width=\"20\"></td>";
					if(data[i].isChild==0){
						os+="<td width=\"65\" class=\"tdnone\"></td>";
					}else{
						os+="<td align=\"center\" width=\"65\" class=\"tdnone\">&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"themes/cupertino/images/jiahao.gif\" class=\"imgs\" ";
						os+="id=\""+ data[i].VId + "-1-"+(i+1) +"\" ";
						os+="onclick=\"execDot('"+data[i].VId + "-1-"+(i+1)+"')\"/>";
						os+="&nbsp;</td>";
					}
					os+="<td class=\"tdnone\">&nbsp;"+data[i].VName+"</td>";
					os+="<td class=\"tdnone\" align=\"center\" width=\"60\">"+data[i].VCode+"</td>";

					os+="<td align=\"right\" width=\"90\" class=\"tdnone\">"+getFormatTime(data[i].trainingTime)+"&nbsp;</td>";
					os+="<td align=\"right\" width=\"90\" class=\"tdnone\">"+getFormatTime(data[i].totalTime)+"&nbsp;</td>";
					os+="<td align=\"right\" width=\"90\" class=\"tdnone\">"+getFormatTime(data[i].finishTime)+"&nbsp;</td>";
					os+="<td align=\"right\" width=\"90\" class=\"tdnone lastCol\">"+getFormatTime(data[i].monijiTime)+"&nbsp;</td>";
					os+="</tr>";
					os+="<tr>";
					os+="<td colspan=\"7\">";
					os+="<table class=\"colorTable\"  cellspacing=\"0\" cellpadding=\"0\"";
					os+=" style=\"display:none;\" id=\"phase"+data[i].VId +"\">";
					os+="</table>";
					os+="</td>";
					os+="</tr>";
				}
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});

		$("#unit1").html(os);
		if($("#unit1")[0].style.display==''){
			$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
			$("#unit1")[0].style.display='none';
		}else{
			$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
			$("#unit1")[0].style.display='';
		}
	}
	if(level==1){//单元
		//获取单元阶段
		var strb = $("#selPhases").val();
		if(strb.indexOf(id)!=-1){
			if($("#phase" + id)[0].style.display==''){
				$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
				$("#phase" + id)[0].style.display='none';
			}else{
				$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
				$("#phase" + id)[0].style.display='';	
			}
			return;	
		}
		$("#selPhases").val(strb+id);
		os = "";
		params = {"unitid":id};
		$.ajax({
			async:false,//同步请求，默认异步
			type:"post",
			url:"showOutlineCheckListPhaseListByUnitId.do",
			data:params,
			dataType:"json",
			success:function(data){
				for(i=0;i<data.length;i++){
					
					os+="<tr>";
					//os+="<td width=\"19\"></td>";
					if(data[i].isChild==0){
						os+="<td width=\"65\" class=\"tdnone\"></td>";
					}else{
						os+="<td width=\"65\" align=\"right\" class=\"tdnone\"><img src=\"themes/cupertino/images/jiahao.gif\"";
						os+=" class=\"imgs\" id=\""+data[i].VId + "-2-" +(i+1)+"\"";
						os+=" onclick=\"execDot('"+data[i].VId + "-2-" +(i+1) +"')\"/>&nbsp;</td>";
					}
					os+="<td class=\"tdnone\">&nbsp;"+data[i].VName +"</td>";
					os+="<td align=\"center\" width=\"60\" class=\"tdnone\">"+data[i].VCode+"</td>";
					os+="<td align=\"right\" width=\"90\" class=\"tdnone\">"+getFormatTime(data[i].trainingTime)+"&nbsp;</td>";					
					os+="<td align=\"right\" width=\"90\" class=\"tdnone\">"+getFormatTime(data[i].totalTime)+"&nbsp;</td>";
					os+="<td align=\"right\" width=\"90\" class=\"tdnone\">"+getFormatTime(data[i].finishTime)+"&nbsp;</td>";
					os+="<td align=\"right\" width=\"90\" class=\"tdnone lastCol\">"+getFormatTime(data[i].monijiTime)+"&nbsp;</td>";
					os+="</tr>";
					os+="<tr>";
					os+="<td colspan=\"7\">";
					os+="<table   class=\"colorTable\" cellspacing=\"0\" cellpadding=\"0\"";
					os+=" style=\"display:none;line-height:26px;\" id=\"lesson"+data[i].VId+"\">";
					os+="</table>";
					os+="</td>";
					os+="</tr>";
				}
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});

		$("#phase" + id).html(os);
		
		if($("#phase" + id)[0].style.display==''){
			$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
			$("#phase" + id)[0].style.display='none';
		}else{
			$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
			$("#phase" + id)[0].style.display='';	
		}
		
	}
	if(level==2){//阶段
		os = "";
		var strc = $("#selLessons").val();
		if(strc.indexOf(id)!=-1){
			if($("#lesson" + id)[0].style.display==''){
				$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
				$("#lesson" + id)[0].style.display='none';
			}else{
				$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
				$("#lesson" + id)[0].style.display='';	
			}
			return;	
		}
		$("#selLessons").val(strc+id);
		params = {"phaseid":id};
		$.ajax({
			async:false,//同步请求，默认异步
			type:"post",
			url:"showAddHoursAndAddLessonLessonListByPhaseId.do",
			data:params,
			dataType:"json",
			success:function(data){
			
				var d=0;
				var d1 =0;
				var d2=0;
				var d3=0;
				for(i=0;i<data.length;i++){

					os+="<tr ><td width=\"65\" class=\"tdnone\"></td>";
					os+="<td width=\"70\" class=\"tdnone\">&nbsp;"+data[i].VCode+"</td>";
					os+="<td width=\"70\" class=\"tdnone\">&nbsp;"+data[i].outlineId+"</td>";
					os+="<td class=\"tdnone\">&nbsp;"+data[i].VName+"</td>";
					os+="<td align=\"center\" width=\"60\" class=\"tdnone\">1</td>";

					os+="<td width=\"90\" align=\"right\" class=\"tdnone\">"+getFormatTime(data[i].trainingTime)+"&nbsp;</td>";
					os+="<td width=\"90\" align=\"right\" class=\"tdnone\">"+getFormatTime(data[i].totalTime)+"&nbsp;</td>";
					os+="<td width=\"90\" align=\"right\" class=\"tdnone\">"+getFormatTime(data[i].finishTime)+"&nbsp;</td>";
					os+="<td width=\"90\" align=\"right\" class=\"tdnone lastCol\">"+getFormatTime(data[i].monijiTime)+"&nbsp;</td>";
					os+="</tr>";
					d+=data[i].trainingTime;
					d1+=data[i].totalTime;
					d2+=data[i].finishTime;
					d3+=data[i].monijiTime;
				}
				os+="<tr bgcolor=\"#F6F6F6\"><td colspan=\"4\" align=\"right\" class=\"tdnone\">合计：&nbsp;</td>";
				os+="<td align=\"center\" class=\"tdnone\">"+data.length+"</td>";
				os+="<td align=\"right\" class=\"tdnone\">"+getFormatTime(d)+"&nbsp;</td>";
				os+="<td align=\"right\" class=\"tdnone\">"+getFormatTime(d1)+"&nbsp;</td>";
				os+="<td align=\"right\" class=\"tdnone\">"+getFormatTime(d2)+"&nbsp;</td>";
				os+="<td align=\"right\" class=\"tdnone lastCol\">"+getFormatTime(d3)+"&nbsp;</td>";
				os+="</tr>";
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});

		$("#lesson" + id).html(os);
		execbase();
		if($("#lesson" + id)[0].style.display==''){
			$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
			$("#lesson" + id)[0].style.display='none';
		}else{
			$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
			$("#lesson" + id)[0].style.display='';	
		}
	}
}
</script>