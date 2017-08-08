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
		<Script Language="JavaScript">
	
			var ContainerName = "<%=ContainerName%>";
			function Sign() {
				var signData="";
				if (TestForm.ming.value == "") {
					alert("Parameter is empty!");
					return ;
				}
				
				var filepath = TestForm.ming.value;
				alert("filePath=" + filepath);
			 	signData = SignFile(TestForm.ming.value,ContainerName);
				if(signData==''){
					TestForm.SignedData.value = '';
					alert('ǩ��ʧ��!');
					return false;
				}
				
				var cert = GetSignCert(ContainerName);
				
				TestForm.SignCert.value = cert;
				TestForm.InData.value = filepath;
				TestForm.SignedData.value = signData;
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
								�ļ�ǩ��������ʾ
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
								<div align="center">
									<font color="#FF0000" style="font-size:14px;">
										���ʹ��IE8����߰汾�����,�뽫��վ��������վ���б�,������ܵ���ǩ��ʧ�ܣ�<br/>
										ע����ӿ���վ��ʱ���http://...������https://...,�������Ϊ��ӿ���վ��ʱ��"�Ը�<br/>
										�����е�����վ��Ҫ���������֤(https:)(S)"ǰ��Ĺ�ȥ������
									</font>
								</div>
								<form method="post" ID="TestForm" action="signFileVerify.jsp"
									ENCTYPE="multipart/form-data">
									<table width="98%" border="0" align="center" cellpadding="5"
										cellspacing="1" class="table1">
										<tr>
											<td style="font-size:14px;" width="35%">
												��Ҫǩ�����ļ���
											</td>
											<td style="font-size:14px;">
												<input type="file" name=ming id=ming></input>
											</td>
										</tr>
										<tr>
											<td style="font-size:14px;">
												<input type="button" value="ǩ��" class="button" style="width:50px;" onclick="Sign();">
												<div align="center">
													<font color="#FF0000" style="font-size:14px;">
														����ϴ����ļ�����Ϊ�գ�<br>��ǩ��ʧ�ܣ�
													</font>
												</div>
											</td>
											<td style="font-size:14px;">
												<textarea name=SignedData id=SignedData cols="40" rows="6">ǩ�������ʾ��</textarea>
											</td>
										</tr>
									</table>

									<p align="center">
										
										<input type="submit" value="��ǩ" class="button" style="width:50px;">
										<br />
										<br />
										
									</p>
									<input id="InData" name="InData" type="hidden" />
									<input id="SignCert" name="SignCert" type="hidden" />
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
