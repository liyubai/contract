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
			function modPassword(){
				var ContainerName = "<%=ContainerName%>";
				var oldPwd = TestForm.oldPwd.value;
				 
				var newPwd = TestForm.newPwd.value;
				 
				var verifyPwd = TestForm.verifyPwd.value;
				 
				if(oldPwd == "" )
				{
					alert("请输入旧口令！");
					return;
				}
				if(newPwd == "")
				{
					alert("请输入新口令！");
					return;
				}
				if(newPwd.length<4||newPwd.length>16||verifyPwd.length<4||verifyPwd.length>16){
					alert("密码长度应该在4-16位之间");
					return;
				}
				if(verifyPwd == newPwd)
				{
					var rv = ChangeUserPassword(ContainerName,oldPwd,newPwd);
					if(rv)
					alert("修改成功！");
					else
					alert("修改失败，请重试！");
					TestForm.oldPwd.value = "";
					TestForm.newPwd.value = "";
					TestForm.verifyPwd.value = "";
				}
				else
				{
					alert("两次密码不一致，请重新输入！");
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
								修改证书密码
							</td>
						</tr>
						<tr>
                        	<td height="5"></td>
                        </tr>
						<tr>
							<td>
								&nbsp;
							</td>

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
							<td>
								<p align="center">
									<font color="#cc3333" size="3"><b>修 改 私 钥 保 护 口 令</b> </font>
								</p>
								<p>
								<form method="post" ID="TestForm">
									<table width="98%" border="0" align="center" cellpadding="5"
										cellspacing="1" class="table1">
										<tr>
											<td style="font-size:14px;" width="35%">
												旧口令：
											</td>
											<td style="font-size:14px;">
												<input type="password" name="textfield" id=oldPwd size="15">
											</td>
										</tr>
										<tr>
											<td style="font-size:14px;">
												新口令：
											</td>
											<td style="font-size:14px;">
												<input type="password" name="textfield2" id=newPwd size="15">
											</td>
										</tr>
										<tr>
											<td style="font-size:14px;">
												确认新口令：
											</td>
											<td style="font-size:14px;">
												<input type="password" name="textfield3" id=verifyPwd size="15">
											</td>
										</tr>
										<tr>
											<td style="font-size:14px;">
												<input type="button" value="提交" name="B122" class="button" style="width:50px;"
													onclick="JavaScript:modPassword();">
											</td>
											<td style="font-size:14px;">
												<input type="reset" value="全部重写" name="B2" class="button">
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

