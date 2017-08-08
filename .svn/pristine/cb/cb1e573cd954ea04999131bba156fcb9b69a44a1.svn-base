<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>其他人员列表管理</title>

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
<!-- 树形相关开始-->
<link rel="STYLESHEET" type="text/css" href="../codebase/dhtmlxtree.css">
<script src="../codebase/dhtmlxcommon.js"></script>
<script src="../codebase/dhtmlxtree.js"></script>
<script type="text/javascript" src="../codebase/dhtmlxmenu.js"></script>
<link rel="stylesheet" type="text/css" href="../MenuSkins/dhtmlxmenu_dhx_blue.css"/>
<!-- 树形相关结束-->
<style>
.testDiv { padding: 1px; }
#rightPartC > div { min-width: 760px; } 
</style>
<script>
A_WIDTH=200; //注意，不要写成var A_WIDTH，这个值已经在function.js中定义好了，只需要重新赋值
C_WIDTH=300; //注意，不要写成var C_WIDTH，这个值已经在function.js中定义好了，只需要重新赋
$(function() {
	/*
	var $checkboxes=$("input[name='contractIdList']"),$checkAllUsersBox=$("#isCheckBoxButton");
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
	//功能5
	/*
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		new $.dropDownList(i,true,100);
	})
	*/
	//功能9
	var name = $( "#vname" ),
		desc = $( "#iorder" ),
		allFields = $( [] ).add( name ).add( desc ),
		tips = $( ".validateTips" );

	function updateTips( t ) {
		tips.html( t ).addClass( "ui-state-highlight" );
		tips.removeClass( "ui-state-highlight", 1500 );
		$("#input.error").removeClass("error");
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
		if (!(regexp.test( o.val()))) {
			o.addClass( "error" ).focus();
			updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n );
			return false;
		} else {
			return true;
		}
	}
	$( "#dialogForm1" ).dialog({
		autoOpen: false,
		height: 240,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				//确定按钮的处理代码段：
				var bValid = true;
				allFields.removeClass( "error" );
				bValid = bValid && checkLength( name, "部门名称", 1, 100);
				//bValid = bValid && checkLength( desc, "部门排序", 1, 100);
				var regexp = /^\d{1,}$/;
				bValid = bValid && checkRegexp( desc, regexp,"部门排序至少为1位数字！");
				if ( bValid ) {
				    $("#cvname").val($("#vname").val());
					$("#ciorder").val($("#iorder").val());
					$("#CVParentid").val($("#VParentid").val());
					params = {"department.VId":$("#VId").val(),"department.VParentid":$("#CVParentid").val(),"department.VName":$("#cvname").val(),"department.IOrder":$("#ciorder").val(),"key":$("#key").val()};
					$.ajax({
						type:"post",
						url:"saveDeptanotherDeptAction.do",
						data:params,
						dataType:"json",
						success:function(data){
							reloadPlan();
						},
						error: function (XMLHttpRequest, textStatus, errorThrown){
							//if(textStatus=='parsererror'){
								//reloadPlan();
							//}
							alert("部门保存失败 ，参数传递错误！");
							return false;
						}
					});	
					$( this ).dialog( "close" );
				}
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				updateTips("");
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});

     //新建人员
	$("#modalDialogButton1").click(function(){
		var deptid = tree.getSelectedItemId();
		var deptname = tree.getSelectedItemText();
		if(deptid==null || deptid==""){
			$("#dialogForm3Warning").html("<br/>请先选择要添加人员所在部门！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
		}else{
			$("#deptId").val(deptid);
			$("#deptName").val(deptname);

			$( "#dialogFormNewPeople" ).submit();
		}
	});
     
    //删除人员
	$("#modalDialogButton2").click(function(){
        //将选中的角色的id使用逗号（,）拼接在一起
        var count =0;
		var ids="";
		var r1 = document.getElementsByName('contractIdList');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				count++;
				ids += r1[i].value + ",";
			}
		}
		if(count == 0){
			$("#dialogForm3Warning").html("<br/>请选择要删除的人员！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		//进行相应的删除操作
		$("#peopleids").val(ids);
		$("#delPDeptId").val(tree.getSelectedItemId());
		$( "#dialogForm2" ).dialog( "open" );  //dialogForm2：专门用于进行删除的提示警告信息
	});
	
	$("#modalDialogButton3").click(function(){//刷新
		$("#peopleName").val("");
		tonclick();
		//$( "#searchForm" ).submit();
	});
	
	$("#modalDialogButton4").click(function(){//查询
		$("#searchKey").val($("#peopleName").val());
		$("#VParentid").val("");
		tonclick();
		//$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//修改
		var count =0;
		var id="";
		var r1 = document.getElementsByName('contractIdList');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				count++;
				id = r1[i].value;
			}
		}
		if(count>1){
			$("#dialogForm3Warning").html("<br/>只能选择一个人来修改！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}else if(count==0 || id==""){
			$("#dialogForm3Warning").html("<br/>请选择要修改的人员！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}else{
			var deptid = tree.getSelectedItemId();
			var deptname = tree.getSelectedItemText();
			$("#deptId").val(deptid);
			$("#deptName").val(deptname);
			$("#peopleId").val(id);
			$( "#dialogFormNewPeople" ).submit();
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
				//var search=removeURLArgument(self.location.search,"statusMsg");
				//self.location.search=search;
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});
	$( "#dialogForm5" ).dialog({//删除内容窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var ids = tree.getSelectedItemId();
				params = {"deptids":ids};
				$.ajax({
					type:"post",
					url:"deleteDeptanotherDeptAction.do",
					data:params,
					dataType:"json",
					success:function(data){
						if(data){
							reloadPlan();
							//alert("删除成功！");
						}else{
							$("#dialogForm3Warning").html("<br/>删除失败，该部门被引用！"); //dialogForm3Warning：用于提示警告信息
							$( "#dialogForm3" ).dialog( "open" );
						}
					},
					error: function (xmlReq,textStatus,errorThrown){
						$("#dialogForm3Warning").html("<br/>数据库连接错误，删除失败，请重试！"); //dialogForm3Warning：用于提示警告信息
						$( "#dialogForm3" ).dialog( "open" );
						return false;
					}
				});	
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});
	function removeURLArgument(str,args){
	  var argsArray=str.substring(1).split("&");
	  var result="?";
	  for(var i=0;i<argsArray.length;i++){
		  if(i==argsArray.length-1){
			  if(argsArray[i].indexOf(args)<0)
				  result+=argsArray[i];
		  }else{
			  if(argsArray[i].indexOf(args)<0)
				  result+=argsArray[i]+"&";		
		  }
	  }
	  return result;
  }
});

	//编辑部门
    function execEdit(rid){
		//通过json读取对象
		params = {"id":rid};

		$.ajax({
			type:"post",
			url:"searchDeptByIdanotherDeptAction.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值

				$("#VId").val(data.VId);
				$("#vname").val(data.VName);
				$("#iorder").val(data.IOrder);
				$("#CVParentid").val(data.VParentid);
                
				$("#dialogForm1").dialog('option', 'title', '编辑部门');
				$("#dialogForm1").dialog( "open" );

			},
			error:function(){
				//alert("数据库连接错误，获取对象失败，请重试。");
				$("#dialogForm3Warning").html("<br/>数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
	}
	//查看人员信息
	function showPeopleMsg(id){
		var deptid = tree.getSelectedItemId();
		var deptname = tree.getSelectedItemText();
		$("#deptId").val(deptid);
		$("#deptName").val(deptname);
		$("#peopleId").val(id);
		$("#showPeople").val("showPeople");
		$( "#dialogFormNewPeople" ).submit();
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

<div id="leftPartC"><div>
<div id="treeboxbox_tree"></div><br>
<br>
</div></div>

<div id="rightPartC"><div>
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
<button id="modalDialogButton1" class="green" primary="ui-icon-button-addperson">添加人员</button>
<button class="normal barLeft" id="modalDialogButton5">修改人员</button>
<button class="normal barMiddle" id="modalDialogButton2">删除人员</button>
</s:if>
<button class="normal <s:if test="#r==null || #r==0">barRight</s:if>" id="modalDialogButton3">全部</button>
		
    <div class="buttonInput relative left" width="180" height="28">
     <input id="peopleName" name="peopleName"  type="text" maxlength="50" value="${key}"/><button id="modalDialogButton4" title="输入姓名">查询</button>
    </div>

</div>


<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="39"></th>
				<th width="100"></th>
				<th width="100"></th>
				<th width="60"></th>
				<th width="130"></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><!--<input type="checkbox" value="" id="isCheckBoxButton"><b></b>--></th>
				<th class="thSortableGray">姓名</th>
				<th class="thSortableGray">编号</th>
				<th class="thSortableGray">性别</th>
				<th class="thSortableGray">部门名称</th>
				<th class="thSortableGray">政治面貌</th>
			  </tr>
			</thead>
			<tbody id="searchPage">
			<s:iterator value="list">
			  <tr>
				<td><input name="contractIdList"  type="radio" value="${VId}"><b></b></td>
				<td class="searchRange" title="${VName}"><a href='javascript:void(0)' onclick="showPeopleMsg('${VId}');" class="blue">${VName}</a></td>
				<td class="searchRange" title="${VCode}">${VCode}</td>
				<td class="searchRange" title="${VSex}">${VSex}</td>
				<td class="searchRange" title="${deptName}">${deptName}</td>
				<td class="searchRange" title="${VZzmm}">${VZzmm}</td>
			  </tr>
			</s:iterator> 
			</tbody>
		</table>

</div>
</div>
</div>
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

<div id="dialogForm5">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确定要删除选中的信息吗？<br/>信息删除后不可恢复。</span>
		</div>
	</fieldset>	
</div>

<!-- 人员管理 -->
<form id="dialogFormNewPeople" method="post" action="toAddPeopleAnotherPeopleAction.do">
	<input type="hidden" id="peopleId" name="id"/>
	<input type="hidden" id="deptId" name="deptId"/>
	<input type="hidden" id="showPeople" name="showPeople"/>
	<input type="hidden" id="deptName" name="deptName"/>
	<input type="hidden" name="key" value="${key}"/>
</form>

<form  action="searchPeopleListAnotherPeopleAction.do" method="post" id="searchForm">
  <input name="key" type="hidden" id="searchKey">
</form>

<form  action="deletePeopleAnotherPeopleAction.do" method="post" id="deleteForm">
    <input name="peopleids" type="hidden" id="peopleids">
    <input name="deptId" type="hidden" id="delPDeptId">
    <input type="hidden" name="key" value="${key}"/>
</form>


<form id="roleForm" method="post" action="saveDeptanotherDeptAction.do">
	<input type="hidden" name="department.VId" id="VId"/>
	<input type="hidden" name="department.VParentid" id="CVParentid"/>
	<input type="hidden" name="department.VName" id="cvname" />
	<input type="hidden" name="department.IOrder" id="ciorder" />
	<input type="hidden" id="key" name="key" value="${key}"/>
</form>
<input type="hidden" id="VParentid" name="VParentid" value="1"/>
<input type="hidden" id="VDeptid" value="${deptId}"/>
<%@ include file="../../result.jsp"%>
<script>

//用于显示添加、修改、删除等的提示信息
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult !=null && operateResult!="" ){
		$("#dialogForm4Span").html("<br/>"+operateResult);
		$( "#dialogForm4" ).dialog( "open" );//dialogForm4：用于显示操作成功后返回提示页面
	}
});


//初始化menu右键菜单---------------------------------------------------------
/*
menu=new dhtmlXMenuObject("treeboxbox_tree");
menu.setImagePath("../images/DhtxMenu/");
menu.setIconsPath("../images/MenuIcon/");
menu.renderAsContextMenu(true);
menu.attachEvent("onClick",HandleMClk);
menu.loadXML("../../xmlfile/otherDeptMenu.xml"); 
*/

//初始化树
tree=new dhtmlXTreeObject("treeboxbox_tree","290px","100%",0);
//tree.enableContextMenu(menu);
tree.setSkin('dhx_skyblue');
tree.setImagePath("../common/images/");
tree.enableDragAndDrop(false);

tree.setOnClickHandler(tonclick);
tree.enableTreeLines(true);
tree.setImageArrays("plus","plus2.gif","plus3.gif","plus4.gif","plus.gif","plus5.gif");
tree.setImageArrays("minus","minus2.gif","minus3.gif","minus4.gif","minus.gif","minus5.gif");
tree.setStdImages("book.gif","books_open.gif","books_close.gif");		
reloadPlan();

//鼠标单击事件
function tonclick() {
	var treeids = tree.getAllSubItems(tree.getSelectedItemId())+","+tree.getSelectedItemId();
	$("#VParentid").val(tree.getSelectedItemId());//获取选中树形节点的ID
	$("#searchKey").val($("#peopleName").val());
	var key = $("#searchKey").val();
	//alert(treeids);
	//$("#searchForm").submit();
	//alert(treeids);
	//alert(key);
	params = {"id":treeids,"key":key};
	$.ajax({
		type:"post",
		url:"searchPeopleListAjaxAnotherPeopleAjaxAction.do",
		data:params,
		dataType:"json",
		success:function(data){
			var ht = "";
			if(data.length>0){
				for(var i=0;i<data.length;i++){
					ht+="<tr><td><input name=\"contractIdList\" type=\"radio\" value=\""+data[i].VId+"\"><b></b></td>"+
						"<td class=\"searchRange\" title=\""+data[i].VName+"\"><a href='javascript:void(0)' onclick=\"showPeopleMsg('"+data[i].VId+"');\" class=\"blue\">"+data[i].VName+"</a></td>"+
						"<td class=\"searchRange\" title=\""+data[i].VCode+"\">"+data[i].VCode+"</td>"+
						"<td class=\"searchRange\" title=\""+data[i].VSex+"\">"+data[i].VSex+"</td>"+
						"<td class=\"searchRange\" title=\""+data[i].deptName+"\">"+data[i].deptName+"</td>"+
						"<td class=\"searchRange\" title=\""+data[i].VZzmm+"\">"+data[i].VZzmm+"</td></tr>";
				}
			}
			$("#searchPage").html(ht);
			$("#peopleName").val("");
			execbase();//显示checkbox与radio样式。
			
		},
		error:function(){
			alert("数据库连接错误，获取部门失败，请重试！");
			return;
		}
	});
}
//加载树
function reloadPlan(){
	params = {};
	$.ajax({
		type:"post",
		//url:"showDeptTreeanotherDeptAction.do",
		url:"showOrgTree.do",
		data:params,
		dataType:"json",
		success:function(data){
			setTreeFromDeptList(data);
			//alert(tree.getSelectedItemId());
			//if(tree.getSelectedItemId()){
			//	tree.closeAllItems(1);
			//}
			//tree.openAllItems();
			//tree.openAllItems(0);//1节点全部打开，0节点全部关闭  组织机构内容很少，都打开了。
		},
		error:function(){
			alert("数据库连接错误，获取部门失败，请重试。");
			return;
		}
	});	
}
//默认加载树
function setTreeFromDeptList(data){
	tree.deleteChildItems(0);
	for(i=0;i<data.length;i++){
		tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].message);
		tree.closeAllItems(data[i].VParentid);
	}
	/*
	tree.deleteChildItems(0);
	tree.insertNewChild(0,1,"部门管理");
	for(i=0;i<data.length;i++){
		tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].VName);
		tree.closeAllItems(data[i].VParentid);//关闭指定层的节点
	}
	*/
	
	//用于返回时选中树节点
	
	var VDeptId = $("#VDeptid").val();
	if(VDeptId != null && VDeptId!=""){
		tree.selectItem(VDeptId);
		tonclick();//调用选中的节点单击方法
	}
	
}
//鼠标右键动作
/*
function HandleMClk(menuid,zoom){
	if($("#VParentid").val()==""){
		alert("请先选择节点！");
		return ;
	}
	if(menuid=="muItem_AD1"){//创建部门
		$("#VId").val("");
		var id = tree.getLevel(tree.getSelectedItemId());
		if(id==null || id==""){
			id = $("#VParentid").val();
		}
		$("#iorder").val(id);
		$("#dialogForm1").dialog( "open" );
	}else if(menuid=="muItem_EDIT1"){//修改部门
		execEdit(tree.getSelectedItemId());
	}else if(menuid=="muItem_DELETE1"){//删除部门
		var ids = tree.getSelectedItemId();
		if(ids == null || ids == ""){
			$("#dialogForm3Warning").html("<br/>请选择要删除的部门！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$( "#dialogForm5" ).dialog( "open" );
	}
} 
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
*/
</script>

</body>
</html>
