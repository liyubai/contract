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
	String EnvlopeData = (String) session.getAttribute("EnvlopeData");
	session.removeAttribute("EnvlopeData");
	
	if(formData==null||(formData!=null&&formData.equals(""))
		||EnvlopeData==null||(EnvlopeData!=null&&EnvlopeData.equals(""))){
		out.println("表单数字信封出错,获取表单数据失败！");
	}

	byte [] orid;
	String tmpdata;
	String message = "";
	try {
		formData = formData.replaceAll("\\\\\\\"", "\\\"");
		//System.out.println("EnvlopeData1=" + EnvlopeData);
		byte [] s = sed.base64Decode(EnvlopeData);
		orid = sed.decodeEnvelopedData(s);
		tmpdata = new String(orid);
		//System.out.println("tmpdata=" + tmpdata);
	}catch (Exception e) {
		tmpdata = "";
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
			function DecryptForm() {
				var tabele = document.getElementById("tabDecrypt");
				var d = document.getElementById("tabCert");
				tabele.style.display = "";
				if(d!=null)
				{
					d.style.display = "";
				}
			}
			
			function CompareData()
			{
				var o = TestForm.formData.value;
				var t = document.getElementById("decrypteddata").value;
				if (o == t) {
					alert("解密后的数据和原文一致!");
				} else {
					alert("解密后的数据和原文不一致!");
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
								表单数字信封解密功能演示
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
							<form method="post" ID="TestForm" name="TestForm" action="VerifySignForm1.jsp"
									>
								<table width="98%" border="0" align="center" cellpadding="5"
									cellspacing="1" class="table1">
									
									<tr>
										<td style="font-size:14px;" width="35%">
											数字信封数据：
										</td>
										<td style="font-size:14px;">
											<textarea cols=40 name=EnvlopeData id=EnvlopeData rows=6 readonly><%=EnvlopeData%></textarea>
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
											<textarea cols=40 name=formData rows=6 readonly><%=formData%></textarea>
										</td>
									</tr>
									
								</table>
								</form>
								<br>
								<p align="center">
									<input type="button" value=" 解密 " name="verifyBut" class="button"
										onClick="JScript:DecryptForm();">
								</p>
								<table id="tabDecrypt" width="98%" border="0" align="center"
									cellspacing="1" cellpadding="5" class="table1" style="display: none">
									<tr>
										<td colspan="2" style="font-size:14px;">
											<%
												if (tmpdata != "") {
													out.println("数字信封解密完成！");
												} else {
													out.println("数字信封解密错误:" + message);
													
												}
											%>
										</td>
									</tr>
								</table>
								<%
									if (tmpdata != "") {
								%>
								<table id="tabCert" width="98%" border="0" align="center"
									cellspacing="1" cellpadding="5" class="table1" style="display: none">
									<tr>
										<td style="font-size:14px;" width="35%">
											解密后的数据：
										</td>
										<td style="font-size:14px;">
											<textarea cols=40 name=decrypteddata id=decrypteddata rows=6 readonly><%=tmpdata%></textarea>
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
