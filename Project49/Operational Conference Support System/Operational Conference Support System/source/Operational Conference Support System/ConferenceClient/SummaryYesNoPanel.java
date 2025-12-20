import java.io.*;
import java.net.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

public class SummaryYesNoPanel extends JPanel{
  	private static DataOutputStream dout;
  	private Socket sock;
  	
  	private GridBagConstraints gc = new GridBagConstraints();
	private JPanel p2 = new JPanel();
	private ImageIcon iconBlank, iconVoteNow, iconCancel, iconReCreateVote;
	private JLabel labelBlank, labelVoteNow, labelCancel, labelReCreateVote;
	
	private static String meetingNameSt;	// Meeting (M_NAME)
	private static String itemNameSt;		// Item of business (I_NAME)
	private static String typeSt;			// Type of vote has a format is "closed type" or "open type"
	private static String topicSt;			// Topic of Vote (V_NAME)
	private static int itemNoSend;			// No. Item of business
	private static String comboItemName;	// Item of business (IT_NAME)
	private static String vButton;			// Value of button in class warningBox
	
	private static JLabel labelMeeting2 = new JLabel();
	private static JLabel labelItem2 = new JLabel();
	private static JLabel labeltype2 = new JLabel();
	private static JLabel labeltopic2 = new JLabel();
	
	private warningBox warningBox1 = new warningBox();
	private WarningBoxReCvote warningBox2 = new WarningBoxReCvote();
  	
  	public SummaryYesNoPanel(Socket sock, int pos) {
		try {
			this.sock = sock;
			dout = new DataOutputStream(sock.getOutputStream());
			
			iconBlank = new ImageIcon(SummaryYesNoPanel.class.getResource("blankButtonSmall.png"));
			iconVoteNow = new ImageIcon(SummaryYesNoPanel.class.getResource("voteNow.png"));
			iconCancel = new ImageIcon(SummaryYesNoPanel.class.getResource("cancelVote.png"));
			iconReCreateVote = new ImageIcon(SummaryYesNoPanel.class.getResource("reCreateVote.png"));
			
			labelBlank = new JLabel(iconBlank);
			labelVoteNow = new JLabel(iconVoteNow);
			labelCancel = new JLabel(iconCancel);
			labelReCreateVote = new JLabel(iconReCreateVote);
			
			MouseListeners MouseListener = new MouseListeners();
	 		labelVoteNow.addMouseListener(MouseListener);
	 		labelCancel.addMouseListener(MouseListener);
	 		labelReCreateVote.addMouseListener(MouseListener);
			
			// Display summary page for Chairman' screen
			if(pos == 0)
				displaySummaryForChairman();
			// Display summary page for Secretary' screen
			else if(pos == 1)
				displaySummaryForSecretary();
		} catch(Exception e) { e.printStackTrace(); }
	}
	public void displaySummaryForChairman()
	{	
		setLayout(new BorderLayout());
		setBackground(Color.WHITE);
		p2.setLayout(new GridBagLayout());
		p2.setBackground(Color.WHITE);
		
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
		gc.ipadx = 5; gc.ipady = 5; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
		
	 	JLabel labelText1 = new JLabel("รายละเอียดการสร้างหัวข้อการลงมติ", SwingConstants.CENTER);
		labelText1.setFont(new Font("",0,30));
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p2.add(labelText1, gc);
		
		JLabel lb1 = new JLabel("1");
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		p2.add(lb1, gc);
		
		JLabel labelText2 = new JLabel("กดปุ่ม 'เริ่มต้นการลงมติ' เพื่ออนุมัติการสร้างหัวข้อการลงมตินี้", SwingConstants.CENTER);
		labelText2.setFont(new Font("",0,30));
		labelText2.setForeground(Color.BLUE);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		p2.add(labelText2, gc);
		
		JLabel lb2 = new JLabel("1");
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		p2.add(lb2, gc);
		/////////////////////////////////////////////////
		gc.gridwidth = 3; gc.gridheight = 1; // merge cell from grid
		
		JLabel labelMeeting = new JLabel("การประชุมเรื่อง: ", SwingConstants.LEFT);
		labelMeeting.setFont(new Font("",0,20));
		labelMeeting.setOpaque(true);
		labelMeeting.setBackground(Color.ORANGE);
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(labelMeeting, gc);

		gc.gridx = 3; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(labelMeeting2, gc);
		
		JLabel labelItem = new JLabel("วาระการประชุมเรื่อง: ", SwingConstants.LEFT);
		labelItem.setFont(new Font("",0,20));
		labelItem.setOpaque(true);
		labelItem.setBackground(Color.YELLOW);
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		p2.add(labelItem, gc);

		gc.gridx = 3; gc.gridy = 5; // position of grid [like array two dimention]
		p2.add(labelItem2, gc);
		
		JLabel labeltype = new JLabel("ชนิดของการลงมติ: ", SwingConstants.LEFT);
		labeltype.setFont(new Font("",0,20));
		labeltype.setOpaque(true);
		labeltype.setBackground(Color.ORANGE);
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labeltype, gc);

		gc.gridx = 3; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labeltype2, gc);
		
		JLabel labeltopic = new JLabel("หัวข้อการลงมติ: ", SwingConstants.LEFT);
		labeltopic.setFont(new Font("",0,20));
		labeltopic.setOpaque(true);
		labeltopic.setBackground(Color.YELLOW);
		gc.gridx = 0; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(labeltopic, gc);
	
		gc.gridx = 3; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(labeltopic2, gc);
		///////Button///////////////////////////////////////////////////////////////////////////
		JLabel lb3 = new JLabel("1", SwingConstants.LEFT);
		lb3.setFont(new Font("",0,25));
		lb3.setForeground(Color.WHITE);
		gc.gridx = 0; gc.gridy = 8; // position of grid [like array two dimention]
		p2.add(lb3, gc);
		/////////////////////////////////////////////////////////////////////////////////////////////
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		
		gc.gridx = 0; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelBlank,gc);
	/*	JLabel labelBlank1 = new JLabel(iconBlank);
		gc.gridx = 1; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelBlank1,gc);*/
		
		gc.gridx = 1; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelVoteNow,gc);
		
		gc.gridx = 3; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelCancel,gc);
		
		gc.gridx = 4; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelReCreateVote,gc);
	 	
	 	add(p2,BorderLayout.CENTER);
	}
	
	public void displaySummaryForSecretary()
	{	
		setLayout(new BorderLayout());
		setBackground(Color.WHITE);
		p2.setLayout(new GridBagLayout());
		p2.setBackground(Color.WHITE);
		
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
		gc.ipadx = 5; gc.ipady = 5; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
		
	 	JLabel labelText1 = new JLabel("รายละเอียดการสร้างหัวข้อการลงมติ", SwingConstants.CENTER);
		labelText1.setFont(new Font("",0,30));
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p2.add(labelText1, gc);
		
		JLabel lb1 = new JLabel("1");
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		p2.add(lb1, gc);
		
		JLabel labelText2 = new JLabel("กรุณารอประธาน 'อนุมัติ' การสร้างหัวข้อของการลงมตินี้", SwingConstants.CENTER);
		labelText2.setFont(new Font("",0,30));
		labelText2.setForeground(Color.BLUE);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		p2.add(labelText2, gc);
		
		JLabel lb2 = new JLabel("1");
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		p2.add(lb2, gc);
		/////////////////////////////////////////////////
		gc.gridwidth = 3; gc.gridheight = 1; // merge cell from grid
		
		JLabel labelMeeting = new JLabel("การประชุมเรื่อง: ", SwingConstants.LEFT);
		labelMeeting.setFont(new Font("",0,20));
		labelMeeting.setOpaque(true);
		labelMeeting.setBackground(Color.ORANGE);
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(labelMeeting, gc);		

		gc.gridx = 3; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(labelMeeting2, gc);
		
		JLabel labelItem = new JLabel("วาระการประชุมเรื่อง: ", SwingConstants.LEFT);
		labelItem.setFont(new Font("",0,20));
		labelItem.setOpaque(true);
		labelItem.setBackground(Color.YELLOW);
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		p2.add(labelItem, gc);

		gc.gridx = 3; gc.gridy = 5; // position of grid [like array two dimention]
		p2.add(labelItem2, gc);
		
		JLabel labeltype = new JLabel("ชนิดของการลงมติ: ", SwingConstants.LEFT);
		labeltype.setFont(new Font("",0,20));
		labeltype.setOpaque(true);
		labeltype.setBackground(Color.ORANGE);
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labeltype, gc);

		gc.gridx = 3; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labeltype2, gc);
		
		JLabel labeltopic = new JLabel("หัวข้อการลงมติ: ", SwingConstants.LEFT);
		labeltopic.setFont(new Font("",0,20));
		labeltopic.setOpaque(true);
		labeltopic.setBackground(Color.YELLOW);
		gc.gridx = 0; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(labeltopic, gc);
		
		gc.gridx = 3; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(labeltopic2, gc);
	 	
	 	add(p2,BorderLayout.CENTER);
	}
	
	public static void setTextDisplay(String mname, String iname, String tname,
										String toname, int itemNoSend1, String comboItemName1) {
		meetingNameSt = mname;
		itemNameSt = iname;
		typeSt = tname;
		topicSt = toname;
		itemNoSend = itemNoSend1;
		comboItemName = comboItemName1;
	
		labelMeeting2.setText(mname);
		labelMeeting2.setFont(new Font("",0,25));
		
		labelItem2.setText(iname);
		labelItem2.setFont(new Font("",0,25));
		
		labeltype2.setText(tname);
		labeltype2.setFont(new Font("",0,25));
		
		labeltopic2.setText(toname);
		labeltopic2.setFont(new Font("",0,25));
	}
	
	private void warningForCancel()
	{
		warningBox1.setText("คุณแน่ใจว่าต้องการ 'ยกเลิก' การลงมตินี้หรือไม่", 18);
		warningBox1.showBox();		
	}
	
	private void warningForCancelForReCvote()
	{
		warningBox2.setText("คุณแน่ใจว่าต้องการ 'แก้ไข' การลงมตินี้หรือไม่", 18);
		warningBox2.showBox();		
	}
	// For Click 'OK' button at cancel vote
	public static void getValueButton(String v)
	{
		try
		{
			if(v.equals("ok"))
				dout.writeInt(28);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}		
	}
	// For Click 'OK' button at recreate vote
	public static void getValueButtonReCvote(String v)
	{
		try
		{
			if(v.equals("ok"))
				dout.writeInt(29);
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}

	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) { 
    		try {
    		  // Create Vote Complete-> Let's voting
    		  if(e.getSource() == labelVoteNow) { 
				 CreateVotePanel cvote = new CreateVotePanel(sock);
				 cvote.getValueFromSVChairman(meetingNameSt, itemNameSt, typeSt, 
				 		topicSt, itemNoSend, comboItemName);	 		
    		  }
    		  else if(e.getSource() == labelCancel) {
				warningForCancel();
    		  }
    		  else if(e.getSource() == labelReCreateVote) {
				warningForCancelForReCvote();
    		  }
		   	 }catch(Exception ex) {}
	    }

    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  }
} // End of class