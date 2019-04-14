package com.qq.server;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.List;

import com.qq.bean.User;
import com.qq.dao.QqUserDaoImpl;
import com.qq.pub.CommonUse;
import com.qq.pub.TCPManage;
import com.qq.pub.UDPSocket;

public class ServerThread extends Thread {
	private Socket socket = null;
	private ObjectOutputStream out = null;
	private ObjectInputStream in = null;
	private User fullUser = null;
	private QqUserDaoImpl dao = null;
	
	public ServerThread() {
		// TODO Auto-generated constructor stub
	}

	public ServerThread(Socket socket) {
		try {
			this.socket = socket;
			this.out = new ObjectOutputStream(this.socket.getOutputStream());
			this.in = new ObjectInputStream(this.socket.getInputStream());
			this.dao = new QqUserDaoImpl();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private boolean regist(User regUser){
		boolean flag = false;
		int i = dao.save(regUser);
		if(i>0){
			flag = true;
		}
		return flag;
	}
	
	private boolean login(User logUser){
		boolean flag = false;
		User temp = this.dao.findById(logUser.getUname());
		if(temp!=null && temp.getPwd().equals(logUser.getPwd())){
			logUser.setState("1");
			this.dao.update(logUser);
			this.fullUser = this.dao.findById(logUser.getUname());
			this.online();
			flag = true;
		}
		return flag;
	}
	
	private void online(){
		String mes = CommonUse.ONLINE + CommonUse.UDP_PACKET_SYMBOL
				     + this.fullUser.getUname() + CommonUse.UDP_PACKET_SYMBOL
				     + this.fullUser.getIp() + CommonUse.UDP_PACKET_SYMBOL
				     + this.fullUser.getPort() + CommonUse.UDP_PACKET_SYMBOL;
		String sql = "select * from users where uname in (select friendAccount from friend where userAccount='"+this.fullUser.getUname()+"') and state='1'";
		List<User> lst = this.dao.findBySql(sql);
		for (User user : lst) {
			UDPSocket udpSocket = new UDPSocket(user.getIp(), Integer.parseInt(user.getPort()));
			udpSocket.send(mes);
		}
	}
	
	private void offline(){
		this.fullUser.setState("0");
		this.fullUser.setIp("0");
		this.fullUser.setPort("0");
		this.dao.update(fullUser);
		String mes = CommonUse.OFFLINE + CommonUse.UDP_PACKET_SYMBOL
				 + this.fullUser.getUname() + CommonUse.UDP_PACKET_SYMBOL;
		String sql = "select * from users where uname in (select friendAccount from friend where userAccount='"+this.fullUser.getUname()+"') and state='1'";
		List<User> lst = this.dao.findBySql(sql);
		for (User user : lst) {
			UDPSocket udpSocket = new UDPSocket(user.getIp(), Integer.parseInt(user.getPort()));
			udpSocket.send(mes);
		}
	}
	
	private List<User> getFris(){
		String sql = "select * from users where uname in (select friendAccount from friend where userAccount='"+this.fullUser.getUname()+"')";
		List<User> lst = this.dao.findBySql(sql);
		return lst;
	}
	
	private User check(String uname){
		String sql = "select * from users where uname='"+uname+"' and state='1'";
		List<User> lst = this.dao.findBySql(sql);
		if(lst.size()>0){
			return lst.get(0);
		}
		return null;
	}
	
	private void sendMessage(User send, User rece, String mes){
		String message = CommonUse.ADDFRIEND + CommonUse.UDP_PACKET_SYMBOL
			     + send.getUname() + CommonUse.UDP_PACKET_SYMBOL
			     + mes + CommonUse.UDP_PACKET_SYMBOL;
		UDPSocket udpSocket = new UDPSocket(rece.getIp(), Integer.parseInt(rece.getPort()));
		udpSocket.send(message);
	}
	
	private boolean becomeFriend(String send, String rece, String res){
		boolean flag = false;
		String sqlo = "select * from users where uname='"+send+"' and state='1'";
		List<User> lst = this.dao.findBySql(sqlo);
		User sender = lst.get(0);
		if(res.equals("YES")){
			String sql1 = "insert into friend(userAccount,friendAccount) values('"+send+"','"+rece+"')";
			String sql2 = "insert into friend(userAccount,friendAccount) values('"+rece+"','"+send+"')";
			if(this.dao.update(sql1)>0 && this.dao.update(sql2)>0){
				String message = CommonUse.ADDFRIENDBACK + CommonUse.UDP_PACKET_SYMBOL
					     + CommonUse.SUCCESSFUL + CommonUse.UDP_PACKET_SYMBOL
					     + rece + CommonUse.UDP_PACKET_SYMBOL;
				UDPSocket udpSocket = new UDPSocket(sender.getIp(), Integer.parseInt(sender.getPort()));
				udpSocket.send(message);
				flag = true;
			}
		}else{
			String message = CommonUse.ADDFRIENDBACK + CommonUse.UDP_PACKET_SYMBOL
				     + CommonUse.FAILURE + CommonUse.UDP_PACKET_SYMBOL
				     + rece + CommonUse.UDP_PACKET_SYMBOL;
			UDPSocket udpSocket = new UDPSocket(sender.getIp(), Integer.parseInt(sender.getPort()));
			udpSocket.send(message);
		}
		return flag;
	}
	
	private boolean checkName(String uname){
		String sql = "select * from users where uname='"+uname+"'";
		List<User> lst = this.dao.findBySql(sql);
		if(lst.size()==0){
			return true;
		}
		return false;
	}
	
	@Override
	public void run() {
		try {
			while(true){
				TCPManage bManage = (TCPManage) this.in.readObject();
				String head = bManage.getHead();
				TCPManage sManage = new TCPManage();
				if(CommonUse.REGISTER.equals(head)){
					User regUser = (User) bManage.getBody(CommonUse.QQ_USER);
					if(this.regist(regUser)){
						sManage.setHead(CommonUse.SUCCESSFUL);
					}else{
						sManage.setHead(CommonUse.FAILURE);
					}
				}else if(CommonUse.LOGIN.equals(head)){
					User logUser = (User) bManage.getBody(CommonUse.QQ_USER);
					if(this.login(logUser)){
						sManage.setHead(CommonUse.SUCCESSFUL);
						sManage.setBody(CommonUse.QQ_USER, this.fullUser);
					}else{
						sManage.setHead(CommonUse.FAILURE);
					}
				}else if(CommonUse.FIND_FRIEND.equals(head)){
					List<User> friList = this.getFris();
					sManage.setHead(CommonUse.SUCCESSFUL);
					sManage.setBody(CommonUse.FRIENDS_INFO, friList);
				}else if(CommonUse.ADDFRIEND.equals(head)){
					String uname = (String) bManage.getBody(CommonUse.ADDPERSON);
					String mes = (String)bManage.getBody(CommonUse.ADDMESSAGE);
					User sender = (User)bManage.getBody(CommonUse.ADDFROMPERSON);
					User reciver = this.check(uname);
					if(reciver!=null){
						this.sendMessage(sender, reciver, mes);
						sManage.setHead(CommonUse.SUCCESSFUL);
					}else{
						sManage.setHead(CommonUse.FAILURE);
					}
				}else if(CommonUse.ADDFRIENDBACK.equals(head)){
					String from = (String) bManage.getBody(CommonUse.ADDFROMPERSON);
					String to = (String) bManage.getBody(CommonUse.ADDPERSON);
					String res = (String)bManage.getBody(CommonUse.ADDFRIENDRESULT);
					if(this.becomeFriend(from, to, res)){
						List<User> friList = this.getFris();
						sManage.setHead(CommonUse.SUCCESSFUL);
						sManage.setBody(CommonUse.FRIENDS_INFO, friList);
					}else{
						sManage.setHead(CommonUse.FAILURE);
					}
				}else if(CommonUse.CHECKNAME.equals(head)){
					String uname = (String)bManage.getBody(CommonUse.MESSAGE);
					if(this.checkName(uname)){
						sManage.setHead(CommonUse.SUCCESSFUL);
					}else{
						sManage.setHead(CommonUse.FAILURE);
					}
				}
				this.out.writeObject(sManage);
				this.out.flush();
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			this.offline();
		}
	}
	
}
