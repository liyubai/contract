<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>功能模块管理</title>

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
/*功能9*/
fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
</style>
<script>
$(function() {

	//功能9
	var vname = $( "#vname" ),
		vnameChild= $( "#vnameChild" ),
		evnameChild= $( "#evnameChild" ),
		allFields = $( [] ).add( vname ).add( vnameChild ).add( evnameChild ),
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
	function getSelValue(name){
		var str="";
		var r1=document.getElementsByName(name);
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str=r1[i].value;
			}
		}
		return str;
	}
	$( "#dialogForm1" ).dialog({//添加root窗口
		autoOpen: false,
		height: 350,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var bValid = true;
				allFields.removeClass( "error" );

				bValid = bValid && checkLength( vname, "功能模块名称", 1, 25);

				if ( bValid ) {

					$("#cvname").val($("#vname").val());
					$("#cvaddress").val($("#vaddress").val());
					$("#parentid").val("0");//0代表一级根
					$("#IDh").val(getSelValue('daohang'));
					$("#IOrder").val($("#vIOrder").val());
					$("#IRootid").val($("#rootid").val());
					saveRoot();
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

	$( "#functionDialogForm" ).dialog({//添加子模块窗口
		autoOpen: false,
		height: 350,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var bValid = true;
				allFields.removeClass( "error" );

				bValid = bValid && checkLength( vnameChild, "功能模块名称", 1, 25);

				if ( bValid ) {

					$("#cvname").val($("#vnameChild").val());
					$("#cvaddress").val($("#vaddressChild").val());
					$("#IDh").val(getSelValue('daohang'));
					$("#IOrder").val($("#vIOrder").val());
					$("#IRootid").val($("#rootid").val());
					$( this ).dialog( "close" );
					saveChild();
					
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
	$("#modalDialogButton1").click(function(){// 添加root事件
		$("#vname").val("");
		$("#vaddress").val("");
		$( "#dialogForm1" ).dialog( "open" );
	});

	$( "#dialogFormEdit" ).dialog({//编辑子模块窗口
		autoOpen: false,
		height: 350,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var bValid = true;
				allFields.removeClass( "error" );

				bValid = bValid && checkLength( evnameChild, "功能模块名称", 1, 25);

				if ( bValid ) {

					$("#cvname").val($("#evnameChild").val());
					$("#cvaddress").val($("#evaddressChild").val());
					$("#IDh").val(getSelValue('edaohang'));
					$("#IOrder").val($("#evIOrder").val());
					$("#IRootid").val($("#erootid").val());
					updateChild();
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
	$( "#dialogForm2" ).dialog({//删除内容窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				execDel();
				$( this ).dialog( "close" );
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
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
    <s:param name="parentid">4028816a4714304c014714a1e0b9000a</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>	
</div></div>


<div id="rightPartA"><div>

<div id="infoBox" class="panelBox ui-corner-all" >
	<div class="panelContent">
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/starcontacts_48.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555;">功能模块维护说明。</span><br />
			<span style="font-size: 14px; color: #555555;">鼠标点选下面的功能模块树。<br />
			选中某一功能模块节点，点右键对其进行维护。</span><br>
		</div>
	</div>
</div>
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
<div class="panelBox buttonBox" style="height: 40px; border: 0; border-top: solid 1px #DBE3E8;border-bottom: solid 1px #DBE3E8;background: #F6F6F6;">
<s:if test="#r==null || #r==0">
	<div style="margin-left:10px; margin-top:5px;">
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">新建一级功能模块</button>
    </div></s:if>
</div>


<br/>
<div id="treeboxbox_tree" style="margin-left:12px; margin-bottom:20px;"></div> 
</div>
</div>

<div id="dialogForm1" title="新建一级功能模块">
	<p class="validateTips">请填写信息</p>
	<fieldset>
    	<label for="vname">模块名称</label>
		<input type="text"  id="vname" class="text ui-widget-content ui-corner-all" />
         <label for="vaddress">访问地址</label>
		<input type="text"  id="vaddress" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	
</div>

<div id="functionDialogForm" title="新建功能模块">
	<p class="validateTips">请填写信息</p>
	<fieldset>
    	模块名称：<input type="text"  id="vnameChild" class="text ui-widget-content ui-corner-all" style="width:200px;" />
        <span class="panelLine"></span>
         访问地址：<input type="text"  id="vaddressChild" class="text ui-widget-content ui-corner-all" style="width:200px;" />
         <span class="panelLine"></span>
         是否导航：<input type="radio" name="daohang"  value="0" checked/>是 <input  type="radio" name="daohang"  value="1"/>否
          <span class="panelLine"></span>
          排&nbsp;序&nbsp;&nbsp;值：<input type="text"  id="vIOrder" class="text ui-widget-content ui-corner-all" style="width:100px;" value="100" />
           <span class="panelLine"></span>
          顶级序号：<input type="text"  id="rootid" class="text ui-widget-content ui-corner-all" style="width:100px;" value="0" />
	</fieldset>	
</div>

<div id="dialogFormEdit" title="编辑功能模块">
	<p class="validateTips">请填写信息</p>
	<fieldset>
    	模块名称：<input type="text"  id="evnameChild" class="text ui-widget-content ui-corner-all" style="width:200px;" />
        <span class="panelLine"></span>
        访问地址：<input type="text"  id="evaddressChild" class="text ui-widget-content ui-corner-all" style="width:200px;" />
         <span class="panelLine"></span>
         是否导航：<input type="radio" name="edaohang"  value="0" checked/>是 <input type="radio" name="edaohang"  value="1"/>否
         <span class="panelLine"></span>
         排&nbsp;序&nbsp;&nbsp;值：<input type="text"  id="evIOrder" class="text ui-widget-content ui-corner-all" style="width:100px;" value="100" />
          <span class="panelLine"></span>
          顶级序号：<input type="text"  id="erootid" class="text ui-widget-content ui-corner-all" style="width:100px;" value="0" />
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
<form id="functionForm">
<input type="hidden" name="function.VId" id="IId"/>
<input type="hidden" name="function.VName" id="cvname" />
<input type="hidden" name="function.VUrl" id="cvaddress" />
<input type="hidden" name="function.VParentid" id="parentid" />
<input type="hidden" name="function.IDh" id="IDh" value="0" />
<input type="hidden" name="function.IOrder" id="IOrder" value="100" />
<input type="hidden" name="function.IRootid" id="IRootid" value="0" />
</form>
<input type="hidden"  id="isWrite" value='<s:property value="#r"/>'/>
</body>
</html>
<script>

var isWrite = $("#isWrite").val();

function tonclick() {
	$("#parentid").val(tree.getSelectedItemId());
	$("#IId").val(tree.getSelectedItemId());		
}
//初始化menu右键菜单---------------------------------------------------------
if(isWrite==0){
	menu=new dhtmlXMenuObject("treeboxbox_tree");
	menu.setImagePath("../images/DhtxMenu/");
	menu.setIconsPath("../images/MenuIcon/");
	menu.renderAsContextMenu(true);
	menu.attachEvent("onClick",HandleMClk);
	menu.loadXML("../xmlfile/functionmenu.xml"); 
}
//初始化树
tree=new dhtmlXTreeObject("treeboxbox_tree","500px","100%",0);
if(isWrite==0){
	tree.enableContextMenu(menu);
}
tree.setSkin('dhx_skyblue');
tree.setImagePath("../common/images/");
tree.enableDragAndDrop(false);

tree.setOnClickHandler(tonclick);
tree.enableTreeLines(true);
tree.setImageArrays("plus","plus2.gif","plus3.gif","plus4.gif","plus.gif","plus5.gif");
tree.setImageArrays("minus","minus2.gif","minus3.gif","minus4.gif","minus.gif","minus5.gif");
tree.setStdImages("book.gif","books_open.gif","books_close.gif");
reloadPlan();//加载根
tree.attachEvent("onOpenEnd", function(id,state){//展开加载子节点。
	if(state==1){
		params = {"parentid":id};
		tree.deleteChildItems(id);
		$.ajax({
			type:"post",
			url:"showFunctionTree.do",
			data:params,
			dataType:"json",
			success:function(data){
				
				for(i=0;i<data.length;i++){
					tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].VName);
				}
				
				for(i=0;i<data.length;i++){
					if(data[i].IOrder==1){
						tree.closeItem(data[i].VId);
					}else{
					}
				}				
			},
			error:function(){
				alert("数据库连接错误，获取附件列表失败，请重试。");
				return;
			}
		});	
	}
	
});
function reloadPlan(){

	params = {"parentid":"0"};
	$.ajax({
		type:"post",
		url:"showFunctionTree.do",
		data:params,
		dataType:"json",
		success:function(data){
			setTreeFromOrgList(data);
			tree.closeAllItems(0);//1节点全部打开，0节点全部关闭  组织机构内容很少，都打开了。
		},
		error:function(){
			alert("数据库连接错误，获取附件列表失败，请重试。");
			return;
		}
	});	
}
function HandleMClk(menuid,zoom){
	
	if($("#parentid").val()==""){
		alert("请先选择节点。");
		return ;
	}
	
	if(menuid=="muItem_AD1"){
		$("#vnameChild").val("");
		$("#vaddressChild").val("");
		$("#vIOrder").val("100");
		var r1=document.getElementsByName('daohang');
		r1[0].checked=true;
		
		$("#functionDialogForm").dialog( "open" );
	}else if(menuid=="muItem_DELETE1"){
		deleteOrgbyID();
	}
	else if(menuid=="muItem_EDIT1"){
		$("#evnameChild").val(tree.getItemText(tree.getSelectedItemId()));
		//通过json方式取出相应数据
		getDataById(tree.getSelectedItemId());
		

	}
} 
function clearSelValue(name){
	var r1=document.getElementsByName(name);
	for(i=0;i<r1.length;i++){
		r1[i].checked=true;
		r1[i].click();
	}
}

function getDataById(id){
	params = {"id":id};
	$.ajax({
		type:"post",
		url:"showFunctionById.do",
		data:params,
		dataType:"json",
		success:function(data){
			$("#evaddressChild").val(data.message);

			var r1=document.getElementsByName('edaohang');
			
			for(i=0;i<r1.length;i++){
				if(r1[i].value==data.IDh){
					r1[i].checked=true;
				}
			}

			$("#erootid").val(data.IRootid);
			$("#evIOrder").val(data.IStatus);
			$("#dialogFormEdit").dialog( "open" );
		},
		error:function(){
			alert("数据库连接错误，获取对象失败，请重试。");
			return;
		}
	});	
}
function setTreeFromOrgList(data){
	tree.deleteChildItems(0);
	for(i=0;i<data.length;i++){
		
		tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].VName);
	}
}
//保存root
function saveRoot(){

	//$("#IId").val("");
	var name=$("#cvname").val();
	if(name==""){
		alert("模块名称不能为空");
		return ;
	}

	params = $("#functionForm").serialize();
	$.ajax({
		type:"post",
		url:"createFunction.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag==false){
				alert(data.message);
				return;
			}
			reloadPlan();
			
		},
		error: function (){
			alert("信息提交失败，请重试。");
			return false;
		}
	});	
	
}
//保存
function saveChild(){
	var parentid = $("#parentid").val();
	if(parentid==""){
		alert("请先选择节点。");
		return ;
	}
	
	//$("#IId").val("");//添加时id为空
	var name=$("#cvname").val();
	if(name==""){
		alert("模块名称不能为空");
		return ;
	}

	params = $("#functionForm").serialize();
	$.ajax({
		type:"post",
		url:"createFunction.do",
		data:params,
		dataType:"json",
		success:function(data){
			tree.insertNewItem(tree.getSelectedItemId(),data.message,name,0,0,0,0);
			tree.selectItem(tree.getSelectedItemId());
		},
		error: function (xmlReq,textStatus,errorThrown){
			alert("信息提交失败，请重试。");
			return false;
		}
	});	
	
}
//修改
function updateChild(){

	var id=$("#IId").val();
	var name=$("#evnameChild").val();
	if(name==""){
		alert("模块名称不能为空。");
		return;
	}
	if(id==""){
		alert("请选择要修改的内容。");
		return;
	}
	params = $("#functionForm").serialize();
	$.ajax({
		type:"post",
		url:"updateFunction.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag==false){
				alert(data.message);
				return;
			}
			tree.setItemText(tree.getSelectedItemId(),name);
			tree.selectItem(tree.getSelectedItemId());
			//tree.refreshItem(tree.getSelectedItemId());
			$( "#dialogFormEdit" ).dialog( "close" );
		},
		error: function (){
			alert("单位更新失败 ，参数传递错误。");
			return false;
		}
	});	
}
//删除
function deleteOrgbyID(){
	var id = $("#IId").val();
	if(id==""){
		alert("请选择要删除的节点");
		return;
	}
	$("#dialogForm2").dialog( "open" );
}
//执行删除
function execDel(){
	params = {"id":$("#IId").val()};
	$.ajax({
		type:"post",
		url:"deleteFunction.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag==false){
				alert(data.message);
				return;
			}
			tree.selectItem(tree.getSelectedItemId());
			tree.deleteItem(tree.getSelectedItemId(),true);
		},
		error: function (xmlReq,textStatus,errorThrown){
			alert("数据库连接错误，删除失败，请重试。");
			return false;
		}
	});	
}
</script>