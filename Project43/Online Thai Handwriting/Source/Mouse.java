import java.awt.*;
import java.awt.event.*;

public class Mouse implements MouseListener, MouseMotionListener {
	int movex, movey;
	int x, y;
	boolean mouseEnable = false;
	boolean release = false;
	Mouse() {}
	public void mousePressed(MouseEvent e) {}
	public void mouseReleased(MouseEvent e) {
		release = true;
	}
	public void mouseExited(MouseEvent e) {}
	public void mouseEntered(MouseEvent e) {}
	public void mouseClicked(MouseEvent e) {}
	public void mouseDragged(MouseEvent e) {
		movex = x = e.getX();
		movey = y = e.getY();
		
	}
	public void mouseMoved(MouseEvent e) {
		x = y = 0;
		movex = e.getX();
		movey = e.getY();
	}
	public int getX() { 
		return x;
	}
	public int getY() {
		return y;
	}
	public boolean getRelease() {
		return release;
	}
	public void setRelease() {
		release = false;
	}
	public boolean getmouseEnable() {
		if ( (movex > 50) && (movex < 400-3) && (movey > 73) && (movey < 545-3) ){
			mouseEnable = true;
		} else {
			mouseEnable = false;
		}
		return mouseEnable;
	}
}
