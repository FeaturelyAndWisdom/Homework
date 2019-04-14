package com.qq.bean;

import java.io.Serializable;

import com.qq.ui.ChatFrame;


public class User implements Serializable {
    private int uid;
    private String uname;
    private String pwd;
    private int role;
    private String phone;
    private String realname;
    private String stuid;
    private String img;
    private String ip;
    private String port;
    private String state;
    private String temp;
    private ChatFrame tempFrame;
    
    private static final long serialVersionUID = 555L;
    
    public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String uname, String pwd, String ip, String port) {
		super();
		this.uname = uname;
		this.pwd = pwd;
		this.ip = ip;
		this.port = port;
	}

	public User(String uname, String pwd, int role, String phone, String realname, String stuid, String img) {
		super();
		this.uname = uname;
		this.pwd = pwd;
		this.role = role;
		this.phone = phone;
		this.realname = realname;
		this.stuid = stuid;
		this.img = img;
	}

	public User(int uid, String uname, String pwd, int role, String phone, String realname, String stuid, String img,
			String ip, String port, String state) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.pwd = pwd;
		this.role = role;
		this.phone = phone;
		this.realname = realname;
		this.stuid = stuid;
		this.img = img;
		this.ip = ip;
		this.port = port;
		this.state = state;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public int getRole() {
		return role;
	}

	public void setRole(int role) {
		this.role = role;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public String getStuid() {
		return stuid;
	}

	public void setStuid(String stuid) {
		this.stuid = stuid;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public ChatFrame getTempFrame() {
		return tempFrame;
	}

	public void setTempFrame(ChatFrame tempFrame) {
		this.tempFrame = tempFrame;
	}
    
	
	
	
}
