package com.qq.ui;

import java.awt.BorderLayout;
import java.awt.HeadlessException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import java.util.List;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;

import com.qq.bean.User;
import com.qq.client.IUdpListener;
import com.qq.client.UdpListener;
import com.qq.component.ClinetImgCell;
import com.qq.pub.CommonUse;
import com.qq.pub.TCPManage;
import com.qq.pub.TCPSocket;
import com.qq.pub.UDPSocket;

public class MainFrame extends JFrame implements MouseListener,IUdpListener,ActionListener{
	private TCPSocket tcpSocket = null;
	private UDPSocket udpSocket = null;
	private User fullUser = null;
	private List<User> friLst = null;
	
	private JPanel bodyPanel = null;
	private JLabel userInfo = null;
	private JList friendList = null;
	private DefaultListModel model = null;
	private JScrollPane pane = null;
	
	private JButton addFri = null;
	
	public List<User> getFriLst() {
		return friLst;
	}

	public void setFriLst(List<User> friLst) {
		this.friLst = friLst;
	}

	public MainFrame(TCPSocket tcpSocket, UDPSocket udpSocket, User fullUser)
			throws HeadlessException {
		super();
		this.tcpSocket = tcpSocket;
		this.udpSocket = udpSocket;
		this.fullUser = fullUser;
		this.init();
	}
	
	private void getFri(){
		TCPManage sManage = new TCPManage();
		sManage.setHead(CommonUse.FIND_FRIEND);
		TCPManage bManage = this.tcpSocket.submit(sManage);
		if(CommonUse.SUCCESSFUL.equals(bManage.getHead())){
			this.friLst = (List<User>) bManage.getBody(CommonUse.FRIENDS_INFO);
		}else{
			JOptionPane.showMessageDialog(this, "获取好友列表失败");
		}
	}
	
	private void loadList(){
		this.getFri();
		List<User> newList = new ArrayList<User>();
		for (User user : friLst) {
			if("1".equals(user.getState())){
				user.setTemp("./onimg/tx"+user.getImg()+".jpg");
				newList.add(user);
			}
		}
		for (User user : friLst) {
			if("0".equals(user.getState())){
				user.setTemp("./outimg/tx"+user.getImg()+".jpg");
				newList.add(user);
			}
		}
		this.friendList = new JList();
		this.friendList.setCellRenderer(new ClinetImgCell());
		this.friendList.addMouseListener(this);
		this.model = new DefaultListModel();
		for (User user : newList) {
			this.model.addElement(user);
		}
		this.friendList.setModel(model);
		this.pane = new JScrollPane(friendList);
		this.bodyPanel.add(this.pane,BorderLayout.CENTER);
	}
	
	public void udpList(){
		List<User> newList = new ArrayList<User>();
		for (User user : friLst) {
			if("1".equals(user.getState())){
				user.setTemp("./onimg/tx"+user.getImg()+".jpg");
				newList.add(user);
			}
		}
		for (User user : friLst) {
			if("0".equals(user.getState())){
				user.setTemp("./outimg/tx"+user.getImg()+".jpg");
				newList.add(user);
			}
		}
		this.model = new DefaultListModel();
		for (User user : newList) {
			this.model.addElement(user);
		}
		this.friendList.setModel(model);
	}
	
	private void init(){
		this.bodyPanel = (JPanel)this.getContentPane();
		this.bodyPanel.setLayout(new BorderLayout());
		this.userInfo = new JLabel(new String("欢迎您"+this.fullUser.getUname()));
		this.bodyPanel.add(this.userInfo,BorderLayout.NORTH);
		this.loadList();
		this.addFri = new JButton("添加好友");
		this.bodyPanel.add(this.addFri,BorderLayout.SOUTH);
		this.addFri.addActionListener(this);
		
		UdpListener listener = new UdpListener(udpSocket);
		listener.addListener(this);
		listener.start();
		
		this.setTitle(this.fullUser.getUname()+"的QQ");
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setBounds(200, 200, 300, 700);
		this.setVisible(true);
	}

	@Override
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		if(e.getButton()==1 && e.getClickCount()==2){
			User receiver = (User) this.friendList.getSelectedValue();
			User us = null;
			for (User user : friLst) {
				if(receiver.getUname().equals(user.getUname())){
					us = user;
				}
			}
			if(us.getTempFrame()==null){
				us.setTempFrame(new ChatFrame(this.fullUser, receiver));
			}else{
				us.getTempFrame().show();
			}
		}
	}

	@Override
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void execute(String mes) {
		// TODO Auto-generated method stub
		String[] infos = mes.split(CommonUse.UDP_PACKET_SYMBOL);
		String head = infos[0];
		if(CommonUse.ONLINE.equals(head)){
			String account = infos[1];
			String ip = infos[2];
			String port = infos[3];
			for (User user : friLst) {
				if(account.equals(user.getUname())){
					user.setState("1");
					user.setIp(ip);
					user.setPort(port);
				}
			}
			this.udpList();
		}
		if(CommonUse.OFFLINE.equals(head)){
			String account = infos[1];
			for (User user : friLst) {
				if(account.equals(user.getUname())){
					user.setState("0");
					user.setIp("0");
					user.setPort("0");
				}
			}
			this.udpList();
		}
		if(CommonUse.MESSAGE.equals(head)){
			String account = infos[1];
			String mess = infos[2];
			User receiver = null;
			for (User user : friLst) {
				if(account.equals(user.getUname())){
					receiver = user;
				}
			}
			ChatFrame cFrame = receiver.getTempFrame();
			if(cFrame==null){
				cFrame = new ChatFrame(this.fullUser, receiver);
				cFrame.addMessage(account, mess);
				receiver.setTempFrame(cFrame);
			}else{
				cFrame.addMessage(account, mess);
				if(cFrame.isShowing()==false){
					cFrame.show();
				}
			}
		}
		if(CommonUse.ADDFRIEND.equals(head)){
			String uname = infos[1];
			String mess = infos[2];
			new AddFriendReplyFrame(this.fullUser, uname, mess, this.tcpSocket, this);
		}
		if(CommonUse.ADDFRIENDBACK.equals(head)){
			String res = infos[1];
			String rece = infos[2];
			if(CommonUse.SUCCESSFUL.equals(res)){
				JOptionPane.showMessageDialog(this, "恭喜，"+rece+"已通过您的验证，你们可以开始聊天了");
				this.getFri();
				this.udpList();
			}else{
				JOptionPane.showMessageDialog(this, rece+"拒绝了你的好友请求");
			}
		}
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		new AddFriendFrame(fullUser, tcpSocket);
	}
}
