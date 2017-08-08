<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>签派回收</title>
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
.icons{float: left; margin: .1em .1em 0 0;cursor:pointer }
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

	$("#modalDialogButton3").click(function(){
		var k =0;
		var str="";
		var itype="";
		var reason="";
		var slong = "";
		var elong = "";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				itype = getRadioValue('itype' + (i+1));
				reason = $("#reason" + (i+1)).val();
				if($("#shijian" + (i+1)).val()==""){
					alert("回收时间不能为空。");
					$("#shijian" + (i+1)).focus();
					return;
				}
				slong = $.trim($("#shichang" + (i+1)).val());
				if(slong==""){
					alert("空地飞行时间不能为空。");
					$("#shichang" + (i+1)).focus();
					return;
				}
				slong=slong.replace(/\n/g,"");
				
				if(!checkDouble(slong)){
					alert("空地飞行时间应为正整数。");
					$("#shichang" + (i+1)).focus();
					return;
				}
				if(slong.length%4!=0){
					alert("空地飞行时间数字个数应为4的倍数。");
					$("#shichang" + (i+1)).focus();
					return;
				}

				elong = $.trim($("#kongzhong" + (i+1)).val());
				if(elong==""){
					alert("空中飞行时间不能为空。");
					$("#kongzhong" + (i+1)).focus();
					return;
				}
				elong=elong.replace(/\n/g,"");
				if(!checkDouble(elong)){
					alert("空中飞行时间应为正整数。");
					$("#kongzhong" + (i+1)).focus();
					return;
				}
				if(elong.length%4!=0){
					alert("空中飞行时间数字个数应为4的倍数。");
					$("#kongzhong" + (i+1)).focus();
					return;
				}
				
				if( $("#times" + (i+1)).val()==""){
					alert("起落架次不能为空。");
					$("#times" + (i+1)).focus();
					return;
				}
				if( !checkNum($("#times" + (i+1)).val())){
					alert("起落架次应为自然数。");
					$("#times" + (i+1)).focus();
					return;
				}
				
				if(itype==1 && $.trim(reason)==""){
					alert("机号是"+r1[i].value.split(",")[1]+"异常回收原因不能为空。");
					$("#reason" + (i+1)).focus();
					return;
				}
				
				str+=r1[i].value.split(",")[0] + ";" +  $("#shijian" + (i+1)).val()+ ";" + getFlyTimeLong(slong) + ";" 
				+ $("#times" + (i+1)).val() + ";" + getFlyTimeLong(elong)  + ";" + itype +";" + reason + ",";
			}
		}
		
		if(k==0){
			$("#dialogForm4Span").html("请选择签派回收的飞机。");
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
	$( "#dialogForm1" ).dialog({
		autoOpen: false,
		height: 450,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				
				var k =0;
				var str="";
				var r1=document.getElementsByName('teaName');
				for(i=0;i<r1.length;i++){
					if(r1[i].checked==true){
						k++;
						str=r1[i].value;
					}
				}
				
				if(k==0){
					$("#dialogForm4Span").html("请选择教员。");
					$( "#backResultDialogForm" ).dialog( "open" );
					return;
				}
				$("#teaid").val(str);
				var t = $("#qptime").val();
				if(t==""){
					alert("签派时间不能为空。");
					return;	
				}
				var id = $("#oneId").val();
				var btimeid = id.split(",")[1];
				var btime = $("#shijian" + btimeid).val();
				var slong = $.trim($("#shichang" + btimeid).val());
				
				var elong = $("#kongzhong" + btimeid).val();
				var itype = getRadioValue('itype' + btimeid);
				var reason = $("#reason" + btimeid).val();
				
				if(itype==1){
					alert("异常回收的飞机不能再次签派。");
					return;
				}
				
				var times = $("#times" + btimeid).val();
				if(btime==""){
					alert("回收时间不能为空。");
					return;
				}

				
				if(slong==""){
					alert("空地飞行时间不能为空。");
					$("#shichang" + (i+1)).focus();
					return;
				}
				slong=slong.replace(/\n/g,"");
				
				if(!checkDouble(slong)){
					alert("空地飞行时间应为正整数。");
					$("#shichang" + (i+1)).focus();
					return;
				}
				if(slong.length%4!=0){
					alert("空地飞行时间数字个数应为4的倍数。");
					$("#shichang" + (i+1)).focus();
					return;
				}
				
				if(elong==""){
					alert("空中飞行时间不能为空。");
					$("#kongzhong" + (i+1)).focus();
					return;
				}
				elong=elong.replace(/\n/g,"");
				if(!checkDouble(elong)){
					alert("空中飞行时间应为正整数。");
					$("#kongzhong" + (i+1)).focus();
					return;
				}
				if(elong.length%4!=0){
					alert("空中飞行时间数字个数应为4的倍数。");
					$("#kongzhong" + (i+1)).focus();
					return;
				}
				if(times==""){
					alert("起落架次不能为空。");
					return;
				}
				if(!checkNum(times)){
					alert("起落架次应为自然数。");
					return;
				}
				
				var vid = id.split(",")[0] + ";" + btime + ";" + t + ";" +getFlyTimeLong(slong)+";"+times + ";" + getFlyTimeLong(elong);
				//alert(vid);
				//return;
				$("#oneId").val(vid);
				$("#toTeaForm").submit();
				$( this ).dialog( "close" );

			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("img.icons").click(function(){
		var id = this.id;
		//var btimeid = id.split(",")[1];
		//var btime = $("#shijian" + btimeid).val();
		$("#oneId").val(id);
		
		$( "#dialogForm1" ).dialog("open");
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
function getFlyTimeLong(slong){
	
	var qtwo=0;
	var htwo=0;
	for(var j=0;j<slong.length/4;j++){
		
		qtwo+=slong.substring(j*4,j*4+2)*1;
		htwo+=slong.substring(j*4+2,j*4+4)*1;
	}
	return qtwo+":"+htwo;
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
    <button id="modalDialogButton3" class="green">签派回收</button></s:if>
    
    <div class="dropDownList barLeft">
    <s:set name="eformid" value="formid"/>
    <s:if test="formid==null || formid==''"><s:set name="eformid" value=""></s:set></s:if>
    <button>型号</button><span class="bar"></span>
    <ul>
    <li><a href="open_planeRecycle.do?deviceType=${deviceType}&formid=&baseid=${baseid}"  val=""><span class="ui-icon ui-icon-bullet"></span>型号</a></li>
    <s:iterator value="planeformList">
    <li><a href="open_planeRecycle.do?deviceType=${deviceType}&formid=${VId}&baseid=${baseid}"  val="${VId}">${VName}</a></li>
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
        <li><a href="open_planeRecycle.do?deviceType=${deviceType}&baseid=&formid=${formid}"  val=""><span class="ui-icon ui-icon-bullet"></span>所属基地</a></li>
        <s:iterator value="baselist">
        <li><a href="open_planeRecycle.do?deviceType=${deviceType}&baseid=${VId}&formid=${formid}"  val="${VId}">${VName}</a></li>
        </s:iterator>
        </ul>
        <input type="hidden"  id="sbase" value="${ebaseid}"/>
     </div>
     </s:if>
    <button class="normal barRight" id="modalDialogButton5">全部</button>
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" value="${deviceTypeName}机号" name="searchUser"  type="text" maxlength="50" title="${deviceTypeName}机号"/><button id="modalDialogButton4" >查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="1">
			<thead>
			  <tr class="trSpliter">
				<th width="35"></th>
				<th width="80"></th>
				<th width="70"></th>
                <th width="60" ></th>
                <th width="135"></th>
                <th width="70"></th>
                <th width="80"></th>
                <th width="80"></th>
                <th width="60"></th>
                <th width="105"></th>
                <th width="110"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">机号</th>
				<th class="thSortableGray">${deviceTypeName}型号</th>
                <th class="thSortableGray">教员</th>
                <th class="thSortableGray">签派时间</th>
                <th class="thSortableGray">回收时间</th>
                <th class="thSortableGray">飞行时间<br>(空地)</th>
                <th class="thSortableGray">飞行时间<br>(空中)</th>
                <th class="thSortableGray">起落架次</th>
                <th class="thSortableGray">回收类型</th>
                <th class="thSortableGray">异常回收原因</th> 
                <th class="thSortableGray">回收直接<br>签派教员</th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="planeinfoList" status="i">
			  <tr class="normal">
				<td><input name="checkboxName" type="checkbox" value="${VId},${VPlanecode}"><b></b></td>
				<td>${VPlanecode}</td>
				<td>${planeform.VName}</td>
                <td>${VBz}</td>
                <td>${VDw}</td>
                <td><input type="text"  id="shijian${i.count}" class="Wdate"  style="width:140px; border-color:#DDDDDD;" onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${viewDate}" /></td>
                <td>
                <textarea id="shichang${i.count}" style="width:50px;"></textarea></td>
                <td>
                <textarea id="kongzhong${i.count}" style="width:50px;"></textarea>
                </td>
                <td><input type="text" id="times${i.count}"  style="width:50px;"/></td>
               
                <td><input name="itype${i.count}" type="radio" value="0" checked><b></b>正常<input name="itype${i.count}" type="radio" value="1"><b></b>异常</td>
                 <td><input type="text" id="reason${i.count}"  style="width:100px;" /></td>
                  <td>
               <s:if test="#r==null || #r==0"> <img src="themes/cupertino/images/change.gif" class="icons" id="${VId},${i.count}"  title="回收直接签派教员"></s:if>
                </td>
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

<div id="dialogForm1"  title="回收直接签派教员">
<input type="text" style="width:0px; height:0px; border:0px;" />
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
     <tr>
    <td height="24" colspan="4" valign="bottom">签派时间 <input type="text"  id="qptime" class="Wdate ui-widget-content ui-corner-all text"  style="width:140px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${viewDate}" />
    </td>
     <tr>
    <td height="24" colspan="4"><span class="panelLine"></span>
    </td>
    </tr>
     <s:set name="p" value="0"/>
    <s:iterator value="teacherList" status="statu"><s:if test='#p==0'><tr></s:if>
    <td height="24" width="25%"><input type="radio" name="teaName" value="${VId}"/><b></b>${VName}</td>
    <s:set name="p" value="#p+1"/>
    <s:if test='#p>=4'><s:set name="p" value="0"/></tr></s:if>
    </s:iterator>
    <s:if test='#p<4 && #p>=1'>
    <s:iterator begin="0" end="4-#p-1">
    <td></td>
    </s:iterator>
    </tr></s:if>
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


<form  action="open_planeRecycle.do" method="post" id="searchForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="name" type="hidden" id="searchKey">
</form>

<form  action="savePlaneRecycle.do" method="post" id="repairResultForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="ids" type="hidden" id="VId">
</form>
<form  action="savePlaneRecycleToTeacher.do" method="post" id="toTeaForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="id" type="hidden" id="oneId">
<input name="ids" type="hidden" id="teaid">
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