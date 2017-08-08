<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>加时加课申请</title>
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

	
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchOutlineName").val()=="姓名/学号"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($("#searchOutlineName").val());
		}
		$( "#searchForm" ).submit();
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
	
	$( "#addLessonDialog" ).dialog({//加课申请
		autoOpen: false,
		height: 400,
		width: 800,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				var cDCreatedate = $.trim($("#cDCreatedate").val());
				if(cDCreatedate==""){
					alert("申请时间不能为空。");
					$("#cDCreatedate").focus();
					return;
				}
				
				var str="";
				var r1=document.getElementsByName("lessonName");
				for(i=0;i<r1.length;i++){
					if(r1[i].checked==true){
						str+=r1[i].value + ",";
					}
				}

				$("#slessonid").val(str);
				if(str==""){
					alert("请选择课程。");
					return;
				}
				$("#sDCreatedate").val(cDCreatedate);
				$("#sDDuration").val(0);
				$("#assignForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#assignOutlineDialog" ).dialog({//加时
		autoOpen: false,
		height: 300,
		width: 480,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var cDDuration = $.trim($("#cDDuration").val());
				if(cDDuration==""){
					alert("加时时长不能为空。");
					$("#cDDuration").focus();
					return;
				}
				var v= cDDuration;

				v = v.replace(":","");
				if(isNaN(v)){
					alert("请输入正确的时间格式：如1:30代表1小时30分钟。");
					$("#cDDuration").focus();
					return;
				}

				
				var cDCreatedate = $.trim($("#cDCreatedate").val());
				if(cDCreatedate==""){
					alert("申请时间不能为空。");
					$("#cDCreatedate").focus();
					return;
				}
				if(cDDuration.indexOf(":")==-1){
					$("#sDDuration").val(cDDuration*60);
				}else{
					$("#sDDuration").val(cDDuration.split(":")[0]*60 + parseInt(cDDuration.split(":")[1]));
				}
				$("#sDCreatedate").val(cDCreatedate);
				$("#assignForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});


	function checkNum(str){ //数字
		return str.match(/\D/)==null 
	}
	$("#assignOutlineButtonLesson").click(function(){
		
		var optStr = getSelRadioValue('checkboxName');
		if(optStr==""){
			$("#dialogForm3Warning").html("请选择学员。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}

		var r1=optStr.split(";");
		var content = "";
		$("#selLessons").val("");
		$("#selPhases").val("");
		$("#selUnits").val("");
		$("#slessonid").val("");
		var lessonss=document.getElementsByName("lessonName");
		for(i=0;i<lessonss.length;i++){
			lessonss[i].checked=true;
			lessonss[i].click();
		}
		$("#unit1").css("display","none");
		$("#sIType").val(1);
		$("#studentid").val(r1[0]);
		
		content+=r1[1]+" -- "+r1[2];
		$("#selectStudentNameAndCodeid2").html(content);
		
		//根据学号获取分配大纲
		params = {"studentid":r1[0]};
		
		$.ajax({
			//async:false,//同步请求，默认异步
			type:"post",
			url:"showOutlineInfoByStudentId.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data==null){
					alert("该学尚未分配大纲，不具备加课条件。");
					return;
				}
				var os = "";
				os+="<tr>";
				os+="<td width=\"60\">选择课程：</td>";

				os+="<td align=\"center\" width=\"20\"><img src=\"themes/cupertino/images/jiahao.gif\" class=\"imgs\" ";
				os+="id=\""+ data.VId + "-0-1-"+ r1[1] +"\" ";
				os+="onclick=\"execDot('"+data.VId + "-0-1-"+ r1[1] +"')\"/>";
				os+="</td>";
				os+="<td>&nbsp;"+data.VName+"</td>";
				os+="</tr>";
				
				$("#outline").html(os);
				$( "#addLessonDialog" ).dialog( "open" );
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
				
	});
	$("#assignOutlineButton").click(function(){//加时申请
		execAssgin(getSelRadioValue('checkboxName'));
	});
	
	function execAssgin(optStr){//分配大纲
		if(optStr==""){
			$("#dialogForm3Warning").html("请选择学员。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#cDDuration").val("");
		var r1=optStr.split(";");
		var content = "";
		
		$("#sIType").val(0);//加时
		$("#studentid").val(r1[0]);
		
		content+=r1[1]+" -- "+r1[2];
		$("#selectStudentNameAndCodeid").html(content);
		$( "#assignOutlineDialog" ).dialog( "open" );
	}

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

<div class="panelBox buttonBox" >
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
<button class="green" primary="ui-icon-button-addnew" id="assignOutlineButton">加时申请</button>
<button class="green" primary="ui-icon-button-addnew" id="assignOutlineButtonLesson">加课申请</button>
</s:if>
<div class="buttonInput relative left" width="150" height="28">
    <input id="searchOutlineName" title="姓名/学号"  name="searchOutlineName"  type="text" maxlength="50" value="姓名/学号" /><button id="modalDialogButton4">查询</button>
</div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3">
        	<thead>
			  <tr>
                <th width="50" height="28"><!--<input id="checkAllUsersBox" type="checkbox"/><b></b>-->选项</th>
                <th width="100">学号</th>
                <th width="50">姓名</th>
                <th width="40">性别</th>
                <th width="60">学员类型</th>
                <th width="90">所属公司</th>
                <th width="90">学籍状态</th>
                <th width="60">招生形式</th>
                <th width="60">自费/公费</th>
                <th width="40">加时</th>
                <th><div align="left">&nbsp;加课</div></th>
			  </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
			  <tr>
              	<td align="center"><input name="checkboxName" type="radio" value="${VId};${VCode};${VName}"><b></b></td>
				<td align="center">${VCode}</td>
				<td align="center">${VName}</td>
				<td align="center">${VGender}</td>
                <td align="center">${stuTypeName}</td>
                <td align="center">${companyName}</td>
                <td align="center">${xjStatusName}</td>
                <td align="center">${formName}</td>
                <td align="center">${freeTypeName}</td>
                <td align="center">${addHours}</td>
				<td align="left">
                <s:iterator value="addLessonList">
                ${VNo}--${VName}<br/>
                </s:iterator>
                </td>
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
		</table><s:include value="../common/pagination_system.jsp" />
</div>
</div>
</div>
</div>
<div id="dialogForm3">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</div>

<div id="assignOutlineDialog"  title="加时申请">

	<div style="line-height:30px; float: left">已选学员：<input type="text" name="vfocusn" style="width:0px; height:0px; border:0px;"/></div>
	<div style="line-height:30px; margin-left:60px;" id="selectStudentNameAndCodeid"></div>
    <span class="panelLine"></span>
	加时时长： <input id="cDDuration" type="text" class="text ui-widget-content ui-corner-all" onMouseDown="deletebMF('cDDuration')" onBlur="viewLongTime('cDDuration')"  style="width:140px;"/>
	<span class="panelLine"></span>
	申请时间： <input type="text"  id="cDCreatedate" class="Wdate ui-widget-content ui-corner-all text"  style="width:140px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${viewDate}"  onKeyPress="return false" onpaste="return false"  />
    <span class="panelLine"></span>

</div>

<div id="addLessonDialog"  title="加课申请">

	<div style="line-height:35px; float: left">已选学员：<input type="text" name="vfocusn" style="width:0px; height:0px; border:0px;"/></div>
	<div style="line-height:35px; margin-left:60px;" id="selectStudentNameAndCodeid2"></div>
    <span class="panelLine"></span>
	申请时间： <input type="text"  id="cDCreatedate" class="Wdate ui-widget-content ui-corner-all text"  style="width:140px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d HH:mm:ss',dateFmt:'yyyy-MM-dd HH:mm:ss'})" value="${viewDate}"  onKeyPress="return false" onpaste="return false"  />
    <span class="panelLine"></span>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="line-height:26px;">
<tbody id="outline">
</tbody>
<tr>
<td colspan="3">
<table width="100%" border="0" cellspacing="0" cellpadding="0" id="unit1"  style="display:none;line-height:26px;">
</table>
</td>
</tr>
</table>

</div>


<form  action="addHoursAndAddLesson.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey" value="${name}">
</form>

<form  action="saveAddHoursAndAddLesson.do" method="post" id="assignForm">
<input name="add.TTrainingLesson.VId" type="hidden" id="slessonid">
<input name="add.studentBaseInfo.VId" type="hidden" id="studentid">
<input name="add.IType" type="hidden" id="sIType">
<input name="add.DDuration" type="hidden" id="sDDuration">
<input name="add.DCreatedate" type="hidden" id="sDCreatedate">
</form>
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

function execDot(ids){

	var str = ids;//id，类型，数量，学号；
	var id = str.split("-")[0];	
	var level = str.split("-")[1];
	var num = str.split("-")[2];
	var code = str.split("-")[3];
	var os = "";

	if(level==0){//大纲
		os="";
		var stra = $("#selUnits").val();
		if(stra.indexOf(id)!=-1){
			if($("#unit1")[0].style.display==''){
				$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
				$("#unit1")[0].style.display='none';
			}else{
				$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
				$("#unit1")[0].style.display='';	
			}
			return;	
		}
		$("#selUnits").val(stra+id);
		//获取大纲单元
		params = {"outlineid":id,"studentCode":code};
		$.ajax({
			async:false,//同步请求，默认异步
			type:"post",
			url:"showAddHoursAndAddLessonUnitListByOutlineId.do",
			data:params,
			dataType:"json",
			success:function(data){
				for(i=0;i<data.length;i++){
					os+="<tr>";
					os+="<td width=\"60\"></td>";
					if(data[i].isChild==0){
						os+="<td width=\"33\"></td>";
					}else{
						os+="<td align=\"right\" width=\"33\"><img src=\"themes/cupertino/images/jiahao.gif\" class=\"imgs\" ";
						os+="id=\""+ data[i].VId + "-1-"+(i+1)+"-"+ code +"\" ";
						os+="onclick=\"execDot('"+data[i].VId + "-1-"+(i+1)+"-"+ code +"')\"/>";
						os+="</td>";
					}
					os+="<td>&nbsp;&nbsp;"+data[i].VName+"</td>";
					os+="</tr>";

					os+="<tr>";
					os+="<td colspan=\"3\">";
					os+="<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"";
					os+=" style=\"display:none\" id=\"phase"+data[i].VId + code+"\">";
					os+="</table>";
					os+="</td>";
					os+="</tr>";
				}
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});

		$("#unit1").html(os);
		if($("#unit1")[0].style.display==''){
			$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
			$("#unit1")[0].style.display='none';
		}else{
			$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
			$("#unit1")[0].style.display='';
		}
	}
	if(level==1){//单元
		//获取单元阶段
		var stra = $("#selPhases").val();
		if(stra.indexOf(id)!=-1){
			if($("#phase" + id+code)[0].style.display==''){
				$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
				$("#phase" + id+code)[0].style.display='none';
			}else{
				$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
				$("#phase" + id+code)[0].style.display='';	
			}
			return;	
		}
		$("#selPhases").val(stra+id);
		os = "";
		params = {"unitid":id,"studentCode":code};
		$.ajax({
			async:false,//同步请求，默认异步
			type:"post",
			url:"showAddHoursAndAddLessonPhaseListByUnitId.do",
			data:params,
			dataType:"json",
			success:function(data){
				for(i=0;i<data.length;i++){
					
					os+="<tr>";
					os+="<td width=\"60\"></td>";
					if(data[i].isChild==0){
						os+="<td width=\"50\"></td>";
					}else{
						os+="<td width=\"50\" align=\"right\"><img src=\"themes/cupertino/images/jiahao.gif\"";
						os+=" class=\"imgs\" id=\""+data[i].VId + "-2-" +(i+1) + "-" + code+"\"";
						os+=" onclick=\"execDot('"+data[i].VId + "-2-" +(i+1) + "-" + code +"')\"/></td>";
					}
					os+="<td>&nbsp;&nbsp;"+data[i].VName +"</td>";
					os+="</tr>";
					os+="<tr>";
					os+="<td colspan=\"3\">";
					os+="<table border=\"0\" cellspacing=\"0\" cellpadding=\"0\"";
					os+=" style=\"display:none;line-height:26px;\" id=\"lesson"+data[i].VId + code+"\">";
					os+="</table>";
					os+="</td>";
					os+="</tr>";
				}
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});

		$("#phase" + id+code).html(os);
		
		if($("#phase" + id+code)[0].style.display==''){
			$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
			$("#phase" + id+code)[0].style.display='none';
		}else{
			$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
			$("#phase" + id+code)[0].style.display='';	
		}
		
	}
	if(level==2){//阶段
		os = "";
		var stra = $("#selLessons").val();
		if(stra.indexOf(id)!=-1){
			if($("#lesson" + id+code)[0].style.display==''){
				$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
				$("#lesson" + id+code)[0].style.display='none';
			}else{
				$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
				$("#lesson" + id+code)[0].style.display='';	
			}
			return;	
		}
		$("#selLessons").val(stra+id);
		params = {"phaseid":id,"studentCode":code};
		$.ajax({
			async:false,//同步请求，默认异步
			type:"post",
			url:"showAddHoursAndAddLessonLessonListByPhaseId.do",
			data:params,
			dataType:"json",
			success:function(data){
				var p = 0;
				for(i=0;i<data.length;i++){
					
					if(p==0){
						os+="<tr><td width=\"120\"></td>";
					}
					os+="<td width=\"70\" title=\""+data[i].VName+"\">";
					os+="<input type=\"checkbox\" value=\""+data[i].VId+"\" name=\"lessonName\"><b></b>"+data[i].VCode+"</td>";
					p++;
					
					if(p>=9){
						p=0;
						os+="<td></td></tr>";
					}
					
				}
				
				if(p<9 && p>0){
					for(j=0;j<9-p;j++){
						os+="<td></td>";
					}
					os+="</tr>";
				}
				

			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});

		$("#lesson" + id+code).html(os);
		execbase();
		if($("#lesson" + id+code)[0].style.display==''){
			$("#" + str).attr("src","themes/cupertino/images/jiahao.gif");
			$("#lesson" + id+code)[0].style.display='none';
		}else{
			$("#" + str).attr("src","themes/cupertino/images/jianhao.gif");
			$("#lesson" + id+code)[0].style.display='';	
		}
	}
}
/*
var isWrite  = $("#isWrite").val();
if(isWrite==0){
	$("#assignOutlineButton").css('display','');
	$("#assignOutlineButtonLesson").css('display','');
}else{
	$("#assignOutlineButton").css('display','none');
	$("#assignOutlineButtonLesson").css('display','none');
}*/
</script>