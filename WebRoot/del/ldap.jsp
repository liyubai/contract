<%@ page contentType="text/html; charset=utf-8" language="java" import="java.util.Date,java.util.Hashtable,org.apache.commons.lang.StringUtils,javax.naming.Context,javax.naming.NamingEnumeration,
javax.naming.NamingException,javax.naming.directory.Attribute,javax.naming.directory.Attributes,javax.naming.directory.DirContext,
javax.naming.directory.InitialDirContext,javax.naming.directory.SearchControls,javax.naming.directory.SearchResult"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
</body>
</html>
<%
String password = request.getParameter("password");
String loginID = request.getParameter("loginID");
 DirContext dc = null;
   String account = "";//操作LDAP的帐户。默认就是Manager。
   String password2 = "";//帐户Manager的密码。
   String root = "dc=cauc,dc=edu,dc=cn"; //LDAP的根节点的DC
String ladpPath="ldap://cauc.edu.cn:389/ou=CAUC,dc=cauc,dc=edu,dc=cn"; 
   Hashtable env = new Hashtable();
      env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
      env.put(Context.PROVIDER_URL, ladpPath);
      env.put(Context.SECURITY_AUTHENTICATION, "simple");
      env.put(Context.SECURITY_PRINCIPAL, "cn=" + account + "," + root);
      env.put(Context.SECURITY_CREDENTIALS, password2);
        
        try {
            dc = new InitialDirContext(env);//初始化上下文
            System.out.println("ok");
        } catch (javax.naming.AuthenticationException e) {
        	e.printStackTrace();
			//this.addActionError("认证失败：认证中心账户错误");
			//return INPUT;

        } catch (Exception e) {
        	e.printStackTrace();
           // this.addActionError("认证出错：网络连接超时");
			//return INPUT;
        }

     	SearchControls sc = new SearchControls();
    	sc.setSearchScope(SearchControls.SUBTREE_SCOPE);
    	NamingEnumeration ne = null;
    	try {
    		ne = dc.search("", "uid=" + loginID,sc);
			if(!ne.hasMore()){
				//this.addActionError("用户名在认证中心不存在");
				out.println("用户名在认证中心不存在");
				//return INPUT;
			}
			//获取查询结果中所有的属性
			SearchResult sr = (SearchResult) ne.next();
			Attributes at = sr.getAttributes();
			NamingEnumeration ane = at.getAll();
			//遍历所有属性
			while (ane.hasMore()) {
				Attribute attr = (Attribute) ane.next();
				String attrType = attr.getID();
				NamingEnumeration values = attr.getAll();
				while (values.hasMore()) {
					Object oneVal = values.nextElement();
					//获取用户密码
					if (attrType.equals("userPassword")) {
						//密码需要转码
						if(!new String((byte[]) oneVal).equals(password)){
							//this.addActionError("密码错误");
							out.println("密码错误");
							//return INPUT;
						}
					}
				}
			}
		} catch (Exception nex) {
			nex.printStackTrace();
			//this.addActionError("网络连接超时.");
			//return INPUT;
		}
        
        if (dc != null) {
            try {
                dc.close();
            } catch (NamingException e) {
            	e.printStackTrace();
            	//this.addActionError("网络连接超时..");
    			//return INPUT;
            }
        }
%>