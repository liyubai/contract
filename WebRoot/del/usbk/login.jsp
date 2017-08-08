<%@page contentType="text/html; charset=GBK"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);

	String ranStr = (String) session.getAttribute("Random");
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

	</head>
	<body>
		<%@include file="top.jsp"%>
		<table width="957" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td bgcolor="#FEFDFB">
					<table width="70%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td height="30" colspan="3">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td width="50" align="right">
								<img src="images/cc.gif" width="43" height="62" />
							</td>
							<td width="20">
								&nbsp;
							</td>
							<td>
								<%@include file="properties.jsp"%>
								<%
									//��õ�½�û�cert
									String clientCert = request.getParameter("UserCert");
									String UserSignedData = request.getParameter("UserSignedData");
									String ContainerName = request.getParameter("ContainerName");
									String certPub = sed.getCertInfo(clientCert, 8);

									//��֤�ͻ���֤��
									try {

										int retValue = sed.validateCert(clientCert);

										if (retValue == 1) {

											session.setAttribute("ContainerName", ContainerName);

											String uniqueIdStr = "";
											try {
												uniqueIdStr = sed.getCertInfo(clientCert, 17);
											} catch (Exception e) {
												out.println("<p><h3>�ͻ���֤����֤ʧ��:" + e.getMessage()
														+ "</h3><p>");
											}
											session.setAttribute("UniqueID", uniqueIdStr);

											String uniqueId = "";
											try {
												//��õ�½�û�ID
												uniqueId = sed.getCertInfoByOid(clientCert,
														"1.2.156.112562.2.1.1.1");
											} catch (Exception e) {
												
											}
											if(uniqueId==null||(uniqueId!=null&&uniqueId.equals(""))){
												try {
													//��õ�½�û�ID
													uniqueId = sed.getCertInfoByOid(clientCert,
															"2.16.840.1.113732.2");
												} catch (Exception e) {
													out.println("<p><h3>�ͻ���֤����֤ʧ��:" + e.getMessage()
															+ "</h3><p>");
												}
											}

											out.println("<h3>��ӭ��ʹ�ñ�ϵͳ!</h3>");
											out.println("<h3>����ͨ������");
											out.println(uniqueIdStr);
											out.println("<br/>֤��䷢��(�䷢��ͨ����): ");
											out.println(certPub);
											if(uniqueId!=null&&!uniqueId.equals("")){
												out.println("<br/>֤��Ψһ��ʶ(��������ͨ����)��");
												out.println(uniqueId);
												out.println("<font color='red'>(ʵ�ʼ���ʱ,�ὫΨһ��ʶ�����ݿ�ȶ�,�ж��Ƿ�Ϊ�Ϸ��û�)</font>");
											}
											out.println("</h3><br/>");
										} else {
											out.println("<h3>�ͻ���֤����֤ʧ�ܣ�</h3><br/>");
											out.println("<h3><font color='red'>");

											if (retValue == -1) {
												out.println("��¼֤��ĸ���������");
											} else if (retValue == -2) {
												out.println("��¼֤�鳬����Ч��");
											} else if (retValue == -3) {
												out.println("��¼֤��Ϊ����֤��");
											} else if (retValue == -4) {
												out.println("��¼֤�鱻��ʱ����");
											} else if (retValue == -5) {
												out.println("��¼֤��δ��Ч");
											}
											out.println("</font></h3>");
											return;
										}
									} catch (Exception ex) {
										out.println("<p><h3>�ͻ���֤����֤ʧ��:" + ex.getMessage() + "</h3><p>");
										return;
									}

									//��֤�ͻ���ǩ��
									try {
										if (sed.verifySignedData(clientCert, ranStr, UserSignedData)) {
										
										} else {
											out.println("<h3>��֤�ͻ���ǩ������</h3>");
											return;
										}
									} catch (Exception e) {
										out.println("<p><h3>��֤�ͻ���ǩ������:" + e.getMessage() + "</h3><p>");
										return;
									}
								%>
							</td>
						</tr>
						<tr>
							<td height="30" colspan="3"></td>
						</tr>
					</table>
				</td>
			</tr>
			<%
				if(function!=null&&function.equals("1")){ 
			 %>
			<tr>
				<td bgcolor="#FEFDFB">
					<table width="70%" border="0" align="center" cellpadding="1"
						cellspacing="1" class="table1">
						<tr>
							<td background="images/bjb.gif">
								���ݱ��ش�����ʾ
							</td>
							<td background="images/bjb.gif">
								���ύ������ʾ
							</td>
						</tr>
						<tr>
							<td>
								<a href="sign.jsp">����ǩ��</a>
							</td>
							<td>
								<a href="signForm.jsp">��ǩ��</a>
							</td>
						</tr>
						<tr>
							<td> 
								<a href="envelope.jsp">�����ŷ�</a>
							</td>
							<td>
								<a href="envlopeForm.jsp">�������ŷ�</a>
							</td>
						</tr>
						<tr>
							<td> 
								<a href="encrypt.jsp">���ݼ���</a>
							</td>
							<td>
								<a href="EncryptForm.jsp">������</a>
							</td>
						</tr>
						<tr>
							<td> 
								<a href="signByP7.jsp">Pkcs7ǩ��</a>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<!-- 
						<tr>
							<td> 
								<a href="signfile.jsp">�ļ�ǩ��</a>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						 -->
						<tr>
							<td background="images/bjb.gif">
								��������
							</td>
							<td background="images/bjb.gif">
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<a href="viewCert.jsp">����֤����Ϣ</a>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<a href="modifypwd.jsp">�޸�֤������</a>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
							<td>
								<a href="logout.jsp">�˳�ϵͳ</a>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<%
				}
			 %>
			<tr>
				<td colspan="4" height="50"></td>
			</tr>
		</table>
		<%@include file="bottom.jsp"%>
	</body>

</html>

