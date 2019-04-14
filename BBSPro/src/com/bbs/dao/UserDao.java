package com.bbs.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.bbs.bean.User;
import com.bbs.db.DB;

public class UserDao {
	
	private DB db = null;
	
	public UserDao() {
		// TODO Auto-generated constructor stub
		this.db = new DB();
	}
	
	public boolean add(User user){
		String sql = "insert into users(uname,pwd,role,img,phone,realname,stuid) values(?,?,?,?,?,?,?)";
		int count = this.db.update(sql, user.getUname(), user.getPwd(), user.getRole(), user.getImg(), user.getPhone(), user.getRealname(), user.getStuid());
		if(count>0){
			return true;
		}
		return false;
	}
	
	public boolean update(User user){
		String sql = "update users set uname=?,pwd=?,role=?,phone=?,realname=?,stuid=?,img=? where uid=?";
		int count = this.db.update(sql, user.getUname(), user.getPwd(), user.getRole(), user.getPhone(), user.getRealname(), user.getStuid(), user.getImg(), user.getUid());
		if(count>0){
			return true;
		}
		return false;
	}
	
	public User findById(int id){
		String sql = "select * from users where uid=?";
		ResultSet rs = this.db.query(sql, id);
		User user = null;
		try {
			if(rs.next()){
				user = new User(rs.getInt("uid"), rs.getString("uname"), rs.getString("pwd"), rs.getInt("role"), rs.getString("img"), rs.getString("phone"), rs.getString("realname"), rs.getString("stuid"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	public User login(User u){
		String sql = "select * from users where uname='"+u.getUname()+"' and pwd='"+u.getPwd()+"'";
		ResultSet rs = this.db.query(sql);
		User user = null;
		try {
			while(rs.next()){
				user = new User(rs.getInt("uid"), rs.getString("uname"), rs.getString("pwd"), rs.getInt("role"), rs.getString("img"), rs.getString("phone"), rs.getString("realname"), rs.getString("stuid"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean checkName(String uname){
		String sql = "select * from users where uname='"+uname+"'";
		ResultSet rs = this.db.query(sql, null);
		try {
			if(rs.next()){
				return true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}
}
