package com.bbs.dao;

import java.sql.Date;

import com.bbs.bean.Comment;
import com.bbs.db.DB;

public class CommentDao {
	
	private DB db = null;
	
	public CommentDao() {
		// TODO Auto-generated constructor stub
		this.db = new DB();
	}
	
	public boolean add(Comment c){
		String sql = "insert into comment(uid,eid,cont,pdate) values(?,?,?,?)";
		int count = this.db.update(sql, c.getUid(),c.getEid(),c.getCont(),new Date(c.getPdate().getTime()));
		if(count>0) return true;
		return false;
	}
	
	
}
