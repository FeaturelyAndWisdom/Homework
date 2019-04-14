package com.qq.server;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;

import javax.swing.JOptionPane;

public class Server {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			ServerSocket serverSocket = new ServerSocket(20000);
			JOptionPane.showMessageDialog(null, "·þÎñÆ÷Æô¶¯£¡");
			while(true){
				Socket socket = serverSocket.accept();
				ServerThread thread = new ServerThread(socket);
				thread.start();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
