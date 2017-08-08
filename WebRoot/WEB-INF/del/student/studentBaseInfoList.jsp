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
		else if(i==8){var d=new $.dropDownList(i,false,75);d.button.css("width", "75px");}
		
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
	$("button.icon").click(function(){
		var vid = this.id;
		if(vid==""){
			return;
		}
		
		var type = vid.split(",")[0];
		var id = vid.split(",")[1];
		if(type==0){
			window.location.replace("open_editStudentBaseInfoPage.do?id="+id + "&pageIndex="+pageIndex);
		}else{
			
		}
	});
	$("#editButton").click(function(){//编辑

		var str="";
		var r1=document.getElementsByName('checkboxName');
		for(var i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				str=r1[i].value;
			}
		}

		if(str==""){
			alert("请选择要编辑的学生。");
			return;
		}
		window.location.replace("open_editStudentBaseInfoPage.do?id="+str + "&pageIndex="+pageIndex);
	});
	$("#zhuceButton").click(function(){//注册
		window.location.replace("open_createStudentBaseInfoPage.do");
	});

	$("#ztButton").click(function(){//状态
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#studentid").val($("#selSid").val());
		$("#optid").val("zt");
		$( "#statusDialog" ).dialog("open");
	});
	
	$("#xjButton").click(function(){//学籍
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#studentid").val($("#selSid").val());
		$("#optid").val("xj");
		$( "#xuejiDialog" ).dialog("open");
	});
	$("#gsButton").click(function(){//公司
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#studentid").val($("#selSid").val());
		$("#optid").val("gs");
		$( "#gongsiDialog" ).dialog("open");
	});
	$("#importButton").click(function(){
		window.location.replace("open_importStudentInfoPage.do");
	});

	$( "#gongsiDialog" ).dialog({
		autoOpen: false,
		height: 480,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#reasonid").val($("#gsreason").val());
				$("#changeDateid").val($("#gsChangedtime").val());
				$("#newid").val(getSelRadioValue("gsName"));
				if($("#newid").val()==""){
					alert("请选择公司。");
					return;
				}
				$("#assignForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#statusDialog" ).dialog({//状态
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#reasonid").val($("#ztreason").val());
				$("#changeDateid").val($("#ztChangedtime").val());
				$("#newid").val(getSelRadioValue("ztName"));
				if($("#newid").val()==""){
					alert("请选择状态。");
					return;
				}
				$("#assignForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
			}
		}
	});
	$( "#xuejiDialog" ).dialog({
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				$("#reasonid").val($("#xjreason").val());
				$("#changeDateid").val($("#xjChangedtime").val());
				$("#newid").val(getSelRadioValue("xjName"));
				if($("#newid").val()==""){
					alert("请选择学籍。");
					return;
				}
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
	
	//打开高级查询页面
	$("#advancedDialogButton").click(function(){
		window.location.replace("open_moreSearchPage.do");
	});
});

</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">
<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c0147149d9a760002</s:param>
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
<div class="panelBox buttonBox" style="padding-bottom:10px; padding-left:3px;" >
<button class="green"  id="zhuceButton">注册</button>
<button class="green"  id="editButton">编辑</button>
<button class="green"  id="ztButton">改变学生状态</button>
<button class="green"  id="xjButton">改变学籍状态</button>
<button class="green"  id="gsButton">改变航空公司</button>
<button class="green"  id="importButton">批量导入学生信息</button>
</div></s:if>
<div class="panelBox buttonBox" >
<s:include value="../student/banner.jsp" />
<div class="dropDownList barMiddle">
<s:set name="eisAssignid" value="isAssignid"/>
<s:if test="isAssignid==null || isAssignid==''"><s:set name="eisAssignid" value="1"></s:set></s:if>
<button>性别</button><span class="bar"></span>
<ul>
<li><a href="?year=${year}&classNo=${classNo}&isAssignid=1&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="1"><span class="ui-icon ui-icon-bullet"></span>性别</a></li>
<li><a href="?year=${year}&classNo=${classNo}&isAssignid=4&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="4">男</a></li>
<li><a href="?year=${year}&classNo=${classNo}&isAssignid=5&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="5">女</a></li>
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

	
        <table class="fcolorTable" id="usersTable" style="width:1770px;" border="1" cellspacing="0" cellpadding="3">
        	<thead>
			  <tr>
                <th class="thSortableGray" width="30"><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
                <th class="thSortableGray" width="80">学号</th>
                <th class="thSortableGray" width="65">姓名</th>
				<th class="thSortableGray" width="65">班级</th>
                <th class="thSortableGray" width="40">性别</th>
                <th class="thSortableGray" width="80">学员类型</th>
                <th class="thSortableGray" width="90">所属公司</th>
                <th class="thSortableGray" width="90">学生状态</th>
                <th class="thSortableGray" width="90">学籍状态</th>
                <th class="thSortableGray" width="80">招生形式</th>
                <th class="thSortableGray" width="80">自费/公费</th>
				<th class="thSortableGray" width="140">身份证</th>
				<th class="thSortableGray" width="60">籍贯</th>
				<th class="thSortableGray" width="100">电话</th>
                <th class="thSortableGray" width="160">地址</th>
				<th class="thSortableGray" width="60">民族</th>
				<th class="thSortableGray" width="60">文化程度</th>
				<th class="thSortableGray" width="60">政治面貌</th>
				<th class="thSortableGray" width="100">毕业院校</th>
				<th class="thSortableGray" width="60">英语水平</th>
				<th class="thSortableGray" width="60">专业</th>
				<th class="thSortableGray" width="60">学历性质</th>
				<th class="thSortableGray" width="60">学习类型</th>
			  </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
   
			  <tr>
              	<td align="center"><input name="checkboxName" type="checkbox" value="${VId}"  <s:if test='selIds!=null && selIds.indexOf(VId)!=-1'>checked="checked"</s:if>><b></b></td>
				<td >${VCode}</td>
				<td>${VName}</td>
				<td>${VClassNoid}</td>
				<td>${VGender}</td>
                <td>${stuTypeName}</td>
                <td>${companyName}</td>
                <td>${stuStatusName}</td>
                <td>${xjStatusName}</td>
                <td>${formName}</td>
                <td>${freeTypeName}</td>
				<td>${VCardid}</td>
				<td>${jg}</td>
				<td>${lxfs}</td>
				<td>${jtzz}
                <!--<s:if test="#r==null || #r==0"><span class="hide"><button class="icon"  icon="ui-icon-pencil" title="编辑" id="0,${VId}"></button></span></s:if>
                <button class="icon" icon="ui-icon-trash" title="删除"  id="1,${VId}"></button>--></td>
				<td>${nation}</td>
				<td>${whcd}</td>
				<td>${zzmm}</td>
				<td>${byyx}</td>
				<td>${enLevel}</td>
				
				<td>${zy}</td>
				<td>${xlxz}</td>
				<td>${xxlx}</td>				
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
				<td>&nbsp;</td>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
				<td>&nbsp;</td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
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

<div id="statusDialog"  title="改变学生状态">
<fieldset><br><input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>
选择状态：
<span class="panelLine"></span>
<s:iterator value="dictionStatusList">
<a href="#N" class="inline" style="width:100px; border:0; line-height:28px;"><input name="ztName" type="radio" value="${VId}"><b></b>${VName}</a>
</s:iterator>
<span class="panelLine"></span>
改变日期： 
<input type="text"  id="ztChangedtime" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDChangedtime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" />
<span class="panelLine"></span>
改变原因： 
<input type="text"  id="ztreason" class="text ui-widget-content ui-corner-all" style="width:240px;" />

</fieldset>
</div>

<div id="xuejiDialog"  title="改变学籍状态">
<fieldset><br><input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>
选择状态：
<span class="panelLine"></span>
<s:iterator value="dictionXjList">
<a href="#N" class="inline" style="width:100px; border:0; line-height:28px;"><input name="xjName" type="radio" value="${VId}"><b></b>${VName}</a>
</s:iterator>
<span class="panelLine"></span>
改变日期： 
<input type="text"  id="xjChangedtime" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDChangedtime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" />
<span class="panelLine"></span>
改变原因： 
<input type="text"  id="xjreason" class="text ui-widget-content ui-corner-all" style="width:240px;" />
</fieldset>
</div>

<div id="gongsiDialog"  title="改变航空公司">
<div style="padding-left:20px;"><br><input type="text" name="cfocusn" style="width:0px; height:0px; border:0px;"/>
公司列表：
<span class="panelLine"></span>
<s:iterator value="dictionCompanyList">
<a href="#N" class="inline" style="width:100px; border:0; line-height:28px;"><input name="gsName" type="radio" value="${VId}"><b></b>${VName}</a>
</s:iterator>
<span class="panelLine"></span>
改变日期： 
<input type="text"  id="gsChangedtime" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDChangedtime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" />
<span class="panelLine"></span>
改变原因： 
<input type="text"  id="gsreason" class="text ui-widget-content ui-corner-all" style="width:400px;" />
</div>
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

<form  action="?" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey" value="${name}">

<input name="xstuTypeid" type="hidden" value="${xstuTypeid}">
<input name="xcompanyid" type="hidden" value="${xcompanyid}">
<input name="xstatusid" type="hidden" value="${xstatusid}">
<input name="xxjstatusid" type="hidden" value="${xxjstatusid}">
<input name="xformid" type="hidden" value="${xformid}">
<input name="xfreetypeid" type="hidden" value="${xfreetypeid}">
<input name="isAssignid" type="hidden" value="${isAssignid}">
<input name="itype" type="hidden" value="${itype}">
</form>


<input type="hidden"  name="selIds" value="${selIds}" id="selSid">
<input type="hidden" id="selectStudentNameAndCode">
<%@ include file="../../result.jsp"%>

<form action="saveChangeStudentCommpany.do" method="post" id="assignForm">
<input type="hidden" name="ids" id="studentid">
<input type="hidden" name="changeDate" id="changeDateid">
<input type="hidden" name="newid" id="newid">
<input type="hidden" name="changeReason" id="reasonid">
<input type="hidden" name="opt" id="optid">
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

	$("#modalDialogButton4").click(function(){//查询
		if($("#searchOutlineName").val()=="学号/姓名"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($.trim($("#searchOutlineName").val()));
		}
		$( "#searchForm" ).submit();
	});

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