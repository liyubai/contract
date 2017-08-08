/*
 * @(#)ErsException.java
 * Description:	Ers
 * Version :	0.0.1
 * Copyright:	Copyright (c) 2009 Newage Microsystems, Inc. All rights reserved.
 * Create by:	zhaochunhui  2009-12-30
 */
package com.cauc.contract.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.security.MessageDigest;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;
import java.util.NoSuchElementException;
import java.util.Random;
import java.util.StringTokenizer;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.tools.zip.ZipEntry;
import org.apache.tools.zip.ZipFile;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * <p>
 * 通用的工具类
 * </p>
 * 
 * @author fuchaohui
 */
public class Utilities {
	private static Log mLogger = LogFactory.getLog(Utilities.class);
	/**
	 * 默认模式 yyyy-mm-dd
	 */
	private static String defaultDatePattern = "yyyy-MM-dd";

	/**
	 * 获取默认日期格式
	 * 
	 * @return 日期模式
	 */
	public static String getDatePattern() {
		return defaultDatePattern;
	}

	/**
	 * 将 jsessionid从url中去掉
	 * 
	 * @param url
	 * @return
	 */
	public static String stripJsessionId(String url) {
		// Strip off jsessionid found in referer URL
		int startPos = url.indexOf(";jsessionid=");
		if (startPos != -1) {
			int endPos = url.indexOf("?", startPos);
			if (endPos == -1) {
				url = url.substring(0, startPos);
			} else {
				url = url.substring(0, startPos)
						+ url.substring(endPos, url.length());
			}
		}
		return url;
	}

	// ------------------------------------------------------------------------
	/**
	 * Escape, but do not replace HTML. The default behaviour is to escape
	 * ampersands.
	 */
	public static String escapeHTML(String s) {
		return escapeHTML(s, true);
	}

	// ------------------------------------------------------------------------
	/**
	 * Escape, but do not replace HTML.
	 * 
	 * @param escapeAmpersand
	 *            Optionally escape ampersands (&amp;).
	 */
	public static String escapeHTML(String s, boolean escapeAmpersand) {
		// got to do amp's first so we don't double escape
		if (escapeAmpersand) {
			s = StringUtils.replace(s, "&", "&amp;");
		}
		s = StringUtils.replace(s, "&nbsp;", " ");
		s = StringUtils.replace(s, "\"", "&quot;");
		s = StringUtils.replace(s, "<", "&lt;");
		s = StringUtils.replace(s, ">", "&gt;");
		return s;
	}

	/**
	 * Escape some XSS attack
	 * 
	 * @param escapeAmpersand
	 *            Optionally escape ampersands (&amp;).
	 */
	public static String escapeXSS(String s, boolean escapeAmpersand) {
		// got to do amp's first so we don't double escape
		if (escapeAmpersand) {
			s = StringUtils.replace(s, "&", "&amp;");
		}
		s = StringUtils.replace(s.toLowerCase(), ".js", "");
		s = StringUtils.replace(s.toLowerCase(), "<image", "");
		s = StringUtils.replace(s.toLowerCase(), "<image>", "");
		s = StringUtils.replace(s.toLowerCase(), "<img", "");
		s = StringUtils.replace(s.toLowerCase(), "<img>", "");
		s = StringUtils.replace(s.toLowerCase(), "script:", "");
		s = StringUtils.replace(s.toLowerCase(), "<script", "");
		s = StringUtils.replace(s.toLowerCase(), "<script>:", "");
		s = StringUtils.replace(s.toLowerCase(), "javascript:", "");
		s = StringUtils.replace(s.toLowerCase(), "vbscript:", "");
		s = StringUtils.replace(s.toLowerCase(), "<xml", "");
		s = StringUtils.replace(s.toLowerCase(), "<xml>", "");
		s = StringUtils.replace(s.toLowerCase(), "xml", "");
		s = StringUtils.replace(s.toLowerCase(), "<iframe", "");
		s = StringUtils.replace(s.toLowerCase(), "<iframe>", "");
		s = StringUtils.replace(s.toLowerCase(), "iframe", "");
		s = StringUtils.replace(s.toLowerCase(), "<frame", "");
		s = StringUtils.replace(s.toLowerCase(), "<frameset", "");
		s = StringUtils.replace(s.toLowerCase(), "<frameset>", "");
		s = StringUtils.replace(s.toLowerCase(), "frameset", "");
		s = StringUtils.replace(s.toLowerCase(), "url(", "");
		s = StringUtils.replace(s.toLowerCase(), "eval(", "");
		s = StringUtils.replace(s.toLowerCase(), "alert(", "");
		return s;
	}

	/**
	 * 将字符串数组转化为 字符串
	 * 
	 * @param stringArray
	 * @param delim
	 *            -分隔符
	 * @return String
	 */
	public static String stringArrayToString(String[] stringArray, String delim) {
		String ret = "";
		for (int i = 0; i < stringArray.length; i++) {
			if (ret.length() > 0)
				ret = ret + delim + stringArray[i];
			else
				ret = stringArray[i];
		}
		return ret;
	}

	// --------------------------------------------------------------------------
	/** Convert string to integer array. */
	public static int[] stringToIntArray(String instr, String delim)
			throws NoSuchElementException, NumberFormatException {
		StringTokenizer toker = new StringTokenizer(instr, delim);
		int intArray[] = new int[toker.countTokens()];
		int i = 0;

		while (toker.hasMoreTokens()) {
			String sInt = toker.nextToken();
			int nInt = Integer.parseInt(sInt);
			intArray[i++] = new Integer(nInt).intValue();
		}
		return intArray;
	}

	// --------------------------------------------------------------------------
	/**
	 * 将以逗号分隔的字符串中, 重复的元素去掉
	 * 
	 * @param instr
	 *            -需要处理的字符串
	 * @param delim
	 *            -分隔符
	 * @return String
	 */
	public static String stringToUnique(String instr, String delim)
			throws NullPointerException {
		String[] orgStrArr = instr.split(delim);
		String tempStr = "";
		StringBuffer resultStrBuf = new StringBuffer();

		for (int i = 0; i < orgStrArr.length; i++) {
			tempStr = orgStrArr[i].toString().trim();
			if (resultStrBuf.indexOf(tempStr) == -1)
				resultStrBuf.append(tempStr + ",");
		}

		return resultStrBuf.substring(0, resultStrBuf.length() - 1).toString();
	}

	// -------------------------------------------------------------------
	/** Convert integer array to a string. */
	public static String intArrayToString(int[] intArray) {
		String ret = "";
		for (int i = 0; i < intArray.length; i++) {
			if (ret.length() > 0)
				ret = ret + "," + Integer.toString(intArray[i]);
			else
				ret = Integer.toString(intArray[i]);
		}
		return ret;
	}

	/** Convert List to a string split by ",". */
	public static String listToString(List list) {
		if (list == null)
			return null;
		String ret = "";
		for (int i = 0; i < list.size(); i++) {
			if (ret.length() > 0)
				ret = ret + "," + list.get(i);
			else
				ret = (String) list.get(i);
		}
		return ret;
	}

	public static void copyFile(File from, File to) throws IOException {
		InputStream in = null;
		OutputStream out = null;

		try {
			in = new FileInputStream(from);
		} catch (IOException ex) {
			throw new IOException("Utilities.copyFile: opening input stream '"
					+ from.getPath() + "', " + ex.getMessage());
		}

		try {
			out = new FileOutputStream(to);
		} catch (Exception ex) {
			try {
				in.close();
			} catch (IOException ex1) {
			}
			throw new IOException("Utilities.copyFile: opening output stream '"
					+ to.getPath() + "', " + ex.getMessage());
		}

		copyInputToOutput(in, out, from.length());
	}
	/**
	 * 删除文件夹下所有文件
	 * 
	 * @param filePath
	 * @throws IOException
	 */
	public static void deleteDir(String filePath)throws IOException{
		File path=new File(filePath);
		if(path.exists()){
			if(path.isFile()){
				path.delete();
			}else{
				String[] fileList=path.list();
				for(int i=0;i<fileList.length;i++){
					File child=new File(path + "\\" +fileList[i]);
					if(child.isFile()){
						child.delete();
					}else{
						String childPath=child.toString();
						deleteDir(childPath);
					}
					child.delete();
				}
				path.delete();				
			}			
		}
	}
	/**
	 * 拷贝 输入流到输出流
	 * 
	 * @param input
	 * @param output
	 * @param byteCount
	 * @throws IOException
	 */
	public static void copyInputToOutput(InputStream input,
			OutputStream output, long byteCount) throws IOException {
		int bytes;
		long length;
		BufferedInputStream in = new BufferedInputStream(input);
		BufferedOutputStream out = new BufferedOutputStream(output);
		byte[] buffer;
		buffer = new byte[8192];
		for (length = byteCount; length > 0;) {
			bytes = (int) (length > 8192 ? 8192 : length);

			try {
				bytes = in.read(buffer, 0, bytes);
			} catch (IOException ex) {
				try {
					in.close();
					out.close();
				} catch (IOException ex1) {
				}
				throw new IOException("Reading input stream, "
						+ ex.getMessage());
			}
			if (bytes < 0)
				break;

			length -= bytes;

			try {
				out.write(buffer, 0, bytes);
			} catch (IOException ex) {
				try {
					in.close();
					out.close();
				} catch (IOException ex1) {
				}
				throw new IOException("Writing output stream, "
						+ ex.getMessage());
			}
		}
		try {
			in.close();
			out.close();
		} catch (IOException ex) {
			throw new IOException("Closing file streams, " + ex.getMessage());
		}
	}

	// ------------------------------------------------------------------------
	/**
	 * 
	 */
	public static void copyInputToOutput(InputStream input, OutputStream output)
			throws IOException {
		BufferedInputStream in = new BufferedInputStream(input);
		BufferedOutputStream out = new BufferedOutputStream(output);
		byte buffer[] = new byte[8192];
		for (int count = 0; count != -1;) {
			count = in.read(buffer, 0, 8192);
			if (count != -1)
				out.write(buffer, 0, count);
		}
		try {
			in.close();
			out.close();
		} catch (IOException ex) {
			throw new IOException("Closing file streams, " + ex.getMessage());
		}
	}

	/**
	 * 将密码加密
	 * 
	 * @param password
	 * @param algorithm
	 *            -算法 SHA 或者 MD5
	 * @return
	 */
	public static String encodePassword(String password, String algorithm) {
		byte[] unencodedPassword = password.getBytes();
		MessageDigest md = null;
		try {
			// first create an instance, given the provider
			md = MessageDigest.getInstance(algorithm);
		} catch (Exception e) {
			mLogger.error("Exception: " + e);
			return password;
		}
		md.reset();
		// call the update method one or more times
		// (useful when you don't know the size of your data, eg. stream)
		md.update(unencodedPassword);
		// now calculate the hash
		byte[] encodedPassword = md.digest();

		StringBuffer buf = new StringBuffer();

		for (int i = 0; i < encodedPassword.length; i++) {
			if ((encodedPassword[i] & 0xff) < 0x10) {
				buf.append("0");
			}
			buf.append(Long.toString(encodedPassword[i] & 0xff, 16));
		}

		return buf.toString();
	}

	/**
	 * Encode a string using Base64 encoding. Used when storing passwords as
	 * cookies.
	 * 
	 * @param str
	 * @return String
	 * @throws IOException
	 */
	public static String encodeString(String str) throws IOException {
		BASE64Encoder encoder = new BASE64Encoder();
		String encodedStr = encoder.encodeBuffer(str.getBytes());
		return (encodedStr.trim());
	}

	/**
	 * Decode a string using Base64 encoding.
	 * 
	 * @param str
	 * @return String
	 * @throws IOException
	 */
	public static String decodeString(String str) throws IOException {
		BASE64Decoder dec = new BASE64Decoder();
		String value = new String(dec.decodeBuffer(str));

		return (value);
	}

	/**
	 * Convert a byte array into a Base64 string (as used in mime formats)
	 */
	public static String toBase64(byte[] aValue) {
		final String m_strBase64Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

		int byte1;
		int byte2;
		int byte3;
		int iByteLen = aValue.length;
		StringBuffer tt = new StringBuffer();

		for (int i = 0; i < iByteLen; i += 3) {
			boolean bByte2 = (i + 1) < iByteLen;
			boolean bByte3 = (i + 2) < iByteLen;
			byte1 = aValue[i] & 0xFF;
			byte2 = (bByte2) ? (aValue[i + 1] & 0xFF) : 0;
			byte3 = (bByte3) ? (aValue[i + 2] & 0xFF) : 0;

			tt.append(m_strBase64Chars.charAt(byte1 / 4));
			tt.append(m_strBase64Chars.charAt((byte2 / 16)
					+ ((byte1 & 0x3) * 16)));
			tt.append(((bByte2) ? m_strBase64Chars.charAt((byte3 / 64)
					+ ((byte2 & 0xF) * 4)) : '='));
			tt.append(((bByte3) ? m_strBase64Chars.charAt(byte3 & 0x3F) : '='));
		}

		return tt.toString();
	}

	// /////////////date util//////////////////////
	/**
	 * 使用 默认模式 格式化日期
	 * 
	 * @param java.util.Date
	 * @return String 字符串
	 */
	public static String format(Date date) {
		return date == null ? "" : format(date, getDatePattern());
	}

	/**
	 * 使用自定义模式格式化 日期
	 * 
	 * @param date
	 *            java.util.Date
	 * @param pattern
	 *            自定义模式 如：yyyy-mm-dd hh:ss
	 * @return 字符串
	 */
	public static String format(Date date, String pattern) {
		return date == null ? "" : new SimpleDateFormat(pattern).format(date);
	}

	/**
	 * 将使用预设格式将字符串转为Date
	 * 
	 * @param strDate
	 * @return java.util.Date
	 * @throws ParseException
	 */
	public static Date parse(String strDate) throws ParseException {
		if (strDate == null || strDate.equals("")) {
			strDate = null;
		}
		return strDate == null ? null : parse(strDate, getDatePattern());
	}

	/**
	 * 将使用自定义模式的字符串 转为 java.util.Date
	 * 
	 * @param strDate
	 * @param pattern
	 * @return java.util.Date
	 * @throws ParseException
	 */
	public static Date parse(String strDate, String pattern)
			throws ParseException {
		return strDate == null ? null : new SimpleDateFormat(pattern)
				.parse(strDate);
	}

	/**
	 * 在日期上增加数个整月
	 * 
	 * @param java.util.Date
	 * @param n
	 *            添加月的个数
	 * @return
	 */
	public static Date addMonth(Date date, int n) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.MONTH, n);
		return cal.getTime();
	}

	/**
	 * 
	 * @param value
	 *            要四舍五入的值
	 * @param scale
	 *            小数点后要取的位数
	 * @return float
	 */
	public static float round(float value, int scale) {
		BigDecimal bd = new BigDecimal(value);
		// BigDecimal divisor=new BigDecimal(1);
		// BigDecimal returnValue=bd.divide(divisor,
		// scale,BigDecimal.ROUND_HALF_UP);
		BigDecimal returnValue = bd.setScale(scale, BigDecimal.ROUND_HALF_UP);
		return returnValue.floatValue();
	}
	public static Double dround(Double value, int scale) {
		BigDecimal bd = new BigDecimal(value);
		// BigDecimal divisor=new BigDecimal(1);
		// BigDecimal returnValue=bd.divide(divisor,
		// scale,BigDecimal.ROUND_HALF_UP);
		BigDecimal returnValue = bd.setScale(scale, BigDecimal.ROUND_HALF_UP);
		return returnValue.doubleValue();
	}
	/**
	 * 将汉字数字转化成对应阿拉伯数字(用于自动生成案号时)
	 * 
	 * @param CNchar
	 *            需要转化的汉字数字
	 * @return 转化完毕的阿拉伯数字
	 * @throws BillServiceException
	 *             抛出此异常说明在处理数据时发生异常
	 */
	public static String convertNumber(String CNchar) {
		if (CNchar.equals("一"))
			return "1";
		else if (CNchar.equals("二"))
			return "2";
		else if (CNchar.equals("三"))
			return "3";
		else if (CNchar.equals("四"))
			return "4";
		else if (CNchar.equals("五"))
			return "5";
		else if (CNchar.equals("六"))
			return "6";
		else if (CNchar.equals("七"))
			return "7";
		else if (CNchar.equals("八"))
			return "8";
		else if (CNchar.equals("九"))
			return "9";
		else
			return "0";
	}
	public static String convertchar(int i) {
		if (i==1)
			return "一";
		else if (i==2)
			return "二";
		else if (i==3)
			return "三";
		else if (i==4)
			return "四";
		else if (i==5)
			return "五";
		else if (i==6)
			return "六";
		else if (i==7)
			return "七";
		else if (i==8)
			return "八";
		else if (i==9)
			return "九";
		else if(i==10)
			return "十";
		else
			return "十一";
	}

	public static String titleFlag(int level,int order){
		if(level==1){
			return convertchar(order);
		}
		else if(level==2){
			return String.valueOf(order);
		}
		else if(level==3){
			return order+")";
		}
		else if(level==4){
			return "("+order+")";
		}
		else
			return "工程";
		
		/*
		switch(level)
		{
			case 1:return convertchar(order);
			case 2:return String.valueOf(order);
			case 3:return order+")";
			default:return convertchar(order);
		}
		*/
	}
	
	public static String alginStr(int level){
	
		if(level==1 || level==0){
			return "center";
		}else{
			return "right";
		}
	}
	
	/**
	 * 解压Zip文件到指定目录[不解压子文件夹]
	 * 
	 * @param sZipPathFile
	 *            Zip文件绝对路径
	 * @param sDestPath
	 *            目标文件夹绝对路径
	 * @return 已解压文件绝对路径列表
	 */
	public static ArrayList<String> ectract(String sZipPathFile,
			String sDestPath) {
		ZipFile zipFile = null;
		File file = null;
		InputStream inputStream = null;
		OutputStream fileOut = null;
		byte[] buf = new byte[1024];
		int readedBytes = 1024;
		try {
			zipFile = new ZipFile(sZipPathFile);
			for (Enumeration entries = zipFile.getEntries(); entries
					.hasMoreElements();) {
				ZipEntry entry = (ZipEntry) entries.nextElement();
				file = new File(sDestPath + File.separator + entry.getName());
				if (entry.isDirectory()) {
					// 不解压子文件夹
					// file.mkdirs();
				} else {
					inputStream = zipFile.getInputStream(entry);
					fileOut = new FileOutputStream(file);
					while ((readedBytes = inputStream.read(buf)) > 0) {
						fileOut.write(buf, 0, readedBytes);
					}
					fileOut.close();
					inputStream.close();
				}
			}

		} catch (IOException ioe) {
			ioe.printStackTrace();
		} finally {
			try {
				zipFile.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

	/**
	 * 获取随机数
	 * 
	 * @param length
	 *            id长度
	 * @return
	 */
	public static String GenerateRnd(int length) {
		Random random = new Random();
		char[] result = new char[length];
		for (int i = 0; i < length; i++) {
			result[i] = (char) (65 + random.nextInt(26));
		}
		return new String(result);
	}
	public static String  getXxje(double je)
	{
		String result = "";
		try
		{
			NumberFormat   numberformat   =   NumberFormat.getCurrencyInstance(Locale.CHINA);  
			
            DecimalFormat   decimalformat   =   (DecimalFormat)numberformat;  
            
            decimalformat.setMinimumFractionDigits(2);  
            
            decimalformat.setMaximumFractionDigits(2);  
            
            decimalformat.setDecimalSeparatorAlwaysShown(true);  
            
          //  String   s   =   "###,##0.00";  
            String   s   =   "0.#";  
            decimalformat.applyPattern(s);  
            
            double   d = je;//123456789.0002030301; 
            
            result   =   decimalformat.format(d);   
		}
		catch(Exception e){System.out.print(e.toString());}
		return result;
	}
	public static String subString(String str,int len){
		if(str==null)
			return "";
		if(str.length()>len){
			str = str.substring(0,len-1)+"...";
		}
		return str;
	}
	public static double getMinitue(String str){
		
		
		if(str==null || str.length()==0){  //0104=1小时40分钟
			
			return 0;
		}
		/*
		if(!StringUtils.isNumeric(str)){
			return 0;
		}*/
		if(str.indexOf(":")!=-1){
			//获取:位置
			int p = str.indexOf(":");
			return Double.parseDouble(str.substring(0, p))*60 + Double.parseDouble(str.substring(p+1,str.length()));
		}
		double d = 0;
		if(str.length()==1 || str.length()==2){
			d= Double.parseDouble(str);
		}else if(str.length()==3){
			d = Double.parseDouble(str.substring(0, 2))*60 + Double.parseDouble(str.substring(2, 3));
		}else if(str.length()==4){
			d = Double.parseDouble(str.substring(0, 2))*60 + Double.parseDouble(str.substring(2, 4));
		}
		
		return d;

	}
	public static String formatTime(double dd){
		int flag = 0;
		if(dd==0)
			return "";
		if(dd<0){
			dd =Math.abs(dd);
			flag=1;
		}
		int a=(int)dd/60;
		String aa = String.valueOf(a);
		int b = (int)dd%60;
		String bb = String.valueOf(b);
		
		if(aa.length()==1){
			aa="0"+aa;
		}
		
		if(bb.length()==1){
			bb="0" + bb;
		}
		
		if(flag==1){
			return "-"+aa+":" + bb;
		}
		return aa+":" + bb;
			
		
	}
	public static String formatNum(double dd){
		int flag = 0;
		if(dd==0)
			return "";
		if(dd<0){
			dd =Math.abs(dd);
			flag=1;
		}
		int a=(int)dd/60;
		String aa = String.valueOf(a);
		int b = (int)dd%60;
		String bb = String.valueOf(b);
		
		if(aa.length()==1){
			aa="0"+aa;
		}
		
		if(bb.length()==1){
			bb="0" + bb;
		}
		
		//if(flag==1){
		//	return "-"+aa+":" + bb;
		//}
		return aa+ bb;
			
		
	}
	public static String formatDecimal(double dd){
		int flag = 0;
		if(dd==0)
			return "";
		if(dd<0){
			dd =Math.abs(dd);
			flag=1;
		}
		int a=(int)dd/60;
		String aa = String.valueOf(a);
		int b = (int)dd%60/6;
		String bb = String.valueOf(b);
		
		if(aa.length()==1){
			aa="0"+aa;
		}
		
		
		
		if(flag==1){
			return "-"+aa+"." + bb;
		}
		return aa+"." + bb;
			
		
	}
	public static String formatzoneTime(double dd){
		int flag = 0;
		if(dd<0){
			dd =Math.abs(dd);
			flag=1;
		}
		int a=(int)dd/60;
		String aa = String.valueOf(a);
		int b = (int)dd%60;
		String bb = String.valueOf(b);
		
		if(aa.length()==1){
			aa="0"+aa;
		}
		
		if(bb.length()==1){
			bb="0" + bb;
		}
		
		if(flag==1){
			return "-"+aa+":" + bb;
		}
		return aa+":" + bb;
			
		
	}
	public static int string2ASCII(String s) {// 字符串转换为ASCII码  
        if (s == null || "".equals(s)) {  
            return 0;  
        }  
  
        char[] chars = s.toCharArray();  
       // System.out.println(chars.length);
        int d = 0;
        for (int i = 0; i < chars.length; i++) { 
        	//System.out.println(char2ASCII(chars[i]) + "-" + char2ASCII(chars[i])*scua(chars.length-1-i));
        	d+=char2ASCII(chars[i])*scua(chars.length-1-i); 
        }
        return d;  
    } 
	public static int char2ASCII(char c) {  
        return (int) c;  
    }  
	public static int scua(int i)
	{
		//if(i==0){
		//	return 1;
		//}
	 // int rei=10;
	  double d= 0;
	   for(int j=0;j<=i;j++)
	   {
		  d= Math.pow(10,j);
		 //  rei=10*rei;
	   }
	   return (int)d;
	}
	public static void main(String[] args){
		//System.out.println(dround(10000.00, 2));
		DecimalFormat df=new DecimalFormat(".#");
		double d=1252.15;
		String st=df.format(d);
		//System.out.println(st);
	
		System.out.println(string2ASCII("AFL2"));
		System.out.println(string2ASCII("AFL19"));
		System.out.println("2010".substring(2,4));
		String a ="aaa10";
		int b =10;
		System.out.println(a.indexOf(String.valueOf(b)));
		//System.out.println(getXxje(d));
		//System.out.println(formatTime(150));
		//System.out.println(formatTime(123));
		//System.out.println(50/100);
		//System.out.println();
	}
}
