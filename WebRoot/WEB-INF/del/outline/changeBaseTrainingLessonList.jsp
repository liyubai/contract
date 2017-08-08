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
	$("#modalDialogButton1").click(function(){// 设置航线
		k=getSelValue('radioName');//获取课目id
		if(k==""){
			$("#dialogForm3Warning").html("请选择课目。");
			$( "#dialogForm3" ).dialog( "open" );
			return;
		}
		$("#lessonid").val(k);
		$( "#dialogForm2" ).dialog( "open" );
		
	});

	//删除转场航线
	$("img.imgs").click(function(){
		var id = this.id;
		if(id!=""){
			$("#deleteid").val(id);
			//if(confirm("确定删除该航线吗?")){
			//	window.location.href="deleteTrainingLessonChangeBaseLine.do?id=" + id;
			//}
			$( "#dialogForm4" ).dialog( "open" );
		}
	});
	$("#modalDialogButton4").click(function(){//查询
	
		if($("#searchUser").val()=="课目名称"){
			$("#searchKey").val("");
		}else{
			$("#searchKey").val($("#searchUser").val());
		}
		$( "#searchForm" ).submit();
	});

	$( "#dialogForm2" ).dialog({
		autoOpen: false,
		height: 400,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var radiov = getSelValue('lineName')
				if(radiov==""){
					$("#dialogForm3Warning").html("请选择航线。");
					$( "#dialogForm3" ).dialog( "open" );
					return;
				}
				$("#lineid").val(radiov);
				$("#saveForm").submit();
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
	$( "#dialogForm4" ).dialog({//删除内容窗口
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
});
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
<s:if test="#r==null || #r==0"><button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">设置转场航线</button></s:if>
    <div class="dropDownList"><button></button><span class="bar"></span>
    <ul>
    <s:iterator value="lessonSortList" status="statu">
    <li><a href="open_changeBasetrainingLessonList.do?unitid=${VId}" val="${VId}"><s:if test='#statu.index==0'><span class="ui-icon ui-icon-bullet"></span></s:if>${VName}</a>
    </li> 
    </s:iterator>
    </ul>
    <s:set name="selunitId" value="unitid"/>
    <s:if test="unitid==null || unitid==''">
    	<s:iterator value="lessonSortList"  begin="0" end="0">
    		<s:set name="selunitId" value="VId"></s:set>
        </s:iterator>
    </s:if>
    <input type="hidden" id="searchunitid" value='<s:property value="#selunitId"/>'/>
    </div>
    <div class="buttonInput relative left" width="180" height="28">
    <input title="课目名称" value="课目名称" id="searchUser" name="searchUser"  type="text" maxlength="50" /><button id="modalDialogButton4">查询</button>
    </div>
</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table id="usersTable" class="colorTable" border="1" bordercolor="#E0E0E0" cellspacing="0" cellpadding="3">
        	<thead>
			  <tr>
				<th width="58" rowspan="2">版本号</th>
				<th width="57" rowspan="2">课目编号</th>
				<th width="180" rowspan="2">课目名称</th>
				<th colspan="4">总训练时间</th>
                
				 <s:iterator value="orgList">
				<th colspan="${IStatus}">${message}</th>
				</s:iterator>
                
				<th rowspan="2"><div align="left">&nbsp;转场航线</div></th>
			  </tr>
			  <tr>
			    <th width="50">飞行训练</th>
			    <th width="50">训练器</th>
			    <th width="50">飞机</th>
                <th width="50">模拟机</th>
                 <s:iterator value="viewTimesubjectList">
			    <th width="40">${VName}</th>
                </s:iterator>
		      </tr>
			</thead>
			<tbody>
            <s:iterator value="page.data" status="stat">
			  <tr>
				<td><input name="radioName" type="radio" value="${trainingLseeson.VId}"><b></b>${trainingLseeson.VVersion}</td>
				<td>${trainingLseeson.VNo}</td>
				<td >${trainingLseeson.VName}</td>
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
				<td align="left">
                <s:iterator value="lessonchangedbaseflylineList">
                <div style="float:left; margin-left:5px; margin-right:5px;width:110px;"><nobr>${changedbaseflyline.stationByStartStationid.VName}&#8594;${changedbaseflyline.stationByEndStationId.VName}<nobr></div><div><s:if test="#r==null || #r==0"><a href="javascript:void(0)" ><img src="themes/cupertino/images/subfu.png" id="${VId}" title="删除" class="imgs" border="0" /></a></s:if></div>
                </s:iterator>
                </td>
			  </tr>
              </s:iterator>
             <s:iterator status="stat" value="(page.pageSize-page.data.size).{ #this }">
			  <tr>
				<tr>
              <s:iterator  begin="0" end="viewTimesubjectList.size()+7">
				<td>&nbsp;</td>
               </s:iterator>
			  </tr>
			  </tr>
              </s:iterator>
			</tbody>
		</table><s:include value="../common/pagination_system.jsp" />
</div>
</div>
</div>
</div>

<div id="dialogForm2"  title="转场航线列表">
     <fieldset>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
    <td height="24">选项</td>
    <td>始发站</td>
    <td >到达站</td>
    <td>航段里程(千米)</td>
    </tr>
    <s:iterator value="changedbaseflylineList" >
    <tr>
    <td  height="24"><input type="radio" name="lineName" value="${VId}"/><b></b></td>
    <td  height="24">${stationByStartStationid.VName}</td>
    <td  height="24">${stationByEndStationId.VName}</td>
    <td  height="24"><s:text name="format.number2"><s:param value="DCourse"/></s:text></td>
    </s:iterator>
    <tr>
    </table>
 </fieldset>
</div>

<div id="dialogForm3">
	<fieldset>
		<table width="100%" border="0" align="center">
  <tr>
    <td align="right" height="90"><img src="themes/cupertino/images/warning.png" /></td>
    <td align="left"><span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span></td>
  </tr>
</table>
	</fieldset>	
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

<form  action="open_changeBasetrainingLessonList.do" method="post" id="searchForm">
<input name="name" type="hidden" id="searchKey">
<input name="unitid" type="hidden" value='<s:property value="#selunitId"/>'>
</form>

<form  action="saveTrainingLessonChangeBaseLine.do" method="post" id="saveForm">
<input name="lessonchangedbaseflyline.changedbaseflyline.VId" type="hidden" id="lineid">
<input name="lessonchangedbaseflyline.TTrainingLesson.VId" type="hidden" id="lessonid">
<input name="unitid" type="hidden" id="cunitid" value='<s:property value="#selunitId"/>'>
</form>
<form  action="deleteTrainingLessonChangeBaseLine.do" method="post" id="deleteForm">
<input name="id" type="hidden" id="deleteid">
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