package com.cauc.contract.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

public class ListObfuscator {

	public static List obfuscate(List original_list, List new_list)
	{
		List temp = new ArrayList();
		for(Object o: original_list){
			temp.add(o);
		}
		Random random = new Random();
		while (temp.size()>0) 
		{
			int i = random.nextInt(temp.size());
			new_list.add(temp.get(i));
			temp.remove(i);
		}
		
		return new_list;
	}
	
	public static void main(String[] args){
		List a = new ArrayList();
		for(int i=0; i<30000; i++){
			a.add(new Integer(i));
		}
		List<Integer> b = new ArrayList();
		
		Calendar c1 = Calendar.getInstance();
		obfuscate(a, b);
		Calendar c2 = Calendar.getInstance();
		System.out.println(c2.getTimeInMillis()-c1.getTimeInMillis());
		
		for(int i=0; i< 1; i++){
			System.out.println(b.get(i).intValue());
		}
	}
	
}
