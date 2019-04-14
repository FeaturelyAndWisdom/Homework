package com.qq.ui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.HeadlessException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.List;

import javax.swing.Box;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import com.qq.bean.User;
import com.qq.pub.CommonUse;
import com.qq.pub.TCPManage;
import com.qq.pub.TCPSocket;
import com.qq.pub.UDPSocket;

public class AddFriendFrame extends JFrame implements ActionListener {
	
	private TCPSocket tcpSocket = null;
	private User sender = null;
	
	private JPanel bodyPanel = null;
	private JPanel centerPanel = null;
	private JPanel btnPanel = null;
	
	private JLabel receLabel = null;
	private JTextField receField = null;
	private JLabel mesLabel = null;
	private JTextArea mesArea = null;
	private JLabel tipLabel = null;
	
	private JButton send = null;
	private JButton close = null;
	
	@Override
	public Font getFont() {
		// TODO Auto-generated method stub
		return super.getFont();
	}

	public AddFriendFrame(User sender, TCPSocket tcpSocket) {
		super();
		this.sender = sender;
		this.tcpSocket = tcpSocket;
		this.init();
	}
	
	private void init(){
		this.bodyPanel = (JPanel)this.getContentPane();
		this.bodyPanel.setLayout(new BorderLayout());
		
		this.centerPanel = new JPanel();
		this.receLabel = new JLabel("好友名称：");
		this.receLabel.setPreferredSize(new Dimension(100, 24));
		this.receField = new JTextField();
		this.receField.setPreferredSize(new Dimension(150, 24));
		this.mesLabel = new JLabel("验证消息：");
		this.mesLabel.setPreferredSize(new Dimension(100, 24));
		this.mesArea = new JTextArea();
		this.mesArea.setPreferredSize(new Dimension(150, 200));
		this.tipLabel = new JLabel("仅当好友在线时可收到验证消息");
		
		Box box0 = Box.createVerticalBox();
		Box box1 = Box.createHorizontalBox();
		Box box2 = Box.createHorizontalBox();
		Box box3 = Box.createHorizontalBox();
		box1.add(this.receLabel);
		box1.add(this.receField);
		box2.add(this.mesLabel);
		box2.add(this.mesArea);
		box3.add(this.tipLabel);
		box0.add(Box.createVerticalStrut(20));
		box0.add(box1);
		box0.add(Box.createVerticalStrut(20));
		box0.add(box2);
		box0.add(Box.createVerticalStrut(15));
		box0.add(box3);
		
		this.centerPanel.add(box0);
		this.bodyPanel.add(this.centerPanel,BorderLayout.CENTER);
		this.btnPanel = new JPanel();
		this.send = new JButton("发送");
		this.close = new JButton("关闭");
		this.send.addActionListener(this);
		this.close.addActionListener(this);
		this.btnPanel.add(this.send);
		this.btnPanel.add(this.close);
		this.bodyPanel.add(this.btnPanel,BorderLayout.SOUTH);
		
		this.setTitle("添加好友");
		this.setSize(370, 420);
		CommonUse.setComponentBounts(this, 370, 420);
		this.setVisible(true);
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource()==this.send){
			String mes = this.mesArea.getText();
			String uname = this.receField.getText();
			TCPManage sManage = new TCPManage();
			sManage.setHead(CommonUse.ADDFRIEND);
			sManage.setBody(CommonUse.ADDPERSON, uname);
			sManage.setBody(CommonUse.ADDFROMPERSON, this.sender);
			sManage.setBody(CommonUse.ADDMESSAGE, mes);
			TCPManage bManage = this.tcpSocket.submit(sManage);
			if(CommonUse.SUCCESSFUL.equals(bManage.getHead())){
				JOptionPane.showMessageDialog(this, "发送成功，请等待对方回复");
				this.dispose();
			}else{
				JOptionPane.showMessageDialog(this, "查无此人或该用户不在线，请稍后再试");
			}
		}
		if(e.getSource()==this.close){
			this.dispose();
		}
	}
	
	
}
