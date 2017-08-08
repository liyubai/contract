<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@page import="java.util.*,java.io.FileInputStream"%>
<%@page import = "cn.org.bjca.client.security.SecurityEngineDeal"%>

<%
String path = (String)request.getAttribute("usbkPath");
SecurityEngineDeal.setProfilePath(path);
SecurityEngineDeal sed = null;
sed = SecurityEngineDeal.getInstance("SVSDefault");

response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);

String strServerCert = null;
String strRandom = null;
String strSignedData = null;
strServerCert = sed.getServerCertificate();
strRandom = sed.genRandom(24);
strSignedData = sed.signData(strRandom);
session.setAttribute("Random", strRandom);
%>

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8 " />
<title>中国民航大学飞行训练电子记录系统</title>
<style>
body {  margin:0; }
td{ font-size:9pt;}
</style>
<script src="system/scripts/jquery.min.js"></script>
<SCRIPT language=JavaScript src="js/date.js"></SCRIPT>
<SCRIPT language=JavaScript src="js/SecX_Common.js"></SCRIPT>
<SCRIPT ID=clientEventHandlersJS LANGUAGE=javascript>
var strServerSignedData = "<%=strSignedData%>";
var strServerRan = "<%=strRandom%>";
var strServerCert = "<%=strServerCert%>";
function LoginForm_onsubmit() {

	var ret;
	var strContainerName = LoginForm.UserList.value;
	var strPin = LoginForm.UserPwd.value;
	
	ret = Login(LoginForm,strContainerName,strPin);
	LoginForm.UserPwd.value = "";
	if(!ret)
	{
		return false;
	}
	else
		return true;
}
</SCRIPT>

</head>
<body>
<div>
<table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td background="image/top0.jpg" height="147" ></td>
  </tr>
  <tr>
    <td height="532" background="image/utop.jpg" >
    <table width="100%" height="100%" border="0">
  <tr>
    <td width="500"></td>
    <td height="30">&nbsp;</td>
  </tr>
  <tr>
    <td align="right" valign="top">&nbsp;</td>
    <td valign="top" align="center">
<br>
<br><br>
<br>
<input name="loginType"  class="loginFormCheckbox"  type="radio" checked="checked" value="0" onClick="goToSign()"><b></b>用户名密码登录&nbsp;&nbsp;&nbsp;&nbsp;<input name="loginType"  class="loginFormCheckbox"  type="radio" value="1" checked="checked"><b></b>数字证书登录<br>
<br>
<form method="post" ID="LoginForm" name="LoginForm" action="usbKeyUserLoginWith.do" onSubmit="return LoginForm_onsubmit()">
  <table width="290" border="0" cellspacing="0" cellpadding="0" style="line-height:35px; font-size:13px;">
<tr>
<td width="100" align="right">选择证书：</td>
<td width="190"><select id="UserList" name="UserList" style="width:100px;"></select></td>
</tr>
<tr>
<td align="right">证书口令：</td>
<td><input type="password" name="pwd1" id="UserPwd" style="width:100px;"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td><input type="submit" value="登录"  >
</td>
</tr>

</table>
<input type="hidden" name="redirectTo" value="/system/index.do"/>
<input type="hidden" ID="UserSignedData" name="UserSignedData">
<input type="hidden" ID="UserCert" name="UserCert">
<input type="hidden" ID="ContainerName" name="ContainerName">
</form>

    </td>
  </tr>
</table>
</td>
</tr>
</table>
</div>

</body>
</html>
<%@ include file="../../result.jsp"%>
<SCRIPT LANGUAGE=JAVASCRIPT event=OnLoad for=window>
	GetList("LoginForm.UserList");
	LoginForm.UserPwd.focus();
</SCRIPT>
<SCRIPT FOR=XTXAPP EVENT=OnUsbkeyChange LANGUAGE=javascript>
  ChangeUserList("LoginForm.UserList");
  LoginForm.UserPwd.focus();
</SCRIPT>
<script>
function goToSign(){
	window.location.replace("open_login.do?redirectTo=%2Fsystem%2Findex.do");
}
//用于显示提示信息
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult !=null && operateResult!="" ){
		alert(operateResult);
	}
});
</script>