package com.ats.service;

public class Utils {
	public static boolean isEmpty( Object object ){
		boolean isEmpty = false;
		
			/* TODO Handle various types of objects - POJOs, collections, arrays, etc. */
			if( object == null ) 
				isEmpty = true;
			else if(object.equals(""))
				isEmpty = true;
			
			else if(object instanceof Integer ){
				if(((Integer)object).intValue() == 0)
					isEmpty = true;
			}
		
		return isEmpty;
	}

	public static int toInteger(String str) throws Exception {
		int result = 0;
		if( str == null ){
			throw new Exception();
		}
		try {
				result = Integer.parseInt(str);
		} catch (Exception e) {
			throw new Exception();
		}
		return result;
	}
	
	public static void main(String[] args) {
		int i = 0;
		System.out.println( Utils.isEmpty(i) );
	}
}
