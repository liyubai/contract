<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员体检列表管理</title>

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
<style>

#rightPartC > div {
	min-width: 820px;
}
</style>
<script>
A_WIDTH=200; //注意，不要写成var A_WIDTH，这个值已经在function.js中定义好了，只需要重新赋值
C_WIDTH=250; //注意，不要写成var C_WIDTH，这个值已经在function.js中定义好了，只需要重新赋
$(function() {
	//功能5
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		new $.dropDownList(i,true,100);
	})
	//功能15
	var progressbar1 = document.getElementsByName("progressbar1");
	if(progressbar1 != null){
		for(var i=0;i<progressbar1.length;i++){
			var j = i+1;
			var num = parseInt(progressbar1[i].value);
			var id="#teacher"+j;
			$(id).progressbar({value: parseInt(num)});
		}
	}
	//$("#progressbar1").progressbar({value: 80});
	//功能15
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

     //新建体检信息
	$("#modalDialogButton1").click(function(){
		var count =0;
		var id="";
		var r1 = document.getElementsByName('contractIdList');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				count++;
				id = r1[i].value;
			}
		}
		if(count==0){
			$("#dialogForm3Warning").html("<br/>请选择一个教员来添加体检信息！"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}

		if(id.split(",")[1]!=""){
			$("#dialogForm3Warning").html("选中的教员已经有体检信息，不能再次添加。"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#tjid").val("");
		$("#showPeople").val("");
		$("#peopleId").val(id);
		var deptid = tree.getSelectedItemId();
		$("#deptId").val(deptid);
		
		$( "#dialogFormNewPeople" ).submit();
		
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
	
	$("#modalDialogButton3").click(function(){//全部
		$("#searchKey").val("");
		gotoPage(1);
		$("#peopleName").val("教员姓名");
	});
	
	$("#modalDialogButton4").click(function(){//查询
		
		if($("#peopleName").val()=="教员姓名"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($("#peopleName").val());
		}
		//$("#VParentid").val("");
		//$( "#searchForm" ).submit();
		gotoPage(1);
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

		if(count==0){
			$("#dialogForm3Warning").html("<br/>请选择要修改体检信息！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		if(id.split(",")[1]==""){
			$("#dialogForm3Warning").html("<br/>选中的教员没有体检信息，不能修改。"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		
		var deptid = tree.getSelectedItemId();
		var deptname = tree.getSelectedItemText();
		$("#deptId").val(deptid);
		$("#tjid").val("1");
		$("#peopleId").val(id);
		$("#showPeople").val("");
		$( "#dialogFormNewPeople" ).submit();
		
	});
	
	$("#modalDialogButton6").click(function(){//查询
		var deptid = tree.getSelectedItemId();
		$("#depthistory").val(deptid);
		$( "#searchHistory" ).submit();
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
						reloadPlan();
						if(data.flag){
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
	
	$( "#dialogContent" ).dialog({//内容窗口
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
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
				$("#VId").val(data.vdepartment.VId);
				$("#vname").val(data.vdepartment.VName);
				$("#iorder").val(data.vdepartment.IOrder);
				$("#CVParentid").val(data.vdepartment.VParentid);
                
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
		
		if(id==""){
			return;	
		}
		params = {"id":id};
		$.ajax({
			type:"post",
			url:"showMessageTjTeacherAjaxAction.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data==null){
					$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				if(data.ILevel=="" || data.DIssueTime==""){
					alert("选中的教员没有体检信息。");
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
		content+="<tr>";
		content+="<td width='60'>教员姓名：</td>";
		content+="<td width='140' height=\"24\">"+data.teacherBaseInfo+"</td>";
		content+="<td width='60'>教员编号：</td>";
		content+="<td width='140' height=\"24\">"+data.teacherCode+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td>所在部门：</td>";
		content+="<td height=\"24\">"+data.deptName+"</td>";
		content+="<td>合格证等级：</td>";
		content+="<td height=\"24\">"+data.ILevel+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td>国籍：</td>";
		content+="<td height=\"24\">"+data.VNation+"</td>";
		content+="<td>限制：</td>";
		content+="<td height=\"24\">"+data.VLimit+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td>结论日期：</td>";
		content+="<td height=\"24\">"+data.DResultdate+"</td>";
		content+="<td>主检医生：</td>";
		content+="<td height=\"24\">"+data.VDoctor+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td>签发人：</td>";
		content+="<td height=\"24\">"+data.VIssuer+"</td>";
		content+="<td>发证日期：</td>";
		content+="<td height=\"24\">"+data.DIssueTime+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td>有效期：</td>";
		content+="<td height=\"24\">"+data.DUsedTime+"</td>";
		content+="<td>发证单位：</td>";
		content+="<td height=\"24\">"+data.VCompany+"</td>";
		content+="</tr>"
		return content;
	}
	
	$(document).ready(function() {
		gotoPage(1);
	});
</script>

<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>

</head>
<body class="hide">
<div id="leftPartA"><div>
<s:action name="open_leftList" executeResult="true">
<s:param name="parentid">4028816a4714304c0147149e89190004</s:param>
<s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
</s:action>
</div></div>

<div id="leftPartC"><div>

<div id="treeboxbox_tree"></div>

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
	<button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">添加体检信息</button>
	<button class="normal barLeft" id="modalDialogButton5">修改体检信息</button>
</s:if>	
	<button class="normal <s:if test="#r==null || #r==0">barRight</s:if>" id="modalDialogButton3">全部</button>
	
	<!--<button class="normal barRight" id="modalDialogButton6">历史查询</button>-->
		
    <div class="buttonInput relative left" width="180" height="28">
     <input id="peopleName" name="peopleName"  title="教员姓名"  type="text" maxlength="50" value="教员姓名" /><button id="modalDialogButton4">查询</button>
    </div>

</div>


<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="20"></th>
				<th width="60"></th>
				<th width="60"></th>
				<th width="180"></th>
				<th width="88"></th>
				<th width="88"></th>
                <th width="88"></th>
				<th width="100"></th>
                <th width="60"></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"></th>
				<th class="thSortableGray">姓名</th>
				<th class="thSortableGray">编号</th>
				<th class="thSortableGray">合格证等级</th>
				<th class="thSortableGray">结论日期</th>
				<th class="thSortableGray">发证日期</th>
				<th class="thSortableGray">到期日期</th>
                <th class="thSortableGray">剩余有效期(天)</th>
				<th class="thSortableGray">主检医师</th>
                <th class="thSortableGray">签发人</th>
			  </tr>
			</thead>
			<tbody id="searchPage">
			
			</tbody>
		</table>


	</div>

</div>

</div>

</div></div>


<div id="dialogForm3">
<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
<div class="panelRight" style="margin-left: 75px;">
<span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span>
</div>
</div>

<div id="dialogForm4">
<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
<div class="panelRight" style="margin-left: 75px;">
<span style="font-size: 14px; font-weight: bold; color: #555555; " id="dialogForm4Span"></span>
</div>
</div>

<div id="dialogForm2">
<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
<div class="panelRight" style="margin-left: 75px;">
<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确定要删除选中的信息吗？<br/>信息删除后不可恢复。</span>
</div>
</div>

<div id="dialogContent"  title="查看教员体检信息">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
    <tbody id="contentid">
    </tbody>
    </table>
</div>

<!-- 教员体检信息管理 -->
<form id="dialogFormNewPeople" action="toAddOrUpTjTeacherAction.do" method="post">
	<input type="hidden" id="peopleId" name="id"/>
	<input type="hidden" id="tjid" name="tjId"/>
	<input type="hidden" id="deptId" name="deptId"/>
	<input type="hidden" id="showPeople" name="showPeople"/>
	<input type="hidden" name="key" value="${key}"/>
</form>

<form  action="searchTjListTeacherAction.do" method="post" id="searchForm">
  <input name="key" type="hidden" id="searchKey">
</form>

<form  action="searchTjHistoryTeacherAction.do" method="post" id="searchHistory">
  <input type="hidden" id="depthistory" name="deptId"/>
  <input type="hidden" name="key" value="${key}"/>
</form>

<form  action="deleteTeacherAction.do" method="post" id="deleteForm">
    <input name="peopleids" type="hidden" id="peopleids">
    <input name="deptId" type="hidden" id="delPDeptId">
    <input type="hidden" name="key" value="${key}"/>
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
menu=new dhtmlXMenuObject("treeboxbox_tree");
menu.setImagePath("../images/DhtxMenu/");
menu.setIconsPath("../images/MenuIcon/");
menu.renderAsContextMenu(true);

//初始化树
tree=new dhtmlXTreeObject("treeboxbox_tree","300px","100%",0);
tree.enableContextMenu(menu);
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
	$("#VParentid").val(tree.getSelectedItemId());//获取选中树形节点的ID
	if($("#peopleName").val()=="教员姓名"){
		$("#searchKey").val("");
	}else{
		$("#searchKey").val($("#peopleName").val());
	}
	
	gotoPage(1);
}
//加载树
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
function setTreeFromOrgList(data){
	tree.deleteChildItems(0);
	for(i=0;i<data.length;i++){
		tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].message);
		tree.closeAllItems(data[i].VParentid);
	}
	//用于返回时选中树节点
	var VDeptId = $("#VDeptid").val();
	if(VDeptId != null && VDeptId!=""){
		tree.selectItem(VDeptId);
		tonclick();//调用选中的节点单击方法
	}
}

function gotoPage(pageIndex){
	pageIndex=pageIndex<1?1:pageIndex;
	var treeids = tree.getAllSubItems(tree.getSelectedItemId())+","+tree.getSelectedItemId();
	if(treeids=="0,"){
		treeids = "";
	}
	//$("#searchKey").val($("#peopleName").val());
	var key = $("#searchKey").val();
	if(key=="教员姓名"){
		key="";
	}
	params = {"deptId":treeids,"key":key,"pageIndex":pageIndex};
	$.ajax({
		type:"post",
		url:"searchListTjTeacherAjaxAction.do",
		data:params,
		dataType:"json",
		success:function(data){
			var ht = "";
			var selects = "";
			var selstr = "";
			var vday = "";
			var img = "";
			var col = "";
			var str = "";
			if(data.data.length>0){
				for(var i=0;i<data.data.length;i++){
					if(data.data[i].ILevel==""){
						vday = "";
						str= "&nbsp;" + data.data[i].VName;
					}else{
						if(data.data[i].iday<=31){
							col = "#FF0000";
							img = " <img src=\"themes/cupertino/images/top1.gif\"  align=\"absmiddle\"/>";
						}else if(31<data.data[i].iday && data.data[i].iday<=61){
							img = " <img src=\"themes/cupertino/images/top2.gif\"  align=\"absmiddle\"/>";
							col = "#EBA600";
						}else if(61<data.data[i].iday && data.data[i].iday<=90){
							img = " <img src=\"themes/cupertino/images/top3.gif\"  align=\"absmiddle\"/>";
							col = "#00A2BE";
						}else{
							img = "";
							col = "#000000";
						}
						vday = data.data[i].iday + img;
						str = "<a href='javascript:void(0)' onclick=\"showPeopleMsg('"+data.data[i].VId+"');\" class=\"blue\">" + data.data[i].VName + "</a>";
					}
					ht+="<tr><td><input name=\"contractIdList\" type=\"radio\" value=\""+data.data[i].VId+","+data.data[i].ILevel+"\"><b></b></td>"+
						"<td>"+str+"</td>"+
						"<td>"+data.data[i].VCode+"</td>"+
						"<td>"+data.data[i].ILevel+"</td>"+
						"<td>"+data.data[i].DResultdate+"</td>"+
						"<td>"+data.data[i].DIssueTime+"</td>"+
						"<td>"+data.data[i].DUsedTime+"</td>"+
						"<td>&nbsp;&nbsp;&nbsp;&nbsp;<font color="+col+">"+vday+"</font></td>"+
						"<td>"+data.data[i].VDoctor+"</td>"+
						"<td>"+data.data[i].VIssuer+"</td></tr>";
				}
			}

			var start = data.pageStart;
			var end = data.pageEnd;
			var totalPageCount=data.totalPageCount;
			var totalCount=data.totalCount;
			var pageCount=totalPageCount;
			var pageIndex=data.currentPageNo; //当前页号
			
			for(j=1;j<=pageCount;j++){
				if(pageIndex==j){
					selstr = " selected=\"selected\"";
				}else{
					selstr = "";
				}
				selects+="<option value="+j+selstr+">"+j+"</option>";
			}
			ht+="<tr><td colspan=\"10\" align=\"right\"><a href=\"javascript:firstPage("+pageIndex+");\" class=\"blue\">首页</a>&nbsp;<a href=\"javascript:prePage("+pageIndex+");\" class=\"blue\">上一页</a>&nbsp;<a href=\"javascript:nextPage("+pageIndex+","+pageCount+");\" class=\"blue\">下一页</a>&nbsp;<a href=\"javascript:lastPage("+pageIndex+","+pageCount+");\" class=\"blue\">尾页</a>&nbsp;<select id =\"seliid\" onchange=\"jumpPage()\">"+selects+"</select>本页显示"+start+"-"+end+"条/共"+totalPageCount+"页"+totalCount+"条&nbsp;&nbsp;</td></tr>";
				
			$("#searchPage").html(ht);
			execbase();
			/*
			var progressbar1 = document.getElementsByName("progressbar1");
			if(progressbar1 != null){
				for(var i=0;i<progressbar1.length;i++){
					var j = i+1;
					var num = parseInt(progressbar1[i].value);
					var id="#teacherl"+j;
					$(id).progressbar({value: parseInt(num)});
				}
			}
			*/
		},
		error:function(){
			alert("数据库连接错误，获取部门失败，请重试！");
			return;
		}
	});
}

function jumpPage(){
	var s = $("#seliid").val();
	gotoPage(s);
}

function firstPage(pageIndex){
	if (pageIndex!=1){
		gotoPage(1);
	}
}   
function nextPage(pageIndex,pageCount){
	if (pageIndex<pageCount){
		gotoPage(pageIndex+1);
	}     
}
function prePage(pageIndex){
	if (pageIndex>1){
		gotoPage(pageIndex-1);
	}
} 
function lastPage(pageIndex,pageCount){
	if (pageIndex!=pageCount){
		gotoPage(pageCount);
	}     
}
</script>

</body>
</html>
