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

public class AddFriendReplyFrame extends JFrame implements ActionListener {
	
	private TCPSocket tcpSocket = null;
	private User sender = null;
	private String uname = null;
	private String mess = null;
	private MainFrame mframe = null;
	
	private JPanel bodyPanel = null;
	private JPanel centerPanel = null;
	private JPanel btnPanel = null;
	
	private JLabel receLabel = null;
	private JTextField receField = null;
	private JLabel mesLabel = null;
	private JTextArea mesArea = null;
	
	private JButton yes = null;
	private JButton no = null;
	private JButton cancel = null;
	
	@Override
	public Font getFont() {
		// TODO Auto-generated method stub
		return super.getFont();
	}

	public AddFriendReplyFrame(User sender, String uname, String mess, TCPSocket tcpSocket, MainFrame mframe) {
		super();
		this.sender = sender;
		this.tcpSocket = tcpSocket;
		this.uname = uname;
		this.mess = mess;
		this.mframe = mframe;
		this.init();
	}
	
	private void init(){
		this.bodyPanel = (JPanel)this.getContentPane();
		this.bodyPanel.setLayout(new BorderLayout());
		
		this.centerPanel = new JPanel();
		this.receLabel = new JLabel("好友名称：");
		this.receLabel.setPreferredSize(new Dimension(100, 24));
		this.receField = new JTextField();
		this.receField.setText(this.uname);
		this.receField.setFocusable(false);
		this.receField.setPreferredSize(new Dimension(150, 24));
		this.mesLabel = new JLabel("验证消息：");
		this.mesLabel.setPreferredSize(new Dimension(100, 24));
		this.mesArea = new JTextArea();
		this.mesArea.setText(this.mess);
		this.mesArea.setFocusable(false);
		this.mesArea.setPreferredSize(new Dimension(150, 200));
		
		Box box0 = Box.createVerticalBox();
		Box box1 = Box.createHorizontalBox();
		Box box2 = Box.createHorizontalBox();
		box1.add(this.receLabel);
		box1.add(this.receField);
		box2.add(this.mesLabel);
		box2.add(this.mesArea);
		box0.add(Box.createVerticalStrut(20));
		box0.add(box1);
		box0.add(Box.createVerticalStrut(20));
		box0.add(box2);
		
		this.centerPanel.add(box0);
		this.bodyPanel.add(this.centerPanel,BorderLayout.CENTER);
		this.btnPanel = new JPanel();
		this.yes = new JButton("同意");
		this.no = new JButton("拒绝");
		this.cancel = new JButton("关闭");
		this.yes.addActionListener(this);
		this.no.addActionListener(this);
		this.cancel.addActionListener(this);
		this.btnPanel.add(this.yes);
		this.btnPanel.add(this.no);
		this.btnPanel.add(this.cancel);
		this.bodyPanel.add(this.btnPanel,BorderLayout.SOUTH);
		
		this.setTitle(this.uname+"想添加您为好友");
		this.setSize(370, 420);
		CommonUse.setComponentBounts(this, 370, 420);
		this.setVisible(true);
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		TCPManage sManage = new TCPManage();
		sManage.setHead(CommonUse.ADDFRIENDBACK);
		sManage.setBody(CommonUse.ADDPERSON, this.sender.getUname());
		sManage.setBody(CommonUse.ADDFROMPERSON, this.uname);
		if(e.getSource()==this.yes){
			sManage.setBody(CommonUse.ADDFRIENDRESULT, "YES");
			TCPManage bManage = this.tcpSocket.submit(sManage);
			if(CommonUse.SUCCESSFUL.equals(bManage.getHead())){
				JOptionPane.showMessageDialog(this, "添加成功，你们已经成为好友");
				this.mframe.setFriLst((List<User>)bManage.getBody(CommonUse.FRIENDS_INFO));
				this.mframe.udpList();
				this.dispose();
			}else{
				JOptionPane.showMessageDialog(this, "添加失败，请稍后再试");
			}
		}
		if(e.getSource()==this.no){
			sManage.setBody(CommonUse.ADDFRIENDRESULT, "NO");
			TCPManage bManage = this.tcpSocket.submit(sManage);
			if(CommonUse.FAILURE.equals(bManage.getHead())){
				JOptionPane.showMessageDialog(this, "已拒绝");
				this.dispose();
			}else{
				JOptionPane.showMessageDialog(this, "拒绝失败，请稍后再试");
			}
		}
		if(e.getSource()==this.cancel){
			this.dispose();
		}
	}
	
	
}
