import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.util.*;
import java.net.*;
import java.io.*;

public class TopicPanel extends JPanel {
	private JLabel lbltopic;
	private GridBagConstraints gc;
	private ImageIcon imgread,imgnone;
	private Vector vt = new Vector();
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
  	private ByteArrayOutputStream buff;
  	private JPanel menupanel = new JPanel();
  	private JPanel topicpanel = new JPanel();
  	private JScrollPane stopicpanel;
  	private JLabel bu,bd;
   private ImageIcon imgu,imgd;
	
	public TopicPanel(Socket sock) {
		try {
			this.sock = sock;
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() throws Exception {
		din = new DataInputStream(sock.getInputStream());
      	dout = new DataOutputStream(sock.getOutputStream());
      	setLayout(new BorderLayout());
      	stopicpanel = new JScrollPane(topicpanel,JScrollPane.VERTICAL_SCROLLBAR_NEVER,JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);
      	imgd = new ImageIcon(TopicPanel.class.getResource("d.png"));
    	imgu = new ImageIcon(TopicPanel.class.getResource("u.png"));
    	bu = new JLabel(imgu); bd = new JLabel(imgd);
    	menupanel.add(bu); menupanel.add(bd);
    	menupanel.setBackground(Color.WHITE);
    	topicpanel.setBackground(Color.WHITE);
		topicpanel.setLayout(new GridBagLayout());
		gc = new GridBagConstraints();
		lbltopic = new JLabel("TopicPanel");
		setBackground(Color.WHITE);
		imgread = new ImageIcon(TopicPanel.class.getResource("pdf.png"));
		imgnone = new ImageIcon(TopicPanel.class.getResource("nopdf.png"));
		add(stopicpanel,BorderLayout.CENTER);
		add(menupanel,BorderLayout.SOUTH);
		MouseListeners mouselistener = new MouseListeners();
		bu.addMouseListener(mouselistener);
		bd.addMouseListener(mouselistener);
	}
	public void setTopic(String topic,String filepath,int x,int y) {
		MouseListeners mouselistener = new MouseListeners();
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.WEST;
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
		
		gc.gridx = x; gc.gridy = y; // position of grid [like array two dimention]
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y 
		if(!filepath.equals("")) {
			JLabel imgpdf = new JLabel(imgread);
			imgpdf.setToolTipText(filepath);
			topicpanel.add(imgpdf,gc);
			imgpdf.addMouseListener(mouselistener);
			vt.addElement(imgpdf);
		} else {
			JLabel imgpdf = new JLabel(imgnone);
			topicpanel.add(imgpdf,gc);
			vt.addElement(imgpdf);
		}
		gc.gridx = x + 1; gc.gridy = y; // position of grid [like array two dimention]
		gc.weightx = 1; gc.weighty = 0; // resize follow size of screen x ,y 
		JLabel ltopic = new JLabel(topic);
		ltopic.setOpaque(true);
		ltopic.setFont(new Font("",0, 20));
		if((y % 2) == 0) ltopic.setBackground(Color.CYAN);  // set color of label ???
		else ltopic.setBackground(Color.GREEN);  // set color of label ???
		topicpanel.add(ltopic,gc);
	}
	private void selectTopic(MouseEvent e) {
		try {
			for(int i=0;i<vt.size();i++) {
				JLabel lbl = (JLabel)vt.elementAt(i);
				if(e.getSource() == lbl) {
					dout.writeInt(3); // message request pdf panel
					dout.writeUTF(lbl.getToolTipText()); // send file name to server
					break;
				}
			}
		} catch(Exception ex) { ex.printStackTrace(); }
	}
	// Set scrollpane down
  private void scrollDown() {
    JScrollBar jsb = stopicpanel.getVerticalScrollBar();
    jsb.setValue(jsb.getValue() + 50);
  }
  // Set scrollpane up
  private void scrollUp() {
    JScrollBar jsb = stopicpanel.getVerticalScrollBar();
    jsb.setValue(jsb.getValue() - 50);
  }
	
	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) { 
    		if(e.getSource() == bu) { scrollUp(); }
    		else if(e.getSource() == bd) { scrollDown(); }
    		else { selectTopic(e); }
    		
    	}
    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  }
} // End of class