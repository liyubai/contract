package com.cauc.contract.util;


import org.apache.commons.lang3.StringUtils;
public class CommonUtils {

	/**
	 * 
	 */
	public static int ObjecttoInt(Object obj) {
		int ret = 0;
		if (obj != null) {
			if (StringUtils.isNumeric(obj.toString())) {
				ret = Integer.parseInt(obj.toString());
			}
		}
		return ret;
	}
	
	public static String ObjecttoString(Object obj) {
		String ret = "";
		if (obj != null) {
			
				ret = obj.toString();
		}
		return ret;
	}
}
