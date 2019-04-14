package com.qq.client;

import com.qq.pub.UDPSocket;

public class UdpListener extends Thread {
	
	private UDPSocket udpSocket = null;
	private IUdpListener listener = null;
	
	public UdpListener(UDPSocket udpSocket) {
		super();
		this.udpSocket = udpSocket;
	}

	public void addListener(IUdpListener listener){
		this.listener = listener;
	}
	
	@Override
	public void run() {
		while(true){
			String mes = this.udpSocket.receive();
			this.listener.execute(mes);
		}
	}
}
