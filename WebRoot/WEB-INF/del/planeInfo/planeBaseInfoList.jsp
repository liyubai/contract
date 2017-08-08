<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>飞机信息管理</title>
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
	function checkRegexp( o) {
		var re = /^\d+(\.\d+)?$/; //判断浮点数
		if ( re.test( o ) ) {
			return true;
		} else {
			return false;
		}
	}
	var deviceType= $("#deviceType").val();
	var deviceTypeName = $("#deviceTypeName").val();
	function checkNum(str){ //数字
		return str.match(/\D/)==null 
	}
	$( "#dialogForm1" ).dialog({//添加、编辑窗口
		autoOpen: false,
		height: 450,
		width: 600,
		modal: true,
		resizable: false,
		buttons: {
			"确 定": function() {
				var str = "";
				var str2= "";
				var str3= "";
				var code = $.trim($("#cVPlanecode").val());
				$("#VPlanecode").val(code);
				
				$("#planeform").val($("#cplaneform").val());
				var c = $.trim($("#cDUsetime").val());
				
				if(c!="" && c.indexOf(":")!=-1){
					$("#DUsetime").val(c.split(":")[0]*60 +  parseInt(c.split(":")[1]));
				}
				$("#base").val($("#cbase").val());
				
				$("#DCsdjtime").val(0);
				
				//var d = $.trim($("#cDCsdjtime").val());
				//alert(d);
				//if(d!="" && d.indexOf(":")!=-1){
				//	$("#DCsdjtime").val(d.split(":")[0]*60 +  parseInt(d.split(":")[1]));
				//}
				//$("#IStatus").val($("#cIStatus").val());
				if(deviceType==0){
					
					$("#ITimes").val($("#cITimes").val());
					$("#VCountry").val($("#cVCountry").val());
				}else{
					$("#ITimes").val(0);
					$("#VCountry").val("");
				}
				$("#DEnterdate").val($("#cDEnterdate").val());
				$("#VHgz").val($("#cVHgz").val());
				$("#VDw").val($("#cVDw").val());
				
				$("#VZhuce").val($("#cVZhuce").val());
				
				
				var e = $.trim($("#cDYbtime").val());
				
				if(e!="" && e.indexOf(":")!=-1){
					$("#DYbtime").val(e.split(":")[0]*60 +  parseInt(e.split(":")[1]));
				}
				if(code==""){
					alert("机号不能为空。");
					$("#cVPlanecode").focus();
					return false;
				}
				/*if(!checkNum(code)){
					alert("机号应为4位数字。");
					return;
				}
				
				if(code.length!=4){
					alert("机号应为4位数字。");
					$("#cVPlanecode").focus();
					return false;
				}
				*/
				if($.trim($("#planeform").val())=="-1"){
					alert("请选择"+deviceTypeName+"型号。");
					return false;
				}
				if(deviceTypeName=="飞机"){
					str="飞行时间(空地)";
					str2 = "已飞架次";
					str3= "适航证编号";
				}else{
					str="已使用时长";
					str2 = "已使用次数";
					str3="合格证编号";
				}
				if($.trim($("#DUsetime").val())==""){
					alert(str + "不能为空。");
					$("#cDUsetime").focus();
					return false;
				}
				if(!checkRegexp($("#DUsetime").val().replace(":",""))){
					alert(str+"应为数字。");
					$("#cDUsetime").focus();
					return false;
				}
				
				
				if($.trim($("#base").val())=="-1"){
					alert("请选择所属基地。");
					return false;
				}
				/*
				if(deviceTypeName=="飞机" && $.trim($("#DCsdjtime").val())==""){
					alert("定检时已飞时长不能为空。");
					$("#cDCsdjtime").focus();
					return false;
				}
				if(deviceTypeName=="飞机" && !checkRegexp($("#DCsdjtime").val().replace(":",""))){
					alert("定检时已飞时长应为数字。");
					$("#cDCsdjtime").focus();
					return false;
				}
				
				if($.trim($("#IStatus").val())=="-1"){
					alert("请选择状态。");
					return false;
				}
				*/
				if($.trim($("#ITimes").val())==""){
					alert(str2+"不能为空。");
					$("#cITimes").focus();
					return false;
				}
				if(!checkNum($("#ITimes").val())){
					alert(str2+"应为数字。");
					$("#cITimes").focus();
					return false;
				}
				
				if($.trim($("#DEnterdate").val())==""){
					alert("引进日期不能为空。");
					$("#cDEnterdate").focus();
					return false;
				}
				if($.trim($("#VHgz").val())==""){
					alert(str3+"不能为空。");
					$("#cVHgz").focus();
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
	$("#modalDialogButton1").click(function(){// 添加
		$("#dialogForm1").dialog('option', 'title', '添加'+deviceTypeName+'信息');
		$("#VId").val("");
		$("#cVPlanecode").val("");
		$("#cplaneform").val("-1");
		$("#cplaneform").change();
		$("#cDUsetime").val("");
		$("#cbase").val("-1");
		$("#cbase").change();
		$("#cDCsdjtime").val("");
		//$("#cIStatus").val("-1");
		//$("#cIStatus").change();
		
		$("#cITimes").val("");
		$("#cDEnterdate").val("");
		$("#cVHgz").val("");
		$("#cVDw").val("");
		$("#cVZhuce").val("");
		$("#cVCountry").val("");
		$("#cDYbtime").val("");

		$("#unitSubjectForm").attr("action","createPlaneBaseInfo.do");
		$( "#dialogForm1" ).dialog( "open" );
	});

	function execEdit(str){
		//通过json读取字典对象
		params = {"id":str};
		$.ajax({
			type:"post",
			url:"showPlaneBaseInfoById.do",
			data:params,
			dataType:"json",
			success:function(data){
				//编辑为窗口赋值	
				$("#VId").val(data.VId);
				//$("#cVPlanecode").val(data.VPlanecode.split("-")[1]);
				$("#cVPlanecode").val(data.VPlanecode);
				$("#cplaneform").val(data.planeform);
				$("#cplaneform").change();
				$("#cbase").val(data.baseid);
				$("#cbase").change();
				$("#cDUsetime").val(data.DUsetime);
				$("#cDCsdjtime").val(data.DCsdjtime);
				//$("#cIStatus").val(data.IStatus);
				//$("#cIStatus").change();
				
				$("#cITimes").val(data.ITimes);
				$("#cDEnterdate").val(data.DEnterdate);
				$("#cVHgz").val(data.VHgz);
				$("#cVDw").val(data.VDw);
				$("#cVZhuce").val(data.VZhuce);
				$("#cVCountry").val(data.VCountry);
				$("#cDYbtime").val(data.DYbtime);
				
				$("#dialogForm1").dialog('option', 'title', '编辑'+deviceTypeName+'信息');
				$("#unitSubjectForm").attr("action","updatePlaneBaseInfo.do");
				$("#dialogForm1").dialog( "open" );
			},
			error:function(){
				$("#dialogForm4Span").html("数据库连接错误，获取对象失败，请重试。");
				$( "#backResultDialogForm" ).dialog( "open" );
				return;
			}
		});	
	}
	$("button.icon").click(function(){
		var str = this.id;
		var opt = str.split(",")[0];
		var id = str.split(",")[1];
		if(opt==0){//编辑
			execEdit(id);
		}else{
			$("#unitSubjectDicIdListId").val(id);//删除
			$("#dialogForm3Warning").html("确认删除选中的信息吗？<br/>信息删除后将不能恢复。");
			$( "#deleteDialogForm" ).dialog( "open" );
		}
	});
	$("#modalDialogButton3").click(function(){//删除
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
			$("#dialogForm4Span").html("请选择要删除的内容。");
			$( "#backResultDialogForm" ).dialog( "open" );
			return;
		}
		$("#unitSubjectDicIdListId").val(str);
		$("#dialogForm3Warning").html("确认删除选中的信息吗？<br/>信息删除后将不能恢复。");
		$( "#deleteDialogForm" ).dialog( "open" );
		
	});
	$( "#deleteDialogForm" ).dialog({//删除信息窗口
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
		if($("#searchUser").val()!="机号")								
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
    <s:param name="name"><%=ActionContext.getContext().getName()%>.do?deviceType=${deviceType}</s:param> 
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
	<s:set name="pos" value="#session.loginContext.urlAddress.indexOf(#request.k+'.do?deviceType='+deviceType)"/>
	<s:if test='#pos==-1'>
		<s:set name="r" value="1"/>
    </s:if>
    <s:else>
		<s:set name="r" value="#session.loginContext.urlAddress.substring(#pos+#request.k.length()+19,#pos+#request.k.length()+20)"/>
    </s:else>
</s:else>
<s:if test="#r==null || #r==0"><button id="modalDialogButton1" class="green" primary="ui-icon-button-addnew">添加${deviceTypeName}</button>
    
    <button class="normal barLeft" id="modalDialogButton3">删除</button></s:if>
    <div class="dropDownList <s:if test="#r==null || #r==0">arMiddle</s:if><s:else>barLeft</s:else>">
    <s:set name="eformid" value="formid"/>
    <s:if test="formid==null || formid==''"><s:set name="eformid" value=""></s:set></s:if>
    <button>型号</button><span class="bar"></span>
    <ul>
    <li><a href="open_planeBaseInfoList.do?deviceType=${deviceType}&formid=&baseid=${baseid}"  val=""><span class="ui-icon ui-icon-bullet"></span>型号</a></li>
    <s:iterator value="planeformList">
    <li><a href="open_planeBaseInfoList.do?deviceType=${deviceType}&formid=${VId}&baseid=${baseid}"  val="${VId}">${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="splaneform" value="${eformid}"/>
    </div>
    <div class="dropDownList barMiddle">
        <s:set name="ebaseid" value="baseid"/>
    	<s:if test="baseid==null || baseid==''"><s:set name="ebaseid" value=""></s:set></s:if>
        <button>所属基地</button><span class="bar"></span>
        <ul>
        <li><a href="open_planeBaseInfoList.do?deviceType=${deviceType}&baseid=&formid=${formid}"  val=""><span class="ui-icon ui-icon-bullet"></span>所属基地</a></li>
        <s:iterator value="baselist">
        <li><a href="open_planeBaseInfoList.do?deviceType=${deviceType}&baseid=${VId}&formid=${formid}"  val="${VId}">${VName}</a></li>
        </s:iterator>
        </ul>
        <input type="hidden"  id="sbase" value="${ebaseid}"/>
     </div>
    <button class="normal barRight" id="modalDialogButton5">全部</button>
    <div class="buttonInput relative left" width="180" height="28">
    <input id="searchUser" value="机号" name="searchUser"  type="text" maxlength="50" title="机号"/><button id="modalDialogButton4" >查询</button>
    </div>

</div>

<div class="Panel ui-corner-all-0" id="Panel2">

	<div class="panelContent">

		<table class="panelTable" id="usersTable" border="0" cellspacing="0" cellpadding="3">
			<thead>
			  <tr class="trSpliter">
				<th width="40"></th>
				<th width="60"></th>
				<th width="80"></th>
                <s:if test="deviceType==0">
				<th width="80"></th>
				<th width="120"></th>
                <th width="80"></th>
                <th width="100"></th> 
                <th width="100"></th>
                <th width="100"></th>
                <th width="110"></th>
                <th width="90"></th>
                </s:if>
				<s:else>
                <th width="100"></th> 
                <th width="110"></th>
                <th width="80"></th>
                <th width="160"></th>
                </s:else>
                <th></th>
			  </tr>
              
			  <tr>
				<th class="thSortableGray" style="padding-left: 6px;"><input type="checkbox" value="" id="checkAllUsersBox"><b></b></th>
				<th class="thSortableGray">机号</th>
				<th class="thSortableGray">${deviceTypeName}型号</th>
                <s:if test="deviceType==0">
				<th class="thSortableGray">适航证编号</th>
				<th class="thSortableGray">所属基地</th>
				<th class="thSortableGray">起落架次</th>
                <th class="thSortableGray">飞行时间(空地)</th>
                 <th class="thSortableGray">飞行时间(空中)</th>
                <th class="thSortableGray">定检时已飞时长</th>
                <th class="thSortableGray">序列号</th>
                <th class="thSortableGray">国籍证编号</th>
                </s:if><s:else>
                <th class="thSortableGray">合格证编号</th>
				<th class="thSortableGray">所属基地</th>
                <th class="thSortableGray">已使用时长</th>
                <th class="thSortableGray">序列号</th>
                </s:else>
                <th class="thSortableGray"></th>
			  </tr>
			</thead>
			<tbody>
            <s:iterator value="planeinfoList" >
			  <tr>
				<td><input name="checkboxName" type="checkbox" value="${VId}"><b></b></td>
				<td>${VPlanecode}</td>
				<td>${planeform.VName}</td>
                <s:if test="deviceType==0">
                <td>${VHgz}</td>
				<td>${TOrg.VName}</td>
                <td>${ITimes}</td>
                <td align="right"><s:property value="VBz.split(',')[0]"/>&nbsp;&nbsp;&nbsp;</td>
                <td align="right"><s:property value="VBz.split(',')[1]"/> &nbsp;&nbsp;&nbsp;</td>
                <td align="right"><s:property value="VBz.split(',')[2]"/>&nbsp;&nbsp;&nbsp;</td>
                <td>${VZhuce}</td>
                <td>${VCountry}</td>
                </s:if><s:else>
                <td>${VHgz}</td>
				<td>${TOrg.VName}</td>
                <td align="right"><s:property value="VBz.split(',')[0]"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>${VZhuce}</td>
               	</s:else>
				<td>
<s:if test="#r==null || #r==0"><span class="hide"><button class="icon"  icon="ui-icon-pencil" title="编辑" id="0,${VId}"></button><!--<button class="icon" icon="ui-icon-trash" title="删除"  id="1,${VId}"></button>--></span></s:if></td>
			  </tr>
              </s:iterator>
			 <s:iterator value="(13-planeinfoList.size).{ #this }">
			  <tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
                <s:if test="deviceType==0">
				<td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                </s:if>
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


<div id="dialogForm1"  title="添加${deviceTypeName}信息">
<s:if test="deviceType==0">
<table width="99%" border="0">
  <tr>
    <td width="22%" align="right">机号：</td>
    <td width="28%"><input type="text"  id="cVPlanecode" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td width="22%" align="right">型号：</td>
    <td width="28%">
    <div class="dropDownList">
    <button>飞机型号</button>
    <ul>
    <li><a href="#N"  val="-1"><span class="ui-icon ui-icon-bullet"></span>飞机型号</a></li>
    <s:iterator value="planeformList">
    <li><a href="#N"  val="${VId}">${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="cplaneform" value="-1"/>
    </div>
	</td>
  </tr>
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">飞行时间(空地)：</td>
    <td><input type="text"  id="cDUsetime" class="text ui-widget-content ui-corner-all"  style="width:150px;" onMouseDown="deletebMF('cDUsetime')" onBlur="viewLongTime('cDUsetime')" />
    </td>
    <td align="right">所属基地：</td>
    <td><div class="dropDownList">
        <button>所属基地</button>
        <ul>
        <li><a href="#N"  val="-1"><span class="ui-icon ui-icon-bullet"></span>所属基地</a></li>
        <s:iterator value="baselist">
        <li><a href="#N"  val="${VId}">${VName}</a></li>
        </s:iterator>
        </ul>
        <input type="hidden"  id="cbase" value="-1"/>
      </div></td>
  </tr>
  
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">飞行时间（空中）：</td>
    <td><input type="text" id="cDYbtime" class="text ui-widget-content ui-corner-all"  style="width:150px;"  onMouseDown="deletebMF('cDYbtime')" onBlur="viewLongTime('cDYbtime')"/>
    <input type="hidden"  id="cDCsdjtime"  value="0" /></td>
    <td align="right">引进日期：</td>
    <td><input type="text"  id="cDEnterdate" class="Wdate ui-widget-content ui-corner-all text"  style="width:130px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" /></td>
  </tr>
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">已飞架次：</td>
    <td><input type="text"  id="cITimes" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td align="right">所属单位：</td>
    <td>
<input type="text"  id="cVDw" class="text ui-widget-content ui-corner-all"  style="width:130px;" />
    </td>
  </tr>
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">适航证编号：</td>
    <td><input type="text" id="cVHgz" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td align="right">序列号：</td>
    <td><input type="text" id="cVZhuce" class="text ui-widget-content ui-corner-all"  style="width:130px;" /></td>
  </tr>
   <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">国籍证编号：</td>
    <td><input type="text" id="cVCountry" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td align="right"></td>
    <td></td>
  </tr>
</table>
</s:if><s:else>
<table width="98%" border="0">
  <tr>
    <td width="18%" align="right">机号：</td>
    <td width="32%"><input type="text"  id="cVPlanecode" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td width="18%" align="right">型号：</td>
    <td width="32%">
    <div class="dropDownList">
    <button>${deviceTypeName}型号</button>
    <ul>
    <li><a href="#N"  val="-1"><span class="ui-icon ui-icon-bullet"></span>${deviceTypeName}型号</a></li>
    <s:iterator value="planeformList">
    <li><a href="#N"  val="${VId}">${VName}</a></li>
    </s:iterator>
    </ul>
    <input type="hidden"  id="cplaneform" value="-1"/>
    </div>
	</td>
  </tr>
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">已使用时长：</td>
    <td><input type="text"  id="cDUsetime" class="text ui-widget-content ui-corner-all"  style="width:150px;" onMouseDown="deletebMF('cDUsetime')" onBlur="viewLongTime('cDUsetime')"  />
    </td>
    <td align="right">所属基地：</td>
    <td><div class="dropDownList">
        <button>所属基地</button>
        <ul>
        <li><a href="#N"  val="-1"><span class="ui-icon ui-icon-bullet"></span>所属基地</a></li>
        <s:iterator value="baselist">
        <li><a href="#N"  val="${VId}">${VName}</a></li>
        </s:iterator>
        </ul>
        <input type="hidden"  id="cbase" value="-1"/>
      </div></td>
  </tr>
  
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">合格证编号：</td>
    <td><input type="text" id="cVHgz" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td align="right">引进日期：</td>
    <td><input type="text"  id="cDEnterdate" class="Wdate ui-widget-content ui-corner-all text"  style="width:130px; border-color:#DDDDDD; height:16px;" onFocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" />
    </td>
  </tr>
  <tr>
    <td colspan="4"><span class="panelLine"></span></td>
    </tr>
  <tr>
    <td align="right">序列号：</td>
    <td><input type="text" id="cVZhuce" class="text ui-widget-content ui-corner-all"  style="width:150px;" /></td>
    <td align="right">所属单位：</td>
    <td>
<input type="text"  id="cVDw" class="text ui-widget-content ui-corner-all"  style="width:130px;" />
    </td>
  </tr>

</table>
<input type="hidden"  id="cDCsdjtime" class="text ui-widget-content ui-corner-all"  style="width:150px;" />
</s:else>

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

<form id="unitSubjectForm" method="post" action="createPlaneBaseInfo.do">
<input type="hidden" name="planeinfo.VId" id="VId"/>

<input type="hidden" name="planeinfo.VPlanecode" id="VPlanecode"/>
<input type="hidden" name="planeinfo.TOrg.VId" id="base"/>
<input type="hidden" name="planeinfo.planeform.VId" id="planeform"/>

<input type="hidden" name="planeinfo.DEnterdate" id="DEnterdate"/>
<input type="hidden" name="planeinfo.ITimes" id="ITimes"/>

<input type="hidden" name="planeinfo.DUsetime" id="DUsetime"/>
<input type="hidden" name="planeinfo.DCsdjtime" id="DCsdjtime"/>

<input type="hidden" name="planeinfo.VDw" id="VDw"/>
<input type="hidden" name="planeinfo.VHgz" id="VHgz"/>
<input type="hidden" name="planeinfo.IStatus" id="IStatus" value="3"/>

<input type="hidden" name="planeinfo.IDeviceType" value="${deviceType}"/>
<input type="hidden" name="planeinfo.VBz" id="VBz"/>

<input type="hidden" name="planeinfo.VZhuce" id="VZhuce"/>
<input type="hidden" name="planeinfo.VCountry" id="VCountry"/>
<input type="hidden" name="planeinfo.DYbtime" id="DYbtime" value="0"/>
</form>
<form  action="open_planeBaseInfoList.do" method="post" id="searchForm">
<input name="deviceType" type="hidden" value="${deviceType}">
<input name="name" type="hidden" id="searchKey">
</form>
<form  action="deletePlaneBaseInfo.do" method="post" id="deleteForm">
<input name="deviceType" type="hidden" value="${deviceType}" id="deviceType">
<input name="ids" type="hidden" id="unitSubjectDicIdListId">
</form>
<input  type="hidden" value="${deviceType}" id="deviceType">
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