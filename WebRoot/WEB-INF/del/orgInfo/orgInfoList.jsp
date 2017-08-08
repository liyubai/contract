<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>组织机构管理</title>



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
#rightPartC > div { min-width: 430px; }  
</style>
<script>
C_WIDTH=500;
$(function() {

	//功能5
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
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
	$( "#dialogForm1" ).dialog({//添加窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var bValid = true;
				allFields.removeClass( "error" );

				bValid = bValid && checkLength( name, "新建单位", 1, 100);

				if ( bValid ) {

					$("#cvname").val($("#vname").val());
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

	$( "#dialogFormEdit" ).dialog({//编辑窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#cvname").val($("#evname").val());
				updateChild();
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
<br/>
<div id="treeboxbox_tree" ></div> 



<br/>
<div id="infoBox" class="panelBox ui-corner-all">

	<div class="panelContent">
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/starcontacts_48.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555;">组织机构维护说明。</span><br />
			<span style="font-size: 14px; color: #555555;">鼠标点选上面的组织结构树。<br />
			选中某一单位节点，点右键对其进行维护。</span><br>
		</div>
	</div>

</div>

</div>
</div>




<div id="dialogForm1"  title="新建单位">
	<p class="validateTips" >请填写信息</p>
	<fieldset>
    	<label for="vname">单位名称</label>
		<input type="text"  id="vname" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	
</div>
<div id="dialogFormEdit"  title="编辑单位">
	<p class="validateTips" >请填写信息</p>
	<fieldset>
    	<label for="evname">单位名称</label>
		<input type="text"  id="evname" class="text ui-widget-content ui-corner-all" />
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
<form id="orgForm">
<input type="hidden" name="org.VId" id="IId"/>
<input type="hidden" name="org.VName" id="cvname" />
<input type="hidden" name="org.VParentid" id="parentid" />
</form>
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
<input type="hidden"  id="isWrite" value='<s:property value="#r"/>'/>

</body>
</html>
<script>
var isWrite=$("#isWrite").val();
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
menu.loadXML("../xmlfile/orgmenu.xml"); 
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
reloadPlan();

function reloadPlan(){

	params = {};
	$.ajax({
		type:"post",
		url:"showOrgTree.do",
		data:params,
		dataType:"json",
		success:function(data){
			setTreeFromOrgList(data);
			//tree.closeAllItems(1);//1节点全部打开，0节点全部关闭  组织机构内容很少，都打开了。
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
	//	$("#IId").val();
		$("#dialogForm1").dialog( "open" );
	}else if(menuid=="muItem_DELETE1"){
		deleteOrgbyID();
	}
	else if(menuid=="muItem_EDIT1"){

		$("#evname").val(tree.getItemText(tree.getSelectedItemId()));
		$("#dialogFormEdit").dialog( "open" );

	}
} 
function setTreeFromOrgList(data){
	tree.deleteChildItems(0);
	for(i=0;i<data.length;i++){
		tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].message);
		tree.closeAllItems(data[i].VParentid);
	}
}
//保存
function saveChild(){
	var parentid = $("#parentid").val();
//	$("#IId").val("");
	var name=$("#cvname").val();
	if(name==""){
		alert("单位名称不能为空");
		return ;
	}
	if(parentid==""){
		alert("请先选择节点。");
		return ;
	}

	params = $("#orgForm").serialize();
	$.ajax({
		type:"post",
		url:"createOrg.do",
		data:params,
		dataType:"json",
		success:function(data){
			tree.insertNewItem(tree.getSelectedItemId(),data,name,0,0,0,0);
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
	var name=$("#evname").val();
	if(name==""){
		alert("单位名称不能为空。");
		return;
	}
	if(id==""){
		alert("请选择要修改的单位。");
		return;
	}

	params = $("#orgForm").serialize();
	$.ajax({
		type:"post",
		url:"updateOrg.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag==false){
				alert(data.message);
				return;
			}
			tree.setItemText(tree.getSelectedItemId(),name);
			tree.selectItem(tree.getSelectedItemId());
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
		alert("请选择要删除的单位");
		return;
	}
	$("#dialogForm2").dialog( "open" );
}
function execDel(){
	params = {"id":$("#IId").val()};
	$.ajax({
		type:"post",
		url:"deleteOrg.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data.flag==false){
				alert(data.message);
				return;
			}
			if(data.flag==true){
				tree.selectItem(tree.getSelectedItemId());
				tree.deleteItem(tree.getSelectedItemId(),true);
				return;
			}
		},
		error: function (xmlReq,textStatus,errorThrown){
			alert("数据库连接错误，删除失败，请重试。");
			return false;
		}
	});	
}
</script>