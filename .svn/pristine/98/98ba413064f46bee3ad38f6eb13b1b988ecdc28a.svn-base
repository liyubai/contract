<%@page import="java.util.*,java.io.FileInputStream"%>
<%@page import = "cn.org.bjca.client.security.SecurityEngineDeal"%>
<%
	request.setCharacterEncoding("GBK");
	Properties properties = new Properties();
	properties.load(new FileInputStream(application.getRealPath("/usbk/webappName.properties")));
	
	SecurityEngineDeal.setProfilePath("C:/BJCAROOT");
	
	SecurityEngineDeal sed = null;
  	sed = SecurityEngineDeal.getInstance(properties.getProperty("webappName"));
	String function = properties.getProperty("function");
%>
