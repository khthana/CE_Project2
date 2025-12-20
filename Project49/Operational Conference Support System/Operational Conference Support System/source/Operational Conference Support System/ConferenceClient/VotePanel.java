import javax.swing.*;
import java.awt.*;
import java.io.*;
import java.net.*;
import java.awt.event.*;
import javax.swing.event.ChangeListener;
import javax.swing.event.ChangeEvent;
import java.awt.event.ItemListener;
import java.awt.event.ItemEvent;
import java.util.*;
import java.util.StringTokenizer;

public class VotePanel extends JPanel implements ChangeListener, ItemListener{	
	private GridBagConstraints gc;
	private Vector vvote = new Vector();
	private Vector vTopic = new Vector();
	private DataInputStream din;
  	private DataOutputStream dout;
  	private Socket sock;
  	private JLabel labelOk, lblok1, lblok2, labelBlank, labelBlank1, lbpoint2,
  					labelUp, labelDown;
  	private ImageIcon imgok, iconOk, iconBlank, iconUp, iconDown;
  	private int voteType, vn, crnum, issNo, itemNo, sliderPoint, remain;
  	private int radioForSliderInt = 0;
  	private int radioForOrderInt = 0;
  	private String voteName, position, comboItemName, radioForSliderString;
  	private JSlider slider;
  	private JRadioButton[] radioForSlider, radioForOrder;
  	private ButtonGroup groupSlider, groupOrder;
  	private JTextField[] choiceTextF;

  	private myMessageBox warningBox = new myMessageBox();
  	private int point, issno, voteNo, numChoice, sumChoice1, sumChoice2, textInt;
  	private String[] arrTopic;
  
	public VotePanel(Socket sock) {
		try {
			this.sock = sock;
			Init();
		} catch(Exception e) { e.printStackTrace(); }
	}
	
	private void Init() throws Exception {
		din = new DataInputStream(sock.getInputStream());
      	dout = new DataOutputStream(sock.getOutputStream());
	
		setLayout(new GridBagLayout());
		setBackground(Color.WHITE);
		gc = new GridBagConstraints();
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.ipadx = 10; gc.ipady = 10; // size of component*/
		
		imgok = new ImageIcon(VotePanel.class.getResource("ovote.png"));
		iconBlank = new ImageIcon(VotePanel.class.getResource("blankLabel.png"));
		iconUp = new ImageIcon(VotePanel.class.getResource("Up.png"));
		iconDown = new ImageIcon(VotePanel.class.getResource("down.png"));
	}
	
	// set issue for Yes/No Vote for all users except projector
	public void setTopic(int type, String vName,
				int vno, int issno, int itemNo1, String comboItemName1, int ino) {
		voteNo = vno;
		issNo = issno;
		voteType = type;
		voteName = vName;
		itemNo = ino;
		comboItemName = comboItemName1;
		
		gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
		
		JLabel labelTopic = new JLabel("หัวข้อ: " + voteName, SwingConstants.CENTER);
		labelTopic.setFont(new Font("", Font.BOLD,30));
		labelTopic.setForeground(Color.BLUE);		
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(labelTopic,gc);
		
		// add space between topic and image button
		JLabel labelSpace1 = new JLabel("กรุณากดที่ปุ่มสี่เหลี่ยม หน้าตัวเลือกที่ต้องการ", SwingConstants.CENTER);
		labelSpace1.setFont(new Font("", Font.BOLD,20));
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		add(labelSpace1,gc);
		
		JLabel labelSpace2 = new JLabel("1", SwingConstants.CENTER);
		labelSpace2.setFont(new Font("", Font.BOLD,20));
		labelSpace2.setForeground(Color.WHITE);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		add(labelSpace2,gc);
		///////////////////////////////////////////////////////////////////////////////////////////////////
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		
		// Label of 'O' in front of issue: First choice
		lblok1 = new JLabel(imgok);
		gc.anchor = GridBagConstraints.EAST;
		gc.gridx = 2; gc.gridy = 3; // position of grid [like array two dimention]
		add(lblok1,gc);
		
		// Label of text -> issue
		gc.fill = GridBagConstraints.VERTICAL;
		gc.anchor = GridBagConstraints.WEST;
			
		JLabel ltopic = new JLabel("อนุมัติ    ");
		ltopic.setOpaque(true);
		ltopic.setFont(new Font("",Font.PLAIN, 20));
		ltopic.setBackground(Color.CYAN);  // set color of label ???
		gc.gridx = 4; gc.gridy = 3; // position of grid [like array two dimention]
		add(ltopic,gc);
		
		// Label of 'O' in front of issue: Second choice
		lblok2 = new JLabel(imgok);
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.EAST;
		gc.gridx = 2; gc.gridy = 4; // position of grid [like array two dimention]
		add(lblok2,gc);
		
		// Label of text -> issue
		gc.fill = GridBagConstraints.VERTICAL;
		gc.anchor = GridBagConstraints.WEST;
	
		JLabel ltopic2 = new JLabel("ไม่อนุมัติ");
		ltopic2.setOpaque(true);
		ltopic2.setFont(new Font("",Font.PLAIN, 20));
		ltopic2.setBackground(Color.GREEN);  // set color of label ???
		gc.gridx = 4; gc.gridy = 4; // position of grid [like array two dimention]
		add(ltopic2,gc);
		
		MouseListeners mouselistener = new MouseListeners();
		lblok1.addMouseListener(mouselistener);
		lblok2.addMouseListener(mouselistener);
	}
	
	// set issue for Weighted Vote for all users except projector
	public void setTopicForWeightedVote(String[] topic, int type, String vName,
			int vno, int issno, int itemNo1, String comboItemName1, int ino, int aPoint, 
			int nChoice) {
		voteNo = vno;
		issNo = issno;
		voteType = type;
		voteName = vName;
		itemNo = ino;
		comboItemName = comboItemName1;		
		point = aPoint;
		numChoice = nChoice;
		arrTopic = topic;
		
		// Use in ItemStateChange and StateChanged
		radioForSliderInt = 0;
		
		gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
		
		JLabel labelTopic = new JLabel("หัวข้อ: " + voteName, SwingConstants.CENTER);
		labelTopic.setFont(new Font("", Font.BOLD,30));
		labelTopic.setForeground(Color.BLUE);		
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(labelTopic,gc);	

		JLabel labelSpace1 = new JLabel("เลื่อนแถบคะแนนซ้ายมือเพื่อให้คะแนนตัวเลือก", SwingConstants.CENTER);
		labelSpace1.setFont(new Font("", Font.BOLD,20));
		labelSpace1.setForeground(Color.MAGENTA);
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		add(labelSpace1,gc);
		
		gc.gridwidth = 2; gc.gridheight = 1; // merge cell from grid
		
		// Label of text -> Total point		
		JLabel lbpoint1 = new JLabel("คะแนนที่เหลือ: ");
		lbpoint1.setFont(new Font("",Font.PLAIN, 20));
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		add(lbpoint1,gc);
		
		lbpoint2 = new JLabel(String.valueOf(point));
		lbpoint2.setFont(new Font("",Font.PLAIN, 20));
		gc.gridx = 2; gc.gridy = 2; // position of grid [like array two dimention]
		add(lbpoint2,gc);
			
		/////////////////////// Slider /////////////////////////////////
		gc.gridwidth = 2; gc.gridheight = nChoice+1; // merge cell from grid

		slider = new JSlider(SwingConstants.VERTICAL, 0, point, 1);
		slider.setBorder(BorderFactory.createTitledBorder("คะแนน"));
		slider.setMajorTickSpacing(10);
		slider.setMinorTickSpacing(5);
		slider.setPaintTicks(true);
		slider.setPaintLabels(true);
		slider.addChangeListener(this);

		gc.fill = GridBagConstraints.VERTICAL;
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		add(slider, gc);
		
		/////////////////// RadioButton, TextField ////////////////////////////////////////
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid			
		
		radioForSlider = new JRadioButton[nChoice];
		groupSlider = new ButtonGroup();
		
		// Textbox that's user must fill in some points
		choiceTextF = new JTextField[nChoice];
		for(int i = 0; i < nChoice; i++)
		{
			radioForSlider[i] = new JRadioButton(topic[i]);
			groupSlider.add(radioForSlider[i]);
			gc.fill = GridBagConstraints.BOTH;
			gc.gridx = 2; gc.gridy = i+3; // position of grid [like array two dimention]
			add(radioForSlider[i],gc);
			
			if(i == 0)
 				radioForSlider[i].setSelected(true);
 			
 			radioForSlider[i].addItemListener(this);
		
			gc.fill = GridBagConstraints.VERTICAL;
			choiceTextF[i] = new JTextField("0", 3);
			choiceTextF[i].setFont(new Font("",0,20));
			choiceTextF[i].setEditable(false);
			gc.gridx = 3; gc.gridy = i+3; // position of grid [like array two dimention]
			add(choiceTextF[i],gc);
		}
		
		// add blank space for nChoice <= 4
		if(nChoice <= 4)
		{
			JLabel labelSpace = new JLabel("1", SwingConstants.RIGHT);
			labelSpace.setFont(new Font("", Font.BOLD,25));
			labelSpace.setForeground(Color.WHITE);
			gc.gridx = 3; gc.gridy = nChoice + 3; // position of grid [like array two dimention]
			add(labelSpace,gc);	
		}
		
		////////////// BUTTON ///////////////////////////////////////////
		// add space between topic and image button
		JLabel labelSpace2 = new JLabel("1", SwingConstants.RIGHT);
		labelSpace2.setFont(new Font("", Font.BOLD,25));
		labelSpace2.setForeground(Color.WHITE);
		gc.gridx = 0; gc.gridy = nChoice + 4; // position of grid [like array two dimention]
		add(labelSpace2,gc);
		
		labelBlank1 = new JLabel(iconBlank);
		gc.gridx = 0; gc.gridy = nChoice + 5; // position of grid [like array two dimention]
		add(labelBlank1,gc);
		JLabel labelBlank2 = new JLabel(iconBlank);
		labelBlank2 = new JLabel(iconBlank);
		gc.gridx = 1; gc.gridy = nChoice + 5; // position of grid [like array two dimention]
		add(labelBlank2,gc);
		
		// Label of 'OK' image.
		iconOk = new ImageIcon(VotePanel.class.getResource("ok1.png"));
		labelOk = new JLabel(iconOk); 
		gc.anchor = GridBagConstraints.EAST;
		gc.gridx = 2; gc.gridy = nChoice + 5; // position of grid [like array two dimention]
		add(labelOk,gc);
		
		///////////////////////////////////////////////////////////////////
		MouseListeners mouselistener = new MouseListeners();
		labelOk.addMouseListener(mouselistener);
	}
	
	// set issue for Order Vote for all users except projector
	public void setTopicForOrderVote(String[] topic, int type, String vName,
			int vno, int issno, int itemNo1, String comboItemName1, int ino, int nChoice) {
		voteNo = vno;
		issNo = issno;
		voteType = type;
		voteName = vName;
		itemNo = ino;
		comboItemName = comboItemName1;
		numChoice = nChoice;
		arrTopic = topic;
		
		// Use in ItemStateChange and StateChanged
		radioForOrderInt = 0;
		
		gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
		
		JLabel labelTopic = new JLabel("หัวข้อ: " + voteName, SwingConstants.CENTER);
		labelTopic.setFont(new Font("", Font.BOLD,25));
		labelTopic.setForeground(Color.BLUE);		
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(labelTopic,gc);	
		
		JLabel labelWord = new JLabel("กดปุ่มรูปลูกศรขึ้น-ลง เพื่อจัดเรียงตัวเลือก" , SwingConstants.CENTER);
		labelWord.setFont(new Font("", Font.BOLD,20));
		labelWord.setForeground(Color.MAGENTA);		
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		add(labelWord,gc);
		
	/*	gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		add(labelWord2,gc);*/
		
		// add space between topic and image button
		JLabel labelSpace1 = new JLabel("1", SwingConstants.CENTER);
		labelSpace1.setFont(new Font("", Font.BOLD,25));
		labelSpace1.setForeground(Color.WHITE);
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		add(labelSpace1,gc);
		
		labelUp = new JLabel(iconUp);
		labelDown = new JLabel(iconDown);
		////////// Show Choices /////////////////////////////////////////
		gc.gridwidth = 2; gc.gridheight = 1; // merge cell from grid			
		
		radioForOrder = new JRadioButton[numChoice];
		groupOrder = new ButtonGroup();
		
		JLabel[] labelChoices = new JLabel[numChoice];
		
		for(int i = 0; i < numChoice; i++)
		{
			String st = "อันดับที่ " + (i + 1) + ":";
			labelChoices[i] = new JLabel(st, SwingConstants.RIGHT);
			labelChoices[i].setFont(new Font("", Font.BOLD,20));
			gc.gridx = 0; gc.gridy = i + 4; // position of grid [like array two dimention]
			add(labelChoices[i],gc);
		
			radioForOrder[i] = new JRadioButton(arrTopic[i]);
			radioForOrder[i].setFont(new Font("", Font.PLAIN,25));
			groupOrder.add(radioForOrder[i]);
			gc.fill = GridBagConstraints.BOTH;
			gc.gridx = 2; gc.gridy = i+4; // position of grid [like array two dimention]
			add(radioForOrder[i],gc);
			if(i == 0)
 				radioForOrder[i].setSelected(true);
 			
 			radioForOrder[i].addItemListener(this);
		}
		/////////////// Button Up/Down ////////////////////////////////////////////
		int divideNumChoice = numChoice / 2;
		if(divideNumChoice % 2 == 1)
			divideNumChoice += 1;
			
		gc.gridwidth = 2; gc.gridheight = divideNumChoice; // merge cell from grid
		
		// Show Button Up
	 	gc.anchor = GridBagConstraints.NORTH;
		gc.gridx = 4; gc.gridy = 4; // position of grid [like array two dimention]
		add(labelUp,gc);
		// Show Button Down
		gc.anchor = GridBagConstraints.SOUTH;
		gc.gridx = 4; gc.gridy = 6; // position of grid [like array two dimention]
		add(labelDown,gc);
		
		////////////// BUTTON ///////////////////////////////////////////
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		// add space between topic and image button
		JLabel labelSpace2 = new JLabel("1", SwingConstants.RIGHT);
		labelSpace2.setFont(new Font("", Font.BOLD,25));
		labelSpace2.setForeground(Color.WHITE);
		gc.gridx = 0; gc.gridy = nChoice + 4; // position of grid [like array two dimention]
		add(labelSpace2,gc);
		
		labelBlank1 = new JLabel(iconBlank);
		gc.gridx = 0; gc.gridy = nChoice + 5; // position of grid [like array two dimention]
		add(labelBlank1,gc);
		JLabel labelBlank2 = new JLabel(iconBlank);
		labelBlank2 = new JLabel(iconBlank);
		gc.gridx = 1; gc.gridy = nChoice + 5; // position of grid [like array two dimention]
		add(labelBlank2,gc);
		
		// Label of 'OK' image.
		iconOk = new ImageIcon(VotePanel.class.getResource("ok1.png"));
		labelOk = new JLabel(iconOk); 
		gc.anchor = GridBagConstraints.EAST;
		gc.gridx = 2; gc.gridy = nChoice + 5; // position of grid [like array two dimention]
		add(labelOk,gc);
		
		///////////////////////////////////////////////////////////////////
		MouseListeners mouselistener = new MouseListeners();
		labelOk.addMouseListener(mouselistener);
		labelUp.addMouseListener(mouselistener);
		labelDown.addMouseListener(mouselistener);
	}
	
	// for yes/no vote
	public void setProjectorTopic(String[] topic, String vName) {
		// Label of result
		String v_name = vName;

		gc.fill = GridBagConstraints.BOTH;
		
		gc.gridwidth = 2; gc.gridheight = 1; // merge cell from grid
		
		JLabel labelTopic = new JLabel("หัวข้อการลงมติ", SwingConstants.CENTER);
		labelTopic.setFont(new Font("", Font.BOLD,40));
		labelTopic.setOpaque(true);	
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(labelTopic,gc);
		
		JLabel labelTopic1 = new JLabel(v_name, SwingConstants.CENTER);
		labelTopic1.setFont(new Font("", Font.BOLD,35));
		labelTopic1.setOpaque(true);
		labelTopic1.setBackground(Color.ORANGE);		
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		add(labelTopic1,gc);
		
		JLabel labelSpace2 = new JLabel("1", SwingConstants.CENTER);
		labelSpace2.setFont(new Font("", Font.BOLD,50));
		labelSpace2.setForeground(Color.WHITE);	
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		add(labelSpace2,gc);
		
		JLabel labelTopic2 = new JLabel("ชนิดของการลงมติ", SwingConstants.CENTER);
		labelTopic2.setFont(new Font("", Font.PLAIN,35));
		labelTopic2.setOpaque(true);	
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		add(labelTopic2,gc);
		
		// Label of text -> Total point
		JLabel lb = new JLabel("การลงมติแบบใช่หรือไม่ใช่",  SwingConstants.CENTER);
		lb.setFont(new Font("",Font.PLAIN, 30));
		lb.setOpaque(true);
		lb.setBackground(Color.ORANGE);
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		add(lb,gc);
		
		JLabel labelSpace = new JLabel("1", SwingConstants.CENTER);
		labelSpace.setFont(new Font("", Font.BOLD,50));
		labelSpace.setForeground(Color.WHITE);	
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		add(labelSpace,gc);
		
		JLabel labelmsg = new JLabel("กรุณารอผู้เข้าร่วมประชุมทำการลงมติจนครบทุกคน", SwingConstants.CENTER);
		labelmsg.setFont(new Font("", Font.BOLD,30));	
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		add(labelmsg,gc);
	}
	
	public void setProjectorTopicWeightedVote(String topic[], int aPoint, String vName) {
		point = aPoint;
		
		// Label of result
		String v_name = vName;

		gc.fill = GridBagConstraints.BOTH;
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		
		JLabel labelTopic = new JLabel("หัวข้อ", SwingConstants.CENTER);
		labelTopic.setFont(new Font("", Font.BOLD,40));
		labelTopic.setOpaque(true);	
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(labelTopic,gc);
		
		JLabel labelTopic1 = new JLabel(v_name, SwingConstants.CENTER);
		labelTopic1.setFont(new Font("", Font.BOLD,35));
		labelTopic1.setOpaque(true);
		labelTopic1.setBackground(Color.ORANGE);		
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		add(labelTopic1,gc);
		
		JLabel labelSpace2 = new JLabel("1", SwingConstants.CENTER);
		labelSpace2.setFont(new Font("", Font.BOLD,50));
		labelSpace2.setForeground(Color.WHITE);	
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		add(labelSpace2,gc);
		
		JLabel labelTopic2 = new JLabel("ชนิดของการลงมติ", SwingConstants.CENTER);
		labelTopic2.setFont(new Font("", Font.BOLD,35));
		labelTopic2.setOpaque(true);	
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		add(labelTopic2,gc);
		
		// Label of text -> Total point
		JLabel lb = new JLabel("การลงมติแบบเรียงลำดับความสำคัญตามการให้คะแนน",  SwingConstants.CENTER);
		lb.setFont(new Font("",Font.PLAIN, 30));
		lb.setOpaque(true);
		lb.setBackground(Color.ORANGE);
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		add(lb,gc);
		
		JLabel labelSpace = new JLabel("1", SwingConstants.CENTER);
		labelSpace.setFont(new Font("", Font.BOLD,50));
		labelSpace.setForeground(Color.WHITE);	
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		add(labelSpace,gc);
		
		JLabel labelmsg = new JLabel("กรุณารอผู้เข้าร่วมประชุมทำการลงมติจนครบทุกคน", SwingConstants.CENTER);
		labelmsg.setFont(new Font("", Font.BOLD,30));	
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		add(labelmsg,gc);
	}
	
	// Set and calculate result of Closed Yes/No vote
	public void setVoteResultForYesNoVote(boolean w, int yes_res, int no_res, String vName) {
		if(w == true)
		{
				// Display the result to projector's screen
				removeAll();		// clear previous display
    			
				gc.fill = GridBagConstraints.BOTH;
				gc.gridwidth = 2; gc.gridheight = 1; // merge cell from grid
				
				JLabel labelTopic = new JLabel("หัวข้อการลงมติ", SwingConstants.CENTER);
				labelTopic.setFont(new Font("", Font.BOLD,40));
				labelTopic.setOpaque(true);
			//	labelTopic.setBackground(Color.ORANGE);		
				gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
				add(labelTopic,gc);
				
				JLabel labelTopic1 = new JLabel(vName, SwingConstants.CENTER);
				labelTopic1.setFont(new Font("", Font.BOLD,35));
				labelTopic1.setOpaque(true);
				labelTopic1.setBackground(Color.ORANGE);		
				gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
				add(labelTopic1,gc);
				
				JLabel labelSpace = new JLabel("1", SwingConstants.CENTER);
				labelSpace.setFont(new Font("", Font.BOLD,50));
				labelSpace.setForeground(Color.WHITE);	
				gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
				add(labelSpace,gc);
				
				gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
			
				JLabel labelYes = new JLabel("อนุมัติ", SwingConstants.LEFT);
				labelYes.setFont(new Font("", Font.BOLD,40));	
				gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
				add(labelYes,gc);
				
				JLabel labelresult1 = new JLabel(yes_res + "", SwingConstants.CENTER);
				labelresult1.setFont(new Font("", Font.BOLD,40));	
				gc.gridx = 1; gc.gridy = 3; // position of grid [like array two dimention]
				add(labelresult1,gc);
			
				JLabel labelNo = new JLabel("ไม่อนุมัติ", SwingConstants.LEFT);
				labelNo.setFont(new Font("", Font.BOLD,40));	
				gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
				add(labelNo,gc);
				
				JLabel labelresult2 = new JLabel(no_res + "", SwingConstants.CENTER);
				labelresult2.setFont(new Font("", Font.BOLD,40));	
				gc.gridx = 1; gc.gridy = 4; // position of grid [like array two dimention]
				add(labelresult2,gc);
				
				invalidate();
    			repaint();
    			validate();
			}
	}
	
	public void setProjectorTopicOrderVote(String[] topic, String vName) {
		// Label of result
		String v_name = vName;

		gc.fill = GridBagConstraints.BOTH;
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		
		JLabel labelTopic = new JLabel("หัวข้อของการลงมติ", SwingConstants.CENTER);
		labelTopic.setFont(new Font("", Font.BOLD,40));
		labelTopic.setOpaque(true);	
		gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
		add(labelTopic,gc);
		
		JLabel labelTopic1 = new JLabel(v_name, SwingConstants.CENTER);
		labelTopic1.setFont(new Font("", Font.BOLD,35));
		labelTopic1.setOpaque(true);
		labelTopic1.setBackground(Color.ORANGE);		
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		add(labelTopic1,gc);
		
		JLabel labelSpace2 = new JLabel("1", SwingConstants.CENTER);
		labelSpace2.setFont(new Font("", Font.BOLD,50));
		labelSpace2.setForeground(Color.WHITE);	
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		add(labelSpace2,gc);
		
		JLabel labelTopic2 = new JLabel("ชนิดของการลงมติ", SwingConstants.CENTER);
		labelTopic2.setFont(new Font("", Font.BOLD,35));
		labelTopic2.setOpaque(true);	
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		add(labelTopic2,gc);
		
		// Label of text -> Total point
		JLabel lb = new JLabel("การลงมติแบบเรียงลำดับความสำคัญ",  SwingConstants.CENTER);
		lb.setFont(new Font("",Font.PLAIN, 30));
		lb.setOpaque(true);
		lb.setBackground(Color.ORANGE);
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		add(lb,gc);
		
		JLabel labelSpace = new JLabel("1", SwingConstants.CENTER);
		labelSpace.setFont(new Font("", Font.BOLD,50));
		labelSpace.setForeground(Color.WHITE);	
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		add(labelSpace,gc);
		
		JLabel labelmsg = new JLabel("กรุณารอผู้เข้าร่วมประชุมทำการลงมติจนครบทุกคน", SwingConstants.CENTER);
		labelmsg.setFont(new Font("", Font.BOLD,30));	
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		add(labelmsg,gc);
	}
	
	// Set and calculate result of Order vote
	public void setVoteResultForOrderVote(int numChoice,  String vName, String[] result, int issNo)
	{
				// Display the result to projector's screen
				removeAll();		// clear previous display
    			
				gc.fill = GridBagConstraints.BOTH;
				gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
				
				JLabel labelTopic = new JLabel("หัวข้อการลงมติ", SwingConstants.CENTER);
				labelTopic.setFont(new Font("", Font.BOLD,40));
				labelTopic.setOpaque(true);
			//	labelTopic.setBackground(Color.ORANGE);		
				gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
				add(labelTopic,gc);
				
				JLabel labelTopic1 = new JLabel(vName, SwingConstants.CENTER);
				labelTopic1.setFont(new Font("", Font.BOLD,35));
				labelTopic1.setOpaque(true);
				labelTopic1.setBackground(Color.ORANGE);		
				gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
				add(labelTopic1,gc);
				
				JLabel labelSpace = new JLabel("1", SwingConstants.CENTER);
				labelSpace.setFont(new Font("", Font.BOLD,50));
				labelSpace.setForeground(Color.WHITE);	
				gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
				add(labelSpace,gc);
					
				////////////////////////////////////////////////////////////////
				gc.gridwidth = 3; gc.gridheight = 1; // merge cell from grid
				
				JLabel labelNumberHeader = new JLabel("อันดับที่ ", SwingConstants.CENTER);
				labelNumberHeader.setFont(new Font("", Font.BOLD,30));
				labelNumberHeader.setOpaque(true);
				labelNumberHeader.setBackground(Color.LIGHT_GRAY);	
				gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
				add(labelNumberHeader,gc);
				
				JLabel labelChoiceHeader = new JLabel("ตัวเลือก", SwingConstants.CENTER);
				labelChoiceHeader.setFont(new Font("", Font.BOLD,30));
				labelChoiceHeader.setOpaque(true);
				labelChoiceHeader.setBackground(Color.LIGHT_GRAY);	
				gc.gridx = 3; gc.gridy = 3; // position of grid [like array two dimention]
				add(labelChoiceHeader,gc);
				
				JLabel[] labelNumber = new JLabel[numChoice];
				JLabel[] labelChoice = new JLabel[numChoice];
				
				for(int i = 0; i < numChoice; i++)
				{
					labelNumber[i] = new JLabel("" + (i + 1), SwingConstants.CENTER);
					labelNumber[i].setFont(new Font("", Font.BOLD,30));
					labelNumber[i].setOpaque(true);
			//		labelPoint[i].setBackground(Color.LIGHT_GRAY);	
					gc.gridx = 0; gc.gridy = i + 4; // position of grid [like array two dimention]
					add(labelNumber[i],gc);

					labelChoice[i] = new JLabel(result[i] + "", SwingConstants.CENTER);
					labelChoice[i].setFont(new Font("", Font.BOLD,30));
					labelChoice[i].setOpaque(true);
				//	labelChoice[i].setBackground(Color.YELLOW);	
					gc.gridx = 3; gc.gridy = i + 4; // position of grid [like array two dimention]
					add(labelChoice[i],gc);
				}
				////////////////////////////////////////////////////////////////
				invalidate();
    			repaint();
    			validate();
	}
	
	// Set and calculate result of Weighted vote
	public void setVoteResultForWeightedVote(int numChoice, String vName, String[] tmpIssNo, int[] totalRes) 
	{
			// Display the result to projector's screen
			removeAll();		// clear previous display
			
			gc.fill = GridBagConstraints.BOTH;
			gc.gridwidth = 6; gc.gridheight = 1; // merge cell from grid
			
			JLabel labelTopic = new JLabel("หัวข้อการลงมติ", SwingConstants.CENTER);
			labelTopic.setFont(new Font("", Font.BOLD,40));
			labelTopic.setOpaque(true);
		//	labelTopic.setBackground(Color.ORANGE);		
			gc.gridx = 0; gc.gridy = 0; // position of grid [like array two dimention]
			add(labelTopic,gc);
			
			JLabel labelTopic1 = new JLabel(vName, SwingConstants.CENTER);
			labelTopic1.setFont(new Font("", Font.BOLD,35));
			labelTopic1.setOpaque(true);
			labelTopic1.setBackground(Color.ORANGE);		
			gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
			add(labelTopic1,gc);
			
			JLabel labelSpace = new JLabel("1", SwingConstants.CENTER);
			labelSpace.setFont(new Font("", Font.BOLD,20));
			labelSpace.setForeground(Color.WHITE);	
			gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
			add(labelSpace,gc);
				
			////////////////////// SHOW RESULTS/////////////////////////////
			gc.gridwidth = 3; gc.gridheight = 1; // merge cell from grid
			
			JLabel labelChoiceHeader = new JLabel("ตัวเลือก", SwingConstants.CENTER);
			labelChoiceHeader.setFont(new Font("", Font.BOLD,40));
			labelChoiceHeader.setOpaque(true);
			labelChoiceHeader.setBackground(Color.LIGHT_GRAY);	
			gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
			add(labelChoiceHeader,gc);
			
			JLabel labelPointHeader = new JLabel("คะแนน", SwingConstants.CENTER);
			labelPointHeader.setFont(new Font("", Font.BOLD,40));
			labelPointHeader.setOpaque(true);
			labelPointHeader.setBackground(Color.LIGHT_GRAY);	
			gc.gridx = 3; gc.gridy = 3; // position of grid [like array two dimention]
			add(labelPointHeader,gc);
			
			JLabel[] labelChoice = new JLabel[numChoice];
			JLabel[] labelPoint = new JLabel[numChoice];
			
			for(int i = 0; i < numChoice; i++)
			{
				labelChoice[i] = new JLabel(tmpIssNo[i] + "", SwingConstants.CENTER);
				labelChoice[i].setFont(new Font("", Font.BOLD,25));
				labelChoice[i].setOpaque(true);
			//	labelChoice[i].setBackground(Color.YELLOW);	
				gc.gridx = 0; gc.gridy = i + 4; // position of grid [like array two dimention]
				add(labelChoice[i],gc);
			
				labelPoint[i] = new JLabel(totalRes[i] + "", SwingConstants.CENTER);
				labelPoint[i].setFont(new Font("", Font.BOLD,25));
				labelPoint[i].setOpaque(true);
		//		labelPoint[i].setBackground(Color.LIGHT_GRAY);	
				gc.gridx = 3; gc.gridy = i + 4; // position of grid [like array two dimention]
				add(labelPoint[i],gc);
			}
			////////////////////////////////////////////////////////////////
			invalidate();
			repaint();
			validate();
	}
	
	private void selectTopicClosedYN(int choose) {
		try {
			dout.writeInt(24);
			dout.writeInt(choose); // result vote
			dout.writeUTF(voteName);
			dout.writeInt(itemNo);
			dout.writeInt(issNo);
		}
		catch(Exception ex) { ex.printStackTrace(); }
	}
	
	private void selectTopicOpenYN(int choose) {
		try {
			dout.writeInt(17);
			dout.writeInt(choose); // result vote
			dout.writeUTF(voteName);
			dout.writeInt(itemNo);
			dout.writeInt(issNo);
		}
		catch(Exception ex) { ex.printStackTrace(); }
	}
	
	private void okButtonOfClosedOrderVote() throws Exception
	{
		// Select data from issue table
		String[] textRadio = new String[numChoice];
		for(int x = 0; x < numChoice; x++)
			textRadio[x] = radioForOrder[x].getText();			// user arrange choices
			
		// Send some messages
		try {
			dout.writeInt(22);
			dout.writeInt(numChoice);
			dout.writeUTF(voteName);
			dout.writeInt(itemNo);
			dout.writeInt(issNo);
			for(int i = 0; i < numChoice; i++)
				dout.writeUTF(textRadio[i]);
		}
		catch(Exception ex) { ex.printStackTrace(); }
	}
	
	private void okButtonOfOpenOrderVote() throws Exception
	{
		// Select data from issue table
		String[] textRadio = new String[numChoice];
		for(int x = 0; x < numChoice; x++)
			textRadio[x] = radioForOrder[x].getText();			// user arrange choices				
		
		// Send some messages
		try {
			dout.writeInt(26);
			dout.writeInt(numChoice);
			dout.writeUTF(voteName);
			dout.writeInt(itemNo);
			dout.writeInt(issNo);
			for(int i = 0; i < numChoice; i++)
				dout.writeUTF(textRadio[i]); // result vote			
		}
		catch(Exception ex) { ex.printStackTrace(); }		
	}
	
	private void okButtonOfClosedWeightedVote() {
		int sumChoiceFinal = 0;
		int[] tmpW = new int[numChoice];
		for(int i = 0; i < numChoice; i++)
		{
			tmpW[i] = Integer.parseInt(choiceTextF[i].getText());
			sumChoiceFinal += tmpW[i];
		}
								
		if(sumChoiceFinal != point)
		{
			warningBox.setText("คุณยังใช้คะแนนรวมไม่หมด", 20);
			warningBox.showBox();
		}
		else
		{
			// Send some messages
			try {
				dout.writeInt(23);
				dout.writeInt(numChoice);
				dout.writeUTF(voteName);
				dout.writeInt(itemNo);
				dout.writeInt(issNo);
				for(int i = 0; i < numChoice; i++)
					dout.writeInt(tmpW[i]); // result vote			
			}
			catch(Exception ex) { ex.printStackTrace(); }
		}
	}
	
	private void okButtonOfOpenWeightedVote() 
	{
		int sumChoiceFinal = 0;
		int[] tmpW = new int[numChoice];
		for(int i = 0; i < numChoice; i++)
		{
			tmpW[i] = Integer.parseInt(choiceTextF[i].getText());
			sumChoiceFinal += tmpW[i];
		}
								
		if(sumChoiceFinal != point)
		{
			warningBox.setText("คุณยังใช้คะแนนรวมไม่หมด", 20);
			warningBox.showBox();
		}
		else
		{
			// Send some messages
			try {
				dout.writeInt(25);
				dout.writeInt(numChoice);
				dout.writeUTF(voteName);
				dout.writeInt(itemNo);
				dout.writeInt(issNo);
				for(int i = 0; i < numChoice; i++)
					dout.writeInt(tmpW[i]); // result vote	
			}
			catch(Exception ex) { ex.printStackTrace(); }
		}
	}
	
	private void moveUp()
	{
		for(int x = 0; x < numChoice; x++)
		{
			// First row don't move up
			if(x != 0)
			{
				if(x == radioForOrderInt)
				{
					String st1 = radioForOrder[x].getText();
					String st2 = radioForOrder[x - 1].getText();
					radioForOrder[x].setText(st2);
					radioForOrder[x - 1].setText(st1);	
					radioForOrder[x - 1].setSelected(true);
					
					break;
				}
			}
		}
	}
	
	private void moveDown()
	{
		for(int x = 0; x < numChoice; x++)
		{
			// Lasy row don't move up
			if(x != (numChoice - 1))
			{
				if(x == radioForOrderInt)
				{
					String st1 = radioForOrder[x].getText();
					String st2 = radioForOrder[x + 1].getText();
					radioForOrder[x].setText(st2);
					radioForOrder[x + 1].setText(st1);	
					radioForOrder[x + 1].setSelected(true);
					
					break;
				}
			}
		}
	}
	// SET FOR SWOT
	public void setProjectorTopicSwot(String topic,int y) {
		JLabel lblresult = new JLabel("0");
		lblresult.setFont(new Font("",0,50));
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		gc.gridx = 0; gc.gridy = y; // position of grid [like array two dimention]
		add(lblresult,gc);
		
		vvote.addElement(lblresult);
		
		gc.gridx = 1; gc.gridy = y; // position of grid [like array two dimention]
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y 
		JLabel ltopic = new JLabel("    " + topic);
		ltopic.setOpaque(true);
		ltopic.setFont(new Font("",Font.PLAIN, 50));
		ltopic.setBackground(Color.WHITE);
		add(ltopic,gc);
	}
	public void removeVector() {
		vvote.removeAllElements();
		removeAll();
		invalidate();
    	repaint();
    	validate();
	}
	
	// For JSlider
	public void stateChanged(ChangeEvent e)
	{
		sliderPoint = slider.getValue();
		sumChoice2 = 0;
		remain = 0;

		choiceTextF[radioForSliderInt].setText(String.valueOf(sliderPoint));
		lbpoint2.setText(String.valueOf(remain));
		
		for(int i = 0; i < numChoice; i++)
		{
			sumChoice2 += Integer.parseInt(choiceTextF[i].getText());
			remain = point - sumChoice2;
		}
	
		choiceTextF[radioForSliderInt].setText(String.valueOf(sliderPoint));
		lbpoint2.setText(String.valueOf(remain));
	}
	
	// Handling Event for method: setTopicForWeigtedVote
	 public void itemStateChanged(ItemEvent e)
	 {
	 	if(e.getStateChange() == ItemEvent.SELECTED)
		{
			// For Weighted vote
			if(voteType == 2 || voteType == 3)
			{
				sumChoice1 = 0;
				for(int i = 0; i < numChoice; i++)
					sumChoice1 += Integer.parseInt(choiceTextF[i].getText());
				
				remain = point - sumChoice2;
			
				for(int j = 0; j < numChoice; j++)
				{			
					if(groupSlider.getSelection() == radioForSlider[j].getModel())
					{
						radioForSliderInt = j;
							
						String text = "";
						textInt = 0;
						
						text = choiceTextF[radioForSliderInt].getText();
						textInt = Integer.parseInt(text);
			
						// Set slider's knob to specified position and
						// Set max value for slider
						if((remain > 0) && (textInt == 0))
						{
							slider.setMaximum(remain);
							slider.setValue(0);
						}
						else if((remain > 0) && (textInt > 0))
						{
							slider.setMaximum(remain + textInt);
							slider.setValue(textInt);
						}
						else if((remain == 0) && (textInt == 0))
						{
							slider.setMaximum(0);
							slider.setValue(0);
						}
						else if((remain == 0) && (textInt > 0))
						{
							slider.setMaximum(textInt);
							slider.setValue(textInt);
						}
					}
				}
			}
			// For Order vote
			else if(voteType == 4 || voteType == 5)
			{
				for(int i = 0; i < numChoice; i++)
				{
					if(groupOrder.getSelection() == radioForOrder[i].getModel())
						radioForOrderInt = i;
				}
			}
		}		
	}			

	class MouseListeners implements MouseListener {
    	public void mouseClicked(MouseEvent e) 
    	{
    		try {
    			// For Yes/No vote
    			if(voteType == 0)
    			{
    				if(e.getSource() == lblok1)
    					selectTopicClosedYN(0);
    				else if(e.getSource() == lblok2)
    					selectTopicClosedYN(1);			 
    			}
    			else if(voteType == 1)
    			{
    				if(e.getSource() == lblok1)
    					selectTopicOpenYN(0);
    				else if(e.getSource() == lblok2)
    					selectTopicOpenYN(1);	
    			}
    			
    			// For Weighted vote and Order Vote
    			if(e.getSource() == labelOk)
    			{
    				// For Weighted vote
    				if(voteType == 2)
    					okButtonOfClosedWeightedVote();
	    			else if(voteType == 3)
	    				okButtonOfOpenWeightedVote();
	    			// For Order vote	
	    			else if(voteType == 4)
	    				okButtonOfClosedOrderVote();
	    			else if(voteType == 5)
		    			okButtonOfOpenOrderVote();
    			}
	    			
	    		// For Button Up or Down
	    		if(e.getSource() == labelUp)
	    		{
	    			moveUp();
	    		}
	    		
	    		if(e.getSource() == labelDown)
	    		{
	    			moveDown();
	    		}		
    		 }catch(Exception ex) {}
    	}
    	public void mouseEntered(MouseEvent e) { }
    	public void mouseExited(MouseEvent e) { }
    	public void mousePressed(MouseEvent e) { }
    	public void mouseReleased(MouseEvent e) { }
  } 
} // end of class