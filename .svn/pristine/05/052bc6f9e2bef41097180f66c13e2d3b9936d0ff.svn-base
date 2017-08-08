<%@ page language="java"  import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>训练课目管理</title>
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

fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
</style>
<script>

$(function() {
	$("div.dropDownList").each(function(i){
		new $.dropDownList(i,true,140);
	})

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
		
	$("#modalDialogButton1").click(function(){// 设置科目
		k=getSelValue('radioName');//获取课目id
		if(k==""){
			$("#dialogForm3Warning").html("请选择课目。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#getsubjectlessonid").val(k);
		$("#lessonid").val(k);
		$( "#dialogSubject" ).dialog( "open" );
		
	});
	$("#viewDialogButton").click(function(){// 查看设置科目
		k=getSelValue('radioName');//获取课目id
		if(k==""){
			$("#dialogForm3Warning").html("请选择课目。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#updatelessonid").val(k);
		$("#lessonid").val(k);
		$("#optid").val(2);
		execFuZhi(2);
		$( "#editDialogSubject" ).dialog( "open" );
		
	});
	$("#modalDialogButton2").click(function(){// 编辑设置科目
		k=getSelValue('radioName');//获取课目id
		if(k==""){
			$("#dialogForm3Warning").html("请选择课目。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#updatelessonid").val(k);
		$("#lessonid").val(k);
		execFuZhi(1);
		$("#optid").val(1);
		$( "#editDialogSubject" ).dialog( "open" );
		
	});

	function execFuZhi(type){
		//窗体赋值
		params = {"id":$("#lessonid").val()};
		$.ajax({
			async:false,//同步请求
			type:"post",
			url:"showSetTrainsubjectListById.do",
			data:params,
			dataType:"json",
			success:function(data){
				var ids = "";
				var content="";
				var score = "";
				for(i=0;i<data.length;i++){
			
					if(data[i].ISort==0){
						content+="<tr><td colspan=\"2\"><img src=\"themes/cupertino/images/plane.gif\" align=\"absmiddle\" />&nbsp;&nbsp;"+data[i].VName+"</td></tr>";
					}else{
						content+="<tr><td width=\"70%\" style=\"padding-left:25px;\">"+data[i].VName+"</td>";
						if(data[i].DScore==100){
							score = "";
						}else{
							score = data[i].DScore;
						}
						if(type==1){
							
							content+="<td width=\"30%\"><input id=\""+data[i].VId+"\" type=\"text\" value=\""+score+
						"\"  style=\"width:50px;\" class=\"text ui-widget-content ui-corner-all\" />&nbsp;<a href=\"javascript:void(0)\" onclick=\"deleteInfo('"+data[i].VId+"')\"><img src=\"themes/cupertino/images/subfu.png\" title=\"删除\" class=\"imgs\" border=\"0\" align=\"absmiddle\"/></a></td></tr>";
						}else{
							content+="<td width=\"30%\">"+score+"</td></tr>";
						}
						content+="<tr><td colspan=\"2\" height=1 bgcolor=\"#EEEEEE\"></td></tr>";
						ids+=data[i].VId + ",";
					}
				}
				$("#subjects2").val(ids);
				if(content==""){
					$("#subjectListId").html("<li><br/><br/>　　　目前该课目没有科目。</li>");
					
				}else{
					$("#subjectListId").html(content);
				}
			
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		
	}

	$("A.blue").click(function(){//查看课目其它内容
		if(this.id==""){
			return;	
		}
		params = {"id":this.id};
		$.ajax({
			type:"post",
			url:"showTraininglessonContentById.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data==null){
					$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				var content="";
				content+="<tr>";
				content+="<td height=\"24\" width=\"15%\">课目编号：</td><td width=\"35%\">"+data.VNo+"</td>";
				content+="<td width=\"15%\">课目性质：</td><td d width=\"35%\">"+data.IKcxz+"</td>";
				content+="</tr>";
				content+="<tr>";
				content+="<td  height=\"24\" >版 本 &nbsp;号：</td><td>"+data.VVersion+"</td>";
				content+="<td>昼夜性质：</td><td>"+data.IDaynightproperty+"</td>";
				content+="</tr>";
				content+="<tr>";
				content+="<td  height=\"24\" >飞机性质：</td><td>"+data.IPlaneproperty+"</td>";
				content+="<td>飞行性质：</td><td>"+data.IFxxz+"</td>";
				content+="</tr>"
				content+="<tr>";
				content+="<td  height=\"24\">本转性质：</td><td>"+data.ITrainType+"</td>";
				content+="<td>训练时间：</td><td>"+data.VShebei+"</td>";
				content+="</tr>"
				content+="<tr>";
				content+="<td  height=\"24\">设备类型：</td><td>"+data.IType+"</td>";
				content+="<td>是否特技：</td><td>"+data.ITj+"</td>";
				content+="</tr>"
				/*
				if(data.ITrainType=="转场"){
					content+="<tr>";
					content+="<td  height=\"24\">转场起点：</td><td>"+data.startName+"</td>";
					content+="<td>转场终点：</td><td>"+data.endName+"</td>";
					content+="</tr>"
				}
				content+="<tr>";
				content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				*/
				content+="<tr>";
				content+="<td>训练目的：</td>";
				content+="<td  height=\"24\" colspan=\"3\">"+data.VTrainpurpose.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				/*
				content+="<tr>";
				content+="<td>内容及标准：</td>";
				content+="<td  height=\"24\" colspan=\"3\">"+data.VNeirong.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				*/
				content+="<tr>";
				content+="<td>进入条件：</td>";
				content+="<td  height=\"24\" colspan=\"3\" >"+data.VTiaojian.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				/*
				content+="<tr>";
				content+="<td>训练设备：</td>";
				content+="<td  height=\"24\" colspan=\"3\" >"+data.VShebei.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				*/
				content+="<tr>";
				content+="<td>非常规项目：</td>";
				content+="<td  height=\"24\" colspan=\"3\" >"+data.VXiangmu.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td>特殊要求：</td>";
				content+="<td  height=\"24\" colspan=\"3\" >"+data.VTsyq.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td>备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>";
				content+="<td  height=\"24\" colspan=\"3\" >"+data.VBz.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				$("#contentid").html(content);
				$("#dialogContent").dialog('option', 'title',  "所选课目《"+data.VName+"》");
				$( "#dialogContent" ).dialog( "open" );
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
	});
	
	$("li.sortName").click(function(){
		var subjects = $("#subjects").val();     //点每个分类需要重新请求数据库。
		//var lessonid = $("#lessonid").val();  //使用之表明点每次课的时候，都要重新请求数据库。
		var id = this.id;
		if(subjects.indexOf(id)>=0){//控制重复查询数据库
			return;	
		}
		$("#getsubjecttype").val(id);
		
		params=$("#getsubjectForm").serialize();

		$.ajax({
			type:"post",
			url:"showVTrainsubjectListById.do",
			data:params,
			dataType:"json",
			success:function(data){
				var content="";
				var name = "";
				for(i=0;i<data.length;i++){
					name = data[i].VName;
					if(name.length>15){
						name = name.substring(0,15) + "...";
					}
					if(id=="fbd340614724e262014724f0f134000a"){//机组资源管理（CRM）
						content+="<li><div style=\"float:left; padding-top:7px;\">&nbsp;&nbsp;<input name=\"sortId\"  checked=\"checked\" type=\"checkbox\" value=\""+data[i].VId+",0\"/><b></b>&nbsp;&nbsp;</div><div style=\"float:left;width:240px; padding-top:7px;\" title=\""+data[i].VName+"\">"+name;
					content+="</div>&nbsp;&nbsp;<input id=\"v"+ data[i].VId +"\" type=\"text\"  class=\"text ui-widget-content ui-corner-all\" style=\"width:50px;\" /></li>";
					}else{
						content+="<li><div style=\"float:left; padding-top:7px;\">&nbsp;&nbsp;<input name=\"sortId\" type=\"checkbox\" value=\""+data[i].VId
						+",1\"/><b></b>&nbsp;&nbsp;</div><div style=\"float:left;width:240px; padding-top:7px;\" title=\""+data[i].VName+"\">"+name;
						content+="</div>&nbsp;&nbsp;<input id=\"v"+ data[i].VId 
						+"\" type=\"text\" value=\"4\" class=\"text ui-widget-content ui-corner-all\" onFocus=\"selected('"+data[i].VId+",1')\"   onclick=\"selected('"+data[i].VId+",1')\" style=\"width:50px;\" /></li>";
					}
				}
				if(content==""){
					content = "<li>该分类下没有科目。</li>";
				}
				$("#c" + id).html(content);
				
				//execbase();//显示checkbox与radio样式。
				
				$("#subjects").val(subjects + id);//控制重复查询数据库
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});
		
	});
	$( "#dialogContent" ).dialog({//显示内容窗口
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});

	$("#modalDialogButton4").click(function(){//查询
		if($("#searchUser").val()=="课目名称"){
			$("#searchUser").val("");
		}else{
			$("#searchKey").val($("#searchUser").val());
		}
		$( "#searchForm" ).submit();
	});
	function checkRegexp( o) {
		var re = /^\d+(\.\d+)?$/; //判断浮点数
		if ( re.test( o ) ) {
			return true;
		} else {
			return false;
		}
	}
	$( "#dialogSubject" ).dialog({
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var ids = "";
				var r1=document.getElementsByName('sortId');
				for(i=0;i<r1.length;i++){
					if(r1[i].checked==true){
						if(r1[i].value.split(",")[1]==0){
							ids+=r1[i].value.split(",")[0] + ",100;";
						}else{
							if(!checkRegexp($("#v"+r1[i].value.split(",")[0]).val())){
								alert("评分标准应为数字。");
								$("#v"+r1[i].value.split(",")[0]).focus();
								return false;
							}
							ids+=r1[i].value.split(",")[0] + ","+ $("#v"+r1[i].value.split(",")[0]).val() + ";";
						}
						
					}
				}
				//alert(ids);
				//return;
				if(ids==""){
					$("#dialogForm3Warning").html("请选择科目。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				$("#subjectIds").val(ids);
				$("#saveForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
	$( "#editDialogSubject" ).dialog({
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				if($("#optid").val()==2){
					$( "#editDialogSubject" ).dialog("close");
					return;
				}
				var ids = $("#subjects2").val().split(",");
				var idv="";
				for(i=0;i<ids.length-1;i++){
					if($("#" + ids[i]).val()==""){
						idv+=ids[i] + ",100;";
					}else{
						if(!checkRegexp($("#" + ids[i]).val())){
							alert("评分标准应为数字。");
							$("#" + ids[i]).focus();
							return false;
						}
						idv+=ids[i] + "," +$("#" + ids[i]).val() + ";";
					}
				}
				$("#updatesubjectIds").val(idv);
				//执行保存
				params = $("#updateForm").serialize();
				$.ajax({
					type:"post",
					url:"updateSetTrainingLessonSubject.do",
					data:params,
					dataType:"json",
					success:function(data){
						alert(data.message);
						//更新页面
						//execFuZhi();无须执行
						
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
		}
	});

	$( "#dialogForm4" ).dialog({
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var id = $("#deleteid").val();
				params = {"id":id};
				$.ajax({
					type:"post",
					url:"deleteSetTrainingLessonSubject.do",
					data:params,
					dataType:"json",
					success:function(data){
						if(data.flag==false){
							alert(data.message);
							return;
						}
						$( "#dialogForm4" ).dialog( "close" );
						//更新页面
						execFuZhi(1);
						
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
	getDefault();
});
function deleteInfo(id){
	if(id!=""){
		$("#deleteid").val(id);
		$( "#dialogForm4" ).dialog( "open" );
	}
}
function selected(id){
	var r1=document.getElementsByName('sortId');
	for(i=0;i<r1.length;i++){
		if(r1[i].value==id){
			r1[i].checked=false;
			r1[i].click();
			return;
		}
	}
}
function getDefault(){
	var subjects = $("#subjects2").val(); 
	var id ="fbd340614724e262014724f0f134000a";
	if(subjects.indexOf(id)>=0){//控制重复查询数据库
		return;	
	}
	$("#getsubjecttype").val(id);
	
	params=$("#getsubjectForm").serialize();

	$.ajax({
		type:"post",
		url:"showVTrainsubjectListById.do",
		data:params,
		dataType:"json",
		success:function(data){
			var content="";
			var name = "";
			for(i=0;i<data.length;i++){
				name = data[i].VName;
				if(name.length>15){
					name = name.substring(0,15) + "...";
				}
				if(id=="fbd340614724e262014724f0f134000a"){//机组资源管理（CRM）
					content+="<li><div style=\"float:left; padding-top:7px;\">&nbsp;&nbsp;<input name=\"sortId\"  checked=\"checked\" type=\"checkbox\" value=\""+data[i].VId+",0\"/><b></b>&nbsp;&nbsp;</div><div style=\"float:left;width:240px; padding-top:7px;\" title=\""+data[i].VName+"\">"+name;
				content+="</div>&nbsp;&nbsp;<input id=\"v"+ data[i].VId +"\" type=\"text\"  class=\"text ui-widget-content ui-corner-all\" style=\"width:50px;\" /></li>";
				}else{
					content+="<li><div style=\"float:left; padding-top:7px;\">&nbsp;&nbsp;<input name=\"sortId\" type=\"checkbox\" value=\""+data[i].VId
					+",1\"/><b></b>&nbsp;&nbsp;</div><div style=\"float:left;width:240px; padding-top:7px;\" title=\""+data[i].VName+"\">"+name;
					content+="</div>&nbsp;&nbsp;<input id=\"v"+ data[i].VId 
					+"\" type=\"text\" value=\"4\" class=\"text ui-widget-content ui-corner-all\" onclick=\"selected('"+data[i].VId+",1')\" style=\"width:50px;\" /></li>";
				}
			}
			if(content==""){
				content = "<li>该分类下没有科目。</li>";
			}
			$("#c" + id).html(content);
			
			//execbase();//显示checkbox与radio样式。
			
			$("#subjects2").val(subjects + id);//控制重复查询数据库
		},
		error:function(){
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
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
    <s:param name="parentid">4028816a4714304c0147149eb4aa0005</s:param>
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
</s:else>
<s:if test="#r==null || #r==0">
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">添加科目</button>
    <button id="viewDialogButton" class="green">查看已设置科目</button>
    <button id="modalDialogButton2" class="normal barLeft">编辑已设置科目</button>
</s:if>
    <div class="dropDownList <s:if test="#r==null || #r==0">barRight</s:if>"><button></button><span class="bar"></span>
    <ul>
    <s:iterator value="lessonSortList" status="statu">
    <li><a href="open_setTrainingLessonSubjectList.do?unitid=${VId}" val="${VId}"><s:if test='#statu.index==0'><span class="ui-icon ui-icon-bullet"></span></s:if>${VName}</a>
    </li> 
    </s:iterator>
    </ul><s:set name="selunitId" value="unitid"/>
    <s:if test="unitid==null || unitid==''">
    	<s:iterator value="lessonSortList"  begin="0" end="0">
    		<s:set name="selunitId" value="VId"></s:set>
        </s:iterator>
    </s:if>
    <input type="hidden" id="searchunitid" value='<s:property value="#selunitId"/>'/>
    </div>
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" name="searchUser"  type="text" maxlength="50" title="课目名称" value="课目名称"/><button id="modalDialogButton4">查询</button>
    </div>
</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3">
        	<thead>
			  <tr>
				<th width="30" rowspan="2">选项</th>
				<th width="80" rowspan="2">课目编号</th>
                <th width="40" rowspan="2">版本号</th>
				<th width="190" rowspan="2">课目名称</th>
				<th colspan="4">总训练时间</th>
                <s:iterator value="orgList">
				<th colspan="${IStatus}">${message}</th>
				</s:iterator>
                <th rowspan="2"><div align="left">其它内容</div></th>
			  </tr>
			  <tr>
			    <th width="50">飞行训练</th>
			    <th width="50">训练器</th>
			    <th width="40">飞机</th>
                <th width="50">模拟机</th>
                <s:iterator value="viewTimesubjectList">
			    <th width="40">${VName}</th>
                </s:iterator>
		      </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
			  <tr>
				<td><input name="radioName" type="radio" value="${trainingLseeson.VId}"><b></b></td>
				<td>&nbsp;&nbsp;${trainingLseeson.VNo}</td>
                <td>&nbsp;&nbsp;${trainingLseeson.VVersion}</td>
				<td>${trainingLseeson.VName}</td>
				<td align="right">${DXlsj}</td>
                <td align="right">${DXlqsj}</td>
				<td align="right">${DFjsj}</td>	
                <td></td>
                <s:iterator value="viewTimesubjectList">
				<td align="right"><s:iterator value="relationzList">
                <s:if test='VId==subjectid'>
                ${DTime}
                </s:if>
                </s:iterator></td>
                
                </s:iterator>
				<td><div align="left"><A href="javascript:void(0)" id="${trainingLseeson.VId}" class="blue">查看</A></div></td>
			  </tr>
              </s:iterator>
             <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
              <s:iterator  begin="0" end="viewTimesubjectList.size()+8">
				<td>&nbsp;</td>
               </s:iterator>
			  </tr>
              </s:iterator>
			</tbody>
		</table><s:include value="../common/pagination_system.jsp" />
</div>
</div>
</div>
</div>

<div id="dialogSubject"  title="科目列表">
    <s:iterator value="subjectsortList" >
	<ul class="foldList">
		<li class="sortName" id="${VId}"><span class="ui-icon ui-icon-carat-1-e"></span>${VName}</li>
		<ul class="itemList hide" id="c${VId}">
		</ul>
	</ul>
	<span class="panelLine"></span>
	</s:iterator>
</div>

<div id="dialogForm3">
	<fieldset>
		<div class="panelLeft" style="width: 55px;"><img src="themes/cupertino/images/warning.png" /></div>
		<div class="panelRight" style="margin-left: 75px;">
			<span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span>
		</div>
	</fieldset>	
</div>

<div id="dialogContent"  title="所选课目内容详单">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
    <tbody id="contentid">
    </tbody>
    </table>
</div>

<div id="editDialogSubject"  title="科目列表">
    <table width="100%" border="0" cellpadding="0" cellspacing="4">
    <tbody id="subjectListId">
    </tbody>
    </table>
</div>

<div id="dialogForm4">
	<fieldset>
		<table width="100%" border="0" align="center" cellpadding="0">
  <tr>
    <td align="right" height="90" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
    <td align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">确定要删除选中的信息吗？<br/>信息删除后不可恢复。</span></td>
  </tr>
</table>
	</fieldset>	
</div>
<form  action="open_setTrainingLessonSubjectList.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
<input name="unitid" type="hidden" id="cunitid" value='<s:property value="#selunitId"/>'>
</form>
<form  action="saveSetTrainingLessonSubject.do" method="post" id="saveForm">
<input name="viewTrainsubject.VId" type="hidden" id="lessonid">
<input name="viewTrainsubject.typeid" type="hidden" id="subjectIds">
<input name="unitid" type="hidden" id="cunitid" value='<s:property value="#selunitId"/>'>
</form>
<form   method="post" id="updateForm">
<input name="viewTrainsubject.VId" type="hidden" id="updatelessonid">
<input name="viewTrainsubject.typeid" type="hidden" id="updatesubjectIds">
</form>

<form   method="post" id="getsubjectForm">
<input name="viewTrainsubject.VId" type="hidden" id="getsubjectlessonid">
<input name="viewTrainsubject.typeid" type="hidden" id="getsubjecttype">
</form>
<input type="hidden" id="optid">
<input type="hidden" id="deleteid">
<input type="hidden"  id="subjects" />
<input type="hidden"  id="subjects2" />
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm3Warning").html(operateResult);
		$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>