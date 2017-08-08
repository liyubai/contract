<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学号账号开通管理</title>

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
/*功能9*/

</style>

<script>
//用于存储选中的复选框的value值
//var values = "";
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
	
	function checkDiag( o,n ) {
		o.addClass( "error" ).focus();
		updateTips( "<span class='ui-icon-custom ui-icon-custom-warning' style='margin-top: 6px;'></span>" + n );
		return false;
	}

	$( "#dialogForm1" ).dialog({
		autoOpen: false,
		height: 310,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				//确定按钮的处理代码段：
				var bValid = true;
				allFields.removeClass( "error" );

				var unameObj = $("#username");
				var passObj = $("#pass");
				var againPassObj = $("#againPass");
				
				bValid = bValid && checkLength( unameObj, "用户账号", 3, 100);
				bValid = bValid && checkLength( passObj, "登录密码", 3, 100);
				
				if(passObj.val() != ""){
				    if(passObj.val() != againPassObj.val()){
					   bValid = bValid && checkDiag(passObj,"两次密码输入不一致，请确认后重试!");
					}
				}

				if ( bValid ) {

				    $("#cuname").val($("#username").val());
					$("#cpass").val($("#pass").val());
					
					//获取单选按钮value值
					var isSystemUser = $("input[name='isSystem']:checked").val();
					
					$("#cadmin").val(isSystemUser);
					
					$("#userForm").submit();
					
					$( this ).dialog( "close" );
				}


			},
			"取 消": function() {
			    /*
				   由于添加和修改功能共用了一个dialogForm1，所以单击“取消”按钮时，要注意如下问题：
				   1、单击“取消”按钮后，将dialogForm1中的各个文本框和密码框置空，因为当修改某条信息时，如果没有提交而是单击了编辑页面的“取消”按钮后，该条信息的值会缓存在dialogForm1                      中的各个文本框和密码框中
				   2、当修改某条信息时userForm表单的action属性已经设置为更新的地址，当单击“取消”按钮后，应恢复成添加的请求地址				
				*/
				$("#VId").val("");
				$("#username").val("");
				$("#pass").val("");
				$("#againPass").val("");
				$("#dialogForm1").dialog('option', 'title', '新建用户账号');
				$("#userForm").attr("action","createSystemUserAccount.do");
				$( this ).dialog( "close" );
				updateTips("");
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});

     //新建用户账号
	$("#modalDialogButton1").click(function(){
	    
		$( "#dialogForm1" ).dialog( "open" );
		
	});

    //开通账号
	$("#modalDialogButton2").click(function(){
        //将选中的用户账号的id使用逗号（,）拼接在一起
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
			$("#dialogForm3Warning").html("<br/>请选择要开通的学员！"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		//进行相应的开通操作
		$("#usersidsStr").val(ids);
		$( "#dialogForm2" ).dialog( "open" ); 
		 
	});


/*
    //删除用户账号
	$("#modalDialogButton2").click(function(){
        //将选中的用户账号的id使用逗号（,）拼接在一起
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
			$("#dialogForm3Warning").html("<br/>请选择要删除的用户账号！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		//进行相应的删除操作
		$("#usersidsStr").val(ids);
		$( "#dialogForm2" ).dialog( "open" );  //dialogForm2：用于进行删除的提示警告信息
		 
	});
*/
    //停用用户账号
	$("#modalDialogButton3").click(function(){
        //将选中的用户账号的id使用逗号（,）拼接在一起
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
			$("#dialogForm3Warning").html("<br/>请选择要停用的用户账号！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		//进行相应的停用操作
		$("#stopusersidsStr").val(ids);
		$( "#dialogForm5" ).dialog( "open" );  //dialogForm2：用于进行停用的提示警告信息
		 
		 
		   
		
	});

    //恢复用户账号
	$("#modalDialogButton4").click(function(){
        //将选中的用户账号的id使用逗号（,）拼接在一起
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
			$("#dialogForm3Warning").html("<br/>请选择要恢复的用户账号！"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		//进行相应的恢复操作
		$("#recoverusersidsStr").val(ids);
		$( "#dialogForm6" ).dialog( "open" );  //dialogForm2：用于进行恢复的提示警告信息
		 
		 
		   
		
	});


	
	$("#modalDialogButton5").click(function(){//刷新
		$("#searchVcode").val("");
		$("#searchVanme").val("");
		$( "#searchForm" ).submit();
	});
	
	$("#modalDialogButton6").click(function(){//查询
	    var vcodevalue = $("#tsovcode").val();
		 var vnamevalue = $("#tsovname").val();
		if(vcodevalue == '学号'){
		   vcodevalue = "";		
		}
		if(vnamevalue == '学号/姓名'){
		   vnamevalue = "";		
		}

		$("#searchVcode").val(vcodevalue);
		$("#searchVanme").val(vnamevalue);
		
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
	

	$( "#dialogForm5" ).dialog({//停用用户账号窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#stopForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		},
		close: function() {
			allFields.val( "" ).removeClass( "error" );
		}
	});
	

	$( "#dialogForm6" ).dialog({//恢复用户账号窗口
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#recoverForm").submit();
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

    //处理导航隐藏
	$("#li1").click(function(){
		$(this).siblings().toggle(200).end().children(".ui-icon").toggleClass("ui-icon-carat-1-s").toggleClass("ui-icon-carat-1-e");
	});


});

	//编辑用户账号信息
    function execEdit(uid){
		//通过json读取字典对象
		params = {"id":uid};

		$.ajax({
			type:"post",
			url:"searchUserAccountById.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值

				$("#VId").val(data.VId);
				$("#username").val(data.VUsername);
				$("#pass").val(data.VPassword);
				$("#againPass").val(data.VPassword);
				 //$("input[type=radio][name=isSystem]").attr("checked",false);
				//取得name属值为isSystem的所有input元素，如果成功，返回数组，数组中存储的是input元素对象，该对象是标准的JavaScript中的DOM对象，并不是JQuery类型的对象
				var objs = $("input[name='isSystem']");
				
				if(objs!= null && objs.length>0){
				   for(var i=0; i<objs.length; i++){
				      //可以使用JQuery提供的$(obj)，将JavaScript中的DOM对象，转换为JQuery类型的对象，这样将来才能使用JQuery为JQuery类型的对象提供的通用方法，如： jqueryObj.val();
					  var jqueryObj = $(objs[i]);
					  
					  if(objs[i].value == data.IAdminStatus){
					      objs[i].checked = true;
					  }
					  
				   }
				}
				/*
				if(data.IAdminStatus == 0){
				alert(data.IAdminStatus);
				  //$("input:radio[value=0]").attr('checked',true);
				  $("input[type='radio'][name='isSystem'][value='0']").attr("checked",true);
				}
				
				else if(data.IAdminStatus == 1){
				alert(data.IAdminStatus);
				  //$("input:radio[value=1]").attr('checked',true);
				  $("input[type='radio'][name='isSystem'][value='1']").attr("checked",true);
				}
				
				*/
				/*
				else{
				  //根据Radio的name属性撤消选中状态
				  $('input[name=isSystem]:checked').attr('checked',false);
				}
				*/
				
                
				$("#dialogForm1").dialog('option', 'title', '编辑用户账号信息');
				$("#userForm").attr("action","updateSystemUserAccount.do");
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
	
	
	//恢复默认密码
    function recoverPass(uid){
		//通过json读取字典对象
		params = {"id":uid};

		$.ajax({
			type:"post",
			url:"recoverDefaultPassword.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data == 0){
				   alert("【提示信息】默认密码恢复成功！");
				}else{
				   alert("【提示信息】默认密码恢复失败！");
				}

			},
			error:function(){
				//alert("数据库连接错误，获取对象失败，请重试。");
				$("#dialogForm3Warning").html("<br/>数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
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
</s:else><s:if test="#r==null || #r==0">
    <button id="modalDialogButton2" class="green" primary="ui-icon-button-addperson">开通账号</button></s:if>
	<button class="normal" id="modalDialogButton5">全部</button>
	
    <!--
    <div class="buttonInput relative left" width="120" height="28">
	
	  <s:if test="vcode==null || vcode == ''">
       <input id="tsovcode" name="tsovcode"  type="text" maxlength="50" value="学号" title="学号"/>  
	  </s:if>
	  <s:else>
	     <input id="tsovcode" name="tsovcode"  type="text" maxlength="50" value="${vcode}"   title="学号"/>  
	  </s:else> 

    </div>-->
	
    <div class="buttonInput relative left" width="160" height="28">
	
	  <s:if test="vname==null || vname == ''">
       <input id="tsovname" name="tsovname"  type="text" maxlength="50" value="学号/姓名" title="学号/姓名"/>  
	  </s:if>
	  <s:else>
	     <input id="tsovname" name="tsovname"  type="text" maxlength="50" value="${vname}"   title="学号/姓名"/>  
	  </s:else> 
	  <button id="modalDialogButton6">查询</button>
    </div>
</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="40"></th>
				<th width="120"></th>
				<th width="80"></th>
				<th width="60"></th>
                <th width="160"></th>
				<th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">学号</th>
				<th class="thSortableGray">姓名</th>
				<th class="thSortableGray">性别</th>
				<th class="thSortableGray">身份证</th>
				<th class="thSortableGray">账号状态</th>
			  </tr>
			</thead>
			<tbody>
			<s:iterator value="page.data">
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
				<td class="searchRange" title="${VCode}">${VCode}</td>
				<td class="searchRange" title="${VName}">${VName}</td>
				<td>${VGender}</td>
				<td>${VCardid}</td>
                <td><s:if test="openStatus == 0">
					    <font color="#EB7979"><b>未开通</b></font>
					</s:if>
					<s:if test="openStatus == 1">
					    已开通
					</s:if>
				</td>
			  </tr>
			</s:iterator> 
            <s:iterator value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			  </tr>
              </s:iterator>
			</tbody>
		</table><s:include value="../common/pagination_system.jsp" />
	</div>

</div>

</div>

</div></div>


<div id="dialogForm1" title="新建用户账号">
	<p class="validateTips">请填写所有信息</p>
	<form>
	<fieldset>
		<label for="vname">用户账号</label>
		<input type="text" name="username" id="username" class="text ui-widget-content ui-corner-all" />
		<label for="vpass">密码</label>
		<input type="password" name="pass" id="pass" class="text ui-widget-content ui-corner-all" />
		<label for="vagainpass">确认密码</label>
		<input type="password" name="againPass" id="againPass" class="text ui-widget-content ui-corner-all" />
		<label for="vadminstatus">系统管理员：</label>
		<input type="radio" name="isSystem"  value="1" />是&nbsp;&nbsp;
		<input type="radio" name="isSystem"  value="0" checked="checked"/>否
	</fieldset>
	</form>
</div>



<div id="dialogForm2">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确定要开通选中的学员账号吗？</span>
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
			<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确定要停用选中的用户账号吗？</span>
		</div>
	</fieldset>	
</div>


<div id="dialogForm6">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确定要恢复选中的用户账号吗？</span>
		</div>
	</fieldset>	
</div>

<form id="userForm" method="post" action="createSystemUserAccount.do">
	<input type="hidden" name="tuser.VId" id="VId"/>
	<input type="hidden" name="tuser.VUsername" id="cuname" />
	<input type="hidden" name="tuser.VPassword" id="cpass" />
	<input type="hidden" name="tuser.IAdminStatus" id="cadmin" />
	<input type="hidden" name="key" value="${key}"/>
	<input type="hidden" name="pageIndex" value="${pageIndex}"/>
</form>

<form id="edituserForm" method="post" action="updateSystemUserAccount.do">
	<input type="hidden" name="tuser.VId" id="VId"/>
	<input type="hidden" name="tuser.VUsername" id="euname" />
	<input type="hidden" name="tuser.VPassword" id="epass" />
	<input type="hidden" name="tuser.IAdminStatus" id="eadmin" />
	<input type="hidden" name="key" value="${key}"/>
	<input type="hidden" name="pageIndex" value="${pageIndex}"/>
</form>

<form  action="searchStudentsInfoForOpenUserAccount.do" method="post" id="searchForm">
  <input name="vcode" type="hidden" id="searchVcode">
  <input name="vname" type="hidden" id="searchVanme">
  
</form>
<form  action="openStudentsUserAccount.do" method="post" id="deleteForm">
    <input name="userids" type="hidden" id="usersidsStr">
    <input type="hidden" name="vcode" value="${vcode}"/>
	<input type="hidden" name="vname" value="${vname}"/>
    <input type="hidden" name="pageIndex" value="${pageIndex}"/>
</form>

<form  action="stopUserAccountForAllStatus.do" method="post" id="stopForm">
    <input name="userids" type="hidden" id="stopusersidsStr">
    <input type="hidden" name="key" value="${key}"/>
    <input type="hidden" name="pageIndex" value="${pageIndex}"/>
</form>

<form  action="recoverUserAccountForAllStatus.do" method="post" id="recoverForm">
    <input name="userids" type="hidden" id="recoverusersidsStr">
    <input type="hidden" name="key" value="${key}"/>
    <input type="hidden" name="pageIndex" value="${pageIndex}"/>
</form>



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
</script>

</body>
</html>
