<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传文件</title>

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

<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<table  border="0" cellpadding="0" cellspacing="0" >

<tr><form id="tFileForm" method="post" action="uploadStudentImg.do" enctype="multipart/form-data">
<td>
<input type="file" name="upload" id="upload"  class="text ui-widget-content ui-corner-all" style="width:300px;"/>
</td></form>
<td  valign="top" style="padding-top:2px; padding-left:4px;"><button class="green" primary="ui-icon-button-confirm" onClick="upload()" >上传</button></td>
</tr>
</table>
<%@ include file="../../result.jsp"%>
<script>
var operateResult=$("#statusMsgId").val();

$(function(){
	if(operateResult!=null && operateResult!=""){
		//$("#dialogForm3Warning").html(operateResult);
		//$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
		parent.reloadData(operateResult);
	}
	
});

function upload(){
	if($("#upload").val()==""){
					alert("请选择照片。");
					return;
				}
				var u=$("#upload").val();

				var doit = u.lastIndexOf(".");
				var g = u.substring(doit,u.length).toLowerCase();
				if(g!=".jpg" && g!=".gif"){
					alert("照片格式错误。");
					return;
				}
				$("#tFileForm").submit();
}

</script>
</body>
</html>