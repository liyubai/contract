<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<!-- 树形相关结束-->
<style>
#rightPartC > div { min-width: 370px; }  
</style>
<script>
C_WIDTH=700;
$(function() {

});
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">

<div id="leftPartA"><div>
    <ul class="foldList">
        <li><span class="ui-icon ui-icon-carat-1-e"></span>用户管理</li>
        <ul class="itemList hide">
            <li><a class="navLink" href="Func11.do" id="navLink111" title="所有用户" tabTitle="所有用户">所有用户</a></li>
            <li><a class="navLink" href="Func11.do" id="navLink111" title="已开通" tabTitle="已开通">已开通</a></li>
            <li><a class="navLink" href="Func11_1.do" id="navLink11101" title="待开通" tabTitle="待开通">待开通</a></li>
            <li><a class="navLink" href="Func11.do" id="navLink111" title="已停用" tabTitle="已停用">已停用</a></li>
            <li><a class="navLink" href="Func11_1.do" id="navLink11101" title="已删除" tabTitle="已删除">已删除</a></li>
        </ul>
    </ul>
    <span class="panelLine"></span>
    
    <ul class="foldList">
        <li><span class="ui-icon ui-icon-carat-1-e"></span>角色管理</li>
        <ul class="itemList hide">
            <li><a href="searchRoles.do">全部角色</a></li>
        </ul>
    </ul>
    
    <span class="panelLine"></span>
    
    <ul class="foldList">
        <li><span class="ui-icon ui-icon-carat-1-e"></span>组织机构管理</li>
        <ul class="itemList hide">
            <li><a href="open_orgInfoList.do">组织机构信息维护</a></li>
            <li><a href="open_checkbokOrgInfoList.do">复选框组织机构树</a></li>
        </ul>
    </ul>
    
    <span class="panelLine"></span>
    
    <ul class="foldList">
        <li><span class="ui-icon ui-icon-carat-1-e"></span>数据字典管理</li>
        <ul class="itemList hide">
            <li><a class="navLink" href="Func12.do" id="navLink112" title="字典类型管理">字典类型维护</a></li>
            <li><a class="navLink" href="Func13.do" id="navLink113" title="字典信息维护">字典信息维护</a></li>
        </ul>
    </ul>
    
    <span class="panelLine"></span>
    <ul class="foldList">
        <li><span class="ui-icon ui-icon-carat-1-e"></span>政策法规量化管理</li>
        <ul class="itemList hide">
            <li><a class="navLink" href="Func12.do" id="navLink112" title="政策法规量化">政策法规量化信息维护</a></li>
        </ul>
    </ul>
    <span class="panelLine"></span>
    
    <ul class="itemList">
        <li><a class="navLink" href="Func12.do" id="navLink112" title="当前在线用户">当前在线用户</a></li>
    </ul>
    <span class="panelLine"></span>
    <ul class="itemList">
        <li><a class="navLink" href="Func13.do" id="navLink113" title="访问量统计">访问量统计</a></li>
    </ul>
    <span class="panelLine"></span>
    <ul class="itemList">
        <li><a class="navLink" href="Func13.do" id="navLink113" title="系统服务器性能查询">系统服务器性能查询</a></li>
    </ul>
    
    <span class="panelLine"></span>	
    
    <ul class="itemList">
        <li><a class="navLink" href="Func13.do" id="navLink113" title="系统服务器性能查询">学生状态与学籍状态关系管理</a></li>
    </ul>
    
    <span class="panelLine"></span>
    
    <ul class="itemList">
        <li><a class="navLink" href="Func13.do" id="navLink113" title="局方文件管理">局方文件管理</a></li>
    </ul>
    
    <span class="panelLine"></span>
    
    <ul class="itemList">
        <li><a class="navLink" href="Func13.do" id="navLink113" title="系统业务日志查询">系统业务日志查询</a></li>
    </ul>
    
    <span class="panelLine"></span>	
    
    <ul class="foldList">
        <li><span class="ui-icon ui-icon-carat-1-e"></span>数据库维护</li>
        <ul class="itemList hide">
            <li><a class="navLink" href="Func12.do" id="navLink112" title="数据库备份">数据库备份</a></li>
        </ul>
    </ul>
    <span class="panelLine"></span>
    
    <ul class="foldList">
        <li><span class="ui-icon ui-icon-carat-1-s"></span>系统功能模块管理</li>
        <ul class="itemList">
            <li><a href="open_functionInfoList.do">功能模块维护</a></li>
            <li class="active" style="cursor:default"><a>带复选框功能模块</a></li>
        </ul>
    </ul>
</div>
</div>


<div id="leftPartC"><div>     
<div class="panelBox buttonBox">

	<button id="modalDialogButton1" class="green" primary="ui-icon-button-addperson">新建角色</button>
	
	<button class="normal barLeft" id="modalDialogButton2">删除角色</button>
	
	<button class="normal barRight" id="modalDialogButton3">刷新</button>
		
    <div class="buttonInput relative left" width="180" height="28">
     <input id="roleName" name="roleName"  type="text" maxlength="50" value=""/><button id="modalDialogButton4" title="输入角色名称">查询</button>
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
				<th width="144"></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">角色名称</th>
				<th class="thSortableGray">角色描述</th>
				<th class="thSortableGray">创建时间</th>
				<th class="thSortableGray">操作</th>
				<th class="thSortableGray">&nbsp;</th>
			  </tr>
			</thead>
			<tbody>
			
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="4028816a47053df70147054ad0880004"></td>
				<td class="searchRange" title="k11">k11</td>
				<td class="searchRange" title="lllll11111">lllll11111</td>
				<td class="searchRange">
				   2014-07-05 14:51:34
				</td>
				<td>
				
				   <a href="javascript:execEdit('4028816a47053df70147054ad0880004')" class="blue">修改</a>&nbsp;&nbsp;<a href="#" class="blue">权限分配</a>
				 

				   
				</td>
				<td></td>
			  </tr>
			
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="4028816a47053df701470543b22e0003"></td>
				<td class="searchRange" title="333111">333111</td>
				<td class="searchRange" title="33331111111">33331111111</td>
				<td class="searchRange">
				   2014-07-05 14:43:48
				</td>
				<td>
				
				   <a href="javascript:execEdit('4028816a47053df701470543b22e0003')" class="blue">修改</a>&nbsp;&nbsp;<a href="#" class="blue">权限分配</a>
				 

				   
				</td>
				<td></td>
			  </tr>
			
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="4028816a47053df70147054284730002"></td>
				<td class="searchRange" title="222">222</td>
				<td class="searchRange" title="222">222</td>
				<td class="searchRange">
				   2014-07-05 14:42:31
				</td>
				<td>
				
				   <a href="javascript:execEdit('4028816a47053df70147054284730002')" class="blue">修改</a>&nbsp;&nbsp;<a href="#" class="blue">权限分配</a>
				 

				   
				</td>
				<td></td>
			  </tr>
			
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="4028816a47053df70147054242490001"></td>
				<td class="searchRange" title="111">111</td>
				<td class="searchRange" title="1111">1111</td>
				<td class="searchRange">
				   2014-07-05 14:42:14
				</td>
				<td>
				
				   <a href="javascript:execEdit('4028816a47053df70147054242490001')" class="blue">修改</a>&nbsp;&nbsp;<a href="#" class="blue">权限分配</a>
				 

				   
				</td>
				<td></td>
			  </tr>
			 
            
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			  <tr>
				<td>&nbsp;<b></b></td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td class="searchRange" >&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
			  </tr>
              
			</tbody>
		</table>



	</div>

</div>

</div></div>

<div id="rightPartC"><div>

<div id="treeboxbox_tree" style="height:100%;margin-left:20px; margin-top:20px;background-color:#FFF"></div>     


</div>
</div>

</body>
</html>
<script>

//初始化树
tree=new dhtmlXTreeObject("treeboxbox_tree","350px","100%",0);
tree.setSkin('dhx_skyblue');
tree.enableCheckBoxes(true); 
tree.enableThreeStateCheckboxes(true);
tree.setImagePath("../common/images/");
tree.enableDragAndDrop(false);

tree.enableTreeLines(true);
tree.setImageArrays("plus","plus2.gif","plus3.gif","plus4.gif","plus.gif","plus5.gif");
tree.setImageArrays("minus","minus2.gif","minus3.gif","minus4.gif","minus.gif","minus5.gif");
tree.setStdImages("book.gif","books_open.gif","books_close.gif");
reloadPlan();//加载根
tree.attachEvent("onOpenEnd", function(id,state){//展开加载子节点。
	if(state==1){
		params = {"parentid":id};
		$.ajax({
			type:"post",
			url:"showFunctionTree.do",
			data:params,
			dataType:"json",
			success:function(data){
				tree.deleteChildItems(id);
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

function setTreeFromOrgList(data){
	tree.deleteChildItems(0);
	for(i=0;i<data.length;i++){
		
		tree.insertNewChild(data[i].VParentid,data[i].VId,data[i].VName);
	}
}
</script>