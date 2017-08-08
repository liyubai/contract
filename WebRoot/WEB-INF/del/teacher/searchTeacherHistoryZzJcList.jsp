<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员执照检查列表管理</title>

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
<!-- 树形相关开始-->
<link rel="STYLESHEET" type="text/css" href="../codebase/dhtmlxtree.css">
<script src="../codebase/dhtmlxcommon.js"></script>
<script src="../codebase/dhtmlxtree.js"></script>
<script type="text/javascript" src="../codebase/dhtmlxmenu.js"></script>
<link rel="stylesheet" type="text/css" href="../MenuSkins/dhtmlxmenu_dhx_blue.css"/>
<!-- 树形相关结束-->
<script>
A_WIDTH=200; //注意，不要写成var A_WIDTH，这个值已经在function.js中定义好了，只需要重新赋值
$(function() {
	$("#modalDialogButton7").click(function(){//返回
		$( "#searchForm" ).submit();
	});
	
	$("#modalDialogButton6").click(function(){//查询
		$( "#searchHistory" ).submit();
	});
	
	$( "#dialogContent" ).dialog({//内容窗口
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	
});
	//查看人员信息
	function showPeopleMsg(id){
		
		if(id==""){
			return;	
		}
		params = {"id":id};
		$.ajax({
			type:"post",
			url:"showMessageHistoryZzJcTeacherAjaxAction.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data==null){
					$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				$("#contentid").html(getContent(data));
				$("#dialogContent").dialog('option', 'title',  "所选教员："+data.teacherBaseInfo);
				$( "#dialogContent" ).dialog( "open" );
			}, 
			error:function(XMLHttpRequest, textStatus, errorThrown){
				if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){
					return;
				}
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
	}
	
	function getContent(data){
		var content = "";
		var jcrq = "";
		var yxq = "";
		var jclx = "";
		var cjsj = "";
		
		if(data.IChecktype == 0){
			jclx = "熟练检查";
		}else if(data.IChecktype == 1){
			jclx = "定检检查";
		}else if(data.IChecktype == 2){
			jclx = "实践考试";
		}
		if(data.DCheckdate != null && data.DCheckdate != "" && data.DCheckdate != "null"){
			jcrq = (new Date(data.DCheckdate)).dateformat("yyyy-MM-dd");
		}
		if(data.DEffectdate != null && data.DEffectdate != "" && data.DEffectdate != "null"){
			yxq = (new Date(data.DEffectdate)).dateformat("yyyy-MM-dd");
		}
		if(data.DCreatedate != null && data.DCreatedate != "" && data.DCreatedate != "null"){
			cjsj = (new Date(data.DCheckdate)).dateformat("yyyy-MM-dd");
		}
		var jyxm = "";
		if(data.teacherBaseInfo != null && data.teacherBaseInfo != "" && data.teacherBaseInfo != "null"){
			jyxm = data.teacherBaseInfo;
		}
		content+="<tr>";
		content+="<td width='60'>教员姓名：</td>";
		content+="<td width='140' height=\"24\">"+jyxm+"</td>";
		var jybh = "";
		if(data.teacherCode != null && data.teacherCode != "" && data.teacherCode != "null"){
			jybh = data.teacherCode;
		}
		content+="<td width='60'>教员编号：</td>";
		content+="<td width='140' height=\"24\">"+jybh+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		var bmmc = "";
		if(data.deptName != null && data.deptName != "" && data.deptName != "null"){
			bmmc = data.deptName;
		}
		content+="<tr>";
		content+="<td>所在部门：</td>";
		content+="<td height=\"24\">"+bmmc+"</td>";
		content+="<td>执照升级标识：</td>";
		var zzsjbs = "";
		if(data.teacherLicenseupdate != null && data.teacherLicenseupdate != "" && data.teacherLicenseupdate != "null"){
			zzsjbs = data.teacherLicenseupdate;
		}
		content+="<td height=\"24\">"+zzsjbs+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td>执照标识：</td>";
		var zzbs = "";
		if(data.TTeaLicense != null && data.TTeaLicense != "" && data.TTeaLicense != "null"){
			zzbs = data.TTeaLicense;
		}
		content+="<td height=\"24\">"+zzbs+"</td>";
		content+="<td>检查日期：</td>";
		content+="<td height=\"24\">"+jcrq+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td>检查内容：</td>";
		var jcnr = "";
		if(data.VCheckcontent != null && data.VCheckcontent != "" && data.VCheckcontent != "null"){
			jcnr = data.VCheckcontent;
		}
		content+="<td height=\"24\">"+jcnr+"</td>";
		content+="<td>检查教员：</td>";
		var jcjy = "";
		if(data.VCheckteacher != null && data.VCheckteacher != "" && data.VCheckteacher != "null"){
			jcjy = data.VCheckteacher;
		}
		content+="<td height=\"24\">"+jcjy+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td>备注：</td>";
		var bz = "";
		if(data.VBz != null && data.VBz != "" && data.VBz != "null"){
			bz = data.VBz;
		}
		content+="<td height=\"24\">"+bz+"</td>";
		content+="<td>航空器型别：</td>";
		var hkqxb = "";
		if(data.VFlyform != null && data.VFlyform != "" && data.VFlyform != "null"){
			hkqxb = data.VFlyform;
		}
		content+="<td height=\"24\">"+hkqxb+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td>有效期：</td>";
		content+="<td height=\"24\">"+yxq+"</td>";
		content+="<td>检查类型：</td>";
		content+="<td height=\"24\">"+jclx+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td>创建人：</td>";
		var cjr = "";
		if(data.TUser != null && data.TUser != "" && data.TUser != "null"){
			cjr = data.TUser;
		}
		content+="<td height=\"24\">"+cjr+"</td>";
		content+="<td>创建时间：</td>";
		content+="<td height=\"24\">"+cjsj+"</td>";
		content+="</tr>"
		
		
		return content;
	}
	
	function upPeopleMsg(id){
		$("#peopleIds").val(id);
		$( "#dialogFormNewPeoples" ).submit();
	}
</script>

<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>

</head>
<body class="hide">
<div id="leftPartA"><div>
<ul class="foldList">
	<li><span class="ui-icon ui-icon-carat-1-s"></span>学员管理(4)</li>
	<ul class="itemList hide">
		<li><a>基础信息管理</a></li>
		<li><a class="navLink" href="Func11_1.html" id="navLink1">学籍管理</a></li>
        <li><a class="navLink" href="Func11_2.html" id="navLink1">学生状态管理</a></li>
        <li><a class="navLink" href="Func11_3.html" id="navLink1">国外航校面试管理</a></li>
        <li><a class="navLink" href="Func11_3.html" id="navLink1">执照信息</a></li>
        <li><a class="navLink" href="Func11_3.html" id="navLink1">体检合格证</a></li>
	</ul>
</ul>
<span class="panelLine"></span>
<ul class="foldList">
	<li><span class="ui-icon ui-icon-carat-1-s"></span>教员管理(3)</li>
	<ul class="itemList">
		<li><a href="searchListTeacherAction.do">教员基础信息管理</a></li>
		<li><a href="searchTjListTeacherAction.do">教员体检信息管理</a></li>
		<li class="active" style="cursor:default"><a href="searchZzListTeacherAction.do">教员执照信息管理</a></li>
	</ul>
</ul>
<span class="panelLine"></span>
<ul class="foldList">
	<li><span class="ui-icon ui-icon-carat-1-s"></span>其他人员管理(1)</li>
	<ul class="itemList hide">
		<li><a href="searchPeopleListAnotherPeopleAction.do">其他人员管理</a></li></li>
	</ul>
</ul>
</div></div>

<div id="rightPartA"><div>
<div class="panelBox buttonBox">
	
	<button class="normal barLeft" id="modalDialogButton7">返回</button>
	
	<button class="normal barRight" id="modalDialogButton6">检查信息查询</button>
		
</div>


<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="80"></th>
				<th width="80"></th>
				<th width="160"></th>
				<th width="80"></th>
				<th width="80"></th>
				<th width="80"></th>
				<th width="80"></th>
				<th width="80"></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray">教员姓名</th>
				<th class="thSortableGray">教员编号</th>
				<th class="thSortableGray">部门名称</th>
				<th class="thSortableGray">检查日期</th>
				<th class="thSortableGray">检查教员</th>
				<th class="thSortableGray">有效期</th>
				<th class="thSortableGray">检查类型</th>
				<th class="thSortableGray">航空器型号</th>
				<th class="thSortableGray">操作</th>
			  </tr>
			</thead>
			<tbody id="searchPage">
			<s:iterator value="page.data">
			  <tr>
				<td class="searchRange" title="${TTeaLicense.teacherBaseInfo.VName}">${TTeaLicense.teacherBaseInfo.VName}</td>
				<td class="searchRange" title="${TTeaLicense.teacherBaseInfo.VCode}">${TTeaLicense.teacherBaseInfo.VCode}</td>
				<td class="searchRange" title="${TTeaLicense.teacherBaseInfo.TOrg.VName}">${TTeaLicense.teacherBaseInfo.TOrg.VName}</td>
				<td class="searchRange">
				   <s:date name="DCheckdate" format="yyyy-MM-dd" />
				</td>
				<td class="searchRange" title="${VCheckteacher}">${VCheckteacher}</td>
				<td class="searchRange">
				   <s:date name="DEffectdate" format="yyyy-MM-dd" />
				</td>
				<td class="searchRange">
				   <s:if test="IChecktype==0">熟练检查</s:if><s:elseif test="IChecktype==1">定检检查</s:elseif><s:elseif test="IChecktype==2">实践考试</s:elseif>
				</td>
				<td class="searchRange" title="${VFlyform}">${VFlyform}</td>
				<td class="searchRange">
				<a href='#' onclick="showPeopleMsg('${VId}');" class="blue">查看</a>　
				<s:if test="teacherLicenseupdate==null">
				<a href='#' onclick="upPeopleMsg('${VId}');" class="blue">修改</a>
				</s:if>
				</td>
			  </tr>
			</s:iterator> 
			
            <s:iterator value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			  </tr>
              </s:iterator>
			</tbody>
		</table>
<!-- 分页导航 --><s:include value="../common/pagination_system.jsp" /><!-- 分页导航 end -->

	</div>

</div>

</div>

</div></div>

<div id="dialogContent"  title="查看教员执照检查信息">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
    <tbody id="contentid">
    </tbody>
    </table>
</div>

<form id="dialogFormNewPeople" action="toShowZzJcTeacherAction.do" method="post">
	<input type="hidden" name="deptId" value="${deptId}" />
    <input type="hidden" name="key" value="${key}" />
	<input type="hidden" id="VIdf" name="historySearch.VId" value="${historySearch.VId}" />
	<input type="hidden" id="VNamef" name="historySearch.VName" value="${historySearch.VName}" />
	<input type="hidden" id="ILevelf" name="historySearch.ILevel" value="${historySearch.ILevel}" />
	<input type="hidden" id="VNationf" name="historySearch.VNation" value="${historySearch.VNation}" />
	<input type="hidden" id="DResultdate1f" name="historySearch.DResultdate1" value="${historySearch.DResultdate1}"/>
	<input type="hidden" id="DResultdatef" name="historySearch.DResultdate" value="${historySearch.DResultdate}" />
	<input type="hidden" id="VDoctorf" name="historySearch.VDoctor" value="${historySearch.VDoctor}" />
	<input type="hidden" id="VIssuerf" name="historySearch.VIssuer" value="${historySearch.VIssuer}" />
	<input type="hidden" id="DIssueTimef" name="historySearch.DIssueTime" value="${historySearch.DIssueTime}" />
	<input type="hidden" id="DUsedTimef" name="historySearch.DUsedTime" value="${historySearch.DUsedTime}" />
	<input type="hidden" id="VCompanyf" name="historySearch.VCompany" value="${historySearch.VCompany}" />
	<input type="hidden" id="DIssueTime1f" name="historySearch.DIssueTime1" value="${historySearch.DIssueTime1}" />
	<input type="hidden" id="DUsedTime1f" name="historySearch.DUsedTime1" value="${historySearch.DUsedTime1}" />
	<input type="hidden" id="deptNamef" name="historySearch.deptName" value="${historySearch.deptName}" />
	<input type="hidden" id="peopleId" name="id"/>
</form>
<form id="dialogFormNewPeoples" action="toUpZzJcTeacherAction.do" method="post">
	<input type="hidden" name="deptId" value="${deptId}" />
    <input type="hidden" name="key" value="${key}" />
	<input type="hidden" name="historySearch.VId" value="${historySearch.VId}" />
	<input type="hidden" name="historySearch.VName" value="${historySearch.VName}" />
	<input type="hidden" name="historySearch.ILevel" value="${historySearch.ILevel}" />
	<input type="hidden" name="historySearch.VNation" value="${historySearch.VNation}" />
	<input type="hidden" name="historySearch.DResultdate1" value="${historySearch.DResultdate1}"/>
	<input type="hidden" name="historySearch.DResultdate" value="${historySearch.DResultdate}" />
	<input type="hidden" name="historySearch.VDoctor" value="${historySearch.VDoctor}" />
	<input type="hidden" name="historySearch.VIssuer" value="${historySearch.VIssuer}" />
	<input type="hidden" name="historySearch.DIssueTime" value="${historySearch.DIssueTime}" />
	<input type="hidden" name="historySearch.DUsedTime" value="${historySearch.DUsedTime}" />
	<input type="hidden" name="historySearch.VCompany" value="${historySearch.VCompany}" />
	<input type="hidden" name="historySearch.DIssueTime1" value="${historySearch.DIssueTime1}" />
	<input type="hidden" name="historySearch.DUsedTime1" value="${historySearch.DUsedTime1}" />
	<input type="hidden" name="historySearch.deptName" value="${historySearch.deptName}" />
	<input type="hidden" id="peopleIds" name="id"/>
</form>
<form  action="searchZzListTeacherAction.do" method="post" id="searchForm">
  <input type="hidden" name="deptId" value="${deptId}" />
  <input type="hidden" name="key" value="${key}" />
</form>

<form  action="searchZzJcHistoryTeacherAction.do" method="post" id="searchHistory">
  <input type="hidden" id="depthistory" name="deptId" value="${deptId}"/>
  <input type="hidden" name="key" value="${key}"/>
</form>

<input type="hidden" id="VParentid" name="VParentid" value="1"/>
<input type="hidden" id="VDeptid" value="${deptId}"/>
<%@ include file="../../result.jsp"%>
<script>

function selectAll(name) { 
	var el = document.getElementsByName("contractIdList"); 
	for (var i = 0; i < el.length; i++) { 
		if(el[i].type == "checkbox" && el[i].name == name) { 
			el[i].checked = true; 
		} 
	} 
} 
function clearAll(name) { 
	var el = document.getElementsByName("contractIdList"); 
	for (var i = 0; i < el.length; i++) { 
		if(el[i].type == "checkbox" && el[i].name == name) { 
			el[i].checked=false; 
		} 
	} 
} 
function isSelectALL(){
	var checkBoxButton = document.getElementsByName("isCheckBoxButton");
	if(checkBoxButton[0].checked){
		selectAll('contractIdList');
	}else{
		clearAll('contractIdList');
	}
}
function setIsCheckBoxButtonChecked(){
	var el = document.getElementsByName("contractIdList"); 
	var checkBoxButton = document.getElementsByName("isCheckBoxButton");
	var checkedButtonNum = 0;
	for (var i = 0; i < el.length; i++) { 
		if(el[i].checked){
			checkedButtonNum++;
		}else{
			checkedButtonNum--;
		}
	}
	if(checkedButtonNum == el.length){
		checkBoxButton[0].checked = true;
	}else{
		checkBoxButton[0].checked = false;
	}

}



//用于显示添加、修改、删除等的提示信息
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult !=null && operateResult!="" ){
		$("#dialogForm4Span").html("<br/>"+operateResult);
		$( "#dialogForm4" ).dialog( "open" );//dialogForm4：用于显示操作成功后返回提示页面
	}
});

Date.prototype.dateformat = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
</script>

</body>
</html>
