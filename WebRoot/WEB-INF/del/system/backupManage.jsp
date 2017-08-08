<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>数据库备份管理</title>

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
/*功能9*/
fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
/*功能9*/

</style>

<script>

$(function() {

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
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});
     //备份数据库
	$("#modalDialogButton1").click(function(){
        $("#dialogForm3Warning").html("<b>正在备份系统数据库，请耐心等待......</b>");
		$( "#dialogForm3" ).dialog( "open" );
		var params = {"test":"backup"};
		var backName = $("#backName").val();
		$.ajax({
			
			type:"post",
			url:"backupDatabase.do",
			data:params,
			dataType:"json",
			success:function(data){

				if(data != null){
				   //alert(data);
				   //下载备份成功的数据库
				   
                   $("#attachmentName").val(data);
				   
				   $("#downloadFileType").val("data");
				   //$("#downloadForm").submit(); 
				   $( "#dialogForm3" ).dialog( "close" );
				}else{
				   $("#dialogForm3Warning").html("<b>备份系统数据库失败，请重试！</b>");
				}
				
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库备份失败，请重试！");

				return;
			}
		});	
	});	
});
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c014714a1e0b9000a</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>
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
<s:if test="#r==null || #r==0">
<div class="panelBox buttonBox" style=" margin-top:100px;height: 40px; border: 0; border-top: solid 1px #DBE3E8;border-bottom: solid 1px #DBE3E8;background: #F6F6F6;">
	<div style="margin-left:10px; margin-top:5px;">当前服务器时间：${ViewDate}
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">备份数据库</button>
    </div>
</div></s:if>

</div></div>

<div id="dialogForm3">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span>
		</div>
	</fieldset>	
</div>


<form  action="downloadAttachment.do" method="post" id="downloadForm">
  <input name="attachmentName" type="hidden" id="attachmentName">
  <input name="downloadFileType" type="hidden" id="downloadFileType">
</form>

<input type="hidden" id="backName" value="${backName}">
</body>
</html>
