package com.bbs.test;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.bbs.bean.User;
import com.bbs.db.DB;

public class Test {
	public static void main(String[] args) {
//		ResultSet rs = new DB().query("select * from users where uname=? and pwd=?", "admin","admin");
//		User u = null;
//		try {
//			while(rs.next()){
//				u = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8));
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		System.out.println(u);
		ArrayList<String> lst = new ArrayList<String>();
		System.out.println(lst.size());
		lst.add("hello");
		System.out.println(lst.size());
		
		
	}
}
