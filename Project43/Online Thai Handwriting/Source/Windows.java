import java.awt.*;
import java.awt.event.*;

public class Windows extends Frame implements WindowListener {
	public void Windows( int x, int y, int w, int h, String title) {
		setTitle(title);
		setLocation(x,y);
		setSize(w,h);
		setVisible(true);
		addWindowListener(this);
	}	
	public void windowClosed(WindowEvent e) {}
	public void windowClosing(WindowEvent e) { dispose(); }
	public void windowOpened(WindowEvent e) {}
	public void windowIconified(WindowEvent e) {}
	public void windowDeiconified(WindowEvent e) {}
	public void windowActivated(WindowEvent e) {}
	public void windowDeactivated(WindowEvent e) {}
}
