<%@ page language="java"  import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>课目类型管理</title>
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
	//功能9
	var name = $( "#vname" ),
		allFields = $( [] ).add( name ),
		tips = $( ".validateTips" );

	function updateTips( t ) {
		tips.html( t ).addClass( "ui-state-highlight" );
		setTimeout(function() {
			tips.removeClass( "ui-state-highlight", 1500 );
		}, 2000 );
	}

	function checkLength( o, n, min, max ) {
		if ( o.val().length > max || o.val().length < min ) {
			o.addClass( "error" ).focus();
			updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n + "的长度必须在" +
				min + "和" + max + "之间" );
			return false;
		} else {
			return true;
		}
	}

	function checkRegexp( o, regexp, n ) {
		if ( !( regexp.test( o.val() ) ) ) {
			o.addClass( "error" ).focus();
			updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n );
			return false;
		} else {
			return true;
		}
	}

	$( "#dialogForm1" ).dialog({//添加、编辑窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				//确定按钮的处理代码段：
				var bValid = true;
				allFields.removeClass( "error" );

				bValid = bValid && checkLength( name, "新建课目类型名称", 1, 100);

				if ( bValid ) {

					$("#cvname").val($("#vname").val());
					$("#unitSubjectForm").submit();
					$( this ).dialog( "close" );
				}


			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
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
			url:"showTraininglessonunitdictionById.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值
				//$("#VId").val(data.VId);
				//$("#vname").val(data.VName);				
				
				//$("#dialogForm1").dialog('option', 'title', '编辑课目类型');
				//$("#unitSubjectForm").attr("action","updateTraininglessonunitdiction.do");
				//tips.removeClass("ui-state-highlight").html("请填写所有信息");
				//$("#modalDialogButton2 input.error").removeClass("error");
				//$("#dialogForm1").dialog( "open" );
				
			//	clearValue();
				//编辑为窗口赋值
				$("#VId").val(data.VId);
				$("#cVName").val(data.VName);
				
			//	$("#cVNo").val(data.VNo);
				if(data.VLicenseform!=null && data.VLicenseform!=""){
					var r1=document.getElementsByName('zhizhao');
					for(i=0;i<r1.length;i++){
						if(data.VLicenseform.indexOf(r1[i].value)!=-1){
							r1[i].checked=false;
							r1[i].click();
						}
					}
				}
				
			//	$("#cVConditions").val(data.VConditions);
			//	$("#cVPassstandard").val(data.VPassstandard);
				
				$("#newUnitDialog").dialog('option', 'title', '编辑课目类型');
				$("#unitSubjectForm").attr("action","updateTraininglessonunitdiction.do");
				$("#newUnitDialog").dialog( "open" );
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
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
			$("#dialogForm3Warning").html("请选择要删除的内容。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#unitSubjectDicIdListId").val(str);
		$( "#dialogForm2" ).dialog( "open" );
		
	});

	
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchUser").val()=="课目类型名称"){
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
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
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
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
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
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});
	
	$("#modalDialogButton1").click(function(){// 添加
		$("#cVName").val("");
		$("#newUnitDialog").dialog('option', 'title', '新建课目类型');	
		$("#unitSubjectForm").attr("action","createTraininglessonunitdiction.do");
		$("#newUnitDialog").dialog( "open" );
		/*
		$("#dialogForm1").dialog('option', 'title', '新建课目类型');
		tips.removeClass("ui-state-highlight").html("请填写所有信息");
		$("#modalDialogButton1 input.error").removeClass("error");
		$("#VId").val("");
		$("#unitSubjectForm").attr("action","createTraininglessonunitdiction.do");
		$("#dialogForm1").dialog( "open" );
		*/
	});
	$( "#newUnitDialog" ).dialog({//添加单元 
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#VName").val($("#cVName").val());
				//$("#VNo").val($("#cVNo").val());
				//$("#VLicenseform").val(getSelValue('zhizhao'));
				//$("#VConditions").val($("#cVConditions").val());
				//$("#VPassstandard").val($("#cVPassstandard").val());
				
				var name = $("#VName").val();	
				if($.trim(name)==""){
					alert("单元名称不能为空。");
					return;
				}
				$("#unitSubjectForm").submit();
				$( this ).dialog( "close" );


			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	function getSelValue(name){
		var str="";
		var r1=document.getElementsByName(name);
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str+=r1[i].value + ",";
			}
		}
		return str;
	}
});
function clearValue(){
	$("#cVName").val("");
	$("#cVNo").val("");
	clearSelValue('zhizhao');
	$("#cVConditions").val("");
	$("#cVPassstandard").val("");	
}
function clearSelValue(name){
	var r1=document.getElementsByName(name);
	for(i=0;i<r1.length;i++){
		r1[i].checked=true;
		r1[i].click();
	}
}
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
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">新建课目类型</button>  
    <button class="normal barLeft" id="modalDialogButton2">编辑</button>
    <button class="normal barMiddle" id="modalDialogButton3">删除</button>
    <button class="normal barRight" id="modalDialogButton5">刷新</button>
</s:if>
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" name="searchUser"  type="text" maxlength="50" title="课目类型名称" value="课目类型名称"/><button id="modalDialogButton4">查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="39"></th>
				<th width="150"></th>
				<th width="60"></th>
				<th width="168"></th>
				<th width="144"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">课目类型名称</th>
				<th class="thSortableGray">&nbsp;</th>
				<th class="thSortableGray">&nbsp;</th>
				<th class="thSortableGray">&nbsp;</th>
				<th class="thSortableGray">&nbsp;</th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="lessonSortList">
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
				<td class="searchRange" >${VName}</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" ><s:if test="#r==null || #r==0"><span class="hide"><button class="icon"  icon="ui-icon-pencil" title="编辑" id="0,${VId}"></button><button class="icon" icon="ui-icon-trash" title="删除"  id="1,${VId}"></button></span></s:if></td>
				<td></td>
				<td></td>
			  </tr>
              </s:iterator>
			 <s:iterator value="(15-lessonSortList.size).{ #this }">
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
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


<div id="dialogForm1"  title="新建课目类型">
	<p class="validateTips" >请填写信息</p>
	<fieldset>
    	<label for="vname">课目类型名称</label>
		<input type="text"  id="vname" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	
</div>

<div id="newUnitDialog"  title="新建科目类型"> <br>

课目类型名称：&nbsp;<input type="text"  id="cVName" class="text ui-widget-content ui-corner-all" style="width:140px;" />&nbsp;
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

<form id="unitSubjectForm" method="post" action="createTraininglessonunitdiction.do">
<input type="hidden" name="lessonSort.VId" id="VId"/>
<input type="hidden" name="lessonSort.VName" id="VName" />
</form>


<form  action="open_traininglessonunitdictionList.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
</form>
<form  action="deleteTraininglessonunitdiction.do" method="post" id="deleteForm">
<input name="unitSubjectDicIdStr" type="hidden" id="unitSubjectDicIdListId">
</form>
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#dialogForm4" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>
