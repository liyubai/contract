<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>航校面试</title>
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
		else if(i==8){var d=new $.dropDownList(i,true,75);d.button.css("width", "75px");}
		
		else if(i==9){var d=new $.dropDownList(i,false,210);d.button.css("width", "60px");}
		else if(i==10){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==11){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==12){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==13){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==14){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==15){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		
		else{new $.dropDownList(i,true,90);}

	});
	$("#changeButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		var sc = $("#selSid").val().split(",");
		if(sc.length>2){
			alert("请选择单一学生调换航校。");
			return;	
		}
		var sstudent = "";
		var oldschoolid = "";
		for(j=0;j<sc.length-1;j++){
			if(sc[j].split(";")[3]==0){
				alert("选择的学生中有尚未分派航校的，请重来选择。");
				return;
			}
			oldschoolid  = getSelRadioValue('shcoolName' + sc[j].split(";")[1]);
		}
		if(oldschoolid==""){
			alert("请选择学生分派航校。");
			return;
		}
		$("#changestudentids").val(oldschoolid.split(";")[0]);
		$( "#changeDialog" ).dialog("open");
	});
	$("#fenpaiButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#selstudentids").val($("#selSid").val());
		$( "#fenpaiDialog" ).dialog("open");
	});
	$("#addButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		var sc = $("#selSid").val().split(",");
		var sstudent = "";
		for(j=0;j<sc.length-1;j++){

			if(sc[j].split(";")[3]==0){
				alert("选择的学生中有尚未分派航校的，请重来选择。");
				return;
			}
			
			sstudent+=sc[j] + ";" + getSelRadioValue('shcoolName' + sc[j].split(";")[1]) + ",";
			
		}
		$("#studentid").val(sstudent);
		$("#addLessonForm").submit();
	});
	$( "#changeDialog" ).dialog({
		autoOpen: false,
		height: 400,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var hx = getSelRadioValue('changeName');
				if(hx==""){
					alert("请选择新航校。");
					return;
				}
	
				$("#changeschoolid").val(hx);
				$("#changeForm").submit();
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#fenpaiDialog" ).dialog({
		autoOpen: false,
		height: 400,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var hx = getSelRadioValue('hxName');
				if(hx==""){
					alert("请选择航校。");
					return;
				}
				$("#sDCreatedate").val($("#cDCreatedate").val());
				if($("#sDCreatedate").val()==""){
					alert("请选择面试日期。");
					return;	
				}
				$("#schoolid").val(hx);
				$("#assignForm").submit();
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
	$( "#eidtDialog" ).dialog({
		autoOpen: false,
		height: 400,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#eDAuditiontime").val($("#ecDCreatedate").val());
				$("#eIResult").val(getSelRadioValue("ename"));
				$("#eschoolid").val(getSelRadioValue("ehxName"));
				$("#editForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#eidtDialog2" ).dialog({
		autoOpen: false,
		height: 400,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				if($.trim($("#DCgtime").val())!=""){
					$("#eDCgtime").val($("#DCgtime").val());
				}
				if($.trim($("#DHgtime").val())!=""){
					$("#eDHgtime").val($("#DHgtime").val());
				}
				if($.trim($("#DStopflytime").val())!=""){
					$("#eDStopflytime").val($("#DStopflytime").val());
				}
				$("#eVReason").val($("#VReason").val());
				$("#editForm2").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
});

function showEditDiaLog2(id,date1,date2,date3,reason){
	$("#DCgtime").val(date1);
	$("#DHgtime").val(date2);
	$("#DStopflytime").val(date3);
	$("#eid2").val(id);
	$("#VReason").val(reason);
	$("#eidtDialog2").dialog( "open" );
}
function deleteLessonScore2(id){

	window.location.replace("deleteAbroadtrain.do?id=" + id + "&pageIndex=" + pageIndex);
}
function showEditDiaLog(id,schoolid,result,date){
	$("#ecDCreatedate").val(date);
	var r1=document.getElementsByName("ehxName");
	for(var i=0;i<r1.length;i++){
		if(schoolid==r1[i].value){
			r1[i].checked= true;
		}
	}
	var r2=document.getElementsByName("ename");
	for(var i=0;i<r2.length;i++){
		if(result==r2[i].value){
			r2[i].checked= true;
		}
	}
	$("#eid").val(id);
	$("#eidtDialog").dialog( "open" );
}
function deleteLessonScore(id){

	window.location.replace("deleteForeignaviationschoolinterview.do?id=" + id + "&pageIndex=" + pageIndex);
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
<button class="green"  id="fenpaiButton">分派面试</button>
<button class="green"  id="changeButton">调换航校</button>
<button class="green"  id="addButton">面试信息录入</button>
</div></s:if>
<div class="panelBox buttonBox" >
<s:include value="../student/banner.jsp" />
<div class="dropDownList barMiddle">
        <s:set name="eisAssignid" value="isAssignid"/>
        <s:if test="isAssignid==null || isAssignid==''"><s:set name="eisAssignid" value="1"></s:set></s:if>
        <button>更多</button><span class="bar"></span>
        <ul>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=1&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="1"><span class="ui-icon ui-icon-bullet"></span>更多</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=4&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="4">已分派</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=5&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="5">未分派</a></li>
            <li><a href="?isAssignid=6"  val="6">全部</a></li>
        </ul><input type="hidden"  id="cxmoreid" value='<s:property value="#eisAssignid" />'/>
    </div>
 <div class="dropDownList barRight">
        <button>航校</button><span class="bar"></span>
        <ul>
            <li><a href="?schoolid=" val=""><span class="ui-icon ui-icon-bullet"></span>航校</a></li>
            <s:iterator value="schoolList">
			<li><a href="?schoolid=${VId}" val="${VId}">${VSchoolname}</a></li>
			</s:iterator>
        </ul><input type="hidden"  id="cschoolid" value="${schoolid}"/>
    </div>
     <div class="buttonInput relative left" width="160" height="28">
    <input id="searchOutlineName" title="学号/姓名"  name="searchOutlineName"  type="text" maxlength="50" value="学号/姓名" /><button id="modalDialogButton4">查询</button>
    </div>

</div>


<div class="Panel ui-corner-all-0" id="Panel2" >

	<div class="panelContent">

	
        <table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
        	<thead>
             	<tr class="trSpliter">
				<th width="40"></th>
				<th width="80"></th>
				<th width="80"></th>
				<th width="200"></th>
				<th width="80"></th>
                <th width="140"></th>
                <th width="110"></th>
                <th width="110"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortableGray" ><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
                <th class="thSortableGray" >学号</th>
                <th class="thSortableGray" >姓名</th>
                <th class="thSortableGray" >面试航校</th>
                <th class="thSortableGray" >是否合格</th>
                <th class="thSortableGray" >面试日期</th>
                <th class="thSortableGray" >出国日期</th>
                <th class="thSortableGray" >回国日期</th>
                <th class="thSortableGray" >停飞日期</th>
			  </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
            <s:set name="isize" value="schoolList.size()"/>
			  <tr class="normal">
              	<td><input name="checkboxName" type="checkbox" value="${VId};${VCode};${VName};${isize}"  <s:if test='selIds!=null && selIds.indexOf(VId)!=-1'>checked="checked"</s:if>><b></b></td>
				<td >${VCode}</td>
				<td>${VName}</td>
				<td colspan="6" style="line-height:28px;">
                <s:iterator value="schoolList" status="i">
                <div style="width:200px; float:left">
                <s:if test='#i.count==1'>
                	<input name="shcoolName${VCode}" type="radio" value="${VId};${TAbroadaviationschool.VSchoolname}" checked/><b></b>${TAbroadaviationschool.VSchoolname}
                </s:if>
                <s:else>
                	<input name="shcoolName${VCode}" type="radio" value="${VId};${TAbroadaviationschool.VSchoolname}"><b></b>${TAbroadaviationschool.VSchoolname}
                </s:else></div>
                <div style="width:220px; float:left"><s:set name="sid" value="VId"/><s:set name="p0" value="0"/>
                <s:iterator value="viewList"><s:if test='studentassignschool.VId==#sid'><s:set name="p0" value="#p0+1"/></s:if></s:iterator>
                <s:iterator value="viewList" status="j">    
                <s:if test='studentassignschool.VId==#sid'>
                <div class="inline" style="width:60px;float:left"><s:if test='IResult==0'>是</s:if><s:else>否</s:else></div>
                <div class="inline" style="width:160px;"><s:date name="DAuditiontime" format="yyyy-MM-dd" />&nbsp;&nbsp;<a href="javascript:void(0)" onClick="showEditDiaLog('${VId}','${studentassignschool.TAbroadaviationschool.VId}','${IResult}','<s:date name="DAuditiontime" format="yyyy-MM-dd" />')"><img src="themes/cupertino/images/edit.png"  title="编辑" border="0" align="absmiddle"/></a> <a href="javascript:void(0)" onClick="deleteLessonScore('${VId}')"><img src="themes/cupertino/images/subfu.png" title="删除" border="0" align="absmiddle"/></a></div>
                <s:if test='#p0!=1'><br></s:if>
                </s:if>
                </s:iterator>
				</div>
                <s:iterator value="trainingList">      
                <s:if test='studentassignschool.VId==#sid'>
                <span class="inline" style="width:110px;"><s:date name="DCgtime" format="yyyy-MM-dd" /></span>
                <span class="inline" style="width:100px;"><s:date name="DHgtime" format="yyyy-MM-dd" /></span>
                <span class="inline" ><s:date name="DStopflytime" format="yyyy-MM-dd" /></span>&nbsp;&nbsp;<a href="javascript:void(0)" onClick="showEditDiaLog2('${VId}','<s:date name="DCgtime" format="yyyy-MM-dd" />','<s:date name="DHgtime" format="yyyy-MM-dd" />','<s:date name="DStopflytime" format="yyyy-MM-dd" />','${VReason}')"><img src="themes/cupertino/images/edit.png"  title="编辑" border="0" align="absmiddle"/></a> <a href="javascript:void(0)" onClick="deleteLessonScore2('${VId}')"><img src="themes/cupertino/images/subfu.png" title="删除" border="0" align="absmiddle"/></a></s:if>
            	
                </s:iterator>
                
                <s:if test='#i.count!=schoolList.size()'>
                <span class="panelLine"></span>
                </s:if>
                </s:iterator> 
                
                </td>
			  </tr>
              </s:iterator>
             <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
			  <tr class="normal">
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
                <td colspan="6"></td>
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

<div id="fenpaiDialog"  title="分派面试">
<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>
<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td width="20%" align="right">国外航校：</td>
    <td width="80%"><s:iterator value="schoolList">
<a href="#N" class="inline" style="width:180px; border:0; line-height:28px;"><input name="hxName" type="radio" value="${VId}"><b></b>${VSchoolname}</a>
</s:iterator></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">面试日期：</td>
    <td><input type="text"  id="cDCreatedate" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDCreatedate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
</table>
</div>

<div id="changeDialog"  title="调换航校">
<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>
<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td width="20%" align="right">国外航校：</td>
    <td width="80%"><s:iterator value="schoolList">
<a href="#N" class="inline" style="width:180px; border:0; line-height:28px;"><input name="changeName" type="radio" value="${VId}"><b></b>${VSchoolname}</a>
</s:iterator></td>
  </tr>
</table>
</div>
<div id="eidtDialog" title="编辑面试信息">
<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>
<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td width="20%" align="right">国外航校：</td>
    <td width="80%"><s:iterator value="schoolList">
<a href="#N" class="inline" style="width:180px; border:0; line-height:28px;"><input name="ehxName" type="radio" value="${VId}">${VSchoolname}</a>
</s:iterator></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">是否合格：</td>
    <td><input name="ename" type="radio" value="0">是&nbsp;<input name="ename"  type="radio" value="1">否</td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">面试日期：</td>
    <td><input type="text"  id="ecDCreatedate" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({ecDCreatedate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" /></td>
  </tr>
</table>
</div>
<div id="eidtDialog2" title="编辑面试信息">
<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>
<table width="100%" border="0" cellspacing="0" cellpadding="2">
  <tr>
    <td width="20%" align="right">出国日期：</td>
    <td width="80%"><input type="text"  id="DCgtime" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DCgtime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" /></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">回国日期：</td>
    <td><input type="text"  id="DHgtime" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DHgtime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" /></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">停飞日期：</td>
    <td><input type="text"  id="DStopflytime" class="Wdate ui-widget-content ui-corner-all text"  style="width:120px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({DStopflytime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  onKeyPress="return false" onpaste="return false" /></td>
  </tr>
  <tr align="right">
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">停飞原因：</td>
    <td><input type="text"  id="VReason" class="ui-widget-content ui-corner-all text"  style="width:200px; border-color:#DDDDDD; height:16px;" /></td>
  </tr>
</table>
</div>
<s:include value="../student/advancedSearchDialog.jsp" />
<form  action="open_addInterview.do" method="post" id="addLessonForm">
<input name="ids" type="hidden" id="studentid">
</form>
<form  action="saveAssignAbroadSchool.do" method="post" id="assignForm">
<input name="school.studentBaseInfo.VId" type="hidden" id="selstudentids">
<input name="school.TAbroadaviationschool.VId" type="hidden" id="schoolid">
<input name="school.DCreatedate" type="hidden" id="sDCreatedate">
</form>

<form  action="updateForeignaviationschoolinterview.do" method="post" id="editForm">
<input name="view.VId" type="hidden" id="eid">
<input name="view.DAuditiontime" type="hidden" id="eDAuditiontime">
<input name="view.IResult" type="hidden" id="eIResult">
<input name="view.TUser.VId" type="hidden" id="eschoolid">
<input name="pageIndex" type="hidden" value="${pageIndex}">
</form>

<form  action="updateAbroadtrain.do" method="post" id="editForm2">
<input name="abroadtrain.VId" type="hidden" id="eid2">
<input name="abroadtrain.DCgtime" type="hidden" id="eDCgtime">
<input name="abroadtrain.DHgtime" type="hidden" id="eDHgtime">
<input name="abroadtrain.DStopflytime" type="hidden" id="eDStopflytime">
<input name="abroadtrain.VReason" type="hidden" id="eVReason">
<input name="pageIndex" type="hidden" value="${pageIndex}">
</form>

<form  action="saveChangeAssignAbroadSchool.do" method="post" id="changeForm">
<input name="school.VId" type="hidden" id="changestudentids">
<input name="school.TAbroadaviationschool.VId" type="hidden" id="changeschoolid">
</form>
<input type="hidden"  name="selIds" value="${selIds}" id="selSid">
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