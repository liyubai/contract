<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>服务器性能监控</title>

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
<script src="scripts/ui/jquery.ui.progressbar.min.js"></script>
<script src="scripts/function.min.js"></script>
<!-- 树形相关开始-->
<link rel="STYLESHEET" type="text/css" href="../codebase/dhtmlxtree.css">
<script src="../codebase/dhtmlxcommon.js"></script>
<script src="../codebase/dhtmlxtree.js"></script>
<script type="text/javascript" src="../codebase/dhtmlxmenu.js"></script>
<link rel="stylesheet" type="text/css" href="../MenuSkins/dhtmlxmenu_dhx_blue.css"/>
<!-- 树形相关结束-->
<script>
A_WIDTH=200; //注意，不要写成var A_WIDTH，这个值已经在function.js中定义好了，只需要重新赋值
$(function() {
    //内存性能处理
	$("#info").progressbar({value: parseInt($("#prid").val())});
	
	//CPU性能处理
	var cpu = document.getElementsByName("cpu");
	if(cpu != null){
		for(var i=0; i<cpu.length; i++){
			var j = i + 1;
			setProgressBar("cpu" + j, parseInt(cpu[i].value));
		}
	}
	
	//网络性能处理
	var wl = document.getElementsByName("wl");
	if(wl != null){
		for(var i=0; i<wl.length; i++){
			var j = i + 1;
			setProgressBar("wl" + j, parseInt(wl[i].value));
		}
	}
});


//设置进度条数值
function setProgressBar(progressbar1,i){
	var num = i;
	var id = "#" + progressbar1;

	$(id).progressbar({value: parseInt(num)});
}
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

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
                <th></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray" colspan="2">应用服务器当前情况</th>
			  </tr>
			</thead>
			<tbody id="searchPage">
			  <tr>
				<td class="searchRange" title="内存利用率：${info}%">内存利用率：${info}%</td>
				<td title="内存利用率：${info}%">
				<div id="info" PB_CLASS_LOW="progressbarGreen" PB_CLASS_MIDDLE="progressbarYellow" PB_CLASS_HIGH="progressbarRed" PB_PERCENT_LOW="50" PB_PERCENT_MIDDLE="80" style="width: 200px;"></div>
				<input type="hidden" id="prid" value="${info}">
				</td>
			  </tr>
				<s:iterator value="cpulv" var="obj" status="i">
				<tr>
				<td class="searchRange" title="CPU使用率：${obj}">CPU使用率：${obj}</td>
				<td title="CPU使用率：${obj}">
				<div id="cpu<s:property value="#i.count"/>" PB_CLASS_LOW="progressbarGreen" PB_CLASS_MIDDLE="progressbarYellow" PB_CLASS_HIGH="progressbarRed" PB_PERCENT_LOW="50" PB_PERCENT_MIDDLE="80" style="width: 200px;"></div>
				<input type="hidden" name="cpu" value="${obj}">
				</td>
				</tr>
              	</s:iterator>
              	<s:iterator value="wllv" var="obj" status="i">
              	<tr>
				<td class="searchRange" title="${obj.name1}${obj.name2}">${obj.name1}${obj.name2}</td>
				<td title="${obj.name1}${obj.name2}">
				<div id="wl<s:property value="#i.count"/>" PB_CLASS_LOW="progressbarGreen" PB_CLASS_MIDDLE="progressbarYellow" PB_CLASS_HIGH="progressbarRed" PB_PERCENT_LOW="50" PB_PERCENT_MIDDLE="80" style="width: 200px;"></div>
				<input type="hidden" name="wl" value="${obj.name2}">
				</td>
				</tr>
              	</s:iterator>
			  
			</tbody>
		</table>


	</div>

</div>

</div>

</div>

</body>
</html>
