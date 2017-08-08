<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>国内送培</title>
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
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		var d=new $.dropDownList(i,true,110);d.button.css("width", "110px");
		
	});
	$("#songpeiButton").click(function(){
		var ids = $("#selSid").val();
		if(ids==""){
			alert("请选择学生。");
			return;
		}
		$("#VIds").val(ids);
		$("#stuStatusName").val(3);
		$( "#dialogForm2" ).dialog("open");
	});

	$("#modalDialogButton4").click(function(){//查询
		if($("#searchOutlineName").val()=="学号/姓名"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($.trim($("#searchOutlineName").val()));
		}
		$( "#searchForm" ).submit();
	});
	
	$( "#dialogForm2" ).dialog({
		autoOpen: false,
		height: 480,
		width: 500,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var zt = $("#VComment").val();
				if(zt==""){
					alert("请输入出发信息。");
					return;
				}
				$("#createTime").val($("#cDChangestatustime").val());
				$("#stuTypeName").val(zt);
				$("#changeForm").submit();
			},
			"取 消": function() {
				$( this ).dialog( "close" );
				return;
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
			//	$("#changeForm").submit();
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
</s:else><s:if test="#r==null || #r==0">
<div class="panelBox buttonBox" style="padding-bottom:10px; padding-left:3px;" >
<button class="green"  id="songpeiButton">送培出发</button>
</div></s:if>
<div class="panelBox buttonBox" >
<div class="dropDownList barLeft">
<button>雅思成绩</button><span class="bar"></span>
<ul>
<li><a href="?ysipass=&xkipass=${xkipass}&cjaudit=${cjaudit}&staudit=${staudit}&bxaudit=${bxaudit}" val=""><span class="ui-icon ui-icon-bullet"></span>雅思成绩</a></li>
<li><a href="?ysipass=0&xkipass=${xkipass}&cjaudit=${cjaudit}&staudit=${staudit}&bxaudit=${bxaudit}" val="0">合格</a></li>
<li><a href="?ysipass=1&xkipass=${xkipass}&cjaudit=${cjaudit}&staudit=${staudit}&bxaudit=${bxaudit}" val="1">不合格</a></li>
</ul>
<input type="hidden"  id="ysipass" value="${ysipass}"/>
</div>
<div class="dropDownList barMiddle">
<button>国外航校面试</button><span class="bar"></span>
<ul>
<li><a href="?xkipass=&ysipass=${ysipass}&cjaudit=${cjaudit}&staudit=${staudit}&bxaudit=${bxaudit}" val=""><span class="ui-icon ui-icon-bullet"></span>国外航校面试</a></li>
<li><a href="?xkipass=0&ysipass=${ysipass}&cjaudit=${cjaudit}&staudit=${staudit}&bxaudit=${bxaudit}" val="0">合格</a></li>
<li><a href="?xkipass=1&ysipass=${ysipass}&cjaudit=${cjaudit}&staudit=${staudit}&bxaudit=${bxaudit}" val="1">不合格</a></li>
</ul>
<input type="hidden"  id="xkipass" value="${xkipass}"/>
</div>

<div class="dropDownList  barMiddle">
<button>成绩审查</button><span class="bar"></span>
<ul>
<li><a href="?cjaudit=&xkipass=${xkipass}&jfipass=${jfipass}&ysipass=${ysipass}&staudit=${staudit}&bxaudit=${bxaudit}" val=""><span class="ui-icon ui-icon-bullet"></span>成绩审查</a></li>
<li><a href="?cjaudit=0&xkipass=${xkipass}&ysipass=${ysipass}&staudit=${staudit}&bxaudit=${bxaudit}" val="0">合格</a></li>
<li><a href="?cjaudit=1&xkipass=${xkipass}&ysipass=${ysipass}&staudit=${staudit}&bxaudit=${bxaudit}" val="1">不合格</a></li>
<li><a href="?cjaudit=2&xkipass=${xkipass}&ysipass=${ysipass}&staudit=${staudit}&bxaudit=${bxaudit}" val="2">暂不合格</a></li>
<li><a href="?cjaudit=3&xkipass=${xkipass}&ysipass=${ysipass}&staudit=${staudit}&bxaudit=${bxaudit}" val="3">未审查</a></li>
</ul>
<input type="hidden"  id="cjaudit" value="${cjaudit}"/>
</div>
<div class="dropDownList  barMiddle">
<button>身体审查</button><span class="bar"></span>
<ul>
<li><a href="?staudit=&xkipass=${xkipass}&cjaudit=${cjaudit}&ysipass=${ysipass}&bxaudit=${bxaudit}" val=""><span class="ui-icon ui-icon-bullet"></span>身体审查</a></li>
<li><a href="?staudit=0&xkipass=${xkipass}&cjaudit=${cjaudit}&ysipass=${ysipass}&bxaudit=${bxaudit}" val="0">合格</a></li>
<li><a href="?staudit=1&xkipass=${xkipass}&cjaudit=${cjaudit}&ysipass=${ysipass}&bxaudit=${bxaudit}" val="1">不合格</a></li>
<li><a href="?staudit=2&xkipass=${xkipass}&cjaudit=${cjaudit}&ysipass=${ysipass}&bxaudit=${bxaudit}" val="2">暂不合格</a></li>
<li><a href="?staudit=3&xkipass=${xkipass}&cjaudit=${cjaudit}&ysipass=${ysipass}&bxaudit=${bxaudit}" val="3">未审查</a></li>
</ul>
<input type="hidden"  id="staudit" value="${staudit}"/>
</div>
<div class="dropDownList  barMiddle">
<button>在校表现审查</button><span class="bar"></span>
<ul>
<li><a href="?bxaudit=&xkipass=${xkipass}&cjaudit=${cjaudit}&staudit=${staudit}&ysipass=${ysipass}" val=""><span class="ui-icon ui-icon-bullet"></span>在校表现审查</a></li>
<li><a href="?bxaudit=0&xkipass=${xkipass}&cjaudit=${cjaudit}&staudit=${staudit}&ysipass=${ysipass}" val="0">合格</a></li>
<li><a href="?bxaudit=1&xkipass=${xkipass}&cjaudit=${cjaudit}&staudit=${staudit}&ysipass=${ysipass}" val="1">不合格</a></li>
<li><a href="?bxaudit=2&xkipass=${xkipass}&cjaudit=${cjaudit}&staudit=${staudit}&ysipass=${ysipass}" val="2">暂不合格</a></li>
<li><a href="?bxaudit=3&xkipass=${xkipass}&cjaudit=${cjaudit}&staudit=${staudit}&ysipass=${ysipass}" val="3">未审查</a></li>
</ul>
<input type="hidden"  id="bxaudit" value="${bxaudit}"/>
</div>
<div class="dropDownList  barRight">
<button>所有项</button><span class="bar"></span>
<ul>
<li><a href="?allpass=" val=""><span class="ui-icon ui-icon-bullet"></span>所有项</a></li>
<li><a href="?allpass=0" val="0">合格</a></li>
<li><a href="?allpass=1" val="1">不合格</a></li>

</ul>
<input type="hidden"  id="allpass" value="${allpass}"/>
</div>
<div class="buttonInput relative left" width="160" height="28">
    <input id="searchOutlineName" title="学号/姓名"  name="searchOutlineName"  type="text" maxlength="50" value="学号/姓名" /><button id="modalDialogButton4">查询</button>

    </div>
</div>

<div class="Panel ui-corner-all-0" id="Panel2" >
	<div class="panelContent">

      <table id="usersTable" class="colorTable"  border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3" >
        <thead>
            <tr>
            <th width="22" rowspan="3"><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
            <th width="70" rowspan="3">学号</th>
            <th width="40" rowspan="3">姓名</th>
            <th  colspan="3" rowspan="2">国外航校面试</th>
            <s:set name="yssum" value="lessonList.size()"/>
            <th colspan="${yssum}" rowspan="2">雅思成绩</th>
            <th colspan="3">审查</th>
          </tr>
          <tr>
            <th width="50" rowspan="2">成绩</th>
            <th width="50" rowspan="2">身体</th>
            <th width="50" rowspan="2">在校表现</th>
          </tr>
          <tr>
            <th width="90" align="center">面试航校</th>
            <th width="50" align="center">是否合格</th>
            <th width="90" align="center">面试日期</th>
          <s:iterator value="lessonList">
            <th  align="center">${VLessonName}</th>
            </s:iterator>
          </tr>
          </thead>
        <tbody>
        <s:iterator value="page.data" status="stat">

          <tr class="normal">
            <td><input name="checkboxName" type="checkbox" value="${VId};${VCode};${VName}"  <s:if test='selIds!=null && selIds.indexOf(VId)!=-1'>checked="checked"</s:if>><b></b></td>
            <td >${VCode}</td>
            <td>${VName}</td>
            <td  align="center">${companyName}</td>
            <td  align="center">${jg}</td>
            <td  align="center">${createTime}</td>
            <s:iterator value="lessonList"><s:set name="ysid" value="VId"/>
            <td  align="center"><s:iterator value="stuClassList"><s:if test='#ysid==VId'>${classid}</s:if></s:iterator></td>
			</s:iterator>

            <td align="center">${zy}</td>
            <td align="center">${syd}</td>
            <td align="center">${xxlx}</td>
            
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
            <s:iterator value="lessonList">
              <td>&nbsp;</td>
            </s:iterator>
          
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
<div id="dialogForm2" title="国外送培出发">

<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td align="center">出发信息：</td>
<td><textarea  id="VComment" style="width:330px;height:300px;" class="text ui-widget-content ui-corner-all"></textarea></td>
</tr>
<tr>
<td width="20%" height="40" align="center">出发日期：</td>
<td width="80%"><input type="text"  id="cDChangestatustime" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDChangestatustime:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" /></td>
</tr>

</table>

</div>

<form  action="?" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey" value="${name}">
<input name="staudit" type="hidden" value="${staudit}">
<input name="ysipass" type="hidden" value="${ysipass}">
<input name="xkipass" type="hidden" value="${xkipass}">
<input name="cjaudit" type="hidden" value="${cjaudit}">
<input name="bxaudit" type="hidden" value="${bxaudit}">
</form>

<form action="saveChangeStudentStatus.do" method="post" id="changeForm">
<input type="hidden"  name="vstudentBaseInfo.VId" id="VIds">
<input type="hidden"  name="vstudentBaseInfo.stuStatusName" id="stuStatusName">
<input type="hidden"  name="vstudentBaseInfo.stuTypeName" id="stuTypeName">
<input type="hidden"  name="vstudentBaseInfo.createTime" id="createTime">
</form>
<input type="hidden"  name="selIds" value="${selIds}" id="selSid">
<input type="hidden" id="selectStudentNameAndCode">
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