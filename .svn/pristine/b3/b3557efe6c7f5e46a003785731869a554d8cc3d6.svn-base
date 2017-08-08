<%@ page language="java" import="com.opensymphony.xwork2.ActionContext" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改其他人员</title>

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
#Panel1, .buttonBox { width: auto; margin-left: 50px; margin-right: 50px; padding-top: 0; }
.Panel, .panelContent, .panelTable, td { background-color: transparent; box-shadow: none; filter: none; }

.rightLine1{width:80px; float:left; height:35px; text-align:center;border-right:solid 1px #DBE3E8;}
.rightLine2{width:80px; float:left; text-align:center;border-right:solid 1px #DBE3E8; padding-top:4px;}
.middleclass{background: #EEEEEE; width: 100%; height: 1px; line-height: 1px; margin: 0px 0 0px 0; display: block; clear: both;}
</style>
<script>
$(function() {

	//功能5
	$("div.dropDownList").find("button").css("width","100px").end().each(function(i){
		new $.dropDownList(i,true,100);
	})
	//功能5
	
	//保存
	$("#modalDialogButton1").click(function(){
		var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
		var regex = /^\d{11}$/;
		var sfzh = $("#VCardid").val();
		var phone = $("#VLxfs").val();
		var VName = $("#VName").val();
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
				<td width="8"></td>
				<td width="114" align="right">编号：</td>
				<td width="180">${anotherpeople.VCode}</td>
				<td width="9"></td>
				<td width="183" align="right">所在部门：</td>
			  <td width="180">${anotherpeople.deptName}</td>
				<td width="8"></td>
				<td width="152" align="right">&nbsp;</td>
				<td width="180">&nbsp;</td>
			  </tr>
				<tr class="normal">
				<td width="8"></td>
				<td align="right">姓名：</td>
				<td width="180">${anotherpeople.VName}</td>
				<td width="9"></td>
				<td align="right">性别：</td>
				<td width="180">${anotherpeople.VSex}
				</td>
				<td width="8"></td>
				<td align="right">出生日期：</td>
				<td width="180"><s:date name="anotherpeople.DCsrq" format="yyyy-MM-dd" /></td>
				</tr>
			
				<tr class="normal">
				<td width="8"></td>
				<td align="right">民族：</td>
				<td width="180">${anotherpeople.VMz}</td>
				<td width="9"></td>
				<td align="right">联系方式：</td>
				<td width="180">${anotherpeople.VLxfs}</td>
				<td width="8"></td>
				<td align="right">身份证号：</td>
				<td width="180">${anotherpeople.VCardid}</td>
				</tr>
			
				<tr class="normal">
				<td width="8"></td>
				<td align="right">政治面貌：</td>
				<td width="180">${anotherpeople.VZzmm}</td>
				<td width="9"></td>
				<td align="right">籍贯：</td>
				<td width="180">${anotherpeople.VJg}</td>
				<td width="8"></td>
				<td align="right">家庭住址：</td>
				<td width="180">${anotherpeople.VJtzz}</td>
				</tr>
				<tr class="normal">
				<td width="8"></td>
				<td align="right">文化程度：</td>
				<td width="180">${anotherpeople.VWhcd}</td>
				<td width="9"></td>
				<td align="right">参加工作时间：</td>
				<td width="180"><s:date name="anotherpeople.DCrgzsj" format="yyyy-MM-dd" /></td>
				<td width="8"></td>
				<td align="right"></td>
				<td width="180"></td>
				</tr>
			</table>
		</div>
	</div>
</div>
</div>



<form id="searchForm" action="searchPeopleListAnotherPeopleAction.do" method="post">
<input type="hidden" name="deptId" value="${deptId}" />
<input type="hidden" name="key" value="${key}" />
</form>

</body>
</html>
