import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import java.util.*;

public class Chairman extends JFrame implements SetPdfPanel {
	//############ SWOT ####################
	private ConfirmTopicSwotPanel confirmTopicSwotPanel;
	private TextPanel textPanel,textPanel1,textPanel2 ,showText;
	private PicturePanel picturePanel1;
	private ControlSwotPanel controlSwotPanel;
	private StrenghtSwotPanel strenghtSwotPanel;
	private StartSwotPanel startSwotPanel;
	private ConfirmSessionPanel confirmSessionPanel;
	private ConfirmSuggestionPanel confirmSuggestionPanel;
	private ShowAllSuggestionPanel showAllSuggestionPanel;
	private EvaluatePanel evaluatePanel;
	private DrawOvals drawOvals;
	private ConfirmFactorName confirmFactorName;
	private SummarySession summarySessionPanel;
	private int suggestionNumber;	 
	private	ImageIcon icob11;
	private JLabel LImage;
	private JLabel bSwot,bOk,bReset,bCancel,bViewGraph,bHelp;
	private ImageIcon icob8,icob9,icob10,icob12,icob13;
	private JPanel menuSwotPanel;
	private GridBagLayout gbl = new GridBagLayout();	
	private int firstPage = 1;		
	
	
	private ShowSummaryAll4Session showSummaryAll4Session;
	private WaitForAllSummaryPanel waitForAllSummaryPanel;
	
	
	private ImageIcon icobS,icobW,icobO,icobT,icobThank;
	private JLabel bS,bW,bO,bT,bExit,bThank;

	//###########################################
	
	private SummaryYesNoPanel summaryYesNoPanel;
	private SummaryWeightedPanel summaryWeightedPanel;
	private SummaryOrderPanel summaryOrderPanel;
	private static JPanel mainpanel;
	private JPanel menupanel;
	private RulePanel rulepanel;
	private TopicPanel topicpanel;
	private static PdfPanel pdfpanel;
	private static CardLayout c;
	private HeaderPanel headerpanel;
	private WhiteBoardPanel whiteboardpanel;
	private PermitPanel permitpanel;
	private VotePanel votepanel;
	private WaitVotePanel waitpanel;
	private FooterPanel footerpanel;
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
  	private GridBagConstraints gc;
	private JLabel bx,b1,b2,b3,b4,b7,b6;
	private ImageIcon icobx,icob1,icob2,icob3,icob4,icob5,icob6,icob7;
	private JLabel lblrule;
	private ClientThread ct;
  	private ByteArrayOutputStream buff;
  	private static String mem = "topic";
	
	private int pagecurrent = 0;
	private int i;
	private String s;
	
	public Chairman(Socket sock,ClientThread ct) {
		try {
			this.sock = sock; this.ct = ct;
	      	Init();
	      	OpenConference();
	    } catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() throws Exception {
		din = new DataInputStream(sock.getInputStream());
      	dout = new DataOutputStream(sock.getOutputStream());
      	gc = new GridBagConstraints();
		headerpanel = new HeaderPanel();
		footerpanel = new FooterPanel();
		topicpanel = new TopicPanel(sock);
		pdfpanel = new PdfPanel(sock,true);
		whiteboardpanel = new WhiteBoardPanel(sock,true);
		permitpanel = new PermitPanel(sock);
		menupanel = new JPanel(new GridBagLayout());
		rulepanel = new RulePanel();
		votepanel = new VotePanel(sock);
		waitpanel = new WaitVotePanel();
		summaryYesNoPanel = new SummaryYesNoPanel(sock, 0);
		summaryWeightedPanel = new SummaryWeightedPanel(sock, 0);
		summaryOrderPanel = new SummaryOrderPanel(sock, 0);
		
		//####### SWOT PANEL ##########
		confirmTopicSwotPanel = new ConfirmTopicSwotPanel(sock);	
		textPanel = new TextPanel();
		textPanel1 = new TextPanel();
		showText = new TextPanel();
		controlSwotPanel = new ControlSwotPanel(sock);
		strenghtSwotPanel = new StrenghtSwotPanel(sock);
		startSwotPanel = new StartSwotPanel(sock);
		drawOvals = new DrawOvals();		
		picturePanel1 = new PicturePanel(sock);		
		confirmSessionPanel = new ConfirmSessionPanel(sock);		
		showAllSuggestionPanel = new ShowAllSuggestionPanel(sock);		
		evaluatePanel = new EvaluatePanel(sock);
		confirmFactorName = new ConfirmFactorName(sock);
		summarySessionPanel = new SummarySession(sock);		
		
			//************************
	
		 waitForAllSummaryPanel = new WaitForAllSummaryPanel(sock);
		 showSummaryAll4Session = new ShowSummaryAll4Session(sock);
	
	//*************************
	
		//##########################
		
		ct.setPdfPanelHandle(pdfpanel);
		ct.setPdfPanel(this);
		ct.setTopicPanelHandle(topicpanel);
		ct.setWhiteBoardPanelHandle(whiteboardpanel);
		ct.setVotePanel(votepanel);
		
		icob1 = new ImageIcon(Chairman.class.getResource("topic.png"));
		icob2 = new ImageIcon(Chairman.class.getResource("document.png"));
		icob3 = new ImageIcon(Chairman.class.getResource("whiteboard.png"));
		icob4 = new ImageIcon(Chairman.class.getResource("vote.png"));
		icob6 = new ImageIcon(Chairman.class.getResource("projector.png"));
		icob7 = new ImageIcon(Chairman.class.getResource("cprojector.png"));
		icobx = new ImageIcon(Chairman.class.getResource("exit.png"));
		
		//##### ICON SWOT ###########
		icob5 = new ImageIcon(Chairman.class.getResource("swot.png"));
		icob8 = new ImageIcon(Chairman.class.getResource("ok.png"));
		icob9 = new ImageIcon(Chairman.class.getResource("bReset.png"));
		icob10 = new ImageIcon(Chairman.class.getResource("bcancel1.png"));
		icob11 = new ImageIcon(Chairman.class.getResource("startSwot.png"));
		icob12 = new ImageIcon(Chairman.class.getResource("bViewGraph.png"));
		icob13 = new ImageIcon(Chairman.class.getResource("bHelp.png"));
		
			//************************************************
		
			icobS = new ImageIcon(Chairman.class.getResource("bStrenght.png"));
			icobW = new ImageIcon(Chairman.class.getResource("bWeakness.png"));
			icobO = new ImageIcon(Chairman.class.getResource("bOpportunities.png"));
			icobT = new ImageIcon(Chairman.class.getResource("bThread.png"));
			icobThank = new ImageIcon(Chairman.class.getResource("Thank.png"));
	
		//************************************************
		
		//################
			
		b1 = new JLabel(icob1); b2 = new JLabel(icob2); b3 = new JLabel(icob3);
		b4 = new JLabel(icob4); b7 = new JLabel(icob7); bx = new JLabel(icobx);
		b6 = new JLabel(icob6);
		
		//###### ADD ICON TO LABEL SWOT ##########
		LImage = new JLabel(icob11);
		bSwot = new JLabel(icob5);
		bOk = new JLabel(icob8);
		bReset = new JLabel(icob9);
		bCancel = new JLabel(icob10);
		bViewGraph = new JLabel(icob12);
		bHelp = new JLabel(icob13);		
		
		//*************************************************
		
		bS = new JLabel(icobS);
		bW = new JLabel(icobW);
		bO = new JLabel(icobO);
		bT = new JLabel(icobT);
		bExit = new JLabel(icobx);
		bThank= new JLabel(icobThank);		
	
		
		//*************************************************
		//################

		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 15; gc.insets.right = 15;
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.ipadx = 10; gc.ipady = 5; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		menupanel.add(b1,gc);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		menupanel.add(b2,gc);
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		menupanel.add(b3,gc);
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		menupanel.add(b4,gc);
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		menupanel.add(bSwot,gc);
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		menupanel.add(b6,gc);
		gc.gridx = 0; gc.gridy = 7; // position of grid [like array two dimention]
		menupanel.add(b7,gc);
		gc.gridx = 0; gc.gridy = 8; // position of grid [like array two dimention]
		menupanel.add(bx,gc);
		menupanel.setBackground(Color.WHITE);
		
    	mainpanel = new JPanel(new CardLayout());
    	c = (CardLayout)(mainpanel.getLayout());
    	mainpanel.add(rulepanel,"rule");
    	mainpanel.add(topicpanel,"topic");
    	mainpanel.add(pdfpanel,"pdf");
    	mainpanel.add(whiteboardpanel,"whiteboard");
    	mainpanel.add(permitpanel,"permit");
    	mainpanel.add(votepanel,"vote");
    	mainpanel.add(summaryYesNoPanel,"summaryc");
    	mainpanel.add(summaryWeightedPanel,"summary_w");
    	mainpanel.add(summaryOrderPanel, "summary_o");
    	mainpanel.add(waitpanel,"wait");
    	
    	//###### ADD SWOT PANEL ##########
  		mainpanel.add(confirmTopicSwotPanel,"confirmtopicswot");		
  		mainpanel.add(textPanel,"wctswot");
  		mainpanel.add(textPanel1,"wfanotheruser");
    	mainpanel.add(controlSwotPanel,"ctrlswotpanel");
    	mainpanel.add(strenghtSwotPanel,"strenghtSwot");
    	mainpanel.add(showText,"showtext");
    	mainpanel.add(drawOvals,"drawovals");
		mainpanel.add(startSwotPanel,"startswotpanel");	
		mainpanel.add(picturePanel1,"picturepanel");
		mainpanel.add(confirmSessionPanel,"confirmSessionStrenght");	
		mainpanel.add(showAllSuggestionPanel,"showAll");
		mainpanel.add(evaluatePanel,"evaluate");
		mainpanel.add(confirmFactorName,"confirmFactorName");
		mainpanel.add(summarySessionPanel,"summarySessionPanel");
				//**********************************************
		
		mainpanel.add(showSummaryAll4Session,"summary4SessionPanel");
		
		mainpanel.add(waitForAllSummaryPanel,"waitForAllSummary");
		
		//**********************************************
		
  		//################
  		
    	add(headerpanel,BorderLayout.NORTH);
    	add(menupanel,BorderLayout.WEST);
    	add(mainpanel,BorderLayout.CENTER);
    	add(footerpanel,BorderLayout.SOUTH);
    	setUndecorated(true);
    	setSize(Toolkit.getDefaultToolkit().getScreenSize());
    	setVisible(true);
    	MouseListeners mouselistener = new MouseListeners();
    	b1.addMouseListener(mouselistener);
    	b2.addMouseListener(mouselistener);
    	b3.addMouseListener(mouselistener);
    	b4.addMouseListener(mouselistener);
    	b6.addMouseListener(mouselistener);
    	b7.addMouseListener(mouselistener);
    	bx.addMouseListener(mouselistener);
    	
       	//##########################
    	bSwot.addMouseListener(mouselistener);
    	bOk.addMouseListener(mouselistener);
    	bReset.addMouseListener(mouselistener);
    	bCancel.addMouseListener(mouselistener);
    	bViewGraph.addMouseListener(mouselistener);
    	
    	//**************************************
    	
    	bS.addMouseListener(mouselistener);
    	bW.addMouseListener(mouselistener);
    	bO.addMouseListener(mouselistener);
    	bT.addMouseListener(mouselistener);
   		bExit.addMouseListener(mouselistener);
    
    	//***************************************
    	
    	//##########################
    	
    	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	// set page current
	public void setPageCurrent(int page) {
		this.pagecurrent = page;
	}
	public int getPageCurrent() {
		return pagecurrent;
	}
	public void setMem(String mem) {
		this.mem = mem;
	}
	// Open Conference system
	// send message to server for get topic of to day.
	// The first page will show rule panel
	private void OpenConference() {
		try {
			dout.writeInt(9); // message 9 use for send to get information of topic.
			pagecurrent = 0;
			mem = "rule";
		} catch(Exception e) { e.printStackTrace(); }
		c.show(mainpanel,"rule");
	}
	private synchronized void openVote() throws Exception {
		dout.writeInt(15);
	}
	
	private void openSwot() throws Exception {
		firstPage = 0;
		 	
	 	mainpanel.remove(rulepanel);	
		mainpanel.invalidate();
		repaint();
		
		mainpanel.setLayout(new GridBagLayout());
		mainpanel.setBackground(Color.WHITE);	
		
		gc.gridx = 0; gc.gridy = 0; 
		mainpanel.add(LImage,gc);
		add(mainpanel,BorderLayout.CENTER);
	
		menupanel.removeAll();
	
		gc.fill = GridBagConstraints.BOTH;    // resize and resize
		gc.anchor = GridBagConstraints.NORTH; //position
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 15; gc.insets.right = 15;
		
		gc.gridx = 0; gc.gridy = 1; 
		menupanel.add(bOk,gc);
		
		gc.gridx = 0; gc.gridy = 3; 
		menupanel.add(bReset,gc);			
		
		gc.gridx = 0; gc.gridy = 5; 
		menupanel.add(bCancel,gc);
		
		gc.gridx = 0; gc.gridy = 7;
		menupanel.add(bViewGraph,gc);
		
		gc.gridx = 0; gc.gridy = 9;
		menupanel.add(bHelp,gc);
		
		menupanel.setBackground(Color.WHITE);
		add(menupanel,BorderLayout.WEST);
	
		invalidate();
    	repaint();
    	validate();
		// Set as default value in method init()		
		mainpanel.setLayout(new CardLayout());
		c = (CardLayout)(mainpanel.getLayout());
    	mainpanel.add(rulepanel,"rule");
    	mainpanel.add(topicpanel,"topic");
    	mainpanel.add(pdfpanel,"pdf");
    	mainpanel.add(whiteboardpanel,"whiteboard");
    	mainpanel.add(permitpanel,"permit");
    	mainpanel.add(votepanel,"vote");
  		mainpanel.add(confirmTopicSwotPanel,"confirmtopicswot");
  		mainpanel.add(strenghtSwotPanel,"strenghtSwot");	
    	mainpanel.add(showAllSuggestionPanel,"showAll");
		mainpanel.add(confirmSessionPanel,"confirmSessionStrenght");		
  		mainpanel.add(textPanel,"wctswot");
  		mainpanel.add(textPanel1,"wfanotheruser");
    	mainpanel.add(controlSwotPanel,"ctrlswotpanel");
    	mainpanel.add(showText,"showtext");
    	mainpanel.add(drawOvals,"drawovals");	
		mainpanel.add(startSwotPanel,"startswotpanel");	
		mainpanel.add(picturePanel1,"picturepanel");	
		mainpanel.add(evaluatePanel,"evaluate");
		mainpanel.add(confirmFactorName,"confirmFactorName");
		mainpanel.add(summarySessionPanel,"summarySessionPanel");
		
				//**********************************************
		
		mainpanel.add(showSummaryAll4Session,"summary4SessionPanel");
		mainpanel.add(waitForAllSummaryPanel,"waitForAllSummary");
	
		
		//**********************************************
			
		add(mainpanel,BorderLayout.CENTER);	
	}
	
	private synchronized void setProjector() {
		try {
			dout.writeInt(7);
			dout.writeInt(pdfpanel.getPageCurrent());
			dout.writeInt(pdfpanel.getScrollBar());
			dout.writeFloat(pdfpanel.getZoom());
		} catch(Exception e) { e.printStackTrace(); } 
	}
	public void restorePanel() {
		c.show(mainpanel,mem);
	}
	public static void prevPanel() {
		c.show(mainpanel,mem);
	}
	public void setPanel(String panel) {
		c.show(mainpanel,panel);
		invalidate();
    	repaint();
    	validate();
	}
	
	private void addComponent(Component c , GridBagLayout gbl , GridBagConstraints gbc ,int row,int column,
													int width,int height){
		//set gridx and gridy --> position
		gbc.gridx = column;
		gbc.gridy = row;
		
		//set gridwidth and gridheight ---> number of column and row the component occupies
		gbc.gridwidth = width;
		gbc.gridheight = height;
		
		//set constraints
		gbl.setConstraints(c,gbc);
		
		//add component to applet
		add(c); 	
	}
	
	public void setPanel(String panel,ByteArrayOutputStream b) { // override from Interface
		pdfpanel.OpenFile(b);
		c.show(mainpanel,panel);
		b.reset();
		invalidate();
    	repaint();
    	validate();
	}
	
	public  void setGraphPanel(String panel,Vector sug , Vector pri , Vector pos , Vector cos, String aYAxisName , 
													String aRAxisName ,int aYMax,int aYMin , int aRMax , int aRMin){
    	drawOvals.setYaxisName(aYAxisName);
    	drawOvals.setRaxisName(aRAxisName);
    	drawOvals.setMaxMinYAxis(aYMax,aYMin);
    	drawOvals.setMaxMinRAxis(aRMax,aRMin);
 		drawOvals.setProperty(sug,pri,pos,cos);
 		
 		c.show(mainpanel,panel);
		invalidate();
    	repaint();
    	validate();
 	}
 	
 	public void setNumberOfSuggetion(String panel ,Vector aSuggestion){
 		showAllSuggestionPanel.setNumberOfSuggestion(aSuggestion);
 		c.show(mainpanel,panel);
		invalidate();
    	repaint();
    	validate();
 	}
 	// Interface class: Class SetPdfPanel
 	public void setNumberOfSelectedSuggestion(String panel, Vector aSuggestion){}
 	
	public void setEvaluatePanel(String panel , Vector aSuggestion,String yLabel,int yMax,int yMin,
 														String rLabel,int rMax,int rMin){	
 														
 														
		evaluatePanel.setFactor(yLabel,yMax,yMin,rLabel,rMax,rMin);
		evaluatePanel.setTextBox(aSuggestion);
		
		c.show(mainpanel,panel);
		
		invalidate();
    	repaint();
    	validate();	
	}
	
	public void setSummarySessionPanel(String panel , Vector aSuggestion,Vector aPriority , Vector aPosibility , 
													Vector aCost ,String yLabel,int yMax,int yMin,String rLable,int rMax,int rMin){	
		summarySessionPanel.setFactor(aSuggestion , aPriority , aPosibility ,aCost,yLabel,yMax,yMin,rLable,rMax,rMin);	
		summarySessionPanel.showScore();
		
		c.show(mainpanel,panel);
	
		invalidate();
    	repaint();
    	validate();
	}
	// Interface Class: Class SetPdfPanel
	public void setMenuSwotPanel(){	}
	
	public void setSummary4SessionPanel(String panel,Vector SuggestionS,Vector PriorityValueS,Vector PosibilityValueS,Vector CostValueS,String yLabelS,int yMaxS,int yMinS,String rLabelS,int rMaxS,int rMinS,
 									                               Vector SuggestionW,Vector PriorityValueW,Vector PosibilityValueW,Vector CostValueW,String yLabelW, int yMaxW,int yMinW,String rLabelW,int rMaxW,int rMinW,
 									                               Vector SuggestionO,Vector PriorityValueO,Vector PosibilityValueO,Vector CostValueO,String yLabelO,int yMaxO,int yMinO,String rLabelO,int rMaxO,int rMinO,					
																Vector SuggestionT,Vector PriorityValueT,Vector PosibilityValueT,Vector CostValueT,String yLabelT,int yMaxT,int yMinT,String rLabelT,int rMaxT,int rMinT){
																	
																	
																	
			showSummaryAll4Session.setFactorStrenght(SuggestionS ,PriorityValueS , PosibilityValueS ,  CostValueS, yLabelS,
										yMaxS ,  yMinS ,  rLabelS , rMaxS ,  rMinS);
	
			showSummaryAll4Session.setFactorWeakness(SuggestionW ,PriorityValueW , PosibilityValueW ,  CostValueW, yLabelW,
										yMaxW , yMinW ,  rLabelW , rMaxW , rMinW);						
			showSummaryAll4Session.setFactorOpportunities(SuggestionO ,PriorityValueO , PosibilityValueO ,  CostValueO, yLabelO,
										yMaxO , yMinO ,  rLabelO , rMaxO , rMinO);													
		
			showSummaryAll4Session.setFactorThread(SuggestionT ,PriorityValueT , PosibilityValueT ,  CostValueT, yLabelT,
										yMaxT , yMinT ,  rLabelT , rMaxT , rMinT);
			
			
			
	
		
		mainpanel.remove(summarySessionPanel);	
		mainpanel.invalidate();
		repaint();
		
		mainpanel.setLayout(new GridBagLayout());
		mainpanel.setBackground(Color.WHITE);	
		
		gc.gridx = 0; gc.gridy = 0; 
		mainpanel.add(bThank,gc);
		add(mainpanel,BorderLayout.CENTER);
	
		menupanel.removeAll();
	
		gc.fill = GridBagConstraints.BOTH;    // resize and resize
		gc.anchor = GridBagConstraints.NORTH; //position
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 15; gc.insets.right = 15;
		
		gc.gridx = 0; gc.gridy = 1; 
		menupanel.add(bS,gc);
		
		gc.gridx = 0; gc.gridy = 3; 
		menupanel.add(bW,gc);			
		
		gc.gridx = 0; gc.gridy = 5; 
		menupanel.add(bO,gc);
		
		gc.gridx = 0; gc.gridy = 7;
		menupanel.add(bT,gc);
		
		
		gc.gridx = 0; gc.gridy = 9;
		menupanel.add(bViewGraph,gc);
		
		
		gc.gridx = 0; gc.gridy = 11;
		menupanel.add(bHelp,gc);
		
		gc.gridx = 0; gc.gridy = 13;
		menupanel.add(bExit,gc);
		
				
		menupanel.setBackground(Color.WHITE);
		add(menupanel,BorderLayout.WEST);
	
		
		invalidate();
    	repaint();
    	validate();
    	
		// Set as default value in method init()		
		mainpanel.setLayout(new CardLayout());
		c = (CardLayout)(mainpanel.getLayout());
    	mainpanel.add(rulepanel,"rule");
    	mainpanel.add(topicpanel,"topic");
    	mainpanel.add(pdfpanel,"pdf");
    	mainpanel.add(whiteboardpanel,"whiteboard");
    	mainpanel.add(permitpanel,"permit");
    	mainpanel.add(votepanel,"vote");
  		mainpanel.add(confirmTopicSwotPanel,"confirmtopicswot");
  		mainpanel.add(strenghtSwotPanel,"strenghtSwot");	
    	mainpanel.add(showAllSuggestionPanel,"showAll");
		mainpanel.add(confirmSessionPanel,"confirmSessionStrenght");		
  		mainpanel.add(textPanel,"wctswot");
  		mainpanel.add(textPanel1,"wfanotheruser");
    	mainpanel.add(controlSwotPanel,"ctrlswotpanel");
    	mainpanel.add(showText,"showtext");
    	mainpanel.add(drawOvals,"drawovals");	
		mainpanel.add(startSwotPanel,"startswotpanel");	
		mainpanel.add(picturePanel1,"picturepanel");	
		mainpanel.add(evaluatePanel,"evaluate");
		mainpanel.add(confirmFactorName,"confirmFactorName");
		mainpanel.add(summarySessionPanel,"summarySessionPanel");
		mainpanel.add(showSummaryAll4Session,"summary4SessionPanel");
		mainpanel.add(waitForAllSummaryPanel,"waitForAllSummary");
	
		add(mainpanel,BorderLayout.CENTER);			
	}
	
	// Listener button event
  class MouseListeners implements MouseListener {
    public void mouseClicked(MouseEvent e) {
    	try {
    		if(e.getSource() == b1) {  // set topic panel
    			mem = "topic";
    			c.show(mainpanel,mem);
    			pagecurrent = 1;
    		} else if(e.getSource() == b2) { // set pdf panel
    			mem = "pdf";
    			c.show(mainpanel,mem);
    			pagecurrent = 2;
    			if(pdfpanel.getProjectorStatus()) {
    				dout.writeInt(10);
    			}
    		} else if(e.getSource() == b3) { // set whiteboard panel
    			mem = "whiteboard";
    			c.show(mainpanel,mem);
    			pagecurrent = 3;
    			if(whiteboardpanel.getProjectorStatus()) {
    				dout.writeInt(11);
    			}
    		} else if(e.getSource() == b4) { // vote
    			openVote();
    			mem = "wait";
    			c.show(mainpanel,mem);
    		} else if(e.getSource() == bSwot){				
    				openSwot();
    		} else if(e.getSource() == b6) { // set projector
    			pdfpanel.setProjectorStatus(true);
    			whiteboardpanel.setProjectorStatus(true);
    			switch(pagecurrent) {
    				case 2 : {
    					setProjector(); // message 7
    					break;
    				}
    				case 3 : {
    					dout.writeInt(8);
    					break;	
    				}
    			}
    		} else if(e.getSource() == b7) { // cancel projector
    			pdfpanel.setProjectorStatus(false);
    			whiteboardpanel.setProjectorStatus(false);
    			whiteboardpanel.setFirst(true);
    			dout.writeInt(20);
    		} else if(e.getSource() == bx) { // exit
    			dout.writeInt(2);
    			System.exit(0);
    		} else if(e.getSource() == bOk ){
    			if (firstPage==0){
    				firstPage = 1;
    				dout.writeInt(71);
    			} else if(confirmTopicSwotPanel.isShowing()){
    			 	confirmTopicSwotPanel.buttonOkPushed();
    			} else if(confirmSessionPanel.isShowing()){
    				confirmSessionPanel.buttonOkPushed();
    			} else if(strenghtSwotPanel.isShowing()){
    				strenghtSwotPanel.buttonOkPushed();
    			} else if(showAllSuggestionPanel.isShowing()){
    				showAllSuggestionPanel.buttonOkPushed();
    			} else if(evaluatePanel.isShowing()){
    				evaluatePanel.buttonOkPushed();
    			}else if(summarySessionPanel.isShowing()){
    				summarySessionPanel.buttonOkPushed();
    			}			
    		} else if(e.getSource() == bCancel){
    			if(confirmTopicSwotPanel.isShowing()){
    				confirmTopicSwotPanel.buttonCancelPushed();
    			} else if(confirmSessionPanel.isShowing()){
    				confirmSessionPanel.buttonCancelPushed();
    			} else if(strenghtSwotPanel.isShowing()){
    				strenghtSwotPanel.buttonCancelPushed();
    			} else if(showAllSuggestionPanel.isShowing()){
    				showAllSuggestionPanel.buttonCancelPushed();
    			} else if(evaluatePanel.isShowing()){
    				evaluatePanel.buttonCancelPushed();
    			} else if(summarySessionPanel.isShowing()){
    				summarySessionPanel.buttonCancelPushed();
    			}
    		} else if(e.getSource() == bReset){
    			if(strenghtSwotPanel.isShowing()){
    				strenghtSwotPanel.buttonResetPushed();
    			} else if(showAllSuggestionPanel.isShowing()){
    				showAllSuggestionPanel.buttonResetPushed();
    			} else if(evaluatePanel.isShowing()){
    				evaluatePanel.buttonResetPushed();
    			}
    		} else if(e.getSource() == bViewGraph){
    			if(evaluatePanel.isShowing()){
    				evaluatePanel.buttonViewGraphPushed();
    			} else if(summarySessionPanel.isShowing()){
    				summarySessionPanel.buttonViewGraphPushed();
    			}
    		} else if(e.getSource() == bS){
    				showSummaryAll4Session.prepareDrawGraph("s");
    				showSummaryAll4Session.showScoreStrenght();
   					c.show(mainpanel,"summary4SessionPanel");
    				invalidate();
    				repaint();
    				validate();
    			
    		}else if(e.getSource() == bW){
    			
    				showSummaryAll4Session.prepareDrawGraph("w");
    				showSummaryAll4Session.showScoreWeakness();	
   					c.show(mainpanel,"summary4SessionPanel");
    				invalidate();
    				repaint();
    				validate();
    			
    			
    		
    		}else if(e.getSource() == bO){
    			
    				showSummaryAll4Session.prepareDrawGraph("o");
    				showSummaryAll4Session.showScoreOpportunities();
    				c.show(mainpanel,"summary4SessionPanel");
    				invalidate();
    				repaint();
    				validate();
    			
    		}else if(e.getSource() == bT ){
    			
    				showSummaryAll4Session.prepareDrawGraph("t");	
    				showSummaryAll4Session.showScoreThread();
    				c.show(mainpanel,"summary4SessionPanel");
    				invalidate();
    				repaint();
    				validate();
    		
    		}else if(e.getSource() == bExit){
    			
    				dout.writeInt(2);
    				System.exit(0);
    			
    		}
    	} catch(Exception ex) { }
    }
    public void mouseEntered(MouseEvent e) { }
    public void mouseExited(MouseEvent e) { }
    public void mousePressed(MouseEvent e) { }
    public void mouseReleased(MouseEvent e) { }
  }
} // End of Committee class