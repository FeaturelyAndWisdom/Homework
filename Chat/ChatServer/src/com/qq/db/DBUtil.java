package com.qq.db;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class DBUtil {
	private Connection conn = null;
	private PreparedStatement psta = null;
	private ResultSet rs = null;
	
	public DBUtil() {
		// TODO Auto-generated constructor stub
	}
	
	private void getConn(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			this.conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/BBS1", "root" , "root");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int update(String sql,Object...objects){
		this.getConn();
		int count = 0;
		try {
			this.psta = this.conn.prepareStatement(sql);
			if(objects!=null && objects.length>0){
				for(int i=0;i<objects.length;i++){
					this.psta.setObject(i+1, objects[i]);
				}
			}
			count = this.psta.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			this.closeAll();
		}
		return count;
	}
	
	public ResultSet query(String sql,Object...objects){
		this.getConn();
		try {
			this.psta = this.conn.prepareStatement(sql);
			if(objects!=null && objects.length>0){
				for(int i=0;i<objects.length;i++){
					this.psta.setObject(i+1, objects[i]);
				}
			}
			this.rs = this.psta.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return this.rs;
	}
	
	private void closeAll(){
		try {
			if(this.rs!=null){
				rs.close();
				rs = null;
			}
			if(this.psta!=null){
				psta.close();
				psta = null;
			}
			if(this.conn!=null){
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
