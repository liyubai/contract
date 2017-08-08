<%@page contentType="text/html; charset=GBK"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	//判断session是否失效
	String UniqueID = (String) session.getAttribute("UniqueID");
	if (UniqueID == null || UniqueID.equals("")) {
		response.sendRedirect("index.jsp");
	}
	
	//获得登陆用户ContainerName
	String ContainerName = (String) session
			.getAttribute("ContainerName");
	//获得登陆用户ID
	String uniqueIdStr = (String) session.getAttribute("UniqueID");
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
		<SCRIPT language="JavaScript">
			var ContainerName = "<%=ContainerName%>";
			var strUniqueID = "<%=uniqueIdStr%>";
						
			var cert = GetSignCert(ContainerName);
			function certIsNull(){
				if(cert==null||cert==''){
					alert("解析证书信息失败," + errorMsg);
				}
			}
			certIsNull();
			function GetCertinfo(id)
	        {
	           var info = GetCertBasicinfo(cert,id);
	           document.write(info);
	        }
	        function GetExtCertinfo(oid)
	        {
	           var info = GetExtCertInfoByOID(cert,oid);
	           document.write(info);
	        }
		</SCRIPT>

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
								用户证书信息
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
											登陆用户ID：
										</td>
										<td style="font-size:14px;">
											<script>GetExtCertinfo("2.16.840.1.113732.2");</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											证书版本：
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(1);</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											证书序列号：
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(2);</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											用户通用名：
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(17);</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											证书发放者通用名：
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(8);</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											证书有效期起始：
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(11);</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											证书有效期截止：
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(12);</script>
										</td>
									</tr>

								</table>
								
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<%@include file="bottom.jsp"%>
	</body>
</html>


