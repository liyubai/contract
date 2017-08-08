<%@page contentType="text/html; charset=GBK"%>
<%@page import="cn.org.bjca.client.utils.*"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.*,java.io.FileInputStream"%>

<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<%@include file="properties.jsp"%>
<%
	String path = GetPathUtil.getProfileDir();
	MultipartRequest multiPartRe = new MultipartRequest(request, path,
			1000000000, "GB2312");

	String signValue = multiPartRe.getParameter("SignedData");

	String filePath = multiPartRe.getParameter("InData");

	int i = filePath.lastIndexOf("/");
	int j = filePath.lastIndexOf("\\");
	String fileName = "";
	if (i > j) {
		fileName = filePath.substring(i + 1);
	} else {
		fileName = filePath.substring(j + 1);
	}

	String nativeFilePath = path + "/" + fileName;

	String cert = multiPartRe.getParameter("SignCert");

	signValue = new String(signValue.getBytes("ISO-8859-1"), "GB2312");
	String UserSignedData = signValue;

	String strValue1 = "";
	//System.out.println("cert=" + cert);
	//System.out.println("nativeFilePath=" + nativeFilePath);
	//System.out.println("signValue=" + signValue);
	try {
		boolean rv = sed.verifySignedFile(cert, nativeFilePath,
				signValue);

		if (rv) {
			strValue1 = "验证成功！";
		} else {
			strValue1 = "验证失败！";
		}
	} catch (Exception e) {
		System.out.println("文件签名验证失败");

		e.printStackTrace();
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

		<Script Language="JavaScript">
			function verifyForm() 
			{
				ccForm.teststr.value = document.all.textarea1.value;
				ccForm.submit();
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
								文件签名验证
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
								<form method="post" ID="TestForm" action="signFileVerify.jsp"
									ENCTYPE="multipart/form-data">
									<table width="98%" border="0" align="center" cellpadding="5"
										cellspacing="1" class="table1">
										<tr>
											<td style="font-size:14px;" width="35%">
												签名数据：
											</td>
											<td style="font-size:14px;">
												<textarea cols=40 name=textarea1 id=signData cols="40" rows="6"><%=UserSignedData%></textarea>
											</td>
										</tr>
										<tr>
											<td style="font-size:14px;">
												<div align="center">
													验证结果：
												</div>
											</td>
											<td style="font-size:14px;">
												<textarea name=field1 cols="40" rows="6" readonly><%=strValue1%></textarea>
											</td>
										</tr>
									</table>
									
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