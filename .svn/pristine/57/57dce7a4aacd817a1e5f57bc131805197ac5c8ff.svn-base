<%@page contentType="text/html; charset=GBK"%>
<%@page import="java.util.*"%>
<%@include file="properties.jsp"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	request.setCharacterEncoding("GBK");
	String formData = (String) session.getAttribute("OData");
	session.removeAttribute("OData");
	String UserSignedData = (String) session.getAttribute("SignedData");
	String signcert = (String) session.getAttribute("Cert");
	session.removeAttribute("SignedData");
	session.removeAttribute("Cert");
	
	if(formData==null||(formData!=null&&formData.equals(""))
		||signcert==null||(signcert!=null&&signcert.equals(""))
		||UserSignedData==null||(UserSignedData!=null&&UserSignedData.equals(""))){
		out.println("表单验签出错,获取表单数据失败！");
	}

	boolean flag = true;
	String message = "";
	try {
		formData = formData.replaceAll("\\\\\\\"", "\\\"");
		flag = sed.verifySignedData(signcert, formData, UserSignedData);
		
	}catch (Exception e) {
		flag = false;
		out.println(" SignedData_Verify Err");
		message = e.getMessage();
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
			function verifyForm() {
				var tabele = document.getElementById("tabVerify");
				var tabcertele = document.getElementById("tabCert");
				tabele.style.display = "";
				if(tabcertele!=null)
				{
					tabcertele.style.display = "";
				}
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
								表单验签功能演示
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
											签名数据：
										</td>
										<td style="font-size:14px;">
											<textarea cols=40 name=textarea1 id=signData rows=6 readonly><%=UserSignedData%></textarea>
										</td>
									</tr>
								</table>
								<br>
								<table width="98%" border="0" align="center" cellpadding="5"
									cellspacing="1" class="table1">
									<tr>
										<td style="font-size:14px;" width="35%">
											表单数据：
										</td>
										<td style="font-size:14px;">
											<textarea cols=40 name=field1 rows=6 readonly><%=formData%></textarea>
										</td>
									</tr>
								</table>
								<br>
								<p align="center">
									<input type="button" value=" 验证签名 " name="verifyBut" class="button"
										onClick="JScript:verifyForm();">
								</p>
								<table id="tabVerify" width="98%" border="0" align="center"
									cellspacing="1" cellpadding="5" class="table1" style="display: none">
									<tr>
										<td colspan="2" style="font-size:14px;">
											<%
												if (flag) {
													out.println("验证客户端签名正确！");
												} else {
													out.println("验证客户端签名错误:" + message);
													return;
												}
											%>
										</td>
									</tr>
								</table>
								<%
									if (flag) {
								%>
								<table id="tabCert" width="98%" border="0" align="center"
									cellspacing="1" cellpadding="5" class="table1" style="display: none">
									<tr>
										<td style="font-size:14px;" width="35%">
											用户证书：
										</td>
										<td style="font-size:14px;">
											<textarea cols=40 name=textarea1 id=signcert rows=6 readonly><%=signcert%></textarea>
										</td>
									</tr>
								</table>

								<%
									}
								%>


							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<%@include file="bottom.jsp"%>
	</body>

</html>
