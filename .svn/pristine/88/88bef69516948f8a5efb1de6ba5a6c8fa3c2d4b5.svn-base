<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学员大纲变更</title>
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

<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>
<script type="text/javascript" src="../js/wdatepicker/date.js" ></script>
<style>

fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }

</style>
<script>

$(function() {
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
	});
	$checkAllUsersBox.click(function(){
	    //当全选复选框处于选中或非选中状态时，循环处理每个复选框的状态，即当全选复选框当前的状态循环赋给每个复选框
		$checkboxes.each(function(){
			this.checked = $checkAllUsersBox[0].checked;
			$(this).trigger("change");
		});
	});
	
	
	$("div.dropDownList").find("button").css("width","85px").end().each(function(i){
		
		if(i==0){var d=new $.dropDownList(i,true,140);d.button.css("width", "65px");}
		else if(i==1){var d=new $.dropDownList(i,true,85);d.button.css("width", "85px");}
		else if(i==3){var d=new $.dropDownList(i,true,335);d.button.css("width", "110px");}
		else if(i==4){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==5){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==7){var d=new $.dropDownList(i,true,90);d.button.css("width", "90px");}
		else if(i==8){var d=new $.dropDownList(i,true,75);d.button.css("width", "75px");}
		
		else if(i==9){var d=new $.dropDownList(i,true,60);d.button.css("width", "60px");}
		else if(i==10){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==11){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==12){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==13){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==14){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==15){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==16){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		
		else{new $.dropDownList(i,true,90);}

	});
	
	
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchOutlineName").val()=="学号/姓名"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($.trim($("#searchOutlineName").val()));
		}
		$( "#searchForm" ).submit();
	});
	
	$( "#dialogForm2" ).dialog({//分配确认
		autoOpen: false,
		height: 200,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$( "#assignOutlineDialog" ).dialog( "close" );
				$( "#selectOutlineDialogForm" ).dialog("close");
				$( this ).dialog( "close" );
				$("#assignForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});

	
	$( "#dialogContent" ).dialog({//内容窗口
		autoOpen: false,
		height: 495,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"返 回": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	function getSelValue(name){
		var str="";
		var r1=document.getElementsByName(name);
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str+=r1[i].value + ",";
			}
		}
		return str;
	}
	function getSelRadioValue(name){
		var str="";
		var r1=document.getElementsByName(name);
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str=r1[i].value;
			}
		}
		return str;
	}
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
	
	$( "#selectOutlineDialogForm" ).dialog({
		autoOpen: false,
		height: 495,
		width: 480,
		modal: true,
		resizable: false,
		buttons: {
			"下一步": function() {
				//打开分配大纲输入信息页面
				var str = "";
				var r1=document.getElementsByName('radioName');
				for(i=0;i<r1.length;i++){
					if(r1[i].checked==true){
						str=r1[i].value;
					}
				}
				if(str==""){
					$("#dialogForm3Warning").html("请选择大纲。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}

				$("#selectOutlineName").html(str.split(",")[1]);
				$("#outlineid").val(str.split(",")[0]);
				$("#selectStudentNameAndCodeid").html($("#selectStudentNameAndCode").val());
				$( "#assignOutlineDialog" ).dialog("open");
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$("#advancedDialogButton").click(function(){//查询
		$( "#advancedSearchDialog" ).dialog( "open" );
	});
	$( "#advancedSearchDialog" ).dialog({//高级查询窗口
		autoOpen: false,
		height: 495,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"查 询": function() {
				//查询表单赋值
				$("#sname").val($("#cname").val());
				$("#sxstuTypeid").val(getSelValue('xstuTypeidCheckboxName'));
				$("#sxcompanyid").val(getSelValue('xcompanyidCheckboxName'));
				$("#sxstatusid").val(getSelValue('xstatusidCheckboxName'));
				$("#sxxjstatusid").val(getSelValue('xxjstatusidCheckboxName'));
				$("#sxformid").val(getSelValue('xformidCheckboxName'));
				$("#sxfreetypeid").val(getSelValue('xfreetypeidCheckboxName'));
				$("#sisAssignid").val(getSelValue('isAssignidCheckboxName'));
				
				$("#sisAndName").val(getSelRadioValue('isAndName'));
				$("#sisAndStuType").val(getSelRadioValue('isAndStuType'));
				$("#sisAndCompany").val(getSelRadioValue('isAndCompany'));
				$("#sisAndStatus").val(getSelRadioValue('isAndStatus'));
				$("#sisAndXjStatus").val(getSelRadioValue('isAndXjStatus'));
				$("#sisAndForm").val(getSelRadioValue('isAndForm'));
				$("#sisAndFreeType").val(getSelRadioValue('isAndFreeType'));
				$("#sisAndAssign").val(getSelRadioValue('isAndAssign'));

				$( "#advancedSearchForm" ).submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
	function checkNum(str){ //数字
		return str.match(/\D/)==null 
	}
	$( "#assignOutlineDialog" ).dialog({//输入分配大纲的内容
		autoOpen: false,
		height: 495,
		width: 480,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var cICycle = $.trim($("#cICycle").val());
				if(cICycle==""){
					alert("训练周期不能为空。");
					$("#cICycle").focus();
					return;
				}
				if(!checkNum(cICycle)){
					alert("训练周期应为数字。");
					$("#cICycle").focus();
					return false;
				}
				$("#VSubnameid").val($.trim($("#cVContact").val()));//合同号
				$("#typeNameid").val(cICycle);
				$("#ISortid").val($("#cIType").val());
				$("#pdateid").val($("#changeDate").val());
				var	content = "确定变更大纲吗？";
				$("#dialogFormAuditWarning").html(content);
				$( "#dialogForm2" ).dialog( "open" );

			},
			"返 回": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	$( "#assignContent" ).dialog({//显示分配大纲的内容
		autoOpen: false,
		height: 400,
		width: 480,
		modal: true,
		resizable: false,
		buttons: {
			"关 闭": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	function clearSelValue(name){
		var r1=document.getElementsByName(name);
		for(i=0;i<r1.length;i++){
			r1[i].checked=true;
			r1[i].click();
		}
	}

	$("#assignOutlineButton").click(function(){//分配大纲
		execAssgin(getSelValue('checkboxName'));
	});
	
	function execAssgin(optStr){//分配大纲
		if(optStr==""){
			$("#dialogForm3Warning").html("请选择学员。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		var str="";
		var cn = "";
		var r1=optStr.split(",");
		for(i=0;i<r1.length-1;i++){
			str+=r1[i].split(";")[0] + ",";
			cn+=r1[i].split(";")[1]+";" + r1[i].split(";")[2] + ",";
		}

		if(str==""){
			$("#dialogForm3Warning").html("请选择学员。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		var content = "";
		var stus = cn.split(",");
		for(j=0;j<stus.length-1;j++){
			content+="<a href=\"#N\" class=\"inline\" title=\"学号："+stus[j].split(";")[0]+"\" style=\"width: 60px; border:0\">"+ stus[j].split(";")[1] + "</a>";
		}
		$("#selectStudentNameAndCode").val(content);
		$("#studentid").val(str);

		//获取已生效大纲列表
		gotoPageA(1);
		
	}
	
	$("#searchCanUseOutlineButton").click(function(){//查询大纲

		if($("#outlinekey").val()=="大纲名称"){
			$("#outlinekey").val("");
		}
		$("#searchKey").val($("#outlinekey").val());
		gotoPageA(1);
		
	});

});

function gotoPageA(pageIndex){
    pageIndex=pageIndex<1?1:pageIndex;
	var name = $.trim($("#outlinekey").val());
	if(name=="大纲名称"){
		name = "";
	}
	params = {"name":name,"pageIndex":pageIndex};
	
	$.ajax({
		type:"post",
		url:"showCanUsedOutlineList.do",
		data:params,
		dataType:"json",
		success:function(data){
			//$("#isCheckBoxButtonid").attr("checked",false);
			var content = "";
			var selects = "";
			var selstr = "";
			for(i=0;i<data.data.length;i++){
				
				content+="<li><input name=\"radioName\" type=\"radio\" value=\""+data.data[i].VId+","+data.data[i].VName+"\"><A href=\"javascript:void(0)\" onclick=viewContent(\""+data.data[i].VId+"\") class=\"blue\">" + data.data[i].VName+"</a><span class=\"panelLine\"></span></li>";
			}
			for(j=0;j<9-data.data.length;j++){
					content+="<li>&nbsp;<span class=\"panelLine\"></span></li>";
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
			content+="<li><a href=\"javascript:firstPageA("+pageIndex+");\" class=\"blue\">首页</a>&nbsp;<a href=\"javascript:prePageA("+pageIndex+");\" class=\"blue\">上一页</a>&nbsp;<a href=\"javascript:nextPageA("+pageIndex+","+pageCount+");\" class=\"blue\">下一页</a>&nbsp;<a href=\"javascript:lastPageA("+pageIndex+","+pageCount+");\" class=\"blue\">尾页</a>&nbsp;<select id =\"seliidA\" onchange=\"jumpPageA()\">"+selects+"</select>本页显示"+start+"-"+end+"条/共"+totalPageCount+"页"+totalCount+"条&nbsp;&nbsp;</li>";

			$("#outlineListid").html(content);
			if(data.data.length==0){
				alert("目前没有已生效的大纲，不能分配。");
				return;
			}
			$( "#selectOutlineDialogForm" ).dialog( "open" );//选择大纲的页面
		},
		error:function(XMLHttpRequest, textStatus, errorThrown){
			if(XMLHttpRequest.getResponseHeader("sessionstatus")=="timeout"){ 
				return;
			}
			$("#dialogForm3Warning").html("数据库连接错误，获取附件列表失败，请重试。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
	});	
}
function jumpPageA(){
	var s = $("#seliidA").val();
	gotoPageA(s);
}

function firstPageA(pageIndex){
	if (pageIndex!=1){
		gotoPageA(1);
	}
}   
function nextPageA(pageIndex,pageCount){
	if (pageIndex<pageCount){
		gotoPageA(pageIndex+1);
	}     
}
function prePageA(pageIndex){
	if (pageIndex>1){
		gotoPageA(pageIndex-1);
	}
} 
function lastPageA(pageIndex,pageCount){
	if (pageIndex!=pageCount){
		gotoPageA(pageCount);
	}     
}
function viewContent(id){//查看大纲内容

	if(id==""){
		return;	
	}
	params = {"id":id};
	$.ajax({
		type:"post",
		url:"showTrainingOutlineContentById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
			$("#contentid").html(getContent(data));
			$("#dialogContent").dialog('option', 'title',  "所选大纲《"+data.VName+"》");
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
	content="";
	content+="<tr>";
	content+="<td>大纲名称：</td>";
	content+="<td  height=\"24\" colspan=\"3\">"+data.VName+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td height=\"24\" width=\"15%\">大纲编号：</td><td width=\"35%\">"+data.VCode+"</td>";
	content+="<td width=\"15%\">版本号：</td><td d width=\"35%\">"+data.VBc+"</td>";
	content+="</tr>";
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\" >单元数量：</td><td>"+data.IUnits+"</td>";
	content+="<td>阶段数量：</td><td>"+data.IStages+"</td>";
	content+="</tr>";
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">课程数量：</td><td>"+data.ILessons+"</td>";
	content+="<td>训练时间：</td><td>"+getFormatTime(data.DTraintime)+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">飞机时间：</td><td>"+getFormatTime(data.DPlanetime)+"</td>";
	content+="<td>训练器时间：</td><td>"+getFormatTime(data.DTrainningdevicetime)+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	content+="<tr>";
	content+="<td  height=\"24\">当前状态：</td><td>"+getStatusName(data.IStatus)+"</td>";
	content+="<td>创建日期：</td><td>"+data.viewCreatedate+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">仪表等级：</td><td>"+data.VMeterclass+"</td>";
	content+="<td>训练设备：</td><td>"+data.VTrainequipment+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  height=\"24\">多发等级：</td><td>"+data.VMultipleclass+"</td>";
	content+="<td>训练机型：</td><td>"+data.VTrainform+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>使用范围：</td>";
	content+="<td  height=\"24\" colspan=\"3\">"+data.VRange.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>课程目标：</td>";
	content+="<td  height=\"24\" colspan=\"3\">"+data.VTarget.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>进入条件：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VConditions.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>训练周期：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VTraincycle.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>转学规定：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VChangeschool.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>训练终止：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VStoptrain.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>成绩评定：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VScorejudge.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>培训方法：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VTrainmethod.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td  colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>训练记录：</td>";
	content+="<td  height=\"24\" colspan=\"3\" >"+data.VTrainrecord.replace(/\n/g,"<br/>")+"</td>";
	content+="</tr>"	
	return content;
}
function viewAssignDetail(id){
	if(id==""){
		return;	
	}
	params = {"id":id};
	$.ajax({
		type:"post",
		url:"showAssignOutlineDetailById.do",
		data:params,
		dataType:"json",
		success:function(data){
			if(data==null){
				$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
			$("#sselectOutlineName").html("<A href=\"javascript:void(0)\" onclick=viewContent(\""+data.VId+"\") class=\"blue\">" + data.VName + "</A>");
			
			$("#sstuName").html(data.VConditions);
			$("#sstuCode").html(data.VRange);
			$("#sVContact").html(data.VBc);
			$("#sICycle").html(data.IUnits);
			$("#sIType").html(data.VCode);
			
			$( "#assignContent" ).dialog( "open" );
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
function getStatusName(type){
	var sName = "";
	if(type==0){
		sName="<font color=\"#50A13B\">已生效</font>";
	}else if(type==1){
		sName="<font color=\"#CC9900\">已取消</font>";
	}else if(type==3){
		sName="<font color=\"#3399FF\">未审批</font>";
	}else if(type==2){
		sName="<font color=\"#EB7979\">未通过</font>";
	}else{
		sName="未提交";
	}		
	return sName;
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

<div id="rightPartA"><div><%request.setAttribute("k",ActionContext.getContext().getName());%>
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
<div class="panelBox buttonBox" style="padding-bottom:10px; padding-left:3px;" > <button class="green" primary="ui-icon-button-addnew" id="assignOutlineButton">大纲变更</button></div></s:if>

<div class="panelBox buttonBox" >
<div class="dropDownList  barLeft"><s:set name="eyear" value="year"/>
<button>年</button><span class="bar"></span><s:if test="year==null || year==''"><s:set name="eyear" value=""></s:set></s:if>
<ul><li><a href="?year=&classNo=${classNo}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" val=""  class="inline"  style="width:30px;"><span class="ui-icon ui-icon-bullet"></span>年</a>
<s:iterator value="yearList"  status="stat"><s:set name="index" value="#stat.index"/>
<a href="?year=<s:property value="yearList.get(#index)"/>&classNo=${classNo}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" val="<s:property value="yearList.get(#index)"/>"  class="inline"  style="width:30px;"><s:property value="yearList.get(#index)"/></a>
</s:iterator>
</li>
</ul><input type="hidden"  id="cyearid" value='${eyear}'/>
</div>

<div class="dropDownList barMiddle"><s:set name="eclassNo" value="classNo"/>
<button>班</button><span class="bar"></span><s:if test="classNo==null || classNo==''"><s:set name="eclassNo" value=""></s:set></s:if>
<ul><li><a href="?year=${year}&classNo=&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" val=""><span class="ui-icon ui-icon-bullet"></span>班</a>
</li><s:iterator value="classList"><li>
<a href="?year=${year}&classNo=${VClassid}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" val="${VClassid}">${VClassid}</a>
</s:iterator>
</li>
</ul><input type="hidden"  id="cclassNo" value='${eclassNo}'/>
</div>

    <div class="dropDownList barMiddle">
     <s:set name="exstuTypeid" value="xstuTypeid"/>
    <s:if test="xstuTypeid==null || xstuTypeid==''"><s:set name="exstuTypeid" value=""></s:set></s:if>
    <button>学员类型</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xstuTypeid=&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" val=""><span class="ui-icon ui-icon-bullet"></span>学员类型</a></li>
        	<s:iterator value="dictionTypeList">
            <li><a href="?year=${year}&classNo=${classNo}&xstuTypeid=${VId}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" val="${VId}">${VName}</a></li>
            </s:iterator>
        </ul><input type="hidden"  id="cxstuTypeid" value='<s:property value="#exstuTypeid" />'/>
    </div>
    <div class="dropDownList barMiddle">
     <s:set name="excompanyid" value="xcompanyid"/>
    <s:if test="xcompanyid==null || xcompanyid==''"><s:set name="excompanyid" value=""></s:set></s:if>
    <button>所属公司</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xcompanyid=&xstuTypeid=${xstuTypeid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" class="inline"  style="width: 75px;" val=""><span class="ui-icon ui-icon-bullet"></span>所属公司</a>
        <s:iterator value="dictionCompanyList"><a href="?year=${year}&classNo=${classNo}&xcompanyid=${VId}&xstuTypeid=${xstuTypeid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}"  val="${VId}" class="inline"  style="width: 75px;">${VName}</a>
        </s:iterator></li> 
        </ul><input type="hidden"  id="cxcompanyid" value='<s:property value="#excompanyid" />'/>
    </div>
    
    <div class="dropDownList barMiddle">
     <s:set name="exstatusid" value="xstatusid"/>
    <s:if test="xstatusid==null || xstatusid==''"><s:set name="exstatusid" value=""></s:set></s:if>
    <button>学生状态</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xstatusid=&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" val="" class="inline"  style="width: 75px;"><span class="ui-icon ui-icon-bullet"></span>学生状态</a>
        	<s:iterator value="dictionStatusList">
            <a href="?year=${year}&classNo=${classNo}&xstatusid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}"  val="${VId}" class="inline" style="width: 75px;">${VName}</a>
            </s:iterator></li>
        </ul><input type="hidden"  id="cxstatusid" value='<s:property value="#exstatusid" />'/>
    </div>
    <div class="dropDownList barMiddle">
     <s:set name="exxjstatusid" value="xxjstatusid"/>
    <s:if test="xxjstatusid==null || xxjstatusid==''"><s:set name="exxjstatusid" value=""></s:set></s:if>
    <button>学籍状态</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xxjstatusid=&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" val="" class="inline"  style="width: 75px;"><span class="ui-icon ui-icon-bullet"></span>学籍状态</a>
        	<s:iterator value="dictionXjList">
           <a href="?year=${year}&classNo=${classNo}&xxjstatusid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}"  val="${VId}" class="inline"  style="width: 75px;">${VName}</a>
            </s:iterator></li>
        </ul><input type="hidden"  id="cxxjstatusid" value='<s:property value="#exxjstatusid" />'/>
    </div>
    <div class="dropDownList barMiddle">
    <s:set name="exformid" value="xformid"/>
    <s:if test="xformid==null || xformid==''"><s:set name="exformid" value=""></s:set></s:if>
    <button>招生形式</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xformid=&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" val=""><span class="ui-icon ui-icon-bullet"></span>招生形式</a></li>
        	<s:iterator value="dictionFormList">
            <li><a href="?year=${year}&classNo=${classNo}&xformid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xfreetypeid=${xfreetypeid}&isAssignid=${isAssignid}&name=${name}" val="${VId}">${VName}</a></li>
            </s:iterator>
        </ul><input type="hidden"  id="cxformid" value='<s:property value="#exformid" />'/>
    </div>
    <div class="dropDownList barMiddle">
    <s:set name="exfreetypeid" value="xfreetypeid"/>
     <s:if test="xfreetypeid==null || xfreetypeid==''"><s:set name="exfreetypeid" value=""></s:set></s:if>
    <button>自费/公费</button><span class="bar"></span>
    <ul>
        <li><a href="?year=${year}&classNo=${classNo}&xfreetypeid=&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&isAssignid=${isAssignid}&name=${name}" val=""><span class="ui-icon ui-icon-bullet"></span>自费/公费</a></li>
        	<s:iterator value="dictionFreeTypeList">
            <li><a href="?year=${year}&classNo=${classNo}&xfreetypeid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&isAssignid=${isAssignid}&name=${name}" val="${VId}">${VName}</a></li>
            </s:iterator>
        </ul><input type="hidden"  id="cxfreetypeid" value='<s:property value="#exfreetypeid" />'/>
    </div>
    
    <div class="dropDownList barMiddle">
        <s:set name="eisAssignid" value="isAssignid"/>
        <s:if test="isAssignid==null || isAssignid==''"><s:set name="eisAssignid" value="1"></s:set></s:if>
        <button>更多</button><span class="bar"></span>
        <ul>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=1&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="1"><span class="ui-icon ui-icon-bullet"></span>更多</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=4&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="4">男</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=5&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="5">女</a></li>
            <li><a href="?isAssignid=6"  val="6">全部</a></li>
        </ul><input type="hidden"  id="cxmoreid" value='<s:property value="#eisAssignid" />'/>
    </div>
 	<button class="normal barRight" id="advancedDialogButton">高级查询</button>
     <div class="buttonInput relative left" width="160" height="28">
    <input id="searchOutlineName"  name="searchOutlineName"  title="学号/姓名" type="text" maxlength="50" value="学号/姓名" /><button id="modalDialogButton4">查询</button>
    </div>
</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3">
        	<thead>
			  <tr>
                <th width="50" height="28"><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
                <th width="100">学号</th>
                <th width="50">姓名</th>
                <th width="40">性别</th>
                <th width="60">学员类型</th>
                <th width="90">所属公司</th>
                <th width="90">学生状态</th>
                <th width="90">学籍状态</th>
                <th width="60">招生形式</th>
                <th width="60">自费/公费</th>
                <th><div align="left">&nbsp;大纲</div></th>
			  </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
            
			  <tr>
              	<td align="center"><input name="checkboxName" type="checkbox" value="${VId};${VCode};${VName};${flag}"><b></b></td>
				<td align="center">${VCode}</td>
				<td align="center">${VName}</td>
				<td align="center">${VGender}</td>
                <td align="center">${stuTypeName}</td>
                <td align="center">${companyName}</td>
                <td align="center">${stuStatusName}</td>
                <td align="center">${xjStatusName}</td>
                <td align="center">${formName}</td>
                <td align="center">${freeTypeName}</td>
				<td align="left">
                 <s:iterator value="stuClassList">
                 <a href="javascript:void(0)" onClick="viewAssignDetail('${VId}')" class="blue">${className}</a><br/>
                </s:iterator>
              </td>
				
			  </tr>
              </s:iterator>
             <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
              <td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
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
</div>
<div id="dialogForm3">
  <fieldset>
     <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm3Warning"></span></td>
      </tr>
    </table>
  </fieldset>
</div>
<div id="dialogForm2">
  <fieldset>
    <table width="100%" border="0" align="center" cellpadding="0">
      <tr>
        <td width="10%" height="90" align="left" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
        <td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogFormAuditWarning"></span></td>
      </tr>
    </table>
  </fieldset>
</div>

<div id="dialogContent"  title="所选大纲内容详单">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
    <tbody id="contentid">
    </tbody>
    </table>
</div>

<div id="selectOutlineDialogForm"  title="已生效大纲列表">
	<fieldset><input type="text" name="focusn" style="width:0px; height:0px; border:0px;"/>
   <div class="buttonInput relative left" width="180" height="28" style="margin-bottom:5px;">
    <input id="outlinekey" title="大纲名称"  name="outlinekey"  type="text" maxlength="50" value="大纲名称" /><button id="searchCanUseOutlineButton">查询</button>
    </div>
    <span class="panelLine"></span>
	<ul id="outlineListid" style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;"></ul>
</fieldset>	
</div>

<div id="assignOutlineDialog"  title="新大纲">

	<div style="line-height:30px; float: left">已选学员：<input type="text" name="vfocusn" style="width:0px; height:0px; border:0px;"/></div>
	<div style="line-height:30px; margin-left:60px;" id="selectStudentNameAndCodeid"></div>
    <span class="panelLine"></span>
	已选大纲： <span id="selectOutlineName" style=" line-height:30px;"></span>
	<span class="panelLine"></span>
	新合同号： <input id="cVContact" type="text" class="text ui-widget-content ui-corner-all" style="width:200px;"/>
    <span class="panelLine"></span>
	培训周期： <input id="cICycle" type="text" class="text ui-widget-content ui-corner-all" style="width:60px;"/>&nbsp;&nbsp;
    周期类型： <div class="dropDownList">
        <button>月</button><ul>
        <li><a href="#" val="2"><span class="ui-icon ui-icon-bullet"></span>月</a></li>
        <li><a href="#" val="0">周</a></li>
         <li><a href="#" val="1">天</a></li>
        </ul><input type="hidden"  id="cIType" value="2"/>
    </div>
     <span class="panelLine"></span>
	更换日期：
    <input id="changeDate" class="Wdate ui-widget-content ui-corner-all text"  style="width:150px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
</div>

<div id="assignContent"  title="分配大纲内容">

	大纲名称： <span id="sselectOutlineName" style=" line-height:30px;"></span>
	<span class="panelLine"></span>
    学员姓名： <span id="sstuName" style=" line-height:30px;"></span>
	<span class="panelLine"></span>
    学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号： <span id="sstuCode" style=" line-height:30px;"></span>
	<span class="panelLine"></span>
	合&nbsp;同&nbsp;&nbsp;号： <span id="sVContact" style=" line-height:30px;"></span>
    <span class="panelLine"></span>
	培训周期： <span id="sICycle" style=" line-height:30px;"></span>
    <span class="panelLine"></span>
    周期类型： <span id="sIType" style=" line-height:30px;"></span>
     <span class="panelLine"></span>

</div>


<div id="advancedSearchDialog"  title="高级查询">

	关&nbsp;&nbsp;键&nbsp;&nbsp;字： <span style="line-height:30px;"><input name="isAndName" type="radio" value="0" checked><b></b>并且 <input name="isAndName" type="radio" value="1"><b></b>或者&nbsp;&nbsp;<input type="text"  id="cname" class="text ui-widget-content ui-corner-all" style="width:102px;" /> (姓名/学号/身份证/性别)</span>  
    <span class="panelLine"></span>
    学员类型 ： <input name="isAndStuType" type="radio" value="0" checked><b></b>并且 <input name="isAndStuType" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
        <button>学员类型</button>
        <ul style="line-height:23px;">
        <s:iterator value="dictionTypeList">
        <li>&nbsp;&nbsp;&nbsp;<input name="xstuTypeidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</li>
        </s:iterator>
        </ul>
    </div>
    <span class="panelLine"></span>
    所属公司 ： <input name="isAndCompany" type="radio" value="0" checked><b></b>并且 <input name="isAndCompany" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
    <button>所属公司</button>
    <ul style="line-height:23px;">
        <li><s:iterator value="dictionCompanyList">
        <div style="width:110px; float:left">&nbsp;&nbsp;&nbsp;<input name="xcompanyidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</div>
        </s:iterator></li>
        </ul>
    </div>
    <span class="panelLine"></span>
    学生状态 ： <input name="isAndStatus" type="radio" value="0" checked><b></b>并且 <input name="isAndStatus" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
        <button>学生状态</button>
        <ul style="line-height:23px;">
        <li>
        <s:iterator value="dictionStatusList">
        <div style="width:110px; float:left">&nbsp;&nbsp;&nbsp;<input name="xstatusidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</div>
        </s:iterator></li>
        </ul>
	</div>
    <span class="panelLine"></span>
    学籍状态 ： <input name="isAndXjStatus" type="radio" value="0" checked><b></b>并且 <input name="isAndXjStatus" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
        <button>学籍状态</button>
        <ul style="line-height:23px;">
        <li>
        <s:iterator value="dictionXjList">
        <div style="width:110px; float:left">&nbsp;&nbsp;&nbsp;<input name="xxjstatusidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</div>
        </s:iterator></li>
        </ul>
    </div>
    <span class="panelLine"></span>
 	招生形式 ： <input name="isAndForm" type="radio" value="0" checked><b></b>并且 <input name="isAndForm" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
    <button>招生形式</button>
    <ul style="line-height:23px;">
        <s:iterator value="dictionFormList">
            <li>&nbsp;&nbsp;&nbsp;<input name="xformidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</li>
         </s:iterator>
        </ul>
    </div>
    <span class="panelLine"></span>
	自费/公费： <input name="isAndFreeType" type="radio" value="0" checked><b></b>并且 <input name="isAndFreeType" type="radio" value="1"><b></b>或者&nbsp;
    <div class="dropDownList">
    <button>自费/公费</button>
    <ul style="line-height:23px;">
        <s:iterator value="dictionFreeTypeList">
        <li>&nbsp;&nbsp;&nbsp;<input name="xfreetypeidCheckboxName" type="checkbox" value="${VId}"/><b></b>${VName}</li>
        </s:iterator>
    </ul>
    </div>
</div>

<form  action="open_studentOutlineChanged.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey" value="${name}">

<input name="xstuTypeid" type="hidden" value="${xstuTypeid}">
<input name="xcompanyid" type="hidden" value="${xcompanyid}">
<input name="xstatusid" type="hidden" value="${xstatusid}">
<input name="xxjstatusid" type="hidden" value="${xxjstatusid}">
<input name="xformid" type="hidden" value="${xformid}">
<input name="xfreetypeid" type="hidden" value="${xfreetypeid}">
<input name="isAssignid" type="hidden" value="${isAssignid}">
</form>

<form  action="open_studentOutlineChanged.do" method="post" id="advancedSearchForm">
<input name="searchBean.name" type="hidden" value="${searchBean.name}" id="sname">
<input name="searchBean.xstuTypeid" type="hidden" value="${searchBean.xstuTypeid}" id="sxstuTypeid">
<input name="searchBean.xcompanyid" type="hidden" value="${searchBean.xcompanyid}" id="sxcompanyid">
<input name="searchBean.xstatusid" type="hidden" value="${searchBean.xstatusid}" id="sxstatusid">
<input name="searchBean.xxjstatusid" type="hidden" value="${searchBean.xxjstatusid}" id="sxxjstatusid">
<input name="searchBean.xformid" type="hidden" value="${searchBean.xformid}" id="sxformid">
<input name="searchBean.xfreetypeid" type="hidden" value="${searchBean.xfreetypeid}" id="sxfreetypeid">
<input name="searchBean.isAssignid" type="hidden" value="${searchBean.isAssignid}" id="sisAssignid">

<input name="searchBean.isAndName" type="hidden" value="${searchBean.isAndName}" id="sisAndName">
<input name="searchBean.isAndStuType" type="hidden" value="${searchBean.isAndStuType}" id="sisAndStuType">
<input name="searchBean.isAndCompany" type="hidden" value="${searchBean.isAndCompany}" id="sisAndCompany">
<input name="searchBean.isAndStatus" type="hidden" value="${searchBean.isAndStatus}" id="sisAndStatus">
<input name="searchBean.isAndXjStatus" type="hidden" value="${searchBean.isAndXjStatus}" id="sisAndXjStatus">
<input name="searchBean.isAndForm" type="hidden" value="${searchBean.isAndForm}" id="sisAndForm">
<input name="searchBean.isAndFreeType" type="hidden" value="${searchBean.isAndFreeType}" id="sisAndFreeType">
<input name="searchBean.isAndAssign" type="hidden" value="${searchBean.isAndAssign}" id="sisAndAssign">
</form>


<form  action="changedOutline.do" method="post" id="assignForm">
<input name="viewTrainsubject.typeid" type="hidden" id="studentid">
<input name="viewTrainsubject.VId" type="hidden" id="outlineid">
<input name="viewTrainsubject.VSubname" type="hidden" id="VSubnameid">
<input name="viewTrainsubject.ISort" type="hidden" id="ISortid">
<input name="viewTrainsubject.typeName" type="hidden" id="typeNameid">
<input name="viewTrainsubject.pdate" type="hidden" id="pdateid">
</form>
<input type="hidden" id="selectStudentNameAndCode">
<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	var myDate = new Date();
	$("#changeDate").val(myDate.format("yyyy-MM-dd")); 
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm3Warning").html(operateResult);
		$( "#dialogForm3" ).dialog( "open" );//操作成功后返回提示页面
	}
});
</script>