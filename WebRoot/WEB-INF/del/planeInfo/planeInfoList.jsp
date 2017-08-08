<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>飞机型号管理</title>
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
<style>
/*功能9*/
fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
</style>
<script>
$(function() {

	/*
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
	*/
	function checkRegexp( o) {
		var re = /^\d+(\.\d+)?$/; //判断浮点数
		if ( re.test( o ) ) {
			return true;
		} else {
			return false;
		}
	}

	$( "#dialogForm1" ).dialog({//添加、编辑窗口
		autoOpen: false,
		height: 385,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
					if($.trim($("#VName").val())==""){
						alert("型号名称不能为空。");
						$("#VName").focus();
						return false;
					}
					$("#unitSubjectForm").submit();
					$( this ).dialog( "close" );

			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("#modalDialogButton1").click(function(){// 添加
		$("#dialogForm1").dialog('option', 'title', '添加飞机型号');
		$("#VId").val("");
		$("#VName").val("");
		$("#VChangshang").val("");
		$("#VXingzhi").val("");
		$("#VFtd").val("");
		$("#DShouming").val("");
		$("#DJbweight").val("");
		$("#DFweight").val("");
		$("#DLweight").val("");
		$("#DJgweight").val("");
		$("#VBz").val("");
		$("#unitSubjectForm").attr("action","createPlaneform.do");
		$( "#dialogForm1" ).dialog( "open" );
	});

	function execEdit(str){
		//通过json读取字典对象
		params = {"id":str};
		$.ajax({
			type:"post",
			url:"readPlaneformById.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值
				$("#VId").val(data.VId);
				$("#VName").val(data.VName);
				$("#VChangshang").val(data.VChangshang);			
				$("#VXingzhi").val(data.VXingzhi);
				$("#VFtd").val(data.VFtd);
				$("#DShouming").val(data.DShouming);
				$("#DJbweight").val(data.DJbweight);
				$("#DFweight").val(data.DFweight);
				$("#DLweight").val(data.DLweight);
				$("#DJgweight").val(data.DJgweight);
				$("#VBz").val(data.VBz);
				$("#dialogForm1").dialog('option', 'title', '编辑飞机型号');
				$("#unitSubjectForm").attr("action","updatePlaneform.do");
				$("#dialogForm1").dialog( "open" );
			},
			error:function(){
				$("#dialogForm4Span").html("数据库连接错误，获取对象失败，请重试。");
				$( "#backResultDialogForm" ).dialog( "open" );
				return;
			}
		});	
	}
	
	$("img.icons").click(function(){
		var str = this.id;
		var opt = str.split(",")[0];
		var id = str.split(",")[1];
		var t = str.split(",")[2];
		if(opt==0){//编辑
			$("#formVId").val(id);
			$("#ICycleid").val(t);
			$("#checkformid").attr("action","updateSetPlaneCheckForm.do");
			$( "#setDialogForm" ).dialog( "open" );
		}else{
			$("#setid").val(id);//删除
			$("#deleteSetForm").submit();
		}
	});
	
	$("#modalDialogButton3").click(function(){//删除
		var k =0;
		var str="";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				str+=r1[i].value+",";
			}
		}
		
		if(k==0){
			$("#dialogForm4Span").html("请选择要删除的内容。");
			$( "#backResultDialogForm" ).dialog( "open" );
			return;
		}
		$("#unitSubjectDicIdListId").val(str);
		$("#dialogForm3Warning").html("确认删除选中的信息吗？<br/>信息删除后将不能恢复。");
		$( "#deleteDialogForm" ).dialog( "open" );
		
	});
	$("#editButton").click(function(){//edit
		var k =0;
		var str="";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				str=r1[i].value;
			}
		}
		
		if(k==0){
			$("#dialogForm4Span").html("请选择要编辑的内容。");
			$( "#backResultDialogForm" ).dialog( "open" );
			return;
		}
		execEdit(str);
	});
	$("#setButton").click(function(){//set
		var k =0;
		var str="";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				str=r1[i].value;
			}
		}
		
		if(k==0){
			$("#dialogForm4Span").html("请选择机型。");
			$( "#backResultDialogForm" ).dialog( "open" );
			return;
		}
		$("#formVId").val("");
		$("#ICycleid").val("");
		$("#VFormid").val(str);
		$("#checkformid").attr("action","saveSetPlaneCheckForm.do");
		$( "#setDialogForm" ).dialog( "open" );
	});
	$( "#setDialogForm" ).dialog({
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var ICycleid = $.trim($("#ICycleid").val());
				if(ICycleid==""){
					alert("定检类型不能为空。");
					$("#ICycleid").focus();
					return;
				}
				if(!checkNum(ICycleid)){
					alert("定检类型应为数字。");
					$("#ICycleid").focus();
					return;
				}
				$("#checkformid").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#deleteDialogForm" ).dialog({//删除信息窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#deleteForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#backResultDialogForm" ).dialog({//操作数据库返回提示窗口
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
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchUser").val()!="型号名称")								
			$("#searchKey").val($("#searchUser").val());
		$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//全部
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});
});
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
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">添加型号</button>
    <button id="setButton" class="green" >设置定检类型</button>
    
    <button class="normal barLeft" id="editButton">编辑</button>
    <button class="normal barMiddle" id="modalDialogButton3">删除</button>
</s:if>
    <button class="normal <s:if test="#r==null || #r==0">barRight</s:if>" id="modalDialogButton5">全部</button>
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" value="型号名称" name="searchUser"  type="text" maxlength="50" title="型号名称"/><button id="modalDialogButton4" >查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">
	<div class="panelContent">
		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="40"></th>
				<th width="70"></th>
				<th width="90"></th>
				<th width="90"></th>
				<th width="90"></th>
                
                <th width="70"></th>
                <th width="100"></th>
                <th width="100"></th>
                <th width="100"></th>
                <th width="70"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><!--<input type="checkbox" value="" id="checkAllUsersBox"><b></b--></th>
				<th class="thSortableGray">型号名称</th>
				<th class="thSortableGray">生产厂商</th>
				<th class="thSortableGray">设备性质</th>
				<th class="thSortableGray">存在FTD</th>
				<th class="thSortableGray">寿命</th>
				<th class="thSortableGray">增加基本重量</th>
                <th class="thSortableGray">最大起飞全重</th>
                <th class="thSortableGray">最大着陆重量</th>
                <th class="thSortableGray">结构重量</th>
                <th class="thSortableGray">定检类型(小时)</th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="planeformList" >
			  <tr>
				<td><input name="checkboxName" type="radio" value="${VId}"><b></b></td>
				<td>${VName}</td>
				<td>${VChangshang}</td>
				<td>${VXingzhi}</td>
				<td>${VFtd}</td>
				<td>${DShouming}</td>
                <td>${DJbweight}</td>
                <td>${DFweight}</td>
                <td>${DLweight}</td>
                <td>${DJgweight}</td>
				<td>
                <s:iterator value="checkList">
                <div style="float:left; width:40px;">${ICycle}</div><s:if test="#r==null || #r==0"><div style="padding-top:2px;"><img src="themes/cupertino/images/edit.png" class="icons" id="0,${VId},${ICycle}" style="cursor:pointer"  title="编辑">  <img src="themes/cupertino/images/subfu.png" class="icons" id="1,${VId},${ICycle}"  title="删除" style="cursor:pointer" ></div></s:if>
                </s:iterator>
                </td>
			  </tr>
              </s:iterator>
			 <s:iterator value="(13-planeformList.size).{ #this }">
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
		</table>
</div>
</div>
</div>
</div>

<div id="setDialogForm" title="设置定检类型">   
<fieldset>
<form action="saveSetPlaneCheckForm.do" method="post" id="checkformid">
<input type="hidden" name="checkForm.VId" id="formVId"/>
<input type="hidden" name="checkForm.VFormid" id="VFormid"/>
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="30%" height="90" align="center" valign="middle">定检类型：</td>
<td width="70%" align="left" valign="middle">
<input type="text" name="checkForm.ICycle" id="ICycleid" class="text ui-widget-content ui-corner-all"  style="width:80px;" />小时</td>
</tr>
</table>
</form>
</fieldset>
</div>

<div id="dialogForm1"  title="添加型号">
<form id="unitSubjectForm" method="post" action="createPlaneform.do">
<input type="hidden" name="planeform.VId" id="VId"/>
<table width="98%" border="0">
  <tr>
    <td width="18%" align="right">型号名称：</td>
    <td width="32%"><input type="text" name="planeform.VName" id="VName" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td width="18%" align="right">厂商：</td>
    <td width="32%"><input type="text" name="planeform.VChangshang"  id="VChangshang" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
  </tr>
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">设备性质：</td>
    <td><input type="text" name="planeform.VXingzhi"  id="VXingzhi" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td align="right">存在FTD：</td>
    <td><input type="text"  name="planeform.VFtd" id="VFtd" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
  </tr>
  
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">寿命：</td>
    <td><input type="text"  name="planeform.DShouming"  id="DShouming" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td align="right">基本重量：</td>
    <td><input type="text"  name="planeform.DJbweight"  id="DJbweight" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
  </tr>
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">最大起飞全重：</td>
    <td><input type="text"  name="planeform.DFweight"  id="DFweight" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td align="right">最大着陆重量：</td>
    <td><input type="text" name="planeform.DLweight" id="DLweight" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
  </tr>
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">结构重量：</td>
    <td><input type="text" name="planeform.DJgweight" id="DJgweight" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td align="right">备注：</td>
    <td><input type="text"  name="planeform.VBz"  id="VBz" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
  </tr>
</table>
</form>
</div>

<div id="deleteDialogForm">   
<fieldset>
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="80%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</fieldset>
</div>

<div id="backResultDialogForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="80%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm4Span"></span></td>
</tr>
</table>
</div>

<form  action="open_planeInfoList.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
</form>
<form  action="deletePlaneform.do" method="post" id="deleteForm">
<input name="ids" type="hidden" id="unitSubjectDicIdListId">
</form>
<form  action="deleteSetPlaneCheckForm.do" method="post" id="deleteSetForm">
<input name="id" type="hidden" id="setid">
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
/*
var isWrite  = $("#isWrite").val();
if(isWrite==0){
	$("#modalDialogButton1").css('display','');
	
	$("#setButton").css('display','');
	$("#editButton").css('display','');
	$("#modalDialogButton3").css('display','');
	$("#modalDialogButton5").attr("class", "normal barRight");
}else{
	$("#modalDialogButton1").css('display','none');
	
	$("#setButton").css('display','none');
	$("#editButton").css('display','none');
	$("#modalDialogButton3").css('display','none');
	$("#modalDialogButton5").attr("class", "normal");
}
*/
</script>