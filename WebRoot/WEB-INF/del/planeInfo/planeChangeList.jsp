<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>飞机调拨管理</title>
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
/*功能9*/
fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
</style>
<script>
$(function() {
	$("div.dropDownList").find("button").css("width","140px").end().each(function(i){
		if(i==0){var d= new $.dropDownList(i,true,100);d.button.css("width", "90px");}

		else{new $.dropDownList(i,true,140);}
	})
	var $checkboxes=$("input[name='checkboxName']"),$checkAllUsersBox=$("#checkAllUsersBox");
	$checkboxes.change(function(){
		if(!this.checked) $checkAllUsersBox[0].checked=false;
		if($checkboxes.size()==$checkboxes.filter(":checked").size()) $checkAllUsersBox[0].checked=true;
		$checkAllUsersBox.trigger("change");
	});
	$checkAllUsersBox.click(function(){
		$checkboxes.each(function(){
			this.checked = $checkAllUsersBox[0].checked;
			$(this).trigger("change");
		});
	});

	var deviceTypeName = $("#deviceTypeName").val();

	$( "#dialogForm1" ).dialog({//添加、编辑窗口
		autoOpen: false,
		height: 300,
		width: 400,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				
				$("#base").val($("#cbase").val());
				$("#DEnterdate").val($("#cDEnterdate").val());
				
				$("#VReason").val($("#cVReason").val());
				$("#VAccording").val($("#cVAccording").val());
				if($.trim($("#base").val())=="-1"){
					alert("请选择新基地。");
					return false;
				}

				if($.trim($("#DEnterdate").val())==""){
					alert("调换日期不能为空。");
					$("#cDEnterdate").focus();
					return false;
				}

				$("#unitSubjectForm").submit();
				$( this ).dialog( "close" );

			},
			"取 消": function() {
				$( this ).dialog( "close" );
			}
		}
	});

	$("#modalDialogButton3").click(function(){//调换
		var k =0;
		var str="";
		var r1=document.getElementsByName('checkboxName');
		for(i=0;i<r1.length;i++){
			if(r1[i].checked==true){
				k++;
				str+=r1[i].value+",";
			}
		}
		
		if(k==0){
			$("#dialogForm4Span").html("请选择要调换的飞机。");
			$( "#backResultDialogForm" ).dialog( "open" );
			return;
		}
		$("#ids").val(str);
		$("#cbase").val("-1");
		$("#cbase").change();
		$("#cDEnterdate").val($("#nowdate").val());
		$( "#dialogForm1" ).dialog( "open" );//输入调拨信息，调拨时间，新的基地。
		
	});

	$( "#backResultDialogForm" ).dialog({//操作数据库返回提示窗口
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
	$("#modalDialogButton4").click(function(){//查询
		if($("#searchUser").val()!=deviceTypeName + "机号")								
			$("#searchKey").val($("#searchUser").val());
		$( "#searchForm" ).submit();
	});
	$("#modalDialogButton5").click(function(){//全部
		$("#searchKey").val("");
		$( "#searchForm" ).submit();
	});
});
</script>
<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>
</head>
<body class="hide">

<div id="leftPartA"><div>
	<s:action name="open_leftList" executeResult="true">
    <s:param name="parentid">4028816a4714304c014714a051e20008</s:param>
    <s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
    </s:action>
</div></div>

<div id="rightPartA"><div>

    <div class="panelBox buttonBox">
    <s:if test="deviceType==null || deviceType=='' || deviceType==0">
    	<s:set name="deviceTypeName" value="'飞机'"/>
    </s:if>
    <s:elseif test='deviceType==1'>
    	<s:set name="deviceTypeName" value="'训练器'"/>
    </s:elseif>
    <s:else>
    	<s:set name="deviceTypeName" value="'模拟机'"/>
    </s:else>
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
    <button id="modalDialogButton3" class="green">调换基地</button>
 </s:if>   
    <div class="dropDownList barLeft">
    <s:set name="eformid" value="formid"/>
    <s:if test="formid==null || formid==''"><s:set name="eformid" value=""></s:set></s:if>
    <button>型号</button><span class="bar"></span>
    <ul>
    <li><a href="open_planeChangeList.do?deviceType=${deviceType}&formid=&baseid=${baseid}"  val=""><span class="ui-icon ui-icon-bullet"></span>型号</a></li>
    <s:iterator value="planeformList">
    <li><a href="open_planeChangeList.do?deviceType=${deviceType}&formid=${VId}&baseid=${baseid}"  val="${VId}">${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="splaneform" value="${eformid}"/>
    </div>
    <div class="dropDownList barMiddle">
        <s:set name="ebaseid" value="baseid"/>
    	<s:if test="baseid==null || baseid==''"><s:set name="ebaseid" value=""></s:set></s:if>
        <button>所属基地</button><span class="bar"></span>
        <ul>
        <li><a href="open_planeChangeList.do?deviceType=${deviceType}&baseid=&formid=${formid}"  val=""><span class="ui-icon ui-icon-bullet"></span>所属基地</a></li>
        <s:iterator value="baselist">
        <li><a href="open_planeChangeList.do?deviceType=${deviceType}&baseid=${VId}&formid=${formid}"  val="${VId}">${VName}</a></li>
        </s:iterator>
        </ul>
        <input type="hidden"  id="sbase" value="${ebaseid}"/>
     </div>
    <button class="normal barRight" id="modalDialogButton5">全部</button>
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" value="${deviceTypeName}机号" name="searchUser"  type="text" maxlength="50" title="${deviceTypeName}机号"/><button id="modalDialogButton4" >查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="40"></th>
				<th width="70"></th>
				<th width="80"></th>
				<th width="100"></th>
				<th width="120"></th>
                <th width="100"></th>
                <th width="80"></th>
                <th width="100"></th>
                <th width="100"></th>
                <th width="80"></th>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">机号</th>
				<th class="thSortableGray">${deviceTypeName}型号</th>
				<th class="thSortableGray">适航证编号</th>
				<th class="thSortableGray">所属基地</th>
				<th class="thSortableGray">引进日期</th>
				<th class="thSortableGray">飞行架次</th>
                <th class="thSortableGray">已飞时长(空地)</th>
                <th class="thSortableGray">已飞时长(空中)</th>
                <th class="thSortableGray">状态</th>
                <th class="thSortableGray"></th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="planeinfoList" >
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
				<td>${VPlanecode}</td>
				<td>${planeform.VName}</td>
                <td>${VHgz}</td>
				<td>${TOrg.VName}</td>
				<td><s:date name="DEnterdate" format="yyyy-MM-dd" /></td>
				<td>${ITimes}</td>
                <td align="right" style="padding-right:15px;"><s:property value="VBz.split(',')[0]"/></td>
                <td align="right" style="padding-right:15px;"><s:property value="VBz.split(',')[1]"/></td>
                  <td>
                  	<s:if test='IStatus==0'>机务放行</s:if>
                    <s:if test='IStatus==1'>签派放行</s:if>
                    <s:if test='IStatus==2'>签派回收</s:if>
                    <s:if test='IStatus==3'>适航</s:if>
                    <s:if test='IStatus==4'>等待维修</s:if>
                    <s:if test='IStatus==5'>定检中</s:if>
                </td>
				<td></td>
			  </tr>
              </s:iterator>
			 <s:iterator value="(13-planeinfoList.size).{ #this }">
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
		</table>
        

</div>
</div>
</div>
</div>


<div id="dialogForm1"  title="飞机调换">

<table width="98%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="35%" align="right">新基地：</td>
    <td><div class="dropDownList">
        <button>新基地</button>
        <ul>
        <li><a href="#N"  val="-1"><span class="ui-icon ui-icon-bullet"></span>新基地</a></li>
        <s:iterator value="baselist">
        <li><a href="#N"  val="${VId}">${VName}</a></li>
        </s:iterator>
        </ul>
        <input type="hidden"  id="cbase" value="-1"/>
      </div></td>
    </tr>
  <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>

  <tr>
    <td align="right">调换日期：</td>
    <td><input type="text"   id="cDEnterdate" class="Wdate ui-widget-content ui-corner-all text"  style="width:130px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" value="${viewDate}" />    </td>
    </tr>
  
   <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>

  <tr>
    <td align="right">调换理由：</td>
    <td><input type="text"   id="cVReason" class="ui-widget-content ui-corner-all text"  style="width:130px; border-color:#DDDDDD; height:16px;"  />	</td>
    </tr>
     <tr>
    <td colspan="2"><span class="panelLine"></span></td>
    </tr>

  <tr>
    <td align="right">调换依据：</td>
    <td><input type="text"   id="cVAccording" class="ui-widget-content ui-corner-all text"  style="width:130px; border-color:#DDDDDD; height:16px;"  />	</td>
    </tr>
</table>


</div>

<div id="deleteDialogForm">   
<fieldset>
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555;" id="dialogForm3Warning"></span></td>
</tr>
</table>
</fieldset>
</div>

<div id="backResultDialogForm">
<table width="100%" border="0" align="center" cellpadding="0">
<tr>
<td width="20%" height="90" align="center" valign="middle"><img src="themes/cupertino/images/warning.png" /></td>
<td width="90%" align="left" valign="middle"><span style="font-size: 14px; font-weight: bold; color: #555555; line-height:23px;" id="dialogForm4Span"></span></td>
</tr>
</table>
</div>
<input type="hidden" id="deviceTypeName" value="${deviceTypeName}"/>
<input type="hidden" id="nowdate" value="${viewDate}"/>
<form id="unitSubjectForm" method="post" action="changePlaneBase.do">
<input type="hidden" name="planeinfo.VId" id="ids"/>
<input type="hidden" name="planeinfo.TOrg.VId" id="base"/>
<input type="hidden" name="planeinfo.DEnterdate" id="DEnterdate"/>
<input type="hidden" name="planeinfo.VDw" id="VReason"/>
<input type="hidden" name="planeinfo.VBz" id="VAccording"/>
<input name="deviceType" type="hidden" value="${deviceType}">
</form>
<form  action="open_planeChangeList.do" method="post" id="searchForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="name" type="hidden" id="searchKey">
</form>

<%@ include file="../../result.jsp"%>
</body>
</html>
<script>
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult!=null&&operateResult!=""){
		$("#dialogForm4Span").html(operateResult);
		$( "#backResultDialogForm" ).dialog( "open" );
	}
});

</script>