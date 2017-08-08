<%@page contentType="text/html; charset=GBK"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	//�ж�session�Ƿ�ʧЧ
	String UniqueID = (String) session.getAttribute("UniqueID");
	if (UniqueID == null || UniqueID.equals("")) {
		response.sendRedirect("index.jsp");
	}
	
	//��õ�½�û�ContainerName
	String ContainerName = (String) session
			.getAttribute("ContainerName");
	//��õ�½�û�ID
	String uniqueIdStr = (String) session.getAttribute("UniqueID");
%>

<html>
	<head>

		<title>BJCA֤��Ӧ����ʾ����</title>
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
					alert("����֤����Ϣʧ��," + errorMsg);
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
								�û�֤����Ϣ
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
											��½�û�ID��
										</td>
										<td style="font-size:14px;">
											<script>GetExtCertinfo("2.16.840.1.113732.2");</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											֤��汾��
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(1);</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											֤�����кţ�
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(2);</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											�û�ͨ������
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(17);</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											֤�鷢����ͨ������
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(8);</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											֤����Ч����ʼ��
										</td>
										<td style="font-size:14px;">
											<script>GetCertinfo(11);</script>
										</td>
									</tr>
									<tr>
										<td style="font-size:14px;" width="35%">
											֤����Ч�ڽ�ֹ��
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


