import java.io.*;
import java.awt.*;
import java.awt.event.*;

public class Whiteboard extends Canvas implements Recipient {
	public Whiteboard () {
		setBackground (new Color (255, 255, 204));
		enableEvents (AWTEvent.MOUSE_EVENT_MASK | AWTEvent.MOUSE_MOTION_EVENT_MASK);
	}
	
	protected MessageOutput messageOut;
	
	public void setMessageOutput (MessageOutput messageOut) {
		this.messageOut = messageOut;
	}
	
	public Dimension getPreferredSize () {
		return new Dimension (200, 150);
	}
	
	protected void processEvent (AWTEvent event) {
		if (event instanceof MouseEvent) {
			switch (event.getID ()) {
				case MouseEvent.MOUSE_PRESSED:
					mousePressed ((MouseEvent) event);
					break;
				case MouseEvent.MOUSE_DRAGGED:
					mouseDragged ((MouseEvent) event);
					break;
				case MouseEvent.MOUSE_RELEASED:
					mouseReleased ((MouseEvent) event);
					break;
				default:
					super.processEvent (event);
					break;
			}
		}
	}
	
	protected void mousePressed (MouseEvent event) {
		transmit (event.getX (), event.getY ());
	}
	
	protected void mouseDragged (MouseEvent event) {
		scribble (event.getX (), event.getY ());
		transmit (event.getX (), event.getY ());
	}
	
	protected void mouseReleased (MouseEvent event) {
		scribble (event.getX (), event.getY ());
		transmit (event.getX (), event.getY ());
		try {
			messageOut.send ();
		} catch (IOException ignored) {
		}
	}
	
	protected int oldX, oldY;
	
	protected void transmit (int x, int y) {
		try {
			messageOut.writeInt (oldX = x);
			messageOut.writeInt (oldY = y);
		} catch (IOException ignored) {
		}
	}
	
	protected void scribble (int x, int y) {
		Graphics gfx = getGraphics ();
		if (gfx != null) {
			gfx.drawLine (oldX, oldY, x, y);
			gfx.dispose ();
		}
	}
	
	public MessageOutput getMessageOutput () {
		return new DeliveryOutputStream (this);
	}
	
	public void receive (DataInputStream dataIn) {
		Graphics gfx = getGraphics ();
		if (gfx != null) {
			try {
				int oldX = dataIn.readInt (), oldY = dataIn.readInt ();
				while (dataIn.available () > 0) {
					int x = dataIn.readInt (), y = dataIn.readInt ();
					gfx.drawLine (oldX, oldY, x, y);
					oldX = x;
					oldY = y;
				}
			} catch (IOException ignored) {
			}
			gfx.dispose ();
		}
	}
}