<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>机务回收</title>
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
<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>
<style>
/*功能9*/
fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
.borders{width:85px; border-top: solid 1px #DDDDDD;border-bottom: solid 1px #DDDDDD;border-left: solid 1px #DDDDDD;border-right:solid 1px #DDDDDD;}

</style>
<script>
$(function() {


	var $checkboxes=$("input[name='checkboxName']"),$checkAllUsersBox=$("#checkAllUsersBox");
	$checkboxes.change(function(){
		if(!this.checked) $checkAllUsersBox[0].checked=false;
		if($checkboxes.size()==$checkboxes.filter(":checked").size()) $checkAllUsersBox[0].checked=true;
		$checkAllUsersBox.trigger("change");
	});
	$checkAllUsersBox.click(function(){
		$checkboxes.each(function(){
			this.checked = $checkAllUsersBox[0].checked;
			$(this).trigger("change");
		});
	});
	
	$("div.dropDownList").find("button").css("width","140px").end().each(function(i){
		if(i==0){var d= new $.dropDownList(i,true,100);d.button.css("width", "90px");}

		else{new $.dropDownList(i,true,140);}
	})


	var deviceTypeName = $("#deviceTypeName").val();
	
	function checkRegexp( o) {
			var re = /^\d+(\.\d+)?$/; //判断浮点数
			if ( re.test( o ) ) {
				return true;
			} else {
				return false;
			}
	}

	$("#modalDialogButton3").click(function(){

		var k =0;
		var str="";
		var shichang = "";
		var kongzhong = "";
		var shijian = "";
		var times = "";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				shichang = $("#shichang" + (i+1)).val();
				shijian = $("#shijian" + (i+1)).val();
				kongzhong = $("#kongzhong" + (i+1)).val();
				times =  $("#cDEngineStart" + (i+1)).val();
				str+=r1[i].value.split(",")[0] + ";" + shichang + ";" + shijian + ";" + kongzhong + ";" + times +",";
				
				if($.trim(shichang)==""){
					alert("机号是"+r1[i].value.split(",")[1]+"飞行时间不能为空。");
					$("#shichang" + (i+1)).focus();
					return;
				}

				if(!checkRegexp(shichang.replace(":","").replace(":",""))){
					alert("机号是"+r1[i].value.split(",")[1]+"飞行时间应为数字。");
					$("#shichang" + (i+1)).focus();
					return;
				}
				if($.trim(kongzhong)==""){
					alert("机号是"+r1[i].value.split(",")[1]+"飞行时间不能为空。");
					$("#kongzhong" + (i+1)).focus();
					return;
				}

				if(!checkRegexp(kongzhong.replace(":","").replace(":",""))){
					alert("机号是"+r1[i].value.split(",")[1]+"飞行时间应为数字。");
					$("#kongzhong" + (i+1)).focus();
					return;
				}
				if($.trim(shijian)==""){
					alert("机号是"+r1[i].value.split(",")[1]+"回收时间不能为空。");
					$("#shijian" + (i+1)).focus();
					return;
				}
				if(isNaN(times) || times.length!=6){
					alert("发动机计时器时刻必须是6位数字。");
					return;
				}

			}
			
		}

		if(k==0){
			$("#dialogForm4Span").html("请选择机务回收的飞机。");
			$( "#backResultDialogForm" ).dialog( "open" );
			return;
		}
		
		$("#VId").val(str);
		$("#repairResultForm").submit();
		
	});

	$( "#backResultDialogForm" ).dialog({//操作数据库返回提示窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchUser").val()!=deviceTypeName + "机号")								
			$("#searchKey").val($("#searchUser").val());
		$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//全部
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});
});
function getRadioValue(name){
	var itypes = document.getElementsByName(name);
	var astr = "";
	for(j=0;j<itypes.length;j++){
		if(itypes[j].checked==true){
			astr= itypes[j].value;
		}
	}
	return astr;
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">

<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c014714a051e20008</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

    <div class="panelBox buttonBox">
    <s:if test="deviceType==null || deviceType=='' || deviceType==0">
    	<s:set name="deviceTypeName" value="'飞机'"/>
    </s:if>
    <s:elseif test='deviceType==1'>
    	<s:set name="deviceTypeName" value="'训练器'"/>
    </s:elseif>
    <s:else>
    	<s:set name="deviceTypeName" value="'模拟机'"/>
    </s:else>
<%request.setAttribute("k",ActionContext.getContext().getName());%>
<s:if test="#session.loginContext.urlAddress=='all'">
	<s:set name="r" value="0"/>
</s:if>
<s:else>
    <s:set name="pos" value="#session.loginContext.urlAddress.indexOf(#request.k+'.do')"/>
    <s:if test='#pos==-1'>
        <s:set name="r" value="1"/>
    </s:if>
    <s:else>
        <s:set name="r" value="#session.loginContext.urlAddress.substring(#pos+#request.k.length()+6,#pos+#request.k.length()+7)"/>
    </s:else>
</s:else>
<s:if test="#r==null || #r==0">
    <button id="modalDialogButton3" class="green">机务回收</button>
 </s:if>
    <div class="dropDownList barLeft">
    <s:set name="eformid" value="formid"/>
    <s:if test="formid==null || formid==''"><s:set name="eformid" value=""></s:set></s:if>
    <button>型号</button><span class="bar"></span>
    <ul>
    <li><a href="open_maintenanceRecycle.do?deviceType=${deviceType}&formid=&baseid=${baseid}"  val=""><span class="ui-icon ui-icon-bullet"></span>型号</a></li>
    <s:iterator value="planeformList">
    <li><a href="open_maintenanceRecycle.do?deviceType=${deviceType}&formid=${VId}&baseid=${baseid}"  val="${VId}">${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="splaneform" value="${eformid}"/>
    </div>
     <s:if test='#session.loginContext.level==1'>
    <div class="dropDownList barMiddle">
        <s:set name="ebaseid" value="baseid"/>
    	<s:if test="baseid==null || baseid==''"><s:set name="ebaseid" value=""></s:set></s:if>
        <button>所属基地</button><span class="bar"></span>
        <ul>
        <li><a href="open_maintenanceRecycle.do?deviceType=${deviceType}&baseid=&formid=${formid}"  val=""><span class="ui-icon ui-icon-bullet"></span>所属基地</a></li>
        <s:iterator value="baselist">
        <li><a href="open_maintenanceRecycle.do?deviceType=${deviceType}&baseid=${VId}&formid=${formid}"  val="${VId}">${VName}</a></li>
        </s:iterator>
        </ul>
        <input type="hidden"  id="sbase" value="${ebaseid}"/>
     </div></s:if>
    <button class="normal barRight" id="modalDialogButton5">全部</button>
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" value="${deviceTypeName}机号" name="searchUser"  type="text" maxlength="50" title="${deviceTypeName}机号"/><button id="modalDialogButton4" >查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="40"></th>
				<th width="60"></th>
				<th width="70"></th>
                <th width="100"></th>
                 <th width="100"></th>
                <th width="140"></th>
                <th width="100"></th>
                <th width="120"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">机号</th>
				<th class="thSortableGray">${deviceTypeName}型号</th>
                <th class="thSortableGray">飞行时间(空地)</th>
                <th class="thSortableGray">飞行时间(空中)</th>
                <th class="thSortableGray">放行时间</th>
                <th class="thSortableGray">回收时间</th>
                <th class="thSortableGray">发动机计时器时刻</th>
                <th class="thSortableGray">飞机状态</th>
                <th class="thSortableGray">签派异常回收原因</th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="planeinfoList" status="i">
			  <tr class="normal">
				<td><input name="checkboxName" type="checkbox" value="${VId},${VPlanecode}"><b></b></td>
				<td>${VPlanecode}</td>
				<td>${planeform.VName}</td>
                <td><input type="text"   id="shichang${i.count}"  style="width:50px;"  onMouseDown="deletebMF('shichang${i.count}')" onBlur="viewLongTime('shichang${i.count}')"/></td>
                <td><input type="text" id="kongzhong${i.count}"  style="width:50px;" onMouseDown="deletebMF('kongzhong${i.count}')" onBlur="viewLongTime('kongzhong${i.count}')"/></td>
                <td>${VHgz}</td>
                <td><input type="text"  id="shijian${i.count}" class="Wdate"  style="width:140px; border-color:#DDDDDD; " onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${viewDate}" /></td>
                <td><input id="cDEngineStart${i.count}" class="borders"  type="text" maxlength="6"  value="${VCountry}" /></td>
				<td>${VDw}</td>
                <td>${VBz}</td>
			  </tr>
              </s:iterator>
			 <s:iterator value="(13-planeinfoList.size).{ #this }">
			  <tr class="normal">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
                 <td>&nbsp;</td>
			  </tr>
              </s:iterator>
			</tbody>
		</table>
        

</div>
</div>
</div>
</div>


<div id="backResultDialogForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm4Span"></span></td>
</tr>
</table>
</div>
<input type="hidden" id="deviceTypeName" value="${deviceTypeName}"/>
<input type="hidden" id="nowdate" value="${viewDate}"/>


<form  action="open_maintenanceRecycle.do" method="post" id="searchForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="name" type="hidden" id="searchKey">
</form>

<form  action="saveMaintenanceRecycle.do" method="post" id="repairResultForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="ids" type="hidden" id="VId">
</form>

<%@ include file="../../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#backResultDialogForm" ).dialog( "open" );
	}
});

</script>