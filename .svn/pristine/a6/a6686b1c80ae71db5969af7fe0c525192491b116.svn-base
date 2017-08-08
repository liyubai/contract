package com.cauc.contract.util;

import java.util.Date;

public class TestTomcat {

	public static void stop(){
	try {
		java.lang.Process p = java.lang.Runtime.getRuntime().exec(
				"net stop \"Apache Tomcat\"");
		java.io.BufferedReader in = new java.io.BufferedReader(
				new java.io.InputStreamReader(p.getInputStream()));
		String s;
		String t = "成功停止";
		boolean restart = false;
		while ((s = in.readLine()) != null) {
			if (s.indexOf(t) != -1) {
				restart = true;
				break;
			}
		}
		System.out.println("<" + new Date() + "> Tomcat is stop "
				+ (restart ? "OK" : "ERROR"));
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	public static void start(){
		try{
			java.lang.Process p = java.lang.Runtime.getRuntime().exec(
					"net start \"Apache Tomcat\"");
			java.io.BufferedReader in = new java.io.BufferedReader(
					new java.io.InputStreamReader(p.getInputStream()));
			String s;
			String t = "启动成功";
			boolean restart = false;
			while ((s = in.readLine()) != null) {
				if (s.indexOf(t) != -1) {
					restart = true;
					break;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	 public static void main(String[] args) {
	        start();
	    }
}

