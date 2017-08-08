<%@ page language="java" pageEncoding="UTF-8"%>
<%
String result = request.getParameter("statusMsg");
//System.out.println(result);
if(result!=null){
result = new String(result.getBytes("ISO-8859-1"),"utf-8");
}else{
	result = "";
}

if(result.equals("1")){
	result = "操作失败。";
}else if(result.equals("0")){

	result = "操作成功。";
}else{
result = "";
}
%>
<input type="hidden"  id="statusMsgId" value="<%=result%>" />