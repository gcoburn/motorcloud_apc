package com.motorcloudmusic.bass.util;

public class FormUtils {

	public static boolean isAbsent(String value) {
		if(value == null){
			return true;
		}
		if(value.trim().length()==0){
			return true;
		}
		return false;
	
	}

}
