<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>实践考试</title>
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
.imgs{cursor:pointer;}
</style>
<script>

$(function() {
	$("div.dropDownList").find("button").css("width","112px").end().each(function(i){
	
		if(i==0){var d=new $.dropDownList(i,true,400);d.button.css("width", "400px");}

		else{new $.dropDownList(i,true,112);}

	})
	//var svalue = $("#selSid").val();
	var $checkboxes=$("input[name='checkboxName']"),$checkAllUsersBox=$("#checkAllUsersBox");
	$checkboxes.change(function(){
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
		if($checkboxes.size()==$checkboxes.filter(":checked").size()) $checkAllUsersBox[0].checked=true;
		$checkAllUsersBox.trigger("change");
		
	});
	$checkAllUsersBox.click(function(){
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

	$("#modalDialogButton6").click(function(){//查询
		if($("#searchOutlineName").val()=="姓名/学号"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($("#searchOutlineName").val());
		}
		$( "#searchForm" ).submit();
	});
	
	$("#modalDialogButton3").click(function(){//已推荐
		$("#tuijian").val(1);
		$( "#searchForm" ).submit();
	});
	
	$("#modalDialogButton4").click(function(){//未推荐
		$("#tuijian").val(0);
		$( "#searchForm" ).submit();
	});
	
	$("#modalDialogButton5").click(function(){//全部
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});
	function getnum(str){
		$("#selectIdSum").html(str.split(",").length-1);	
	}
	getnum($("#selSid").val());
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
	
	$( "#tuijianDialog" ).dialog({//推荐
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				var cDCreatedate = $.trim($("#cDCreatedate").val());
				if(cDCreatedate==""){
					alert("推荐时间不能为空。");
					$("#cDCreatedate").focus();
					return;
				}
				$("#sDCreatedate").val(cDCreatedate);
				
				$("#assignForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#askDialog" ).dialog({//申请
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				var cDCreatedate = $.trim($("#cDCreatedate2").val());

				if(cDCreatedate==""){
					alert("申请时间不能为空。");
					$("#cDCreatedate2").focus();
					return;
				}
				
				var cVName = $.trim($("#cVName").val());
				if(cVName=="" && $("#cVId").val()==""){
					alert("考试标题不能为空。");
					$("#cVName").focus();
					return;
				}
				$("#sVName").val(cVName);
				var cVContent = $.trim($("#cVContent").val());
				if(cVContent=="" && $("#cVId").val()==""){
					alert("考试内容不能为空。");
					$("#cVContent").focus();
					return;
				}
				if($("#cVId").val()!=""){
					$("#sVId").val($("#cVId").val());
				}
				$("#sVContent").val(cVContent);
				
				$("#sDCreatedate2").val(cDCreatedate);

				$("#askForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("#esctuijianButton").click(function(){//取消推荐
	
		var ids = $("#selSid").val();
		if(ids==""){
			$("#dialogForm3Warning").html("请选择要取消推荐的学员。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}

		var str="";
		var cn = "";
		var flag=0;
		var r1=ids.split(",");
		for(i=0;i<r1.length-1;i++){
			str+=r1[i].split(";")[0] + ",";
			cn+=r1[i].split(";")[1]+";" + r1[i].split(";")[2] + ",";
			if(r1[i].split(";")[3]!=1){
				flag++;	
			}
		}
		if(flag>0){
			$("#dialogForm3Warning").html("选择的学员不全是已推荐，请重新选择。");
			$( "#dialogForm3" ).dialog( "open" );
			return;	
		}
		if(str==""){
			$("#dialogForm3Warning").html("请选择要取消推荐的学员。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}	
		$("#escstudentid").val(str);
		$("#escTuijianForm").submit();
	});
	
	$("#askExamButton").click(function(){

		var ids = $("#selSid").val();
		if(ids==""){
			$("#dialogForm3Warning").html("请选择学员申请考试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}

		var str="";
		var cn = "";
		var flag=0;
		var r1=ids.split(",");
		for(i=0;i<r1.length-1;i++){
			str+=r1[i].split(";")[0] + ",";
			cn+=r1[i].split(";")[1]+";" + r1[i].split(";")[2] + ",";
			if(r1[i].split(";")[3]!=1){
				flag++;	
			}
		}
		if(flag>0){
			$("#dialogForm3Warning").html("选择的学员不全是已推荐，请重新选择。");
			$( "#dialogForm3" ).dialog( "open" );
			return;	
		}
		if(str==""){
			$("#dialogForm3Warning").html("请选择学员。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		
		var content = "";
		var stus = cn.split(",");
		for(j=0;j<stus.length-1;j++){
			content+="<a href=\"#N\" class=\"inline\" title=\"学号："+stus[j].split(";")[0]+
			"\" style=\"width: 60px; border:0\">"+ stus[j].split(";")[1] + "</a>";
		}

		$("#selectStudentNameAndCodeid2").html(content);
		$("#sVBz").val(str);
		$( "#askDialog" ).dialog( "open" );
		/*
		var content = "";
		params = {};
		$.ajax({
			//async:false,//同步请求，默认异步
			type:"post",
			url:"showRecommendExamAllNoAskStudentList.do",
			data:params,
			dataType:"json",
			success:function(data){

				if(data==null || data==""){
					$("#dialogForm3Warning").html("目前没有推荐的学生，不能申请考试。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				for(j=0;j<data.length;j++){
					content+="<a href=\"#N\" class=\"inline\" title=\"学号："+data[j].VCode+"\" style=\"width: 60px; border:0\">"+ data[j].VName + "</a>";
		}
				$("#selectStudentNameAndCodeid2").html(content);
				$( "#askDialog" ).dialog( "open" );
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		*/
	});
	
	$("#tuijianButton").click(function(){//推荐

		var ids = $("#selSid").val();
		if(ids==""){
			$("#dialogForm3Warning").html("请选择要推荐的学员。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}

		var str="";
		var cn = "";
		var flag=0;
		var r1=ids.split(",");
		for(i=0;i<r1.length-1;i++){
			str+=r1[i].split(";")[0] + ",";
			cn+=r1[i].split(";")[1]+";" + r1[i].split(";")[2] + ",";
			if(r1[i].split(";")[3]!=0){
				flag++;	
			}
		}
		if(flag>0){
			$("#dialogForm3Warning").html("选择的学员不全是未推荐，请重新选择。");
			$( "#dialogForm3" ).dialog( "open" );
			return;	
		}
		if(str==""){
			$("#dialogForm3Warning").html("请选择学员。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		
		var content = "";
		var stus = cn.split(",");
		for(j=0;j<stus.length-1;j++){
			content+="<a href=\"#N\" class=\"inline\" title=\"学号："+stus[j].split(";")[0]+
			"\" style=\"width: 60px; border:0\">"+ stus[j].split(";")[1] + "</a>";
		}

		$("#selectStudentNameAndCodeid").html(content);
		$("#studentid").val(str);
		$( "#tuijianDialog" ).dialog( "open" );
		//$("#studentid").val($("#selSid").val());
		/*
		var content = "";
		params = {"studentid":optStr};
		$.ajax({
			//async:false,//同步请求，默认异步
			type:"post",
			url:"showRecommendExamStudentList.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data==null){
					alert("请选择推荐的学生。");
					return;
				}
				for(j=0;j<data.length;j++){
					content+="<a href=\"#N\" class=\"inline\" title=\"学号："+data[j].VCode+"\" style=\"width: 60px; border:0\">"+ data[j].VName + "</a>";
		}
				$("#selectStudentNameAndCodeid").html(content);
				$( "#tuijianDialog" ).dialog( "open" );
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		*/
		
	});
});


</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149b5bb20001</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

<div class="panelBox buttonBox" ><%request.setAttribute("k",ActionContext.getContext().getName());%>
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
<button class="green" primary="ui-icon-button-addnew" id="tuijianButton">推荐</button>
<button class="green" primary="ui-icon-button-addnew" id="esctuijianButton">取消推荐</button>
<button class="green" primary="ui-icon-button-addnew" id="askExamButton">申请考试</button>
</s:if>
<button class="normal barLeft" id="modalDialogButton0">完成训练且科目合格</button>
<button class="normal barMiddle" id="modalDialogButton1">完成训练</button>
<button class="normal barMiddle" id="modalDialogButton2">科目合格</button>
<button class="normal barMiddle" id="modalDialogButton3">已推荐</button>
<button class="normal barMiddle" id="modalDialogButton4">未推荐</button>
<button class="normal barRight" id="modalDialogButton5">全部</button>
     <div class="buttonInput relative left" width="150" height="28">
    <input id="searchOutlineName" title="姓名/学号"  name="searchOutlineName"  type="text" maxlength="50" value="姓名/学号" /><button id="modalDialogButton6">查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3">
        	<thead>
			  <tr>
                <th width="50" height="28"><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
                <th width="100">学号</th>
                <th width="50">姓名</th>
                <th width="40">性别</th>
                <th width="60">学员类型</th>
                <th width="90">所属公司</th>
                <th width="90">学籍状态</th>
                <th width="60">招生形式</th>
                <th width="60">自费/公费</th>
                <th><div align="left">推荐</div></th>
			  </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
			  <tr>
              	<td align="center"><input name="checkboxName" type="checkbox" value="${VId};${VCode};${VName};${ITjexam}" <s:if test='selIds!=null && selIds.indexOf(VId)!=-1'>checked="checked"</s:if> ><b></b></td>
				<td align="center">${VCode}</td>
				<td align="center">${VName}</td>
				<td align="center">${VGender}</td>
                <td align="center">${stuTypeName}</td>
                <td align="center">${companyName}</td>
                <td align="center">${xjStatusName}</td>
                <td align="center">${formName}</td>
                <td align="center">${freeTypeName}</td>
				<td align="left"><s:if test='ITjexam==0'>未推荐</s:if><s:if test='ITjexam==1'>已推荐</s:if>
                <s:if test='ITjexam==2'>已申请</s:if></td>
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
			  </tr>
              </s:iterator>
			</tbody>
		</table><s:include value="../common/pagination_system_sel.jsp" />
</div>
</div>
</div>
</div>
<div id="dialogForm3">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="right" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="80%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</div>

<div id="tuijianDialog"  title="实践考试推荐">

	<div style="line-height:30px; float: left">已选学员：<input type="text" name="vfocusn" style="width:0px; height:0px; border:0px;"/></div>
	<div style="line-height:30px; margin-left:60px;" id="selectStudentNameAndCodeid"></div>
   	<span class="panelLine"></span>
	推荐时间： <input type="text"  id="cDCreatedate" class="Wdate ui-widget-content ui-corner-all text"  style="width:140px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${viewDate}"  onKeyPress="return false" onpaste="return false"  />
</div>

<div id="askDialog"  title="实践考试申请">

	<div style="line-height:30px; float: left">已选学员：<input type="text" name="vfocusn" style="width:0px; height:0px; border:0px;"/></div>
	<div style="line-height:30px; margin-left:60px;" id="selectStudentNameAndCodeid2"></div>
   	<span class="panelLine"></span>
	申请时间： <input type="text"  id="cDCreatedate2" class="Wdate ui-widget-content ui-corner-all text"  style="width:140px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${viewDate}"  onKeyPress="return false" onpaste="return false"  /><s:if test="askList.size()>0">
    <span class="panelLine"></span>
    选择考试：<div class="dropDownList">
            <button>请选择</button>
            <ul>
            <li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
            <s:iterator value="askList">
            <li><a href="#N" val="${VId}">${VName}</a></li>
            </s:iterator>
            </ul>
      		<input type="hidden" id="cVId" value="" />
   		 </div>
     </s:if>
    <span class="panelLine"></span>
	<div style="float: left">考试标题： </div>
    <input  id="cVName" style="width:390px;" class="text ui-widget-content ui-corner-all"/>
    <span class="panelLine"></span>
	<div style="float: left">考试内容： </div>
    <textarea  id="cVContent" style="width:396px;height:200px;" class="text ui-widget-content ui-corner-all"></textarea>
</div>

<form  action="open_practiceTest.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey" value="${name}">
<input name="tuijian" type="hidden" id="tuijian">
</form>

<form  action="escPracticeTest.do" method="post" id="escTuijianForm">
<input name="test.studentBaseInfo.VId" type="hidden" id="escstudentid">
</form>

<form  action="savePracticeTest.do" method="post" id="assignForm">
<input name="test.studentBaseInfo.VId" type="hidden" id="studentid">
<input name="test.DCreatedate" type="hidden" id="sDCreatedate">
</form>

<form  action="savePracticeAsk.do" method="post" id="askForm">
<input name="ask.VId" type="hidden" id="sVId">
<input name="ask.DAskTime" type="hidden" id="sDCreatedate2">
<input name="ask.VContent" type="hidden" id="sVContent">
<input name="ask.VName" type="hidden" id="sVName">
<input name="ask.VBz" type="hidden" id="sVBz">
</form>
<input type="hidden"  name="selIds" value="${selIds}" id="selSid">
<input type="hidden"  id="selLessons"/>
<input type="hidden"  id="selPhases"/>
<input type="hidden"  id="selUnits"/>
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