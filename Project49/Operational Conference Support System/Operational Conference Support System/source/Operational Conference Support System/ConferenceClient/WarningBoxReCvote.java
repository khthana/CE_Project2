import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class WarningBoxReCvote extends JFrame {
	
	private JLabel b1, b2;
	private JLabel lbllogo,lbltail;
	private ImageIcon ico,icox;
	private JLabel lbl = new JLabel();
	private JLabel lb = new JLabel();
	private ImageIcon icob1, icob2;
	private JPanel mainpanel = new JPanel(new GridBagLayout());
	private GridBagConstraints gc;
	private String vbutton;
	
	public WarningBoxReCvote() {
		try {
      Init();
    } catch(Exception e) { e.printStackTrace(); }
	}
	
	private void Init() throws Exception {
		gc = new GridBagConstraints();
		setLayout(new BorderLayout());
		
		mainpanel.setBackground(Color.WHITE);
		
		lb.setFont(new Font("",0,20));
		lb.setText("1");
		lb.setForeground(Color.WHITE);
		icob1 = new ImageIcon(warningBox.class.getResource("ok.png"));
		icob2 = new ImageIcon(warningBox.class.getResource("bcancel1.png"));
		ico = new ImageIcon(warningBox.class.getResource("mhead.png"));
		icox = new ImageIcon(warningBox.class.getResource("mbot.png"));
		b1 = new JLabel(icob1);
		b2 = new JLabel(icob2);
		lbllogo = new JLabel(ico);
		lbltail = new JLabel(icox);
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 4; gc.insets.bottom = 0;
		gc.insets.left = 4; gc.insets.right = 4;
		gc.gridwidth = 2; gc.gridheight = 1; // merge cell from grid
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		mainpanel.add(lbl,gc);
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		mainpanel.add(lb,gc);
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		mainpanel.add(b1,gc);
		gc.gridx = 1; gc.gridy = 2; // position of grid [like array two dimention]
		mainpanel.add(b2,gc);
		
		setUndecorated(true);
		add(lbllogo,BorderLayout.NORTH);
		add(mainpanel,BorderLayout.CENTER);
		add(lbltail,BorderLayout.SOUTH);
		
		//Center the window
		setSize(400,300);
		setResizable(false);
    	Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    	Dimension frameSize = getSize();
    	if (frameSize.height > screenSize.height) { frameSize.height = screenSize.height; }
    	if (frameSize.width > screenSize.width) { frameSize.width = screenSize.width; }
    	setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
		
		MouseListeners mouselisteners = new MouseListeners();
		b1.addMouseListener(mouselisteners);
		b2.addMouseListener(mouselisteners);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	public void setText(String msg,int size) { 
		lbl.setText(msg); 
		lbl.setFont(new Font("",0,size));
	}
	public void showBox() { show(true); }
	
	private void hideBox() { show(false); }
	
	
	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) {
	    	try {
	    		if(e.getSource() == b1) {
	    			vbutton = "ok";
	    			SummaryYesNoPanel.getValueButtonReCvote(vbutton);
	    			hideBox();
	    		}
	    		else if(e.getSource() == b2) {
	    			vbutton = "cancel";
	    			hideBox();
	    		}
	    	} catch(Exception ex) { }
	    }
	    public void mouseEntered(MouseEvent e) { }
	    public void mouseExited(MouseEvent e) { }
	    public void mousePressed(MouseEvent e) { }
	    public void mouseReleased(MouseEvent e) { }
  	}
	
} // end of class