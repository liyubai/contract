<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户管理</title>
    <link href="themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="themes/cupertino/selfStyle.css" rel="stylesheet" type="text/css" />
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
    <script>
        $(function() {
        new $.dropDownList(0, true, 240);
        new $.dropDownList(1, true, 240);
        });
    </script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="scripts/base.min.js"></script>
</head>

<body>
<div id="indexHead">
  <div class="headercontent">
      <img src="themes/cupertino/images/logo.png" />
      <span class="sysNameC">中国民航大学飞行培训合同管理系统</span>
      <div class="sysNameE">Civil aviation university of china Contract management system </div>
      <div class="logout">
          <span class="today">2016-6-6</span>
          <span class="wel">欢迎</span>
          <a href="">张雪</a>
          <span class="sep"></span>
          <a href="">退出</a>
      </div>
  </div>
</div>
<div id="leftPartA">
    <ul class="itemList">
	    <li class="active"><a style="display:block;" href="cMain.htm" title="主页">主页</a></li>
	    <li><a href="cContractList.htm" title="合同管理">合同管理</a></li>
	    <li><a href="cStudentList.htm" title="学生管理">学生管理</a></li>
	    <li><a href="cPaylist.htm" title="付款管理">付款管理</a></li>
	    <li><a href="cClearingList.htm" title="结算管理">结算管理</a></li>
    </ul>
    <ul class="foldList">
	    <li title="统计">统计</li>
	    <ul class="itemList">
	        <li><a href="cPayStatistics.htm">付款统计</a></li>
	        <li><a href="cFinanceStatistics.htm">财务统计</a></li>
	        <li><a href="cCollectStatistics.htm">汇总统计</a></li>
	        <li><a href="cAverageStatistics.htm">平均统计</a></li>
	    </ul>
	</ul>
	<ul class="foldList">
        <li title="用户管理">用户管理</li>
        <ul class="itemList">
	        <li><a href="userManagent_showManagent.do">用户列表</a></li>
	        <li><a href="cRoleList.htm">角色列表</a></li>
	    </ul>
    </ul>
	<ul class="itemList">
	    <li><a href="cDataDictionary.htm" title="数据字典">数据字典</a></li>
	</ul>
</div>

<div id="rightPartA" style="overflow-x:hidden;">
<div>
    <div class="panelBox buttonBox">
        <a href="javascript:void(0)" class="aLinkBtn1 left" id="addUser">新增用户</a>
    </div>
    <div class="Panel ui-corner-all-0">
    <div class="panelContent clear">
        <table class="panelTable" border="0" cellspacing="0" cellpadding="3">
            <thead>
	          <tr class="trSpliter">
				<th width="240"></th>
				<th width="240"></th>
				<th width="240"></th>
				<th width="240"></th>
			  </tr>
			  <tr>
				<th class="thSortableGray"><span class="ml10">用户编号</span></th>
				<th class="thSortableGray"><span class="ml10">用户名</span></th>
				<th class="thSortableGray"><span class="ml10">角色</span></th>
				<th class="thSortableGray"><span class="ml10">操作</span></th>
			  </tr>
			</thead>
			<tbody>
			<s:iterator value="userList">
			  <tr>
			    <td id="VNo_${VId}">${VNo}</td>
				<td id="VName_${VId}">${VName}</td>
				<td id="VRole_${VId}">${VRole}</td>
				<td><a href="javascript:void(0)" class="blue modifyUser" dataid="${VId}">修改</a></td>
			  </tr>
			</s:iterator>
			</tbody>
        </table>
    </div>
    </div>
</div>
</div>

<div id="dialogForm1" title="新增用户">
	<p class="validateTips">请填写所有信息</p>
	<form action="userManagent_addUser.do" method="post" id="addUserForm">
		<div class="jffpline clear">
		    <label class="jffp1">用户名</label>
		    <input type="text" id="VName_add" name="user.VName" value="" class="tableinput" />
		</div>
		<!-- <div class="jffpline clear">
		    <label class="jffp1">密码</label>
            <input type="text" id="txtMM" value="" class="tableinput" />
		</div> -->
		<div class="jffpline clear">
		    <label class="jffp1">角色</label>
		    <div class="popSelectWrap">
            <select id="VRole_add" name="user.VRole" class="popSelect">
                <option>管理员</option>
                <option>普通用户</option>
            </select>
            <span class="popSelectArrowW">
                <span class="popSelectArrow ui-icon ui-icon-carat-1-s"></span>
            </span>
            </div>
	    </div>
	</form>
</div>

<div id="dialogForm2" title="修改用户">
	<p class="validateTips">请填写所有信息</p>
	<form method="post" id="updateUserForm">
		<input type="hidden" id="VId_update" name="user.VId" value=""/>
		<div class="jffpline clear">
		    <label class="jffp1">用户名</label>
		    <input type="text" id="VName_update" name="user.VName" value="" class="tableinput" />
		</div>
		<!-- <div class="jffpline clear">
		    <label class="jffp1">密码</label>
            <input type="text" id="Text2" value="" class="tableinput" />
		</div> -->
		<div class="jffpline clear">
		    <label class="jffp1">角色</label>
		    <div class="popSelectWrap">
            <span class="popSelectArrowW">
                <span class="popSelectArrow ui-icon ui-icon-carat-1-s"></span>
            </span>
            <select id="VRole_update" name="user.VRole" class="popSelect">
                <option>管理员</option>
                <option>普通用户</option>
            </select>
            </div>
	    </div>
	</form>
</div>

<script>
    $(function() {
        var txt1 = $("#txtYHM"),
		txt2 = $("#txtMM"),
		txt3 = $("#txtJS"),
		allFields = $([]).add(txt1).add(txt2).add(txt3),
		tips = $(".validateTips");

        function updateTips(t) {
            tips.html(t).addClass("ui-state-highlight");
            setTimeout(function() {
                tips.removeClass("ui-state-highlight", 1500);
            }, 2000);
        }


        $("#dialogForm1").dialog({
            autoOpen: false,
            height: 260,
            width: 500,
            background: '#FF0000', // 背景色
            opacity: 0.27,     // 透明度
            modal: true,
            resizable: false,
            buttons: {
                "确 定": function() {
                    //确定按钮的处理代码段：
                    // $(this).dialog("close");
                	$("#addUserForm").submit();
                },
                "取 消": function() {
                    $(this).dialog("close");
                }
            },
            close: function() {
                allFields.val("").removeClass("error");
            }
        });

        $("#dialogForm2").dialog({
            autoOpen: false,
            height: 260,
            width: 500,
            background: '#FF0000', // 背景色
            opacity: 0.27,     // 透明度
            modal: true,
            resizable: false,
            buttons: {
                "确 定": function() {
                    //确定按钮的处理代码段：
            		
            		//更新
            		var params=$("#updateUserForm").serialize();
            		$.ajax({
            			//async:false,//同步请求
            			type:"post",
            			url:"userManagent_updateUser.do",
            			data:params,
            			dataType:"json",
            			success:function(data){
            				var VId = data.VId;
            	        	var VName = $("#VName_" + VId).html(data.VName);
            				var VRole = $("#VRole_" + VId).html(data.VRole);
            				$("#dialogForm2").dialog("close");
            			},
            			error:function(){
            				alert("error");
            			}
            		});
                },
                "取 消": function() {
                    $(this).dialog("close");
                }
            },
            close: function() {
                allFields.val("").removeClass("error");
            }
        });
        
        $('#addUser').click(function() {
            tips.removeClass("ui-state-highlight").html("请填写所有信息");
            $("#modalDialogButton1 input.error").removeClass("error");
            
            $("#dialogForm1").dialog("open");
        });
        $('.modifyUser').click(function() {
        	// 赋值
        	var VId = $(this).attr("dataid");
        	var VName = $("#VName_" + VId).html();
			var VRole = $("#VRole_" + VId).html();
			$("#VId_update").val(VId);
			$("#VName_update").val(VName);
			$("#VRole_update").val(VRole);
        	
            tips.removeClass("ui-state-highlight").html("请填写所有信息");
            $("#modalDialogButton1 input.error").removeClass("error");
            
            $("#dialogForm2").dialog("open");
        });
    })
</script>
</body>
</html>
