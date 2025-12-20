import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.util.*;
import java.text.*;

public class ConferenceServer extends JFrame {

  	private ServerAgent serveragent;
  	private JPanel configpanel,serverrunpanel,mainpanel;
  	private JToolBar toolbar;
  	private JButton bstart,bstop;
  	private ImageIcon imgstart,imgstop;
  	private static JList listclient = new JList();
  	private static JTextArea tdisplay = new JTextArea();
  	private static JTextArea tserverstat = new JTextArea();
  	private JScrollPane slist,sdisplay,sstat;
  	private static JTextField tclient = new JTextField("   จำนวนผู้เข้าร่วมประชุม = 0");
  	private static DefaultListModel dl = new DefaultListModel();
  	private ImageIcon ic,logo;
 	private JLabel luser = new JLabel("ชื่อผู้ใช้ ");
 	private JLabel lpassword = new JLabel("รหัสผ่าน ");
 	private JTextField txtuser = new JTextField(13);
 	private JTextField txtpassword = new JTextField(13);
 	private GridBagConstraints gc = new GridBagConstraints();
 	private JLabel llogo;
 	private JLabel lpname = new JLabel("Operational Conference Support System");
 	private JLabel lpnameThai = new JLabel("ระบบสนับสนุนการประชุมเชิงปฏิบัติการ");
 	private JLabel lkmitl = new JLabel("สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง");
 	private JLabel lce = new JLabel("ภาควิชาวิศวกรรมคอมพิวเตอร์ คณะวิศวกรรมศาสตร์");
 	private JLabel lname1 = new JLabel("นายธีรชัย นิมิตรัตน์");
 	private JLabel lname2 = new JLabel("นางสาวบงกชรัตน์ รัตนสิมานนท์");
 	private JLabel ladvice = new JLabel("ดร. วัชระ ฉัตรวิริยะ");
 
  	public ConferenceServer() {
    	try {
      	Init();
    	} catch(Exception e) { e.printStackTrace(); }
  	}
  	public void Init() throws Exception {
    	setSize(700,640);
    	setTitle("เซิร์ฟเวอร์ ของระบบสนับสนุนการประชุมเชิงปฏิบัติการ");
    	setResizable(false);
    	configpanel = new JPanel(new GridBagLayout());
    	serverrunpanel = new JPanel(new GridBagLayout());
    	
    	mainpanel = new JPanel(new CardLayout());
    	mainpanel.add(configpanel,"config");
    	mainpanel.add(serverrunpanel,"run");
    	
    	lpnameThai.setFont(new Font("",0,24));
    	lpname.setFont(new Font("",0,18));
 		lname1.setFont(new Font("",0,20));
 		lname2.setFont(new Font("",0,20));
 		ladvice.setFont(new Font("",0,20));
 		lkmitl.setFont(new Font("",0,18));
 		lce.setFont(new Font("",0,18));
    	
    	ic = new ImageIcon(ConferenceServer.class.getResource("client.gif"));
    	logo = new ImageIcon(ConferenceServer.class.getResource("kmitllogo.png"));
    	llogo = new JLabel(logo);
    	listclient.setCellRenderer(new CellRender(ic));

		//gc.fill = GridBagConstraints.BOTH;
		//gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.ipadx = 5; gc.ipady = 5; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		/////////////////////////// Add component to configpanel ///////////////////
		// ตราสถาบัน
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		configpanel.add(llogo,gc);
		// ชื่อโปรเจคภาษาไทย
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		configpanel.add(lpnameThai,gc);
		// ชื่อโปรเจคภาษาอังกฤษ
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		configpanel.add(lpname,gc);
		// ช่องว่างระหว่างบรรทัด (Empty Line)
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		JLabel emptyLine = new JLabel("");
		emptyLine.setFont(new Font("",0,20));
		configpanel.add(emptyLine,gc);
		// คำว่า "โดย"
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		configpanel.add(new JLabel("โดย"),gc);
		// ชื่อผู้ร่วมงาน 1
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		configpanel.add(lname1,gc);
		// ชื่อผู้ร่วมงาน 2
	 	gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		configpanel.add(lname2,gc);
		// ช่องว่างระหว่างบรรทัด (Empty Line)
		gc.gridx = 0; gc.gridy = 7; // position of grid [like array two dimention]
		JLabel emptyLine2 = new JLabel("");
		emptyLine2.setFont(new Font("",0,20));
		configpanel.add(emptyLine2,gc);
		// ชื่ออาจารย์ที่ปรึกษา
		gc.gridx = 0; gc.gridy = 8; // position of grid [like array two dimention]
		configpanel.add(new JLabel("อาจารย์ที่ปรึกษา"),gc);
		// คำว่า "อาจารย์ที่ปรึกษา"
		gc.gridx = 0; gc.gridy = 9; // position of grid [like array two dimention]
		configpanel.add(ladvice,gc);
		// ช่องว่างระหว่างบรรทัด (Empty Line)
		gc.gridx = 0; gc.gridy = 10; // position of grid [like array two dimention]
		JLabel emptyLine3 = new JLabel("");
		emptyLine3.setFont(new Font("",0,25));
		configpanel.add(emptyLine3,gc);
		// ชื่อภาควิชา
		gc.gridx = 0; gc.gridy = 11; // position of grid [like array two dimention]
		configpanel.add(lce,gc);
		// ชื่อสถาบัน
		gc.gridx = 0; gc.gridy = 12; // position of grid [like array two dimention]
		configpanel.add(lkmitl,gc);
		// คำว่า "ปีการศึกษา 2549"
		gc.gridx = 0; gc.gridy = 13; // position of grid [like array two dimention]
		JLabel semester = new JLabel("ปีการศึกษา 2549");
		semester.setFont(new Font("",0,18));
		configpanel.add(semester, gc);
	 	////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    	// set serverrunpanel by GridBagLayout
    	GridBagConstraints gc = new GridBagConstraints();
    	slist = new JScrollPane(listclient);
    	sdisplay = new JScrollPane(tdisplay);
    	sstat = new JScrollPane(tserverstat);
    	listclient.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

    	gc.fill = GridBagConstraints.BOTH; gc.anchor = GridBagConstraints.NORTHWEST;
    	gc.insets.top = 5; gc.insets.bottom = 5;
    	gc.insets.left = 5; gc.insets.right = 5;
    	gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
    	gc.gridwidth = 1; gc.gridheight = 3; // merge cell from grid
    	gc.weightx = 5; gc.weighty = 1; // resize follow size of screen x ,y
    	serverrunpanel.add(sdisplay,gc);
    	gc.gridx = 1; gc.gridy = 0; // position of grid [like array two dimention]
    	gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
    	gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
    	serverrunpanel.add(tclient,gc);
    	gc.gridx = 1; gc.gridy = 1; // position of grid [like array two dimention]
    	gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
    	gc.weightx = 0; gc.weighty = 1; // resize follow size of screen x ,y
    	serverrunpanel.add(slist,gc);
    	gc.gridx = 1; gc.gridy = 2; // position of grid [like array two dimention]
    	gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
    	gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
    	serverrunpanel.add(sstat,gc);

    	imgstart = new ImageIcon(ConferenceServer.class.getResource("start.gif"));
    	imgstop = new ImageIcon(ConferenceServer.class.getResource("save.gif"));
    	toolbar = new JToolBar();
    	bstart = new JButton(imgstart);
    	bstop = new JButton(imgstop);
    	toolbar.add(bstart);
    	toolbar.add(bstop);

    	add(toolbar,BorderLayout.NORTH);
    	add(mainpanel,BorderLayout.CENTER);

    	//jScrollPane1.getViewport().add(jTextArea1, null);

    	//Center the window
    	Dimension screenSize = Toolkit.getDefaultToolkit().getScreenSize();
    	Dimension frameSize = getSize();
    	if (frameSize.height > screenSize.height) { frameSize.height = screenSize.height; }
    	if (frameSize.width > screenSize.width) { frameSize.width = screenSize.width; }
    	setLocation((screenSize.width - frameSize.width) / 2, (screenSize.height - frameSize.height) / 2);
    	setVisible(true);
    	ActionListeners actionlistener = new ActionListeners();
    	bstart.addActionListener(actionlistener);
    	bstop.addActionListener(actionlistener);

    	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
  	}
  	// Set text into JTextArea (append)
  	public static void setLogMessage(String message) {
    	String tmp = tdisplay.getText();
    	tdisplay.setText("");
    	tdisplay.append(message + "\n" + tmp); // for first message
  	}
  	// Add element to List
  	public static void setNameClient(String who) {
    	dl.addElement(who);
    	listclient.setModel(dl);
  	}
  	// Remove element to List
  	public static void removeClient(String who) {
    	dl.removeElement(who);
    	listclient.setModel(dl);
  	}
  	// Set text into Text number of client
  	public static void setNumberOfClient(int number) {
    	tclient.setText("   จำนวนผู้เข้าร่วมประชุม = " + number);
  	}
  	// Start server when user press start button
  	private void StartServer() {
    	serveragent = new ServerAgent();
    	// show Server name and server ip address at southeast corner of screen
    	tserverstat.setText(serveragent.getInformation());
    	serveragent.start();
    	CardLayout c = (CardLayout)(mainpanel.getLayout());
    	c.show(mainpanel,"run");
  	}
  	private void saveFile() {
  		try {
  			Date now = new Date();
  			String hour = "" + now.getHours(),minute = "" + now.getMinutes();
  			if(hour.length() == 1) hour = "0" + hour;
  			if(minute.length() == 1) minute = "0" + minute;
			DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
			String s = df.format(now);
			s += "(" + hour + "." + minute + ").txt";
			
			FileWriter fw = new FileWriter("log/" + s);
			BufferedWriter bw = new BufferedWriter(fw);
			bw.write(tdisplay.getText());
			bw.close();
  		} catch(Exception e) { e.printStackTrace(); }
  	}
  	// Main program
  	public static void main(String[] args) {
    	new ConferenceServer();
  	} // End of main
  	// Listener button event
  	class ActionListeners implements ActionListener {
    	public void actionPerformed(ActionEvent e) {
      	if(e.getSource() == bstart) { StartServer(); }
      	else if(e.getSource() == bstop) { 
      		saveFile();
      		JOptionPane.showMessageDialog(null, "เสร็จสิ้นการบันทึกข้อมูล", "การบันทึกข้อมูล", 
      								JOptionPane.INFORMATION_MESSAGE);
      	}
    	}
  	}
} // End of class

class CellRender extends JLabel implements ListCellRenderer {
  Icon ic;
  public CellRender(Icon ic) {
    this.ic = ic;
    setOpaque(true);
  }
  public Component getListCellRendererComponent(JList l,Object o,int i,boolean s,boolean f) {
    setText(o.toString());
    setIcon(ic);
    if(s) {
      setBackground(l.getSelectionBackground());
      setForeground(l.getSelectionForeground());
    } else {
      setBackground(l.getBackground());
      setForeground(l.getForeground());
    }
    return this;
  }
} // End of class