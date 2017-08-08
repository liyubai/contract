<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>角色管理</title>

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

<script>
C_WIDTH=700;
$(function() {

});
</script>

<style>
/*功能9*/
fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
/*功能9*/
#rightPartC > div { min-width: 370px; }
</style>

<script>
//用于存储选中的复选框的value值
var values = "";
$(function() {

	//功能5
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		new $.dropDownList(i,true,100);
	})
	var $checkboxes=$("input[name='checkboxName']"),$checkAllUsersBox=$("#checkAllUsersBox");
	$checkboxes.change(function(){
	    //当复选框去掉选中状态后，将全选按钮的选择状态去掉（即去掉全选复选框的选中状态）
		if(!this.checked){
		   $checkAllUsersBox[0].checked=false;
		}
		//如果复选框的总数与选中状态的复选框数量相同，则表明当前页面中的所有复选框均被选中，然后将全选复选框的选中状态设为选中
		if($checkboxes.size()==$checkboxes.filter(":checked").size()) {
		  $checkAllUsersBox[0].checked=true;
		}
		//设置全选复选框触发change事件
		$checkAllUsersBox.trigger("change");

/*
		//如果处于选中状态的复选框个数大于0
		if($checkboxes.filter(":checked").size() >0){
		   values = "";
		   for(var i=0; i<$checkboxes.filter(":checked").size(); i++){
		      values = values +  $checkboxes.filter(":checked")[i].value  + ",";
		   }
		}else{
		    values = "";
		}
*/
	});
	

	
	//全选复选框的单击事件
	$checkAllUsersBox.click(function(){
	    //当全选复选框处于选中或非选中状态时，循环处理每个复选框的状态，即当全选复选框当前的状态循环赋给每个复选框
		$checkboxes.each(function(){
			this.checked = $checkAllUsersBox[0].checked;
			$(this).trigger("change");

		});
		/*
		//当全选复选框处于选中状态时，将所有复选框的值都拼到一起
		if($checkAllUsersBox[0].checked){
		   values = "";
		   for(var i=0; i<$checkboxes.size(); i++){
			  values = values +  $checkboxes[i].value  + ",";
		   }
		}else{
		   values = "";
		}
		//alert(values);
		*/
	});
	//功能9
	var name = $( "#vname" ),
		desc = $( "#vdescription" ),
		allFields = $( [] ).add( name ).add( desc ),
		tips = $( ".validateTips" );

	function updateTips( t ) {
		tips.html( t ).addClass( "ui-state-highlight" );
		setTimeout(function() {
			tips.removeClass( "ui-state-highlight", 1500 );
		},0 );
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

				bValid = bValid && checkLength( name, "角色名称", 1, 100);
				bValid = bValid && checkLength( desc, "角色描述", 1, 100);
      
				if ( bValid ) {

				    $("#cvname").val($("#vname").val());
					$("#cvdescription").val($("#vdescription").val());
					$("#roleForm").submit();
					
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

     //新建角色
	$("#modalDialogButton1").click(function(){
	    
		$( "#dialogForm1" ).dialog( "open" );
	});

    //删除角色
	$("#modalDialogButton2").click(function(){
        //将选中的角色的id使用逗号（,）拼接在一起
        var count =0;
		var ids="";
		var r1 = document.getElementsByName('checkboxName');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				count++;
				ids += r1[i].value + ",";
			}
		}
		
		if(count == 0){
			$("#dialogForm3Warning").html("<br/>请选择要删除的角色！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		//进行相应的删除操作
		$("#roleidsStr").val(ids);
		$( "#dialogForm2" ).dialog( "open" );  //dialogForm2：专门用于进行删除的提示警告信息
		 
		 
		   
		
	});
	
	$("#modalDialogButton3").click(function(){//刷新
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});
	
	$("#modalDialogButton4").click(function(){//查询
	
	
	    var keyvalue = $("#roleName").val();
		if(keyvalue == '角色名称'){
		   keyvalue = "";		
		}
		$("#searchKey").val(keyvalue);
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
				//var search=removeURLArgument(self.location.search,"statusMsg");
				//self.location.search=search;
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


	$("#modalDialogButton_roleRight").click(function(){//保存权限
		 //获取所有选中节点的id值
		 var rights = tree.getAllCheckedBranches();
		 if(rights==""){
			 alert("请选择权限。");
			 return;
		 }
		 var rs = rights.split(",");
		 //获取当前角色的id值
		 var rid = $("#roleIdForRight").val();
		
		 var iids = $("#iids").val();//获取读写权限
		 var cids = "";
		 var k = 0;
		 
		 for(var j=0;j<rs.length;j++){
			 if(rs[j]=="") 	continue;
			 k= iids.indexOf(rs[j]);
			
			 if(k==-1){
				cids+= rs[j]+",0;";
			 }else{
				cids+= rs[j]+","+iids.substr(k+rs[j].length+1,1)+";";
			 }
			 
		 }
		
		 if(rid == null || rid == ""){
	       alert("【提示信息】 请选择相应的角色后才能分配权限！");
		   return false;
	     }
		 
		 //构造JSON格式数据
         var params = {"roleId":rid,"functionIds":cids};
		 //alert(params.functionIds);

		 $.ajax({
			type:"post",
			url:"createRoleFunctions.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data == 0){
				   alert("【提示信息】 角色与功能模块绑定成功！");
				}else{
				    alert("【提示信息】 角色与功能模块绑定失败！");
				
				}

			},
			error:function(){
				//alert("数据库连接错误，获取对象失败，请重试。");
				$("#dialogForm3Warning").html("<br/>数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
		

	});


    //处理导航隐藏
	$("#li1").click(function(){
		$(this).siblings().toggle(200).end().children(".ui-icon").toggleClass("ui-icon-carat-1-s").toggleClass("ui-icon-carat-1-e");
	});

});

	//编辑角色
    function execEdit(rid){
		//通过json读取字典对象
		params = {"id":rid};

		$.ajax({
			type:"post",
			url:"searchRoleById.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值

				$("#VId").val(data.VId);
				$("#vname").val(data.VName);
				$("#vdescription").val(data.VDescription);

                
				$("#dialogForm1").dialog('option', 'title', '编辑角色');
				$("#roleForm").attr("action","updateRole.do");
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
	
	function setRoleIdForRight(roleId,roleName){

	   $("#roleIdForRight").val(roleId);
	   $("#rolenameview").html("<b>角色名称： " + roleName + "</b>");
	   
	   var r1 = document.getElementsByName('checkboxName');

		for(i=0; i<r1.length; i++){
			
			if(roleId==r1[i].value){
				r1[i].checked=true;
			}
		}
	   roleFunction();
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
<button id="modalDialogButton1" class="green" primary="ui-icon-button-addperson">新建角色</button>
<button class="normal barLeft" id="modalDialogButton2">删除角色</button>
</s:if>
	<button class="normal <s:if test="#r==null || #r==0">barRight</s:if>" id="modalDialogButton3">刷新</button>

	
    <div class="buttonInput relative left" width="180" height="28">

	  <s:if test="key==null || key == ''">
       <input id="roleName" name="roleName"  type="text" maxlength="50" value="角色名称" title="角色名称"/>  
	  </s:if>
	  <s:else>
	     <input id="roleName" name="roleName"  type="text" maxlength="50" value="${key}"   title="角色名称"/>  
	  </s:else> 
	   <button id="modalDialogButton4" title="输入角色名称">查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">


	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="39"></th>
				<th width="160"></th>
				<th width="166"></th>
				<th width="168"></th>
				<s:if test="#r==null || #r==0"><th width="144"></th></s:if>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><!--<input type="checkbox" value="" id="checkAllUsersBox"><b></b>--></th>
				<th class="thSortableGray">角色名称</th>
				<th class="thSortableGray">角色描述</th>
				<th class="thSortableGray">创建时间</th>
				<s:if test="#r==null || #r==0"><th class="thSortableGray">操作</th></s:if>
				<th class="thSortableGray">&nbsp;</th>
			  </tr>
			</thead>
			<tbody>
			<s:iterator value="page.data" status="i">
			  <tr>
				<td><!--<input name="checkboxName" type="checkbox" value="${VId}"><b></b>onClick="setRoleIdForRight('${VId}','${VName}')"-->
                <input type="radio"  name="checkboxName" value="${VId}" /></td>
				<td class="searchRange" title="${VName}">${VName}</td>
				<td class="searchRange" title="${VDescription}">${VDescription}</td>
				<td class="searchRange">
				   <s:date name="DCreateDate" format="yyyy-MM-dd HH:mm:ss" />
				</td><s:if test="#r==null || #r==0">
				<td>
				
				   <a href="javascript:execEdit('${VId}')" class="blue">修改</a>&nbsp;&nbsp;
				   <!--
				   <a href="javascript:setRoleIdForRight('${VId}','${VName}')" class="blue">权限分配</a>
				   -->
				   
                   
                   <a href="javascript:void(0)"  onClick="setRoleIdForRight('${VId}','${VName}')" class="blue">权限分配</a>

				   
				</td></s:if>
				<td></td>
			  </tr>
			</s:iterator> 

            <s:iterator value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<s:if test="#r==null || #r==0"><td>&nbsp;</td></s:if>
				<td></td>
			  </tr>
              </s:iterator>			 
            

              
			</tbody>
		</table>

<!-- 分页导航 --><s:include value="../common/pagination_system.jsp" /><!-- 分页导航 end -->

	</div>

</div>

</div></div>

<div id="rightPartC">
<div><s:if test="#r==null || #r==0">
<div class="panelBox buttonBox" style="margin-top:10px;height: 40px; border: 0; border-top: solid 1px #DBE3E8;border-bottom: solid 1px #DBE3E8;background: #F6F6F6;">
	<div style="margin-left:10px; margin-top:5px; float:left;">
     <button id="modalDialogButton_roleRight" class="green" primary="ui-icon-button-addnew">保存权限</button>
    </div><div id="rolenameview" style="margin-top:10px;">
	</div>
</div></s:if>

<div id="treeboxbox_tree" style="margin-left:20px; margin-top:20px;"></div>     
	
	
</div>
</div>


<div id="dialogForm1" title="新建角色">
	<p class="validateTips">请填写所有信息</p>
	<form>
	<fieldset>
		<label for="vname">角色名称</label>
		<input type="text" name="role.VName" id="vname" class="text ui-widget-content ui-corner-all" />
		<label for="vdescription">角色描述</label>
		<input type="text" name="role.VDescription" id="vdescription" class="text ui-widget-content ui-corner-all" />
	</fieldset>
	</form>
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

<form id="roleForm" method="post" action="createRole.do">
	<input type="hidden" name="role.VId" id="VId"/>
	<input type="hidden" name="role.VName" id="cvname" />
	<input type="hidden" name="role.VDescription" id="cvdescription" />
	<input type="hidden" name="key" value="${key}"/>
	<input type="hidden" name="pageIndex" value="${pageIndex}"/>
</form>

<form  action="searchRoles.do" method="post" id="searchForm">
  <input name="key" type="hidden" id="searchKey">
</form>
<form  action="deleteRole.do" method="post" id="deleteForm">
    <input name="roleids" type="hidden" id="roleidsStr">
    <input type="hidden" name="key" value="${key}"/>
    <input type="hidden" name="pageIndex" value="${pageIndex}"/>
</form>

<%@ include file="../../result.jsp"%>
<input type="hidden"  id="roleIdForRight" name="roleIdForRight" value="" />

<input type="hidden" id="iid">
<input type="hidden" id="iids">
<script>
//用于显示添加、修改、删除等的提示信息
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult !=null && operateResult!="" ){
		$("#dialogForm4Span").html("<br/>"+operateResult);
		$( "#dialogForm4" ).dialog( "open" );//dialogForm4：用于显示操作成功后返回提示页面
	}
});
</script>


</body>
</html>
<script>

function tonclick() {
	$("#iid").val(tree.getSelectedItemId());
}

menu=new dhtmlXMenuObject("treeboxbox_tree");

menu.setImagePath("../images/DhtxMenu/");
menu.setIconsPath("../images/MenuIcon/");
menu.renderAsContextMenu(true);
menu.attachEvent("onClick",HandleMClk);
menu.loadXML("../xmlfile/role.xml"); 

//初始化树
tree=new dhtmlXTreeObject("treeboxbox_tree","100%","100%",0);
tree.enableContextMenu(menu);
tree.setSkin('dhx_skyblue');
tree.enableCheckBoxes(true); 
tree.enableThreeStateCheckboxes(true);
tree.setImagePath("../common/images/");
tree.enableDragAndDrop(false);

tree.setOnClickHandler(tonclick);
tree.enableTreeLines(true);
tree.setImageArrays("plus","plus2.gif","plus3.gif","plus4.gif","plus.gif","plus5.gif");
tree.setImageArrays("minus","minus2.gif","minus3.gif","minus4.gif","minus.gif","minus5.gif");
tree.setStdImages("book.gif","books_open.gif","books_close.gif");
reloadPlan();//加载根

function reloadPlan(){
	
	params = {"parentid":"0"};
	$.ajax({
		type:"post",
		url:"showAllFunctionTree.do",
		data:params,
		dataType:"json",
		success:function(data){
			
		    if( data != null && data.length > 0){
			  setTreeFromOrgList(data);
			  tree.closeAllItems(0);//1节点全部打开，0节点全部关闭  组织机构内容很少，都打开了。
			}else{
			  //alert("【提示信息】 目前系统尚未添加任何功能模块（权限），请确认后重试!");
			  $("#rightTreeArea").html("<font color=\"#EB7979\"><b>【提示信息】 目前系统尚未添加任何功能模块（权限），请确认后重试!</b></font>");
			}
			
		},
		error:function(){
			alert("数据库连接错误，获取功能树形失败，请重试。");
			return;
		}
	});	
}

function setTreeFromOrgList(data){
	tree.deleteChildItems(0);
	for(i=0;i<data.length;i++){
		
		tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].VName + " (写)");
	}
}

function HandleMClk(menuid,zoom){
	var iids = $("#iids").val();
	var iid = $("#iid").val();
	if(iid==""){
		alert("请先选择节点。");
		return ;
	}
	var name = tree.getSelectedItemText();
	var i = name.indexOf("(");
	
	if(i>-1){
		name = name.substring(0,i-1);
	}
	
	if(menuid=="muItem_AD1"){
		tree.setItemText(iid,name+" (读)");
		
		if(iids.indexOf(iid+",0;")!=-1){
			
			iids = iids.replace(iid+",0;","");
		}
		
		if(iids.indexOf(iid+",1;")==-1){
			iids+=iid+",1;";
			$("#iids").val(iids);
		}
		
	}else if(menuid=="muItem_EDIT1"){
		tree.setItemText(iid,name+" (写)");
		
		if(iids.indexOf(iid+",1;")!=-1){
			
			iids = iids.replace(iid+",1;","");
		}
		if(iids.indexOf(iid+",0;")==-1){
			iids+=iid+",0;";
			$("#iids").val(iids);
		}
	}else{
		
	}
} 

//用于查询权限分配
function roleFunction(){
	params = {"parentid":"0","roleId":$("#roleIdForRight").val()};
	
	$.ajax({
		type:"post",
		url:"showAllRoleFunctionTree.do",
		data:params,
		dataType:"json",
		success:function(data){
			setTreeFromRoleFunctionList(data);
			tree.closeAllItems(0);//1节点全部打开，0节点全部关闭  组织机构内容很少，都打开了。
		},
		error:function(){
			alert("数据库连接错误，获取功能树形失败，请重试。");
			return;
		}
	});	
}

function setTreeFromRoleFunctionList(data){
	
	var iids = "";
	tree.deleteChildItems(0);
	var str = "";
	for(i=0;i<data.length;i++){
		if(data[i].isWrite==0){
			str = " (写)";
		}else if(data[i].isWrite==1){
			str = " (读)";
		}else{
			str = " (写)";	
		}
		tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].VName + str);
		
		if(data[i].rolec=="1"){
			tree.setCheck(data[i].VId,1);//设置节点复选框被选中
			iids+=data[i].VId + "," + data[i].isWrite + ";";
		}
	}
	$("#iids").val(iids);
}
</script>