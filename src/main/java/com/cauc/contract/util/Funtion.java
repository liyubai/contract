package com.cauc.contract.util;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.regex.Pattern;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;
public class Funtion {
	public boolean isdigit(String s)
	{	
		if(s==null)
		{
			return false;
		}
		if(s.trim().length()==0 || s.trim().length()>20)
		{
			return false;
		}
		int k=1;
		for(int j=0;j<s.length();j++)
		{
	    	k=k*(Character.isDigit(s.charAt(j))?1 : 0);
		}
		if(k==0)
			return false;
		else
			return true;
	}
	//格式化标题--ljs
	public String format(String s){
//		if(s==null){
//			return "&nbsp";
//		}else if(s.contains(".")){
//		  String []ss = s.split(".");
//		  String sss = ss[0];
//		  return sss;
//		}else{
//			return s;
//		}
		try{
		float f = Float.parseFloat(s);
		int in = Math.round(f);
		return in+"";
		}catch(NumberFormatException ne){
			return s;
		}
	}
	//数字小数点后取两位--ljs
	public String getLiangwei(String s){
		//int l = s.length();
		int a = s.indexOf(".");
		if(s.substring(a+1, s.length()).length()==1){
			s = s+"0";
			return s;
		}else{
		return s;
		}
	}
	public String getRandom()
	{
		Random r = new Random();
		String str = "";   
		for(int i=0;i<8;i++)
		{   
		  str += Integer.toString(r.nextInt(36),36);   
		}
		return str;
	}
	public  String getFromBASE64(String s)
	{
		if (s == null) return null;
		BASE64Decoder decoder = new BASE64Decoder();
		try 
		{
			byte[] b = decoder.decodeBuffer(s);
			return new String(b);
		} 
		catch (Exception e) 
		{
			return null;
		}
	}
	public  String getBASE64(String s)
	{
		if(s==null)
		return null;
		return (new BASE64Encoder()).encode(s.getBytes());
	}
	public Date getNowTime()
	{
		Date datetime1=null;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = sdf.format(cal.getTime());
		try {
			datetime1 = sdf.parse(datetime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return datetime1;
	}
	public String getNowTimeString()
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = sdf.format(cal.getTime());
		return datetime;
	}
	public String getNowDateString()
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String datetime = sdf.format(cal.getTime());
		return datetime;
	}
	public String getFormatTime(Date date)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = sdf.format(date);
		return datetime;
	}
	public String getFormatDate(Date date)
	{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String datetime = sdf.format(date);
		return datetime;
	}
	
	public Date getChangeTime(String str)
	{
		Date datetime1=null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String datetime = sdf.format(str);
		try {
			datetime1 = sdf.parse(datetime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return datetime1;
	}
	public Date getChangeDate(String str)
	{
		Date datetime1=null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String datetime = sdf.format(str);
		try {
			datetime1 = sdf.parse(datetime);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return datetime1;
	}
	public static float getRounDingMode(float d,int w)
	{
		int roundingMode = 4;
		int weishu =w;
		BigDecimal bd = new BigDecimal(d);  
		bd = bd.setScale(weishu,roundingMode);
		return bd.floatValue(); 
	}
	public boolean isdouble(String str)
	{
		Pattern pattern = Pattern.compile("[0-9]*(\\.?)[0-9]*");
		if(pattern.matcher(str).matches())
			return true;
		else
			return false;
	}
	public String backStr(Object obj)
	{
		if(obj==null || obj.equals("null") || obj.toString().trim().length()==0)
			return "&nbsp;";
		else
		{
			if(isdouble(obj.toString().trim()))
				return String.valueOf(getRounDingMode(Float.parseFloat(obj.toString().trim()),2));
			else
				return obj.toString().trim();
		}
	}
	public boolean isdata(String str)
	{
		String d = "^((\\d{2}(([02468][048])|([13579][26]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-\\/\\s]?((((0?[13578])|(1[02]))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-\\/\\s]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-\\/\\s]?((0?[1-9])|(1[0-9])|(2[0-8]))))))";
		Pattern pattern = Pattern.compile(d);
		return pattern.matcher(str).matches();
	}
	
	public static void main(String[] args){
		System.out.println(getRounDingMode(30000.0f,2));
	}
}