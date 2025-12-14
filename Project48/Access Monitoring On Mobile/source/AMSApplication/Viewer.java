/* 
 * Viewer.java
 */

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Viewer extends JFrame {
	private Image image;
	private String fileName;
	
	public void setFileName(String fileName)
	{  this.fileName = fileName; }
	
	public void showImage()
	{	
		Toolkit toolkit = Toolkit.getDefaultToolkit();
		image = toolkit.getImage(fileName);
		MediaTracker mediaTracker = new MediaTracker(this);
		mediaTracker.addImage(image, 0);
		try
		{
			mediaTracker.waitForID(0);
		}
		catch (InterruptedException ie)
		{
			System.err.println(ie);
			System.exit(1);
		}
		setSize(image.getWidth(null), image.getHeight(null));
		setTitle(fileName);
		show();
	}

	public void paint(Graphics graphics) {
		graphics.drawImage(image, 0, 0, null);
	}
}
