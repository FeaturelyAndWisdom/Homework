package com.bbs.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bbs.bean.Comment;
import com.bbs.bean.Essay;
import com.bbs.db.DB;

public class EssayDao {
	
	private DB db = null;
	
	public EssayDao() {
		// TODO Auto-generated constructor stub
		this.db = new DB();
	}
	
	public boolean add(Essay e){
		String sql = "insert into essay(uid,title,cont,pdate) values(?,?,?,?)";
		int count = this.db.update(sql, e.getUid(), e.getTitle(), e.getCont(), new Date(e.getPdate().getTime()));
		if(count>0) return true;
		return false;
	}
	
	public Map<Essay, List<Comment>> findCommentById(int eid){
		String sql = "select * from comment where eid="+eid+" order by cid";
		ResultSet rs = this.db.query(sql, null);
		List<Comment> lst = new ArrayList<Comment>();
		Comment c = null;
		UserDao udao = new UserDao();
		try {
			while(rs.next()){
				c = new Comment(rs.getInt("cid"), rs.getInt("uid"), rs.getInt("eid"), rs.getString("cont"), rs.getDate("pdate"));
				c.setUser(udao.findById(c.getUid()));
				lst.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sql = "select * from essay where eid="+eid;
		rs = this.db.query(sql, null);
		Essay e = null;
		try {
			if(rs.next()){
				e = new Essay(rs.getInt("eid"), rs.getInt("uid"), rs.getString("title"), rs.getString("cont"), rs.getDate("pdate"), rs.getInt("readnum"));
				e.setUser(udao.findById(e.getUid()));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Map<Essay, List<Comment>> map = new HashMap<Essay, List<Comment>>();
		map.put(e, lst);
		return map;
	}
	
	public List<Essay> findAllEssay(){
		String sql = "select * from essay";
		ResultSet rs = this.db.query(sql, null);
		Essay e = null;
		List<Essay> lst = new ArrayList<Essay>();
		UserDao udao = new UserDao();
		try {
			while(rs.next()){
				e = new Essay(rs.getInt("eid"), rs.getInt("uid"), rs.getString("title"), rs.getString("cont"), rs.getDate("pdate"), rs.getInt("readnum"));
				e.setReply(this.findReply(e));
				e.setUser(udao.findById(e.getUid()));
				lst.add(e);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return lst;	
	}
	
	private int findReply(Essay e){
		String sql = "select count(*) from comment where eid="+e.getEid();
		ResultSet rs = this.db.query(sql, null);
		int count = 0;
		try {
			if(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return count;
	}
	
	public void readNumAdd(int eid){
		String sql = "update essay set readnum=readnum+1 where eid="+eid;
		this.db.update(sql, null);
	}
}
