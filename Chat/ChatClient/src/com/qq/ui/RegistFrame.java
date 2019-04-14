package com.qq.ui;

import java.awt.BorderLayout;
import java.awt.Dimension;
import java.awt.HeadlessException;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.io.File;

import javax.swing.Box;
import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

import com.qq.bean.User;
import com.qq.component.ImgPanel;
import com.qq.pub.CommonUse;
import com.qq.pub.TCPManage;
import com.qq.pub.TCPSocket;

public class RegistFrame extends JFrame implements ActionListener{
	private TCPSocket tcpSocket = null;

	private JPanel bodyPanel = null;
	private JPanel centerPanel = null;
	private JPanel btnPanel = null;
	
	private JButton checkName = null;
	private boolean nameFlag = false;
	
	private JLabel unameLabel = null;
	private JLabel rnameLabel = null;
	private JLabel pwdLabel = null;
	private JLabel pwd2Label = null;
	private JLabel phoneLabel = null;
	private JLabel roleLabel = null;
	private JLabel stuidLabel = null;
	private JLabel imgLabel = null;
	
	private JTextField unameField = null;
	private JTextField rnameField = null;
	private JPasswordField pwdField = null;
	private JPasswordField pwd2Field = null;
	private JRadioButton stuRole = null;
	private JRadioButton schRole = null;
	private ButtonGroup roles = null;
	private JTextField phoneField = null;
	private JTextField stuidField = null;
	private JComboBox imgBox = null;
	
	private JButton regist = null;
	private JButton reset = null;
	
	
	public RegistFrame(TCPSocket tcpSocket) throws HeadlessException {
		super();
		this.tcpSocket = tcpSocket;
		this.init();
	}
	
	private void loadBox(){
		File[] files = new File("./onimg").listFiles();
		for (File f : files) {
			this.imgBox.addItem(new ImageIcon(f.getAbsolutePath()));
		}
	}
	
	private void init(){
		this.bodyPanel = (JPanel)this.getContentPane();
		this.bodyPanel.setLayout(new BorderLayout());
		this.centerPanel = new ImgPanel("./register.jpg");
		this.unameLabel = new JLabel("用户名：");
		this.unameLabel.setPreferredSize(new Dimension(100, 24));
		this.checkName = new JButton("检查重名");
		this.checkName.setPreferredSize(new Dimension(90, 24));
		this.checkName.addActionListener(this);
		this.rnameLabel = new JLabel("真实姓名：");
		this.rnameLabel.setPreferredSize(new Dimension(100, 24));
		this.pwdLabel = new JLabel("口令：");
		this.pwdLabel.setPreferredSize(new Dimension(100, 24));
		this.pwd2Label = new JLabel("确认口令：");
		this.pwd2Label.setPreferredSize(new Dimension(100, 24));
		this.phoneLabel = new JLabel("手机号码：");
		this.phoneLabel.setPreferredSize(new Dimension(100, 24));
		this.stuidLabel = new JLabel("学号：");
		this.stuidLabel.setPreferredSize(new Dimension(100, 24));
		this.roleLabel = new JLabel("权限：");
		this.roleLabel.setPreferredSize(new Dimension(100, 24));
		this.imgLabel = new JLabel("选择头像：");
		this.imgLabel.setPreferredSize(new Dimension(100, 33));
		this.unameField = new JTextField();
		this.unameField.setPreferredSize(new Dimension(110, 24));
		this.unameField.addFocusListener(new FocusListener() {
			
			@Override
			public void focusLost(FocusEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void focusGained(FocusEvent e) {
				// TODO Auto-generated method stub
				nameFlag = false;
			}
		});
		this.rnameField = new JTextField();
		this.rnameField.setPreferredSize(new Dimension(160, 24));
		this.pwdField = new JPasswordField();
		this.pwdField.setPreferredSize(new Dimension(160, 24));
		this.pwd2Field = new JPasswordField();
		this.pwd2Field.setPreferredSize(new Dimension(160, 24));
		this.phoneField = new JTextField();
		this.phoneField.setPreferredSize(new Dimension(160, 24));
		this.stuidField = new JTextField();
		this.stuidField.setPreferredSize(new Dimension(160, 24));
		this.stuRole = new JRadioButton("学生");
		this.schRole = new JRadioButton("学校管理员");
		this.schRole.setOpaque(false);
		this.stuRole.setOpaque(false);
		this.stuRole.setSelected(true);
		this.roles = new ButtonGroup();
		this.roles.add(schRole);
		this.roles.add(stuRole);
		this.imgBox = new JComboBox();
		this.imgBox.setPreferredSize(new Dimension(160, 33));
		this.loadBox();
		
		JPanel radioPanel = new JPanel();
		radioPanel.add(this.stuRole);
		radioPanel.add(this.schRole);
		radioPanel.setOpaque(false);
		
		Box box0 = Box.createVerticalBox();
		Box box1 = Box.createHorizontalBox();
		Box box2 = Box.createHorizontalBox();
		Box box3 = Box.createHorizontalBox();
		Box box4 = Box.createHorizontalBox();
		Box box5 = Box.createHorizontalBox();
		Box box6 = Box.createHorizontalBox();
		Box box7 = Box.createHorizontalBox();
		Box box8 = Box.createHorizontalBox();
		box1.add(this.unameLabel);
		box1.add(this.unameField);
		box1.add(this.checkName);
		box2.add(this.rnameLabel);
		box2.add(this.rnameField);
		box3.add(this.pwdLabel);
		box3.add(this.pwdField);
		box4.add(this.pwd2Label);
		box4.add(this.pwd2Field);
		box5.add(this.imgLabel);
		box5.add(this.imgBox);
		box6.add(this.phoneLabel);
		box6.add(this.phoneField);
		box7.add(this.stuidLabel);
		box7.add(this.stuidField);
		box8.add(this.roleLabel);
		box8.add(radioPanel);
		box0.add(Box.createVerticalStrut(10));
		box0.add(box1);
		box0.add(Box.createVerticalStrut(5));
		box0.add(box3);
		box0.add(Box.createVerticalStrut(5));
		box0.add(box4);
		box0.add(Box.createVerticalStrut(5));
		box0.add(box2);
		box0.add(Box.createVerticalStrut(5));
		box0.add(box6);
		box0.add(Box.createVerticalStrut(5));
		box0.add(box7);
		box0.add(Box.createVerticalStrut(5));
		box0.add(box5);
		box0.add(Box.createVerticalStrut(5));
		box0.add(box8);
		this.centerPanel.add(box0);
		this.bodyPanel.add(this.centerPanel,BorderLayout.CENTER);
		this.btnPanel = new JPanel();
		this.regist = new JButton("注册");
		this.regist.addActionListener(this);
		this.reset = new JButton("重置");
		this.reset.addActionListener(this);
		this.btnPanel.add(this.regist);
		this.btnPanel.add(this.reset);
		this.bodyPanel.add(this.btnPanel,BorderLayout.SOUTH);
		
		this.setTitle("注册");
		this.setBounds(200, 200, 512, 340);
		this.setVisible(true);
	}


	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		if(e.getSource() == this.regist){
			String uname = this.unameField.getText();
			String rname = this.rnameField.getText();
			String password = new String(this.pwdField.getPassword());
			String pwd2 = new String(this.pwd2Field.getPassword());
			String stuid = this.stuidField.getText();
			String phone = this.phoneField.getText();
			int role = -1;
			if(this.stuRole.isSelected()){
				role = 1;
			}else{
				role = 0;
			}
			if(uname.isEmpty()){
				JOptionPane.showMessageDialog(this, "账号不能为空");
				return;
			}
			if(!this.nameFlag){
				JOptionPane.showMessageDialog(this, "请验证用户名");
				return;
			}
			if(password.isEmpty()){
				JOptionPane.showMessageDialog(this, "口令不能为空");
				return;
			}
			if(!(password.equals(pwd2))){
				JOptionPane.showMessageDialog(this, "口令不一致");
				return;
			}
			if(rname.isEmpty()){
				JOptionPane.showMessageDialog(this, "姓名不能为空");
				return;
			}
			if(stuid.isEmpty()){
				JOptionPane.showMessageDialog(this, "学号不能为空");
				return;
			}
			if(phone.isEmpty()){
				JOptionPane.showMessageDialog(this, "手机号码不能为空");
				return;
			}
			String img = this.imgBox.getSelectedItem().toString();
			int start = img.lastIndexOf("x");
			int end = img.lastIndexOf(".");
			String pic = img.substring(start+1, end);
			User regUser = new User(uname, password, role, phone, rname, stuid, pic);
			TCPManage sManage = new TCPManage();
			sManage.setHead(CommonUse.REGISTER);
			sManage.setBody(CommonUse.QQ_USER, regUser);
			TCPManage bManage = this.tcpSocket.submit(sManage);
			if(CommonUse.SUCCESSFUL.equals(bManage.getHead())){
				JOptionPane.showMessageDialog(this, "注册成功");
				this.dispose();
			}else{
				JOptionPane.showMessageDialog(this, "注册失败");
			}
		}
		if(e.getSource() == this.reset){
			this.unameField.setText("");
			this.rnameField.setText("");
			this.pwd2Field.setText("");
			this.pwdField.setText("");
			this.imgBox.setSelectedIndex(0);
		}
		if(e.getSource() == this.checkName){
			String uname = this.unameField.getText();
			TCPManage sManage = new TCPManage();
			sManage.setHead(CommonUse.CHECKNAME);
			sManage.setBody(CommonUse.MESSAGE, uname);
			TCPManage bManage = this.tcpSocket.submit(sManage);
			if(CommonUse.SUCCESSFUL.equals(bManage.getHead())){
				JOptionPane.showMessageDialog(this, "该用户名可以使用");
				this.nameFlag = true;
			}else{
				JOptionPane.showMessageDialog(this, "该用户名已被占用，请更换");
				this.nameFlag = false;
			}
		}
	}
	
}
