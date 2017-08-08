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
	
	String ContainerName = (String) session.getAttribute("ContainerName");
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
			var signCert = GetSignCert(ContainerName);
			function Sign() 
			{
	            var signData="";
				if (TestForm.ming.value == "") 
				{
					 alert("Parameter is empty!");
					 return ;
				}
	            signData = SignByP7(ContainerName,TestForm.ming.value);
	            if(signData==''){
					TestForm.qianming.value = '';
					alert('签名失败,' + errorMsg);
					return;
				}
	            TestForm.qianming.value = signData;
            }
            
            function VerifySign() 
            {
	            var result="";
	            result = VerifyDatabyP7(TestForm.qianming.value);
	            if(result == 0)
	            {
		            TestForm.yanzheng.value = "验证签名失败！";
	            }
	            else
	            {
		            TestForm.yanzheng.value = "验证签名成功！";
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
								P7签名功能演示
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
								<form method="post" ID="TestForm" action="">
									<table width="98%" border="0" align="center" cellpadding="5"
										cellspacing="1" class="table1">
										<tr>
											<td style="font-size:14px;" width="35%">
												需要P7签名的数据：
											</td>
											<td style="font-size:14px;">
												<textarea cols=40 name=textarea1 id=ming cols="40" rows="6">写入需要签名的数据</textarea>
											</td>
										</tr>
										<tr>
											<td style="font-size:14px;">
												<input type="button" value="P7签名" name="B12" class="button"
													onClick="JScript:Sign();">
											</td>
											<td style="font-size:14px;">
												<textarea cols=40 name=textarea2 id=qianming cols="40" rows="6">签名结果显示</textarea>
											</td>
										</tr>
										<tr>
											<td style="font-size:14px;">
												<input type="button" value="验证P7签名" name="B13" class="button"
													onClick="JScript:VerifySign();">
												<div align="center">
													<font color="#FF0000">需要修改签名数据,<br>则验签失败！</font>
												</div>
											</td>
											<td style="font-size:14px;">
												<textarea cols=40 name=textarea3 id=yanzheng cols="40" rows="6">验证签名结果显示!</textarea>
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
