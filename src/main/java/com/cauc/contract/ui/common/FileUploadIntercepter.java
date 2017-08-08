/*
 * @(#)FileUploadIntercepter.java
 * Description:	Finance
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2012
 * Create by:	fuchaohui 2012-6-27
 */
package com.cauc.contract.ui.common;

import java.io.File;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ValidationAware;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
/*

 * 文件上传拦截器
 * 
 * @author fuchaohui 
 */
public class FileUploadIntercepter extends AbstractInterceptor {

	
	
	private static Log log = LogFactory.getLog(FileUploadIntercepter.class);
	
	private static final long DEFAULT_MAXIMUMSIZE = 50485760;//默认 文件大小 50M
	
    protected Long maximumSize;//允许 上传文件的大小
    
    protected String allowedTypes;//允许 上传文件的类型
    
    protected Set allowedTypesSet = Collections.EMPTY_SET;//存储上上传文件的 容器	
    
    /**
     * 设置允许上传的文件类型
     *
     * @param allowedTypes -用逗号分隔字符串类表
     */
    public void setAllowedTypes(String allowedTypes) {
        this.allowedTypes = allowedTypes;
        // 添加允许上传文件的类型到 集合中
        allowedTypesSet = getDelimitedValues(allowedTypes);
    }
    /**
     * 判断是 集合中是否包含 key
     * 
     * @param itemCollection -集合
     * @param key -关键字 
     * @return true or  false
     */
    private static boolean containsItem(Collection itemCollection, String key) {
        return itemCollection.contains(key.toLowerCase());
    }
    private static boolean isNonEmpty(Object[] objArray) {
        boolean result = false;
        for (int index = 0; index < objArray.length && !result; index++) {
            if (objArray[index] != null) {
                result = true;
            }
        }
        return result;
    }
    private static Set getDelimitedValues(String delimitedString) {
    	Set<String> delimitedValues = new HashSet<String>();
    	 if (delimitedString != null&&!"".equals(delimitedString)) {
    		 for(String allowType:delimitedString.split(",")){
    			 delimitedValues.add(allowType.toLowerCase().trim());
    		 }	 
    	 }
		return delimitedValues;
	}

	/**
     * 设置上传文件最大字节数
     *
     * @param maximumSize -文件最大字节数
     */
    public void setMaximumSize(Long maximumSize) {
    	if(maximumSize!=null)
    		this.maximumSize = maximumSize;
    	else
    		this.maximumSize = DEFAULT_MAXIMUMSIZE;
    }    
	/* （非 Javadoc）
	 * @see com.opensymphony.xwork2.interceptor.AbstractInterceptor#intercept(com.opensymphony.xwork2.ActionInvocation)
	 */
	@Override
	@SuppressWarnings("unchecked")
	public String intercept(ActionInvocation invocation) throws Exception {
        ActionContext ac = invocation.getInvocationContext();
        HttpServletRequest request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
        //判断是是否为 multipart/form-data

        if(!(request instanceof MultiPartRequestWrapper)){
        	return invocation.invoke();	
        }

        final Object action = invocation.getAction();
        ValidationAware validation = null;

        if (action instanceof ValidationAware) {
            validation = (ValidationAware) action;
        }

        MultiPartRequestWrapper multiWrapper = (MultiPartRequestWrapper) request;   
        if (multiWrapper.hasErrors()) {
            for (Iterator errorIter = multiWrapper.getErrors().iterator(); errorIter.hasNext();) {
                String error = (String) errorIter.next();

                if (validation != null) {
                    validation.addActionError(error);
                }
                log.error(error);
            }
        }
        Map parameters = ac.getParameters();
        // Bind allowed Files
        Enumeration fileParameterNames = multiWrapper.getFileParameterNames();
        long filesSize=0;
        while (fileParameterNames != null && fileParameterNames.hasMoreElements()) {
            // 获取input框 名称
            String inputName = (String) fileParameterNames.nextElement();

            // 获取文档类型
            String[] contentType = multiWrapper.getContentTypes(inputName);
            
            if (isNonEmpty(contentType)) {
            	String[] fileName = multiWrapper.getFileNames(inputName);
            	if (isNonEmpty(fileName)) {
            		File[] files = multiWrapper.getFiles(inputName);
            		//validate upload file
            		if(files!=null&&files.length>0){
	            		for (int index = 0; index < files.length; index++) {
	            			filesSize+=files[index].length();
	            			if (files[index] == null) {
	            				String errMsg="上传文件失败";
	            				if(validation!=null){
	            					validation.addActionError(errMsg);
	            					return "error";
	            				}
	            			}else if((! allowedTypesSet.isEmpty()) && (!containsItem(allowedTypesSet, contentType[index]))){
	            				String errMsg="非法文件类型，请选择系统允许上传的文件";
	            				if(validation!=null){
	            					validation.addActionError(errMsg);
	            					return "error";
	            				}
	            			}else if(maximumSize != null&&maximumSize.longValue()<filesSize){
	            				String errMsg="您上传的文件过大，系统只允许上传小于"+round(maximumSize/1048576,1)+"Mb的文件";
	            				if(validation!=null){
	            					validation.addActionError(errMsg);
	            					return "error";
	            				}
	            			}else{
                                parameters.put(inputName, files);
                                parameters.put(inputName + "ContentType", contentType);
                                parameters.put(inputName + "FileName", fileName);	            				
	            			}
	            		}
            		}
            	}	
            }
            	
        }
        // invoke action
        String result = invocation.invoke();

        //System.out.println("ok");
        // cleanup
        fileParameterNames = multiWrapper.getFileParameterNames();
        
        while (fileParameterNames != null && fileParameterNames.hasMoreElements()) {
        	//System.out.println(fileParameterNames);
            String inputValue = (String) fileParameterNames.nextElement();
            File[] file = multiWrapper.getFiles(inputValue);
            for (int index = 0; index < file.length; index++) {
                File currentFile = file[index];
                if ((currentFile != null) && currentFile.isFile()) {
                    currentFile.delete();
                	//System.out.println("删除文件：" + currentFile.getAbsolutePath());
                }
            }
        }        
		return result;
	}
	/**
	 * 四舍五入
	 * 
	 * @param value 要四舍五入的值
	 * @param scale 小数点后要取的位数
	 * @return double
	 */
	private static double round(double value,int scale){
		BigDecimal bd=new BigDecimal(value);
		BigDecimal returnValue=bd.setScale(scale, BigDecimal.ROUND_HALF_UP );
		return returnValue.doubleValue();
	}

}
