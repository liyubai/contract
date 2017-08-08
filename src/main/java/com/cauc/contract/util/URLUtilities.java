/*
 * @(#)ErsException.java
 * Description:	Ers
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2009 Newage Microsystems, Inc. All rights reserved.
 * Create by:	zhaochunhui  2009-12-30
 */
package com.cauc.contract.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.Map;

/**
 * URL操作辅助类
 * @author zhaochunhui 
 */
public class URLUtilities {
	
    /**
     * <p>以 中key=value的格式组成Url格式的字符串</p>
     * @param params Map<String,String>
     * @return URL格式的字符串
     */
    public static final String getQueryString(Map params) {
        
        if(params == null) {
            return null;
        }
        
        StringBuffer queryString = new StringBuffer();
        
        for(Iterator keys = params.keySet().iterator(); keys.hasNext();) {
            String key = (String) keys.next();
            String value = (String) params.get(key);
            
            if (queryString.length() == 0) {
                queryString.append("?");
            } else {
                queryString.append("&");
            }
            
            queryString.append(key);
            queryString.append("=");
            queryString.append(value);
        }
        
        return queryString.toString();
    }
    /**
     * <p>以 中key=value的格式组成Url格式的字符串，并以系统中默认的编码格式进行编码</p>
     * @param params params Map<String,String>
     * @return URL格式的字符串
     */
    public static final String getQueryStringByEncode(Map params) {
        if(params == null) {
            return null;
        }
        StringBuffer queryString = new StringBuffer();
        Object[] keys=params.keySet().toArray();
        for(int i=0;i<keys.length;i++){
        	if(params.get(keys[i])!=null&&!"".equals(params.get(keys[i]))){
        		if(queryString.length() == 0){
        			queryString.append("?");
      			
        		}else{
        			queryString.append("&");
        		}
                queryString.append(keys[i]);
                queryString.append("=");
                queryString.append(encode(params.get(keys[i]).toString()));  
        	}
        }
        return queryString.toString();
    }    

    /**
     * <p>将URL字符串以UTF-8的格式进行编码.</p>
     * @param str 需要编码的字符串
     * @return 经过编码的字符串
     */
    public static final String encode(String str) {
        String encodedStr = str;
        try {
            encodedStr = URLEncoder.encode(str, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            // ignored
        }
        return encodedStr;
    }

    /**
     * <p>将经过UTF-8格式进行编码的字符串进行解码</p>
     * @param str 需要解码的字符串
     * @return 解完码 的字符串
     */
    public static final String decode(String str) {
    	if(str==null){
    		return null;
    	}
        String decodedStr = str;
        try {
            decodedStr = URLDecoder.decode(str, "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            // ignored
        }
        return decodedStr;
    }
    
    /**
     * 将Path以UTF-8的格式进行编码，字符'/'将不会被编码
     * @param path 需要编码的路径
     * @return  经过编码的字符串
     */
    public static final String encodePath(String path) {
        int i = path.indexOf('/');
        StringBuffer sb = new StringBuffer();
        while (i != -1) {
            sb.append(encode(path.substring(0, i))).append('/');
            path = path.substring(i + 1);
            i = path.indexOf('/');
        }
        sb.append(encode(path));
        return sb.toString();
    }
}
