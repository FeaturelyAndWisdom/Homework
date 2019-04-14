package com.bbs.bean;

import java.util.Date;

public class Comment {
	
	private int cid;
	private int uid;
	private int eid;
	private String cont;
	private Date pdate;
	private User user;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}

	public Comment(int uid, int eid, String cont, Date pdate) {
		super();
		this.uid = uid;
		this.eid = eid;
		this.cont = cont;
		this.pdate = pdate;
	}

	public Comment(int cid, int uid, int eid, String cont, Date pdate) {
		super();
		this.cid = cid;
		this.uid = uid;
		this.eid = eid;
		this.cont = cont;
		this.pdate = pdate;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
}
