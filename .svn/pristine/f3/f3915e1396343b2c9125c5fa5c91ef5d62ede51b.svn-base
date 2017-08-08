<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Excel导入错误信息提示</title>
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="/pages/common/topPart.jsp"/>
<jsp:include page="/pages/common/leftPart.jsp"/>
<div id="rightPartA" style="overflow-x:hidden;">
<div style="margin-right:560px;">
<tr><td><h2>错误信息为：</h2></td></tr>
<textarea rows="20" cols="70">
<s:iterator value="#request.errorList" id="item">
  <s:property value="#item" escape="false"/>
</s:iterator>
</textarea><br>
  <input type="button" value="返回" style="height:35px;width:80px;background: green; color: white;margin-left:482px;" onclick="javascript:history.go(-1);">
</div>
</div>
</body>
</html>