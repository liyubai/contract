<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>飞机定检</title>
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
	
		$("#" + progressbar1).progressbar({value: num});
	}
	

	$("div.dropDownList").find("button").css("width","140px").end().each(function(i){
		if(i==0){var d= new $.dropDownList(i,true,100);d.button.css("width", "90px");}

		else{new $.dropDownList(i,true,140);}
	})

	var deviceTypeName = $("#deviceTypeName").val();
	$( "#dialogForm1" ).dialog({
		autoOpen: false,
		height: 300,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var k =0;
				var str="";
				var r1=document.getElementsByName('typeName');
				for(i=0;i<r1.length;i++){
					if(r1[i].checked==true){
						k++;
						str=r1[i].value;
					}
				}				
				if(k==0){
					$("#dialogForm4Span").html("请选择定检类型。");
					$( "#backResultDialogForm" ).dialog( "open" );
					return;
				}
				if($.trim($("#VCheckperson").val())==""){
					alert("定检人不能为空。");
					$("#VCheckperson").focus();
					return false;
				}
				if($.trim($("#DChecktime").val())==""){
					alert("定检日期不能为空。");
					$("#DChecktime").focus();
					return false;
				}
				if($.trim($("#VCheckresult").val())==""){
					alert("定检结果不能为空。");
					$("#VCheckresult").focus();
					return false;
				}
				$("#VChecktype").val(str);
				$("#checkForm").submit();
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("#modalDialogButton3").click(function(){//录入定检结果
		

		var k =0;
		var str="";
		var content="";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				str=r1[i].value;
			}
		}
		
		
		if(k==0){
			$("#dialogForm4Span").html("请选择飞机。");
			$( "#backResultDialogForm" ).dialog( "open" );
			return;
		}
		if(str.split(",")[2]!=5 ){
			$("#dialogForm4Span").html("所选飞机未处于定检中。");
			$( "#backResultDialogForm" ).dialog( "open" );
			return;
		}
		
		$("#pVId").val(str.split(",")[0]);
		//获取定检类型
		
		params = {"id":str.split(",")[0]};
		$.ajax({
			//async:false,//同步请求
			type:"post",
			url:"showPlaneCheckFormList.do",
			data:params,
			dataType:"json",
			success:function(data){

				if(data.length==0){
					$("#dialogForm4Span").html("该飞机目前没有定检类型。");
					$( "#backResultDialogForm" ).dialog( "open" );
					return;	
				}
				
				for(i=0;i<data.length;i++){
					content+="<input name=\"typeName\" type=\"radio\" value=\""+data[i].VId+"\">" + data[i].ICycle+"小时";
					content+="&nbsp;&nbsp;&nbsp;&nbsp;";
				}
				
				$("#formlist").html(content);
				$("#dialogForm1").dialog('option', 'title', '机号是'+str.split(",")[1]+'的定检记录');
				$( "#dialogForm1" ).dialog( "open" );
			},
			error:function(){
				$("#dialogForm4Span").html("数据库连接错误，获取对象失败，请重试。");
				$( "#backResultDialogForm" ).dialog( "open" );
				return;
			}
		});	
		
		
		
	});
	$("#viewCheck").click(function(){
		var k =0;
		var str="";
		var content ="";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				str+=r1[i].value;
			}
		} 
		if(k==0){
			$("#dialogForm4Span").html("请选择飞机。");
			$( "#backResultDialogForm" ).dialog( "open" );
			return;
		}
		//获取检查记录信息
		params = {"id":str.split(",")[0]};
		$.ajax({
			type:"post",
			url:"showPlaneCheckList.do",
			data:params,
			dataType:"json",
			success:function(data){

				if(data.length==0){
					$("#dialogForm4Span").html("该飞机目前没有定检记录。");
					$( "#backResultDialogForm" ).dialog( "open" );
					return;	
				}

				for(i=0;i<data.length;i++){
					content+="<tr>";
					content+="<td width=\"18%\" align=\"right\">定检日期：</td>";
					content+="<td width=\"22%\">"+data[i].DChecktime+"</td>";
					content+="<td width=\"20%\">定检人："+data[i].VCheckperson+"</td>";
					content+="<td width=\"40%\">定检结果："+data[i].VCheckresult+"</td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td align=\"right\">定检类型：</td>";
					content+="<td colspan=\"3\">"+data[i].formValue+"小时</td>";
					content+="</tr>";
					content+="<tr>";
					content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
					content+="</tr>";
				}
				
				$("#contentlist").html(content);
				$("#viewForm").dialog('option', 'title', '机号是'+str.split(",")[1]+'的定检记录');
				$( "#viewForm" ).dialog( "open" );
			},
			error:function(){
				$("#dialogForm4Span").html("数据库连接错误，获取对象失败，请重试。");
				$( "#backResultDialogForm" ).dialog( "open" );
				return;
			}
		});	

	});
	
	$( "#viewForm" ).dialog({
		autoOpen: false,
		height: 400,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				$( this ).dialog( "close" );
			}
		}
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
	$("#repairResult").click(function(){
		var k =0;
		var str="";
		var content ="";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				str+=r1[i].value;
			}
		}
		
		if(k==0){
			$("#dialogForm4Span").html("请选择飞机。");
			$( "#backResultDialogForm" ).dialog( "open" );
			return;
		}
		
		if(str.split(",")[2]==5){
			alert("所选飞机已处于定检中。");
			return;
		}
		if(str.split(",")[2]!=3){
			alert("只有适航的飞机才能定检。");
			return;
		}
		$("#VId").val(str.split(",")[0]);
		
		$("#repairResultForm").submit();
	});
});
function getName(ids){
	var id = ids;
	var str = "";
	if(id==0){
		str+="50小时定检&nbsp;&nbsp;&nbsp;&nbsp;";
	}else if(id==1){
		str+="50小时定检&nbsp;&nbsp;&nbsp;&nbsp;";
		str+="100小时定检&nbsp;&nbsp;&nbsp;&nbsp;";
	}else if(id==2){
		str+="50小时定检&nbsp;&nbsp;&nbsp;&nbsp;";
		str+="100小时定检&nbsp;&nbsp;&nbsp;&nbsp;";
		str+="200小时定检&nbsp;&nbsp;&nbsp;&nbsp;";
	}else{
		str+="1500小时换发";
	}

	return str;
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
    <button id="repairResult" class="green" primary="ui-icon-button-addnew">定检</button>
    <button id="modalDialogButton3" class="green" primary="ui-icon-button-addnew">完成定检</button></s:if>
    <button id="viewCheck" class="green">查看定检信息</button>
    
    
    <div class="dropDownList barLeft">
    <s:set name="eformid" value="formid"/>
    <s:if test="formid==null || formid==''"><s:set name="eformid" value=""></s:set></s:if>
    <button>型号</button><span class="bar"></span>
    <ul>
    <li><a href="open_planecheck.do?deviceType=${deviceType}&formid=&baseid=${baseid}"  val=""><span class="ui-icon ui-icon-bullet"></span>型号</a></li>
    <s:iterator value="planeformList">
    <li><a href="open_planecheck.do?deviceType=${deviceType}&formid=${VId}&baseid=${baseid}"  val="${VId}">${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="splaneform" value="${eformid}"/>
    </div>
    <div class="dropDownList barMiddle">
        <s:set name="ebaseid" value="baseid"/>
    	<s:if test="baseid==null || baseid==''"><s:set name="ebaseid" value=""></s:set></s:if>
        <button>所属基地</button><span class="bar"></span>
        <ul>
        <li><a href="open_planecheck.do?deviceType=${deviceType}&baseid=&formid=${formid}"  val=""><span class="ui-icon ui-icon-bullet"></span>所属基地</a></li>
        <s:iterator value="baselist">
        <li><a href="open_planecheck.do?deviceType=${deviceType}&baseid=${VId}&formid=${formid}"  val="${VId}">${VName}</a></li>
        </s:iterator>
        </ul>
        <input type="hidden"  id="sbase" value="${ebaseid}"/>
     </div>
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
				<th width="30"></th>
				<th width="90"></th>
				<th width="80"></th>
                <th width="540"></th>
                <th width="80"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"></th>
				<th class="thSortableGray">机号</th>
				<th class="thSortableGray">${deviceTypeName}型号</th>
                <th class="thSortableGray">定检进度</th>
                 <th class="thSortableGray">已飞总时长</th>
                 <th class="thSortableGray">状态</th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="viewPlaneinfoList" status="i">
			  <tr class="normal">
				<td><input name="checkboxName" type="radio" value="${VId},${VPlanecode},${IStatus}"><b></b></td>
				<td>${VPlanecode}</td>
				<td>${planeform}</td>
                <td>
                <s:iterator value="checkList" status="j">
                 <div class="posc">
                 <div id="fifty${i.count}-${j.count}" PB_CLASS_LOW="progressbarGreen" PB_CLASS_MIDDLE="progressbarYellow" PB_CLASS_HIGH="progressbarRed" PB_PERCENT_LOW="80" PB_PERCENT_MIDDLE="90" class="process">
                <div class="ptext">${VChecktype}/${formValue}</div>
                </div><input type="hidden" name="fifty" value='${shengValue},${formValue},${times},${i.count},${j.count}'>
                 </div>
                 </s:iterator>
                </td>
                <td align="right" style="padding-right:15px;">${VBz}</td>
                <td><s:if test='IStatus==0'>机务放行</s:if>
                    <s:if test='IStatus==1'>签派放行</s:if>
                    <s:if test='IStatus==2'>签派回收</s:if>
                    <s:if test='IStatus==3'>适航</s:if>
                    <s:if test='IStatus==4'><font color="#FF0000">故障，维修中</font></s:if>
                    <s:if test='IStatus==5'><font color="#FF0000">定检中</font></s:if>
                    </td>
			  </tr>
              </s:iterator>
			 <s:iterator value="(13-viewPlaneinfoList.size).{ #this }">
			  <tr  class="normal">
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


<div id="dialogForm1">
<form id="checkForm" method="post" action="savePlaneCheck.do">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="planecheck.planeinfo.VId" type="hidden" id="pVId">
<input name="planecheck.planeCheckCycle.VId" type="hidden" id="VChecktype">
<table width="98%" border="0" cellpadding="0" cellspacing="0">
    <tr>
    <td width="27%" align="right" height="35">定检类型：</td>
    <td width="73%" id="formlist"></td>
    </tr>
    <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr> 
    <tr>
    <td width="27%" align="right">定检人：</td>
    <td>
    <input type="text"  name="planecheck.VCheckperson" id="VCheckperson" class="text ui-widget-content ui-corner-all"  style="width:130px;" /></td>
    </tr>  
    <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">定检日期：</td>
    <td><input type="text" name="planecheck.DChecktime" id="DChecktime" class="Wdate ui-widget-content ui-corner-all text"  style="width:130px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" />    </td>
    </tr>
    <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
    <tr>
    <td width="27%" align="right">定检结果：</td>
    <td>
    <input type="text" name="planecheck.VCheckresult" id="VCheckresult" class="text ui-widget-content ui-corner-all"  style="width:325px;" value="适航" /></td>
    </tr>
</table>
</form>
</div>

<div id="viewForm">
<table width="98%" border="0">
<tbody id="contentlist">
</tbody>
</table>
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

<form  action="open_planecheck.do" method="post" id="searchForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="name" type="hidden" id="searchKey">
</form>
<form  action="saveRepairReault.do" method="post" id="repairResultForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="planeinfo.VId" type="hidden" id="VId">
<input name="planeinfo.VPlanecode" type="hidden" id="5">
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