<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>签派放行</title>
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
.ptext{position: absolute; font-size:10px; text-align:center; width:100px;line-height:15px;}
.process{width:100px;height:15px;}
.posc{width:130px; float:left}
</style>
<script>
$(function() {

	var fifty = document.getElementsByName("fifty");
	
	var surpValue = "";
	var formValue = "";
	var times =  "";
	var heng =  "";
	var zong =  "";
	var snum=0;
	for(var i=0; i<fifty.length; i++){

		surpValue = fifty[i].value.split(",")[0];
		formValue = fifty[i].value.split(",")[1];
		times =  fifty[i].value.split(",")[2];
		heng =  fifty[i].value.split(",")[3];
		zong =  fifty[i].value.split(",")[4];

		snum = surpValue/formValue/60*100;
		if(snum<1 && snum>0){
			snum=1;
		}
		setProgressBar("fifty" + heng + "-" + zong,snum);
		
	}
	//设置进度条数值
	function setProgressBar(progressbar1,num){
		$("#" + progressbar1).progressbar({value: num*1});
	}
	
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
	
	$("div.dropDownList").find("button").css("width","120px").end().each(function(i){
		if(i==0){var d= new $.dropDownList(i,true,120);d.button.css("width", "120px");}
		//else if(i==1){var d= new $.dropDownList(i,true,140);d.button.css("width", "140px");}
		else{new $.dropDownList(i,true,500);}
	})


	var deviceTypeName = $("#deviceTypeName").val();

	$("#modalDialogButton3").click(function(){
		var k =0;
		var str="";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				
				if(str.indexOf(";" + $("#tea" + (i+1)).val() + ",")!=-1){
					$("#dialogForm4Span").html("教员重复选择。");
					$( "#backResultDialogForm" ).dialog( "open" );
					return;
				}
				
				str+=r1[i].value.split(",")[0] + ";" + $("#tea" + (i+1)).val() + ";" +  $("#shijian" + (i+1)).val() + ",";
				if($("#tea" + (i+1)).val()=="0"){
					$("#dialogForm4Span").html("机号是"+r1[i].value.split(",")[1]+"的飞机没有选择教员。");
					$( "#backResultDialogForm" ).dialog( "open" );
					return;
				}
				
			}
			
		}

		if(k==0){
			$("#dialogForm4Span").html("请选择签派放行的飞机。");
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
    <button id="modalDialogButton3" class="green">签派放行</button></s:if>

    
    <div class="dropDownList barLeft">
    <s:set name="eformid" value="formid"/>
    <s:if test="formid==null || formid==''"><s:set name="eformid" value=""></s:set></s:if>
    <button>型号</button><span class="bar"></span>
    <ul>
    <li><a href="open_planeDispatch.do?deviceType=${deviceType}&formid=&baseid=${baseid}"  val=""><span class="ui-icon ui-icon-bullet"></span>型号</a></li>
    <s:iterator value="planeformList">
    <li><a href="open_planeDispatch.do?deviceType=${deviceType}&formid=${VId}&baseid=${baseid}"  val="${VId}">${VName}</a></li>
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
        <li><a href="open_planeDispatch.do?deviceType=${deviceType}&baseid=&formid=${formid}"  val=""><span class="ui-icon ui-icon-bullet"></span>所属基地</a></li>
        <s:iterator value="baselist">
        <li><a href="open_planeDispatch.do?deviceType=${deviceType}&baseid=${VId}&formid=${formid}"  val="${VId}">${VName}</a></li>
        </s:iterator>
        </ul>
        <input type="hidden"  id="sbase" value="${ebaseid}"/>
     </div>
     </s:if>
    <button class="normal barMiddle" id="modalDialogButton5">全部</button>
    <button class="normal barRight" id="printButton">打印</button>
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
                <th width="150"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">机号</th>
				<th class="thSortableGray">${deviceTypeName}型号</th>
                <th class="thSortableGray">教员</th>
                <th class="thSortableGray">放行时间</th>
                <th class="thSortableGray">定检进度</th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="viewPlaneinfoList" status="i">
			  <tr class="normal">
				<td><input name="checkboxName" type="checkbox" value="${VId},${VPlanecode}"><b></b></td>
				<td>${VPlanecode}</td>
				<td>${planeform}</td>
                <td><div class="dropDownList">
        <s:set name="ebaseid" value="baseid"/>
    	<s:if test="baseid==null || baseid==''"><s:set name="ebaseid" value=""></s:set></s:if>
        <button>教员</button>
        <ul>
         <li><a href="#N"  val="0" class="inline"  style="width:45px;"><span class="ui-icon ui-icon-bullet"></span>教员</a>
         <s:iterator value="teacherList"><a href="#N"  val="${VId}" class="inline"  style="width: 45px;">${VName}</a></s:iterator>
         </li>
        
        </ul>
        <input type="hidden" id="tea${i.count}" value="${VBz}"/>
     </div></td>
                <td><input type="text"  id="shijian${i.count}" class="Wdate"  style="width:140px; border-color:#DDDDDD;" onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${viewDate}" /></td>
                
                <td><s:iterator value="checkList" status="j">
                 <div class="posc">
                 <div id="fifty${i.count}-${j.count}" PB_CLASS_LOW="progressbarGreen" PB_CLASS_MIDDLE="progressbarYellow" PB_CLASS_HIGH="progressbarRed" PB_PERCENT_LOW="80" PB_PERCENT_MIDDLE="90" class="process">
                <div class="ptext">${VChecktype}/${formValue}</div>
                </div><input type="hidden" name="fifty" value='${shengValue},${formValue},${times},${i.count},${j.count}'>
                 </div>
                 </s:iterator>
                </td>
			  </tr>
              </s:iterator>
			 <s:iterator value="(13-viewPlaneinfoList.size).{ #this }">
			  <tr class="normal">
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


<div id="deleteDialogForm">   
<fieldset>
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</fieldset>
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


<form  action="open_planeDispatch.do" method="post" id="searchForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="name" type="hidden" id="searchKey">
</form>

<form  action="savePlaneDispatch.do" method="post" id="repairResultForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="ids" type="hidden" id="VId">
</form>

<%@ include file="../../result.jsp"%>
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