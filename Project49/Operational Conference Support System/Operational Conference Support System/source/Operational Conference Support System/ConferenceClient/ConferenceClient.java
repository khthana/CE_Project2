import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.io.*;
import java.net.*;
import java.util.*;

public class ConferenceClient extends JFrame {
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
	private JPanel mainpanel,menupanel,centerpanel;
	private JPanel userpanel,passwordpanel,optionpanel,numpadpanel;
	private JLabel lbllogo,lbltail;
	private CardLayout c;
	private JLabel b1,/*b3,*/b4,b5;
	private ImageIcon ico,icox,icob1,/*icob3,*/icob4,icob5;
	private JLabel n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n16,n17,n18,n19,n20;
	private ImageIcon in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,in16,in17,in18,in19,in20;
	
	private JTextField txtuser = new JTextField(9);
	private JPasswordField txtpassword = new JPasswordField(9);
	private JLabel lbluser = new JLabel("ชื่อผู้ใช้");
	private JLabel lblpassword = new JLabel("รหัสผ่าน");
	
	private JLabel lblport = new JLabel("IP address");
	private JLabel lblip = new JLabel("หมายเลขพอร์ต");
	private static JTextField txtport = new JTextField(9);
	private static JTextField txtip = new JTextField(9);
	
	private String mem = "user",opt = "ip";
	private ClientThread ctx;
	private GridBagConstraints gc;
	// FOR SWOT
	private static Vector suggestionStrenght = new Vector();
	
	public ConferenceClient() {
		try {
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	private void Init() throws Exception {
		setLayout(new BorderLayout());
		
		mainpanel = new JPanel(new CardLayout());
		menupanel = new JPanel();
		userpanel = new JPanel(new GridBagLayout());
		passwordpanel = new JPanel(new GridBagLayout());
		centerpanel = new JPanel(new BorderLayout());
		optionpanel = new JPanel(new GridBagLayout());
		numpadpanel = new JPanel(new GridBagLayout());
		
		mainpanel.setBackground(Color.WHITE);
		menupanel.setBackground(Color.WHITE);
		userpanel.setBackground(Color.WHITE);
		passwordpanel.setBackground(Color.WHITE);
		centerpanel.setBackground(Color.WHITE);
		optionpanel.setBackground(Color.WHITE);
		numpadpanel.setBackground(Color.WHITE);
		
		gc = new GridBagConstraints();
		
		ico = new ImageIcon(ConferenceClient.class.getResource("headmini.png"));
		icox = new ImageIcon(ConferenceClient.class.getResource("bot1mini.png"));
		icob1 = new ImageIcon(ConferenceClient.class.getResource("blogin.png"));
//		icob3 = new ImageIcon(ConferenceClient.class.getResource("boption.png"));
		icob4 = new ImageIcon(ConferenceClient.class.getResource("bexit.png"));
		icob5 = new ImageIcon(ConferenceClient.class.getResource("bback1.png"));
		
		in1 = new ImageIcon(ConferenceClient.class.getResource("b1.png"));
		in2 = new ImageIcon(ConferenceClient.class.getResource("b2.png"));
		in3 = new ImageIcon(ConferenceClient.class.getResource("b3.png"));
		in4 = new ImageIcon(ConferenceClient.class.getResource("b4.png"));
		in5 = new ImageIcon(ConferenceClient.class.getResource("b5.png"));
		in6 = new ImageIcon(ConferenceClient.class.getResource("b6.png"));
		in7 = new ImageIcon(ConferenceClient.class.getResource("b7.png"));
		in8 = new ImageIcon(ConferenceClient.class.getResource("b8.png"));
		in9 = new ImageIcon(ConferenceClient.class.getResource("b9.png"));
		in10 = new ImageIcon(ConferenceClient.class.getResource("b0.png"));
		in11 = new ImageIcon(ConferenceClient.class.getResource("ba.png"));
		in12 = new ImageIcon(ConferenceClient.class.getResource("bb.png"));
		in13 = new ImageIcon(ConferenceClient.class.getResource("bc.png"));
		in14 = new ImageIcon(ConferenceClient.class.getResource("bd.png"));
		in15 = new ImageIcon(ConferenceClient.class.getResource("be.png"));
		in16 = new ImageIcon(ConferenceClient.class.getResource("bf.png"));
		
		in17 = new ImageIcon(ConferenceClient.class.getResource("bdot.png"));
		in18 = new ImageIcon(ConferenceClient.class.getResource("babacksp.png"));
		in19 = new ImageIcon(ConferenceClient.class.getResource("bbback.png"));
		in20 = new ImageIcon(ConferenceClient.class.getResource("bnext.png"));
		
		b1 = new JLabel(icob1); /*b3 = new JLabel(icob3);*/
		b4 = new JLabel(icob4); b5 = new JLabel(icob5);
		
		n1 = new JLabel(in1); n2 = new JLabel(in2); n3 = new JLabel(in3); n4 = new JLabel(in4);
		n5 = new JLabel(in5); n6 = new JLabel(in6); n7 = new JLabel(in7); n8 = new JLabel(in8);
		n9 = new JLabel(in9); n10 = new JLabel(in10); n11 = new JLabel(in11); n12 = new JLabel(in12);
		n13 = new JLabel(in13); n14 = new JLabel(in14); n15 = new JLabel(in15); n16 = new JLabel(in16);
		n17 = new JLabel(in17); n18 = new JLabel(in18); n19 = new JLabel(in19); n20 = new JLabel(in20);
		
		lbllogo = new JLabel(ico);
		lbltail = new JLabel(icox);
		
		setUserPanel();
		setPasswordPanel();
		setNumPadPanel();
		setOptionPanel();
		setMenuPanel(1);
		
		mainpanel.add(userpanel,"user");
		mainpanel.add(passwordpanel,"password");
		mainpanel.add(optionpanel,"option");
		c = (CardLayout)(mainpanel.getLayout());
		
		centerpanel.add(mainpanel,BorderLayout.CENTER);
		centerpanel.add(menupanel,BorderLayout.SOUTH);
		
		add(lbllogo,BorderLayout.NORTH);
		add(centerpanel,BorderLayout.CENTER);
		add(numpadpanel,BorderLayout.EAST);
		add(lbltail,BorderLayout.SOUTH);
		setResizable(false);
		//Center the window
		setSize(600,400);
    	Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    	Dimension frameSize = getSize();
    	if (frameSize.height > screenSize.height) { frameSize.height = screenSize.height; }
    	if (frameSize.width > screenSize.width) { frameSize.width = screenSize.width; }
    	setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
		setVisible(true);
		
		MouseListeners mouselistener = new MouseListeners();
		b1.addMouseListener(mouselistener);
//		b3.addMouseListener(mouselistener);
		b4.addMouseListener(mouselistener);
		b5.addMouseListener(mouselistener);
		
		n1.addMouseListener(mouselistener);
		n2.addMouseListener(mouselistener);
		n3.addMouseListener(mouselistener);
		n4.addMouseListener(mouselistener);
		n5.addMouseListener(mouselistener);
		n6.addMouseListener(mouselistener);
		n7.addMouseListener(mouselistener);
		n8.addMouseListener(mouselistener);
		n9.addMouseListener(mouselistener);
		n10.addMouseListener(mouselistener);
		n11.addMouseListener(mouselistener);
		n12.addMouseListener(mouselistener);
		n13.addMouseListener(mouselistener);
		n14.addMouseListener(mouselistener);
		n15.addMouseListener(mouselistener);
		n16.addMouseListener(mouselistener);
		n17.addMouseListener(mouselistener);
		n18.addMouseListener(mouselistener);
		n19.addMouseListener(mouselistener);
		n20.addMouseListener(mouselistener);
		
		FocusListeners focuslisteners = new FocusListeners();
		txtip.addFocusListener(focuslisteners);
		txtport.addFocusListener(focuslisteners);
		
		//setUndecorated(true);
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	
	private void setMenuPanel(int opt) {
		menupanel.removeAll();
		if(opt == 1) {
			menupanel.add(b1); //menupanel.add(b2);
		/*	menupanel.add(b3); */menupanel.add(b4);
		} else {
			menupanel.add(b5);
		}
		invalidate();
    	repaint(); 
    	validate();
	}
	
	private void setUserPanel() {
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 4; gc.insets.bottom = 0;
		gc.insets.left = 4; gc.insets.right = 4;
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		lbluser.setFont(new Font("",0,20));
		txtuser.setFont(new Font("",0,20));
		
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		userpanel.add(lbluser,gc);
		gc.gridx = 1; gc.gridy = 0; // position of grid [like array two dimention]
		userpanel.add(txtuser,gc);
	}
	
	private void setPasswordPanel() {
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 4; gc.insets.bottom = 0;
		gc.insets.left = 4; gc.insets.right = 4;
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		lblpassword.setFont(new Font("",0,20));
		txtpassword.setFont(new Font("",0,20));
		
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		passwordpanel.add(lblpassword,gc);
		gc.gridx = 1; gc.gridy = 0; // position of grid [like array two dimention]
		passwordpanel.add(txtpassword,gc);
	}
	
	private void setOptionPanel() throws IOException {
		String tmp;
		lblip.setFont(new Font("",0,20));
		lblport.setFont(new Font("",0,20));
		txtip.setFont(new Font("",0,20));
		txtport.setFont(new Font("",0,20));
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 20; gc.insets.bottom = 0;
		gc.insets.left = 4; gc.insets.right = 4;
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		optionpanel.add(lblport,gc);
		gc.gridx = 1; gc.gridy = 0; // position of grid [like array two dimention]
		optionpanel.add(txtip,gc);
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		optionpanel.add(lblip,gc);
		gc.gridx = 1; gc.gridy = 1; // position of grid [like array two dimention]
		optionpanel.add(txtport,gc);
		
		FileReader fr = new FileReader("config.inf");
		BufferedReader br = new BufferedReader(fr);
		tmp = br.readLine(); txtip.setText(tmp.substring(18));
		tmp = br.readLine(); txtport.setText(tmp.substring(14));
		br.close();
	}
	
	private void setNumPadPanel() {
    	gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 4; gc.insets.bottom = 0;
		gc.insets.left = 4; gc.insets.right = 4;
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		numpadpanel.add(n1,gc);
		gc.gridx = 1; gc.gridy = 0; // position of grid [like array two dimention]
		numpadpanel.add(n2,gc);
		gc.gridx = 2; gc.gridy = 0; // position of grid [like array two dimention]
		numpadpanel.add(n3,gc);
		gc.gridx = 3; gc.gridy = 0; // position of grid [like array two dimention]
		numpadpanel.add(n4,gc);
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		numpadpanel.add(n5,gc);
		gc.gridx = 1; gc.gridy = 1; // position of grid [like array two dimention]
		numpadpanel.add(n6,gc);
		gc.gridx = 2; gc.gridy = 1; // position of grid [like array two dimention]
		numpadpanel.add(n7,gc);
		gc.gridx = 3; gc.gridy = 1; // position of grid [like array two dimention]
		numpadpanel.add(n8,gc);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		numpadpanel.add(n9,gc);
		gc.gridx = 1; gc.gridy = 2; // position of grid [like array two dimention]
		numpadpanel.add(n10,gc);
		gc.gridx = 2; gc.gridy = 2; // position of grid [like array two dimention]
		numpadpanel.add(n11,gc);
		gc.gridx = 3; gc.gridy = 2; // position of grid [like array two dimention]
		numpadpanel.add(n12,gc);
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		numpadpanel.add(n13,gc);
		gc.gridx = 1; gc.gridy = 3; // position of grid [like array two dimention]
		numpadpanel.add(n14,gc);
		gc.gridx = 2; gc.gridy = 3; // position of grid [like array two dimention]
		numpadpanel.add(n15,gc);
		gc.gridx = 3; gc.gridy = 3; // position of grid [like array two dimention]
		numpadpanel.add(n16,gc);
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		numpadpanel.add(n17,gc);
		gc.gridx = 1; gc.gridy = 4; // position of grid [like array two dimention]
		numpadpanel.add(n18,gc);
		gc.gridx = 2; gc.gridy = 4; // position of grid [like array two dimention]
		numpadpanel.add(n19,gc);
		gc.gridx = 3; gc.gridy = 4; // position of grid [like array two dimention]
		numpadpanel.add(n20,gc);
	}
	
	private void setText(String key) {
		if(mem.equals("user")) {
			txtuser.setText(txtuser.getText().concat(key));
		} else if(mem.equals("password")) {
			txtpassword.setText(txtpassword.getText().concat(key));
		} else if(opt.equals("ip")) {
			txtip.setText(txtip.getText().concat(key));
		} else if(opt.equals("port")) {
			txtport.setText(txtport.getText().concat(key));
		}
	}
	
	public String getHostIP() { return txtip.getText(); }
	public String getHostPort() { return txtport.getText();}
	
	private void delText() {
		if(mem.equals("user")) {
			txtuser.setText("");
		} else if(mem.equals("password")) {
			txtpassword.setText("");
		} else if(opt.equals("ip")) {
			txtip.setText("");
		} else if(opt.equals("port")) {
			txtport.setText("");
		}
	}
	
	private void Login() {
		try {
			sock = new Socket(txtip.getText(),Integer.parseInt(txtport.getText()));
			din = new DataInputStream(sock.getInputStream());
	      	dout = new DataOutputStream(sock.getOutputStream());
	      	ctx = new ClientThread(sock,this);
	      	ctx.setDaemon(true); 
	      	ctx.start();
	      	dout.writeInt(1);
	      	dout.writeUTF(txtuser.getText());
	      	dout.writeUTF(txtpassword.getText());
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	public static void main(String[] args) {
		new ConferenceClient();
	}

	class FocusListeners implements FocusListener {
		public void focusLost(FocusEvent e) {}
		public void focusGained(FocusEvent e) {
			if(e.getSource() == txtip) {
				opt = "ip";
			} else if(e.getSource() == txtport) {
				opt = "port";
			}
		}
	}
	
	//################## FOR SWOT ####################################
	public static void setSuggestionStrenght(String aSuggestion){
		suggestionStrenght.addElement(aSuggestion);
	}
	public static Vector getSuggestionStrenght(){
		return suggestionStrenght;
	}
	
	//########################################################################
	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) { 
    		try {
		      if(e.getSource() == b1) {
					Login();
		      }/* else if(e.getSource() == b3) {
		      	mem = "option";
		      	c.show(mainpanel,mem);
		      	setMenuPanel(2);
		      } */else if(e.getSource() == b4) {
		      	System.exit(0);
		      } else if(e.getSource() == b5) {
		      	mem = "user";
		      	c.show(mainpanel,mem);
		      	setMenuPanel(1);
		      } else if(e.getSource() == n1) { setText("1"); } 
		      else if(e.getSource() == n2) { setText("2"); }
		      else if(e.getSource() == n3) { setText("3"); }
		      else if(e.getSource() == n4) { setText("4"); }
		      else if(e.getSource() == n5) { setText("5"); }
		      else if(e.getSource() == n6) { setText("6"); }
		      else if(e.getSource() == n7) { setText("7"); }
		      else if(e.getSource() == n8) { setText("8"); }
		      else if(e.getSource() == n9) { setText("9"); }
		      else if(e.getSource() == n10) { setText("0"); }
		      else if(e.getSource() == n11) { setText("A"); }
		      else if(e.getSource() == n12) { setText("B"); }
		      else if(e.getSource() == n13) { setText("C"); }
		      else if(e.getSource() == n14) { setText("D"); }
		      else if(e.getSource() == n15) { setText("E"); }
		      else if(e.getSource() == n16) { setText("F"); }
		      else if(e.getSource() == n17) { setText("."); }
		      else if(e.getSource() == n18) { // del
		      	delText();
		      }
		      else if(e.getSource() == n19) { // next password
		      	mem = "user";
		      	c.show(mainpanel,mem);
		      }
		      else if(e.getSource() == n20) { // back user
		      	mem = "password";
		      	c.show(mainpanel,mem);
		      }
		      
		   } catch(Exception ex) { ex.printStackTrace(); }
	    }

    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  }
} // end of class