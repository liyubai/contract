<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>汇总统计年</title>
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css" rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.position.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.core.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.widget.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.button.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.tabs.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.dialog.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.menu.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/function.min.js"></script>
    <script>
    $(function() {
        new $.dropDownList(0, true, 100);
    });
</script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>
</head>
<body>
    <jsp:include page="/pages/common/topPart.jsp"></jsp:include>
	<jsp:include page="/pages/common/leftPart.jsp"></jsp:include>
<div id="rightPartA" style="overflow-x:hidden;">
<div> 
<div class="panelBox buttonBox">
<!-- panelBox计划用于布局横向的简单一行 -->
<div class="dropDownList" id="dropDownList0">
	<button>年统计</button>
	<ul>
	    <li><a href="<%=request.getContextPath()%>/sumStatistic.do" val="1"><span class="ui-icon ui-icon-bullet"></span>年统计</a></li>
		<li><a href="<%=request.getContextPath()%>/sumStatisticMonth.do" val="2">月统计</a></li>
	</ul>
	<input type="hidden" name="年" value="1" />
</div>
</div>
    <div class="Panel ui-corner-all-0">
    <div class="panelContent clear">
        <table class="panelTable" border="0" cellspacing="0" cellpadding="3">
            <thead>
	          <tr class="trSpliter">
				<th width="180"></th>
				<th width="180"></th>
				<th width="180"></th>
				<th width="180"></th>
				<th width="180"></th>
			  </tr>
			  <tr>
				<th class="thSortableGray">年</th>
				<th class="thSortableGray">预计收款金额(元)</th>
				<th class="thSortableGray">通知收款金额(元)</th>
				<th class="thSortableGray">实际到款金额(元)</th>
				<th class="thSortableGray">总未到账(元)</th>
			  </tr>
			</thead>
			<tbody>
			<s:iterator value="list">
			  <tr>
				<td>${Year}</td>
				<td>${YPReceiveMoney}</td>
				<td>${TPReceiveMoney}</td>
				<td>${trueMoney}</td>
				<td>${unpaid}</td>
			  </tr>
			 </s:iterator> 
		    <s:iterator value="extend">
			  <tr>
				<td colspan="5" style="color:Red;">
				<span class="ml20">预计收款金额：</span><span>${sumYPReceiveMoney}元</span>
				<span class="ml20">通知收款金额：</span><span>${sumTPReceiveMoney}元</span>
				<span class="ml20">实际金额合计：</span><span>${sumTrueMoney}元</span>
				<span class="ml20">总未到帐合计：</span><span>${sumUnpaid}元</span> 
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