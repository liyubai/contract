<%@ page language="java" import="com.opensymphony.xwork2.ActionContext"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户列表</title>
<link
	href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css"
	rel="stylesheet" type="text/css" />
<link
	href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css"
	rel="stylesheet" type="text/css" />
<script
	src="<%=request.getContextPath()%>/contract/scripts/jquery.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/jquery-ui.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.position.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.core.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.widget.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.button.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.tabs.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.dialog.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/ui/jquery.ui.menu.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/function.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/jquery.validate.min.js"></script>
<script
	src="<%=request.getContextPath()%>/contract/scripts/messages_zh.js"></script>
<script src="<%=request.getContextPath()%>/contract/scripts/time.js"></script>
<script>
        $(function() {
        new $.dropDownList(0, true, 240);
        new $.dropDownList(1, true, 240);
        });
        
    </script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
</head>

<body>
	<jsp:include page="/pages/common/topPart.jsp"></jsp:include>
	<jsp:include page="/pages/common/leftPart.jsp"></jsp:include>

	<div id="rightPartA" style="overflow-x: hidden;">
		<div>
		<!-- 新增用户 -->
			<div class="panelBox buttonBox">
				<a href="javascript:void(0)" class="aLinkBtn1 left" id="addUser">新增用户</a>
			</div>
	    <!-- 循环用户列表 -->		
			<div class="Panel ui-corner-all-0">
				<div class="panelContent clear">
					<table class="panelTable" border="0" cellspacing="0"
						cellpadding="3">
						<thead>
							<tr class="trSpliter">
								<th width="240"></th>
								<th width="240"></th>
								<th width="240"></th>
								<th width="240"></th>
								<th width="240"></th>
							</tr>
							<tr>
								<th class="thSortableGray"><span class="ml10">用户编号</span></th>
								<th class="thSortableGray"><span class="ml10">账号</span></th>
								<th class="thSortableGray"><span class="ml10">姓名</span></th>
								<th class="thSortableGray"><span class="ml10">角色</span></th>
								<th class="thSortableGray"><span class="ml10">操作</span></th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="userListExtends">
								<tr>
									<td>${VId}<input type="hidden" id="VNo_${VId}" name="VNo_${VId}" value="${VId}" /></td>
									<td>${VUsername}<input type="hidden" id="VName_${VId}" name="VName_${VId}" value="${VUsername}" /></td>
									<td>${VRealname}<input type="hidden" id="VRealName_${VId}" name="VRealName_${VId}" value="${VRealname}" /></td>
									<td>${rolename}<input type="hidden" id="VRoleName_${VId}" name="VRoleName_${VId}" value="${rolename}" /> 
									               <input type="hidden" id="VRoleId_${VId}" name="VRoleId_${VId}" value="${VRoleId}" />
                                    </td>
									<td><input type="hidden" name="VPassword_${VId}" id="VPassword_${VId}" value="${VPassword}" /> 
									    <a href="javascript:queryUpdateUser('${VId}')" class="blue modifyUser" dataid="${VId}">修改</a></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					${pageStr}	
				</div>
			</div>
		</div>
	</div>
    <!-- 新增用户form表单 -->
	<div id="dialogForm1" title="新增用户">
		<p class="validateTips">请填写所有信息</p>
		<form action="userManagent_addUser.do" method="post" id="addUserForm"
			name="addUserForm">
			<div class="jffpline clear">
				<label class="jffp1">登录账号</label> <input placeholder="请输入由4-10位数字或字母组合的用户名" type="text" id="VName_add"
					name="userName" value="" class="tableinput" />
			</div>
			<div class="jffpline clear">
				<label class="jffp1">用户姓名</label> <input placeholder="请输入1-10位字符或汉字" type="text" id="VRealName_add"
					name="realName" value="" class="tableinput" />
			</div>
			<div class="jffpline clear">
				<label class="jffp1">密码</label> <input placeholder="请输入8-20数字、字母、字符组成的密码" type="text"
					id="VPassword_add" value="" name="password"
					class="tableinput" />
			</div>

			<div class="jffpline clear">
				<label class="jffp1">角色</label>
				<div class="popSelectWrap">
				<!-- 循环出角色 -->
					<select id="VRole_add" name="user.VRole" class="popSelect">
						<s:iterator value="roleList">
							<option value="${Role_Id}">${Role_Name}</option>
						</s:iterator>

					</select> <input type="hidden" name="role" id="addrole" /> <span
						class="popSelectArrowW"> <span
						class="popSelectArrow ui-icon ui-icon-carat-1-s"></span>
					</span>
				</div>
			</div>
		</form>
	</div>
    <!-- 修改用户form表单 -->
	<div id="dialogForm2" title="修改用户">
		<p class="validateTips">请填写所有信息</p>
		<form method="post" id="updateUserForm"
			action="userManagent_updateUser.do">
			<input type="hidden" id="VId_update" name="id" value="" />
			<div class="jffpline clear">
				<label class="jffp1">登录账号</label> <input placeholder="请输入由6-10位数字或字母组合的密码" type="text"
					id="VName_update" name="userName"  value="" class="tableinput" /> <input
					type="hidden" id="TFVName_update" name="TFVName_update" value=""
					class="tableinput" />
			</div>
			<div class="jffpline clear">
				<label class="jffp1">姓名</label> <input placeholder="请输入1-10位字符或汉字" type="text" name="realName"
					id="VRealName_update" value="" class="tableinput" />
			</div>
			<div class="jffpline clear">
				<label class="jffp1">密码</label> <input placeholder="请输入8-20数字、字母、字符组成的密码" type="text" name="password"
					id="VPassword_update" value="" class="tableinput" />
			</div>
			<div class="jffpline clear">
				<label class="jffp1">角色</label>
				<div class="popSelectWrap">
					<span class="popSelectArrowW"> <span
						class="popSelectArrow ui-icon ui-icon-carat-1-s"></span>
					</span>
					<!-- 循环角色 -->
					 <select id="VRole_update" name="roles" class="popSelect">
						<s:iterator value="roleList">
							<option value="${Role_Id}">${Role_Name}</option>
						</s:iterator>
					</select> <input type="hidden" id="updaterole" name="role" value="" />
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

        /* 新增用户 */
        $("#dialogForm1").dialog({
            autoOpen: false,
            height: 300,
            width: 500,
            background: '#FF0000', // 背景色
            opacity: 0.27,     // 透明度
            modal: true,
            resizable: false,
            buttons: {
                "确 定": function() {
            /* 判断用户添加信息是否符合规定 */
            if( userAddCheckForm()){
                /*访问ajax接口获取用户名是否被使用*/
                var userName = $("#VName_add").val();    
           //     alert(userName);
    			$.ajax({
    				type:"post",
    				//async:false, 
    				url:"<%=request.getContextPath()%>/contract/findUserName.do",
    				data:{
    					userName:userName	
    				},
    				dataType:'text',
    				success:function(data){
    				//	alert(data);
    					if (data == "OK") {
    						$("#addrole").val($("#VRole_add").val());
    			           	$("#addUserForm").submit();
    					} else {
    						alert("该用户名已存在");
    					}
    				}, 
    				error:function(XMLHttpRequest, textStatus, errorThrown){
    					alert(errorThrown);
    				}
    			});	
            	
            	
            }
   
                	
                	
                },
                "取 消": function() {
                    $(this).dialog("close");
                }
            },
            close: function() {
                allFields.val("").removeClass("error");
            }
        });
        /* 修改用户表单 */
        $("#dialogForm2").dialog({
            autoOpen: false,
            height: 300,
            width: 500,
            background: '#FF0000', // 背景色
            opacity: 0.27,     // 透明度
            modal: true,
            resizable: false,
            buttons: {
                "确 定": function() {
                	if(userUpdateCheckForm()){
                        var userName = $("#VName_update").val();    
                        var tfuserName = $("#TFVName_update").val();     
                        if(userName==tfuserName){
                        	$("#updaterole").val($("#VRole_update").val());
                    		$("#updateUserForm").submit();
                        	
                        }else{
                        	
                          
                			$.ajax({
                				type:"post",
                				//async:false, 
                				url:"<%=request.getContextPath()%>/contract/findUserName.do",
                				data:{
                					userName:userName	
                				},
                				dataType:'text',
                				success:function(data){
                				//	alert(data);
                					if (data == "OK") {
                						$("#updaterole").val($("#VRole_update").val());
                	            		$("#updateUserForm").submit();
                					} else {
                						alert("该用户名已存在");
                					}
                				}, 
                				error:function(XMLHttpRequest, textStatus, errorThrown){
                					alert(errorThrown);
                				}
                			});		
                        }
                	}
                    //确定按钮的处理代码段：
                   // userUpdateCheckForm();
            /*访问ajax接口获取用户名是否被使用*/
          },
                "取 消": function() {
                    $(this).dialog("close");
                }
            },
            close: function() {
                allFields.val("").removeClass("error");
            }
        });
        /* 点击新增用户 */
        $('#addUser').click(function() {
            tips.removeClass("ui-state-highlight").html("请填写所有信息");
            $("#modalDialogButton1 input.error").removeClass("error");
    //        alert($("#VRole_add").val());
            $("#dialogForm1").dialog("open");
        });
        /* 点击修改用户 */
        $('.modifyUser').click(function() {
            tips.removeClass("ui-state-highlight").html("请填写所有信息");
            $("#modalDialogButton1 input.error").removeClass("error");
            $("#dialogForm2").dialog("open");
          
        });
    })
    /* 修改用户信息 */
    function queryUpdateUser(VId){
    	var VName = $("#VName_" + VId).val();
		var VRoleName = $("#VRoleName_" + VId).val();
		var VRoleId = $("#VRoleId_" + VId).val();
		var VPassword = $("#VPassword_" + VId).val();
		var VRealName = $("#VRealName_"+VId).val();
	//	alert(VRealName);
		/* 赋值 */
		$("#VId_update").val(VId);
		$("#VName_update").val(VName);
		$("#TFVName_update").val(VName);
		$("#VPassword_update").val(VPassword);
		$("#updaterole").val(VRoleId);
		$("#VRole_update").val(VRoleId);
		$("#VRealName_update").val(VRealName);
	}
    
   function userAddCheckForm(){
    	var userName = $.trim($("#VName_add").val());
    	var password = $.trim($("#VPassword_add").val());
    	var realName = $.trim($("#VRealName_add").val());
    	var a = /[0-9a-zA-Z]{4,10}$/;
    	var b = /(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,20}/;
    	if(!a.test(userName)){
    		alert("用户名至少为4-10位字母或数字组成，请输入有效的用户名");
    		return false;	
    	}
    	if(!b.test(password)){
    		alert("密码至少为8-20位数字、字母、字符组成，请输入有效的密码");
    		return false;	
    	}
    	if(realName.length>=11||realName.length==0){
    		alert("姓名为1-10位");
    		return false;
    		
    	}
    	else 
    		return true;	
    }
   
   function userUpdateCheckForm(){
   	var userName = $.trim($("#VName_update").val());
   	var password = $.trim($("#VPassword_update").val());
   	var realName = $.trim($("#VRealName_update").val());
   	var a = /[0-9a-zA-Z]{4,10}$/;
   //	var b = /[0-9a-zA-Z]{6,10}$/;
   	var b = /(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).{8,20}/;
   	if(!a.test(userName)){
   		alert("用户名为4-10位字母或数字组成，请输入有效的用户名");
   		return false;	
   	}
   	if(!b.test(password)){
   		alert("密码为8-20位数字、字母、字符组成，请输入有效的密码");
   		return false;	
   	}
   	if(realName.length>=11||realName.length==0){
		alert("姓名为1-10位");
		return false;
		
	}
   	else 
   		return true;	
   }
   
    
 
</script>
</body>
</html>
