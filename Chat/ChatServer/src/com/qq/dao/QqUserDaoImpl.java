package com.qq.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.qq.bean.User;
import com.qq.db.DBUtil;

public class QqUserDaoImpl {
	
	private DBUtil db = null;
	
	public QqUserDaoImpl() {
		// TODO Auto-generated constructor stub
		this.db = new DBUtil();
	}
	
	public User findById(String qqNo) {
		User qquser = null;
		String sql = "select * from users where uname = '" + qqNo + "'";
		DBUtil util = new DBUtil();
		ResultSet rs = util.query(sql);
		try {
			if(rs.next()) {
				qquser = new User(rs.getInt("uid"), rs.getString("uname"), rs.getString("pwd"), rs.getInt("role"), rs.getString("phone"), rs.getString("realname"), rs.getString("stuid"), rs.getString("img"), rs.getString("ip"), rs.getString("port"), rs.getString("state"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return qquser;
	}

	public int save(User user) {
		String sql = "insert into users(uname,pwd,role,phone,realname,stuid,img) values(?,?,?,?,?,?,?)";
		int count = this.db.update(sql, user.getUname(), user.getPwd(), user.getRole(), user.getPhone(), user.getRealname(), user.getStuid(), user.getImg());
		return count;
	}

	public int update(User user) {
		String sql = "update users set state=?, ip=?, port=? where uname=?";
		int num = this.db.update(sql,user.getState(),user.getIp(),user.getPort(),user.getUname());
		return num;
	}

	public int update(String sql) {
		int num =this.db.update(sql);
		return num;
	}
	
	public List<User> findBySql(String sql) {
		List<User> list = new ArrayList<User>();
		DBUtil util = new DBUtil();
		ResultSet rs = util.query(sql);
		User user = null;
		try {
			while(rs.next()) {
				user = new User(rs.getInt("uid"), rs.getString("uname"), rs.getString("pwd"), rs.getInt("role"), rs.getString("phone"), rs.getString("realname"), rs.getString("stuid"), rs.getString("img"), rs.getString("ip"), rs.getString("port"), rs.getString("state"));
				list.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}

