<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>平均统计</title>
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
    <script src="<%=request.getContextPath()%>/pages/collection/js/Avg.js" type="text/javascript"></script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>
</head>
<body>
    <jsp:include page="/pages/common/topPart.jsp"></jsp:include>
	<jsp:include page="/pages/common/leftPart.jsp"></jsp:include>
<div id="rightPartA" style="overflow-x:hidden;">
<div> 
<!-- ------------------>
<div class="panelBox buttonBox">
<!-- panelBox计划用于布局横向的简单一行 -->

<div class="dropDownList" id="dropDownList0">
</div>
<div class="dropDownList" id="Div1">
	<button id = "yearStr">${cyear}</button>
	<ul id="classSelect"></ul>
	<input type="hidden" name="${cyear}" value="${cyear}" />
</div>
<div class="buttonInput relative left ml10" style="border-radius:3px;" width="45" height="28">
	<button  id="searchPaylist" style="border:none;">查询</button>
</div>
</div> 
<!-- --------------- -->
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
				<th width="180"></th>
				<th width="180"></th>
			  </tr>
			  <tr>
				<th class="thSortableGray">合同号</th>
				<th class="thSortableGray">人数</th>
				<th class="thSortableGray">标的额(元)</th>
				<th class="thSortableGray">飞行训练报价(人/元)</th>
				<th class="thSortableGray">合作共建(元)</th>
				<th class="thSortableGray">理论培训(元)</th>
				<th class="thSortableGray">训练费余额(元)</th>
			  </tr>
			</thead>
			<form action="<%=request.getContextPath()%>/showAvgStatistics.do" method="post" id="searchForm" >
				<input type="hidden" name="cyear" value="" id="cyear" />
			</form>
			<tbody>
			<s:iterator value="AvgList">
			  <tr>
				<td>${contractId}</td>
				<td>${studentCount}</td>
				<td>${targetAmount}</td>
				<td>${trainPrice}</td>
				<td>${partyPrice}</td>
				<td>${trainTheory}</td>
				<td>${trainBalance}</td>
			  </tr>
			 </s:iterator>
			 <s:iterator value="AverageList"> 
     		  <tr style="color:Red;">
				<td colspan="7">平均训练费余额：${avgTrainB}元</td>
			  </tr>
			  </s:iterator>
			</tbody>
        </table>
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
<%--   <tr>
    <td height="30" align="right" class="link11">
<a href="javascript:firstPage();" class="blue"><span class="STYLE2">首页</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:prePage();" class="blue"><span class="STYLE2">上一页</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:nextPage();" class="blue"><span class="STYLE2">下一页</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript:lastPage();" class="blue"><span class="STYLE2">尾页</span></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button"  value="跳转到" class="aLinkCommonBtn" onClick="jumpPage();">第<input type="text" name="page.currentPageNo" size="2" value="1" id="page.currentPageNo" style="height:24px; width:20px;border:1px solid #BBB;
border-radius:2px" onKeyPress="enterPress(this)"/>页&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    本页显示1-7条 / 共1页7条
	</td>
  </tr> --%>
</table>
    </div>
    </div>
</div>
</div>
</body>
</html>