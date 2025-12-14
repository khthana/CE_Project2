package project.service.robotsim;

import project.common.*;
import project.service.robotsim.*;

import java.awt.*;
import java.io.*;

public class Block  extends RobotSimComponent
					implements Drawable,Serializable{

	protected Color color;

	Block(int posx,int posy,int width,int height,Color c){
		this.pos_x = posx;
		this.pos_y = posy;
		this.width = width;
		this.height = height;
		this.color = c;
	}

	public void draw(Graphics g){
		g.setColor(color);
		g.fillRect(pos_x,pos_y,width,height);
	}
}