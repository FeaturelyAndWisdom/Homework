package com.qq.pub;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.net.UnknownHostException;

public class TCPSocket {
	private Socket socket = null;
	private ObjectOutputStream out = null;
	private ObjectInputStream in = null;
	
	public TCPSocket(String ip,int port) {
		// TODO Auto-generated constructor stub
		try {
			this.socket = new Socket(ip, port);
			this.out = new ObjectOutputStream(this.socket.getOutputStream());
			this.in = new ObjectInputStream(this.socket.getInputStream());
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public TCPManage submit(TCPManage sManage){
		TCPManage bManage = null;
		try {
			this.out.writeObject(sManage);
			this.out.flush();
			bManage = (TCPManage) this.in.readObject();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return bManage;
	}
	
	public String getIp(){
		return this.socket.getLocalAddress().getHostAddress();
	}
}
