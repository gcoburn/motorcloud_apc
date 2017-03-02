package com.motorcloudmusic.bass.util;

import java.util.ArrayList;
import java.util.Iterator;

public class MessageFactory {
	private ArrayList<String> messages = new ArrayList<String>();

	public void addMessage(String string) {
		messages.add(string);
	}

	public boolean isEmpty() {
		if(messages.isEmpty()){
			return true;
		}
		return false;
		
	}

	public String getMessages() {
		StringBuffer sb = new StringBuffer();
		Iterator<String> iter = messages.iterator();
		while(iter.hasNext()){
			String msg = iter.next();
			sb.append(msg);
			sb.append("<br/>");
			
		}
		return sb.toString();
	
	}

}
