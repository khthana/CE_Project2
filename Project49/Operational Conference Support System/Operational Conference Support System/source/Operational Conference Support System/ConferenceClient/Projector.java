import javax.swing.*;
import java.io.*;
import java.net.*;
import java.awt.*;
import java.util.*;

public final class Projector extends JFrame implements SetPdfPanel {
	private static JPanel mainpanel;
	private TopicPanel topicpanel;
	private static PdfPanel pdfpanel;
	private RulePanel rulepanel;
	private static CardLayout c;
	private HeaderPanel headerpanel;
	private WhiteBoardPanel whiteboardpanel;
	private VotePanel votepanel;
	private NoticeProjector noticeprojector;
	private FooterPanel footerpanel;
	private Socket sock;
	private DataInputStream din;
  	private DataOutputStream dout;
	private ClientThread ct;
	private String vote[];
	private static String mem = "topic";
	
	private int pagecurrent = 0;
	private int i;
	private String s;
	
	//############## FOR SWOT ####################
	private DrawOvals drawOvals;
	private EvaluatePanel evaluatePanel;
	private SummarySession summarySessionPanel;
	private PicturePanel picturePanel;
	private TextPanel showText;
	private showSelectedSuggestion showSelectedSuggestion1;
	
	//************************
	
	private WaitForAllSummaryPanel waitForAllSummaryPanel;

	private ShowSummaryAll4Session showSummaryAll4Session;
	
	//*************************
	
	//############################################

	public Projector(Socket sock,ClientThread ct) {
		try {
			this.sock = sock; this.ct = ct;
			Init();
			OpenProjector();
		} catch(Exception e) { e.printStackTrace(); }
	}
	private void Init() throws Exception {
		din = new DataInputStream(sock.getInputStream());
      dout = new DataOutputStream(sock.getOutputStream());
      rulepanel = new RulePanel();
		headerpanel = new HeaderPanel();
		footerpanel = new FooterPanel();
		topicpanel = new TopicPanel(sock);
		pdfpanel = new PdfPanel(sock,false);
		whiteboardpanel = new WhiteBoardPanel(sock,false);
		votepanel = new VotePanel(sock);
		noticeprojector = new NoticeProjector();
		
		//############## SWOT ################################
		drawOvals = new DrawOvals();
		evaluatePanel = new EvaluatePanel(sock);
		summarySessionPanel = new SummarySession(sock);
		picturePanel = new PicturePanel(sock);
		showText = new TextPanel();
		showSelectedSuggestion1 = new showSelectedSuggestion(sock);
		
		//************************
	
	waitForAllSummaryPanel = new WaitForAllSummaryPanel(sock);

	 showSummaryAll4Session = new ShowSummaryAll4Session(sock);
	
	//*************************
	
		//####################################################
		
    	mainpanel = new JPanel(new CardLayout());
    	c = (CardLayout)(mainpanel.getLayout());
    	mainpanel.add(topicpanel,"topic");
    	mainpanel.add(pdfpanel,"pdf");
    	mainpanel.add(whiteboardpanel,"whiteboard");
    	mainpanel.add(votepanel,"vote");
    	mainpanel.add(rulepanel,"rule");
    	mainpanel.add(noticeprojector,"noticeprojector");
    		
    	//############ SWOT ##############################
    	mainpanel.add(evaluatePanel,"evaluate");
    	mainpanel.add(drawOvals,"drawovals");
    	mainpanel.add(summarySessionPanel,"summarySessionPanel");
    	mainpanel.add(picturePanel,"picturepanel");
    	mainpanel.add(showText,"showtext");
    	mainpanel.add(showSelectedSuggestion1,"sss");
    	
    	//**********************************************
		
		mainpanel.add(waitForAllSummaryPanel,"waitForAllSummary");
	
		mainpanel.add(showSummaryAll4Session,"summary4SessionPanel");
		
		//**********************************************
		
    	//################################################
    	
    	add(headerpanel,BorderLayout.NORTH);
    	add(mainpanel,BorderLayout.CENTER);
    	add(footerpanel,BorderLayout.SOUTH);
    	setUndecorated(true);
    	setSize(Toolkit.getDefaultToolkit().getScreenSize());
    	setVisible(true);

		ct.setPdfPanelHandle(pdfpanel);
    	ct.setTopicPanelHandle(topicpanel);
    	ct.setWhiteBoardPanelHandle(whiteboardpanel);
    	ct.setVotePanel(votepanel);
    	ct.setPdfPanel(this);
    	setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	}
	public int getPageCurrent() {
		return pagecurrent;
	}
	public void setMem(String mem) {
		this.mem = mem;
	}
	public void setVote(int i) {
		vote = new String[i];
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
	public void restorePanel() {
		c.show(mainpanel,mem);
	}
	public void setPageCurrent(int page) {
		this.pagecurrent = page;
	}
	private void OpenProjector() {
		try {
			dout.writeInt(9); // message 9 use for send to get information of topic.
			mem = "rule";
		} catch(Exception e) { e.printStackTrace(); }
		c.show(mainpanel,"rule");
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
	public void setMenuSwotPanel(){}
	public void setEvaluatePanel(String panel , Vector aSuggestion,String yLable,int yMax,int yMin,String rLabel,
													int rMax, int rMin){
		evaluatePanel.setTextBox(aSuggestion);
		c.show(mainpanel,panel);
		invalidate();
    	repaint();
    	validate();
	}
	public void setSummarySessionPanel(String panel , Vector aSuggestion,Vector aPriority , Vector aPosibility , 
													Vector aCost ,String yLable,int yMax,int yMin,String rLable,int rMax,int rMin){
		summarySessionPanel.setFactor(aSuggestion  , aPriority , aPosibility ,aCost,yLable,yMax,yMin,rLable,rMax,rMin);
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
			
			
			showSummaryAll4Session.showScoreStrenght();
			
		c.show(mainpanel,panel);
	
		invalidate();
    	repaint();
    	validate();														
																	
																	
																	
																	
																	
	}
	
} // End of class