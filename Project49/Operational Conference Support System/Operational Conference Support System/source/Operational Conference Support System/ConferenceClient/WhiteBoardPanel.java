import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;

public class WhiteBoardPanel extends JPanel {
  
  private JPanel drawpanel = new JPanel();
  private JPanel menupanel = new JPanel();
  private JScrollPane sdrawpanel;
  protected DataOutputStream dout;
  private JLabel l1,l2,l3,l4,l5,l6,l7,l8,l9,lc;
  private ImageIcon i1,i2,i3,i4,i5,i6,i7,i8,i9,ic;
  private Color c[] = new Color[65535];
  private Color color;
  private Point points[] = new Point[65535];
  private int pc = 0;
  private boolean isProjector = false;
  private boolean isFirst = true;
  private boolean isDraw = false;
  private Graphics g;
  
  // Constructor
  public WhiteBoardPanel(boolean isprojector) {
    try {
      if(isprojector) Init(); else InitProjector();
    } catch(Exception e) { e.printStackTrace(); }
  }
  public WhiteBoardPanel(Socket sock,boolean pjt) {
    try {
      dout = new DataOutputStream(sock.getOutputStream());
      if(pjt) Init(); else InitProjector();
    } catch(Exception e) { e.printStackTrace(); }
  }
  // Inititail all component
  private void Init() throws Exception {
    sdrawpanel = new JScrollPane(drawpanel,JScrollPane.VERTICAL_SCROLLBAR_NEVER,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    drawpanel.setBackground(Color.WHITE);
    color = Color.BLACK;
    i1 = new ImageIcon(WhiteBoardPanel.class.getResource("black.png"));
    i2 = new ImageIcon(WhiteBoardPanel.class.getResource("blue.png"));
    i3 = new ImageIcon(WhiteBoardPanel.class.getResource("cyan.png"));
    i4 = new ImageIcon(WhiteBoardPanel.class.getResource("green.png"));
    i5 = new ImageIcon(WhiteBoardPanel.class.getResource("magenta.png"));
    i6 = new ImageIcon(WhiteBoardPanel.class.getResource("orenge.png"));
    i7 = new ImageIcon(WhiteBoardPanel.class.getResource("pink.png"));
    i8 = new ImageIcon(WhiteBoardPanel.class.getResource("red.png"));
    i9 = new ImageIcon(WhiteBoardPanel.class.getResource("yellow.png"));
    ic = new ImageIcon(WhiteBoardPanel.class.getResource("clear.png"));
    l1 = new JLabel(i1); l2 = new JLabel(i2); l3 = new JLabel(i3);
    l4 = new JLabel(i4); l5 = new JLabel(i5); l6 = new JLabel(i6);
    l7 = new JLabel(i7); l8 = new JLabel(i8); l9 = new JLabel(i9);
    lc = new JLabel(ic); //ld = new JLabel(id);
    menupanel.add(lc); //menupanel.add(ld);
    menupanel.add(l1); menupanel.add(l2); menupanel.add(l3); menupanel.add(l4);
    menupanel.add(l5); menupanel.add(l6); menupanel.add(l7); menupanel.add(l8);
	 menupanel.add(l9); 
    menupanel.setBackground(Color.WHITE);
    
    setLayout(new BorderLayout());
    add(sdrawpanel,BorderLayout.CENTER);
    add(menupanel,BorderLayout.SOUTH);
    MouseListeners mouselistener = new MouseListeners();
    drawpanel.addMouseMotionListener(mouselistener);
    l1.addMouseListener(mouselistener); l2.addMouseListener(mouselistener);
    l3.addMouseListener(mouselistener); l4.addMouseListener(mouselistener);
    l5.addMouseListener(mouselistener); l6.addMouseListener(mouselistener);
    l7.addMouseListener(mouselistener); l8.addMouseListener(mouselistener);
    l9.addMouseListener(mouselistener); lc.addMouseListener(mouselistener);
    //ld.addMouseListener(mouselistener); 
  }
  private void InitProjector() {
  	 color = Color.BLACK;
    drawpanel.setBackground(Color.WHITE);
    sdrawpanel = new JScrollPane(drawpanel,JScrollPane.VERTICAL_SCROLLBAR_NEVER,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
    setLayout(new BorderLayout());
    add(sdrawpanel,BorderLayout.CENTER);
  }
  // return Graphics g to client thread
  public Graphics getDrawPanel() {
    return drawpanel.getGraphics();
  }
    // set status projector
  public void setProjectorStatus(boolean isProjector) {
  		this.isProjector = isProjector;
  }
  // check status projector
  public boolean getProjectorStatus() {
  		return isProjector;
  }
  // check status first to send data points in array
  public void setFirst(boolean isFirst) {
  		this.isFirst = isFirst;
  }
  // check status first to send data points in array
  public boolean getFirst() {
  		return isFirst;
  }
  // Mark into panel
  public void Mark() {  		
  		g = drawpanel.getGraphics();
  		if(g != null) {
     		for(int i = 0;i < points.length;i++) {
     			if(points[i] != null) {
     				g.setColor(c[i]);
     				g.fillOval(points[i].x,points[i].y,8,8);
     			} else break;	
     		}
  		}  	
  }
  // Clear point in points array
  public void ClearPoints() {
    for(int i = 0;i < points.length;i++) {
      if(points[i] != null) { points[i] = null; }
      else break;
    }
    pc = 0;
    repaint();
  }
  // paint to whiteboardpanel
  public void MarkProjector(int x,int y,Color color) throws Exception {
  		if(pc < points.length) {
      	points[pc] = new Point(x,y);
         c[pc] = color;
         ++pc;
      }
      if(isFirst) {
      	Mark();
      	isFirst = false;
      }
      g = drawpanel.getGraphics();
  		g.setColor(color);
     	g.fillOval(x,y,8,8);
  }
  // Write data to server thread for server thread boardcast to anther client
  private synchronized void WriteData(int x,int y,Color color) throws IOException {
    dout.writeInt(5);
    dout.writeInt(x);
    dout.writeInt(y);
    dout.writeInt(color.getRed());
    dout.writeInt(color.getGreen());
    dout.writeInt(color.getBlue());
  }
  // Listener mouse event
  class MouseListeners implements MouseMotionListener,MouseListener {
    public void mouseDragged(MouseEvent e) {
      try {
      	//if(isDraw) {
      		if (pc < points.length) {
	          	points[pc] = e.getPoint();
	          	c[pc] = color;
	          	if(isProjector) {
	          		if(isFirst) {// for send data in array to the first times.
	          			for(int i=0;i<=pc;i++) {
	          				WriteData((int)points[i].getX(),(int)points[i].getY(),c[i]);
	          			}
	          			isFirst = false;
	          		}
	          		WriteData(e.getX(),e.getY(),c[pc]);
	          	}
          	}
          	++pc;
        	 	Mark();
      	//}
      } catch (Exception ex){}
    }
    public void mouseClicked(MouseEvent e) {
    	try {
    		if(e.getSource() == l1) color = Color.BLACK;
    		else if(e.getSource() == l2) color = Color.BLUE;
    		else if(e.getSource() == l3) color = Color.CYAN;
    		else if(e.getSource() == l4) color = Color.GREEN;
    		else if(e.getSource() == l5) color = Color.MAGENTA;
    		else if(e.getSource() == l6) color = Color.ORANGE;
    		else if(e.getSource() == l7) color = Color.PINK;
    		else if(e.getSource() == l8) color = Color.RED;
    		else if(e.getSource() == l9) color = Color.YELLOW;
    		else if(e.getSource() == lc) {
    			dout.writeInt(12); ClearPoints();
    		}
    		/*else if(e.getSource() == ld) {
    			isDraw = true;
    		}*/
    	} catch(Exception ex) { ex.printStackTrace(); }
    }
    public void mouseMoved(MouseEvent e) {}
    public void mouseEntered(MouseEvent e) { }
    public void mouseExited(MouseEvent e) { }
    public void mousePressed(MouseEvent e) { }
    public void mouseReleased(MouseEvent e) { }
  }
  
  
} // end of class