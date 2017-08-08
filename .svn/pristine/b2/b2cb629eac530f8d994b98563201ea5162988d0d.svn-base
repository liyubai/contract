package com.cauc.contract.util;

import java.util.Hashtable;

import javax.naming.Context;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.Attribute;
import javax.naming.directory.Attributes;
import javax.naming.directory.BasicAttribute;
import javax.naming.directory.BasicAttributes;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.ModificationItem;
import javax.naming.directory.SearchControls;
import javax.naming.directory.SearchResult;

public class TestLDAP {

    DirContext dc = null;
    String account = "Manager";//操作LDAP的帐户。默认就是Manager。
    String password = "secret";//帐户Manager的密码。
    String root = "dc=micmiu,dc=com"; //LDAP的根节点的DC

    public TestLDAP() {
        init();
        //修改密码 参数为 uid ,属性名称（此方法为密码修改此参数恒为“userPassword”）,新密码
     //   System.out.println(editValue("Miuniumll","userPassword","222222"));
        //修改密码 参数为 uid ,属性名称（此方法为密码修改此参数恒为“userPassword”）,新密码，原密码
       // System.out.println(editValue("Username","userPassword","222222","112233"));
        //查询方法：参数为 UID 和密码
        System.out.println(getValue("111111","111111"));
        //添加用户  参数为 uid ， 所属组名称（ou）， 密码，sn(不能为空)，cn(不能为空)
    
   // System.out.println( add("sa","Tester","111111","ssnn","ccnn"));//添加节点
        
        close();
    }

    public void init() {
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
        env.put(Context.PROVIDER_URL, "ldap://localhost:389/dc=micmiu,dc=com");
        env.put(Context.SECURITY_AUTHENTICATION, "simple");
        env.put(Context.SECURITY_PRINCIPAL, "cn=" + account + "," + root);
        env.put(Context.SECURITY_CREDENTIALS, password);
        
        try {
            dc = new InitialDirContext(env);//初始化上下文
            System.out.println("认证成功");//这里可以改成异常抛出。
        } catch (javax.naming.AuthenticationException e) {
            System.out.println("认证失败");
        } catch (Exception e) {
            System.out.println("认证出错：" + e);
        }
    }

    public void close() {
        if (dc != null) {
            try {
                dc.close();
            } catch (NamingException e) {
                System.out.println("NamingException in close():" + e);
            }
        }
    }
    
    public String editValue(String uid,String type,String Value){
    	SearchControls sc = new SearchControls();
    	sc.setSearchScope(SearchControls.SUBTREE_SCOPE);
    	NamingEnumeration ne = null;
        try {
        	ne = dc.search("", "uid=" + uid,sc);
			String name ="";
			if (ne.hasMore()) {
				SearchResult sr = (SearchResult) ne.next();
				 name = sr.getName();
			}else{
				return "修改失败！"; 
			}
            ModificationItem[] mods = new ModificationItem[1];
            Attribute attr0 = new BasicAttribute(type,
            		Value);
            mods[0] = new ModificationItem(DirContext.REPLACE_ATTRIBUTE,
                    attr0);
            dc.modifyAttributes(name, mods);
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error: " + e.getMessage());
            return "修改失败！";
        }
        return "修改成功！";
    }
    
    
    public String editValue(String uid,String type,String newpass,String oldpass){
    	SearchControls sc = new SearchControls();
    	sc.setSearchScope(SearchControls.SUBTREE_SCOPE);
    	NamingEnumeration ne = null;
        try {
        	ne = dc.search("", "uid=" + uid,sc);
			String name ="";
			if (ne.hasMore()) {
				SearchResult sr = (SearchResult) ne.next();
				 name = sr.getName();
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
						if (attrType.equals(type)) {
							//密码需要转码
							if(!new String((byte[]) oneVal).equals(oldpass)){
								return  "修改失败:用户原密码错误。";
							}
						}
					}
				}
			}else{
				return "修改失败:用户不存在。"; 
			}
            ModificationItem[] mods = new ModificationItem[1];
            Attribute attr0 = new BasicAttribute(type,
            		newpass);
            mods[0] = new ModificationItem(DirContext.REPLACE_ATTRIBUTE,
                    attr0);
            dc.modifyAttributes(name, mods);
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("Error: " + e.getMessage());
            return "修改失败：网络连接超时。";
        }
        return "修改成功。";
    }
    public String getValue(String uId ,String passW){
    	SearchControls sc = new SearchControls();
    	sc.setSearchScope(SearchControls.SUBTREE_SCOPE);
    	NamingEnumeration ne = null;
    	try {
    		ne = dc.search("", "uid=" + uId,sc);
			if(!ne.hasMore()){
				return  "对不起，您输入的用户名不正确！";
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
						if(!new String((byte[]) oneVal).equals(passW)){
							return  "对不起，您输入的密码不正确！";
						}
					}
				}
			}
		} catch (Exception nex) {
			System.err.println("Error: " + nex.getMessage());
			nex.printStackTrace();
			return  "网络连接超时！";
		}
    	return  "恭喜您，登陆成功！";
	}
    
    public String add(String name,String ou,String password,String sn,String cn) {
    	SearchControls sc = new SearchControls();
    	sc.setSearchScope(SearchControls.SUBTREE_SCOPE);
    	NamingEnumeration ne = null;
        try {
        	ne = dc.search("", "uid=" + name,sc);
			if (ne.hasMore()) {
				return "添加失败：用户已存在。"; 
			}
            BasicAttributes attrs = new BasicAttributes();
            BasicAttribute objclassSet = new BasicAttribute("objectClass");
            objclassSet.add("inetOrgPerson");
            attrs.put(objclassSet);
            attrs.put("sn", sn);//必填值
            attrs.put("cn", cn);//必填值
            attrs.put("uid", name);
            attrs.put("userPassword", password);
            dc.createSubcontext("uid=" + name + "," + "ou="+ou, attrs);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception in add():" + e);
            return "添加失败：网络连接超时。";
        }
        return "添加成功。";
    }
    public static void main(String[] args) {
        new TestLDAP();
    }
} 