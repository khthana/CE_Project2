import java.awt.*;
import javax.swing.*;
import java.awt.event.*;

public class ChoiceBox extends JFrame {
	
	private JLabel b1;
	private JLabel lbllogo,lbltail, labelBlank1, labelBlank2;
	private ImageIcon ico,icox;
	private JLabel lb = new JLabel();
	private ImageIcon icob1, iconBlank;
	private JPanel mainpanel = new JPanel(new GridBagLayout());
	private GridBagConstraints gc;
	private String vbutton;
	
	private static String vButton;
	
	public ChoiceBox(String[] st) {
		try {
      Init(st);
    } catch(Exception e) { e.printStackTrace(); }
	}
	
	private void Init(String[] st) throws Exception {
		gc = new GridBagConstraints();
		setLayout(new BorderLayout());
		
		mainpanel.setBackground(Color.WHITE);
		
		lb.setFont(new Font("",0,20));
		lb.setText("1");
		lb.setForeground(Color.WHITE);
		
		icob1 = new ImageIcon(ChoiceBox.class.getResource("ok1.png"));
		ico = new ImageIcon(ChoiceBox.class.getResource("mhead_500.png"));
		icox = new ImageIcon(ChoiceBox.class.getResource("mbot_500.png"));
		iconBlank = new ImageIcon(ChoiceBox.class.getResource("blankButtonSmall.png"));
		
		b1 = new JLabel(icob1);
		lbllogo = new JLabel(ico);
		lbltail = new JLabel(icox);
		labelBlank1 = new JLabel(iconBlank);
		labelBlank2 = new JLabel(iconBlank);
		
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 4; gc.insets.bottom = 0;
		gc.insets.left = 4; gc.insets.right = 4;
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
		
		JLabel lb2 = new JLabel("ตัวเลือกทั้งหมด", SwingConstants.CENTER);
		lb2.setFont(new Font("",0,30));
	//	lb2.setForeground(Color.BLUE);
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		mainpanel.add(lb2,gc);
		
		// blank line
		JLabel lb3 = new JLabel("1", SwingConstants.CENTER);
		lb3.setFont(new Font("",0,20));
		lb3.setForeground(Color.WHITE);
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		mainpanel.add(lb3,gc);
		
		// size of allChoice var from class SummaryWeightedPanel
		int lenChoice = st.length;		

		gc.gridwidth = 3; gc.gridheight = 1; // merge cell from grid
		
		// Choices
		JLabel[] lbC = new JLabel[lenChoice];
		JLabel[] label1 = new JLabel[lenChoice];
		for(int i = 0; i < lenChoice; i++)
		{
			label1[i] = new JLabel();
			label1[i].setText("ตัวเลือกที่ " + (i + 1) + ": ");
			label1[i].setFont(new Font("",0,25));
			label1[i].setOpaque(true);	
			// set bg of choice
			if(i % 2 == 0)
				label1[i].setBackground(Color.YELLOW);
			else	
				label1[i].setBackground(Color.ORANGE);
			
			gc.gridx = 0; gc.gridy = i + 2; // position of grid [like array two dimention]
			mainpanel.add(label1[i],gc);
			
			lbC[i] = new JLabel();
			lbC[i].setText(st[i]);
			lbC[i].setFont(new Font("",0,25));					
				
			gc.gridx = 3; gc.gridy = i + 2; // position of grid [like array two dimention]
			mainpanel.add(lbC[i],gc);
		}	
		
		// Blank line
		gc.gridx = 0; gc.gridy = lenChoice + 2; // position of grid [like array two dimention]
		mainpanel.add(lb,gc);
		
		gc.gridwidth = 2; gc.gridheight = 1; // merge cell from grid
		
		// Blank button
		gc.gridx = 0; gc.gridy = lenChoice + 3; // position of grid [like array two dimention]
		mainpanel.add(labelBlank1,gc);
		gc.gridx = 1; gc.gridy = lenChoice + 3; // position of grid [like array two dimention]
		mainpanel.add(labelBlank2,gc);
		
		// OK Button
		gc.gridx = 2; gc.gridy = lenChoice + 3; // position of grid [like array two dimention]
		mainpanel.add(b1,gc);
		
		setUndecorated(true);
		add(lbllogo,BorderLayout.NORTH);
		add(mainpanel,BorderLayout.CENTER);
		add(lbltail,BorderLayout.SOUTH);
		
		// variable size for window that depend on lenChoice var
		if(lenChoice <= 4)
			setSize(500,400);
		else if(lenChoice <= 10 && lenChoice > 4)
			setSize(500,500);
		else
			setSize(500,600);
		
		//Center the window
		setResizable(false);
    	Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    	Dimension frameSize = getSize();
    	if (frameSize.height > screenSize.height) { frameSize.height = screenSize.height; }
    	if (frameSize.width > screenSize.width) { frameSize.width = screenSize.width; }
    	setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
		
		MouseListeners mouselisteners = new MouseListeners();
		b1.addMouseListener(mouselisteners);
		
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}

	public void showBox() { show(true); }
	
	private void hideBox() { show(false); }
	
	
	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) {
	    	try {
	    		if(e.getSource() == b1) {
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