<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>节点显示</title>
    <link
	href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/contract/themes/cupertino/date.css"
	rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.position.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.core.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.widget.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.button.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.tabs.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.dialog.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.menu.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/function.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/dropdownlist.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/datepicker4.8/WdatePicker.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/Calendar3.js" type="text/javascript"></script>
    <script>
        $(function() {

            //功能11
            new $.treeView(0);
            //功能11
        });
</script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>
</head>
<body>

<jsp:include page="/pages/common/topPart.jsp" />
<jsp:include page="/pages/common/leftPart.jsp" />
<div id="rightPartA" style="overflow-x:hidden;">
    <div>
    <div class="Panel">
        <div class="panelHead">
            <span>节点显示</span>
        </div>
        <div class="panelContent">
            <div class="treeView" id="treeView0">
			<ul>
            <div class="treeView" id="Div1">
				<s:iterator value="paymentList">            
				<ul>
				       <li class="folderNode rootNode"><span class="ui-icon ui-icon-circlesmall-plus">+</span><span>${PContractGrade}级</span>
				       		 <span>节点描述：</span><label class="bold left">${PName }</label>
				       </li>
				       <ul>
						<li class="treeNode">
						   <%--  <span>节点一描述：</span><label class="bold left">${PName }</label> --%>
						    <span style="margin-left:8px;">百分比：</span><label class="bold left">${PPaymentPercent}%</label>
						    <span style="margin-left:30px;">预收金额：</span><label class="bold left">${PReceiveMoney }元</label>
						    <span style="margin-left:30px;">预收日期：</span>
						    <input  type="text" class="tableinput2 btnPreDate date txtYSDate" value="${PReceiveDate }"/>
						    <input  type="hidden" id="hDate"  />						    
						    <input  type="hidden" class="pid" value="${PId }" />
						</li>
						<form  action="<%=request.getContextPath()%>/contract/ModifyDate.do" method="post" id="ModifyDate">
							 <input  type="hidden" id="array" name="array"  /> 							 							
						</form>
						<li class="treeNode">
						    <span>飞行技术学院收费人数：</span><label class="bold left">${PGradeStudentCount }人</label>
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
			</ul>
            </div>
            <div class="payWrap tCenter">
                <input id="Button2" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary mt10" value="保存" />
            </div>
        </div>
    </div>
    </div>
</div>
 <div id="dialogForm1" title="修改预收日期">
	<form>
		<div class="jffpline">
		    确定修改预收日期为<span id="selDate"></span>吗？
		</div>
	</form>
</div> 
<script>
    $(function() {  
    	for(var i=0;i<$(".btnPreDate").length;i++){
    		//alert($(".btnPreDate:eq("+i+")").val());
    		var time = $(".btnPreDate:eq("+i+")").val();
    		time=time.substring(0,10);
    		$(".btnPreDate:eq("+i+")").val(time);
    	}
    	
    	//alert($('.date').val());
        var txt1 = $("#txtTFYY")
        allFields = $([]).add(txt1),
		//tips = $(".validateTips");
        // alert("ok");
        $("#dialogForm1").dialog({ 
            autoOpen: false,
            height: 200,
            width: 500,
            background: '#FF0000', // 背景色
            opacity: 0.27,     // 透明度
            modal: true,
            resizable: false,
            buttons: {
            	"确 定": function() {           		
                    $(this).dialog("close");
                },
                "取 消": function() {
                	$(".btnPreDate").val($("#hDate").val());
                    $(this).dialog("close");
                }
            },
            close: function() {
                allFields.val("").removeClass("error");
            }
        });
        /* $('.btnPreDate').change(function() {
            $("#dialogForm1").dialog("open");
        });
 */
 
 var cal;
 $('.btnPreDate').bind('mousedown', function() {
     cal = new Calendar();
     cal.show(this);
     
     var date=$(this).val();
     if(date!=null)
    	 {
    	 date=date.substring(0,10); 
    	 $("#hDate").val(date);
    	 }
    // alert(date);
 });

 $(document).click(function(e) {
     if ($(e.target).is("#__calendarIframe,.btnPreDate")) {
         return false;
     }
     cal.hide();
 })
        $('#Button2').click(function() {
        	//debugger;
        	//var array=[];
        	var strData="[";
        	for(var i=0;i<$(".pid").length;i++){
        		    strData+='{';
        		    strData+='"pid":"'+$(".pid:eq("+i+")").val()+'"';
        		    strData+=',"strdate":"'+$(".btnPreDate:eq("+i+")").val()+'"';
        		    strData+='},';	
        	}
        	strData+=']';
        	var str = strData.replace(',]',']');
        //	array.push(strData);
        	$('#array').val(str);
        	//$('#array').val(array);
        	$('#ModifyDate').submit();
            //window.location.href = 'cAllContractQueryList.do';
        });
    });
</script>
</body>
</html>



