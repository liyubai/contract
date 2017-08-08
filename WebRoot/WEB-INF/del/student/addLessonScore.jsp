<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课程成绩</title>
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
.score{width:60px;border: 1px solid #DDDDDD;}
.datec{width:110px;border: 1px solid #DDDDDD; height:16px;}
</style>
<script>
$(function() {
	var opt = $("#opt").val();
	if(opt==1){
		$("#isnew").html("录入新成绩");
	}else{
		$("#isnew").html("录入补考成绩");
	}
	/*
	var ids = $("#selIds").val();
	if(ids==""){
		alert("请选择学生。");
		window.location.replace("open_scoreList.do");
		return;
	}
	
	var id = $("#classid").val();
	if(id==""){
		alert("请选择课程。");
		window.location.replace("open_scoreList.do");
		return;
	}
	var opt = $("#opt").val();
	if(opt==1){
		$("#lessonName").html(id.split(";")[1] + "(新)");
	}else{
		$("#lessonName").html(id.split(";")[1]+ "(补)");
	}
	
	var ss = ids.split(",");
	ss = getArraySort(ss);
	var content="";
	for(i=0;i<ss.length;i++){
		content+="<tr class=\"normal\"><td></td><td>"+ss[i].split(";")[1]+"</td>";
		content+="<td>"+ss[i].split(";")[2]+"</td>";
		content+="<td><input type=\"text\" id=\"cname0"+i+"\" class=\"score\"/></td>";
		content+="<td><input type=\"text\" id=\"cname1"+i+"\" class=\"Wdate datec\" onFocus=\"WdatePicker({cname1"+i+":'%y-%M-%d',dateFmt:'yyyy-MM-dd'})\" /></td>";
		content+="<td></td></tr>";
	}
	$("#selectLessonid").html(content);
	var lessonid = $("#classid").val().split(";")[0];
	$("#lessonid").val(lessonid);
	*/
	$("#saveButton").click(function(){
		if(!getValue()){
			return;
		}
		$("#IPassid").val(1);
		
		$("#addLessonForm").submit();
	})
	
	$("#saveAndAuditButton").click(function(){
		if(!getValue()){
			return;
		}
		$("#IPassid").val(2);
		$("#addLessonForm").submit();
		
	})
	/*
	$("#cname00").blur(function(){
		if($("#cname00").val()==""){
			return;	
		}
		for(j=1;j<ss.length;j++){
			if($("#cname0"+j).val()!=""){
				continue;
			}
			$("#cname0"+j).val($("#cname00").val());
		}
	});
	$("#cname10").blur(function(){
		if($("#cname10").val()==""){
			return;	
		}
		for(j=1;j<ss.length;j++){
			if($("#cname1"+j).val()!=""){
				continue;
			}
			$("#cname1"+j).val($("#cname10").val());
		}
	});
	*/
	$("#escid0").click(function(){
		var itypeid = $("#itypeid").val();
		window.location.href="open_scoreList.do?itype="+ itypeid + "&isAssignid="+$("#sclassid").val();	
	});
});
/*
function getValue(ss){
	var cnames= "";
	for(k=0;k<ss.length;k++){
		cnames+=ss[k].split(";")[0] + ";";

		for(j=0;j<2;j++){
			if($.trim($("#cname" + j + k).val())==""){
				alert("请输入完整数据。");
				return false;
			}
			if(j==0 && !checkDouble($.trim($("#cname" + j + k).val()))){
				alert("请输入数字类型的数据。");
				return false;
			}
			cnames+=$("#cname"+j + k).val() + ";";
		}
		cnames+=",";
	}
	$("#studentid").val(cnames);
	return true;
}
*/
function getValue(){
	var cnames= "";
	var c = "";
	var id = "";
	var ispass = 0;
	var ss=document.getElementsByName("cscoreid");
	for(k=0;k<ss.length;k++){
		c = $.trim(ss[k].value);
		id = ss[k].id.split(",")[0];
		ispass = ss[k].id.split(",")[1];
		if(ispass==0){
			continue;
		}
		if(c!="" && !checkDouble(c)){
			alert("请输入数字类型的数据。");
			return false;
		}
		if(c==""){
			cnames+=id + ";-1" + ",";
		}else{
			cnames+=id+";" + c +",";
		}
	}

	$("#studentid").val(cnames);
	return true;
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4a9df179014a9e3beb0c0003</s:param>
    <s:param name="name">open_scoreList.do?itype=${itype}</s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>
<div style="height: 41px; border: 0; border-top: solid 1px #DBE3E8;border-bottom: solid 1px #DBE3E8; background: #F6F6F6;margin: auto; margin: 10px 10px 0 10px;">
<div style=" margin-top:10px; margin-left:20px;font-size: 14px; color: #555555;">班级名称：${className}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 课程名称：${lessonName}&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;考试时间：${examTime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 成绩类型：<span id="isnew" style="font-size: 14px; color: #555555;"></span></div>
</div>
<div class="Panel ui-corner-all-0" id="Panel2" >

	<div class="panelContent">
        <table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
        	<thead>
             	<tr class="trSpliter">
				<th width="10"></th>
				<th width="120"></th>
                <th width="120"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortableGray" ></th>
                <th class="thSortableGray" >学号</th>
                <th class="thSortableGray" >姓名</th>
                <th class="thSortableGray" >&nbsp;成绩</th>
			  </tr>   
			</thead>
			<tbody>
            <s:iterator value="studentList">
            <tr>
                <td>&nbsp;</td>
                <td>${VCode}</td>
                <td>${VName}</td>
                <td>
                <s:if test='ITjexam==1'>
                <input name="cscoreid" id="${VId},0" value="${VJtzz}"  type="text" class="text ui-widget-content ui-corner-all" style="width:50px;background-color:#E9E9E9" onKeyPress="return false" onpaste="return false" /> <font color="#50A13B">(已通过) 上次考试时间：${VJg}</font> 
                </s:if>
                <s:elseif test='ITjexam==2'>
                 <input name="cscoreid" id="${VId},1"  type="text" class="text ui-widget-content ui-corner-all" style="width:50px;" /> <font color="#EB7979">(未通过) 上次考试时间：${VJg} 成绩：${VJtzz}</font>
                </s:elseif>
                <s:else>
                 <input name="cscoreid" id="${VId},1"  type="text" class="text ui-widget-content ui-corner-all" style="width:50px;" />
                </s:else>
                </td>
			  </tr>  
             </s:iterator> 
			</tbody>
		</table>
<div class="panelBox buttonBox" >
<button class="green"  id="saveAndAuditButton">保存并提交审核</button>
<button class="green"  id="saveButton">保存</button>
<button class="normal" id="escid0">返回</button>
</div><br>

</div>
</div>
</div>
</div>

<form  action="saveAddLessonScore.do" method="post" id="addLessonForm">
<input name="lessonScore.ITimes" type="hidden" value="${name}">
<input name="lessonScore.IPass" type="hidden" id="IPassid">
<input name="lessonScore.TLesson.VId" type="hidden" value="${lessonid}">
<input name="lessonScore.studentBaseInfo.VId" type="hidden" id="studentid"><!--存储学生id与成绩-->
<input name="lessonScore.DExamTime" type="hidden" value="${examTime}">
<input name="itype" type="hidden" value="${itype}" id="itypeid">
<input name="lessonScore.TSetClass.VId" type="hidden" value="${classid}"><!--存储班级id-->
<input name="isAssignid" type="hidden" value="${classid}">
</form>
<input name="lessonName" type="hidden" id="slessonName" value="${lessonName}">
<input name="lessonid" type="hidden" id="slessonid" value="${lessonid}">
<input name="classid" type="hidden" id="sclassid" value="${classid}">
<input name="className" type="hidden" id="sclassName" value="${className}">
<input name="opt" type="hidden" id="opt" value="${name}">
<%@ include file="../../result.jsp"%>
</body>
</html>