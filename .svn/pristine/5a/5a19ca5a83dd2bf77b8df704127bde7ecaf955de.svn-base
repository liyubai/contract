<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>成绩管理</title>
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
	$("div.dropDownList").each(function(i){
		if(i==0){var d=new $.dropDownList(i,true,140);d.button.css("width", "65px");}
		else if(i==1){var d=new $.dropDownList(i,true,85);d.button.css("width", "85px");}
		else if(i==2){var d=new $.dropDownList(i,true,90);d.button.css("width", "85px");}
		else if(i==3){var d=new $.dropDownList(i,true,335);d.button.css("width", "110px");}
		else if(i==4){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==5){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==6){var d=new $.dropDownList(i,true,90);d.button.css("width", "85px");}
		else if(i==7){var d=new $.dropDownList(i,true,90);d.button.css("width", "90px");}
		else if(i==8){var d=new $.dropDownList(i,false,250);d.button.css("width", "75px");}
		
		else if(i==9){var d=new $.dropDownList(i,true,110);d.button.css("width", "110px");}
		else if(i==10){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==11){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==12){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==13){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==14){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
			
		else{new $.dropDownList(i,true,110);}

	});

	$("#addnewButton").click(function(){
		/*
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#studentid").val($("#selSid").val());
		*/
		$("#optid").val(1);
		$( "#lessonDialog" ).dialog("open");
	});
	$("#addoldButton").click(function(){
		/*
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#studentid").val($("#selSid").val());
		*/
		$("#optid").val(2);
		$( "#lessonDialog" ).dialog("open");
	});
	$("#submitButton").click(function(){
		//if($("#selSid").val()==""){
		//	alert("请选择学生。");
		//	return;
		//}
		//$("#auditstudentid").val($("#selSid").val());
		$( "#auditlessonDialog" ).dialog("open");
	});
	$("#importButton").click(function(){
		
		$( "#importlessonDialog" ).dialog("open");
	});
	$( "#lessonDialog" ).dialog({
		autoOpen: false,
		height: 480,
		width: 680,
		modal: true,
		resizable: false,
		buttons: {
			"下一步": function() {
				
				var className = getSelRadioValue('className');
				if(className==""){
					alert("请选择班级。");
					return;
				}
				$("#sclassid").val(className.split(";")[0]);
				$("#sclassName").val(className.split(";")[1]);
				
				var lessons = getSelRadioValue('lessonCheckName');
				if(lessons==""){
					alert("请选择课程。");
					return;
				}
				$("#slessonid").val(lessons.split(";")[0]);
				$("#slessonName").val(lessons.split(";")[1]);
				$("#sisView").val(getSelRadioValue('viewName'));
				$("#sexamTime").val($("#cDExamTime").val());
				$("#addLessonForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#auditlessonDialog" ).dialog({
		autoOpen: false,
		height: 400,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var lessons = getSelValue('auditCheckName');
				if(lessons==""){
					alert("请选择提交审核的课程。");
					return;
				}

				$("#auditclassid").val(lessons);
				$("#auditLessonForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#importlessonDialog" ).dialog({
		autoOpen: false,
		height: 280,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
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
	$( "#eidtLessonDialog" ).dialog({
		autoOpen: false,
		height: 260,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#editisAssignid").val($("#cxmoreid").val());
				$("#scoreid").val($("#cscoreid").val());
				$("#editScoreForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	
});
function showEditDiaLog(id,score,lessonname,code,name){
	$("#cscoreid").val(score);
	$("#sid").val(id);
	$("#lename").html(lessonname);
	
	$("#codeid").html(code);
	$("#nameid").html(name);
	$("#eidtLessonDialog").dialog( "open" );
}
function deleteLessonScore(id){

	window.location.replace("deleteLessonScore.do?id=" + id + "&itype=" +
	 $("#citype").val()+"&isAssignid="+$("#cxmoreid").val() + "&pageIndex=" + $("#pageIndex").val());
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4a9df179014a9e3beb0c0003</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%>.do?itype=${itype}</s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>
<%request.setAttribute("k",ActionContext.getContext().getName());%>
<s:if test="#session.loginContext.urlAddress=='all'">
	<s:set name="r" value="0"/>
</s:if>
<s:else>
	<s:set name="pos" value="#session.loginContext.urlAddress.indexOf(#request.k+'.do?itype='+itype)"/>
	<s:if test='#pos==-1'>
		<s:set name="r" value="1"/>
    </s:if>
    <s:else>
		<s:set name="r" value="#session.loginContext.urlAddress.substring(#pos+#request.k.length()+14,#pos+#request.k.length()+15)"/>
    </s:else>
</s:else>
<s:if test="#r==null || #r==0">
<div class="panelBox buttonBox" style="padding-bottom:10px; padding-left:3px;" >
<button class="green"  id="addnewButton">录入新成绩</button>
<button class="green"  id="addoldButton">录入补考成绩</button>
<button class="green"  id="submitButton">提交审核</button>
<!--<button class="green"  id="importButton">批量导入学生成绩</button>-->
</div></s:if>
<div class="panelBox buttonBox" >
<s:include value="../student/banner.jsp" />
<div class="dropDownList barMiddle">
        <s:set name="eisAssignid" value="isAssignid"/>
        <s:if test="isAssignid==null || isAssignid==''"><s:set name="eisAssignid" value="1"></s:set></s:if>
        <button>更多</button><span class="bar"></span>
        <ul>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=1&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="1"><span class="ui-icon ui-icon-bullet"></span>更多</a></li>
            <s:iterator value="trainingClassList">
<li><a href="?year=${year}&classNo=${classNo}&isAssignid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="${VId}">${VName}</a></li>
</s:iterator>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=4&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="4">有补考</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=5&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="5">无补考</a></li>
             <!--<li><a href="?year=${year}&classNo=${classNo}&isAssignid=7&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="7">审批通过</a></li>
              <li><a href="?year=${year}&classNo=${classNo}&isAssignid=8&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="8">未提交审批</a></li>
               <li><a href="?year=${year}&classNo=${classNo}&isAssignid=7&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="7">待审批</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=10&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="10">审批未通过</a></li>-->
               
               <li><a href="?year=${year}&classNo=${classNo}&isAssignid=11&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="11">合格</a></li>    
               
               <li><a href="?year=${year}&classNo=${classNo}&isAssignid=12&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="12">不合格</a></li> 
                <li><a href="?year=${year}&classNo=${classNo}&isAssignid=13&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="13">审核通过</a></li>    
                <li><a href="?year=${year}&classNo=${classNo}&isAssignid=14&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="14">审核未通过</a></li>  
            <li><a href="?isAssignid=6"  val="6">全部</a></li>
        </ul><input type="hidden"  id="cxmoreid" value='<s:property value="#eisAssignid" />'/>
    </div>
 	<button class="normal barRight" id="advancedDialogButton">高级查询</button>
     <div class="buttonInput relative left" width="140" height="28">
    <input id="searchOutlineName" title="学号/姓名"  name="searchOutlineName"  type="text" maxlength="50" value="学号/姓名" /><button id="modalDialogButton4">查询</button>
    </div>

</div>


<s:include value="../student/advancedSearchDialog.jsp" />

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">
	
        <table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3">
 <thead>
			  <tr>
                <th align="left"><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
                <th align="left">学号</th> 
                <s:if test="ipass==null"><s:set name="vpass" value="''"/></s:if>
                <s:else><s:set name="vpass" value="ipass"/></s:else>
                <s:if test="lessonid==null"><s:set name="vlessonid" value="''"/></s:if>
                <s:else><s:set name="vlessonid" value="lessonid"/></s:else>
                
                <th align="left">姓名</th><s:set name="lessonids" value="''"/>
                <s:iterator value="lessonList">
                <th align="left">
                <div class="dropDownList" >
                <button></button>
                <ul>
                <li><a href="?lessonid=${VId}&ipass=&itype=${itype}" val="${VId}"><span class="ui-icon ui-icon-bullet"></span>${VLessonName}</a></li>
                <li><a href="?lessonid=${VId}&ipass=0&itype=${itype}" val="${VId}0">合格</a></li>
                <li><a href="?lessonid=${VId}&ipass=1&itype=${itype}" val="${VId}1">不合格</a></li>
                </ul>
                <s:if test='#vlessonid==VId'><input type="hidden"  id="${VId}" value="${vlessonid}${vpass}"/></s:if>
                <s:else><input type="hidden"  id="${VId}" value="${VId}"/></s:else>
                </div>
				</th>
                </s:iterator>
                <th style="white-space:nowrap;" align="left"><input id="ifview" type="checkbox" onClick="viewhistory()"/><b></b>显示历次成绩<br/>
                <input id="ifdata" type="checkbox" onClick="viewDate()"/><b></b>显示考试日期</th>
                
			  </tr>   
</thead><tbody><s:set name="classids" value="''"/>
            <s:iterator value="page.data" status="stat">
			  
              <tr>
              	<td><input name="checkboxName" type="checkbox" value="${VId};${VCode};${VName}"  <s:if test='selIds!=null && selIds.indexOf(VId)!=-1'>checked="checked"</s:if>><b></b></td>
				<td style="white-space:nowrap;">${VCode}</td>
				<td style="white-space:nowrap;">${VName}</td>
                <s:iterator value="lessonList"><s:set name="lessonNum" value="0"/><s:set name="clessonid" value="VId"/><s:set name="lessonids" value="#lessonids+VCode+#clessonid +','"/>
                <td style="padding-left:10px;">
                <s:iterator value="scoreList"><s:if test='#classids.indexOf(classid)==-1'><s:set name="classids" value="#classids+classid+','"/></s:if>
                <s:set name="lessonNum" value="#lessonNum+1"/>
                <s:if test='#clessonid==lessonid'>
                <s:if test='DScore!=null'>
                <s:if test='IPass==1'>
                    <font color="#FF0000"><s:text name="format.number2"><s:param value="DScore"/></s:text>
                    <s:if test='ITimes>1'>(补${ITimes-1})</s:if></font> <s:if test='IAudit!=2'><s:if test="#r==null || #r==0"><a href="javascript:void(0)" onClick="showEditDiaLog('${VId}','<s:text name="format.number2"><s:param value="DScore"/></s:text>','${lessonName}','${VCode}','${VName}')"><img src="themes/cupertino/images/edit.png"  title="编辑成绩" border="0" align="absmiddle"/></a> <a href="javascript:void(0)" onClick="deleteLessonScore('${VId}')"><img src="themes/cupertino/images/subfu.png" title="删除成绩" border="0" align="absmiddle"/></a></s:if></s:if> 
                </s:if>
                <s:else>
                
                	<s:text name="format.number2"><s:param value="DScore"/></s:text><s:if test='ITimes>1'>(补${ITimes-1})</s:if><s:if test='IAudit!=2'><s:if test="#r==null || #r==0"><a href="javascript:void(0)" onClick="showEditDiaLog('${VId}','<s:text name="format.number2"><s:param value="DScore"/></s:text>','${lessonName}','${VCode}','${VName}')"><img src="themes/cupertino/images/edit.png"  title="编辑成绩" border="0" align="absmiddle"/></a> <a href="javascript:void(0)" onClick="deleteLessonScore('${VId}')"><img src="themes/cupertino/images/subfu.png" title="删除成绩" border="0" align="absmiddle"/></a></s:if></s:if>                    
                </s:else><input name="t1" type="hidden" value="t1${VId}">
                <span  id="t1${VId}" style="display:none">${viewTime}</span>
                <span id="${VCode}${clessonid}${classid}" style="display:none;">
                <s:iterator value="historyList" status="j">
                    <font color="#FF0000"><s:text name="format.number2"><s:param value="DScore"/></s:text>
                    <s:if test='#j.count!=historyList.size()'>(补<s:property value="historyList.size()-#j.count"/>)</s:if></font>  <s:if test='IAudit!=2'><s:if test="#r==null || #r==0"><a href="javascript:void(0)" onClick="showEditDiaLog('${VId}','<s:text name="format.number2"><s:param value="DScore"/></s:text>','${lessonName}','${VCode}','${VName}')"><img src="themes/cupertino/images/edit.png"  title="编辑成绩" border="0" align="absmiddle"/></a> <a href="javascript:void(0)" onClick="deleteLessonScore('${VId}')"><img src="themes/cupertino/images/subfu.png" title="删除成绩" border="0" align="absmiddle"/></a></s:if></s:if> <input name="t2" type="hidden" value="t2${VId}">
                <span  id="t2${VId}" style="display:none"><s:date name="DExamtime" format="yyyy-MM-dd" /></span>
                 </s:iterator></span><br>
                 </s:if>
                 </s:if>
                </s:iterator>
                </td>
                </s:iterator>
                <td></td>
			  </tr></s:iterator>
             <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
				<s:iterator value="lessonList"><td>&nbsp;</td></s:iterator>
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
  <fieldset>
     <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
      </tr>
    </table>
  </fieldset>
</div>

<div id="eidtLessonDialog" title="编辑成绩">
<br><fieldset>
<table width="90%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="26%" align="right">姓名：</td>
    <td width="74%"><span id="nameid"></span></td>
  </tr>
  <tr>
    <td colspan="2" align="right"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">学号：</td>
    <td><span id="codeid"></span></td>
  </tr>
  <tr>
    <td colspan="2" align="right" height="24"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right"><span id="lename"></span>：</td>
    <td><input id="cscoreid"  type="text" class="text ui-widget-content ui-corner-all" style="width:40px;" /></td>
  </tr>
</table>
</fieldset>
</div>

<div id="lessonDialog" title="录入成绩"><input type="text" name="vfocusn" style="width:0px; height:0px; border:0px;"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="15%" height="24" align="right">班级名称：</td>
    <td width="85%"><s:iterator value="trainingClassList">
<a href="#N" class="inline" style="width:180px; border:0; line-height:24px;"><input name="className" type="radio" value="${VId};${VName}"><b></b>${VName}</a>
</s:iterator></td>
  </tr>
  <tr>
    <td height="24" colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td height="24" align="right">课程名称：</td>
    <td><s:iterator value="lessonList">
<div style="width:130px; float:left;line-height:28px"><input name="lessonCheckName" type="radio" value="${VId};${VLessonName}"/><b></b>${VLessonName}</div>
</s:iterator></td>
  </tr>
  <tr>
    <td height="24" colspan="2" align="right"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td height="24" align="right">考试时间：</td>
    <td><input type="text" id="cDExamTime" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDExamTime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" /></td>
  </tr>
   <tr>
    <td height="24" colspan="2" align="right"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td height="24" colspan="2" style="padding-left:40px;">显示已通过该科目考试学生名单：<input name="viewName" type="radio" value="0" checked/><b></b>否&nbsp;&nbsp; <input name="viewName" type="radio" value="1"/><b></b>是</td>
    </tr>
</table>
</div>

<div id="auditlessonDialog" title="提交审核-选择课程">
<br><fieldset>请选择课程：
<span class="panelLine"></span>
<s:iterator value="lessonList">
<div style="width:130px; float:left;line-height:28px">&nbsp;&nbsp;&nbsp;<input name="auditCheckName" type="checkbox" value="${VId}"/><b></b>${VLessonName}</div>
</s:iterator>
  </fieldset>
</div>

<div id="importlessonDialog" title="学生成绩导入"><br>

请选择上传的文件
<span class="panelLine"></span>
<input type="file" name="upload" id="upload"  class="text ui-widget-content ui-corner-all" style="width:300px;"/>	
<span class="panelLine"></span>
<input name="importName" type="radio" value="0"/><b></b>校考&nbsp;&nbsp;&nbsp;&nbsp;
<input name="importName" type="radio" value="1"/><b></b>局考&nbsp;&nbsp;&nbsp;&nbsp;
<input name="importName" type="radio" value="2"/><b></b>局考
</div>

<form  action="editLessonScore.do" method="post" id="editScoreForm">
<input name="id" type="hidden" id="sid">
<input name="socre" type="hidden" id="scoreid">
<input name="itype" type="hidden" value="${itype}">
<input name="isAssignid" type="hidden" id="editisAssignid">
<input name="pageIndex" type="hidden" id="pageIndex" value="${pageIndex}">
</form>


<form  action="saveAuditLessonScore.do" method="post" id="auditLessonForm">
<input name="id" type="hidden" id="auditclassid">
<input name="itype" type="hidden" value="${itype}">
</form>
<form  action="open_addLessonScore.do" method="post" id="addLessonForm">
<input name="lessonName" type="hidden" id="slessonName">
<input name="lessonid" type="hidden" id="slessonid">
<input name="classid" type="hidden" id="sclassid">
<input name="className" type="hidden" id="sclassName">
<input name="examTime" type="hidden" id="sexamTime">
<input name="isView" type="hidden" id="sisView">
<input name="name" type="hidden" id="optid">
<input name="itype" type="hidden" value="${itype}">
</form>
<input type="hidden"  name="selIds" value="${selIds}" id="selSid">
<%@ include file="../../result.jsp"%>
<input type="hidden"  value="${lessonids}" id="lessonids">

<input type="hidden"  value="${classids}" id="classids">
<input id="citype" type="hidden" value="${itype}">
</body>
</html>
<script>
function viewDate(){
	var lids = document.getElementsByName("t1");

	if($("#ifdata")[0].checked){
		
		for(i=0;i<lids.length;i++){
			$("#" + lids[i].value).css('display','');
		}
	}else{
		
		for(i=0;i<lids.length;i++){

			$("#" + lids[i].value).css('display','none');
		}
	}
	var lids2 = document.getElementsByName("t2");

	if($("#ifdata")[0].checked){
		
		for(i=0;i<lids2.length;i++){
			$("#" + lids2[i].value).css('display','');
		}
	}else{
		
		for(i=0;i<lids2.length;i++){

			$("#" + lids2[i].value).css('display','none');
		}
	}
}
function viewhistory(){
	var lessonids = $("#lessonids").val();
	
	var lids = lessonids.split(",");
	var ls = $("#classids").val().split(",");
	if($("#ifview")[0].checked){
		for(var i=0;i<lids.length-1;i++){
			
			for(var j=0;j<ls.length-1;j++){
				$("#" + lids[i] + ls[j]).css('display','');
			}
			
		}
	}else{
		for(var i=0;i<lids.length-1;i++){
			for(var j=0;j<ls.length-1;j++){
				$("#" + lids[i] + ls[j]).css('display','none');
			}
		}
	}
}
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