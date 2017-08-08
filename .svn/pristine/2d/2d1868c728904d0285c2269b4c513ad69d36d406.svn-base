<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加其他人员</title>

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
<script src="scripts/isChinaIDCard.js"></script>
<script type="text/javascript" src="../js/wdatepicker/WdatePicker.js" ></script>
<style>

fieldset { padding: 0 1em 0 1em; border:0; width: 85%; }
.validateTips { border: 1px solid transparent; padding: 0 0.5em 0 0.5em; margin: 0; line-height: 30px; }
#Panel1, .buttonBox { width: auto; margin-left: 50px; margin-right: 50px; padding-top: 0; }
.Panel, .panelContent, .panelTable, td { background-color: transparent; box-shadow: none; filter: none; }

.rightLine1{width:80px; float:left; height:35px; text-align:center;border-right:solid 1px #DBE3E8;}
.rightLine2{width:80px; float:left; text-align:center;border-right:solid 1px #DBE3E8; padding-top:4px;}
.middleclass{background: #EEEEEE; width: 100%; height: 1px; line-height: 1px; margin: 0px 0 0px 0; display: block; clear: both;}
</style>
<script>
$(function() {

	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		if(i==1){var d=new $.dropDownList(i,true,330);}
		else if(i==3){var d=new $.dropDownList(i,true,340);}
		else{new $.dropDownList(i,true,130);}
	})
	
	$("#VCardid").blur(function(){
		if($.trim($("#VCardid").val()) == "" ){
			//alert("身份证号不能为空。");
			//$("#VCardid").focus();
			return false;
		}

		if(!isChinaIDCard($.trim($("#VCardid").val()))){
			$("#VCardid").focus();
			return false;
		}
		var birth = getBirthById($.trim($("#VCardid").val()));
		if(birth!=""){
			$("#DCsrq").val(birth);
		}
	});
	
	//保存
	$("#modalDialogButton1").click(function(){
		var VName = $("#VName").val();
		if(VName == null || VName ==""){
			alert("姓名不能为空。");
			$("#VName").focus();
			return false;
		}
		if($.trim($("#VCardid").val()) == "" ){
			alert("身份证号不能为空。");
			$("#VCardid").focus();
			return false;
		}

		if(!isChinaIDCard($.trim($("#VCardid").val()))){
			$("#VCardid").focus();
			return false;
		}
		var birth = getBirthById($.trim($("#VCardid").val()));
		if(birth!=""){
			$("#DCsrq").val(birth);
		}
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		var regex = /^\d{11}$/;
		var sfzh = $("#VCardid").val();
		var phone = $("#VLxfs").val();
		
		var errors = "";
		if(VName == null || VName ==""){
			errors += "姓名为必填项，不能为空！\r";
		}
		if(sfzh!=null && sfzh!=""){
			if(reg.test(sfzh)==false){
				errors += "身份证号码填写错误，请认真核对！\r";
			}
		}
		if(phone != null && phone != ""){
			if(regex.test(phone)==false){
				errors += "联系方式格式不正确，请认真核对！\r";
			}
		}
		
		var VSex = $("#VSex").val();
		if(VSex==null || VSex==""){
			VSex = "男";
		}
		var VZzmm = $("#VZzmm").val();
		if(VZzmm==null || VZzmm==""){
			VZzmm = "中共党员";
		}
		if(errors==""){
			$("#peoplename").val(VName);
			$("#peoplesex").val(VSex);
			$("#peoplecsrq").val($("#DCsrq").val());
			$("#peoplemz").val($("#VMz").val());
			$("#peoplelxfs").val($("#VLxfs").val());
			$("#peoplecardid").val($("#VCardid").val());
			$("#peoplezzmm").val(VZzmm);
			$("#peoplejg").val($("#VJg").val());
			$("#peoplejtzz").val($("#VJtzz").val());
			$("#peoplewhcd").val($("#VWhcd").val());
			$("#peoplecrgzsj").val($("#DCrgzsj").val());
			$("#peopleForm").submit();
		}else{
			alert(errors);
			return;
		}
	});
	
	 //取消，返回列表页
	$("#modalDialogButton2").click(function(){
	    $("#searchForm").submit();
	});
	
});
</script>

<!-- 此js务必放在所有页面自带的js后面加载 -->
<script src="scripts/base.min.js"></script>

</head>
<body class="hide">
<div id="leftPartA"><div>
<s:action name="open_leftList" executeResult="true">
<s:param name="parentid">4028816a4714304c014714a1e0b9000a</s:param>
<s:param name="name"><%=ActionContext.getContext().getName()%></s:param> 
</s:action>
</div></div>

<div id="topPartD"><div class="panelBox buttonBox">
<s:if test="showPeople==''">
<button id="modalDialogButton1" class="green" primary="ui-icon-button-confirm">保存</button>
</s:if>
<button id="modalDialogButton2" class="normal"><span style="font-size:13px">&lt;&lt;</span> 返回</button>
</div>
</div>


<input type="hidden" name="statusMsg" />


<div id="rightPartD"><div>

<div class="Panel" id="Panel1" style="margin-top: 5px;">

	<div class="panelContent">
    
			<table class="panelTable" border="0" cellspacing="0" cellpadding="0">
            <tbody>
				<tr class="normal">
				<td width="92" align="right">姓名：</td>
				<td width="210"><input id="VName" maxlength="50" value="${anotherpeople.VName}" class="text ui-widget-content ui-corner-all"/></td>
				<td width="30"></td>
				<td width="130" align="right">性别：</td>
				<td width="182">
					<div class="dropDownList">
						<button>男</button>
						<ul>
							<li><a href="#N" val="男"><span class="ui-icon ui-icon-bullet"></span>男</a></li>
							<li><a href="#N" val="女">女</a></li>
						</ul>
						<input type="hidden" id="VSex" name="anotherpeople.VSex" value="男" />
					</div>
				</td>
				<td width="39"></td>
				<td width="101" align="right">身份证号：</td>
				<td width="180"><input id="VCardid" maxlength="20" name="otheruser.VCardid" value="${anotherpeople.VCardid}" class="text ui-widget-content ui-corner-all"/></td>
				</tr>
			
				<tr class="normal">
				<td align="right">民族：</td>
				<td width="210">
                <div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="" class="inline" style="width:70px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
							<s:iterator value="minzuList">
                            <a href="#N" val="${VName}" class="inline" style="width:70px;">${VName}</a>
							</s:iterator></li>
						</ul>
				  <input type="hidden" id="VMz" name="otheruser.VMz" value="${anotherpeople.VMz}" />
				</div>
                </td>
				<td width="30"></td>
				<td align="right">联系方式：</td>
				<td width="182"><input id="VLxfs" maxlength="50" name="otheruser.VLxfs" value="${anotherpeople.VLxfs}" class="text ui-widget-content ui-corner-all"/></td>
				<td width="39"></td>
				<td align="right">出生日期：</td>
				<td width="180"><input id="DCsrq" name="otheruser.DCsrq" value='<s:date name="anotherpeople.DCsrq" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" style="border-color:#DDDDDD; height:16px;" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" /></td>
				</tr>

				<tr class="normal">
				<td align="right">政治面貌：</td>
				<td width="210">
					<div class="dropDownList">
						<button>中共党员</button>
						<ul>
							<li><a href="#" val="中共党员"><span class="ui-icon ui-icon-bullet"></span>中共党员</a></li>
                            <li><a href="#N" val="中共预备党员">中共预备党员</a></li>
							<li><a href="#" val="共青团员">共青团员</a></li>
							<li><a href="#" val="群众">群众</a></li>
						</ul>
						<input type="hidden" id="VZzmm" name="otheruser.VZzmm" value="中共党员" />
					</div>
				</td>
				<td width="30"></td>
				<td align="right">籍贯：</td>
				<td width="182">
                <div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val="" class="inline" style="width:45px;"><span class="ui-icon ui-icon-bullet"></span>请选择</a>
							<s:iterator value="jiguanList">
                            <a href="#N" val="${VName}" class="inline" style="width:45px;">${VName}</a>
						  </s:iterator></li>
						</ul>
				  <input type="hidden" id="VJg"  name="anotherpeople.VJg"  value="${anotherpeople.VJg}" />
				</div>
                </td>
				<td width="39"></td>
				<td align="right">家庭住址：</td>
				<td width="180"><input id="VJtzz" maxlength="150" name="otheruser.VJtzz" value="${anotherpeople.VJtzz}" class="text ui-widget-content ui-corner-all"/></td>
				</tr>
				<tr class="normal">
				<td align="right">文化程度：</td>
				<td width="210">
                <div class="dropDownList">
						<button>请选择</button>
						<ul>
							<li><a href="#N" val=""><span class="ui-icon ui-icon-bullet"></span>请选择</a></li>
							<s:iterator value="whcdList"><li>
                            <a href="#N" val="${VName}">${VName}</a>
							</s:iterator></li>
						</ul>
				  <input type="hidden" id="VWhcd" value="${anotherpeople.VWhcd}" />
				</div>
                </td>
				<td width="30"></td>
				<td align="right">参加工作时间：</td>
				<td width="182"><input id="DCrgzsj" name="otheruser.DCrgzsj" style="border-color:#DDDDDD; height:16px;"  value='<s:date name="anotherpeople.DCrgzsj" format="yyyy-MM-dd" />' class="Wdate text ui-widget-content ui-corner-all" onfocus="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'})" /></td>
				<td width="39"></td>
				<td align="right"></td>
				<td width="180"></td>
				</tr>
                </tbody>
			</table>
</div>
</div>
</div>
</div>



<form id="searchForm" action="searchPeopleListAnotherPeopleAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
</form>

<form id="peopleForm" action="savePeopleAnotherPeopleAction.do" method="post">
<input type="hidden" name="otheruser.TOrg.VId" value="${deptId}" />
<input type="hidden" name="otheruser.VId" value="${anotherpeople.VId}" />
<input type="hidden" id="peoplename" name="otheruser.VName" />
<input type="hidden" id="peoplesex" name="otheruser.VSex" />
<input type="hidden" id="peoplecsrq" name="otheruser.DCsrq"/>
<input type="hidden" id="peoplemz" name="otheruser.VMz" />
<input type="hidden" id="peoplelxfs" name="otheruser.VLxfs" />
<input type="hidden" id="peoplecardid" name="otheruser.VCardid" />
<input type="hidden" id="peoplezzmm" name="otheruser.VZzmm" />
<input type="hidden" id="peoplejg" name="otheruser.VJg" />
<input type="hidden" id="peoplejtzz" name="otheruser.VJtzz" />
<input type="hidden" id="peoplewhcd" name="otheruser.VWhcd" />
<input type="hidden" id="peoplecrgzsj" name="otheruser.DCrgzsj" />
</form>
</body>
</html>
