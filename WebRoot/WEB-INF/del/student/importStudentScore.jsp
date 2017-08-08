<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>导入学生成绩</title>
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

	$("div.dropDownList").find("button").css("width","112px").end().each(function(i){
	
		if(i==0){var d=new $.dropDownList(i,true,240);}
		else if(i==1){var d=new $.dropDownList(i,true,460);}
		else{new $.dropDownList(i,true,112);}

	})
	$("#escid0").click(function(){
		window.location.replace("open_studentBaseInfoList.do");
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
});
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

<div id="topPartD"><div class="panelBox buttonBox" style="padding-top:10px; font-weight:bold; font-size:13px; color:#069">
说明：(1)文件格式：Excel2003，即文件扩展名为：xls (2)学生必须已在系统中注册，学生必须已分配执照班。
</div></div>

<div id="rightPartD"><div>
<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
    
		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
		
			<tbody>
               <tr class="normal">
				<td width="60">选择文件：</td>
                <form id="tFileForm" method="post" action="uploadStudentScoreExcel.do" enctype="multipart/form-data">
                 <input type="hidden" name="student.VId" value="0"/>
                 <input type="hidden" name="student.stuTypeName"  id="typeid"/>
				<td><input type="file" name="upload" id="upload"  class="text ui-widget-content ui-corner-all" style="width:324px;"/>
                </td>
                </form>
			  </tr>
                <tr class="normal">
                  <td align="left">成绩类型：</td>
                  <td><input name="importName" type="radio" value="1"/><b></b>校考&nbsp;&nbsp;&nbsp;&nbsp;
<input name="importName" type="radio" value="2"/><b></b>局考&nbsp;&nbsp;&nbsp;&nbsp;
<input name="importName" type="radio" value="0"/><b></b>雅思</td>
                </tr>
                <tr class="normal">
                  <td align="left"><button class="green" primary="ui-icon-button-confirm" onClick="upload()" id="importid" >导入</button></td>

                  <td style="padding-top:6px;"><img id="importing"></td>

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
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>

function upload(){
	if($("#upload").val()==""){
		alert("请选择Excel文件。");
		return;
	}
	var u=$("#upload").val();

	var doit = u.lastIndexOf(".");
	var g = u.substring(doit,u.length).toLowerCase();
	if(g!=".xls"){
		alert("Excel文件格式2003或之前版本。");
		return;
	}
	var t = getSelRadioValue('importName');
	$("#typeid").val(t);
	if(t==""){
		alert("请选择成绩类型。");
		return;
	}
	$("#tFileForm").submit();
	$("#importing").attr("src","themes/cupertino/images/loading.gif");
	$("#importid").attr('disabled',"true");
}
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm3Warning").html(operateResult);
		$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>