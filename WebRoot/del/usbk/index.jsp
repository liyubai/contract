<%@page contentType="text/html; charset=GBK"%>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%@include file="properties.jsp"%>
<%
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

		<title>BJCA证书应用演示环境</title>
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
}
img{display:block}

-->
</style>
		<link href="style.css" rel="stylesheet" type="text/css" />
		<SCRIPT language=JavaScript src="date.js"></SCRIPT>
		<SCRIPT language=JavaScript src="SecX_Common.js"></SCRIPT>
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
		
		<table width="957" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="60">
					<img src="images/logo.gif" width="245" height="36" />
				</td>
			</tr>
		</table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>

					<table width="957" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td width="64">
								<img src="images/z1.gif" width="64" height="221" />
							</td>
							<td width="304">
								<img src="images/z2.gif" width="304" height="221" />
							</td>
							<td width="338">
								<img src="images/z3.gif" width="338" height="221" />
							</td>
							<td>
								<img src="images/z4.gif" width="251" height="221" />
							</td>
						</tr>
						<tr>
							<td valign="top">
								<img src="images/m1.gif" width="64" height="151" />
							</td>
							<td valign="top">
								<img src="images/m2.gif" width="304" height="151" />
							</td>
							<td valign="top">
								<form method="post" ID="LoginForm" name="LoginForm" action="login.jsp"
									onsubmit="return LoginForm_onsubmit()">

									<table id="bs" width="90%" border="0" align="center"
										cellpadding="0" cellspacing="0">
										<tr>
											<td height="20" colspan="3"></td>
										</tr>
										<tr>
											<td width="60" class="font1">
												选择证书
											</td>

											<td colspan="2">
												<select id="UserList" name="UserList" style="width: 141px;">
												</select>
											</td>

										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
											<td colspan="2">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td class="font1">
												选择口令
											</td>
											<td colspan="2">
												<input type="password" name="pwd1" id="UserPwd" size="16"
													maxlength="16">
											</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
											<td colspan="2">
												&nbsp;
											</td>
										</tr>
										<tr>
											<td>
												&nbsp;
											</td>
											<td width="65">

												<input type="submit"
													style="border: none; background: url(images/submit.gif) left top no-repeat; width: 58px; height: 30px;"
													value="" name="B1">
											</td>
											<td>
												<a href="logout.jsp"><img src="images/repe.gif"
														width="88" height="30" border="0" /> </a>

											</td>
										</tr>
										<tr>
											<td height="5" colspan="2">
												&nbsp;
											</td>
										</tr>
									</table>
									<input type="hidden" ID="UserSignedData" name="UserSignedData">
									<input type="hidden" ID="UserCert" name="UserCert">
									<input type="hidden" ID="ContainerName" name="ContainerName">
								</form>
							</td>
							<td valign="top">
								<img src="images/m4.gif" width="251" height="151" />
							</td>
						</tr>
						<tr>
							<td valign="top">
								<img src="images/b1.gif" width="64" height="20" />
							</td>
							<td valign="top">
								<img src="images/b2.gif" width="304" height="20" />
							</td>
							<td valign="top">
								<img src="images/b3.gif" width="338" height="20" />
							</td>
							<td valign="top">
								<img src="images/b4.gif" width="251" height="20" />
							</td>
						</tr>
						<tr>
							<td colspan="4" height="110"></td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<%@include file="bottom.jsp"%>
		
		
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