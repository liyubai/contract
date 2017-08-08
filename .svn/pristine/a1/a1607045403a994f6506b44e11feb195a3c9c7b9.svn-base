<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
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

	$("#modalDialogButton1").click(function(){// 添加
		window.location.href="open_createTrainingLessonPage.do?unitid=" + $("#cunitid").val();
	});
	$("#copyButton1").click(function(){// 复制课目
		var k = getSelValue('radioName');
		if(k==""){
			$("#dialogForm3Warning").html("请选择要复制的课目。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		window.location.href="copyTrainingLesson.do?unitid=" + $("#cunitid").val()+"&id="+k + "&pageIndex="+pageIndex;
	});
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

	$("#modalDialogButton2").click(function(){//编辑
		var k = getSelValue('radioName');
		if(k==""){
			$("#dialogForm3Warning").html("请选择要编辑的课目。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		params = {"id":k};
		$.ajax({
			type:"post",
			url:"showOutlineListByLessonId.do",
			data:params,
			dataType:"json",
			success:function(data){
				if(data==null || data.length==0){
					var unitid = $("#cunitid").val();
					window.location.href="open_updateTrainingLessonPage.do?id=" + k + "&unitid="+unitid;
					return;
				}
				var content="";
				for(i=0;i<data.length;i++){
					content+="<li>&nbsp;&nbsp;" + (i+1) + " . " + data[i].VName+"<span class=\"panelLine\"></span></li>";
				}
				$("#outlineid").html(content);
				$("#unitSubjectDicIdListId").val(k);
				$( "#dialogForm4" ).dialog( "open" );
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
		
	});
	$("A.blue").click(function(){//查看课目其它内容
		if(this.id==""){
			return;	
		}
		var content="";
		params = {"id":this.id};
		$.ajax({
			async:false,
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
				content+="<tr>";
				content+="<td width=\"15%\" align=\"right\">课目编号：</td><td width=\"35%\">"+data.VNo+"</td>";
				content+="<td width=\"15%\" align=\"right\">课目性质：</td><td d width=\"35%\">"+data.IKcxz+"</td>";
				content+="</tr>";
				content+="<tr>";
				content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td align=\"right\">版 本 &nbsp;号：</td><td>"+data.VVersion+"</td>";
				content+="<td align=\"right\">昼夜性质：</td><td>"+data.IDaynightproperty+"</td>";
				content+="</tr>";
				content+="<tr>";
				content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td align=\"right\">飞机性质：</td><td>"+data.IPlaneproperty+"</td>";
				content+="<td align=\"right\">飞行性质：</td><td>"+data.IFxxz+"</td>";
				content+="</tr>"
				content+="<tr>";
				content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td align=\"right\">本转性质：</td><td>"+data.ITrainType+"</td>";
				content+="<td align=\"right\">训练时间：</td><td>"+data.VShebei+"</td>";
				content+="</tr>"
				content+="<tr>";
				content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				content+="<tr>";
				content+="<td align=\"right\">设备类型：</td><td>"+data.IType+"</td>";
				content+="<td align=\"right\">是否特技：</td><td>"+data.ITj+"</td>";
				content+="</tr>"
				content+="<tr>";
				content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"

				content+="<tr>";
				content+="<td align=\"right\">训练目的：</td>";
				content+="<td colspan=\"3\">"+data.VTrainpurpose.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"

				content+="<tr>";
				content+="<td align=\"right\">进入条件：</td>";
				content+="<td colspan=\"3\" >"+data.VTiaojian.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
	
				content+="<tr>";
				content+="<td align=\"right\">非常规项目：</td>";
				content+="<td colspan=\"3\" >"+data.VXiangmu.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td align=\"right\">特殊要求：</td>";
				content+="<td colspan=\"3\" >"+data.VTsyq.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				
				content+="<tr>";
				content+="<td align=\"right\">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</td>";
				content+="<td colspan=\"3\" >"+data.VBz.replace(/\n/g,"<br/>")+"</td>";
				content+="</tr>"
				content+="<tr>";
				content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				content+="<tr>";
				content+="<td colspan=\"4\" align=\"center\">训练科目</td>";
				content+="</tr>"
				content+="<tr>";
				content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
				content+="</tr>"
				
				$("#dialogContent").dialog('option', 'title',  "所选课目《"+data.VName+"》");
				
			},
			error:function(){
				$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
		});	
		
		$("#contentid").html(content+execFuZhi(this.id));
		$( "#dialogContent" ).dialog( "open" );
	});
	
	$( "#dialogContent" ).dialog({//内容窗口
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
	$("#modalDialogButton3").click(function(){//删除
		var k = getSelValue('radioName');
		if(k==""){
			$("#dialogForm3Warning").html("请选择要删除的内容。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}

		$("#unitSubjectDicIdListId").val(k);
		$( "#dialogForm2" ).dialog( "open" );
		
	});

	$("#modalDialogButton4").click(function(){//查询
		$("#searchKey").val($("#searchUser").val());
		$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//刷新
		$("#searchKey").val("");
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
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var unitid = $("#cunitid").val();
				window.location.href="open_updateTrainingLessonPage.do?id=" + $("#unitSubjectDicIdListId").val() + "&unitid=" + unitid;
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
});
function execFuZhi(id){
	//训练科目列表
	var content="";
	params = {"id":id};
	$.ajax({
		async:false,//同步请求
		type:"post",
		url:"showSetTrainsubjectListById.do",
		data:params,
		dataType:"json",
		success:function(data){
				
			var score = "";
			for(i=0;i<data.length;i++){
		
				if(data[i].ISort==0){
					content+="<tr><td></td><td><img src=\"themes/cupertino/images/plane.gif\" align=\"absmiddle\" />"+data[i].VName+"</td>";
					content+="<td colspan=\"2\"></td></tr>";
				content+="<tr><td colspan=\"4\"><span class=\"panelLine\"></span></td></tr>";
				}else{
					
					if(data[i].DScore==100){
						score = "";
					}else{
						score = data[i].DScore;
					}
					content+="<tr><td></td><td style=\"padding-left:20px;\">"+data[i].VName+"</td>";
					content+="<td colspan=\"2\" style=\"padding-left:20px;\">"+score+"</td></tr>";
					content+="<tr><td colspan=\"4\"><span class=\"panelLine\"></span></td></tr>";
				}
			}
		
		},
		error:function(){
			$("#dialogForm3Warning").html("数据库连接错误，获取对象失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});
	return content;
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
    <button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">新建训练课目</button>
    <button id="copyButton1" class="green" primary="ui-icon-button-copy">复制课目</button>
    <button class="normal barLeft" id="modalDialogButton2">编辑</button>
    <button class="normal barMiddle" id="modalDialogButton3">删除</button>
    </s:if>
    <button class="normal <s:if test="#r==null || #r==0">barMiddle</s:if><s:else>barLeft</s:else>" id="modalDialogButton5">刷新</button>
    <div class="dropDownList barRight"><button></button><span class="bar"></span>
    <ul>
    <s:iterator value="lessonSortList" status="statu">
    <li><a href="open_trainingLessonList.do?unitid=${VId}" val="${VId}"><s:if test='#statu.index==0'><span class="ui-icon ui-icon-bullet"></span></s:if>${VName}</a>
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
    <input id="searchUser" name="searchUser"  type="text" maxlength="50"/><button id="modalDialogButton4">查询</button>
    </div>
</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="2">
        	<thead>
			  <tr>
				<th width="30" rowspan="2">选项</th>
				<th width="90" rowspan="2">课目编号</th>
                <th width="55" rowspan="2">版本号</th>
				<th width="170" rowspan="2">课目名称</th>
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
                <td>${DMnjsj}</td>
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

<div id="dialogContent"  title="所选课目内容详单">

	<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tbody id="contentid">
    </tbody>
    </table>

</div>

<div id="dialogForm4"  title="引用所选课目的大纲列表">
	<fieldset>
	<ul id="outlineid" style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;"></ul>
    <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" valign="middle" align="center"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;">该课目被以上大纲引用，确认修改吗？</span></td>
      </tr>
    </table>
	</fieldset>	
</div>
<form  action="open_trainingLessonList.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
<input name="unitid" type="hidden" id="cunitid" value='<s:property value="#selunitId"/>'>
</form>
<form  action="deleteTrainingLesson.do" method="post" id="deleteForm">
<input name="id" type="hidden" id="unitSubjectDicIdListId">
<input name="unitid" type="hidden" id="cunitid" value='<s:property value="#selunitId"/>'>
</form>
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