<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>完成训练</title>
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
<script src="scripts/function.min.js"></script>
<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>
<style>

fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }

</style>
<script>
$(function() {
	var $checkboxes=$("input[name='checkboxName']"),$checkAllUsersBox=$("#checkAllUsersBox");
	$checkboxes.change(function(){
	    //当复选框去掉选中状态后，将全选按钮的选择状态去掉（即去掉全选复选框的选中状态）
		if(!this.checked){
		   $checkAllUsersBox[0].checked=false;
		    $("#selSid").val($("#selSid").val().replace($(this).val()+",","")); //去掉选择
		}
		//后加开始......
		if(this.checked){
			if($("#selSid").val().indexOf($(this).val())==-1){
				$("#selSid").val( $("#selSid").val() + $(this).val()+ ",");
			}
		}
		getnum($("#selSid").val());
		//后加结束......
		
		//如果复选框的总数与选中状态的复选框数量相同，则表明当前页面中的所有复选框均被选中，然后将全选复选框的选中状态设为选中
		if($checkboxes.size()==$checkboxes.filter(":checked").size()) {
		  $checkAllUsersBox[0].checked=true;			
		}
		//设置全选复选框触发change事件
		$checkAllUsersBox.trigger("change");
	});
	$checkAllUsersBox.click(function(){
	    //当全选复选框处于选中或非选中状态时，循环处理每个复选框的状态，即当全选复选框当前的状态循环赋给每个复选框
		$checkboxes.each(function(){
			this.checked = $checkAllUsersBox[0].checked;
			$(this).trigger("change");
			//后加开始......
			if($checkAllUsersBox[0].checked){
				if($("#selSid").val().indexOf($(this).val())==-1){
					$("#selSid").val($("#selSid").val() + $(this).val() + ",");
				}
			}else{
				 $("#selSid").val($("#selSid").val().replace($(this).val()+",",""));//去掉选择
			}
			getnum($("#selSid").val());
			//后加结束......
		});
	});
	
	function getnum(str){
		$("#selectIdSum").html(str.split(",").length-1);	
	}
	getnum($("#selSid").val());
	$("div.dropDownList").find("button").css("width","85px").end().each(function(i){
		if(i==0){var d=new $.dropDownList(i,true,140);d.button.css("width", "65px");}
		else if(i==1){var d=new $.dropDownList(i,true,85);d.button.css("width", "85px");}
		else if(i==3){var d=new $.dropDownList(i,true,335);d.button.css("width", "110px");}
		else if(i==4){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==5){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==7){var d=new $.dropDownList(i,true,90);d.button.css("width", "90px");}
		else if(i==8){var d=new $.dropDownList(i,true,90);d.button.css("width", "90px");}
		
		else if(i==9){var d=new $.dropDownList(i,true,110);d.button.css("width", "110px");}
		else if(i==10){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==11){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==12){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==13){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==14){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==15){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		
		else{new $.dropDownList(i,true,90);}

	});
	$("#wanchengButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$( "#wanchengDialog" ).dialog("open");
	});
	$("#tingfeiButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$( "#tingfeiDialog" ).dialog("open");
	});
	$("#fanxiaoButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$( "#fanxiaoDialog" ).dialog("open");
	});
	$("#tingfeilixiaoButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$( "#tingfeilixiaoDialog" ).dialog("open");
	});
	$("#tingfeixuejiButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$( "#tingfeixuejiDialog" ).dialog("open");
	});
	$( "#wanchengDialog" ).dialog({
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#sDFinishtime").val($("#cDFinishtime").val());
				if($("#sDFinishtime").val()==""){
					alert("完成训练日期不能为空。");
					return;
				}
				$("#sDBackschooltime").val($("#cDBackschooltime").val());
				if($("#sDBackschooltime").val()==""){
					alert("返校日期不能为空。");
					return;
				}
				$("#studentid").val($("#selSid").val());
				$("#addForm").submit();
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#tingfeiDialog" ).dialog({
		autoOpen: false,
		height: 300,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				$("#sDStopflytime").val($("#cDStopflytime").val());
				if($("#sDStopflytime").val()==""){
					alert("停飞批准日期不能为空。");
					return;
				}
				$("#sVStopflyreason").val($("#cVStopflyreason").val());
				if($("#sVStopflyreason").val()==""){
					alert("停飞原因不能为空。");
					return;
				}

				$("#studentid2").val($("#selSid").val());
				$("#stopForm").submit();

			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#fanxiaoDialog" ).dialog({
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				$("#sDBackschooltime2").val($("#cDBackschooltime2").val());
				if($("#sDBackschooltime2").val()==""){
					alert("返校日期不能为空。");
					return;
				}

				$("#studentid3").val($("#selSid").val());
				$("#backForm").submit();
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#tingfeilixiaoDialog" ).dialog({
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				$("#sDOffschooltime").val($("#cDOffschooltime").val());
				if($("#sDOffschooltime").val()==""){
					alert("离校日期不能为空。");
					return;
				}

				$("#studentid5").val($("#selSid").val());
				$("#lxForm").submit();
				$( this ).dialog( "close" );
				
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#tingfeixuejiDialog" ).dialog({
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				$("#sDChangedtime").val($("#cDChangedtime").val());
				if($("#sDChangedtime").val()==""){
					alert("改变日期不能为空。");
					return;
				}

				$("#studentid4").val($("#selSid").val());
				$("#sNewstatusid").val(getSelRadioValue('tingfeixuejiName'));
				if($("#sNewstatusid").val()==""){
					alert("请选择学籍状态。");
					return;
				}
				$("#xjForm").submit();
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#dialogForm3" ).dialog({//警告信息窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
});
function getSelRadioValue(name){
	var str="";
	var r1=document.getElementsByName(name);
	for(i=0;i<r1.length;i++){
		if(r1[i].checked==true){
			str=r1[i].value;
		}
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
    <s:param name="parentid">4028816a4714304c0147149d9a760002</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div><%request.setAttribute("k",ActionContext.getContext().getName());%>
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
</s:else><s:if test="#r==null || #r==0">
<div class="panelBox buttonBox" style="padding-bottom:10px; padding-left:3px;" >
<button class="green"  id="wanchengButton">完成训练</button>
<button class="green"  id="tingfeiButton">停飞</button>
<button class="green"  id="fanxiaoButton">派回学校</button>
<button class="green"  id="tingfeixuejiButton">停飞学籍管理</button>
<button class="green"  id="tingfeilixiaoButton">停飞离校</button>
</div></s:if>
<div class="panelBox buttonBox" >
<s:include value="../student/banner.jsp" />
<div class="dropDownList barMiddle">
        <s:set name="eisAssignid" value="isAssignid"/>
        <s:if test="isAssignid==null || isAssignid==''"><s:set name="eisAssignid" value="1"></s:set></s:if>
        <button>完成状态</button><span class="bar"></span>
        <ul>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=1&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="1"><span class="ui-icon ui-icon-bullet"></span>完成状态</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=4&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="4">正常完成</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=5&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="5">停飞</a></li>
            <li><a href="?isAssignid=6"  val="6">全部</a></li>
        </ul><input type="hidden"  id="cxmoreid" value='<s:property value="#eisAssignid" />'/>
    </div>
 	<button class="normal barRight" id="advancedDialogButton">高级查询</button>
     <div class="buttonInput relative left" width="160" height="28">
    <input id="searchOutlineName" title="学号/姓名"  name="searchOutlineName"  type="text" maxlength="50" value="学号/姓名" /><button id="modalDialogButton4">查询</button>
    </div>
</div>

<div class="Panel ui-corner-all-0" id="Panel2" >
	<div class="panelContent">

    <table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
        <thead>
            <tr class="trSpliter">
            <th width="50"></th>
            <th width="100"></th>
            <th width="60"></th>
            <th width="60"></th>
            <th width="80"></th>
            <th width="90"></th>
            <th width="90"></th>
            <th width="100"></th>
            <th width="100"></th>
            <th width="100"></th>
            <th></th>
          </tr>
          <tr>
            <th class="thSortableGray" ><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
            <th class="thSortableGray" >学号</th>
            <th class="thSortableGray" >姓名</th>
            <th class="thSortableGray" >性别</th>
            <th class="thSortableGray" >学员类型</th>
            <th class="thSortableGray" >所属公司</th>
            <th class="thSortableGray" >学生状态</th>
            <th class="thSortableGray" >学籍状态</th>
            <th class="thSortableGray" >停飞批准日期</th>
            <th class="thSortableGray" >返校日期</th>
            <th class="thSortableGray" ></th>
          </tr>   
        </thead>
        <tbody>
        <s:iterator value="page.data" status="stat">

          <tr>
            <td><input name="checkboxName" type="checkbox" value="${VId};${VCode};${VName}"  <s:if test='selIds!=null && selIds.indexOf(VId)!=-1'>checked="checked"</s:if>><b></b></td>
            <td >${VCode}</td>
            <td>${VName}</td>
            <td>${VGender}</td>
            <td>${stuTypeName}</td>
            <td>${companyName}</td>
            <td>${stuStatusName}</td>
            <td>${xjStatusName}</td>
            <td>${createTime}</td>
            <td>${xxlx}</td>
            <td></td>
            
          </tr>
          </s:iterator>
         <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
          <tr>
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
    </table><s:include value="../common/pagination_system_sel.jsp" />
</div>
</div>
</div>
</div>

<div id="wanchengDialog"  title="正常完成训练">
<fieldset>
<br/>
<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td width="28%" align="right">完成训练日期：<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/></td>
    <td width="72%"><input type="text"  id="cDFinishtime" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDFinishtime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
  </tr>

  <tr>
    <td align="right">返校日期：</td>
    <td><input type="text"  id="cDBackschooltime" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDBackschooltime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
</table>
</fieldset>
</div>

<div id="tingfeiDialog"  title="停飞">
<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>
<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td width="28%" align="right">停飞批准日期：</td>
    <td width="72%"><input type="text"  id="cDStopflytime" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDStopflytime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">停飞原因：</td>
    <td><textarea  id="cVStopflyreason" style="width:260px;height:100px;" class="text ui-widget-content ui-corner-all"></textarea></td>
  </tr>

</table>
</div>

<div id="fanxiaoDialog"  title="派回学校">
<fieldset><br><input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>

返校日期： 
<input type="text"  id="cDBackschooltime2" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDBackschooltime2:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" />
</fieldset>
</div>

<div id="tingfeilixiaoDialog"  title="停飞离校">
<fieldset><br><input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>
离校日期： 
<input type="text"  id="cDOffschooltime" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDOffschooltime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" />
</fieldset>
</div>
<div id="dialogForm3">
  <fieldset>
     <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
      </tr>
    </table>
  </fieldset>
</div>

<s:include value="../student/advancedSearchDialog.jsp" />

<div id="tingfeixuejiDialog"  title="停飞学籍管理">

<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td width="28%" align="right">改变日期：<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/></td>
    <td width="72%"><input type="text"  id="cDChangedtime" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDChangedtime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">学籍状态：</td>
    <td style="line-height:23px;">
        <s:iterator value="dictionXjList">
        <div style="width:110px; float:left "><input name="tingfeixuejiName" type="radio" value="${VId}"/><b></b>${VName}</div>
        </s:iterator></td>
  </tr>
 
</table>
</div>

<form id="addForm" method="post" action="saveStudentFinishTraining.do">
<input type="hidden"  name="finish.studentBaseInfo.VId" id="studentid">
<input type="hidden"  name="finish.DFinishtime" id="sDFinishtime">
<input type="hidden"  name="finish.DBackschooltime" id="sDBackschooltime">
</form>

<form id="stopForm" method="post" action="saveStudentStopFly.do">
<input type="hidden"  name="stopFly.studentBaseInfo.VId" id="studentid2">
<input type="hidden"  name="stopFly.DStopflytime" id="sDStopflytime">
<input type="hidden"  name="stopFly.VStopflyreason" id="sVStopflyreason">
</form>

<form id="backForm" method="post" action="saveStudentBackSchool.do">
<input type="hidden"  name="finish.studentBaseInfo.VId" id="studentid3">
<input type="hidden"  name="finish.DBackschooltime" id="sDBackschooltime2">
</form>

<form id="xjForm" method="post" action="saveStopFlyXjManage.do">
<input type="hidden"  name="xueJi.studentBaseInfo.VId" id="studentid4">
<input type="hidden"  name="xueJi.TDictionByVNewstatusid.VId" id="sNewstatusid">
<input type="hidden"  name="xueJi.DChangedtime" id="sDChangedtime">
</form>

<form id="lxForm" method="post" action="saveStudentStopFlyOffSchool.do">
<input type="hidden"  name="off.studentBaseInfo.VId" id="studentid5">
<input type="hidden"  name="off.DOffschooltime" id="sDOffschooltime">
</form>

<input type="hidden"  name="selIds" value="${selIds}" id="selSid">
<input type="hidden" id="selectStudentNameAndCode">
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm3Warning").html(operateResult);
		$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
	}
});
function gotoPage(pageIndex){
	var pageIndex=pageIndex<1?1:pageIndex;
	var url = location.protocol + '//' + location.host + location.pathname;
	var args = location.search;

	args=removeURLArgument(args,"statusMsg");
	args = setURLArgs(args,'pageIndex',pageIndex);
	args = setURLArgs(args,'selIds',$("#selSid").val());//参数可以增加
	if (orderBy!="")
		args = setURLArgs(args,'orderBy',orderBy);
	if (orderType!="")
		args = setURLArgs(args,'orderType',orderType);
	if(args.indexOf("?")!=-1 && args.indexOf("&")!=-1){

		if(1==args.indexOf("&")-args.indexOf("?")){
			var a = args.substring(0,args.indexOf("?")+1);
			var b = args.substring(args.indexOf("?")+2,args.length);
			args = a+b;
		}
	
	}
	self.location.href = url+args;
}
</script>