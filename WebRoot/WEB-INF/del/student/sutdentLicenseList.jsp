<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>执照管理</title>
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
	$("div.dropDownList").find("button").css("width","85px").end().each(function(i){
		if(i==0){var d=new $.dropDownList(i,true,140);d.button.css("width", "65px");}
		else if(i==1){var d=new $.dropDownList(i,true,85);d.button.css("width", "85px");}
		else if(i==3){var d=new $.dropDownList(i,true,335);d.button.css("width", "110px");}
		else if(i==4){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==5){var d=new $.dropDownList(i,true,240);d.button.css("width", "100px");}
		else if(i==7){var d=new $.dropDownList(i,true,90);d.button.css("width", "90px");}
		else if(i==8){var d=new $.dropDownList(i,true,90);d.button.css("width", "90px");}
		
		else if(i==9){var d=new $.dropDownList(i,true,110);d.button.css("width", "110px");}
		else if(i==10){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==11){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==12){var d=new $.dropDownList(i,false,335);d.button.css("width", "110px");}
		else if(i==13){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==14){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		else if(i==15){var d=new $.dropDownList(i,false,110);d.button.css("width", "110px");}
		
		else{new $.dropDownList(i,true,90);}

	});

	$("#addButton").click(function(){
		var id = getSelRadioValue('checkboxName');
		if(id==""){
			alert("请选择学生。");
			return;
		}
		if(id.split(",")[5]==1){
			alert("所选学生已经有执照，不能再添加执照。");
			return;
		}
		$("#studentid").val(id);
		$("#addLessonForm").submit();
	});
	
	$("#upButton").click(function(){
		var id = getSelRadioValue('checkboxName');
		if(id==""){
			alert("请选择学生。");
			return;
		}
		if(id.split(",")[5]==0){
			alert("所选学生没有执照，不能升级执照。");
			return;
		}
		window.location.replace("open_upSutdentLicense.do?id="+id.split(",")[0] + "&itype=up");
	});
	
	$("#historyButton").click(function(){
		var id = getSelRadioValue('checkboxName');
		if(id==""){
			alert("请选择学生。");
			return;
		}

		window.location.replace("showLicenseStudentById.do?id="+id.split(",")[0]);
	});
	$("button.icon").click(function(){
		window.location.replace("open_upSutdentLicense.do?id="+this.id + "&itype=edit");
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
	$( "#dialogContent" ).dialog({//内容窗口
		autoOpen: false,
		height: 490,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$( this ).dialog( "close" );
			}
		}
	});
	
});
function viewContent(id,used){

	if(id==""){
		return;	
	}

	params = {"id":id,"itype":used};
	$.ajax({
		type:"post",
		url:"showStudentLicenseDetail.do",
		data:params,
		dataType:"json",
		success:function(data){
	
			if(data==null){
				$("#dialogForm3Warning").html("获取信息失败，信息不存在。");
				$( "#dialogForm3" ).dialog( "open" );
				return;
			}
			$("#contentid").html(getContent(data));
			$("#dialogContent").dialog('option', 'title',  "所选学员："+data.VName);
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

	content+="<tr>";
	content+="<td width='80'>姓名：</td>";
	content+="<td width='140' height=\"24\">"+data.VName+"</td>";
	content+="<td width='80'>学号：</td>";
	content+="<td width='140' height=\"24\">"+data.VCode+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	
	content+="<tr>";
	content+="<td>签发单位：</td>";
	content+="<td height=\"24\">"+data.VCompany+"</td>";
	content+="<td>执照编号：</td>";
	content+="<td height=\"24\">"+data.VCardid+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>签发日期：</td>";
	content+="<td height=\"24\">"+data.DIssuetime+"</td>";
	content+="<td>有效期：</td>";
	content+="<td height=\"24\">"+data.DEffectdate+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>局长授权签发：</td>";
	content+="<td height=\"24\">"+data.VIssuer+"</td>";
	content+="<td>更新日期：</td>";
	content+="<td height=\"24\">"+data.DUpdatedate+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>学员执照类型：</td>";
	content+="<td height=\"24\">"+data.ILevel+"</td>";
	content+="<td>是否监控：</td>";
	content+="<td height=\"24\">"+data.VBeizhu+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>执照性质：</td>";
	content+="<td height=\"24\">"+data.VZhizhaoxingzhi+"</td>";
	content+="<td>航空器类别：</td>";
	content+="<td height=\"24\">"+data.VHangkongqileibie+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>仪表等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VZhizhaodengji+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td>飞机级别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VFeijijibie+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"
	content+="<tr>";
	content+="<td>旋翼机级别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VXuanzhuanjijibie+"</td>";
	content+="</tr>"
	
	content+="<tr>";
	content+="<td colspan=\"4\"><span class=\"panelLine\"></span></td>";
	content+="</tr>"

	content+="<tr>";
	content+="<td>航空器型别等级：</td>";
	content+="<td colspan=\"3\" height=\"24\">"+data.VHkqdj+"</td>";
	content+="</tr>"

	return content;
}

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
<button class="green"  id="addButton">添加执照信息</button>
<button class="green"  id="upButton">升级执照</button>
<button class="green"  id="historyButton">历史执照</button>
</div></s:if>
<div class="panelBox buttonBox" >
<s:include value="../student/banner.jsp" />
<div class="dropDownList barMiddle">
        <s:set name="eisAssignid" value="isAssignid"/>
        <s:if test="isAssignid==null || isAssignid==''"><s:set name="eisAssignid" value="1"></s:set></s:if>
        <button>执照</button><span class="bar"></span>
        <ul>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=1&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="1"><span class="ui-icon ui-icon-bullet"></span>执照</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=2&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="2">有执照</a></li>
            <li><a href="?year=${year}&classNo=${classNo}&isAssignid=3&xstuTypeid=${xstuTypeid}&xcompanyid=${xcompanyid}&xstatusid=${xstatusid}&xxjstatusid=${xxjstatusid}&xformid=${xformid}&xfreetypeid=${xfreetypeid}&name=${name}" val="3">无执照</a></li>
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
				<th width="30"></th>
				<th width="90"></th>
				<th width="70"></th>
				<th width="190"></th>
				<th width="110"></th>
                <th width="110"></th>
                <th width="110"></th>
                <th width="110"></th>
                <th width="110"></th>
                <th></th>
			  </tr>
			  <tr>
                <th class="thSortableGray" ></th>
                <th class="thSortableGray" >&nbsp;学号</th>
                <th class="thSortableGray" >姓名</th>
                <th class="thSortableGray" >执照号</th>
                <th class="thSortableGray" >签发日期</th>
                <th class="thSortableGray" >到期日期</th>
                <th class="thSortableGray" >剩余有效期(天)</th>
                <th class="thSortableGray" >上次熟练检查日期</th>
                <th class="thSortableGray" >下次熟练检查日期</th>
                <th class="thSortableGray" ></th>
			  </tr>   
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
            <s:if test="createTime!=''"><s:set name="flag" value="1"/></s:if><s:else><s:set name="flag" value="0"/></s:else>
			  <tr>
              	<td><input name="checkboxName" type="radio" value="${VId},${VCode},${VName},${VCardid},${VGender},${flag}"><b></b></td>
				<td >${VCode}</td>
				<td>${VName}</td>
				<td><s:if test="createTime!=''"><a href="javascript:void(0)" onclick="viewContent('${userid}','0');" class="blue" title="点击显示执照内容"><img src="themes/cupertino/images/jiahao.gif">${VCardid}</a></s:if></td>
                <td>${createTime}</td>
                <td>${stuTypeName}</td>
                <td style="padding-left:20px;"><s:if test='iday<=31'><font color="#FF0000">${iday}</font></s:if>
                <s:if test='iday>31 && iday<=61'><font color="#EBA600">${iday}</font></s:if>
                <s:if test='iday>61 && iday<=90'><font color="#00A2BE">${iday}</font></s:if>
                 <s:if test='iday>90 && iday<1000'>${iday}</s:if>
                </td>
                <td>${companyName}</td>
                <td>${stuStatusName}</td>
				<td><s:if test="#r==null || #r==0"><s:if test='#flag==1'><span class="hide"><button class="icon" icon="ui-icon-pencil" title="编辑" id="${VId}"></button></s:if></s:if></td>
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
<div id="dialogContent"  title="查看学员执照信息">
	<table width="100%" border="0" cellpadding="0" cellspacing="2" style="line-height:20px;">
    <tbody id="contentid">
    </tbody>
    </table>
</div>
<s:include value="../student/advancedSearchDialog.jsp" />
<form  action="open_addSutdentLicense.do" method="post" id="addLessonForm">
<input name="id" type="hidden" id="studentid">
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