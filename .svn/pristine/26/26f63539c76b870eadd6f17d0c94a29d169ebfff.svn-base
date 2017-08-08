package com.cauc.contract.util;

import java.io.IOException;
import java.util.Timer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServerAutomaticRun extends HttpServlet {

	private static final long serialVersionUID = -6466183039391109413L;
	
	private Timer timer = null;
	public ServerAutomaticRun() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}


	public void init(ServletConfig config) throws ServletException {

		super.init(config);  
        timer = new Timer(true);   
        timer.schedule(new ToDo(), 0, 1000*60*2); 
	}


}
