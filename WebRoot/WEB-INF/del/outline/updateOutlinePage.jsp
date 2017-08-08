<%@ page language="java"  import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>编辑大纲</title>
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
#Panel1, .buttonBox { width: auto; margin-left: 50px; margin-right: 50px; padding-top: 0; }
.Panel, .panelContent, .panelTable, td { background-color: transparent; box-shadow: none; filter: none; }

.rightLine1{width:80px; float:left; height:35px; text-align:center;border-right:solid 1px #DBE3E8;}
.rightLine2{width:80px; float:left; text-align:center;border-right:solid 1px #DBE3E8; padding-top:4px;}
.middleclass{background: #EEEEEE; width: 100%; height: 1px; line-height: 1px; margin: 0px 0 0px 0; display: block; clear: both;}
</style>
<script>
$(function() {
	function getSelValue(name){
		var str="";
		var r1=document.getElementsByName(name);
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str+=r1[i].value + ",";
			}
		}
		return str;
	}
	function checkRegexp( o) {
		var re = /^\d+(\.\d+)?$/; //判断浮点数
		if ( re.test( o ) ) {
			return true;
		} else {
			return false;
		}
	}
	var cDTraintime = $("#cDTraintime").val();
	$("#cDTraintime").val(getFormatTime(cDTraintime));
	
	var cDPlanetime = $("#cDPlanetime").val();
	$("#cDPlanetime").val(getFormatTime(cDPlanetime));
	
	var cDTrainningdevicetime = $("#cDTrainningdevicetime").val();
	$("#cDTrainningdevicetime").val(getFormatTime(cDTrainningdevicetime));
	
	var cDMonijitime = $("#cDMonijitime").val();
	$("#cDMonijitime").val(getFormatTime(cDMonijitime));

	function giveValue(){
		$("#VCode").val($("#cVCode").val());
		$("#VName").val($("#cVName").val());
		$("#VBc").val($("#cVBc").val());
		
		$("#IUnits").val($("#cIUnits").val());
		$("#IStages").val($("#cIStages").val());
		$("#ILessons").val($("#cILessons").val());
		
		$("#DTraintime").val(getTimeById('cDTraintime'));
		$("#DPlanetime").val(getTimeById('cDPlanetime'));
		$("#DTrainningdevicetime").val(getTimeById('cDTrainningdevicetime'));
		$("#DMonijitime").val(getTimeById('cDMonijitime'));

		$("#VMeterclass").val(getSelValue('yibiaoName'));
		$("#VMultipleclass").val(getSelValue('duofaName'));
		$("#VTrainequipment").val(getSelValue('shebeiName'));
		$("#VTrainform").val(getSelValue('jixingName'));
	
		$("#VRange").val($("#cVRange").val());
		$("#VTarget").val($("#cVTarget").val());
		$("#VConditions").val($("#cVConditions").val());
		$("#VTraincycle").val($("#cVTraincycle").val());
		$("#VChangeschool").val($("#cVChangeschool").val());
		$("#VStoptrain").val($("#cVStoptrain").val());
		$("#VTrainmethod").val($("#cVTrainmethod").val());
		$("#VScorejudge").val($("#cVScorejudge").val());
		$("#VTrainrecord").val($("#cVTrainrecord").val());
		
		if($.trim($("#VCode").val())==""){
			alert("大纲编号不能为空。");
			$("#cVCode").focus();
			return false;
		}
		if($.trim($("#VName").val())==""){
			alert("大纲名称不能为空。");
			$("#cVName").focus();
			return false;
		}
		if($("#IUnits").val()=="" || !checkNum($("#IUnits").val())){
			alert("单元数量应为数字。");
			$("#cIUnits").focus();
			return false;
		}
		if($("#IStages").val()=="" || !checkNum($("#IStages").val())){
			alert("阶段数量应为数字。");
			$("#cIStages").focus();
			return false;
		}
		if($("#ILessons").val()=="" || !checkNum($("#ILessons").val())){
			alert("课程数量应为数字。");
			$("#cILessons").focus();
			return false;
		}

		if($("#DTraintime").val()==0 || !checkRegexp($("#DTraintime").val())){
			alert("飞行训练时间应为数字。");
			$("#cDTraintime").focus();
			return false;
		}
		if(!checkRegexp($("#DPlanetime").val())){
			alert("飞机时间应为数字。");
			$("#cDPlanetime").focus();
			return false;
		}
		if(!checkRegexp($("#DTrainningdevicetime").val())){
			alert("训练器时间应为数字。");
			$("#cDTrainningdevicetime").focus();
			return false;
		}

		if(!checkRegexp($("#DMonijitime").val())){
			alert("模拟机时间应为数字。");
			$("#cDMonijitime").focus();
			return false;
		}
		
		return true;

	}
	$("#saveone").click(function(){//保存数据
		if(giveValue()){
			$( "#unitSubjectForm" ).submit();
		}
	});
	$("#savetwo").click(function(){//保存数据
		if(giveValue()){
			$( "#unitSubjectForm" ).submit();
		}
	});
	$("#startAdd").click(function(){//打开选择站的窗口
		$( "#dialogForm1" ).dialog( "open" );
	});
	$("#endAdd").click(function(){//打开选择站的窗口
		$( "#dialogForm2" ).dialog( "open" );
	});
	$("#escid0").click(function(){//上面取消
		window.location.href="open_outLineList.do";
	});
	$("#escid1").click(function(){//下面取消
		window.location.href="open_outLineList.do";
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
});
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

<div id="topPartD"><div class="panelBox buttonBox"><%request.setAttribute("k",ActionContext.getContext().getName());%>
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
</s:else><s:if test="#r==null || #r==0">
<button class="green" primary="ui-icon-button-confirm" id="saveone">保存</button></s:if>
<button class="normal" id="escid0"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div></div>

<div id="rightPartD"><div>
<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
    
		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
		
			<tbody>
			  <tr class="normal">
				<td align="right">大纲编号：</td>
				<td colspan="3"><div style="margin-top:5px;"><input id="cVCode" value="${outline.VCode}" type="text" class="text ui-widget-content ui-corner-all" style="width:320px;" /></div></td>
				<td align="right">大纲名称：</td>
				<td colspan="3"><div style="margin-top:5px;"><input id="cVName"  value="${outline.VName}" type="text" class="text ui-widget-content ui-corner-all" style="width:316px;" /></div></td>
			  </tr>
			  <tr class="normal">
				<td width="90" align="right" style="height:39px;">版 本 号：</td>
				<td width="100"><div style="margin-top:5px;"><input id="cVBc" value="${outline.VBc}" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" /></div></td>
				<td width="60">单元数量：</td>
				<td width="100"><div style="margin-top:5px;"><input id="cIUnits" value="${outline.IUnits}" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;"  /></div></td>
				<td width="80" align="right">阶段数量：</td>
				<td width="100"><div style="margin-top:5px;"><input id="cIStages" value="${outline.IStages}" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;"  /></div></td>
				<td width="80" align="right">课程数量：</td>
				<td><div style="margin-top:5px;"><input id="cILessons" type="text" value="${outline.ILessons}" class="text ui-widget-content ui-corner-all" style="width:100px;" /></div></td>
			  </tr>
			 
			  <tr class="normal">
				<td align="right">飞行训练时间：</td>
				<td><div style="margin-top:5px;"><input id="cDTraintime" value='${outline.DTraintime}'  type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" onMouseDown="deletebMF('cDTraintime')" onBlur="viewLongTime('cDTraintime')" /></div></td>
				<td>飞机时间：</td>
				<td><div style="margin-top:5px;"><input id="cDPlanetime"  value='${outline.DPlanetime}'  type="text" class="text ui-widget-content ui-corner-all" style="width:100px;" onMouseDown="deletebMF('cDPlanetime')" onBlur="viewLongTime('cDPlanetime')" /></div></td>
				<td align="right">训练器时间：</td>
				<td><div style="margin-top:5px;"><input id="cDTrainningdevicetime"  value='${outline.DTrainningdevicetime}' type="text" class="text ui-widget-content ui-corner-all" style="width:100px;"  onMouseDown="deletebMF('cDTrainningdevicetime')" onBlur="viewLongTime('cDTrainningdevicetime')" /></div></td>
				<td align="right">模拟机时间：</td>
				<td><div style="margin-top:5px;"><input id="cDMonijitime" type="text" class="text ui-widget-content ui-corner-all" style="width:100px;"  value="${outline.DMonijitime}"  onMouseDown="deletebMF('cDMonijitime')" onBlur="viewLongTime('cDMonijitime')"/></div></td>
			  </tr>
			 
               <tr class="normal">
				<td align="right">仪表等级：</td>
				<td colspan="3"><input name="yibiaoName" type="checkbox" value="1" <s:if test='(","+outline.VMeterclass).indexOf(",1,")!= -1'>checked</s:if> /><b></b>仪表(飞机)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="yibiaoName" type="checkbox" value="2" <s:if test='(","+outline.VMeterclass).indexOf(",2,")!= -1'>checked</s:if> /><b></b>仪表(直升机)</td>
				<td align="right">训练设备：</td>
				<td colspan="3"><input name="shebeiName" type="checkbox" value="1" <s:if test='(","+outline.VTrainequipment).indexOf(",1,")!= -1'>checked</s:if> ><b></b>飞机&nbsp;&nbsp;&nbsp;&nbsp;<input name="shebeiName" type="checkbox" value="2" <s:if test='(","+outline.VTrainequipment).indexOf(",2,")!= -1'>checked</s:if> /><b></b>训练器</td>
			  </tr>
 <tr class="normal">
				<td align="right">多发等级：</td>
				<td colspan="7"><input name="duofaName" type="checkbox" value="1" <s:if test='(","+outline.VMultipleclass).indexOf(",1,")!= -1'>checked</s:if> ><b></b>单发陆地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="duofaName" type="checkbox" value="2"  <s:if test='(","+outline.VMultipleclass).indexOf(",2,")!= -1'>checked</s:if> ><b></b>多发陆地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="duofaName" type="checkbox" value="3"  <s:if test='(","+outline.VMultipleclass).indexOf(",3,")!= -1'>checked</s:if> ><b></b>单发水上&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="duofaName" type="checkbox" value="4"  <s:if test='(","+outline.VMultipleclass).indexOf(",4,")!= -1'>checked</s:if> ><b></b>多发水上 </td>
			  </tr>
 <tr class="normal">
				<td align="right">训练机型：</td>
				<td colspan="7"><s:iterator value="planeformList">
				  <input name="jixingName" type="checkbox" value="${VId}" <s:if test='outline.VTrainform.indexOf(VId)!= -1'>checked</s:if> /><b></b>${VName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</s:iterator>
			    </td>
			  </tr>

			  <tr class="normal">
				<td align="right">使用范围：</td>
				<td colspan="3"><textarea  id="cVRange"  style="width:330px;height:300px;" class="text ui-widget-content ui-corner-all">${outline.VRange}</textarea></td>
				<td align="right">课程目标：</td>
				<td colspan="3"><textarea  id="cVTarget" style="width:330px;height:300px;" class="text ui-widget-content ui-corner-all">${outline.VTarget}</textarea></td>
			  </tr>
			  <tr class="normal">
				<td align="right">进入条件：</td>
				<td colspan="3"><textarea  id="cVConditions" style="width:330px;height:300px;" class="text ui-widget-content ui-corner-all">${outline.VConditions}</textarea></td>
				<td align="right">训练周期：</td>
				<td colspan="3"><textarea  id="cVTraincycle" style="width:330px;height:300px;" class="text ui-widget-content ui-corner-all">${outline.VTraincycle}</textarea></td>
			  </tr>
			  <tr class="normal">
			    <td align="right">转学规定：</td>
			    <td colspan="3"><textarea  id="cVChangeschool" style="width:330px;height:300px;" class="text ui-widget-content ui-corner-all">${outline.VChangeschool}</textarea></td>
			    <td align="right">训练终止：</td>
			    <td colspan="3"><textarea  id="cVStoptrain" style="width:330px;height:300px;" class="text ui-widget-content ui-corner-all">${outline.VStoptrain}</textarea></td>
		      </tr>
               <tr class="normal">
			    <td align="right">训练成绩评定：</td>
			    <td colspan="3"><textarea  id="cVScorejudge" style="width:330px;height:300px;" class="text ui-widget-content ui-corner-all">${outline.VScorejudge}</textarea></td>
			    <td align="right">培训方法：</td>
			    <td colspan="3"><textarea  id="cVTrainmethod" style="width:330px;height:300px;" class="text ui-widget-content ui-corner-all">${outline.VTrainmethod}</textarea></td>
		      </tr>
			  <tr class="normal">
			    <td align="right">训练记录：</td>
			    <td colspan="7"><textarea  id="cVTrainrecord" style="width:330px;height:300px;" class="text ui-widget-content ui-corner-all">${outline.VTrainrecord}</textarea></td>
		      </tr>
			</tbody>
		</table>

	</div>
</div>


<div class="panelBox buttonBox"><s:if test="#r==null || #r==0">
<button class="green" primary="ui-icon-button-confirm" id="savetwo">保存</button></s:if>
<button class="normal" id="escid1"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>
</div>
</div>



<div id="dialogForm3">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span>
		</div>
	</fieldset>	
</div>

<form id="unitSubjectForm" method="post" action="updateOutline.do">
<input type="hidden" name="outline.VId" value="${outline.VId}"/>
<input type="hidden" name="outline.VCode" id="VCode" />
<input type="hidden" name="outline.VName" id="VName" />
<input type="hidden" name="outline.VBc" id="VBc" />

<input type="hidden" name="outline.IUnits" id="IUnits" />
<input type="hidden" name="outline.IStages" id="IStages" />
<input type="hidden" name="outline.ILessons" id="ILessons" />

<input type="hidden" name="outline.DTraintime" id="DTraintime" />
<input type="hidden" name="outline.DPlanetime" id="DPlanetime" />
<input type="hidden" name="outline.DTrainningdevicetime" id="DTrainningdevicetime" />
<input type="hidden" name="outline.DMonijitime" id="DMonijitime" />

<input type="hidden" name="outline.VMeterclass" id="VMeterclass" />
<input type="hidden" name="outline.VMultipleclass" id="VMultipleclass" />
<input type="hidden" name="outline.VTrainequipment" id="VTrainequipment" />
<input type="hidden" name="outline.VTrainform" id="VTrainform" />

<input type="hidden" name="outline.VRange" id="VRange" />
<input type="hidden" name="outline.VTarget" id="VTarget" />
<input type="hidden" name="outline.VConditions" id="VConditions" />
<input type="hidden" name="outline.VTraincycle" id="VTraincycle" />
<input type="hidden" name="outline.VChangeschool" id="VChangeschool" />
<input type="hidden" name="outline.VStoptrain" id="VStoptrain" />
<input type="hidden" name="outline.VTrainmethod" id="VTrainmethod" />
<input type="hidden" name="outline.VScorejudge" id="VScorejudge"/>
<input type="hidden" name="outline.VTrainrecord" id="VTrainrecord"/>
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