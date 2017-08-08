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

	$("#modalDialogButton4").click(function(){//查询
		$("#searchKey").val($("#key").val());
		$( "#searchForm" ).submit();
	});

	
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
	<button class="normal" id="modalDialogButton3">全部</button>
	<div class="buttonInput relative left" width="180" height="28">
     <input id="key" type="text" maxlength="50" value="${key}"/><button id="modalDialogButton4">查询</button>
    </div>
	  <p style="font-size: medium;">当前总访问量：${count}</p>
</div>

<div class="Panel ui-corner-all-0" id="Panel2">
	<div class="panelContent">
		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="120"></th>
                <th width="160"></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray">用户账号</th>
				<th class="thSortableGray">登录时间</th>
				<th class="thSortableGray"><!--退出时间--></th>
			  </tr>
			</thead>
			<tbody>
			<s:iterator value="page.data">
			  <tr>
				<td class="searchRange" title="${TUser.VUsername}">${TUser.VUsername}</td>
				<td class="searchRange">
				   <s:date name="DLoginDate" format="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td class="searchRange">
				   <s:date name="DOffDate" format="yyyy-MM-dd HH:mm:ss" />
				</td>
			  </tr>
			</s:iterator> 
			
            <s:iterator value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td></td>
			  </tr>
              </s:iterator>
			</tbody>
		</table>
<!-- 分页导航 --><s:include value="../common/pagination_system.jsp" /><!-- 分页导航 end -->

	</div>

</div>

</div></div>
<form  action="OnlineCounterPageManage.do" method="post" id="searchForm">
<input type="hidden" id="searchKey" name="key"/>
</form>
</body>
</html>
