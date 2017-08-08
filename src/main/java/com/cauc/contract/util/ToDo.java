package com.cauc.contract.util;

import java.util.TimerTask;

import com.cauc.contract.config.FinanceConfig;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

public class ToDo extends TimerTask{

	private static String usbPath = FinanceConfig.getProperty("default.usburl");
	 public void run(){
		 
		 InputStream inputStream = null;
		 InputStreamReader inputStreamReader = null;
		 BufferedReader reader = null;
		 try {
			 	URL localURL = new URL(usbPath);
		        URLConnection connection = localURL.openConnection();
		        HttpURLConnection httpURLConnection = (HttpURLConnection)connection;
		        
		        httpURLConnection.setRequestProperty("Accept-Charset", "utf-8");
		        httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
		        

		        StringBuffer resultBuffer = new StringBuffer();
		        String tempLine = null;
		        
		        if (httpURLConnection.getResponseCode() >= 300) {
		            throw new Exception("HTTP Request is not success, Response code is " + httpURLConnection.getResponseCode());
		        }
	        
	        
	            inputStream = httpURLConnection.getInputStream();
	            inputStreamReader = new InputStreamReader(inputStream);
	            reader = new BufferedReader(inputStreamReader);
	            
	            while ((tempLine = reader.readLine()) != null) {
	                resultBuffer.append(tempLine);
	            }
	            
	        } catch(Exception e){
	        	e.printStackTrace();
	        }
		 	finally {
	            try{
	            if (reader != null) {
	                reader.close();
	            }
	            
	            if (inputStreamReader != null) {
	                inputStreamReader.close();
	            }
	            
	            if (inputStream != null) {
	                inputStream.close();
	            }}
	            catch(IOException o){
	            	
	            }
	            
	        }
		// System.out.println(Utilities.format(new Date(),"yyyy-MM-dd HH:mm:ss"));
	    }
	    
	 
}
