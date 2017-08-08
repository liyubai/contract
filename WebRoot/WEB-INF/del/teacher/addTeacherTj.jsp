<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员体检信息</title>

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

	//功能5
	$("div.dropDownList").find("button").each(function(i){
		new $.dropDownList(i,true,200);
	})
	//功能5
	
	//保存\
	/*
	$("#modalDialogButton1").click(function(){
		var tjid = $("#tjId").val();
		var errors = "";
		var xz = $("#VLimit").val();
		var gj = $("#VNation").val();
		if(xz.length>100){
			errors += "【限制】长度不能超过100！\r";
		}
		if(gj==null || $.trim(gj)==""){
			errors += "【国籍】为必填项，不能为空！\r";
		}
		var jlrq = $("#DResultdate").val();
		if(jlrq==null || $.trim(jlrq)==""){
			errors += "【结论日期】为必填项，不能为空！\r";
		}
		var zjys = $("#VDoctor").val();
		if(zjys==null || $.trim(zjys)==""){
			errors += "【主检医生】为必填项，不能为空！\r";
		}
		var qfr = $("#VIssuer").val();
		if(qfr==null || $.trim(qfr)==""){
			errors += "【签发人】为必填项，不能为空！\r";
		}
		var fzrq = $("#DIssueTime").val();
		if(fzrq==null || $.trim(fzrq)==""){
			errors += "【发证日期】为必填项，不能为空！\r";
		}
		var yxrq = $("#DUsedTime").val();
		if(yxrq==null || $.trim(yxrq)==""){
			errors += "【有效日期】为必填项，不能为空！\r";
		}
		var qfdw = $("#VCompany").val();
		if(qfdw==null || $.trim(qfdw)==""){
			errors += "【签发单位】为必填项，不能为空！\r";
		}
		
		if(jlrq>fzrq){
			errors += "【结论日期】不能晚于【发证日期】！\r";
		}
		if(jlrq>yxrq){
			errors += "【结论日期】不能晚于【有效日期】！\r";
		}
		if(fzrq>yxrq){
			errors += "【发证日期】不能晚于【有效日期】！\r";
		}
		var ILevel = $("#ILevel").val();
		if(ILevel==null || ILevel==""){
			ILevel = "1";
		}
		if(errors==""){
			if(tjid != null && tjid != "" && tjid != "null"){
				if(confirm("该教员已经存在体检信息，确认保存体检信息？\r如果保存则原体检信息将转存为历史记录！")){
					$("#ILevelf").val($("#ILevel").val());
					$("#VNationf").val($("#VNation").val());
					$("#VLimitf").val($("#VLimit").val());
					$("#DResultdatef").val($("#DResultdate").val());
					$("#VDoctorf").val($("#VDoctor").val());
					$("#VIssuerf").val($("#VIssuer").val());
					$("#DIssueTimef").val($("#DIssueTime").val());
					$("#DUsedTimef").val($("#DUsedTime").val());
					$("#VCompanyf").val($("#VCompany").val());
					
					$("#peopleForm").submit();
				}
			}else{
				$("#ILevelf").val($("#ILevel").val());
				$("#VNationf").val($("#VNation").val());
				$("#VLimitf").val($("#VLimit").val());
				$("#DResultdatef").val($("#DResultdate").val());
				$("#VDoctorf").val($("#VDoctor").val());
				$("#VIssuerf").val($("#VIssuer").val());
				$("#DIssueTimef").val($("#DIssueTime").val());
				$("#DUsedTimef").val($("#DUsedTime").val());
				$("#VCompanyf").val($("#VCompany").val());
				
				$("#peopleForm").submit();
			}
		}else{
			alert(errors);
			return;
		}
	});
	*/

	if($("#tjId").val() == null || $("#tjId").val() == ""){
		$("#VNation").val("中国");
		$("#VCompany").val("中国民用航空局");
	}
	 //取消，返回列表页
	$("#modalDialogButton2").click(function(){
	    $("#searchForm").submit();
	});
	//保存
	$("#modalDialogButton3").click(function(){
		var tjid = $("#tjId").val();
		var errors = "";
		var xz = $("#VLimit").val();
		var gj = $("#VNation").val();
		if(xz.length>100){
			errors += "【限制】长度不能超过100！\r";
		}
		if(gj==null || $.trim(gj)==""){
			errors += "【国籍】为必填项，不能为空！\r";
		}
		var jlrq = $("#DResultdate").val();
		if(jlrq==null || $.trim(jlrq)==""){
			errors += "【结论日期】为必填项，不能为空！\r";
		}
		var zjys = $("#VDoctor").val();
		if(zjys==null || $.trim(zjys)==""){
			errors += "【主检医生】为必填项，不能为空！\r";
		}
		var qfr = $("#VIssuer").val();
		if(qfr==null || $.trim(qfr)==""){
			errors += "【签发人】为必填项，不能为空！\r";
		}
		var fzrq = $("#DIssueTime").val();
		if(fzrq==null || $.trim(fzrq)==""){
			errors += "【发证日期】为必填项，不能为空！\r";
		}
		var yxrq = $("#DUsedTime").val();
		if(yxrq==null || $.trim(yxrq)==""){
			errors += "【有效日期】为必填项，不能为空！\r";
		}
		var qfdw = $("#VCompany").val();
		if(qfdw==null || $.trim(qfdw)==""){
			errors += "【签发单位】为必填项，不能为空！\r";
		}
		
		if(jlrq>fzrq){
			errors += "【结论日期】不能晚于【发证日期】！\r";
		}
		if(jlrq>yxrq){
			errors += "【结论日期】不能晚于【有效日期】！\r";
		}
		if(fzrq>yxrq){
			errors += "【发证日期】不能晚于【有效日期】！\r";
		}
		var ILevel = $("#ILevel").val();
		if(ILevel==null || ILevel==""){
			ILevel = "1";
		}
		if(errors==""){
			//if(tjid != null && tjid != "" && tjid != "null"){
				
				/*if(confirm("该教员已经存在体检信息，确认保存体检信息？\r如果保存则原体检信息将转存为历史记录！")){
					$("#ILevelf").val($("#ILevel").val());
					$("#VNationf").val($("#VNation").val());
					$("#VLimitf").val($("#VLimit").val());
					$("#DResultdatef").val($("#DResultdate").val());
					$("#VDoctorf").val($("#VDoctor").val());
					$("#VIssuerf").val($("#VIssuer").val());
					$("#DIssueTimef").val($("#DIssueTime").val());
					$("#DUsedTimef").val($("#DUsedTime").val());
					$("#VCompanyf").val($("#VCompany").val());
					
					$("#peopleForm").submit();
				}
			}else{
				*/
				$("#ILevelf").val($("#ILevel").val());
				$("#VNationf").val($("#VNation").val());
				$("#VLimitf").val($("#VLimit").val());
				$("#DResultdatef").val($("#DResultdate").val());
				$("#VDoctorf").val($("#VDoctor").val());
				$("#VIssuerf").val($("#VIssuer").val());
				$("#DIssueTimef").val($("#DIssueTime").val());
				$("#DUsedTimef").val($("#DUsedTime").val());
				$("#VCompanyf").val($("#VCompany").val());
				
				$("#peopleForm").submit();
		//	}
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
<s:if test="showPeople==''">
<button id="modalDialogButton3" class="green" primary="ui-icon-button-confirm">保存</button>
</s:if>
<button id="modalDialogButton4" class="normal"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>
</div>

<input type="hidden" name="statusMsg" />

<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
			<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
			<tbody>
				<tr class="normal">
				<td width="87" align="right">合格证等级：</td>
				<td width="258">
				<div class="dropDownList">
					<button>Ⅰ级体检合格证</button>
					<ul>
						<li><a href="#N" val="0"><span class="ui-icon ui-icon-bullet"></span>Ⅰ级体检合格证</a></li>
						<li><a href="#N" val="1">Ⅰ级体检合格证(限91部运行)</a></li>
                        <li><a href="#N" val="2">Ⅱ级体检合格证</a></li>
					</ul>
					<input type="hidden" id="ILevel" name="teachertj.ILevel" value='<s:if test="teachertj.ILevel != null && teachertj.ILevel != ''">${teachertj.ILevel}</s:if><s:else>0</s:else>' />
				</div>
				</td>
				<td width="87" align="right">国籍：</td>
				<td width="221">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VNation" name="teachertj.VNation" value="${teachertj.VNation}" maxlength="50" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td width="83" align="right">限制：</td>
				<td width="206">
				<div style="margin-top:5px;">
					<textarea  id="VLimit"  style="width:190px;height:50px;" class="text ui-widget-content ui-corner-all">${teachertj.VLimit}</textarea>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="87" align="right">结论日期：</td>
				<td width="258">
				<div style="margin-top:5px;">
					<input style="width:180px;border-color:#DDDDDD;" id="DResultdate" name="teachertj.DResultdate" value='<s:date name="teachertj.DResultdate" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td width="87" align="right">主检医生：</td>
				<td width="221">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VDoctor" name="teachertj.VDoctor" value="${teachertj.VDoctor}" maxlength="20" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				<td width="83" align="right">签发人：</td>
				<td width="206">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VIssuer" name="teachertj.VIssuer" value="${teachertj.VIssuer}" maxlength="20" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				</tr>
				<tr class="normal">
				<td width="87" align="right">发证日期：</td>
				<td width="258">
				<div style="margin-top:5px;">
					<input style="width:180px;border-color:#DDDDDD;" id="DIssueTime" name="teachertj.DIssueTime" value='<s:date name="teachertj.DIssueTime" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td width="87" align="right">有效期：</td>
				<td width="221">
				<div style="margin-top:5px;">
					<input style="width:180px;border-color:#DDDDDD;" id="DUsedTime" name="teachertj.DUsedTime" value='<s:date name="teachertj.DUsedTime" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
				</div>
				</td>
				<td width="83" align="right">发证单位：</td>
				<td width="206">
				<div style="margin-top:5px;">
					<input style="width:180px;" id="VCompany" name="teachertj.VCompany" value="${teachertj.VCompany}" maxlength="200" class="text ui-widget-content ui-corner-all"/>
				</div>
				</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</div></div>



<form id="searchForm" action="searchTjListTeacherAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
</form>

<form id="peopleForm" action="addOrUpTjTeacherAction.do" method="post">
<input type="hidden" name="teachertj.teacherBaseInfo.VId" value="${id}" />
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" id="ILevelf" name="teachertj.ILevel" />
<input type="hidden" id="VNationf" name="teachertj.VNation" />
<input type="hidden" id="VLimitf" name="teachertj.VLimit"/>
<input type="hidden" id="DResultdatef" name="teachertj.DResultdate" />
<input type="hidden" id="VDoctorf" name="teachertj.VDoctor" />
<input type="hidden" id="VIssuerf" name="teachertj.VIssuer" />
<input type="hidden" id="DIssueTimef" name="teachertj.DIssueTime" />
<input type="hidden" id="DUsedTimef" name="teachertj.DUsedTime" />
<input type="hidden" id="VCompanyf" name="teachertj.VCompany" />
</form>
<input type="hidden" id="tjId" value="${tjId}" />
</body>
</html>
