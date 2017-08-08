<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>毕业</title>
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
		else if(i==8){var d=new $.dropDownList(i,false,110);d.button.css("width", "75px");}
		
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

	$("#bisheButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#studentid").val($("#selSid").val());
		$("#addLessonForm").submit();
	});
	$("#lingzhengButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#lingZhengstudentid").val($("#selSid").val());
		$("#lingZhengForm").submit();
	});
	$("#fenpeiButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#fenpeistudentid").val($("#selSid").val());
		$("#fenpeiForm").submit();
	});
	$("#lixiaoButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}

		$("#lixiaostudentid").val($("#selSid").val());
		$("#lixiaoForm").submit();
	});
	$("#peixunButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#peixunstudentid").val($("#selSid").val());
		$("#peixunForm").submit();
	});
	$("#xunlianButton").click(function(){
		if($("#selSid").val()==""){
			alert("请选择学生。");
			return;
		}
		$("#xunlianstudentid").val($("#selSid").val());
		$("#xunlianForm").submit();
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
<button class="green"  id="bisheButton">确认毕设</button>
<button class="green"  id="lingzhengButton">领毕业证</button>
<button class="green"  id="fenpeiButton">毕业分配</button>
<button class="green"  id="lixiaoButton">毕业离校</button>
<button class="green"  id="peixunButton">新雇员培训成绩</button>
<button class="green"  id="xunlianButton">改装训练成绩</button>
</div></s:if>
<div class="panelBox buttonBox" >
<s:include value="../student/banner.jsp" />

<div class="dropDownList barMiddle">
        <s:set name="eisAssignid" value="isAssignid"/>
        <s:if test="isAssignid==null || isAssignid==''"><s:set name="eisAssignid" value="1"></s:set></s:if>
        <button>更多</button><span class="bar"></span>
        <ul>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=1&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="1"><span class="ui-icon ui-icon-bullet"></span>更多</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=4&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="4">证齐</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=5&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="5">毕业设计合格</a></li>
             <li><a href="?year=${year}&classNo=${classNo}&isAssignid=7&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="7">领毕业证</a></li>
              <li><a href="?year=${year}&classNo=${classNo}&isAssignid=8&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="8">满足毕业条件</a></li>
              <li><a href="?year=${year}&classNo=${classNo}&isAssignid=9&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="9">毕业已分配</a></li>
              <li><a href="?year=${year}&classNo=${classNo}&isAssignid=10&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="10">毕业未分配</a></li>
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
            <th width="90"></th>
            <th width="70"></th>
            <th width="90"></th>
            <th width="90"></th>
            <th width="70"></th>
            <th width="80"></th>
            <th width="100"></th>
            <th width="80"></th>
            <th width="90"></th>
            <th width="70"></th>
             <th width="70"></th>
            <th></th>
          </tr>
          <tr>
            <th class="thSortableGray" ><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
            <th class="thSortableGray" >学号</th>
            <th class="thSortableGray" >姓名</th>
            <th class="thSortableGray" >所属公司</th>
            <th class="thSortableGray" >学生状态</th>
            <th class="thSortableGray" >证齐</th>
            <th class="thSortableGray" >毕业设计</th>
            <th class="thSortableGray" >毕设确认日期</th>
            <th class="thSortableGray" >领毕业证</th>
            <th class="thSortableGray" >领证日期</th>
            <th class="thSortableGray" >毕业分配</th>
            <th class="thSortableGray" >新雇成绩</th>
            <th class="thSortableGray" >改装成绩</th>
          </tr>   
        </thead>
        <tbody>
        
        <s:iterator value="page.data" status="stat">

          <tr>
            <td><input name="checkboxName" type="checkbox" value="${VId};${VCode};${VName};${outlineid}"  <s:if test='selIds!=null && selIds.indexOf(VId)!=-1'>checked="checked"</s:if>><b></b></td>
            <td >${VCode}</td>
            <td>${VName}</td>
            <td>${companyName}</td>
            <td>${stuStatusName}</td>
            <td><s:if test='VSyd==0'>是</s:if><s:else>否</s:else></td>
            <td><s:if test="byyx==''"></s:if><s:else><s:if test="byyx==0">合格</s:if><s:if test="byyx==1">不合格</s:if></s:else></td>
 			<td>${zy}</td>
  			<td><s:if test="syd==''"></s:if><s:else><s:if test="syd==0">已领</s:if><s:if test="syd==1">未领</s:if></s:else></td>
            <td>${jtzz}</td>
            <td><s:if test="jg==0">已分</s:if></td>
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

<form  action="open_confirmBiShe.do" method="post" id="addLessonForm">
<input name="ids" type="hidden" id="studentid">
</form>
<form  action="open_lingZheng.do" method="post" id="lingZhengForm">
<input name="ids" type="hidden" id="lingZhengstudentid">
</form>
<form  action="open_biyepeixun.do" method="post" id="peixunForm">
<input name="ids" type="hidden" id="peixunstudentid">
</form>

<form  action="open_biyexunlian.do" method="post" id="xunlianForm">
<input name="ids" type="hidden" id="xunlianstudentid">
</form>

<form  action="open_biyelixiao.do" method="post" id="lixiaoForm">
<input name="ids" type="hidden" id="lixiaostudentid">
</form>

<form  action="open_biyefenpei.do" method="post" id="fenpeiForm">
<input name="ids" type="hidden" id="fenpeistudentid">
</form>
<s:include value="../student/advancedSearchDialog.jsp" />
<input type="hidden"  name="selIds" value="${selIds}" id="selSid">
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