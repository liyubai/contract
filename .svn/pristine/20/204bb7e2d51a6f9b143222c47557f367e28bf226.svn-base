<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>九天数据导入</title>

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

	$( "#dialogForm3" ).dialog({//操作数据库返回提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
			buttons: {
			"确 定": function() {
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
     //备份数据库
	$("#modalDialogButton1").click(function(){
        $("#dialogForm3Warning").html("<br>正在导入数据，请耐心等待......");
		$( "#dialogForm3" ).dialog( "open" );
		/*
		var params = {"test":"backup"};

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
				   $("#downloadForm").submit(); 
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
		*/
	});	
});
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

<div id="infoBox" class="panelBox ui-corner-all">

	<div class="panelContent">
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/starcontacts_48.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555;line-height:23px;">数据导入条件：</span><br />
			<span style="font-size: 14px; color: #555555; line-height:23px;">1.九天训练的学生信息在系统内初始化。<br />
			2.学生状态是国内训练。<br>
            3.学生已分配大纲。<br>
			4.学生分配基地。<br>
			5.学生分配大队。<br>
			6.学生分配教员。
			</span>
		</div>
	</div>
</div>
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
<div class="panelBox buttonBox" id="divmodalDialogButton1" style=" margin-top:170px;height: 40px; border: 0; border-top: solid 1px #DBE3E8;border-bottom: solid 1px #DBE3E8;background: #F6F6F6;">
	<div style="margin-left:25px; margin-top:5px;">
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">学生训练记录导入</button>
    </div>
</div>
</s:if>
</div>
</div>

<div id="dialogForm3" title="学生训练记录导入"><br>

请选择上传的文件
<span class="panelLine"></span>
<input type="file" name="upload" id="upload"  class="text ui-widget-content ui-corner-all" style="width:300px;"/>	
</div>
</body>
</html>
