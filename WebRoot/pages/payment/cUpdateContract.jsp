<%@page contentType="text/html; charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%-- <%response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
response.flushBuffer();%> --%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改付款</title>
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/contract/CLEditor1_4_5/jquery.cleditor.css" rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/CLEditor1_4_5/jquery.cleditor.js" type="text/javascript"></script>
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
    <script src="<%=request.getContextPath()%>/pages/payment/js/cUpdateContract.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/pages/payment/js/ajaxfileupload.js" type="text/javascript"></script>
  
   <%--  <script src="<%=request.getContextPath()%>/pages/payment/js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/pages/payment/js/jquery.uploadify.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/pages/payment/js/uploadify.css"> --%>
    <script>
        $(document).ready(function() {
        	/* $('.fpWrap').hover(function() {
                $(this).find('.removeClose').show();
            }, function() {
                $(this).find('.removeClose').hide();
            });

            $('.fpWrap .removeClose').click(function() {
                $(this).parent().remove();
            }); */
           
        });
    </script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>
</head>
<style type="text/css">
#preview{width:260px;height:190px;border:1px solid #000;overflow:hidden;}
#imghead {filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=image);}
</style>
<body>
<jsp:include page="/pages/common/topPart.jsp"/>
<jsp:include page="/pages/common/leftPart.jsp"/>
<div id="rightPartA" style="overflow-x:hidden;">
    <div>
    <div class="Panel">
        <div class="panelHead">
            <span>修改付款</span>
        </div>
        <div class="panelContent">
            <table class="modifyTable">
                <tr>
                    <td class="col15_ textR" >付款编号</td>
                    <td class="col35_" >${serialHide}</td>
                    <td class="col15_ textR">付款单位</td>
               <%-- <td class="col35_">${viewPayEnity.c_compy} --%>
                    <input type="hidden" value="${viewPayEnity.c_compy}"  id="Text2"/><!-- </td> -->
                </tr>
                
                <tr>
                    <td class="col15_ textR">合同编号</td>
                    <td class="col35_">
                       <label id="Text1">${viewPayEnity.PContractId}</label>
                    </td>
                    <td class="col15_ textR">对方联系部门</td>
                    <td>
                        <input id="Text3" type="text" class="tableinput" />
                    </td>
                </tr>
                <tr>
                    <td class="col15_ textR">预计付款金额</td>
                    <td class="col35_">
                        <input id="Text4" type="text" value="${viewPayEnity.p_receive_money}" class="tableinput" />
                        <span class="ml5">元</span>
                        <button id="btnCreateNotice" class="greenBtn"  style=" margin-left:10px;">生成通知</button>
                    </td>
                    <td class="col15_ textR">所在年级</td>
                    <td>${viewPayEnity.p_contractgrade}</td>
                    
                </tr>
                <tr>
                    <td class="col15_ textR">付款节点</td>
                    <td class="col35_">${viewPayEnity.PName}</td>
                    <td class="col15_ textR">付款阶段</td>
                    <td>${viewPayEnity.PCurrentStage}/${viewPayEnity. PGeneralPhase}</td>
                </tr>
                <tr>
                    <td class="col15_ textR">百分比</td>
                    <td class="col35_">
                    <input id="Text5" type="text" value="${viewPayEnity.p_payment_percent}" class="tableinput" />
                    <span class="ml5">%</span>
                    </td>
                    <td class="col15_ textR">预计到款时间</td>
                    <td><input id="Text10" type="text" class="tableinput date" value="${viewPayEnity.p_receivedate}" onmousedown="WdatePicker()" /></td>
                </tr>
                
                <tr id="www">
                   <%--  <td class="col15_ textR">到款金额</td>                    
                    <td class="col35_">
                        <input id="Tet0" type="text"  value="${viewPayEnity.p_money}" class="tableinput" />
                        <input id="Tet_hidden" type="hidden"  value="${viewPayEnity.p_money}" />
                        <span class="ml5">元</span>
                    </td>                    
                    <td class="col15_ textR">实际到款日期</td>   <input type="hidden" id="numberHide"/>
                    <td>
                        <input id="Tex0" type="text" class="tableinput date" value="${viewPayEnity.p_truedate}"  onmousedown="WdatePicker()" />
                         <input id="Tex_hidden" type="hidden"  value="${viewPayEnity.p_truedate}" />                                              
                        <button id="addNewTr" class="greenBtn"  style="margin-left:10px;">+</button>
                    </td> --%>
                </tr>
                <tr id="debtMoney">
                    <td class="col15_ textR"> 欠款金额</td>
                    <td class="col35_">
                         <label id="Text11"> ${viewPayEnity.p_arrears}</label>
                    </td>
                    <td class="col15_ textR">付款状态</td>
                   <td class="col35_">
                       	<label><c:if test="${viewPayEnity.PNoticeStatus=='2'}">已付款</c:if></label>
                       	<label><c:if test="${viewPayEnity.PNoticeStatus=='3'}">已通知</c:if></label>
                       	<label><c:if test="${viewPayEnity.PNoticeStatus=='4'}">未通知</c:if></label>                      	
                   </td> 
                   <%--  <input type="hidden" value="${viewPayEnity.PNoticeStatus}"  id="pstatus"/> --%>
                </tr>
             
                <tr>
                    <td class="col15_ textR">  备注</td>
                    
                    <td colspan="3">
                        <input id="Text17" type="text" value="${viewPayEnity.p_remark}" class="tableinput" style="width:85%;" />
                    </td>
                </tr>
                <tr>
                    <td class="col15_ textR">付款通知
                    <input type="hidden" id="pdfUrl" value="${viewPayEnity.noticeUrl}" name="pdfUrl">
                    <form action="<%=request.getContextPath()%>/downloadPdf.do" name="downloadUrlForm" id="downloadUrlForm">
                       <input type="hidden" id="downloadUrlStr"  name="downloadUrl">
                    </form>
                    </td>
                    <td colspan="6" id="showpdf">                   
                       <%--  <div class="fjWrap">
                            <img src="<%=request.getContextPath()%>/contract/themes/cupertino/images/pdfimg.png" />
                            <div class="fj_descript">pdf附件</div>
                            <div class="removeClose"></div>
                        </div> --%>
                     <%--    <div class="fjWrap">
                        <a href="javascript:downloadpdf('${account.ANoticeUrl}')">
                            <img src="<%=request.getContextPath()%>/contract/themes/cupertino/images/pdfimg.png" />
                        </a>
                            <div class="fj_descript">pdf附件（删除）</div>
                            <div class="removeClose"></div>
                        </div> --%>                        
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <form action="<%=request.getContextPath()%>/ProcessUpload.do" method="post" id="picPayForm" enctype="multipart/form-data" >
                    <td colspan="2">
                        <a href="javascript:;" class="file-box">
                            <input  id="btnupload" name="file" type="file" class="file" onchange="addMore(this)"/>上传发票
                       		<input type="hidden" id="aaa" name="serialHide" value="${serialHide}"/>
                        </a>
                    </td>
                    </form>
                </tr>
                <tr>
                    <td class="col15_ textR" >发票图片</td>
                    <td colspan="10" id="picture">
                    <input type="hidden" id="pic" name="p_picture" value="${viewPayEnity.p_picture}"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="tCenter">
                        <input id="Button2" type="button" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-primary" value="保存" />
                    </td>
                </tr>
                <form action="<%=request.getContextPath()%>/updatepay.do"
                	method="post" id="updatePayForm" >
                	<input type="hidden"  name="serial" id="serial" value="${serialHide}" />
                	<input type="hidden" name="company" id="companyHide"/>
                	<input type="hidden" name="contractid" id="contractidHide"/>
                	<input type="hidden" name="receive_money" id="receivemoneyHide"/>                 	
                	<input type="hidden" name="contractgrade" id="contractgradeHide"/>
                	<input type="hidden" name="pname" id="pnameHide"/>
                	<input type="hidden" name="stage" id="stageHide"/>
                	<input type="hidden" name="paymentpercent" id="paymentpercentHide"/>
                	<input type="hidden" name="receivedate" id="receivedateHide"/>
                	<input type="hidden" name="money" id="moneyHide"/>
                	<input type="hidden" name="arrears" id="arrearsHide"/>
                	<input type="hidden" name="status" id="statusHide"/>
                	<input type="hidden" name="remark" id="remark"/>
                	<input type="hidden" name="truedate" id="truedateHide" value='${viewPayEnity.p_truedate}'/>
                	<input type="hidden" name="picture" id="pictureHide"/>
                	
                </form>
            </table>
        </div>
    </div>
    </div>
</div>
<div id="dialogForm1" title="生成通知">
	<p class="validateTips">请编辑通知内容</p>
	<div style=" width:100%;">
	<textarea id="input" name="input">
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;按照《中国民航大学与中国国际航空股份有限公司联合共建“飞行技术”专业协议书（协议编号：CAUC2013-H02）》之约定，现将2014-2015年度合作共建经费付款事宜通知如下：<br />
　　截止2014年9月，国航2014-2015年度在册学生共945人，其中延长学业学生5人（延长学业期间不收取合作共建费）。贵公司应支付合作共建费的学生为940人（其中国货航转至国航学生25人），其中：2011级学生共188人（其中国货航转至国航学生11人），2012级学生共177人（其中国货航转至国航学生14人），2013级学生共309人，2014级学生共266人。<br />
　　经费标准：9000元/人<br />
　　经费共计：9，000元/人×940人＝8,460,000元（大写人民币：捌佰肆拾陆万元整）<br />
　　请贵公司于2015年12月10日前将上述款项汇入我校下述账户：<br />
　　开户行： 中国工商银行天津市滨海国际机场支行<br />
　　帐  户： 中国民航大学<br />
　　帐  号： 0302015109100467065<br />
　　汇款备注：合作共建费<br />
　　本通知书一式两份，双方各保留一份。<br />
　　附件1：2014-2015年度国航在册学生名单<br />
	</textarea>
	</div>
</div>
<%-- <form action="<%=request.getContextPath()%>/noticeStatus.do" name="notice" id="notice">
	<input type="hidden" id="serialH" name="serialH" value="${serialHide}">
</form> --%>
<div class="bg"></div>
<form action="<%=request.getContextPath()%>/showPaylist.do" name="returnForm" id="returnForm">
</form>
<form action="<%=request.getContextPath()%>/updateSearch.do" name="returnUpdateForm" id="returnUpdateForm">
    	<input type="hidden" id="serialHide" name="serialHide" value="${serialHide}">
		<%-- <input type="hidden" id="ccontractidHide" name="CContractId" value="${viewPayEnity.c_contract_id}"/> --%>
</form>
<div class="bigImgWindow" id="bigImgWindow">
<script src="<%=request.getContextPath()%>/contract/scripts/enlargeImg.js" type="text/javascript"></script>
<script>
    $(function() {
      /*   $('#Button2').click(function() {
            window.location.href = 'cPaylist.htm';
        }); */
        var txt1 = $("#txtTFYY")
        allFields = $([]).add(txt1),
		tips = $(".validateTips");

        function updateTips(t) {
            tips.html(t).addClass("ui-state-highlight");
            setTimeout(function() {
                tips.removeClass("ui-state-highlight", 1500);
            }, 2000);
        }

        $("#dialogForm1").dialog({
            autoOpen: false,
            height: 450,
            width: 900,
            background: '#FF0000', // 背景色
            opacity: 0.27,     // 透明度
            modal: true,
            resizable: false,
            buttons: {
                "保 存": function() {
                    //确定按钮的处理代码段：
                    
                   var noticeInfor = $("#input").val();
                   var serial = $("#serial").val();
            
                  //  alert(noticeInfor);
                    $.ajax({
            			type:"post",
            			//async:false, 
            			url:"<%=request.getContextPath()%>/saveNotice.do",
            			data:{
            				noticeInfor:noticeInfor,
            				serial:serial
            			},
            			dataType:'text',
            			success:function(data){
            				
            				if (data == "OK") {
            		           	alert("通知保存成功");  	
            		           	$("#returnForm").submit();
            				}
            				else {
            					alert("通知保存失败");	
            				}
            			}, 
            			error:function(XMLHttpRequest, textStatus, errorThrown){
            				alert(errorThrown);
            			}
            		});	
                  //  $(this).dialog("close");
                },
                "取 消": function() {
                    $(this).dialog("close");
                },
                "生成通知": function() {
       
                    var noticeInfor = $("#input").val();
                    var serial = $("#serial").val();
              
                   //  alert(noticeInfor);
                     $.ajax({
             			type:"post",
             			//async:false, 
             			url:"<%=request.getContextPath()%>/saveAndGenerateNotice.do",
             			data:{
             				noticeInfor:noticeInfor,
             				serial:serial
             			},
             			dataType:'text',
             			success:function(data){
             				if (data == "OK") {
             		           	alert("通知保存和生成成功");  	
             		           	$("#returnUpdateForm").submit();
             				}
             				else {
             					alert("通知保存和生成失败");	
             				}
             			}, 
             			error:function(XMLHttpRequest, textStatus, errorThrown){
             				alert(errorThrown);
             			}
             		});	
                	
                   // $(this).dialog("close");
                }
            },
            close: function() {
                allFields.val("").removeClass("error");
            }
        });
        $('#btnCreateNotice').click(function() {
        	//$('#notice').submit();
        	var serial = $("#serial").val();
        	
            tips.removeClass("ui-state-highlight").html("请编辑通知内容");
            $("#modalDialogButton1 input.error").removeClass("error");
            $("#dialogForm1").dialog("open");
            $("#input").cleditor();
        });
    });
</script>
</body>
</html>