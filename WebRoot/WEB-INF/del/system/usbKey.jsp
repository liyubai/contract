<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.*,java.io.FileInputStream"%>
<%@page import = "cn.org.bjca.client.security.SecurityEngineDeal"%>
<%
String path = (String)request.getAttribute("usbkPath");
SecurityEngineDeal.setProfilePath(path);
SecurityEngineDeal sed = null;
sed = SecurityEngineDeal.getInstance("SVSDefault");
//System.out.println(path);
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
<html>
<head>
<title>数字证书绑定用户</title>
<script src="scripts/jquery.min.js"></script>
<SCRIPT language=JavaScript src="../js/date.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/SecX_Common.js"></SCRIPT>
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
<form method="post" ID="LoginForm" name="LoginForm" action="usbKeyToUser.do" onSubmit="return LoginForm_onsubmit()">
<br>
<table width="290" border="0" cellspacing="0" cellpadding="0" style="line-height:30px; font-size:13px;">
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
    <td><input type="submit" value="绑定" ></td>
  </tr>
</table>
<input type="hidden" name="id" value="${id}">
<input type="hidden" ID="UserSignedData" name="UserSignedData">
<input type="hidden" ID="UserCert" name="UserCert">
<input type="hidden" ID="ContainerName" name="ContainerName">
</form>
<%@ include file="../../result.jsp"%>
</body>
</html>
<SCRIPT LANGUAGE=JAVASCRIPT event=OnLoad for=window>
	GetList("LoginForm.UserList");
	LoginForm.UserPwd.focus();
</SCRIPT>
<SCRIPT FOR=XTXAPP EVENT=OnUsbkeyChange LANGUAGE=javascript>
  ChangeUserList("LoginForm.UserList");
  LoginForm.UserPwd.focus();
</SCRIPT>

<script>
//用于显示提示信息
var operateResult=$("#statusMsgId").val();
$(function(){
	if(operateResult !=null && operateResult!="" ){
		alert(operateResult);
		window.close();
		window.opener.location.reload();
	}
});
</script>