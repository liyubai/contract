<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>查看合同</title>
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
    <script src="<%=request.getContextPath()%>/pages/contract/js/cWiewContract.js" type="text/javascript"></script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>
    <style type="<%=request.getContextPath()%>/contract/text/css">
    .treeView li
    {
    	cursor:default;
    	font-size:12px;
    }
    .treeView li span
    {
    	font-size:12px;
    }
    </style>
</head>
<body>
<jsp:include page="/pages/common/topPart.jsp"></jsp:include>
<jsp:include page="/pages/common/leftPart.jsp"></jsp:include>
<div id="rightPartA" style="overflow-x:hidden;">
    <div>
        <div class="Panel">
        <div class="panelHead">
            <span>查看合同</span>
        </div>
        <input type="hidden" name="strCType" id="strCType" value="${con.CType }"/>
        <input type="hidden" name="strCStuType" id="strCStuType" value="${con.CStuType }"/>
        <input type="hidden" name="strCNature" id="strCNature" value="${con.CNature }"/>
        <input type="hidden" name="strCCompy" id="strCCompy" value="${con.CCompy }"/>
        <div class="panelContent">
            <table class="modifyTable" id="modifyTable">
                <tr>
                    <td class="col20_ textR">合同名称</td>
                    <td class="col20_">${con.CName }</td>
                    <td class="col20_ textR">合同编号</td>
                    <td>${con.CContractId }</td>
                </tr>
                <tr>
                    <%-- <td class="col20_ textR">合同类型</td>
                    <td class="col20_">${con.CType }</td>
                    <td class="col20_ textR">学员类型</td>
                    <td>${con.CStuType }</td> --%>                  
                </tr>                   
                <tr>
                    <td class="col20_ textR">合同状态</td>
                    <td class="col20_">
                    <c:if test="${con.CStatus=='1'}">意向</c:if>
                    <c:if test="${con.CStatus=='2'}">初稿</c:if>
                    <c:if test="${con.CStatus=='3'}">定稿</c:if>
                    <c:if test="${con.CStatus=='4'}">生效</c:if>
                    <c:if test="${con.CStatus=='5'}">完成</c:if>
                    <c:if test="${con.CStatus=='6'}">终止</c:if>
                    </td>
                   <%--  <td class="col20_ textR">合同性质</td>
                    <td>${con.CNature }</td> --%>
                    
                </tr>
                <tr>
                   <%--  <td class="col20_ textR">客户单位</td>
                    <td class="col20_">${con.CCompy }</td> --%>
                    <td class="col20_ textR">签订时间</td>
                    <td>${con.CSignTime } </td>                  
                </tr>
                <tr>
                    <td class="col20_ textR">自费生姓名</td>
                    <td class="col20_">${con.CPrivateName }</td>
                    <td class="col20_ textR"></td>
                    <td></td>
                </tr>
                <tr>
                    <td class="col20_ textR" style="vertical-align:top;">经费详情</td>
                    <td colspan="3">
          <!-- 付款项目，及金额 json-->
		  <input type="hidden" name="paymentInfo" id="paymentInfo" value='${con.CPaymentInfo}'>
             <div class="treeView" id="treeView0">
               <ul style="overflow:hidden;" id="treeView0ul"><!-- .innerHTML(str); -->
                    <%--  <li class="folderNode rootNode">合作共建</li>
                    <li class="folderNode rootNode">${json }</li>
                    <ul>
                        <li class="folderNode">招飞经费</li>
                        <ul>
                            <li class="folderNode"><span>招飞经费：</span><span class="bold">${paymentInfolist.recruitFunding}元</span></li>
                        </ul>
                        <li class="folderNode">体检费</li>
                        <ul>
                            <li class="folderNode"><span>体检费：</span><span class="bold">${paymentInfolist.physicalExaminationFunding }元</span></li>
                        </ul>
                        <li class="folderNode">共建费</li>
                        <ul>
                            <li class="folderNode"><span>服装费：</span><span class="bold">${paymentInfolist.costumesFunding }元</span></li>
                            <li class="folderNode"><span>伙食费：</span><span class="bold">${paymentInfolist.boardingFunding }元</span></li>
                            <li class="folderNode"><span>住宿费：</span><span class="bold">${paymentInfolist.accommodationFunding }元</span></li>
                            <li class="folderNode"><span>英语培训费：</span><span class="bold">${paymentInfolist.englishTrainingFunding }元</span></li>
                            <li class="folderNode"><span>奖教奖学基金：</span><span class="bold">${paymentInfolist.scholarshipFunding }元</span></li>
                            <li class="folderNode"><span>理论培训费：</span><span class="bold">${paymentInfolist.theoryOfTrainingFunding }元</span></li>
                        </ul>
                    </ul>
                    <li class="folderNode rootNode">理论培训</li>
                    <ul>
                        <li class="folderNode">执照理论</li>
                        <ul>
                            <li class="folderNode"><span>私照理论：</span><span class="bold">${paymentInfolist.theoryOfPrivate }元</span></li>
                            <li class="folderNode"><span>商照理论：</span><span class="bold">${paymentInfolist.businessTheory }元</span></li>
                            <li class="folderNode"><span>仪表等级：</span><span class="bold">${paymentInfolist.instrumentRating }元</span></li>
                            <li class="folderNode"><span>回国换证：</span><span class="bold">${paymentInfolist.returnReplacement }元</span></li>
                        </ul>
                    </ul> --%> 
                </ul> 
                 <%-- <ul>
                    <li class="folderNode rootNode"><span>成交价：</span><span class="bold">${con.CDealPrice }</span> 元</li>
                    <li class="folderNode rootNode"><span>周期：</span><span class="bold">${con.CTrainCycle }</span>个月</li> 
                 </ul> --%>
            </div>
            	</td>
            </tr>            
            <tr>
                <td class="col20_ textR">成交价</td>
                <td class="col20_">&nbsp;&nbsp;<span class="bold">${con.CDealPrice }</span> 元</td>
                <td class="col20_ textR"></td>
                <td></td>
            </tr>
            <tr>
               <td class="col20_ textR">周期</td>
               <td class="col20_">&nbsp;&nbsp;<span class="bold">${con.CTrainCycle }</span>个月</td>
               <td class="col20_ textR"></td>
               <td></td>
            </tr>
            <tr>
                <td class="col20_ textR" style="vertical-align:top;">节点描述 </td>
                <td colspan="3">
            <div class="treeView" id="Div1">
				<s:iterator value="paymentList">            
				<ul>
				<!-- 对 查询结果迭代循环 -->
				   
				       <li class="folderNode rootNode"><span>${PContractGrade}级</span> 
				       <span>节点描述：</span><label class="bold left">${PName }</label></li>
				       <ul>
						<li class="treeNode">						   
						    <span style="margin-left:8px;">百分比：</span><label class="bold left">${PPaymentPercent}%</label>
						    <span style="margin-left:30px;">预收金额：</span><label class="bold left">${PReceiveMoney }元</label>
						    <span style="margin-left:30px;">预收日期：</span><label  class="bold left "><span class="pdate">${PReceiveDate }</span></label>
						    <input type="hidden" name="date1" class="date1" value="${PReceiveDate }" />
						</li>
						<li class="treeNode">
						    <span>飞行技术学院收费人数：</span><label class="bold left">${PGradeStudentCount } 人</label>
						    <span style="margin-left:30px;">飞行技术学院经费类型：</span>
						     <c:if test="${PFundBudgetType=='0'}" ><label class="bold left">无</label></c:if>
							 <c:if test="${PFundBudgetType=='1'}" ><label class="bold left">HPA理论</label></c:if>
							 <c:if test="${PFundBudgetType=='2'}" ><label class="bold left">飞行基础理论</label></c:if>
							 <c:if test="${PFundBudgetType=='3'}" ><label class="bold left">高性能理论培训费</label></c:if>
							 <c:if test="${PFundBudgetType=='4'}" ><label class="bold left">合作共建+执照理论</label></c:if>
							 <c:if test="${PFundBudgetType=='5'}" ><label class="bold left">合作共建费</label></c:if>
							 <c:if test="${PFundBudgetType=='6'}" ><label class="bold left">基础理论</label></c:if>
							 <c:if test="${PFundBudgetType=='7'}" ><label class="bold left">基础理论+执照理论</label></c:if>
							 <c:if test="${PFundBudgetType=='8'}" ><label class="bold left">招飞经费</label></c:if>   
							 <c:if test="${PFundBudgetType=='9'}" ><label class="bold left">执照理论</label></c:if>
						</li>
						<li class="treeNode"><span>飞行技术学院应分配合作共建费收费标准：</span><label class="ml10 bold">${PBuildFeeStandardPrice }元</label></li>
						<li class="treeNode"><span>飞行技术学院应分配参与分成培训费收费标准：</span><label class="ml10 bold">${PTrainFeeStandardPrice }元</label></li>
						<li class="treeNode"><span>飞行技术学院收费小计：</span><label class="ml10 bold">${PTotalPrice }元</label></li>
					 </ul>
				</ul>
				</s:iterator>
            </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="tCenter">
                        <input id="Button2" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" value="返回" />
                    </td>
                </tr>
            </table>
            <form action="<%=request.getContextPath()%>/contract/cAllContractQueryList.do" id="back" name="back"></form>
        </div>
    </div>
    </div>
</div>
</body>
</html>
