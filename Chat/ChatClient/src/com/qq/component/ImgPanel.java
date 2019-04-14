package com.qq.component;

import java.awt.Graphics;

import javax.swing.ImageIcon;
import javax.swing.JPanel;

public class ImgPanel extends JPanel {
	private ImageIcon img = null;
	
	public ImgPanel(String path) {
		// TODO Auto-generated constructor stub
		this.img = new ImageIcon(path);
	}

	@Override
	protected void paintComponent(Graphics g) {
		// TODO Auto-generated method stub
		g.drawImage(this.img.getImage(), 0, 0, null);
	}
	
	
}
