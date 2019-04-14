package com.qq.pub;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class TCPManage implements Serializable {
	private String head = null;
	private Map<String, Object> body = new HashMap<String, Object>();
	
	public TCPManage() {
		// TODO Auto-generated constructor stub
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head;
	}
	
	public void setBody(String key,Object value){
		this.body.put(key, value);
	}
	
	public Object getBody(String key){
		return this.body.get(key);
	}
	
}
