package com.qq.pub;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

public class UDPSocket {
	private DatagramSocket datagramSocket = null;
	private DatagramPacket datagramPacket = null;
	
	public UDPSocket() {
		// TODO Auto-generated constructor stub
		try {
			this.datagramSocket = new DatagramSocket();
			byte[] b = new byte[1024];
			this.datagramPacket = new DatagramPacket(b, 0, b.length);
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public UDPSocket(String ip,int port) {
		// TODO Auto-generated constructor stub
		try {
			this.datagramSocket = new DatagramSocket();
			byte[] b = new byte[1024];
			this.datagramPacket = new DatagramPacket(b, 0, b.length, InetAddress.getByName(ip), port);
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void send(String mes){
		try {
			this.datagramPacket.setData(mes.getBytes());
			this.datagramSocket.send(datagramPacket);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String receive(){
		String mes = null;
		try {
			this.datagramSocket.receive(datagramPacket);
			mes = new String(this.datagramPacket.getData());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mes;
	}
	
	public int getPort(){
		return this.datagramSocket.getLocalPort();
	}
	
}
