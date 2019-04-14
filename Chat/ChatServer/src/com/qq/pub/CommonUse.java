package com.qq.pub;

import java.awt.Dimension;
import java.awt.Toolkit;
import java.io.File;
import java.io.Serializable;

import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JOptionPane;


/**
 * @author jzyqd_
 */
public class CommonUse implements Serializable{
	
	public static final String FLAG="FLAG";
	
	public static final String REGISTER="REGISTER";
	
	public static final String LOGIN="LOGIN";
	
	public static final String ONLINE="ONLINE";
	
	public static final String OFFLINE="OFFLINE";
	
	public static final String FIND="FIND";
	
	public static final String QQ_USER="QQ_USER";
	
	public static final String SUCCESSFUL="SUCCESSFUL";
	
	public static final String FAILURE="FAILURE";
	
	public static final String FRIENDS_INFO="FRIENDS_INFO";
	
	public static final String SERVER_IP = "127.0.0.1";
	
	public static final int SERVER_PORT = 9999;
	
	public static final String FIND_FRIEND="FIND_FRIEND";
	
    public static final String UDP_PACKET_SYMBOL = "\n\r\n\r"; 
	
	public static final String MESSAGE = "MESSAGE";
	
	public static final String ADDFRIEND = "ADD FRIEND";
	
	public static final String ADDMESSAGE = "ADD MESSAGE";
	
	public static final String ADDFROMPERSON = "ADD FROM PERSON";
	
	public static final String ADDPERSON = "ADD PERSON";
	
	public static final String ADDFRIENDBACK = "ADD FRIEND BACK";
	
	public static final String ADDFRIENDRESULT = "ADD FRIEND RESULT";
	
	public static final String CHECKNAME = "CHECKNAME";

    public static void showMessage(JComponent j, String message, String title, int i) {
        JOptionPane.showMessageDialog(j, message, title, i);
    }
    
    public static String getSystempath() {
        File f = new File("");
        return f.getAbsolutePath();
    }

    public static String getSystemTime() {
        //java.text.SimpleDateFormat f = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        java.text.SimpleDateFormat f = new java.text.SimpleDateFormat("HH:mm:ss");
        String time = f.format(new java.util.Date());
        return time;
    }
    
    
    public static void setComponentBounts(JFrame frame, int width, int high) {
        Toolkit kit = Toolkit.getDefaultToolkit();
        Dimension screenSize = kit.getScreenSize();
        int screenHeight = screenSize.height;
        int screenWidth = screenSize.width;
        frame.setLocation((screenWidth - width) / 2, (screenHeight - high) / 2);
    }
}
