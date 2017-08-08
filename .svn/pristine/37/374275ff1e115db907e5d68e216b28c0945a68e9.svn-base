<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>推荐考试</title>
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
	$("div.dropDownList").each(function(i){
		if(i==0){var d=new $.dropDownList(i,true,140);d.button.css("width", "65px");}
		else if(i==1){var d=new $.dropDownList(i,true,85);d.button.css("width", "85px");}
		else if(i==2){var d=new $.dropDownList(i,true,90);d.button.css("width", "85px");}
		else if(i==3){var d=new $.dropDownList(i,true,335);d.button.css("width", "110px");}
		else if(i==4){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==5){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==6){var d=new $.dropDownList(i,true,90);d.button.css("width", "85px");}
		else if(i==7){var d=new $.dropDownList(i,true,90);d.button.css("width", "90px");}
		else if(i==8){var d=new $.dropDownList(i,false,250);d.button.css("width", "70px");}
		
		else if(i==9){var d=new $.dropDownList(i,true,110);d.button.css("width", "110px");}
		else if(i==10){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==11){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==12){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==13){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==14){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
			
		else{new $.dropDownList(i,true,90);}

	});
	$("#tuijianButton").click(function(){
		var ids = $("#selSid").val();
		if(ids==""){
			alert("请选择学生。");
			return;
		}

		var str="";
		var cn = "";
		var flag=0;
		var r1=ids.split(",");
		for(i=0;i<r1.length-1;i++){
			str+=r1[i].split(";")[0] + ",";
			cn+=r1[i].split(";")[1]+";" + r1[i].split(";")[2] + ",";
			if(r1[i].split(";")[3]==1){
				flag++;	
			}
		}
		//if(flag>0){
		//	$("#dialogForm3Warning").html("所选学生中有已推荐的学生，请重新选择。");
		//	$( "#dialogForm3" ).dialog( "open" );
		//	return;	
		//}
		if(str==""){
			$("#dialogForm3Warning").html("请选择学员。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		
		var content = "";
		var stus = cn.split(",");
		for(j=0;j<stus.length-1;j++){
			content+="<a href=\"#N\" class=\"inline\" title=\"学号："+stus[j].split(";")[0]+
			"\" style=\"width: 60px; border:0\">"+ stus[j].split(";")[1] + "</a>";
		}

		$("#selectStudentNameAndCodeid").html(content);
		$("#studentids").val(str);
		
		$( "#tuijianDialog" ).dialog("open");
	});
	$( "#tuijianDialog" ).dialog({
		autoOpen: false,
		height: 480,
		width: 480,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#DTjexamdate").val($("#cDReportdate").val());
				if($("#DTjexamdate").val()==""){
					alert("推荐日期不能为空。");
					return;
				}
				$("#slessonid").val(getSelRadioValue('lessonRadioName'));
				if($("#slessonid").val()==""){
					alert("请选择推荐课程。");
					return;
				}
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
<button class="green"  id="tuijianButton">推荐</button>
</div></s:if>
<div class="panelBox buttonBox" >
<s:include value="../student/banner.jsp" />
<div class="dropDownList barMiddle">
        <s:set name="eisAssignid" value="isAssignid"/>
        <s:if test="isAssignid==null || isAssignid==''"><s:set name="eisAssignid" value="1"></s:set></s:if>
        <button>更多</button><span class="bar"></span>
        <ul>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=1&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="1"><span class="ui-icon ui-icon-bullet"></span>更多</a></li>
             <s:iterator value="trainingClassList">
<li><a href="?year=${year}&classNo=${classNo}&isAssignid=${VId}&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}&itype=${itype}" val="${VId}">${VName}</a></li>
</s:iterator>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=4&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="4">合格</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=5&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="5">不合格</a></li>
             <li><a href="?year=${year}&classNo=${classNo}&isAssignid=7&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="7">已推荐</a></li>
              <li><a href="?year=${year}&classNo=${classNo}&isAssignid=8&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="8">未推荐</a></li>
            <li><a href="?isAssignid=6"  val="6">全部</a></li>
        </ul><input type="hidden"  id="cxmoreid" value='<s:property value="#eisAssignid" />'/>
    </div>
 	<button class="normal barRight" id="advancedDialogButton">高级查询</button>
     <div class="buttonInput relative left" width="160" height="28">
    <input id="searchOutlineName" title="学号/姓名"  name="searchOutlineName"  type="text" maxlength="50" value="学号/姓名" /><button id="modalDialogButton4">查询</button>
    </div>

</div>
<s:include value="../student/advancedSearchDialog.jsp" />
<div class="Panel ui-corner-all-0" id="Panel2" >
<div class="panelContent">
        <table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
        	<thead>
             	<tr class="trSpliter">
				<th width="40"></th>
				<th width="80"></th><s:set name="isize" value="lessonList.size()"/>
				 <s:iterator begin="0" end="#isize-1">
				<th width="80"></th>
				</s:iterator>
                <th width="60"></th>
                <th width="60"></th>
                <th width="100"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortableGray" ><input id="checkAllUsersBox" type="checkbox"/><b></b></th>
                <th class="thSortableGray" style="white-space:nowrap;">学号</th>
                <th class="thSortableGray" style="white-space:nowrap;">姓名</th>
                <s:iterator value="lessonList"><th class="thSortableGray" style="white-space:nowrap;">${VLessonName}</th></s:iterator>
                <th class="thSortableGray" style="white-space:nowrap;">合格</th>
                 <th class="thSortableGray" style="white-space:nowrap;">推荐考试日期</th>
                 <th class="thSortableGray" style="white-space:nowrap;">考试科目</th>
			  </tr>   
			</thead>
			<tbody> 
            <s:set name="flag" value="0"/>
            <s:iterator value="page.data" status="stat">
            <s:set name="hege" value="0"/>
			  <tr>
              	<td><input name="checkboxName" type="checkbox" value="${VId};${VCode};${VName};${tuijian}"  <s:if test='selIds!=null && selIds.indexOf(VId)!=-1'>checked="checked"</s:if>><b></b></td>
				<td >${VCode}</td>
				<td>${VName}</td>
				<s:iterator value="lessonList">
                <s:set name="clessonid" value="VId"/>
                <td style="padding-left:20px;">
                <s:iterator value="scoreList">
                <s:if test='#clessonid==lessonid'>
                <s:if test='DScore!=null'>
                <s:if test='IPass==1'><s:set name="hege" value="1"/>
                	<font color="#FF0000"><s:text name="format.number2"><s:param value="DScore"/></s:text></font>
                </s:if>
                <s:else><s:set name="hege" value="2"/>
                	<s:text name="format.number2"><s:param value="DScore"/></s:text>
           		</s:else>
                </s:if></s:if>
                </s:iterator>
                </td>
                </s:iterator>
				<td><s:if test='#hege==2'><font color="#50A13B">是</font></s:if><s:else>否</s:else></td>
                <td><s:iterator value="recomlist">
                <s:date name="DExamDate" format="yyyy-MM-dd" /></br>
                </s:iterator>
                </td>
                <td><s:iterator value="recomlist">
                 ${TLesson.VLessonName}</br>
                </s:iterator></td>
			  </tr>
              </s:iterator>
             <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
				<s:iterator value="lessonList"><td>&nbsp;</td></s:iterator>
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
<div id="tuijianDialog"  title="推荐考试">

	<div style="line-height:30px; float: left; padding-left:24px;">已选学员：<input type="text" name="vfocusn" style="width:0px; height:0px; border:0px;"/></div>
	<div style="line-height:30px; margin-left:60px;" id="selectStudentNameAndCodeid"></div>
    <span class="panelLine"></span>
    <div style="line-height:30px; float: left; padding-left:24px;">考试科目：</div>
    <s:iterator value="jflessonList">
<div style="width:120px; float:left;line-height:28px;"><input name="lessonRadioName" type="radio" value="${VId}"/><b></b>${VLessonName}</div>
</s:iterator>
 <span class="panelLine"></span>
	推荐考试日期： <input type="text"  id="cDReportdate" class="Wdate ui-widget-content ui-corner-all text"  style="width:100px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({cDReportdate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" onKeyPress="return false" onpaste="return false" />
</div>
<form method="post" action="saveSutdentLicenseExam.do" id="assignForm">
<input type="hidden"  name="recommend.DExamDate" id="DTjexamdate">
<input type="hidden"  name="recommend.VId" id="studentids">
<input type="hidden"  name="recommend.TLesson.VId" id="slessonid">
</form>
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