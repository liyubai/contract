<%@page contentType="text/html; charset=GBK"%>
<%@page import="java.util.*"%>
<%@include file="properties.jsp"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
	
	//判断session是否失效
	String UniqueID = (String) session.getAttribute("UniqueID");
	if (UniqueID == null || UniqueID.equals("")) {
		response.sendRedirect("index.jsp");
	}

	String strServerCert = null;
	strServerCert = sed.getServerCertificate();
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

		    var SeverCert = "<%=strServerCert%>";
		    function DoEncetpy()
		    {  		 
		        var OrData =  TestForm.field1.value;
		        var i=OrData.length;
		        if(i<=0){
					alert("请输入需要加密的数据");
					return false;
				}
				if(i>1470000)
				{
				alert("需要加密的数据过长，无法加密！");
				return false;
				}
		        TestForm.field1.value = "";
		        var enckey = GenerateRandom(24);
		        
		        var encryptData = EncryptData(enckey,OrData);
		        if(enckey==''||encryptData==''){
		        	alert('表单加密失败,' + errorMsg);
					return false;
		        } 
		        TestForm.Enckey.value = enckey;	 
		        TestForm.EncryptData.value = encryptData;	
		        
		        alert("提交的加密数据:\n"+TestForm.Enckey.value + "|" + TestForm.EncryptData.value);
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
								表单加密功能演示
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
								<form method="post" ID="TestForm" action="EncryptFormSubmit.jsp"
									onsubmit="return DoEncetpy();">
									<table width="98%" border="0" align="center" cellpadding="5"
										cellspacing="1" class="table1">
										<tr>
											<td style="font-size:14px;" width="35%">
												需要加密的数据：
											</td>
											<td style="font-size:14px;">
												<textarea cols=40 name=field1 rows=6>写入需要加密的数据！</textarea>
											</td>
										</tr>
										<tr valign="middle">
											<td style="font-size:14px;">
												<input type="Submit" value="提交" name="B1" class="button" style="width:50px;">
											</td>
											<td style="font-size:14px;">
												<input type="reset" value="全部重写" name="B2" class="button">
											</td>
										</tr>
									</table>
									<INPUT type="hidden" name="Enckey" id="Enckey">
									<INPUT type="hidden" name="EncryptData" id="EncryptData">
									
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