package com.bbs.bean;

public class User {
	
	private int uid;
	private String uname;
	private String pwd;
	private int role;
	private String img;
	private String phone;
	private String realname;
	private String stuid;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(String uname, String pwd) {
		super();
		this.uname = uname;
		this.pwd = pwd;
	}

	public User(String uname, String pwd, int role, String img, String phone, String realname, String stuid) {
		super();
		this.uname = uname;
		this.pwd = pwd;
		this.role = role;
		this.img = img;
		this.phone = phone;
		this.realname = realname;
		this.stuid = stuid;
	}

	public User(int uid, String uname, String pwd, int role, String img, String phone, String realname, String stuid) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.pwd = pwd;
		this.role = role;
		this.img = img;
		this.phone = phone;
		this.realname = realname;
		this.stuid = stuid;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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
	
	
}
