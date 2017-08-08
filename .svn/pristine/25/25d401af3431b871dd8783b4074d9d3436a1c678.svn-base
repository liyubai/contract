<%@page contentType="text/html; charset=GBK"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	request.setCharacterEncoding("GBK");
%>
<%
	String formData = request.getParameter("OData");
	String EnvlopeData = request.getParameter("EnvlopeData");
	//System.out.println("EnvlopeData000=" + EnvlopeData);
	session.setAttribute("OData",formData);
	session.setAttribute("EnvlopeData",EnvlopeData);

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
		
	</head>
	<body>
		<%@include file="top.jsp" %>
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
								表单签名功能演示
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
								<form method="post" ID="TestForm" action="envlopedecryptForm.jsp">
									<table width="375" border="1" align="center" cellspacing="0"
										cellpadding="0" bordercolor="#cc3333">
										<tr>
											<td height="60" align="center" style="font-size:14px;">
												<span>数字信封数据已经成功提交到服务器！</span>
											</td>
										</tr>
										<tr>
											<td height="30" align="center">
												<input type="submit" value="取数字信封表单内容" name="decryptBut" class="button">
											</td>
										</tr>
									</table>
									<INPUT type="hidden" name="EnvlopeData" id="EnvlopeData"
										value="">
									<INPUT type="hidden" name="OData" id="OData"
										value="">
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