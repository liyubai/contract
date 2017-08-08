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
					alert('签名失败!');
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
								文件签名功能演示
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
										如果使用IE8或更高版本浏览器,请将此站点加入可信站点列表,否则可能导致签名失败！<br/>
										注意添加可信站点时添加http://...而不是https://...,具体操作为添加可信站点时将"对该<br/>
										区域中的所有站点要求服务器验证(https:)(S)"前面的勾去掉即可
									</font>
								</div>
								<form method="post" ID="TestForm" action="signFileVerify.jsp"
									ENCTYPE="multipart/form-data">
									<table width="98%" border="0" align="center" cellpadding="5"
										cellspacing="1" class="table1">
										<tr>
											<td style="font-size:14px;" width="35%">
												需要签名的文件：
											</td>
											<td style="font-size:14px;">
												<input type="file" name=ming id=ming></input>
											</td>
										</tr>
										<tr>
											<td style="font-size:14px;">
												<input type="button" value="签名" class="button" style="width:50px;" onclick="Sign();">
												<div align="center">
													<font color="#FF0000" style="font-size:14px;">
														如果上传的文件内容为空，<br>则签名失败！
													</font>
												</div>
											</td>
											<td style="font-size:14px;">
												<textarea name=SignedData id=SignedData cols="40" rows="6">签名结果显示！</textarea>
											</td>
										</tr>
									</table>

									<p align="center">
										
										<input type="submit" value="验签" class="button" style="width:50px;">
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
