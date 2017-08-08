<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>体检信息</title>
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

</style>
<script>
$(function() {
	

	var ids = $("#selIds").val();
	if(ids==""){
		alert("请选择学生。");
		window.location.replace("open_studentMedical.do");
		return;
	}
	var ss = ids.split(",");
	ss = getArraySort(ss);
	var content="";
	for(i=0;i<ss.length;i++){
		content+="<tr class=\"normal\"><td></td><td>"+ss[i].split(";")[1]+"</td>";
		content+="<td>"+ss[i].split(";")[2]+"</td>";
		content+="<td><div class=\"dropDownList\">";
		content+="<button></button>";
		content+="<ul>";
		if(i==0){
			content+="<li><a href=\"#N\" val=\"0\" onclick=\"changeValue(0)\"><span class=\"ui-icon ui-icon-bullet\"></span>Ⅰ级体检合格证</a></li>";
			content+="<li><a href=\"#N\" val=\"1\" onclick=\"changeValue(1)\">Ⅰ级体检合格证(限91部运行)</a></li>";
			content+="<li><a href=\"#N\" val=\"2\" onclick=\"changeValue(2)\">Ⅱ级体检合格证</a></li>";
		}else{
			content+="<li><a href=\"#N\" val=\"0\"><span class=\"ui-icon ui-icon-bullet\"></span>Ⅰ级体检合格证</a></li>";
			content+="<li><a href=\"#N\" val=\"1\">Ⅰ级体检合格证(限91部运行)</a></li>";
			content+="<li><a href=\"#N\" val=\"2\">Ⅱ级体检合格证</a></li>";
		}
		content+="</ul>";
		content+="<input type=\"hidden\" id=\"cname0"+i+"\" value=\"0\">";
		content+="</div>";
		content+="<td><input type=\"text\" id=\"cname1"+i+"\" class=\"Wdate ui-widget-content ui-corner-all text\" style=\"width:95px;border-color:#DDDDDD; height:16px;\" onFocus=\"WdatePicker({cname1"+i+":'%y-%M-%d',dateFmt:'yyyy-MM-dd'})\" /></td>";
		content+="<td><input type=\"text\" id=\"cname2"+i+"\" class=\"Wdate ui-widget-content ui-corner-all text\" style=\"width:95px;border-color:#DDDDDD; height:16px;\" onFocus=\"WdatePicker({cname2"+i+":'%y-%M-%d',dateFmt:'yyyy-MM-dd'})\" /></td>";
		content+="<td><input type=\"text\" id=\"cname3"+i+"\" class=\"Wdate ui-widget-content ui-corner-all text\" style=\"width:95px;border-color:#DDDDDD; height:16px;\" onFocus=\"WdatePicker({cname3"+i+":'%y-%M-%d',dateFmt:'yyyy-MM-dd'})\" /></td>";
		content+="<td><input type=\"text\"  id=\"cname4"+i+"\" class=\"text ui-widget-content ui-corner-all\" style=\"width:60px;\" /></td>";
		content+="<td><input type=\"text\"  id=\"cname5"+i+"\" class=\"text ui-widget-content ui-corner-all\" style=\"width:60px;\" /></td>";
		content+="</tr>";
	}
	$("#selectLessonid").html(content);
	$("div.dropDownList").each(function(i){
		var d=new $.dropDownList(i,true,196);
	});
	$("#escid0").click(function(){
		window.location.href="open_studentMedical.do";	
	});
	$("#saveButton").click(function(){
		var cnames= "";
		for(k=0;k<ss.length;k++){
			cnames+=ss[k].split(";")[0] +  ";";
			for(j=0;j<6;j++){
			
				if($.trim($("#cname"+j + k).val())==""){
					alert("请输入完成数据。");
					return;
				}
				cnames+=$("#cname"+j + k).val() + ";";
			}
			cnames+=",";
		}
		
		$("#classid").val(cnames);
		//$("#abcid").val(cnames);
		$("#addForm").submit();
	})
	
	$("#cname10").blur(function(){
		if($("#cname10").val()==""){
			return;	
		}
		for(j=1;j<ss.length;j++){
			if($("#cname1"+j).val()!=""){
				continue;
			}
			$("#cname1"+j).val($("#cname10").val());
		}
	});
	$("#cname11").blur(function(){
		if($("#cname11").val()==""){
			return;	
		}
		for(j=1;j<ss.length;j++){
			if($("#cname11"+j).val()!=""){
				continue;
			}
			$("#cname11"+j).val($("#cname11").val());
		}
	});
	$("#cname20").blur(function(){
		if($("#cname20").val()==""){
			return;	
		}
		for(j=1;j<ss.length;j++){
			if($("#cname2"+j).val()!=""){
				continue;
			}
			$("#cname2"+j).val($("#cname20").val());
		}
	});
	$("#cname30").blur(function(){
		if($("#cname30").val()==""){
			return;	
		}
		for(j=1;j<ss.length;j++){
			if($("#cname3"+j).val()!=""){
				continue;
			}
			$("#cname3"+j).val($("#cname30").val());
		}
	});
	$("#cname40").blur(function(){
		if($("#cname40").val()==""){
			return;	
		}
		for(j=1;j<ss.length;j++){
			if($("#cname4"+j).val()!=""){
				continue;
			}
			$("#cname4"+j).val($("#cname40").val());
		}
	});
	$("#cname50").blur(function(){
		if($("#cname50").val()==""){
			return;	
		}
		for(j=1;j<ss.length;j++){
			if($("#cname5"+j).val()!=""){
				continue;
			}
			$("#cname5"+j).val($("#cname50").val());
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
	
});

function changeValue(type){
	var ids = $("#selIds").val();
	var ss = ids.split(",");
	if(type==0){
		return;	
	}
	for(j=1;j<ss.length;j++){
		if($("#cname0"+j).val()!=0){
			continue;
		}
		$("#cname0"+j).val(type);
		$("#cname0"+j).change();
	}
}
	
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149d9a760002</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

<div class="Panel ui-corner-all-0" id="Panel2" >

	<div class="panelContent">
        <table class="panelTable" border="0" cellspacing="0" cellpadding="2">
        	<thead>
             	<tr class="trSpliter">
				<th width="10"></th>
				<th width="80"></th>
                <th width="70"></th>
                <th width="210"></th>
                <th width="110"></th>
                <th width="110"></th>
                <th width="110"></th>
                <th width="110"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortableGray" ></th>
                <th class="thSortableGray" >学号</th>
                <th class="thSortableGray" >姓名</th>
                <th class="thSortableGray" >体检合格合格证等级</th>
                <th class="thSortableGray" >结论日期</th>
                <th class="thSortableGray" >发证日期</th>
                <th class="thSortableGray" >到期日期</th>
                <th class="thSortableGray" >主检医师</th>
                <th class="thSortableGray" >签发人</th>
			  </tr>   
			</thead>
			<tbody id="selectLessonid">
			</tbody>
		</table>
<div class="panelBox buttonBox" >
<button class="green"  id="saveButton">保存</button>
<button class="normal" id="escid0">返回</button>
</div><br>
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

<form  action="saveAddSutdentMedical.do" method="post" id="addForm">
<input name="selIds" type="hidden" id="selIds" value="${ids}">
<input name="id" type="hidden" id="classid">
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