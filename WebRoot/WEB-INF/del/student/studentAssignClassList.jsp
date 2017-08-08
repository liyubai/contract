<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>学生基础信息管理</title>
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
<style>

fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }

</style>
<script>

$(function() {
	$("div.dropDownList").find("button").css("width","85px").end().each(function(i){
		if(i==0){var d=new $.dropDownList(i,true,140);d.button.css("width", "65px");}
		else if(i==1){var d=new $.dropDownList(i,true,85);d.button.css("width", "85px");}
		else if(i==3){var d=new $.dropDownList(i,true,335);d.button.css("width", "110px");}
		else if(i==4){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==5){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==7){var d=new $.dropDownList(i,true,90);d.button.css("width", "90px");}
		else if(i==8){var d=new $.dropDownList(i,false,250);d.button.css("width", "75px");}
		
		else if(i==9){var d=new $.dropDownList(i,true,110);d.button.css("width", "110px");}
		else if(i==10){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==11){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==12){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==13){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==14){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		
		else{new $.dropDownList(i,true,90);}

	});
	var $checkboxes=$("input[name='checkboxName']"),$checkAllUsersBox=$("#checkAllUsersBox");
	$checkboxes.change(function(){
	    //当复选框去掉选中状态后，将全选按钮的选择状态去掉（即去掉全选复选框的选中状态）
		if(!this.checked){
		   $checkAllUsersBox[0].checked=false;
		    $("#selSid").val($("#selSid").val().replace($(this).val()+",","")); //去掉选择
		}
		//后加开始......
		if(this.checked){
			if($("#selSid").val().indexOf($(this).val())==-1){
				$("#selSid").val( $("#selSid").val() + $(this).val()+ ",");
			}
		}
		getnum($("#selSid").val());
		//后加结束......
		
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
			//后加开始......
			if($checkAllUsersBox[0].checked){
				if($("#selSid").val().indexOf($(this).val())==-1){
					$("#selSid").val($("#selSid").val() + $(this).val() + ",");
				}
			}else{
				 $("#selSid").val($("#selSid").val().replace($(this).val()+",",""));//去掉选择
			}
			getnum($("#selSid").val());
			//后加结束......
		});
	});
	
	function getnum(str){
		$("#selectIdSum").html(str.split(",").length-1);	
	}
	getnum($("#selSid").val());

	$("#ztButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		var r1=document.getElementsByName("className");	
		
		for(var i=0;i<r1.length;i++){
			r1[i].checked=false;
		}
		$("#assignForm").attr("action","saveStudentAssignClass.do");
		$( "#statusDialog" ).dialog("open");
	});
	
	$( "#statusDialog" ).dialog({
		autoOpen: false,
		height: 480,
		width: 680,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#studentid").val($("#selSid").val());
				$("#assigntimeid").val($("#cassigntimeid").val());
				var str = getSelRadioValue("className");
				if(str==""){
					alert("请选择班级。");
					return;	
				}
				$("#classid").val(str);
				$( this ).dialog( "close" );
				$("#assignForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
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
});
function showEditDiaLog(id,classid,assigntime){

	var r1=document.getElementsByName("className");	
		
	for(var i=0;i<r1.length;i++){
		if(r1[i].value==classid){
			r1[i].checked=true;
		}
	}
	
	$("#cassigntimeid").val(assigntime);
	$("#VId").val(id);
	$("#assignForm").attr("action","updateStudentAssignClass.do");
	$("#statusDialog").dialog( "open" );
}
function deleteLessonScore(id){

	window.location.replace("deleteStudentAssignClassById.do?id=" + id);
}
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4a9df179014a9e3beb0c0003</s:param>
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
</s:else><s:if test="#r==null || #r==0">
<div class="panelBox buttonBox" style="padding-bottom:10px; padding-left:3px;" >
<button class="green"  id="ztButton">分配班级</button>
</div></s:if>
<div class="panelBox buttonBox" >
<s:include value="../student/banner.jsp" />
<div class="dropDownList barMiddle">
<s:set name="eisAssignid" value="isAssignid"/>
<s:if test="isAssignid==null || isAssignid==''"><s:set name="eisAssignid" value="1"></s:set></s:if>
<button>班级</button><span class="bar"></span>
<ul>
<li><a href="?year=${year}&classNo=${classNo}&isAssignid=1&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="1"><span class="ui-icon ui-icon-bullet"></span>班级</a></li>

<s:iterator value="trainingClassList">
<li><a href="?year=${year}&classNo=${classNo}&isAssignid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="${VId}">${VName}</a></li>
</s:iterator>
<li><a href="?isAssignid=6"  val="6">全部</a></li>
</ul><input type="hidden"  id="cxmoreid" value='<s:property value="#eisAssignid" />'/>
</div>
<button class="normal barRight" id="advancedDialogButton">高级查询</button>
<div class="buttonInput relative left" width="160" height="28">
<input id="searchOutlineName" title="学号/姓名"  name="searchOutlineName"  type="text" maxlength="50" value="学号/姓名" /><button id="modalDialogButton4">查询</button>
</div>

</div>


<div class="Panel ui-corner-all-0" id="Panel2" >

	<div class="panelContent">

	
        <table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
        	<thead>
             	<tr class="trSpliter">
				<th width="50"></th>
				<th width="100"></th>
				<th width="60"></th>
				<th width="60"></th>
				<th width="80"></th>
                <th width="90"></th>
                <th width="90"></th>
                <th width="90"></th>
                <th width="80"></th>
                <th width="100"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortableGray" ><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
                <th class="thSortableGray" >学号</th>
                <th class="thSortableGray" >姓名</th>
                <th class="thSortableGray" >性别</th>
                <th class="thSortableGray" >学员类型</th>
                <th class="thSortableGray" >所属公司</th>
                <th class="thSortableGray" >学生状态</th>
                <th class="thSortableGray" >学籍状态</th>
                <th class="thSortableGray" >招生形式</th>
                <th class="thSortableGray" >自费/公费</th>
                <th class="thSortableGray" >分配班级</th>
			  </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
   
			  <tr>
              	<td><input name="checkboxName" type="checkbox" value="${VId}"  <s:if test='selIds!=null && selIds.indexOf(VId)!=-1'>checked="checked"</s:if>><b></b></td>
				<td >${VCode}</td>
				<td>${VName}</td>
				<td>${VGender}</td>
                <td>${stuTypeName}</td>
                <td>${companyName}</td>
                <td>${stuStatusName}</td>
                <td>${xjStatusName}</td>
                <td>${formName}</td>
                <td>${freeTypeName}</td>
				<td>
                <s:iterator value="stuClassList">
               <span class="inline" style="width:150px;">${className}</span><s:if test="#r==null || #r==0"><a href="javascript:void(0)" onClick="showEditDiaLog('${VId}','${classid}','${DAssigntime}')"><img src="themes/cupertino/images/edit.png"  title="调换班级" border="0" align="absmiddle"/></a> <a href="javascript:void(0)" onClick="deleteLessonScore('${VId}')"><img src="themes/cupertino/images/subfu.png" title="取消分配" border="0" align="absmiddle"/></a></s:if><br/>
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
		</table><s:include value="../common/pagination_system_sel.jsp" />
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

<div id="statusDialog"  title="学生分配班级">
<input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>
选择培训班级：
<span class="panelLine"></span>
<s:iterator value="trainingClassList">
<a href="#N" class="inline" style="width:180px; border:0; line-height:24px;"><input name="className" type="radio" value="${VId}">${VName}</a>
</s:iterator>
<span class="panelLine"></span>
分配日期： 
<input type="text"  id="cassigntimeid" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDChangedtime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" />

</div>

<s:include value="../student/advancedSearchDialog.jsp" />
<input type="hidden"  name="selIds" value="${selIds}" id="selSid">
<input type="hidden" id="selectStudentNameAndCode">
<%@ include file="../../result.jsp"%>

<form id="assignForm" method="post" action="saveStudentAssignClass.do">
<input type="hidden" name="stuClass.VId" id="VId" />
<input type="hidden" name="stuClass.TSetClass.VId" id="classid" />
<input type="hidden" name="stuClass.studentBaseInfo.VId" id="studentid" />
<input type="hidden" name="stuClass.DAssigntime" id="assigntimeid" />
</form>
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
function gotoPage(pageIndex){
	var pageIndex=pageIndex<1?1:pageIndex;
	var url = location.protocol + '//' + location.host + location.pathname;
	var args = location.search;

	args=removeURLArgument(args,"statusMsg");
	args = setURLArgs(args,'pageIndex',pageIndex);
	args = setURLArgs(args,'selIds',$("#selSid").val());//参数可以增加
	if (orderBy!="")
		args = setURLArgs(args,'orderBy',orderBy);
	if (orderType!="")
		args = setURLArgs(args,'orderType',orderType);
	if(args.indexOf("?")!=-1 && args.indexOf("&")!=-1){

		if(1==args.indexOf("&")-args.indexOf("?")){
			var a = args.substring(0,args.indexOf("?")+1);
			var b = args.substring(args.indexOf("?")+2,args.length);
			args = a+b;
		}
	
	}
	self.location.href = url+args;
}
</script>