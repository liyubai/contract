
<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>角色列表</title>
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css" rel="stylesheet" type="text/css" />
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/jquery-ui.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.position.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.core.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.widget.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.button.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.tabs.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.dialog.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.menu.min.js"></script>
    <script src="<%=request.getContextPath()%>/contract/scripts/function.min.js"></script>
    <script>
        $(function() {
            new $.dropDownList(0, true, 240);
        });
    </script>
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
</head>

<body>
<jsp:include page="/pages/common/topPart.jsp"></jsp:include>
<jsp:include page="/pages/common/leftPart.jsp"></jsp:include>
<div id="rightPartA" style="overflow-x:hidden;">
<div>
    <div class="panelBox buttonBox">
        <a href="javascript:void(0)" class="aLinkBtn1 left" id="addRole">新增角色</a>
        
    </div>
    <div class="Panel ui-corner-all-0">
    <div class="panelContent clear">
        <table class="panelTable" border="0" cellspacing="0" cellpadding="3">
            <thead>
	          <tr class="trSpliter">
				<th width="240"></th>
				<th width="240"></th>
			  </tr>
			  <tr>
				<th class="thSortableGray"><span class="ml10">角色名称</span></th>
				<th class="thSortableGray"><span class="ml10">操作</span></th>
			  </tr>
			</thead>
			<tbody>
			 <s:iterator value = "roleList">	
			 	<tr>
			 		<td id="Role_Name_${Role_Id}">${Role_Name}</td>
			 		<td>
			 		<!--  -->
			 		<a href="javascript:void(0)" class="blue modifyRole" dataid="${Role_Id}_${Power_Ids}">修改权限</a>
			 		<!--  a href="roleManagent_updatRedirect.do?role.Role_Name=${Role_Name}&role.Role_Id=${Role_Id}&role.Power_Ids=${Power_Ids}" class="blue modifyRole" dataid="${Role_Id}">修改权限</a>-->
			 		</td>
			 	</tr>
			 
			 </s:iterator>
			</tbody>
        </table>
    </div>
    </div>
</div>
</div>

<div id="dialogForm1" title="新增角色">
	<p class="validateTips">请填写信息</p>
	<form action ="roleManagent_addRole.do"  method="post" id = "addRoleForm">
		<div>
		     <label class="jffp1">角色名称</label>
            <input id = "Role_Name_add" name ="role.Role_Name" type="text" class="tableinput2" />
		</div>
	</form>
</div>

<script>
    $(function() {

    var txt1 = $("#txtRole"),
		allFields = $([]).add(txt1),
		tips = $(".validateTips");

        function updateTips(t) {
            tips.html(t).addClass("ui-state-highlight");
            setTimeout(function() {
                tips.removeClass("ui-state-highlight", 1500);
            }, 2000);
        }

        $("#dialogForm1").dialog({
            autoOpen: false,
            height: 200,
            width: 300,
            background: '#FF0000', // 背景色
            opacity: 0.27,     // 透明度
            modal: true,
            resizable: false,
            buttons: {
                "确 定": function() {
                    //确定按钮的处理代码段：
                    var RoleName= $("#Role_Name_add").val().trim();
                    if(RoleName.length==0) alert("角色名称为空！！");
                    else{
					$("#addRoleForm").submit();}
                
                    //$(this).dialog("close");
                },
                "取 消": function() {
                    $(this).dialog("close");
                }
            },
            close: function() {
                allFields.val("").removeClass("error");
            }
        });



        $('#addRole').click(function() {
            tips.removeClass("ui-state-highlight").html("新增角色信息");
            $("#modalDialogButton1 input.error").removeClass("error");
            $("#dialogForm1").dialog("open");
        });
        
        $('.modifyRole').click(function(){
        	//角色名称
        	var VId = $(this).attr("dataid");
        	var VP= new Array();
        	VP=VId.split("_");
        	var VRole_Name = $("#Role_Name_" + VP[0]).html();
        	VRole_Name=encodeURI(encodeURI(VRole_Name)); 
        	window.location.href = 'roleManagent_updatRedirect.do?role.Role_Name='+VRole_Name+'&role.Role_Id='+VP[0]+'&role.Power_Ids='+VP[1];
        });

        
    });
</script>
</body>
</html>
