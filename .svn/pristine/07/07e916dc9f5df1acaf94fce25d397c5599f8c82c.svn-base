<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程设置</title>
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

</style>
<script>
$(function() {

	var ids = $("#selIds").val();
	if(ids==""){
		alert("请选择课程。");
		window.location.replace("open_setLesson.do");
		return;
	}
	var ss = ids.split(",");
	var so = "";
	var content="";
	for(i=0;i<ss.length-1;i++){
	//	so+=ss[i].split(";")[0] + ",";
		content+="<tr><td></td><td>"+ss[i].split(";")[1]+"</td>";
		content+="<td><input type=\"text\"  id=\"cname0"+i+"\" class=\"text ui-widget-content ui-corner-all\" style=\"width:60px;\" /></td>";
		content+="<td><input type=\"text\"  id=\"cname1"+i+"\" class=\"text ui-widget-content ui-corner-all\" style=\"width:60px;\" /></td>";
		content+="<td><input type=\"text\"  id=\"cname2"+i+"\" class=\"text ui-widget-content ui-corner-all\" style=\"width:60px;\" /></td>";
		content+="</tr>";
	}
	$("#selectLessonid").html(content);
	$("#escid0").click(function(){
		window.location.href="open_setLesson.do";	
	});
	$("#saveButton").click(function(){
		var cnames= "";
		for(k=0;k<ss.length-1;k++){
			
			cnames+=ss[k].split(";")[0] + ";";
			for(j=0;j<3;j++){
				
				if($("#cname" + j + k).val()=="" || !checkNum($("#cname" + j + k).val())){
					alert("请输入数字格式的数据。");
					return;
				}
				cnames+=$("#cname"+ j + k).val() + ";";
			}
			cnames+=",";
		}
		/*
		for(k=0;k<ss.length-1;k++){
			if($("#cname1" + k).val()==""){
				alert("请输入完成数据。");
				return;
			}
			cnames+=$("#cname1" + k).val() + ",";
		}
		
		for(k=0;k<ss.length-1;k++){
			if($("#cname2" + k).val()==""){
				alert("请输入完成数据。");
				return;
			}
			cnames+=$("#cname2" + k).val() + ",";
		}
		

		if(cnames.replace(/,/g,"")=="" || !checkNum(cnames.replace(/,/g,""))){
			alert("请输入数字类型的数据。");
			return;
		}
		*/
		//$("#abcid").val(cnames);
		//alert(cnames);
		//return;
		$("#lessonid").val(cnames);
		$("#addLessonForm").submit();
	})
	$("#cname00").blur(function(){
		if($("#cname00").val()==""){
			return;	
		}
		for(j=1;j<ss.length-1;j++){
			if($("#cname0"+j).val()!=""){
				continue;
			}
			$("#cname0"+j).val($("#cname00").val());
		}
	});
	$("#cname10").blur(function(){
		if($("#cname10").val()==""){
			return;	
		}
		for(j=1;j<ss.length-1;j++){
			if($("#cname1"+j).val()!=""){
				continue;
			}
			$("#cname1"+j).val($("#cname10").val());
		}
	});
	$("#cname20").blur(function(){
		if($("#cname20").val()==""){
			return;	
		}
		for(j=1;j<ss.length-1;j++){
			if($("#cname2"+j).val()!=""){
				continue;
			}
			$("#cname2"+j).val($("#cname20").val());
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
function checkNum(str){ //数字
	return str.match(/\D/)==null 
}
function getSelRadioValue(name){
	var str="";
	var r1=document.getElementsByName(name);
	for(i=0;i<r1.length;i++){
		if(r1[i].checked==true){
			str=r1[i].value;
		}
	}
	return str;
}
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
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4a9df179014a9e3beb0c0003</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

<div class="Panel ui-corner-all-0" id="Panel2" >

	<div class="panelContent">
        <table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
        	<thead>
             	<tr class="trSpliter">
				<th width="10"></th>
				<th width="130"></th>
                <th width="100"></th>
                 <th width="100"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortableGray" ></th>
                <th class="thSortableGray" >课程名称</th>
                <th class="thSortableGray" >分数线</th>
                <th class="thSortableGray" >补考次数</th>
                <th class="thSortableGray" >两次考试间隔</th>
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

<form  action="saveAddClassLesson.do" method="post" id="addLessonForm">
<input name="pointLine.VId" type="hidden" id="lessonid">
<input name="pointLine.TSetClass.VId" type="hidden" value="${id}">
</form>
<input name="selIds" type="hidden" id="selIds" value="${selIds}">
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