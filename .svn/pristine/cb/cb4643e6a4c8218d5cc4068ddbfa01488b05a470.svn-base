<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>毕业生分配</title>
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
.bordera{border-color:  #DDDDDD;}
</style>
<script>
$(function() {
	
	var ids = $("#selIds").val();
	if(ids==""){
		alert("请选择学生。");
		window.location.replace("open_offSchoolList.do");
		return;
	}
	var hxNames = $("#hxNames").val();
	var hxs = hxNames.split(","); 
	if(hxNames==""){
		alert("航空公司不能为空。");
		window.location.replace("open_offSchoolList.do");
		return;
	}
	
	var ss = ids.split(",");
	ss = getArraySort(ss);
	var content="";
	for(i=0;i<ss.length;i++){
		content+="<tr class=\"normal\"><td></td><td>"+ss[i].split(";")[1]+"</td>";
		content+="<td>"+ss[i].split(";")[2]+"</td>";
		content+="<td><div class=\"dropDownList\">";
		content+="<button></button>";
		content+="<ul><li>";
		content+="<a href=\"#N\" val=\"\" class=\"inline\" style=\"width:76px;\" onclick=\"changeValue('')\">";
		content+="<span class=\"ui-icon ui-icon-bullet\"></span>航空公司</a>";
		if(i==0){
			for(ii=0;ii<hxs.length-1;ii++){
				content+="<a href=\"#N\" val=\""+hxs[ii].split(";")[0] + 
				"\" class=\"inline\" style=\"width:76px;\" onclick=\"changeValue('"+hxs[ii].split(";")[0]+"')\">";
				content+=hxs[ii].split(";")[1]+"</a>";
			}
		}else{
			for(ii=0;ii<hxs.length-1;ii++){
				content+="<a href=\"#N\" val=\""+hxs[ii].split(";")[0] + "\" class=\"inline\" style=\"width:76px;\">";
				content+=hxs[ii].split(";")[1]+"</a>";
			}
		}
		content+="</li></ul>";
		content+="<input type=\"hidden\" id=\"cname0"+i+"\" value=\""+ss[i].split(";")[3]+"\">";
		content+="</div></td>";
		
		content+="<td><input type=\"text\" id=\"cname1"+i+"\" class=\"Wdate\" style=\"width:95px;border-color:#DDDDDD;\" onFocus=\"WdatePicker({cname1"+i+":'%y-%M-%d',dateFmt:'yyyy-MM-dd'})\" /></td>";
		content+="<td><input type=\"text\"  id=\"cname2"+i+"\" style=\"width:300px;border: 1px solid #DDDDDD;\" /></td>";
		content+="</tr>";
	}

	$("#selectLessonid").html(content);
	$("div.dropDownList").each(function(i){
		var d=new $.dropDownList(i,true,440);
	});
	$("#escid0").click(function(){
		window.location.href="open_offSchoolList.do";	
	});
	$("#saveButton").click(function(){
		var cnames= "";
		for(k=0;k<ss.length;k++){
			cnames+=ss[k].split(";")[0] + ";";
			for(j=0;j<3;j++){
				
				if($("#cname"+j + k).val()==""){
					alert("请输入完成数据。");
					return;
				}
				
				cnames+=$("#cname"+j + k).val() + ";";
				
			}
			cnames+=",";
		}
		$("#classid").val(cnames);
		$("#addForm").submit();
	})
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
	$("#cname20").blur(function(){
		if($("#cname20").val()==""){
			return;	
		}
		for(j=1;j<ss.length;j++){
			if($("#cname2"+j).val()!=""){
				continue;
			}
			$("#cname2"+j).val($("#cname20").val());
		}
	});
	
});
function changeValue(type){
	var ids = $("#selIds").val();
	var ss = ids.split(",");
	if(type==""){
		return;	
	}
	for(j=1;j<ss.length;j++){
		if($("#cname0"+j).val()!=""){
			continue;
		}
		$("#cname0"+j).val(type);
		$("#cname0"+j).change();
	}
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

<div id="rightPartA"><div>

<div class="Panel ui-corner-all-0" id="Panel2" >

	<div class="panelContent">
        <table class="panelTable" border="0" cellspacing="0" cellpadding="2">
        	<thead>
             	<tr class="trSpliter">
				<th width="10"></th>
				<th width="80"></th>
                <th width="70"></th>
                <th width="140"></th>
                <th width="140"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortableGray" ></th>
                <th class="thSortableGray" >学号</th>
                <th class="thSortableGray" >姓名</th>
                <th class="thSortableGray" >分配公司</th>
                <th class="thSortableGray" >分配日期</th>
                <th class="thSortableGray" >分配地点</th>
			  </tr>   
			</thead>
			<tbody id="selectLessonid">
			</tbody>
		</table>
<div class="panelBox buttonBox" >
<button class="green"  id="saveButton">保存</button>
<button class="normal" id="escid0">返回</button>
</div><br>

</div>
</div>
</div>
</div>

<form  action="saveGraduationStudentAssign.do" method="post" id="addForm">
<input name="assign.studentBaseInfo.VId" type="hidden" id="classid">
</form>
<s:set name="pvalue" value="''"/><s:iterator value="dictionCompanyList"><s:set name="pvalue" value="#pvalue + VId + ';'  +VName+','"/></s:iterator>
<input id="hxNames" type="hidden" value="${pvalue}">
<input name="selIds" type="hidden" id="selIds" value="${ids}">
<%@ include file="../../result.jsp"%>
</body>
</html>