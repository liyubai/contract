<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>教员列表管理</title>

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

	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		new $.dropDownList(i,true,100);
	})
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
	
	$("#buildButton").click(function(){
		getselectBulidingList();
	});
	
	$("#assignTeacherButton").click(function(){
		var ids = "";
		var r1 = document.getElementsByName('contractIdList');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				ids = r1[i].value;
			}
		}
		if(ids ==""){
			$("#dialogForm3Warning").html("<br/>请选择教员。"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#teacherAsStudentid").val(ids);
		getselectBulidingList();
		$( "#teacherDialogForm" ).dialog( "open" );
	})
	
	
     //新建人员
	$("#modalDialogButton1").click(function(){
		var deptid = tree.getSelectedItemId();
		var deptname = tree.getSelectedItemText();
		if(deptid==null || deptid==""){
			$("#dialogForm3Warning").html("<br/>请选择教员所在部门。"); //dialogForm3Warning：用于提示警告信息
			$( "#dialogForm3" ).dialog( "open" );
		}else{
			//if(deptname.indexOf("大队")>0){
			$("#deptId").val(deptid);
			$("#deptName").val(deptname);
			$( "#dialogFormNewPeople" ).submit();
		//	}//else{
			//	$("#dialogForm3Warning").html("<br/>只能在某大队下添加教员！"); //dialogForm3Warning：用于提示警告信息
			//	$( "#dialogForm3" ).dialog( "open" );
			//}
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
	
	$( "#teacherDialogForm" ).dialog({
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var id  = "";
				var r1 = document.getElementsByName('teacherName');
				for(i=0; i<r1.length; i++){
					if(r1[i].checked == true){
						id = r1[i].value;
					}
				}
				if(id==""){
					alert("请选择教员的教员。");
					return;	
				}

				params = {"studentid":$("#teacherAsStudentid").val(),"teacherid":id};
				$.ajax({
					type:"post",
					url:"saveTeacherAssignTeacher.do",
					data:params,
					dataType:"json",
					success:function(data){
						
						if(!data.flag){
							alert(data.message);
							return;
						}
						gotoPage(1);
						alert(data.message);
						$( "#teacherDialogForm" ).dialog( "close" );
					},
					error:function(){
						$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
						$( "#dialogForm3" ).dialog( "open" );
						return;
					}
				});	
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("#teacherAssignOutlineButton").click(function(){
		var ids = "";
		var r1 = document.getElementsByName('contractIdList');
		for(i=0; i<r1.length; i++){
			if(r1[i].checked == true){
				ids = r1[i].value;
			}
		}
		if(ids ==""){
			$("#dialogForm3Warning").html("<br/>请选择教员。"); 
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#teacherAsStudentid").val(ids);
		getselectOutlineList();
		$( "#outlineDialogForm" ).dialog( "open" );
	})
	$("#buildButton2").click(function(){
		getselectOutlineList();
	});
	$( "#outlineDialogForm" ).dialog({
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var id  = "";
				var r1 = document.getElementsByName('outlineName');
				for(i=0; i<r1.length; i++){
					if(r1[i].checked == true){
						id = r1[i].value;
					}
				}
				if(id==""){
					alert("请选择大纲。");
					return;	
				}

				params = {"studentid":$("#teacherAsStudentid").val(),"outlineid":id};
				$.ajax({
					type:"post",
					url:"saveTeacherAssignOutline.do",
					data:params,
					dataType:"json",
					success:function(data){
						
						if(!data.flag){
							alert(data.message);
							return;
						}
						gotoPage(1);
						alert(data.message);
						$( "#outlineDialogForm" ).dialog( "close" );
					},
					error:function(){
						$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
						$( "#dialogForm3" ).dialog( "open" );
						return;
					}
				});	
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
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
function getselectOutlineList(){
	var str = "";
	var content = "";
	if($("#outlineKey").val()!="大纲名称"){
		str= $("#outlineKey").val();
	}else{
		str = "";
	}
	var p = 0;
	params = {"key":str,"studentid":$("#teacherAsStudentid").val()};
	$.ajax({
	async:false,//同步请求
	type:"post",
	url:"showCanSelectTeacherOutlineList.do",
	data:params,
	dataType:"json",
	success:function(data){
			content = "";
			for(i=0;i<data.length;i++){
				content+="<tr>";
				content+="<td height=\"24\"><input type=\"radio\" name=\"outlineName\" value=\""+data[i].VId+"\">"+data[i].VName+"</td>"
				content+="</tr>";
			}		
			$("#viewOutlineid").html(content);
			$("#outlineKey").val("大纲名称");
		},
		error:function(){
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}
function getselectBulidingList(){
	//通过json读取字典对象
	var str = "";
	var content = "";
	if($("#searchbuild").val()!="教员姓名"){
		str= $("#searchbuild").val();
	}else{
		str = "";
	}
	var p = 0;
	params = {"key":str,"studentid":$("#teacherAsStudentid").val()};
	$.ajax({
	async:false,//同步请求
	type:"post",
	url:"showSelectTeacherList.do",
	data:params,
	dataType:"json",
	success:function(data){
			$("#conlistid").html("");
			for(i=0;i<data.length;i++){
				if(data[i].VId==$("#teacherAsStudentid").val()){
					continue;	
				}
				if(p==0){
					content+="<tr>";
				}
				/*
				if(data[i].IExam>0){
					content+="<td height=\"24\" width=\"25%\"><input type=\"radio\" name=\"teacherName\" checked value=\""+
					data[i].VId+"\">"+data[i].VName+"<font color=\"#FF0000\">(分)</font></td>"
				}else{
					content+="<td height=\"24\" width=\"25%\"><input type=\"radio\" name=\"teacherName\" value=\""+
					data[i].VId+"\">"+data[i].VName+"</td>"
				}
				*/
				content+="<td height=\"24\" width=\"25%\"><input type=\"radio\" name=\"teacherName\" value=\""+
					data[i].VId+"\">"+data[i].VName+"</td>"
				p++;
				if(p>=4){
					p=0;
					content+="</tr>";
				}
				
				
			}
			if(p<4 && p>=1){
				for(j=0;j<2;j++){
					content+="<td></td>";	
				}
				content+="</tr>";
			}

			$("#conlistid").html(content);
			$("#searchbuild").val("教员姓名");
		},
		error:function(){
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}
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
			url:"showMessageTeacherAjaxAction.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data==null){
					$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				$("#contentid").html(getContent(data));
				$("#dialogContent").dialog('option', 'title',  "所选教员："+data.VName);
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
		var cdate = "";
		var ksy = "";
		var rxsj = "";
		var yysj = "";
		var cjgzsj = "";
		if(data.DCsrq != null && data.DCsrq != "" && data.DCsrq != "null"){
			cdate = (new Date(data.DCsrq)).dateformat("yyyy-MM-dd");
		}
		if(data.DRxrq != null && data.DRxrq != "" && data.DRxrq != "null"){
			rxsj = (new Date(data.DRxrq)).dateformat("yyyy-MM-dd");
		}
		if(data.DCjgzsj != null && data.DCjgzsj != "" && data.DCjgzsj != "null"){
			cjgzsj = (new Date(data.DCjgzsj)).dateformat("yyyy-MM-dd");
		}
		if(data.DMhyytgsj != null && data.DMhyytgsj != "" && data.DMhyytgsj != "null"){
			yysj = (new Date(data.DMhyytgsj)).dateformat("yyyy-MM-dd");
		}
		if(data.IExam == 1){
			ksy = "是";
		}else{
			ksy = "否";
		}
		content+="<tr>";
		content+="<td width='80'>教员姓名：</td>";
		content+="<td width='80' height=\"24\">"+data.VName+"</td>";
		content+="<td width='80'>性别：</td>";
		content+="<td  width='80' height=\"24\">"+data.VXb+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='80'>出生日期：</td>";
		content+="<td  width='80' height=\"24\">"+cdate+"</td>";
		content+="<td width='80'>民族：</td>";
		content+="<td width='80' height=\"24\">"+data.TDictionByVMz+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='80'>联系方式：</td>";
		content+="<td  width='80' height=\"24\">"+data.VLxfs+"</td>";
		content+="<td width='80'>身份证号：</td>";
		content+="<td  width='80' height=\"24\">"+data.VSfz+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='80'>政治面貌：</td>";
		content+="<td width='80' height=\"24\">"+data.VZzmm+"</td>";
		content+="<td width='80'>籍贯：</td>";
		content+="<td  width='80' height=\"24\">"+data.VJg+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='80'>家庭住址：</td>";
		content+="<td  width='80' height=\"24\">"+data.VJtzz+"</td>";
		content+="<td width='80'>文化程度：</td>";
		content+="<td width='80' height=\"24\">"+data.TDictionByVWhcd+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='80'>毕业院校：</td>";
		content+="<td  width='80' height=\"24\">"+data.VByyx+"</td>";
		content+="<td width='80'>职位：</td>";
		content+="<td  width='80' height=\"24\">"+data.VZw+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='80'>飞行教员类型：</td>";
		content+="<td width='80' height=\"24\">"+data.TDictionByVFlytype+"</td>";
		content+="<td width='80'>地面教员类型：</td>";
		content+="<td  width='80' height=\"24\">"+data.TDictionByVGeneraltype+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='80'>是否考试员：</td>";
		content+="<td  width='80' height=\"24\">"+ksy+"</td>";
		content+="<td width='80'>所飞机型：</td>";
		content+="<td width='80' height=\"24\">"+data.TDictionByVFlyform+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='80'>所聘技术等级：</td>";
		content+="<td  width='80' height=\"24\">"+data.TDictionByVTecdengji+"</td>";
		content+="<td width='80'>安全等级：</td>";
		content+="<td  width='80' height=\"24\">"+data.VSafedengji+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='80'>参加工作时间：</td>";
		content+="<td width='80' height=\"24\">"+cjgzsj+"</td>";
		content+="<td width='80'>所在单位：</td>";
		content+="<td  width='80' height=\"24\">"+data.VSzdw+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='80'>所在单位职务：</td>";
		content+="<td  width='80' height=\"24\">"+data.VSzdwzw+"</td>";
		content+="<td width='100'>入校日期：</td>";
		content+="<td width='80' height=\"24\">"+rxsj+"</td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
		content+="</tr>"
		
		content+="<tr>";
		content+="<td width='40'>英语水平：</td>";
		content+="<td  width='180' height=\"24\">"+data.VYysp+"</td>";
		content+="<td width='60'>民航英语通过时间：</td>";
		content+="<td  width='140' height=\"24\">"+yysj+"</td>";
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
<button id="modalDialogButton1" class="green" primary="ui-icon-button-addperson">添加教员</button>
<button id="assignTeacherButton" class="green" primary="ui-icon-button-addnew">分配教员</button>
<button id="teacherAssignOutlineButton" class="green" primary="ui-icon-button-addnew">分配大纲</button>
<button class="normal barLeft" id="modalDialogButton5">修改</button>
<button class="normal barMiddle" id="modalDialogButton2">删除</button>
</s:if>
<button class="normal <s:if test="#r==null || #r==0">barRight</s:if>" id="modalDialogButton3">全部</button>
		
    <div class="buttonInput relative left" width="180" height="28">
     <input id="peopleName" name="peopleName"  type="text" maxlength="50" title="教员姓名" value="教员姓名" /><button id="modalDialogButton4" >查询</button>
    </div>

</div>


<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="10"></th>
				<th width="60"></th>
				<th width="60"></th>
				<th width="40"></th>
				<th width="130"></th>
                <th width="100"></th>
                <th width="60"></th>
                <th></th>
			  </tr>
			  <tr>
				<th class="thSortableGray"></th>
				<th class="thSortableGray">&nbsp;&nbsp;姓名</th>
				<th class="thSortableGray">编号</th>
				<th class="thSortableGray">性别</th>
				<th class="thSortableGray">大队</th>
				<th class="thSortableGray">基地</th>
				<th class="thSortableGray">分配教员</th>
                <th class="thSortableGray">分配大纲</th>
			  </tr>
			</thead>
			<tbody id="searchPage">
			</tbody>
		</table>


</div>
</div>
</div>
</div>


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

<div id="dialogContent"  title="查看教员基础信息">
<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
<tbody id="contentid">
</tbody>
</table>
</div>

<div id="teacherDialogForm"  title="教员列表">
<input type="text" name="focusn" style="width:0px; height:0px; border:0px;"/>
<div class="buttonInput relative left" width="200" height="28">
<input id="searchbuild" name="searchbuild"  type="text" maxlength="50" value="教员姓名" title="教员姓名"/><button id="buildButton">查询</button>
</div>
<span class="panelLine"></span>
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tbody id="conlistid">
</tbody>
</table>
</div>

<div id="outlineDialogForm"  title="大纲列表">
<input type="text" name="focusn" style="width:0px; height:0px; border:0px;"/>
<div class="buttonInput relative left" width="200" height="28">
<input id="outlineKey" name="outlineKey"  type="text" maxlength="50" value="大纲名称" title="大纲名称"/><button id="buildButton2">查询</button>
</div>
<span class="panelLine"></span>
<table width="100%" border="0" cellpadding="0" cellspacing="3">
<tbody id="viewOutlineid">
</tbody>
</table>
</div>

<!-- 教员管理 -->
<form id="dialogFormNewPeople" action="toAddOrUpTeacherAction.do"  method="post">
	<input type="hidden" id="peopleId" name="id"/>
	<input type="hidden" id="deptId" name="deptId"/>
	<input type="hidden" id="showPeople" name="showPeople"/>
	<input type="hidden" id="deptName" name="deptName"/>
	<input type="hidden" name="key" value="${key}"/>
</form>

<form  action="searchListTeacherAction.do" method="post" id="searchForm">
  <input name="key" type="hidden" id="searchKey">
</form>

<form  action="deleteTeacherAction.do" method="post" id="deleteForm">
    <input name="peopleids" type="hidden" id="peopleids">
    <input name="deptId" type="hidden" id="delPDeptId">
    <input type="hidden" name="key" value="${key}"/>
</form>

<form  action="saveAssignTeacher.do" method="post" id="assignForm">
<input name="studentid" type="hidden" id="teacherAsStudentid">
<input name="teacherid" type="hidden" id="teacherid">
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


//初始化树
tree=new dhtmlXTreeObject("treeboxbox_tree","300px","100%",0);
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
function tonclick(pageIndex) {
	pageIndex=pageIndex<1?1:pageIndex;
	var treeids = tree.getAllSubItems(tree.getSelectedItemId())+","+tree.getSelectedItemId();
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
		url:"searchListTeacherAjaxAction.do",
		data:params,
		dataType:"json",
		success:function(data){
			var ht = "";
			var selects = "";
			var selstr = "";
			if(data.data.length>0){
				for(var i=0;i<data.data.length;i++){
					
					ht+="<tr><td><input name=\"contractIdList\" type=\"radio\" value=\""+data.data[i].VId+"\"><b></b></td>"+
						"<td><a href='javascript:void(0)' onclick=\"showPeopleMsg('"+data.data[i].VId+"');\" class=\"blue\">"+data.data[i].VName+"</a></td>"+
						"<td>"+data.data[i].VCode+"</td>"+
						"<td>"+data.data[i].VXb+"</td>"+
						"<td>"+data.data[i].deptName+"</td>"+
						"<td>"+data.data[i].baseName+"</td>"+
						"<td>"+data.data[i].VSzdw+"</td>"+
						"<td>"+data.data[i].VLxfs+"</td></tr>";
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
			ht+="<tr><td colspan=\"8\" align=\"right\"><a href=\"javascript:firstPage("+pageIndex+");\" class=\"blue\">首页</a>&nbsp;<a href=\"javascript:prePage("+pageIndex+");\" class=\"blue\">上一页</a>&nbsp;<a href=\"javascript:nextPage("+pageIndex+","+pageCount+");\" class=\"blue\">下一页</a>&nbsp;<a href=\"javascript:lastPage("+pageIndex+","+pageCount+");\" class=\"blue\">尾页</a>&nbsp;<select id =\"seliid\" onchange=\"jumpPage()\">"+selects+"</select>本页显示"+start+"-"+end+"条/共"+totalPageCount+"页"+totalCount+"条&nbsp;&nbsp;</td></tr>";
				
			$("#searchPage").html(ht);
			execbase();//显示checkbox与radio样式。
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