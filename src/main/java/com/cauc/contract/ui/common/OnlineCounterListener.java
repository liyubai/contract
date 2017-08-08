package com.cauc.contract.ui.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener; 

import org.apache.log4j.Logger; 
import org.apache.struts2.ServletActionContext;

import com.cauc.contract.util.Constants;

public class OnlineCounterListener implements HttpSessionListener 
    {
    private static Logger log = Logger.getLogger(OnlineCounterListener.class);

    private static int sessionCounter = 0;  
    private static Map<String,LoginContext> map = new HashMap<String, LoginContext>();
    
    public OnlineCounterListener(){  
        log.info("OnlineCounter initialized.");  
    }  
    public void sessionCreated(HttpSessionEvent se) {
        sessionCounter++;
        log.info("session created:" + sessionCounter);  
    }  

	@SuppressWarnings("rawtypes")
	public void sessionDestroyed(HttpSessionEvent se) {
    	HttpSession session = se.getSession();
    	ServletContext application = session.getServletContext();
    	// 取得登录的用户名
        String username = (String) session.getAttribute("username");
        // 从在线列表中删除用户名
        Map onlineUserMap = (Map) application.getAttribute("onlineUserMap");
        if(onlineUserMap!=null)
        onlineUserMap.remove(username);
        
        sessionCounter--;  
        log.info("session destroied");  
    }
    public static void getOnlineSession() {
    	HttpSession session = ServletActionContext.getRequest().getSession();
    	ServletContext application = session.getServletContext();
    	// 取得登录的用户名
    	LoginContext loginContext = (LoginContext) session.getAttribute(Constants.LOGIN_CONTEXT);
        String userId = loginContext.getLoginId();
        map.put(userId, loginContext);
        
        application.setAttribute("onlineUserMap", map);
        session.setAttribute("username", userId);
    }
} 