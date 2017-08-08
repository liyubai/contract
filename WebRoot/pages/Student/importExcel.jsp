<%@ page language="java" contentType="text/html; charset=utf-8"
 pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生管理</title>
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <link href="<%=request.getContextPath()%>/contract/themes/cupertino/selfStyle.css" rel="stylesheet" type="text/css" />
    <!-- 此js务必放在所有页面自带的js后面加载 -->
    <script src="<%=request.getContextPath()%>/contract/scripts/base.min.js"></script>
    <script type="text/javascript">
    function selectFile(fnUpload) {
      var filename = fnUpload.value; 
      var mime = filename.toLowerCase().substr(filename.lastIndexOf("."),filename.length); 
      if (mime != ".xls" && mime != ".xlsx") { 
    	alert("请选择Excel格式的文件上传"); 
    	fnUpload.outerHTML=fnUpload.outerHTML; 
      }
    }
    </script>
</head>

<body>
<jsp:include page="/pages/common/topPart.jsp"/>
<jsp:include page="/pages/common/leftPart.jsp"/>
<div id="rightPartA" style="overflow-x:hidden;">
<div style="margin-right:80px;">
<form action="<%=request.getContextPath()%>/system/studentManagent_inputStudent.do" enctype="multipart/form-data"
		method="post"> 
  <table>
    <tr>
      <td><h3>请选择Excel文件：<input type="file"  name="upload"  onchange="selectFile(this)"/></h3></td>
    </tr>
    <tr>
      <td><input type="submit"  value="导入Excel" style="height:35px;width:100px;background: green; color: white;"/></td>
    </tr>
    <tr>
      <td><h3>请按照下图Excel数据格式导入Excel</h3></td>
    </tr>
    <div>
      <tr>
        <td><img src="/contract/contract/themes/cupertino/images/excelType.JPG" style="margin-right:400px;"></td>
      </tr>
    </div>
  </table>
</form>
</div>
</div>
</body>
</html>
