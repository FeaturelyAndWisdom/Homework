package com.qq.ui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.Box;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

import com.qq.bean.User;
import com.qq.component.ImgPanel;
import com.qq.pub.CommonUse;
import com.qq.pub.TCPManage;
import com.qq.pub.TCPSocket;
import com.qq.pub.UDPSocket;

public class LoginFrame extends JFrame implements ActionListener{

	private TCPSocket tcpSocket = null;
	private UDPSocket udpSocket = null;
	
	private JPanel bodyPanel = null;
	private JPanel centerPanel = null;
	private JPanel btnPanel = null;
	
	private JLabel accountLabel = null;
	private JLabel pwdLabel = null;
	private JTextField accountField = null;
	private JPasswordField pwdField = null;
	private JButton login = null;
	private JButton regist = null;
	
	public LoginFrame() {
		// TODO Auto-generated constructor stub
		this.tcpSocket = new TCPSocket("127.0.0.1", 20000);
		this.udpSocket = new UDPSocket();
		this.init();
	}
	
	private void init(){
		this.bodyPanel = (JPanel)this.getContentPane();
		this.bodyPanel.setLayout(new BorderLayout());
		
		this.centerPanel = new ImgPanel("./xsyu2.jpg");
		this.accountLabel = new JLabel("账号：");
		this.accountLabel.setPreferredSize(new Dimension(60, 24));
		this.accountField = new JTextField();
		this.accountField.setPreferredSize(new Dimension(160, 24));
		this.pwdLabel = new JLabel("口令：");
		this.pwdLabel.setPreferredSize(new Dimension(60, 24));
		this.pwdField = new JPasswordField();
		this.pwdField.setPreferredSize(new Dimension(160, 24));
		
		Box box0 = Box.createVerticalBox();
		Box box1 = Box.createHorizontalBox();
		Box box2 = Box.createHorizontalBox();
		box1.add(this.accountLabel);
		box1.add(this.accountField);
		box2.add(this.pwdLabel);
		box2.add(this.pwdField);
		box0.add(Box.createVerticalStrut(70));
		box0.add(box1);
		box0.add(Box.createVerticalStrut(10));
		box0.add(box2);
		this.centerPanel.add(box0);
		this.bodyPanel.add(this.centerPanel,BorderLayout.CENTER);
		
		this.btnPanel = new JPanel();
		this.login = new JButton("登录");
		this.login.addActionListener(this);
		this.regist = new JButton("注册");
		this.regist.addActionListener(this);
		this.btnPanel.add(this.login);
		this.btnPanel.add(this.regist);
		this.bodyPanel.add(this.btnPanel,BorderLayout.SOUTH);
		
		this.setTitle("登录");
		this.setSize(414, 307);
		CommonUse.setComponentBounts(this, 414, 307);
		this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		this.setResizable(false);
		this.setVisible(true);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource() == this.login){
			String account = this.accountField.getText();
			String password = new String(this.pwdField.getPassword());
			if(account.isEmpty() || password.isEmpty()){
				JOptionPane.showMessageDialog(this, "账号口令不能为空");
				return;
			}
			String ip = this.tcpSocket.getIp();
			int port = this.udpSocket.getPort();
			User logUser = new User(account, password, ip, port+"");
			TCPManage sManage = new TCPManage();
			sManage.setHead(CommonUse.LOGIN);
			sManage.setBody(CommonUse.QQ_USER, logUser);
			TCPManage bManage = this.tcpSocket.submit(sManage);
			if(CommonUse.SUCCESSFUL.equals(bManage.getHead())){
				JOptionPane.showMessageDialog(this, "登陆成功");
				User fullUser = (User) sManage.getBody(CommonUse.QQ_USER);
				MainFrame frame = new MainFrame(tcpSocket, udpSocket, fullUser);
				this.dispose();
			}else{
				JOptionPane.showMessageDialog(this, "用户名密码有误");
			}
		}
		if(e.getSource() == this.regist){
			RegistFrame registFrame = new RegistFrame(tcpSocket);
		}
	}

}
