<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>新增班级</title>
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
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		if(i==0){var d=new $.dropDownList(i,true,360);d.button.css("width", "100px");}
		else{new $.dropDownList(i,true,100);}

	});
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchOutlineName").val()=="班级名称"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($.trim($("#searchOutlineName").val()));
		}
		$( "#searchForm" ).submit();
	});
	
	$("#addButton").click(function(){
		$("#cVName").val("");
		$("#classForm").dialog('option', 'title', '新增班级信息');
		$("#addClassForm").attr("action","saveSetClass.do");
		$( "#classForm" ).dialog("open");
	});
	
	$( "#classForm" ).dialog({
		autoOpen: false,
		height: 400,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				$("#sVName").val($.trim($("#cVName").val()));
				$("#sotheruserid").val($.trim($("#cotheruserid").val()));
				$("#sDCreateClassTime").val($.trim($("#cDCreateClassTime").val()));
				$("#sDBeginLessionTime").val($.trim($("#cDBeginLessionTime").val()));
				$("#sDEndLessionTime").val($.trim($("#cDEndLessionTime").val()));
				$("#sIModel").val(getSelRadioValue('cIModel'));
				if($("#sVName").val()==""){
					alert("班级名称不能为空。");
					return;
				}
				if($("#sotheruserid").val()==""){
					alert("请选择责任教员。");
					return;
				}
				$( this ).dialog( "close" );
				$("#addClassForm").submit();
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
	$("button.icon").click(function(){
		var id = this.id;
		if(id==""){
			return;	
		}
		var type= id.split(",")[0];
		var vid = id.split(",")[1];
		if(type==0){//edit
			execEdit(vid);
		}else{//delete
			window.location.replace("deleteClassInfoById.do?id=" + vid);
		}
	});
	function execEdit(id){
		params = {"id":id};
		$.ajax({
			type:"post",
			url:"showClassInfoById.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值
				$("#sVId").val(data.VId);
				
				$("#cVName").val(data.VName);				
				$("#VCode").val(data.VConditions);
				$("#VJcname").val(data.VLicenseform);
				$("#cotheruserid").val(data.userid);
				$("#cotheruserid").change();
				$("#cDCreateClassTime").val(data.DCreateClassTime);
				$("#cDBeginLessionTime").val(data.DBeginLessionTime);
				$("#cDEndLessionTime").val(data.DEndLessionTime);
				
				var r1=document.getElementsByName("cIModel");
				
				for(var i=0;i<r1.length;i++){
					if(r1[i].value==data.IModel){
						r1[i].checked=true;
					
					}
				}
				
				$("#classForm").dialog('option', 'title', '编辑班级信息');
				$("#addClassForm").attr("action","updateSetClass.do");
				$("#classForm").dialog( "open" );
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
	}
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
    <s:param name="parentid">4028816a4a9df179014a9e3beb0c0003</s:param>
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
</s:else><s:if test="#r==null || #r==0">
<button class="green"  id="addButton">新增班级</button></s:if>

<div class="buttonInput relative left" width="160" height="28">
<input id="searchOutlineName" title="班级名称"  name="searchOutlineName"  type="text" maxlength="50" value="班级名称" /><button id="modalDialogButton4">查询</button>
</div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2" >

	<div class="panelContent">

	
        <table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
        	<thead>
             	<tr class="trSpliter">
				<th width="5"></th>
                <th width="230"></th>
				<th width="100"></th>
				<th width="100"></th>
				<th width="100"></th>
                <th width="100"></th>
                <th width="80"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortableGray"></th>
                <th class="thSortableGray">班级名称</th>
                <th class="thSortableGray">责任教员</th>
                <th class="thSortableGray">开班日期</th>
                <th class="thSortableGray">开课日期</th>
                <th class="thSortableGray">结课日期</th>
                <th class="thSortableGray">训练模式</th>
                <th class="thSortableGray"></th>
			  </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
			  <tr>
              	<td>&nbsp;</td>
                <td >${VName}</td>
				<td>${TOtheruser.VName}</td>
				<td><s:date name="DCreateClassTime" format="yyyy-MM-dd" /></td>
                <td><s:date name="DBeginLessionTime" format="yyyy-MM-dd" /></td>
                <td><s:date name="DEndLessionTime" format="yyyy-MM-dd" /></td>
                <td><s:if test='IModel==1'>国外训练</s:if><s:else>国内训练</s:else></td>
                <td><s:if test="#r==null || #r==0"><button class="icon"  icon="ui-icon-pencil" title="编辑" id="0,${VId}"></button><button class="icon" icon="ui-icon-trash" title="删除"  id="1,${VId}"></button></s:if></td>
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
			  </tr>
              </s:iterator>
			</tbody>
		</table><s:include value="../common/pagination_system.jsp" />
</div>
</div>
</div>
</div>

<div id="classForm"  title="新增班级">
  <fieldset>

         班级名称：
         <input type="text"  id="cVName" class="text ui-widget-content ui-corner-all" style="width:240px;" />
         <span class="panelLine"></span>
         责任教员：
         <div class="dropDownList">
			<button>请选择</button>
			<ul>
				<li>
                <a href="#N" val="" class="inline" style="width:50px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
				<s:iterator value="otherUserList">
				<a href="#N" val="${VId}" class="inline" style="width:50px;">${VName}</a>
				</s:iterator>
                </li>
			</ul>
		  <input type="hidden" id="cotheruserid" value=""/>
		</div>
    	 <span class="panelLine"></span>
    	开班日期：
        <input type="text" id="cDCreateClassTime" class="Wdate ui-widget-content ui-corner-all text"  style="width:90px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDCreateClassTime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" />   
        <span class="panelLine"></span>
    	开课日期：
        <input type="text"  id="cDBeginLessionTime"  class="Wdate ui-widget-content ui-corner-all text"  style="width:90px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDBeginLessionTime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})"  value="${viewDate}" />   	
        <span class="panelLine"></span>
    	结课日期：
        <input type="text"  id="cDEndLessionTime" class="Wdate ui-widget-content ui-corner-all text"  style="width:90px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDEndLessionTime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}"  />   	
        <span class="panelLine"></span>
    训练模式：<input name="cIModel" type="radio" value="0" checked>国内训练&nbsp;&nbsp;&nbsp;&nbsp;<input name="cIModel" type="radio" value="1">国外训练
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

<form  action="?" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
</form>
<form id="addClassForm" method="post" action="saveSetClass.do">
<input type="hidden" name="setClass.VId" id="sVId" />
<input type="hidden" name="setClass.VName" id="sVName" />
<input type="hidden" name="setClass.TOtheruser.VId" id="sotheruserid" />
<input type="hidden" name="setClass.DCreateClassTime" id="sDCreateClassTime" />
<input type="hidden" name="setClass.DBeginLessionTime" id="sDBeginLessionTime" />
<input type="hidden" name="setClass.DEndLessionTime" id="sDEndLessionTime" />
<input type="hidden" name="setClass.IModel" id="sIModel" />
</form>

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
</script>