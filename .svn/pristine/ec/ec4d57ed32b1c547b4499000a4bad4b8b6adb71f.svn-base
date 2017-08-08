<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员执照信息</title>

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
#Panel1, .buttonBox { width: auto; margin-left: 50px; margin-right: 50px; padding-top: 0; }
.Panel, .panelContent, .panelTable, td { background-color: transparent; box-shadow: none; filter: none; }

.rightLine1{width:80px; float:left; height:35px; text-align:center;border-right:solid 1px #DBE3E8;}
.rightLine2{width:80px; float:left; text-align:center;border-right:solid 1px #DBE3E8; padding-top:4px;}
.middleclass{background: #EEEEEE; width: 100%; height: 1px; line-height: 1px; margin: 0px 0 0px 0; display: block; clear: both;}
</style>
<script>
$(function() {
	
	 //取消，返回列表页
	$("#modalDialogButton2").click(function(){
	    $("#searchForm").submit();
	});
	 
	 //保存
	$("#modalDialogButton3").click(function(){
		var errors = "";
		var count=0;
		var IChecktype = document.getElementsByName("IChecktype");
		var IChecktypes = "";
		for(i=0; i<IChecktype.length; i++){
			if(IChecktype[i].checked == true){
				count++;
				IChecktypes += IChecktype[i].value+",";
			}
		}
		if(count==0 || IChecktypes==","){
			errors += "【检查类型】为必填项，请勾选！\r";
			count=0;
		}
		
		var DCheckdate = $("#DCheckdate").val();
		var VCheckcontent = $("#VCheckcontent").val();
		var VCheckteacher = $("#VCheckteacher").val();
		var VBz = $("#VBz").val();
		//var DEffectdate = $("#DEffectdate").val();
		var VFlyform = $("#VFlyform").val();
		
		if(DCheckdate==null || $.trim(DCheckdate)==""){
			errors += "【检查日期】为必填项，不能为空！\r";
		}
		if(VCheckcontent==null || $.trim(VCheckcontent)==""){
			errors += "【检查内容】为必填项，不能为空！\r";
		}
		if(VCheckteacher==null || $.trim(VCheckteacher)==""){
			errors += "【检查教员】为必填项，不能为空！\r";
		}
		if(DEffectdate==null || $.trim(DEffectdate)==""){
			errors += "【下一次熟练检查日期】为必填项，不能为空！\r";
		}
		if(VFlyform==null || $.trim(VFlyform)==""){
			errors += "【航空器型号】为必填项，不能为空！\r";
		}
		if(errors==""){
			$("#IChecktypef").val(IChecktypes);
			$("#DCheckdatef").val(DCheckdate);
			$("#VCheckcontentf").val(VCheckcontent);
			$("#VCheckteacherf").val(VCheckteacher);
			$("#VBzf").val(VBz);
			$("#DEffectdatef").val(DEffectdate);
			$("#VFlyformf").val(VFlyform);
			
			$("#peopleForm").submit();
		}else{
			alert(errors);
			return;
		}
	});
	
	 //取消，返回列表页
	$("#modalDialogButton4").click(function(){
	    $("#searchForm").submit();
	});
	
});
</script>

<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>

</head>
<body class="hide">
<div id="leftPartA"><div>
<s:action name="open_leftList" executeResult="true">
<s:param name="parentid">4028816a4714304c0147149e89190004</s:param>
<s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
</s:action>
</div></div>

<div id="topPartD">
<div class="panelBox buttonBox">
<button id="modalDialogButton3" class="green" primary="ui-icon-button-confirm">保存</button>
<button id="modalDialogButton4" class="normal"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>
</div>

<input type="hidden" name="statusMsg" />

<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
	<!--<div class="panelHead"><span>${aoru}</span></div>-->

		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="normal">
					<td width="80" align="right">检查类型：</td>
					<td colspan="5">
						<input type="checkbox" name="IChecktype" value="0"/><b></b>熟练检查　
						<input type="checkbox" name="IChecktype" value="1"/><b></b>定检检查　
						<input type="checkbox" name="IChecktype" value="2"/><b></b>实践考试　
					</td>
				</tr>
				<tr class="normal">
				<td width="80" align="right">检查日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;border-color:#DDDDDD;" id="DCheckdate" name="teaZzJc.DCheckdate" value="${viewDate}" class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td width="80" align="right">检查内容：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VCheckcontent" name="teaZzJc.VCheckcontent" value="${teaZzJc.VCheckcontent}" maxlength="100" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td width="80" align="right">检查教员：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VCheckteacher" name="teaZzJc.VCheckteacher" value="${teaZzJc.VCheckteacher}" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td align="right">下一次&nbsp;&nbsp;<br/>熟练检查日期：</td>
				<td width="180">
				<div style="margin-top:5px;">
					<input style="width:180px;border-color:#DDDDDD;" id="DEffectdate" name="teaZzJc.DEffectdate" value="${aoru}" class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td align="right">航空器型号：</td>
				<td width="180">
				<!--有效期：<div style="margin-top:5px;">
					<input style="width:180px;border-color:#DDDDDD;" id="DEffectdate" name="teaZzJc.DEffectdate" value='<s:date name="teaZzJc.DEffectdate" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>--><div style="margin-top:5px;">
					<input style="width:180px;" id="VFlyform" name="teaZzJc.VFlyform" value="${teaZzJc.VFlyform}" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td align="right">备注：</td>
				<td width="180"><div style="margin-top:5px;">
					<input style="width:180px;" id="VBz" name="teaZzJc.VBz" value="${teaZzJc.VBz}" maxlength="200" class="text ui-widget-content ui-corner-all"/>
				</div>
				
				</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</div></div>



<form id="searchForm" action="searchZzListTeacherAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
</form>

<form id="peopleForm" action="upOrShowZzJcTeacherAction.do" method="post">
<input type="hidden" name="teaZzJc.VId" value="${teaZzJc.VId}" />
<input type="hidden" name="teaZzJc.teacherLicenseupdate.VId" value="${teacherZz.VId}" />
<input type="hidden" name="teaZzJc.TTeaLicense.VId" value="${teacherZz.VId}" />
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" id="IChecktypef" name="teaZzJc.IChecktype" />
<input type="hidden" id="DCheckdatef" name="teaZzJc.DCheckdate" />
<input type="hidden" id="VCheckcontentf" name="teaZzJc.VCheckcontent" />
<input type="hidden" id="VCheckteacherf" name="teaZzJc.VCheckteacher" />
<input type="hidden" id="VBzf" name="teaZzJc.VBz" />
<input type="hidden" id="DEffectdatef" name="teaZzJc.DEffectdate" />
<input type="hidden" id="VFlyformf" name="teaZzJc.VFlyform" />
</form>
</body>
</html>
