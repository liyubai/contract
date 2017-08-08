<%@page contentType="text/html; charset=GBK"%>
<%@page import="java.util.*"%>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%@include file="properties.jsp"%>
<%

	String EncKey = (String) session.getAttribute("Enckey");
	session.removeAttribute("Enckey");
	String EncData = (String) session.getAttribute("EncryptData");
	session.removeAttribute("EncryptData");
	String key;
	
	String strValue1 = "";

	/*key = sed.priKeyDecrypt(EncKey);
	if(key==null||(key!=null&&key.equals(""))||EncData==null||(EncData!=null&&EncData.equals(""))){
		out.println("解密数据出错,获取表单数据失败！");
	}*/
	strValue1 = sed.symmDecryptData(EncKey, EncData);
	
	if (strValue1 == null) {
		out.println("解密数据有误！");
		return;
	}
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
		-->
		</style>
		<link href="style.css" rel="stylesheet" type="text/css" />

		<SCRIPT language=JavaScript src="SecX_Common.js"></SCRIPT>
		<Script Language="JavaScript">
			function decryptForm() {
				var tabele = document.getElementById("tabForm");
				tabele.style.display = "";
			}
		</Script>
	</head>
	<body>
		<%@include file="top.jsp"%>
		<table width="957" border="0" align="center" cellpadding="0"
			cellspacing="0">

			<tr>
				<td bgcolor="#FEFDFB">
					&nbsp;
				</td>
			</tr>
			<tr>
				<td width="267" align="left" valign="top">
					<%@include file="form.jsp"%>
				</td>
				<td align="left" valign="top" bgcolor="#FEFDFB">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td>
								&nbsp;
							</td>
							<td class="font1">
								<img src="images/jt.gif" width="12" height="12" />
								表单解密功能演示
							</td>
						</tr>
						<tr>
                        	<td height="5"></td>
                        </tr>
						<tr>
							<td></td>
							<td>
								<table width="100%" height="2" border="0" cellpadding="0"
									cellspacing="0">
									<tr>
										<td height="2" bgcolor="#CCCCCC"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
                        	<td height="10"></td>
                        </tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td align="left" valign="top">
								<table width="98%" border="0" align="center" cellpadding="5"
									cellspacing="1" class="table1">
									<tr>
										<td style="font-size:14px;" width="35%">
											加密表单数据：
										</td>
										<td style="font-size:14px;">
											<textarea cols=40 name=textarea1 id=encryptData rows=6
												readonly><%=EncKey + "|" + EncData%></textarea>
										</td>
									</tr>
								</table>
								<p align="center">
									<input type="button" value=" 解 密 " name="decryptBut" class="button"
										onClick="JScript:decryptForm();">
								</p>
								<form method="post" ID="TestForm">
									<table id="tabForm" width="98%" border="0" align="center"
										cellspacing="1" cellpadding="5" class="table1" style="display: none">
										<tr>
											<td style="font-size:14px;" width="35%">
												解密表单数据：
											</td>
											<td style="font-size:14px;">
												<textarea cols=40 name=field1 rows=6 readonly><%=strValue1%></textarea>
											</td>
										</tr>
									</table>
									<p align="center">
									</p>
								</form>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
		<%@include file="bottom.jsp"%>
	</body>
</html>

