<%@ page language="java"  import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>站名管理</title>
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
.fonts{ font-family:Arial;}
</style>
<script>
$(function() {

	$("div.dropDownList").each(function(i){
		new $.dropDownList(i,true,100);
	})
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
	$( "#dialogForm1" ).dialog({//添加、编辑窗口
		autoOpen: false,
		height: 380,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {

				var vname = $.trim($("#vname").val());
				if(vname==""){
					alert("站名不能为空。");
					$("#vname").focus();
					return;
				}
				$("#cvname").val($("#vname").val());
				$("#cVCode").val($("#VCode").val());
				$("#cVJcname").val($("#VJcname").val());
				var DArpx0=$.trim($("#DArpx0").val());
				if(DArpx0.length!=3 || !checkNum(DArpx0)){
					alert("经度第一个输入框，应输入三位数字。");
					$("#DArpx0").focus();
					return;
				}
				var DArpx1=$.trim($("#DArpx1").val());
				if(DArpx1.length!=2 || !checkNum(DArpx1)){
					alert("经度第二个输入框，应输入两位数字。");
					$("#DArpx1").focus();
					return;
				}
				var DArpx2=$.trim($("#DArpx2").val());
				if(DArpx2.length!=2 || !checkNum(DArpx2)){
					alert("经度第三个输入框，应输入两位数字。");
					$("#DArpx2").focus();
					return;
				}
				$("#cDArpx").val(DArpx0 + "," +  DArpx1 + "," + DArpx2);
				
				var DArpy0=$.trim($("#DArpy0").val());
				if(DArpy0.length!=2 || !checkNum(DArpy0)){
					alert("纬度第一个输入框，应输入两位数字。");
					$("#DArpy0").focus();
					return;
				}
				var DArpy1=$.trim($("#DArpy1").val());
				if(DArpy1.length!=2 || !checkNum(DArpy1)){
					alert("纬度第二个输入框，应输入两位数字。");
					$("#DArpy1").focus();
					return;
				}
				var DArpy2=$.trim($("#DArpy2").val());
				if(DArpy2.length!=2 || !checkNum(DArpy2)){
					alert("纬度第三个输入框，应输入两位数字。");
					$("#DArpy2").focus();
					return;
				}
				$("#cDArpy").val(DArpy0 + "," + DArpy1 + "," + DArpy2);
				$("#unitSubjectForm").submit();
				$( this ).dialog( "close" );
				


			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("#modalDialogButton1").click(function(){// 添加
		$("#dialogForm1").dialog('option', 'title', '新建机场信息');
		$("#vname").val("");
		$("#VCode").val("");
		$("#VJcname").val("");
		$("#DArpx").val("");
		$("#DArpy").val("");
		$("#VId").val("");
		$("#unitSubjectForm").attr("action","createStation.do");
		$("#dialogForm1").dialog( "open" );
	});

	$("#modalDialogButton2").click(function(){//编辑
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
			$("#dialogForm3Warning").html("请选择要编辑的内容。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}

		if(k>1){

			$("#dialogForm3Warning").html("请选择一条信息编辑。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		execEdit(str);
	});

	function execEdit(str){
		//通过json读取字典对象
		params = {"id":str};
		$.ajax({
			type:"post",
			url:"showStationById.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值
				$("#VId").val(data.VId);
				$("#vname").val(data.VName);				
				$("#VCode").val(data.VConditions);
				$("#VJcname").val(data.VLicenseform);
				var x = data.VNo;
				if(x.indexOf(",")==-1){
					$("#DArpx0").val("");
					$("#DArpx1").val("");
					$("#DArpx2").val("");
				}else{
					$("#DArpx0").val(x.split(",")[0]);
					$("#DArpx1").val(x.split(",")[1]);
					$("#DArpx2").val(x.split(",")[2]);
				}
				var y = data.VPassstandard;
				if(y.indexOf(",")==-1){
					$("#DArpy0").val("");
					$("#DArpy1").val("");
					$("#DArpy2").val("");
				}else{
					$("#DArpy0").val(y.split(",")[0]);
					$("#DArpy1").val(y.split(",")[1]);
					$("#DArpy2").val(y.split(",")[2]);
				}
				$("#dialogForm1").dialog('option', 'title', '编辑机场信息');
				$("#unitSubjectForm").attr("action","updateStation.do");
				$("#dialogForm1").dialog( "open" );
			},
			error:function(){
				$("#dialogForm3Warning").html("<br/>数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
	}
	$("button.icon").click(function(){
		var str = this.id;
		var opt = str.split(",")[0];
		var id = str.split(",")[1];
		if(opt==0){
			execEdit(id);
		}else{
			$("#unitSubjectDicIdListId").val(id);
			$( "#dialogForm2" ).dialog( "open" );
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
			$("#dialogForm3Warning").html("<br/>请选择要删除的内容。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#unitSubjectDicIdListId").val(str);
		$( "#dialogForm2" ).dialog( "open" );
		
	});

	
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchUser").val()=="名称"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($("#searchUser").val());
		}
		$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//刷新
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
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
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149eb4aa0005</s:param>
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
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">新建机场信息</button>
    
    <button class="normal barLeft" id="modalDialogButton2">编辑</button>
    <button class="normal barMiddle" id="modalDialogButton3">删除</button>
</s:if>
    <button class="normal <s:if test="#r==null || #r==0">barRight</s:if>" id="modalDialogButton5">全部</button>
    
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" name="searchUser" value="名称" title="名称"  type="text" maxlength="50"/><button id="modalDialogButton4">查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="40"></th>
				<th width="140"></th>
				<th width="100"></th>
				<th width="140"></th>
				<th width="140"></th>
                <th width="140"></th>
                <th width="140"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">站名</th>
                <th class="thSortableGray">四字代码</th>
				<th class="thSortableGray">机场名称</th>
				<th class="thSortableGray">ARP经度</th>
                <th class="thSortableGray">ARP纬度</th>
				<th class="thSortableGray">创建时间</th>
                <th class="thSortableGray"></th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="stationList">
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
				<td>${VName}</td>
                <td>${VCode}</td>
                <td>${VJcname}</td>
                <td class="fonts">E${DArpx}</td>
                <td class="fonts">N${DArpy}</td>
				<td><s:date name="DCreateDate" format="yyyy-MM-dd HH:mm:ss" /></td>
				<td><s:if test="#r==null || #r==0"><span class="hide"><button class="icon"  icon="ui-icon-pencil" title="编辑" id="0,${VId}"></button><button class="icon" icon="ui-icon-trash" title="删除"  id="1,${VId}"></button></span></s:if></td>
				
				
			  </tr>
              </s:iterator>
			 <s:iterator value="(20-stationList.size).{ #this }">
			  <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
				<td></td>
				<td></td>
			  </tr>
              </s:iterator>
			</tbody>
		</table>

	</div>

</div>

</div>


</div>


<div id="dialogForm1"  title="新建机场信息"><br>
<fieldset>
<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30%" align="right">站名：</td>
    <td width="70%"><input type="text"  id="vname" class="text ui-widget-content ui-corner-all" style="width:200px;" /></td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">四字代码：</td>
    <td><input type="text"  id="VCode" class="text ui-widget-content ui-corner-all"  style="width:200px;" /></td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">机场名称：</td>
    <td><input type="text"  id="VJcname" class="text ui-widget-content ui-corner-all"  style="width:200px;" />
</td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">ARP经度：</td>
    <td class="fonts">
    E <input type="text"  id="DArpx0" class="text ui-widget-content ui-corner-all" maxlength="3"  style="width:30px;" />°
    <input type="text"  id="DArpx1" class="text ui-widget-content ui-corner-all" maxlength="2" style="width:30px;" />ˊ
    <input type="text"  id="DArpx2" class="text ui-widget-content ui-corner-all" maxlength="2"  style="width:30px;" />&quot;
</td>
  </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">ARP纬度：</td>
    <td class="fonts">
    N <input type="text"  id="DArpy0" class="text ui-widget-content ui-corner-all" maxlength="2"  style="width:30px;" />°
    <input type="text"  id="DArpy1" class="text ui-widget-content ui-corner-all"  maxlength="2" style="width:30px;" />ˊ
    <input type="text"  id="DArpy2" class="text ui-widget-content ui-corner-all"  maxlength="2" style="width:30px;" />&quot;</td>
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

<div id="dialogForm3">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span>
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

<form id="unitSubjectForm" method="post" action="createStation.do">
<input type="hidden" name="station.VId" id="VId"/>
<input type="hidden" name="station.VName" id="cvname" />
<input type="hidden" name="station.VCode" id="cVCode" />
<input type="hidden" name="station.VJcname" id="cVJcname" />
<input type="hidden" name="station.DArpx" id="cDArpx" />
<input type="hidden" name="station.DArpy" id="cDArpy" />
</form>

<form  action="open_stationList.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
</form>
<form  action="deleteStation.do" method="post" id="deleteForm">
<input name="unitSubjectDicIdStr" type="hidden" id="unitSubjectDicIdListId">
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
