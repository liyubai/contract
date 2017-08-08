<%@ page language="java"  import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>航校管理</title>
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
/*功能9*/
fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
</style>
<script>
$(function() {

	$( "#dialogForm1" ).dialog({
		autoOpen: false,
		height: 400,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				var VSchoolname = $("#cVSchoolname").val();
				if(VSchoolname==""){
					alert("航校名称不能为空。");
					$("#cVSchoolname").focus();
					return;
				}
				$("#VSchoolname").val($("#cVSchoolname").val());
				$("#VCountry").val($("#cVCountry").val());
				$("#VAddress").val($("#cVAddress").val());
				$("#VWeb").val($("#cVWeb").val());
				$("#VCode").val($("#cVCode").val());
				$("#DEffectdate").val($("#cDEffectdate").val());
				$("#unitSubjectForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
		$( "#editDialogForm" ).dialog({
		autoOpen: false,
		height: 400,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				var VSchoolname = $("#cVSchoolname2").val();
				if(VSchoolname==""){
					alert("航校名称不能为空。");
					$("#cVSchoolname2").focus();
					return;
				}
				$("#eVSchoolname").val($("#cVSchoolname2").val());
				$("#eVCountry").val($("#cVCountry2").val());
				$("#eVAddress").val($("#cVAddress2").val());
				$("#eVWeb").val($("#cVWeb2").val());
				$("#eVCode").val($("#cVCode2").val());
				$("#eDEffectdate").val($("#cDEffectdate2").val());
				$("#editForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("#modalDialogButton1").click(function(){
		$("#dialogForm1").dialog( "open" );
	});
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchUser").val()=="航校名称"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($.trim($("#searchUser").val()));
		}
		$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//刷新
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});
	$("button.icon").click(function(){
		var str = this.id;
		var opt = str.split(",")[0];
		var id = str.split(",")[1];
		if(opt==0){
			$("#eid").val(id);
			params = {"id":id};
			$.ajax({
				async:false,//同步请求
				type:"post",
				url:"readVAbroadaviationschool.do",
				data:params,
				dataType:"json",
				success:function(data){
						if(data==null){
						alert("读取数据错误。");
						return;
					}
					$("#cVSchoolname2").val(data.VSchoolname);
					$("#cVCountry2").val(data.VCountry);
					$("#cVAddress2").val(data.VAddress);
					$("#cVWeb2").val(data.VWeb);
					$("#cVCode2").val(data.VCode);
					$("#cDEffectdate2").val(data.DEffectdate);
				},
				error:function(){
					$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
			});	
			$( "#editDialogForm" ).dialog( "open" );
		}else{
			$("#unitSubjectDicIdListId").val(id);
			$( "#dialogForm2" ).dialog( "open" );
		}
		
	});
	$( "#dialogForm2" ).dialog({//删除内容窗口
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
	$( "#dialogForm4" ).dialog({//操作数据库返回提示窗口
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
function orderByStyle(id){
	$("#orderid").val(id);
	$("#searchForm").submit();
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c014714a1e0b9000a</s:param>
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
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">添加航校</button></s:if>
    <button class="normal" id="modalDialogButton5">全部</button>
    
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" name="searchUser"  type="text" maxlength="50" value="航校名称" title="航校名称"/><button id="modalDialogButton4" >查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="2">
			<thead>
			  <tr class="trSpliter">
				<th width="120"></th>
				<th width="80"></th>
                <th width="340"></th>
                <th width="180"></th>
                <th width="100"></th>
                <th width="90"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortable" onClick="orderByStyle('VSchoolname')">航校名称<span class="ui-icon ui-icon-arrow-1-n" role="presentation" >↑</span></th>
                <th class="thSortable" onClick="orderByStyle('VCountry')">所在国<span class="ui-icon ui-icon-arrow-1-n" role="presentation" >↑</span></th>
                <th class="thSortableGray">地址</th>
                <th class="thSortableGray">网址</th>
       			<th class="thSortable" onClick="orderByStyle('VCode')">认可证书编号<span class="ui-icon ui-icon-arrow-1-n" role="presentation" >↑</span></th>
				<th class="thSortable" onClick="orderByStyle('DEffectdate')">有效期<span class="ui-icon ui-icon-arrow-1-n" role="presentation" >↑</span></th>
				<th class="thSortableGray">&nbsp;</th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="schoolList">
			  <tr>
				<td>${VSchoolname}</td>
                <td>${VCountry}</td>
                <td>${VAddress}</td>
                <td>${VWeb}</td>
                <td>${VCode}</td>
                <td><s:date name="DEffectdate" format="yyyy-MM-dd" /></td>
				<td><s:if test="#r==null || #r==0"><span class="hide"><button class="icon"  icon="ui-icon-pencil" title="编辑" id="0,${VId}"></button><button class="icon" icon="ui-icon-trash" title="删除"  id="1,${VId}"></button></span></s:if></td>
			  </tr>
              </s:iterator>
			 <s:iterator value="(20-schoolList.size).{ #this }">
			  <tr>
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

<div id="dialogForm1"  title="新建航校信息">
<fieldset>
<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30%" align="right">航校名称：</td>
    <td width="70%"><input type="text"  id="cVSchoolname" class="text ui-widget-content ui-corner-all"  style="width:200px;" /></td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">所在国：</td>
    <td><input type="text"  id="cVCountry" class="text ui-widget-content ui-corner-all"  style="width:200px;" /></td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">地址：</td>
    <td><input type="text"  id="cVAddress" class="text ui-widget-content ui-corner-all"  style="width:200px;" />
</td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">网址：</td>
    <td><input type="text"  id="cVWeb" class="text ui-widget-content ui-corner-all"  style="width:200px;" />
</td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">认可证书编号：</td>
    <td><input type="text"  id="cVCode" class="text ui-widget-content ui-corner-all"  style="width:200px;" /></td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">有效期：</td>
    <td><input type="text"  id="cDEffectdate" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDEffectdate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
</table>

</fieldset>
</div>

<div id="editDialogForm"  title="编辑航校信息">
<fieldset>
<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30%" align="right">航校名称：</td>
    <td width="70%"><input type="text"  id="cVSchoolname2" class="text ui-widget-content ui-corner-all"  style="width:200px;" /></td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">所在国：</td>
    <td><input type="text"  id="cVCountry2" class="text ui-widget-content ui-corner-all"  style="width:200px;" /></td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">地址：</td>
    <td><input type="text"  id="cVAddress2" class="text ui-widget-content ui-corner-all"  style="width:200px;" />
</td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">网址：</td>
    <td><input type="text"  id="cVWeb2" class="text ui-widget-content ui-corner-all"  style="width:200px;" />
</td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">认可证书编号：</td>
    <td><input type="text"  id="cVCode2" class="text ui-widget-content ui-corner-all"  style="width:200px;" /></td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">有效期：</td>
    <td><input type="text"  id="cDEffectdate2" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDEffectdate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});" onKeyPress="return false" onpaste="return false" /></td>
  </tr>
</table>
</fieldset>
</div>

<div id="dialogForm2">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确定要删除选中的信息吗？<br/>信息删除后不可恢复。</span>
		</div>
	</fieldset>	
</div>
<div id="dialogForm4">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555; " id="dialogForm4Span"></span>
		</div>
	</fieldset>	
</div>

<form id="unitSubjectForm" method="post" action="createforeignSchoolBaseInfo.do">
<input type="hidden" name="school.VSchoolname" id="VSchoolname" />
<input type="hidden" name="school.VCountry" id="VCountry" />
<input type="hidden" name="school.VAddress" id="VAddress" />
<input type="hidden" name="school.VWeb" id="VWeb" />
<input type="hidden" name="school.VCode" id="VCode" />
<input type="hidden" name="school.DEffectdate" id="DEffectdate" />
</form>

<form id="editForm" method="post" action="updateforeignSchoolBaseInfo.do">
<input type="hidden" name="school.VSchoolname" id="eVSchoolname" />
<input type="hidden" name="school.VId" id="eid" />
<input type="hidden" name="school.VCountry" id="eVCountry" />
<input type="hidden" name="school.VAddress" id="eVAddress" />
<input type="hidden" name="school.VWeb" id="eVWeb" />
<input type="hidden" name="school.VCode" id="eVCode" />
<input type="hidden" name="school.DEffectdate" id="eDEffectdate" />
</form>

<form  action="deleteForeignSchoolBaseInfo.do" method="post" id="deleteForm">
<input name="id" type="hidden" id="unitSubjectDicIdListId">
</form>
<form  action="?" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
<input name="order" type="hidden" id="orderid">
</form>
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html("<br/>"+operateResult);
		$( "#dialogForm4" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>