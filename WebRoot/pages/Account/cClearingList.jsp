<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>结算管理</title>
<link
	href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css"
	rel="stylesheet" type="text/css" />
<script
	src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/jquery-ui.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.position.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.core.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.widget.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.button.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.tabs.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.dialog.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.menu.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/function.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/function.onchang.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>

<script>
        $(function() {
        new $.dropDownList(0, true, 100);
        new $.dropDownList(1, true, 150);
            var $checkboxes = $("input[name='checkboxName']"), $checkAllUsersBox = $("#checkAllStudent");
            $checkboxes.change(function() {
                if (!this.checked) $checkAllUsersBox[0].checked = false;
                if ($checkboxes.size() == $checkboxes.filter(":checked").size()) $checkAllUsersBox[0].checked = true;
                $checkAllUsersBox.trigger("change");
            });
            $checkAllUsersBox.click(function() {
                $checkboxes.each(function() {
                    this.checked = $checkAllUsersBox[0].checked;
                    $(this).trigger("change");
                });
            });
        });
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
</head>
<body>
	<jsp:include page="/pages/common/topPart.jsp" />
	<jsp:include page="/pages/common/leftPart.jsp" />
	<div id="rightPartA" style="overflow-x: hidden;">
		<div>
			<button id="btnExport" class="green ml10">导出excel</button>
		</div>
		<div>
			<div class="panelBox buttonBox">
				<!-- panelBox计划用于布局横向的简单一行 -->
				<div class="dropDownList barLeft" id="Div3">
					<button>结算状态</button>
					<ul>
						<li><a href="javascript:void(0)" val="1"><span
								class="ui-icon ui-icon-bullet"></span>结算状态</a></li>
						<li><a href="javascript:void(0)" val="2">已结算</a></li>
						<li><a href="javascript:void(0)" val="3">未结算</a></li>
					</ul>
					<input type="hidden" name="结算状态" value="${accountState}"
						id="accountState" />
				</div>
				<div class="dropDownList barRight" id="Div1">
					<button>付款状态</button>
					<ul>
						<li><a href="javascript:void(0)" val="1"><span
								class="ui-icon ui-icon-bullet"></span>付款状态</a></li>
						<li><a href="javascript:void(0)" val="2">已付款</a></li>
						<li><a href="javascript:void(0)" val="3">已通知未付款</a></li>
						<li><a href="javascript:void(0)" val="4">未通知未付款</a></li>
					</ul>
					<input type="hidden" name="结算状态" value="${paymentState}"
						id="paymentState" />
				</div>
			</div>
			<div class="Panel ui-corner-all-0">
				<div class="panelContent clear">
					<table class="panelTable" border="0" cellspacing="0"
						cellpadding="3">
						<thead>
							<tr class="trSpliter">
								<th width="50"></th>
								<th width="180"></th>
								<th width="180"></th>
								<th width="180"></th>
								<th width="180"></th>
								<th width="180"></th>
								<th width="180"></th>
								<th width="180"></th>
								<th width="180"></th>
							</tr>
							<tr>
								<th class="thSortableGray"><input name="users"
									type="checkbox" id="checkAllStudent"><b></b></th>
								<th class="thSortableGray" nowrap="nowrap">结算编号</th>
								<th class="thSortableGray" nowrap="nowrap" width="30">付款编号</th>
								<th class="thSortableGray" nowrap="nowrap">合同号</th>
								<th class="thSortableGray" nowrap="nowrap">经费类型</th>
								<th class="thSortableGray" nowrap="nowrap">合作共建费收费标准</th>
								<th class="thSortableGray" nowrap="nowrap">参与分成培训费收费标准</th>
								<th class="thSortableGray" nowrap="nowrap" width="30">收费人数</th>
								<th class="thSortableGray" nowrap="nowrap">经费小计(元)</th>
								<th class="thSortableGray" nowrap="nowrap">结算状态</th>
								<th class="thSortableGray" nowrap="nowrap">付款状态</th>
								<th class="thSortableGray" nowrap="nowrap"><span
									class="ml10">操作</span></th>
							</tr>
						</thead>
						<tbody id="accountData">
							<c:forEach items="${allAccountList }" var="list">
								<tr>
									<c:choose>
										<c:when test="${list.accountState=='3' }">
											<td><input name="checkboxName" id="checkboxName"
												type="checkbox" value="${list.aid }" /><b></b></td>
										</c:when>
										<c:otherwise>
											<td></td>
										</c:otherwise>
									</c:choose>
									<!-- <td><input name="checkboxName" type="checkbox" value=""><b></b></td> -->
									<td nowrap="nowrap">${list.accountNo }</td>
									<td nowrap="nowrap">${list.paymentNo }</td>
									<td nowrap="nowrap">${list.contractNo }</td>
									<td nowrap="nowrap">${list.fundsType }</td>
									<td nowrap="nowrap">${list.PBuildFeeStandardPrice }</td>
									<td nowrap="nowrap">${list.PTrainFeeStandardPrice }</td>
									<td nowrap="nowrap">${list.PGradeStudentCount }</td>
									<td nowrap="nowrap">${list.fundsSubtotal }</td>
									<c:if test="${list.accountState=='2' }">
										<td nowrap="nowrap">已结算</td>
									</c:if>
									<c:if test="${list.accountState=='3' }">
										<td nowrap="nowrap">未结算</td>
									</c:if>
									<c:choose>
										<c:when test="${list.paymentState=='2' }">
											<td nowrap="nowrap">已付款</td>
										</c:when>
										<c:when test="${list.paymentState=='3' }">
											<td nowrap="nowrap">已通知未付款</td>
										</c:when>
										<c:otherwise>
											<td nowrap="nowrap">未通知未付款</td>
										</c:otherwise>

									</c:choose>
									<td nowrap="nowrap"><a
										href="<%=request.getContextPath()%>/UpdateAccount/updateAccountInit.do?aid=${list.aid}"
										class="blue setStop">修改</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					${pageStr}
				</div>
			</div>
		</div>
	</div>

	<div id="dialogForm2" title="导出Excel">
		<p class="validateTips"></p>
		<div>点击确认生成编号为${newAccountId}的结算通知</div>
		<table id="tabLoading" width="100%" style="display: none">
			<tr>
				<td align="center"><img
					src="<%=request.getContextPath()%>/contract/themes/cupertino/images/loading.gif"
					width="80px" /></td>
			</tr>
		</table>
	</div>
	<!-- 条件查询提交的表单 -->
	<form
		action="<%=request.getContextPath()%>/account/selectAccountById.do"
		name="partQueryAccount" id="partQueryAccount" method="post">
		<input type="hidden" name="accountState" id="accountStateStr">
		<input type="hidden" name="paymentState" id="paymentStateStr">
	</form>
	<!-- 到处Excel 部分提交的表单 -->
	<form
		action="<%=request.getContextPath()%>/account/excelAccountById.do"
		name="excelIdForm" id="excelIdForm">
		<input type="hidden" name="excelIdStr" id="excelIdStr"> <input
			type="hidden" name="newAccountId" id="newAccountId"
			value="${newAccountId}">
	</form>
	<form
		action="<%=request.getContextPath()%>/account/selectAccountList.do"
		name="returnForm" id="returnForm"></form>
	<form action="<%=request.getContextPath()%>/UpdateAccount/downloadExcel.do"
		name="downloadExcel" id="downloadExcel">
		<input type="hidden" name="excelName" id="downloadExcelName" value="${newAccountId}">
		<input type="hidden" name="downloadExcelStr" id="ExcelStr" value="${newAccountId}.xls">
	</form>
	<script>
    $(function() {
    var txt1 = $("#txtTFYY"),
		txt2 = $("#txtTFSJ"),
		allFields = $([]).add(txt1).add(txt2),
		tips = $(".validateTips");

        function updateTips(t) {
            tips.html(t).addClass("ui-state-highlight");
            setTimeout(function() {
                tips.removeClass("ui-state-highlight", 1500);
            }, 2000);
        }

        $("#dialogForm2").dialog({
            autoOpen: false,
            height: 200,
            width: 500,
            background: '#FF0000', // 背景色
            opacity: 0.27,     // 透明度
            modal: true,
            resizable: false,
            buttons: {
                "确 定": function() {
                	var excelIdStr = $("#excelIdStr").val();
                	var newAccountId = $("#newAccountId").val();
            		$.ajax({
            			type:"post",
            			url:"<%=request.getContextPath()%>/account/excelAccountById.do",//此处不能换行。。。。
													data : {
														excelIdStr : excelIdStr,
														newAccountId : newAccountId
													},
													dataType : 'text',
													beforeSend : function() {
														$("#tabLoading").show();
														$("#tabLoading").prev().hide();
													},
													success : function(data) {
														if (data == "OK") {
// 															$.ajax({
// 										            			type:"post",
// 										            			url:action="<%=request.getContextPath()%>/UpdateAccount/downloadExcel.do",
// 										            			data:$('#downloadExcel').serialize(),
// 																success : function(data) {
// 																	$("#tabLoading").hide();
// 																	$("#dialogForm2").dialog("close");
// 																	window.location.reload();
// 																},
// 																error: function(request) {
// 												                    alert("Connection error");
// 												                }
// 															});
															$("#downloadExcel").submit();
															setTimeout(function(){
																$("#tabLoading").hide();
																$("#dialogForm2").dialog("close");
																window.location.reload()},
																500);
														} else {
															alert("Excel导出失败");
															window.location.reload();
														}
													},
													error : function(XMLHttpRequest,textStatus,errorThrown) {
														alert(errorThrown);
														window.location.reload();
													}
												});

										//$("#excelIdForm").submit();
										//确定按钮的处理代码段：
										//     $(this).dialog("close");
									},
									"取 消" : function() {
										$(this).dialog("close");
									}
								},
								close : function() {
									allFields.val("").removeClass("error");
								}
							});

			$('#btnExport').click(function() {
				var str = "";
				var sel = document.getElementsByName("checkboxName");//获取checkbox的值
				for (var i = 0; i < sel.length; i++) {
					if (sel[i].checked == true) {
						str += sel[i].value + ",";
					}
				}
				if (str != "") {
					$("#excelIdStr").val(str);
					$("#dialogForm2").dialog("open");
				} else if (str == "") {
					alert("请至少选择一条记录");
					return false;
				}
			});
		})
	</script>
</body>
</html>