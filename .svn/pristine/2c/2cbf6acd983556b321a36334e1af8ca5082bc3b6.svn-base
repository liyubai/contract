<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统在线人数管理</title>

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

<script>
//用于存储选中的复选框的value值
var values = "";
$(function() {

	//功能5
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		new $.dropDownList(i,true,100);
	})

	
	$("#modalDialogButton3").click(function(){//刷新
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});

});

	//编辑角色
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
<div class="panelBox buttonBox">
	<button class="normal" id="modalDialogButton3">刷新</button>
	  <p style="font-size: medium;">当前在线人数：${count}</p>
</div>

<div class="Panel ui-corner-all-0" id="Panel2">
	<div class="panelContent">
		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="120"></th>
                <th width="120"></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray">用户账号号</th>
				<th class="thSortableGray">登录IP</th>
				<th class="thSortableGray">登录时间</th>
			  </tr>
			</thead>
			<tbody>
			<s:iterator value="list">
			  <tr>
				<td class="searchRange" title="${loginId}">${loginId}</td>
				<td class="searchRange" title="${loginIP}">${loginIP}</td>
				<td class="searchRange">
				   <s:date name="loginTime" format="yyyy-MM-dd HH:mm:ss" />
				</td>
			  </tr>
			</s:iterator> 
			</tbody>
		</table>


	</div>

</div>

</div></div>
<form  action="OnlineCounterManage.do" method="post" id="searchForm">
</form>
</body>
</html>
