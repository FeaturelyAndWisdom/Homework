package com.qq.ui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.HeadlessException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.Box;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import com.qq.bean.User;
import com.qq.pub.CommonUse;
import com.qq.pub.UDPSocket;

public class ChatFrame extends JFrame implements ActionListener {
	
	private User sender = null;
	private User receiver = null;
	
	private JPanel bodyPanel = null;
	private JPanel centerPanel = null;
	private JTextField mesField = null;
	private JTextArea chatArea = null;
	
	private JButton send = null;
	
	public ChatFrame(User sender, User receiver) throws HeadlessException {
		super();
		this.sender = sender;
		this.receiver = receiver;
		this.init();
	}

	private void init(){
		this.bodyPanel = (JPanel)this.getContentPane();
		this.bodyPanel.setLayout(new BorderLayout());
		
		this.centerPanel = new JPanel();
		this.mesField = new JTextField();
		this.mesField.setPreferredSize(new Dimension(240, 24));
		this.send = new JButton("发送");
		this.send.addActionListener(this);
		this.send.setPreferredSize(new Dimension(60, 24));
		this.chatArea = new JTextArea();
		this.chatArea.setPreferredSize(new Dimension(300, 350));
		this.chatArea.setFocusable(false);
		
		Box box0 = Box.createVerticalBox();
		Box box1 = Box.createHorizontalBox();
		Box box2 = Box.createHorizontalBox();
		box1.add(this.chatArea);
		box2.add(this.mesField);
		box2.add(Box.createHorizontalStrut(5));
		box2.add(this.send);
		box0.add(box1);
		box0.add(Box.createVerticalStrut(20));
		box0.add(box2);
		this.centerPanel.add(box0);
		this.bodyPanel.add(this.centerPanel,BorderLayout.CENTER);
		
		
		this.setTitle("我与"+receiver.getUname()+"的聊天");
		this.setSize(400, 500);
		this.setResizable(false);
		CommonUse.setComponentBounts(this, 400, 500);
		this.setVisible(true);
	}
	
	public void addMessage(String uname, String mes){
		String temp = this.chatArea.getText() + "\n" + uname + ":" + mes;
		this.chatArea.setText(temp);
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource()==this.send){
			String mes = this.mesField.getText();
			String mess = CommonUse.MESSAGE + CommonUse.UDP_PACKET_SYMBOL
					      + this.sender.getUname() + CommonUse.UDP_PACKET_SYMBOL
					      + mes + CommonUse.UDP_PACKET_SYMBOL;
			UDPSocket udpSocket = new UDPSocket(this.receiver.getIp(), Integer.parseInt(this.receiver.getPort()));
			udpSocket.send(mess);
			String temp = this.chatArea.getText() + "\n" + "我:" +mes;
			this.chatArea.setText(temp);
			this.mesField.setText("");
		}
	}

}
