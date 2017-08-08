<%@page language="java" pageEncoding="UTF-8"  contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>付款统计</title>
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/date.css" rel="stylesheet" type="text/css" />
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
    <script src="<%=request.getContextPath()%>/contract/scripts/datepicker4.8/WdatePicker.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/pages/payStatistics/js/cPayStatistics.js" type="text/javascript"></script>
    <script>
      /*   $(function() {
            new $.dropDownList(0, true, 160);
            new $.dropDownList(1, true, 200);
            new $.dropDownList(2, true, 100);
            new $.dropDownList(3, true, 150);
            new $.dropDownList(4, true, 150);
            new $.dropDownList(5, true, 150);
        }); */
</script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>
</head>
<body>
<jsp:include page="/pages/common/topPart.jsp"/>
<jsp:include page="/pages/common/leftPart.jsp"/>
<div id="rightPartA" style="overflow-x:hidden;">
<div>   
    <div class="panelBox buttonBox">
<!-- panelBox计划用于布局横向的简单一行 -->
<!-- 年份 -->
<div class="dropDownList barLeft" id="div1">
	<button id = "yearStr">${rtime}</button>
	<ul id="yearSelect">
	</ul>
	<input type="hidden" name="" value="${rtime}" />
</div>
<!-- 合同类型 -->
<div class="dropDownList barMiddle" id="Div2">
	<button >${contractType}</button>
	<ul id="contractType">
	</ul>
	<input type="hidden" name="" value="${contractType}" />
</div>
<!-- 合同状态 -->
<div class="dropDownList barMiddle" id="Div2">
	<button>合同状态</button>
	<ul>
	    <li><a href="javascript:getContractStatus('0')" val="0"><span class="ui-icon ui-icon-bullet"></span>合同状态</a></li>
	   <!--  <li><a href="javascript:getContractStatus('1')" val="1">意向</a></li> -->
		<li><a href="javascript:getContractStatus('2')" val="2">初稿</a></li>
		<li><a href="javascript:getContractStatus('3')" val="3">定稿</a></li>
		<li><a href="javascript:getContractStatus('4')" val="4">生效</a></li>
		<li><a href="javascript:getContractStatus('5')" val="5">完成</a></li>
	</ul>
	<input type="hidden" name="合同状态" value="${rcontractStatus}" />
</div>
<!-- 签约单位 -->
<div class="dropDownList barMiddle" id="Div3">
	<button >${compyName}</button>
	<ul id="compys">
	</ul>
	<input type="hidden" name="" value="${rcompany}" />
</div>
<div class="dropDownList barRight" id="Div4">
	<button>付款状态</button>
	<ul>
	    <li><a href="javascript:getPayStatus('0')" val="0"><span class="ui-icon ui-icon-bullet"></span>付款状态</a></li>
		<li><a href="javascript:getPayStatus('2')" val="2">已通知未到账</a></li>
		<li><a href="javascript:getPayStatus('3')" val="3">已通知已到账</a></li>
		<!-- <li><a href="javascript:getPayStatus('1')" val="1">未达收款条件</a></li> -->
	</ul>
	<input type="hidden" name="付款状态" value="${rpayStatus }" />
</div>
	<input type="text" class="queryInput date" placeholder="开始时间" value="${rbeginTime}" onmouseup="WdatePicker()" name="beginTime" id="beginTime"/>
	<span class="left">-</span>
	<input type="text" class="queryInput date" placeholder="结束时间" value="${rendTime}" onmouseup="WdatePicker()" name="endTime" id="endTime"/>
    <div class="buttonInput relative left ml10" width="180" height="28">
	<input title="合同号" id="contractId" placeholder="合同号" type="text" maxlength="50" value="${rcontractId}" />
	<button id="queryPayStatistics">查询</button>
</div>
	<!-- 查询 提交的Form表单 -->
	<form action="<%=request.getContextPath()%>/payStatistics/showPayStatisticsList.do" name="payStatisticsForm" id="payStatisticsForm" method="post">
	    <input type="hidden" name="rtime" id="rtime" >
	    <input type="hidden" name="rcontractId" id="rcontractId" >
	    <input type="hidden" name="rcontractType" id="rcontractType" value="0" >
	    <input type="hidden" name="rcontractStatus" id="rcontractStatus"  value="0">
	    <input type="hidden" name="rcompany" id="rcompany" value="0">
	    <input type="hidden" name="rpayStatus" id="rpayStatus" value="0" >
	    <input type="hidden" name="rbeginTime" id="rbeginTime" >
	    <input type="hidden" name="rendTime" id="rendTime" >
	</form>	
</div>
    <div class="Panel ui-corner-all-0">
    <div class="panelContent clear">
        <table class="panelTable" border="0" cellspacing="0" cellpadding="3">
            <thead>
	          <tr class="trSpliter">
				<th width="80"></th>
				<th width="180"></th>
				<th width="180"></th>
				<th width="180"></th>
				<th width="220"></th>
				<th width="170"></th>
				<th width="170"></th>
				<th width="170"></th>
				<th width="170"></th>
			  </tr>
			  <tr>
				<th class="thSortableGray">年</th>
				<th class="thSortableGray">合同编号</th>
				<th class="thSortableGray">客户单位</th>
				<th class="thSortableGray">合同类型</th>
				<th class="thSortableGray">状态</th>
				<th class="thSortableGray">标的额(元)</th>
				<th class="thSortableGray">预计收款(元)</th>
				<th class="thSortableGray">通知收款(元)</th>
				<th class="thSortableGray">实际收款(元)</th>
			  </tr>
			</thead>
				<tbody>
					<!-- 对 查询结果迭代循环 -->
					<s:iterator value="paySList">
						<tr>
							<!--年份  -->
							<td>${year}</td>
							<!-- 合同编号 -->
							<td>${contractId}</td>
							<!-- 客户单位 -->
							<td>${company}</td>
							<!-- 合同类型 -->
							<td>${contractType}</td>
							<!-- 状态 -->
							<%-- <td>${cstatus}</td> --%>
							<%-- <c:if test="${cstatus=='1'}"><td>意向 </td></c:if> --%>
							<c:if test="${cstatus=='2'}"><td>初稿 </td></c:if>
							<c:if test="${cstatus=='3'}"><td>定稿 </td></c:if>
							<c:if test="${cstatus=='4'}"><td>生效 </td></c:if>
							<c:if test="${cstatus=='5'}"><td>完成 </td></c:if>
							<!-- 标的额 -->
							<td>${quantities}</td>
							<!-- 预计收款 -->
							<td>${expectedPayment}</td>
							<!-- 通知收款 -->
							<td>${noticePayment}</td>
							<!-- 实际收款 -->
							<td>${trueMoney}</td>
						</tr>
					</s:iterator>
					<s:iterator value="payList">
					   <tr style="color:Red;">
				            <td colspan="2">标的额合计：<span>${sumQuan}元</span></td>
				            <td colspan="2">预计收款金额合计：<span>${sumEPay}元</span></td>
				            <td colspan="2">通知收款金额合计：<span>${sumNpay}元</span></td>
				            <td colspan="2">实际应收款金额合计：<span>${sumTMoney}元</span></td>
			           </tr>
			        </s:iterator>
				</tbody>
			</table>
   ${pageStr}
    </div>
    </div>
</div>
</div>
	<input type="hidden" name="rcontractTypeStr" id="rcontractTypeStr" value="${rcontractType}">
    <input type="hidden" name="rcontractStatusStr" id="rcontractStatusStr" value="${rcontractStatus}">
   	<input type="hidden" name="rcompanyStr" id="rcompanyStr" value="${rcompany}">
   	<input type="hidden" name="rpayStatusStr" id="rpayStatusStr" value="${rpayStatus}">
</body>
</html>
