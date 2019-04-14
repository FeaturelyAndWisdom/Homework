package com.bbs.bean;

import java.util.Date;

public class Essay {
	
	private int eid;
	private int uid;
	private String title;
	private String cont;
	private Date pdate;
	private int readnum;
	private int reply;
	private User user;
	
	public Essay() {
		// TODO Auto-generated constructor stub
	}

	public Essay(int uid, String title, String cont, Date pdate) {
		super();
		this.uid = uid;
		this.title = title;
		this.cont = cont;
		this.pdate = pdate;
	}

	public Essay(int eid, int uid, String title, String cont, Date pdate, int readnum) {
		super();
		this.eid = eid;
		this.uid = uid;
		this.title = title;
		this.cont = cont;
		this.pdate = pdate;
		this.readnum = readnum;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
