import java.awt.*;
import javax.swing.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import java.util.*;

public class Committee extends JFrame implements SetPdfPanel {
	private static JPanel mainpanel;
	private JPanel menupanel;
	private RulePanel rulepanel;
	private TopicPanel topicpanel;
	private static PdfPanel pdfpanel;
	private static CardLayout c;
	private HeaderPanel headerpanel;
	private WhiteBoardPanel whiteboardpanel;
	private VotePanel votepanel;
	private FooterPanel footerpanel;
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
  	private GridBagConstraints gc;
	private JLabel bx,b1,b2,b3,b5,b6,b4;
	private ImageIcon icobx,icob1,icob2,icob3,icob5,icob6,icob4;
	private JLabel lblrule;
	private ClientThread ct;
  	private ByteArrayOutputStream buff;
  	private static String mem = "topic";
	
	private static int pagecurrent = 0;
	private int i;
	private String s;
	
	//###############################################
		private JLabel bSwot,bOk,bReset,bCancel,bOk1,bViewGraph,bHelp;
		private ImageIcon icob8,icob9,icob10,icob11,icob12;
	
		private DrawOvals drawOvals;
		private TextPanel showText;
		private PicturePanel picturePanel;
		private StrenghtSwotPanel strenghtSwotPanel;
		private ConfirmSuggestionPanel confirmSuggestionPanel;
		private showSelectedSuggestion showSelectedSuggestion1;
		private EvaluatePanel evaluatePanel;

		private MouseListeners mouselistener = new MouseListeners();
    	private SummarySession summarySessionPanel;
    	private WaitForNextSession waitForNextSession;
    	
    	//************************
	
	private WaitForAllSummaryPanel waitForAllSummaryPanel;

	private ShowSummaryAll4Session showSummaryAll4Session;
	
	private ImageIcon icobS,icobW,icobO,icobT,icobThank;
	private JLabel bS,bW,bO,bT,bExit,bThank;

	
	//*************************
	//###############################################	
	
	public Committee(Socket sock,ClientThread ct) {
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
		menupanel = new JPanel(new GridBagLayout());
		rulepanel = new RulePanel();
		votepanel = new VotePanel(sock);
		
		//######## FOR SWOT########################################
		drawOvals = new DrawOvals();
		showText = new TextPanel();
		picturePanel = new PicturePanel(sock);
		strenghtSwotPanel = new StrenghtSwotPanel(sock);
		confirmSuggestionPanel = new ConfirmSuggestionPanel(sock);
		showSelectedSuggestion1 = new showSelectedSuggestion(sock);
		evaluatePanel = new EvaluatePanel(sock);
		summarySessionPanel = new SummarySession(sock);
		waitForNextSession = new WaitForNextSession(sock);
		
		//************************
	
		waitForAllSummaryPanel = new WaitForAllSummaryPanel(sock);

	 showSummaryAll4Session = new ShowSummaryAll4Session(sock);
	
	//*************************
	
		//################################################################
		
		ct.setPdfPanelHandle(pdfpanel);
		ct.setPdfPanel(this);
		ct.setTopicPanelHandle(topicpanel);
		ct.setWhiteBoardPanelHandle(whiteboardpanel);
		ct.setVotePanel(votepanel);
		
		icob1 = new ImageIcon(Committee.class.getResource("topic.png"));
		icob2 = new ImageIcon(Committee.class.getResource("document.png"));
		icob3 = new ImageIcon(Committee.class.getResource("whiteboard.png"));
		icob5 = new ImageIcon(Committee.class.getResource("projector.png"));
		icob6 = new ImageIcon(Committee.class.getResource("cprojector.png"));
		icobx = new ImageIcon(Committee.class.getResource("exit.png"));
		b1 = new JLabel(icob1); b2 = new JLabel(icob2); b3 = new JLabel(icob3);
		b5 = new JLabel(icob5); bx = new JLabel(icobx); b6 = new JLabel(icob6);
		
		//######## ICON FOR SWOT ########################################
		icob8 = new ImageIcon(Chairman.class.getResource("ok.png"));
		icob9 = new ImageIcon(Chairman.class.getResource("bReset.png"));
		icob10 = new ImageIcon(Chairman.class.getResource("bcancel1.png"));
		icob11 = new ImageIcon(Committee.class.getResource("bViewGraph.png"));
		icob12 = new ImageIcon(Committee.class.getResource("bHelp.png"));
		
		bOk = new JLabel(icob8);
		bReset = new JLabel(icob9);
		bCancel = new JLabel(icob10);
		bViewGraph = new JLabel(icob11);
		bHelp = new JLabel(icob12);
		
		//************************************************
		
			icobS = new ImageIcon(Chairman.class.getResource("bStrenght.png"));
			icobW = new ImageIcon(Chairman.class.getResource("bWeakness.png"));
			icobO = new ImageIcon(Chairman.class.getResource("bOpportunities.png"));
			icobT = new ImageIcon(Chairman.class.getResource("bThread.png"));
			icobThank = new ImageIcon(Chairman.class.getResource("Thank.png"));
		
		//************************************************
		bS = new JLabel(icobS);
		bW = new JLabel(icobW);
		bO = new JLabel(icobO);
		bT = new JLabel(icobT);
		bExit = new JLabel(icobx);
		bThank = new JLabel(icobThank);
		//################################################################
		
		gc.fill = GridBagConstraints.BOTH;
		gc.anchor = GridBagConstraints.NORTH;
		gc.insets.top = 3; gc.insets.bottom = 0;
		gc.insets.left = 5; gc.insets.right = 5;
		
		gc.gridwidth = 1; gc.gridheight = 1; // merge cell from grid
		gc.ipadx = 10; gc.ipady = 10; // size of component
		gc.weightx = 0; gc.weighty = 0; // resize follow size of screen x ,y
		gc.gridx = 0; gc.gridy = 1; // position of grid [like array two dimention]
		menupanel.add(b1,gc);
		gc.gridx = 0; gc.gridy = 2; // position of grid [like array two dimention]
		menupanel.add(b2,gc);
		gc.gridx = 0; gc.gridy = 3; // position of grid [like array two dimention]
		menupanel.add(b3,gc);
		gc.gridx = 0; gc.gridy = 4; // position of grid [like array two dimention]
		menupanel.add(b5,gc);
		gc.gridx = 0; gc.gridy = 5; // position of grid [like array two dimention]
		menupanel.add(b6,gc);
		gc.gridx = 0; gc.gridy = 6; // position of grid [like array two dimention]
		menupanel.add(bx,gc);
		menupanel.setBackground(Color.WHITE);
		
    	mainpanel = new JPanel(new CardLayout());
    	c = (CardLayout)(mainpanel.getLayout());
    	mainpanel.add(rulepanel,"rule");
    	mainpanel.add(topicpanel,"topic");
    	mainpanel.add(pdfpanel,"pdf");
    	mainpanel.add(whiteboardpanel,"whiteboard");
    	mainpanel.add(votepanel,"vote");
    	
    	//######### ADD PANEL'S SWOT ####################################
		mainpanel.add(showText,"showtext");
		mainpanel.add(picturePanel,"picturepanel");
		mainpanel.add(strenghtSwotPanel,"strenghtSwot");
		mainpanel.add(confirmSuggestionPanel,"confirmSuggestionPanel");
		mainpanel.add(showSelectedSuggestion1,"showSelectedSuggestion1");
		mainpanel.add(evaluatePanel,"evaluate");
		mainpanel.add(drawOvals,"drawovals");
    	mainpanel.add(summarySessionPanel,"summarySessionPanel");
    	mainpanel.add(waitForNextSession,"waitForNextSession");
    	
    	//**********************************************
		mainpanel.add(waitForAllSummaryPanel,"waitForAllSummary");
	
		mainpanel.add(showSummaryAll4Session,"summary4SessionPanel");
		
		//**********************************************
		
    	//#################################################################
    	
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
  		b5.addMouseListener(mouselistener);
    	b6.addMouseListener(mouselistener);
    	bx.addMouseListener(mouselistener);
    	
    	//########## SWOT ################################################
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
    	//################################################################
    	
    	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public void restorePanel() {
		c.show(mainpanel,mem);
	}
	
	public void setMem(String mem) {
		this.mem = mem;
	}
	// set page current
	public void setPageCurrent(int page) {
		this.pagecurrent = page;
	}
	// get page current
	public int getPageCurrent() {
		return pagecurrent;
	}
	// Open Conference system
	// send message to server for get topic of to day.
	private void OpenConference() {
		try {
			dout.writeInt(9); // message 9 use for send to get information of topic.
			pagecurrent = 0;
			mem = "rule";
		} catch(Exception e) { e.printStackTrace(); }
		c.show(mainpanel,"rule");
	}
	public void setPanel(String panel) { 
		c.show(mainpanel,panel);
		invalidate();
    	repaint();
    	validate();
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
													String aRAxisName,int aYMax,int aYMin , int aRMax , int aRMin){
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
	public void setNumberOfSuggetion(String panel ,Vector aSuggestion){}
	public void setNumberOfSelectedSuggestion(String panel, Vector aSuggestion){
 		showSelectedSuggestion1.setText(aSuggestion);
 		
 		c.show(mainpanel,panel);
		invalidate();
    	repaint();
    	validate();
	}
	public void setEvaluatePanel(String panel , Vector aSuggestion,String yLabel,int yMax,int yMin,String rLabel,
		int rMax,int rMin){
		
													
		evaluatePanel.setFactor(yLabel,yMax,yMin,rLabel,rMax,rMin);
		evaluatePanel.setTextBox(aSuggestion);
		
		c.show(mainpanel,panel);
		invalidate();
    	repaint();
    	validate();
	}
	public void setSummarySessionPanel(String panel , Vector aSuggestion,Vector aPriority , Vector aPosibility ,
														 Vector aCost ,String yLabel,int yMax,int yMin,String rLabel,int rMax,int rMin){
														 	

													 	
		summarySessionPanel.setFactor(aSuggestion  , aPriority ,aPosibility , aCost,yLabel,yMax,yMin,rLabel,rMax,rMin);
		summarySessionPanel.showScore();
	
		c.show(mainpanel,panel);
		invalidate();
    	repaint();
    	validate();
	}
	
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
													
			
		//showSummaryAll4Session.showScoreStrenght();
		
		
		
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
    	mainpanel.add(votepanel,"vote");
    	
    	//######### ADD PANEL'S SWOT ####################################
		mainpanel.add(showText,"showtext");
		mainpanel.add(picturePanel,"picturepanel");
		mainpanel.add(strenghtSwotPanel,"strenghtSwot");
		mainpanel.add(confirmSuggestionPanel,"confirmSuggestionPanel");
		mainpanel.add(showSelectedSuggestion1,"showSelectedSuggestion1");
		mainpanel.add(evaluatePanel,"evaluate");
		mainpanel.add(drawOvals,"drawovals");
    	mainpanel.add(summarySessionPanel,"summarySessionPanel");
    	mainpanel.add(waitForNextSession,"waitForNextSession");
    	
    	//**********************************************
		mainpanel.add(waitForAllSummaryPanel,"waitForAllSummary");
	
		mainpanel.add(showSummaryAll4Session,"summary4SessionPanel");
	
		
		//**********************************************
		
			
		add(mainpanel,BorderLayout.CENTER);	
																
	}
	
	public void setMenuSwotPanel(){
		mainpanel.remove(rulepanel);
		mainpanel.invalidate();
		repaint();
	 		
		mainpanel.setLayout(new GridBagLayout());
		mainpanel.setBackground(Color.WHITE);
			
		gc.gridx = 0; gc.gridy = 0; 
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
		
		mainpanel.setLayout(new CardLayout());
    	c = (CardLayout)(mainpanel.getLayout());
    	mainpanel.add(rulepanel,"rule");
    	mainpanel.add(topicpanel,"topic");
    	mainpanel.add(pdfpanel,"pdf");
    	mainpanel.add(whiteboardpanel,"whiteboard");
    	mainpanel.add(votepanel,"vote");
    	mainpanel.add(showText,"showtext");
		mainpanel.add(picturePanel,"picturepanel");
		mainpanel.add(strenghtSwotPanel,"strenghtSwot");
		mainpanel.add(confirmSuggestionPanel,"s");
		mainpanel.add(showSelectedSuggestion1,"sss");
		mainpanel.add(evaluatePanel,"evaluate");
		mainpanel.add(drawOvals,"drawovals");
		mainpanel.add(summarySessionPanel,"summarySessionPanel");
		mainpanel.add(waitForNextSession,"waitForNextSession");
		
		//**********************************************
		
		mainpanel.add(showSummaryAll4Session,"summary4SessionPanel");
		mainpanel.add(waitForAllSummaryPanel,"waitForAllSummary");
		
		//**********************************************
		
    	add(mainpanel,BorderLayout.CENTER);
	}
	
	// Listener button event
  class MouseListeners implements MouseListener {
    public void mouseClicked(MouseEvent e) {
    	try {
    		if(e.getSource() == b1) { // set topic panel
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
    		} else if(e.getSource() == b5) {  // set projector
    			dout.writeInt(13);
    		} else if(e.getSource() == b6) { // cancel projector
    			pdfpanel.setProjectorStatus(false);
    			whiteboardpanel.setProjectorStatus(false);
    			whiteboardpanel.setFirst(true);
    		} else if(e.getSource() == bOk){	// FOR SWOT
				if(strenghtSwotPanel.isShowing()){
					strenghtSwotPanel.buttonOkPushed();
				} else if(confirmSuggestionPanel.isShowing()){
						confirmSuggestionPanel.buttonOkPushed();
				} else if(evaluatePanel.isShowing()){
						evaluatePanel.buttonOkPushed();
				} else if(summarySessionPanel.isShowing()){
						summarySessionPanel.buttonOkPushed();
				}
			} else if(e.getSource() == bCancel){
													// FOR SWOT
				 if(strenghtSwotPanel.isShowing()){
					strenghtSwotPanel.buttonCancelPushed();
				} else if(evaluatePanel.isShowing()){
					evaluatePanel.buttonCancelPushed();
				} else if(summarySessionPanel.isShowing()){
					summarySessionPanel.buttonCancelPushed();
				}
				
			} else if(e.getSource() == bReset){
					if(strenghtSwotPanel.isShowing()){
						strenghtSwotPanel.buttonResetPushed();
					} else if(evaluatePanel.isShowing()){
						evaluatePanel.buttonResetPushed();
					}
    		} else if(e.getSource() == bViewGraph){		// FOR SWOT
    				if(evaluatePanel.isShowing()){
    					
    				
    					evaluatePanel.buttonViewGraphPushed();
    				}else if(summarySessionPanel.isShowing()){
    					
    					summarySessionPanel.buttonViewGraphPushed();
			
					}else if(showSummaryAll4Session.isShowing()){
					
						showSummaryAll4Session.drawGraph();
    			
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
    		
    		
    		
    		
    		
    		
    		else if(e.getSource() == bx) {  // exit
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