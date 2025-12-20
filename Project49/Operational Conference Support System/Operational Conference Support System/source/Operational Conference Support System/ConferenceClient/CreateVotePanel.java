import javax.swing.*;
import java.awt.*;
import java.net.*;
import java.io.*;
import java.awt.event.*;
import java.awt.event.ItemListener;
import java.awt.event.ItemEvent;
import java.util.*;

public class CreateVotePanel extends JPanel implements ItemListener {
	 private String voteNameW;
	 private JPanel p1 = new JPanel();
	 private JPanel p2 = new JPanel();
	 private JTextField textField1 = new JTextField(20);
	 private JTextField txtNumChoice = new JTextField(5);		// For weighted vote: insert number of issue(choice)
	 private JTextField point = new JTextField(5);				// For weighted vote: insert a point
	 private JTextField[] textChoice;							// Use for method createChoice
	 private Vector vtext = new Vector();
	 private GridBagConstraints gc = new GridBagConstraints();
	 private DataInputStream din;
  	 private static DataOutputStream dout;
  	 private Socket sock;
  	 
  	 private JLabel labelWord, labelChooseIssue, labelNext1, labelNext2, labelNext3,
  	 			labelNext4, labelNext5, labelBack1,	labelBack2, labelBack3, labelBack4, 
  	 			labelBack5, labelBlank, labelBlankSm,labelHelp, labelHelp1, labelHelp2,
  	 			labelHelp3, labelHelp4; 	 			 	 			
	 private ImageIcon iconWord, iconChooseIssue, iconNext, iconBack, iconBlank, 
	 			iconBlankSm, iconHelp, iconHelp1, iconHelp2, iconHelp3, iconHelp4;
  	 private JDialog dialogHelp;
  	 private JRadioButton[] typeVoteRadio;
  	 private ButtonGroup groupType;
  	 private JComboBox comboItem, comboType;
  	 private myMessageBox warningBox = new myMessageBox();
  	 private JTabbedPane tabPaneHelp;  	 
  	 private static int meetingNo;
  	 private static int itemNoSend, typeVoteNo;
  	 private static int itemLength, tnameNo, typeNo, issNo, voteNo;
  	 private int numChoice, valPoint;
  	 private static  int numChoiceSV, valPointSV;
  	 private String typeVote, typeVoteSend, itemBusiness;
	 private String[] allChoiceSend;	// For weighted vote: createChoice method
	   	 
  	 private static String meetingName, itemName, type, topic, comboItemName;
  	 
  	 private static String[] itemBusinessArr, typeVoteArr, allVoteName;
  	 private static int[] itemNo;
  	 private static  String[] allChoice ;
  	 private String[] clsopenArr = {"ลับ", "เปิดเผย" };
	 
	 public CreateVotePanel(Socket sock) {
	 	try {
	 		this.sock = sock;
	 		Init();
	 	} catch (Exception e) { e.printStackTrace(); }
	 }
	 
	 private void Init() throws Exception {
	 	din = new DataInputStream(sock.getInputStream());
      	dout = new DataOutputStream(sock.getOutputStream());
		
		iconWord = new ImageIcon(PermitPanel.class.getResource("word.png"));	// First page of create vote
      	iconChooseIssue = new ImageIcon(PermitPanel.class.getResource("createVote.png"));	// Button Create Vote
      	iconHelp = new ImageIcon(PermitPanel.class.getResource("help.png"));	// Button Help
		iconNext = new ImageIcon(PermitPanel.class.getResource("next1.png")); // Button Next
		iconBlank = new ImageIcon(PermitPanel.class.getResource("blankButton.png"));// BlankButton for replace as Button Create Vote 
		iconBlankSm = new ImageIcon(PermitPanel.class.getResource("blankButtonSmall.png"));// Small BlankButton
		iconBack = new ImageIcon(PermitPanel.class.getResource("bback1.png"));// Button Back
      	iconHelp1 = new ImageIcon(PermitPanel.class.getResource("helpYN.png"));// Help panel
     	iconHelp2 = new ImageIcon(PermitPanel.class.getResource("helpWeighted.png"));
      	iconHelp3 = new ImageIcon(PermitPanel.class.getResource("helpOrder.png"));
      	iconHelp4 = new ImageIcon(PermitPanel.class.getResource("helpType.png"));
      	
      	labelWord = new JLabel(iconWord);
      	labelChooseIssue = new JLabel(iconChooseIssue);
      	labelHelp = new JLabel(iconHelp);
		labelNext1 = new JLabel(iconNext);	// for method chooseItem
		labelBack1 = new JLabel(iconBack); // for method chooseItem
		labelNext2 = new JLabel(iconNext); // for method chooseTypeVote
		labelBack2 = new JLabel(iconBack); // for method chooseTypeVote
		labelNext3 = new JLabel(iconNext); // for method typeTopic
		labelBack3 = new JLabel(iconBack); // for method typeTopic
		labelNext4 = new JLabel(iconNext); // for method assignNumChoiceAndPoint
		labelBack4 = new JLabel(iconBack); // for method assignNumChoiceAndPoint
		labelNext5 = new JLabel(iconNext); // for method createChoice
		labelBack5 = new JLabel(iconBack); // for method createChoice
		labelBlank = new JLabel(iconBlank); // for replace as Button Create Vote in chooseTypeVote method
 		labelBlankSm = new JLabel(iconBlankSm); // for replace as Button Create Vote
     	labelHelp1 = new JLabel(iconHelp1);
     	labelHelp2 = new JLabel(iconHelp2);
     	labelHelp3 = new JLabel(iconHelp3);
     	labelHelp4 = new JLabel(iconHelp4);
      	
      	setBackground(Color.WHITE);
	 	setLayout(new BorderLayout());
	 	p1.setLayout(new GridBagLayout());
	 	p2.setLayout(new GridBagLayout());
	 	p1.setBackground(Color.WHITE);
	 	p2.setBackground(Color.WHITE);
	 	
	 	gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.ipadx = 5; gc.ipady = 5; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		// Add Button Create Vote and Help in Panel p1
		gc.gridx = 2; gc.gridy = 0; // position of grid [like array two dimention]
		p1.add(labelChooseIssue,gc);
	 	gc.gridx = 3; gc.gridy = 0; // position of grid [like array two dimention]
		p1.add(labelHelp,gc);
		
		add(p1,BorderLayout.NORTH);
		
		// Add Message for help secretary to create vote
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p2.add(labelWord,gc);	
		add(p2,BorderLayout.CENTER);
	 	
	 	MouseListeners MouseListener = new MouseListeners();
	 	labelChooseIssue.addMouseListener(MouseListener);
	 	labelHelp.addMouseListener(MouseListener);
	 	labelNext1.addMouseListener(MouseListener);
	 	labelBack1.addMouseListener(MouseListener);
	 	labelNext2.addMouseListener(MouseListener);
	 	labelBack2.addMouseListener(MouseListener);
		labelNext3.addMouseListener(MouseListener);
	 	labelBack3.addMouseListener(MouseListener);
	 	labelNext4.addMouseListener(MouseListener);
	 	labelBack4.addMouseListener(MouseListener);
	 	labelNext5.addMouseListener(MouseListener);
	 	labelBack5.addMouseListener(MouseListener);	
	 }
	 	 
	 // This method for getting MeetingNo from Class ClientThread: msg 104
	 public static void setValue(String[] itemArr, String[] typeArr, String[] vname, int[] itemNum)
	 {
	 	itemBusinessArr = itemArr;
	 	typeVoteArr = typeArr;
	 	allVoteName = vname;
	 	itemNo = itemNum;
	 }	 
	 public static String[] getValue()
	 {
	 	return itemBusinessArr;
	 }
	 
	 public void chooseItem()
	 {
	 	clearScreen();
	 	clearScreenP2();
	 	
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p1.add(labelBlank, gc);
		
	 	gc.gridx = 1; gc.gridy = 0; // position of grid [like array two dimention]
		p1.add(labelHelp,gc);		

		gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
		
	 	JLabel labelText1 = new JLabel("ขั้นตอนที่ 1: เลือกวาระการประชุม", SwingConstants.CENTER);
		labelText1.setFont(new Font("",0,25));
		labelText1.setForeground(Color.BLUE);
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p2.add(labelText1, gc);
		
		JLabel lb1 = new JLabel("1");
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		p2.add(lb1, gc);
		
		comboItem = new JComboBox(itemBusinessArr);
		comboItem.setFont(new Font("",0,25));
		comboItem.setMaximumRowCount(5);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		p2.add(comboItem, gc);
		itemNoSend = 0;	// default of item_business
		
		// 3 new blank lines
		JLabel lb2 = new JLabel("1");
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,40));
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		p2.add(lb2, gc);		
		JLabel lb3 = new JLabel("1");
		lb3.setForeground(Color.WHITE);
		lb3.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(lb3, gc);
		JLabel lb4 = new JLabel("1");
		lb4.setForeground(Color.WHITE);
		lb4.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		p2.add(lb4, gc);
		JLabel lb5 = new JLabel("1");
		lb5.setForeground(Color.WHITE);
		lb5.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(lb5, gc);
		///////Button/////////////
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		
		gc.gridx = 0; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 1; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 2; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		
		gc.gridx = 3; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(labelBack1,gc);
		
		gc.gridx = 4; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(labelNext1,gc);
		
		add(p1,BorderLayout.NORTH);
		add(p2,BorderLayout.CENTER);
		invalidate();
    	repaint();
    	validate();
	 }
	 
	 // Choose a type of vote private void chooseTypeVote()
	 private void chooseTypeVote()
	 {	
	 	clearScreenP2();
	 	
	 	gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
	 	
	 	JLabel labelText1 = new JLabel("ขั้นตอนที่ 2: เลือกชนิดของการลงมติ", SwingConstants.CENTER);
		labelText1.setFont(new Font("",0,25));
		labelText1.setForeground(Color.BLUE);
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p2.add(labelText1, gc);
		
		JLabel lb1 = new JLabel("1");
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,10));
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		p2.add(lb1, gc);
		
		JLabel labelText2 = new JLabel("2.1: เลือกการลงมติแบบลับ หรือ เปิดเผย", SwingConstants.LEFT);
		labelText2.setFont(new Font("",0,20));
		labelText2.setForeground(Color.MAGENTA);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		p2.add(labelText2, gc);
		
		/////////////////////////////////////////////////////////////
		// Create RadioButton for 2.1: Choose Closed or Open for this vote
		typeVoteRadio = new JRadioButton[2];
		groupType = new ButtonGroup();
		
		int clsopenLength = clsopenArr.length;
		for(int j = 0; j < clsopenLength; j++)
		{
			typeVoteRadio[j] = new JRadioButton(clsopenArr[j]);
			typeVoteRadio[j].setFont(new Font("",0,20));
			groupType.add(typeVoteRadio[j]);
			gc.gridx = 0; gc.gridy = j + 3; // position of grid [like array two dimention]
			p2.add(typeVoteRadio[j], gc);
 			
 			if(j == 0)
 				typeVoteRadio[j].setSelected(true);
 			typeVoteRadio[j].addItemListener(this);
		}
		
		typeNo = 0;
		/////////////////////////////////////////////////////////////
		
		JLabel labelText3 = new JLabel("--------------------------------------------", SwingConstants.CENTER);
		labelText3.setFont(new Font("",0,20));
		labelText3.setForeground(Color.ORANGE);
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		p2.add(labelText3, gc);
		
		JLabel labelText4 = new JLabel("2.2: เลือกชนิดของการลงมติ", SwingConstants.LEFT);
		labelText4.setFont(new Font("",0,20));
		labelText4.setForeground(Color.MAGENTA);
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labelText4, gc);
		
		/////////////////////////////////////////////////////////////
		// Create RadioButton for 2.2: Choose a type of this vote
		itemLength = typeVoteArr.length;
		comboType = new JComboBox(typeVoteArr);
		comboType.setFont(new Font("",0,20));
		comboType.setMaximumRowCount(5);
		gc.gridx = 0; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(comboType, gc);
		tnameNo = 0;
		
		// new blank lines
		JLabel lb2 = new JLabel("1");
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,40));
		gc.gridx = 0; gc.gridy = 8; // position of grid [like array two dimention]
		p2.add(lb2, gc);
 		/////////////////////////////////////////////////////////////
 		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		
		gc.gridx = 0; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 1; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 2; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		
		gc.gridx = 3; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelBack2,gc);
 		
 		gc.gridx = 4; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelNext2,gc);
		
 		add(p2,BorderLayout.CENTER);
		invalidate();
    	repaint();
    	validate();
	 }
	 
	 // for type a topic of vote
	 private void typeTopic() 
	 {
	 	clearScreenP2();
	 	gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
		
	 	JLabel labelText1 = new JLabel("ขั้นตอนที่ 3: พิมพ์หัวข้อของการลงมติ", SwingConstants.CENTER);
		labelText1.setFont(new Font("",0,25));
		labelText1.setForeground(Color.BLUE);
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p2.add(labelText1, gc);
		
		JLabel lb4 = new JLabel("1");
		lb4.setForeground(Color.WHITE);
		lb4.setFont(new Font("",0,10));
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		p2.add(lb4, gc);
		
		textField1.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		p2.add(textField1,gc);
		
		///////////////// new blank lines ////////////////////
		JLabel lb1 = new JLabel("1");
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,50));
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		p2.add(lb1, gc);
		JLabel lb2 = new JLabel("1");
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,50));
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(lb2, gc);
		JLabel lb3 = new JLabel("1");
		lb3.setForeground(Color.WHITE);
		lb3.setFont(new Font("",0,50));
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		p2.add(lb3, gc);
		//////////////////////////////////////////////////////
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 1; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 2; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		
		gc.gridx = 3; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labelBack3,gc);
		
		gc.gridx = 4; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labelNext3,gc);
		
		add(p2,BorderLayout.CENTER);
		invalidate();
    	repaint();
    	validate();
	 }
	 // check for repeated topic when user click Next's Button for Step3
	 private void checkRepeatedTopic() throws Exception
	 {
	 	// Check for repeated topic of vote		
		String voteName = textField1.getText();
		
		// Case: Don't type any topic
		if(voteName.equals(""))
		{
			warningBox.setText("กรุณาพิมพ์หัวข้อของการลงมติก่อนกดปุ่ม ต่อไป",18);
			warningBox.showBox();
		}
		// Case: Type a topic			
		else
		{
				boolean chkRepeated = false;
				for(int i = 0; i < allVoteName.length; i++)
				{
					if(voteName.equals(allVoteName[i]))
					{
						if((itemNoSend + 1) == itemNo[i])
						{
			    			chkRepeated = true;
		    				break;
		    			}
					}
				}
				if(chkRepeated == true)
				{	
					warningBox.setText("หัวข้อนี้ซ้ำ โปรดเปลี่ยนชื่อหัวข้อใหม่",20);
			    	warningBox.showBox();
				}
				else
				{
					if(tnameNo == 0)
						summaryPage();	// To Summary Page for YesNo Vote
					else if(tnameNo == 1)
						assignNumChoiceAndPoint();	// For Weighted vote
					else if(tnameNo == 2)
						assignNumChoiceOnly();		// For Order vote
				}		
			}
	}
	 private void checkNumChoiceAndPoint()
	 {
		// Case: Don't type any topic
		if(((txtNumChoice.getText()).equals("")) || ((point.getText()).equals("")))
		{
			warningBox.setText("โปรดพิมพ์จำนวนตัวเลือกและคะแนน ก่อนกดปุ่ม ต่อไป",17);
			warningBox.showBox();
		}
		else
		{
			boolean cbool1 = check_int(txtNumChoice.getText());
			boolean cbool2 = check_int(point.getText());
			// Don't have some character
			if((cbool1 == true) && (cbool2 == true))
			{
				numChoice = Integer.parseInt(txtNumChoice.getText());
		 		valPoint = Integer.parseInt(point.getText());
		 		// Don't equal to zero
		 		if((numChoice == 0) && (valPoint == 0))
		 		{
		 			warningBox.setText("จำนวนของตัวเลือกและคะแนนรวม ต้องมีค่าไม่เท่ากับ 0", 15);
					warningBox.showBox();
		 		}
		 		else if((numChoice == 0) && (valPoint != 0))
		 		{
		 			warningBox.setText("จำนวนของตัวเลือก ต้องมีค่าไม่เท่ากับ 0", 20);
					warningBox.showBox();
		 		}
		 		else if((numChoice != 0) && (valPoint == 0))
		 		{
		 			warningBox.setText("จำนวนของคะแนนรวม ต้องมีค่าไม่เท่ากับ 0", 20);
					warningBox.showBox();
		 		}
		 		else if((numChoice == 1) && (valPoint != 0))
		 		{
		 			warningBox.setText("จำนวนตัวเลือกต้องมากกว่า 1", 20);
					warningBox.showBox();
		 		}
		 		else if((numChoice == 1) && (valPoint == 0))
		 		{
		 			warningBox.setText("จำนวนตัวเลือกต้องมากกว่า 1 และคะแนนรวม ต้องมีค่าไม่เท่ากับ 0", 10);
					warningBox.showBox();
		 		}
		 		else
		 		{
		 			createChoice();
		 		}	 		
			}
			else
			{
				warningBox.setText("โปรดพิมพ์เฉพาะตัวเลขเท่านั้น", 20);
				warningBox.showBox();
			}		 	
		}
	 }
	 // check For method createChoice
	 private void checkChoice()
	 {
	 	String tc;
	 	int count = 0;
	 	allChoiceSend = new String[numChoice];
	 	
	 	for(int i = 0; i < numChoice; i++)
	 	{
	 		tc = textChoice[i].getText();
	 		
	 		if(tc.equals(""))
	 		{
	 			warningBox.setText("โปรดพิมพ์รายละเอียดของตัวเลือก", 20);
				warningBox.showBox();
				count = 0;
				
	 			break;
	 		}
	 		else
	 		{
	 			count++;
	 			allChoiceSend[i] = tc;	 			
	 		}	 		
	 	}
	 	
	 	if(count == numChoice)
	 	{
	 		try
	 		{
	 			summaryPage();
	 		}
	 		catch(Exception e)
	 		{
	 			System.out.println(e);
	 		}
	 	}
	 }
	 
	 // Summary Page: after click next's button in Step3
	 // Call this method in checkedRepeatedTopic method
	 private void summaryPage()  throws IOException
	 {
	 	topic = textField1.getText();
	 	
	 	// Clear TextField
	 	textField1.setText("");
	 	point.setText("");
	 	txtNumChoice.setText("");
	 	
	 	////////////////Send Messages///////////////////////////	
    	dout.writeInt(27);
	 	dout.writeUTF(topic);
	 	dout.writeInt(itemNoSend);
	 	dout.writeInt(typeNo);
	 	dout.writeUTF(comboItemName);
	 	dout.writeInt(tnameNo);		// type of vote: 0 = yes/no, 1 = weighted, 2 = order
	 	
	 	// weighted vote send more than other
	 	if(tnameNo == 1)	// Weighted vote
	 	{
	 		dout.writeInt(numChoice);
	 		dout.writeInt(valPoint);
	 		
	 		for(int i = 0; i < numChoice; i++)
	 			dout.writeUTF(allChoiceSend[i]);
	 	}
	 	else if(tnameNo == 2)
	 	{
	 		dout.writeInt(numChoice);
	 		
	 		for(int i = 0; i < numChoice; i++)
	 			dout.writeUTF(allChoiceSend[i]);
	 	}
	 	////////////Set Screen for Next Vote/////////////////////
	 	clearScreen();
	 	clearScreenP2();
	 	
	 	invalidate();
	 	gc.gridx = 2; gc.gridy = 0; // position of grid [like array two dimention]
		p1.add(labelChooseIssue,gc);
	 	gc.gridx = 3; gc.gridy = 0; // position of grid [like array two dimention]
		p1.add(labelHelp,gc);
		
		add(p1,BorderLayout.NORTH);
		
		// Add Message for help secretary to create vote
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p2.add(labelWord,gc);	
		add(p2,BorderLayout.CENTER);
		invalidate();		
	 }
	 
	 private void help()
	 {	
 		dialogHelp = new JDialog(new Frame(), "ช่วยเหลือ", true);
 		dialogHelp.setSize(700, 500);
		dialogHelp.setLocation(150, 200);
		tabPaneHelp = new JTabbedPane();
		
		JPanel panel4 = new JPanel();
		panel4.add(labelHelp4);
		tabPaneHelp.addTab("ชนิดของการลงมติ", null, panel4, "Type of Vote");
		
		JPanel panel1 = new JPanel();
		panel1.add(labelHelp1);
		tabPaneHelp.addTab("การลงมติแบบใช่หรือไม่ใช่", null, panel1, "Yes/No vote");
		
		JPanel panel2 = new JPanel();
		panel2.add(labelHelp2);
		tabPaneHelp.addTab("การลงมติแบบเรียงลำดับความสำคัญตามการให้คะแนน", null, panel2, "Weighted vote");
		
		JPanel panel3 = new JPanel();
		panel3.add(labelHelp3);
		tabPaneHelp.addTab("การลงมติแบบเรียงลำดับความสำคัญ", null, panel3, "Order vote");
		
		dialogHelp.add(tabPaneHelp);		 			 			 	
	 	dialogHelp.setVisible(true);
	 	dialogHelp.setDefaultCloseOperation(JDialog.DO_NOTHING_ON_CLOSE);		
	 }
	 // For Yes/No vote
	 // Get value from Class SummaryYesNoPanel when click on "Vote Now!" Button
	 public void getValueFromSVChairman(String mname, String iname, String t, 
	 										String tp, int itNo, String comboItemName1) throws Exception
	 {
	 	meetingName = mname;
	 	itemName = iname;
	 	type = t;
	 	topic = tp;
	 	itemNoSend = itNo;
	 	comboItemName = comboItemName1;

	 	setTypeOfVote();
	 }
	 // For Weighted vote
	 // Get value from Class SummaryWeightedPanel when click on "Vote Now!" Button
	 public void getValueFromSVChairman(String mname, String iname, String t, 
	 						String tp, int itNo, String comboItemName1, int nChoice,
	 						int vPoint, String[] aChoice) throws Exception
	 {
	 	meetingName = mname;
	 	itemName = iname;
	 	type = t;
	 	topic = tp;
	 	itemNoSend = itNo;
	 	comboItemName = comboItemName1;
	 	
	 	numChoiceSV = nChoice;
	 	valPointSV = vPoint;
	 	allChoice = aChoice;
	 	
	 	setTypeOfVote();
	 }
	 // For Order vote
	 // Get value from Class SummaryOrderPanel when click on "Vote Now!" Button
	 public void getValueFromSVChairman(String mname, String iname, String t, 
	 						String tp, int itNo, String comboItemName1, int nChoice,
	 						String[] aChoice) throws Exception
	 {
	 	meetingName = mname;
	 	itemName = iname;
	 	type = t;
	 	topic = tp;
	 	itemNoSend = itNo;
	 	comboItemName = comboItemName1;
	 	
	 	numChoiceSV = nChoice;
	 	allChoice = aChoice;

	 	setTypeOfVote();
	 }
	 
	 public void setTypeOfVote() throws Exception
	 { 
	 	int index_space = type.indexOf(' ');
	 
	 	String true_type1 = type.substring(0, index_space);
	 	String true_type2 = type.substring(index_space + 1, type.length());
	 	
	 	// convert to number
	 	if(true_type1.equals("ลับ"))
	 	{
	 		if(true_type2.equals("ใช่/ไม่ใช่"))
	 			typeVoteNo = 0;
	 		else if(true_type2.equals("เรียงลำดับความสำคัญตามการให้คะแนน"))
	 			typeVoteNo = 2;
	 		else if(true_type2.equals("เรียงลำดับความสำคัญ"))
	 			typeVoteNo = 4;
	 	}
	 	else if(true_type1.equals("เปิดเผย"))
	 	{
	 		if(true_type2.equals("ใช่/ไม่ใช่"))
	 			typeVoteNo = 1;
	 		else if(true_type2.equals("เรียงลำดับความสำคัญตามการให้คะแนน"))
	 			typeVoteNo = 3;
	 		else if(true_type2.equals("เรียงลำดับความสำคัญ"))
	 			typeVoteNo = 5;
	 	}

	 	if((typeVoteNo == 0) || (typeVoteNo == 1))		// For Yes/No vote
	 		yesNo();
	 	else if((typeVoteNo == 2) || (typeVoteNo == 3))	// For weighted vote
	 		weighted();
	 	else if((typeVoteNo == 4) || (typeVoteNo == 5))	// For order vote
	 		order();
	 }
	 
	 // This method call from setTypeOfVote method
	 public void yesNo() throws Exception
	 {
		 	dout.writeInt(16);
		 	dout.writeInt(voteNo);
		 	dout.writeInt(itemNoSend);	// item of business that choosed from combobox
		 	dout.writeUTF(comboItemName);
	 		dout.writeInt(2);
	 		dout.writeInt(typeVoteNo);
	 		dout.writeUTF(topic);
	 		
		 	dout.writeUTF("ใช่");
		 	dout.writeUTF("ไม่ใช่");
	 		
	 		dout.writeInt(20);
	 }
	 // After method setTypeOfVote
	 private void assignNumChoiceAndPoint() 
	 {
	 	clearScreenP2();
	 	
	 	gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
	 	
	 	JLabel labelText1 = new JLabel("ขั้นตอนที่ 4: การกำหนดค่าของตัวเลือกและคะแนน", SwingConstants.CENTER);
		labelText1.setFont(new Font("",0,25));
		labelText1.setForeground(Color.BLUE);
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p2.add(labelText1, gc);
		
		JLabel lb1 = new JLabel("1");
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,10));
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		p2.add(lb1, gc);
		
		JLabel labelText2 = new JLabel("4.1: กำหนดจำนวนตัวเลือก", SwingConstants.LEFT);
		labelText2.setFont(new Font("",0,20));
		labelText2.setForeground(Color.MAGENTA);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		p2.add(labelText2, gc);
		
		JLabel lb2 = new JLabel("1");
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,10));
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		p2.add(lb2, gc);
		
		/////////////////////////////////////////////////////////////
		txtNumChoice.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(txtNumChoice,gc);
		vtext.addElement(txtNumChoice);
		/////////////////////////////////////////////////////////////
		
		JLabel labelText3 = new JLabel("--------------------------------------------", SwingConstants.CENTER);
		labelText3.setFont(new Font("",0,20));
		labelText3.setForeground(Color.ORANGE);
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		p2.add(labelText3, gc);
		
		JLabel labelText4 = new JLabel("4.2: กำหนดคะแนนรวมทั้งหมด", SwingConstants.LEFT);
		labelText4.setFont(new Font("",0,20));
		labelText4.setForeground(Color.MAGENTA);
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		p2.add(labelText4, gc);
		
		/////////////////////////////////////////////////////////////
		// JTextField
		point.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 7; // position of grid [like array two dimention]
		p2.add(point,gc);
		
		// new blank lines
		JLabel lb3 = new JLabel("1");
		lb3.setForeground(Color.WHITE);
		lb3.setFont(new Font("",0,40));
		gc.gridx = 0; gc.gridy = 8; // position of grid [like array two dimention]
		p2.add(lb3, gc);
 		/////////////////////////////////////////////////////////////
 		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		
		gc.gridx = 0; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 1; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 2; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		
		gc.gridx = 3; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelBack4,gc);
 		
 		gc.gridx = 4; gc.gridy = 9; // position of grid [like array two dimention]
		p2.add(labelNext4,gc);
		
 		add(p2,BorderLayout.CENTER);
		invalidate();
    	repaint();
    	validate();
	 }
	 
	 private void createChoice()
	 {
	 	clearScreenP2();
	 	
	 	gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
	 	
	 	JLabel labelText1 = new JLabel("ขั้นตอนที่ 5: กำหนดรายละเอียดของตัวเลือก", SwingConstants.CENTER);
		labelText1.setFont(new Font("",0,25));
		labelText1.setForeground(Color.BLUE);
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p2.add(labelText1, gc);
		
		JLabel lb1 = new JLabel("1");
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,10));
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		p2.add(lb1, gc);
		
		/////////////////// Generate TextBox for choice /////////////////////
		gc.gridwidth = 3; gc.gridheight = 1; // merge cell from grid
	 	int i;
	 	int loop = numChoice;
	 	
	 	JLabel labelText;
	 	textChoice = new JTextField[loop];
	 	
	 	for(i=0;i<loop;i++) {
	 		labelText = new JLabel("ตัวเลือกที่ " + (i + 1) +": ", SwingConstants.LEFT);
	 		labelText.setFont(new Font("",0,20));
	 		labelText.setForeground(Color.MAGENTA);
	 		gc.gridx = 0; gc.gridy = i + 2; // position of grid [like array two dimention]
			p2.add(labelText, gc);
	 		
		 	textChoice[i] = new JTextField(15);
			textChoice[i].setFont(new Font("",0,20));
			gc.gridx = 3; gc.gridy = i + 2; // position of grid [like array two dimention]
			p2.add(textChoice[i],gc);
 		}

		///////////////// new blank lines ////////////////////
		JLabel lb2 = new JLabel("1");
		lb2.setForeground(Color.WHITE);
		lb2.setFont(new Font("",0,50));
		gc.gridx = 0; gc.gridy = loop + 2; // position of grid [like array two dimention]
		p2.add(lb2, gc);
		JLabel lb3 = new JLabel("1");
		lb3.setForeground(Color.WHITE);
		lb3.setFont(new Font("",0,50));
		gc.gridx = 0; gc.gridy = loop + 2; // position of grid [like array two dimention]
		p2.add(lb3, gc);
		
 		/////////////////////////////////////////////////////////////
 		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		
		gc.gridx = 0; gc.gridy = loop + 3; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 1; gc.gridy = loop + 3; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 2; gc.gridy = loop + 3; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		
		gc.gridx = 3; gc.gridy = loop + 3; // position of grid [like array two dimention]
		p2.add(labelBack5,gc);
 		
 		gc.gridx = 4; gc.gridy = loop + 3; // position of grid [like array two dimention]
		p2.add(labelNext5,gc);
		
 		add(p2,BorderLayout.CENTER);
		invalidate();
    	repaint();
    	validate();
	 }
	 
	 // This method call from setTypeOfVote method
	 public void weighted() throws Exception
	 {
		 	dout.writeInt(16);
		 	dout.writeInt(voteNo);
		 	dout.writeInt(itemNoSend);	// item of business that choosed from combobox
		 	dout.writeUTF(comboItemName);
	 		dout.writeInt(numChoiceSV);
	 		dout.writeInt(typeVoteNo);
	 		dout.writeUTF(topic);
	 		dout.writeInt(valPointSV);	 		

	 		for(int i = 0; i < numChoiceSV; i++)
				dout.writeUTF(allChoice[i]);
	 		
	 		dout.writeInt(20);
	 }
	 
	 private void assignNumChoiceOnly()
	 {
	 	clearScreenP2();
	 	
	 	gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
	 	
	 	JLabel labelText1 = new JLabel("ขั้นตอนที่ 4: กำหนดจำนวนตัวเลือก", SwingConstants.CENTER);
		labelText1.setFont(new Font("",0,25));
		labelText1.setForeground(Color.BLUE);
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		p2.add(labelText1, gc);
		
		JLabel lb1 = new JLabel("1");
		lb1.setForeground(Color.WHITE);
		lb1.setFont(new Font("",0,30));
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		p2.add(lb1, gc);
		
		/////////////////////////////////////////////////////////////
		txtNumChoice.setFont(new Font("",0,20));
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		p2.add(txtNumChoice,gc);
		vtext.addElement(txtNumChoice);
		/////////////////////////////////////////////////////////////	
		// new blank lines
		JLabel lb3 = new JLabel("1");
		lb3.setForeground(Color.WHITE);
		lb3.setFont(new Font("",0,100));
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		p2.add(lb3, gc);
 		/////////////////////////////////////////////////////////////
 		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		gc.gridx = 1; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(labelBlankSm,gc);
		
		gc.gridx = 2; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(labelBack4,gc);
 		
 		gc.gridx = 3; gc.gridy = 4; // position of grid [like array two dimention]
		p2.add(labelNext4,gc);
		
 		add(p2,BorderLayout.CENTER);
		invalidate();
    	repaint();
    	validate();
	 }
	 
	 private void checkNumChoiceOnly()
	 {
		// Case: Don't type any topic
		if((txtNumChoice.getText()).equals(""))
		{
			warningBox.setText("โปรดพิมพ์จำนวนตัวเลือก",20);
			warningBox.showBox();
		}
		else
		{
			boolean cbool1 = check_int(txtNumChoice.getText());

			// Don't have some character
			if(cbool1 == true)
			{
				numChoice = Integer.parseInt(txtNumChoice.getText());
		 		// Don't equal to zero
		 		if(numChoice == 0)
		 		{
		 			warningBox.setText("จำนวนตัวเลือกต้องไม่เท่ากับ 0", 20);
					warningBox.showBox();
		 		}
		 		else if(numChoice == 1)
		 		{
		 			warningBox.setText("จำนวนตัวเลือกต้องมากกว่า 1", 20);
					warningBox.showBox();
		 		}
		 		else
		 			createChoice();
			}
			else
			{
				warningBox.setText("โปรดพิมพ์เฉพาะตัวเลขเท่านั้น", 20);
				warningBox.showBox();
			}		 	
		}
	 }
	 
	 public void order() throws Exception
	 {
		 	dout.writeInt(16);
		 	dout.writeInt(voteNo);
		 	dout.writeInt(itemNoSend);	// item of business that choosed from combobox
		 	dout.writeUTF(comboItemName);
	 		dout.writeInt(numChoiceSV);
	 		dout.writeInt(typeVoteNo);
	 		dout.writeUTF(topic);	

	 		for(int i = 0; i < numChoiceSV; i++)
				dout.writeUTF(allChoice[i]);
	 		
	 		dout.writeInt(20);
	 }
	 
	 private void clearScreen() {
	 	vtext.removeAllElements();
	 	p1.removeAll();
	 	remove(p1);
	 	invalidate();
    	repaint(); 
    	validate();
	 }
	 
	 private void clearScreenP2() {
	 	vtext.removeAllElements();
	 	p2.removeAll();
	 	remove(p2);
	 	invalidate();
    	repaint(); 
    	validate();
	 }
	 // Use in method checkNumChoiceAndPoint
	 private boolean check_int(String in_str) {
		int check = 0;
		char [] temp_int = {'0','1','2','3','4','5','6','7','8','9'};
		for (int i = 0; i < in_str.length(); i++) {
			for (int j =0; j < temp_int.length; j++) {				
			if (in_str.charAt(i) == temp_int[j]) 
				++check;
			}
		}
		if (check == in_str.length())
			return true;		// only number
		else 
			return false;		// some character			
	}
	 
	 // Handling Event for chooseVoteType method: RadioButton
	 public void itemStateChanged(ItemEvent e)
	 {
	 	if(e.getStateChange() == ItemEvent.SELECTED)
		{
			// RadioButton Group: groupType
			for(int i = 0; i < 2; i++)
			{
				if(groupType.getSelection() == typeVoteRadio[i].getModel())
					typeNo = i;
			}
		}
	 }
	
	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) { 
    		try {
    		  // Create Vote Button
    		  if(e.getSource() == labelChooseIssue) {
					chooseItem();
    		  }
    		  else if(e.getSource() == labelHelp) {
    		  		help();
    		  }
			  // at chooseItem method
		      else if(e.getSource() == labelNext1) {
					chooseTypeVote();
					itemNoSend = comboItem.getSelectedIndex();
					comboItemName = itemBusinessArr[itemNoSend];
			  }
			  else if(e.getSource() == labelBack1) {
			  		clearScreen();
					clearScreenP2();
					gc.gridx = 2; gc.gridy = 0; // position of grid [like array two dimention]
					p1.add(labelChooseIssue,gc);
				 	gc.gridx = 3; gc.gridy = 0; // position of grid [like array two dimention]
					p1.add(labelHelp,gc);
					
					gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
					p2.add(labelWord,gc);	
					
					add(p2,BorderLayout.CENTER);
					add(p1,BorderLayout.NORTH);
					invalidate();
			    	repaint();
			    	validate();
			  }
			  // at chooseTypeVote method
			  else if(e.getSource() == labelNext2) {
			  	tnameNo = comboType.getSelectedIndex();
				typeTopic();
			  }
			  else if(e.getSource() == labelBack2) {
			  		chooseItem();
			  }
			  // at typeTopic method
			  else if(e.getSource() == labelNext3) {
			  		checkRepeatedTopic();
			  }
			  else if(e.getSource() == labelBack3) {
			  		chooseTypeVote();
			  }
			  // at assignNumChoiceAndPoint method
			  else if(e.getSource() == labelNext4) {
			  		if(tnameNo == 1)
			  			checkNumChoiceAndPoint();	// For Weighted vote
			  		else if(tnameNo == 2)
			  			checkNumChoiceOnly();		// For order vote
			  }
			  else if(e.getSource() == labelBack4) {
			  		typeTopic();
			  }
			  // at createChoice method
			  else if(e.getSource() == labelNext5) {
			  		checkChoice();
			  }
			  else if(e.getSource() == labelBack5) {
			  		if(tnameNo == 1)
			  			assignNumChoiceAndPoint();
			  		else if(tnameNo == 2)
			  			assignNumChoiceOnly();
			  }
		   	 }catch(Exception ex) {}
	    }

    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  }
  
} // end of class