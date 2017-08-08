<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新建文件</title>

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

	//功能9
	var name = $( "#vname" ),
		desc = $( "#vdescription" ),
		allFields = $( [] ).add( name ).add( desc ),
		tips = $( ".validateTips" );

	function updateTips( t ) {
		tips.html( t ).addClass( "ui-state-highlight" );
		setTimeout(function() {
			tips.removeClass( "ui-state-highlight", 1500 );
		},0 );
	}

	function checkLength( con, min, max ) {
		if ( con.length > max || con.length < min ) {
			//o.addClass( "error" ).focus();
			//updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n + "的长度必须在" + min + "和" + max + "之间" );
			return false;
		} else {
			return true;
		}
	}

	function checkRegexp( o, regexp, n ) {
		if ( !( regexp.test( o.val() ) ) ) {
			o.addClass( "error" ).focus();
			updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n );
			return false;
		} else {
			return true;
		}
	}



     //保存文件
	$("#modalDialogButton1").click(function(){
	    
	      //alert($("#vname").val() + "," + $("#vdescription").val());

		  var title = $("#vname").val();
		  var desc = $("#vdescription").val();

		  var fileInfo = $("#upload").val();
		  //alert(fileInfo)
          var errors = "";

	      if(!checkLength(title,3, 100)){
		     errors = errors +"【提示信息】 文件标题不能为空。\r\n";
		  }
		  /*
		  if(desc==""){
			  alert("文件简介不能为空");
		  }
		  
	      if(!checkLength(desc,3, 100)){
		     errors = errors + "【提示信息】 文件简介不能为空，且字符长度必须在3至100之间！\r\n";
		  }
		  */
	      if(fileInfo == null || fileInfo == ""){
		     errors = errors + "【提示信息】 附件文档不能为空。";
		  }
		  if(errors == "") {
 
			$("#tFileForm").submit();

		 }else{
		 
		    alert(errors);
		 }

		 
	});

     //取消，返回文件列表页
	$("#modalDialogButton2").click(function(){
	    $("#searchForm").submit();
		
	});
	
});

function giveV(){
	
	var u=$("#upload").val();
	if(u==""){
		return;
	}
	var doit = u.indexOf(".");
	var s = u.lastIndexOf("\\");
	var g = u.substring(s+1,doit);
	$("#vname").val(g);
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">f1866a954d3feec7014d41ef5af83a2d</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div>
</div>

<div id="topPartD"><div class="panelBox buttonBox">
<button class="green" primary="ui-icon-button-confirm" id="modalDialogButton1">保存</button>
<button class="normal" id="modalDialogButton2"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div></div>

<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
    
		<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
			<thead>
			  <tr class="trSpliter">
				<th width="85"></th>
				<th></th>
			  </tr>
			</thead>
			<tbody>
             <form id="tFileForm" method="post" action="createTFile.do" enctype="multipart/form-data">
             
			  <tr class="normal">
				<td align="right">上传附件：</td>
				<td style="height:40px;">
				<input type="file" name="upload" id="upload" onChange="giveV()" class="text ui-widget-content ui-corner-all" style="width:593px;"/>
				</td>
			  </tr>
			  <tr class="normal">
				<td align="right" >文件标题：</td>
				<td style=" padding-top:8px;"><input type="text" name="fileInfo.VTitle" id="vname" style="width:593px;" class="text ui-widget-content ui-corner-all" /></td>
			  </tr>

			  <tr class="normal">
				<td align="right">文件简介：</td>
				<td><textarea name="fileInfo.VIntroduction" id="vdescription" style="width:600px;height:300px;" class="text ui-widget-content ui-corner-all"></textarea></td>
			  </tr>
             
		
		  
               </form> 
			</tbody>
		</table>
	</div>
</div>

<form id="searchForm" action="searchTFiles.do" method="post"></form>
<%@ include file="../../result.jsp"%>

<script>
//用于显示添加、修改、删除等的提示信息
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult !=null && operateResult!="" ){
		alert(operateResult);
	}
});
</script>
</body>
</html>
