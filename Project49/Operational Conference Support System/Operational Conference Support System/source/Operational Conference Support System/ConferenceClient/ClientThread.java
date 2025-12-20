import java.io.*;
import java.net.*;
import java.awt.*;
import javax.swing.*;
import java.util.*;

public class ClientThread extends Thread {
	private DataInputStream din;
	private String tmp;
	private Socket sock;
	private TopicPanel topicpanel;
	private PdfPanel pdfpanel;
	private WhiteBoardPanel whiteboardpanel;
	private VotePanel votepanel;
	private CreateVotePanel cvotepanel;
  	private DataOutputStream dout;
  	private ByteArrayOutputStream buff,buffsave;
  	private SetPdfPanel setpdfpanel;
  	private ByteArrayOutputStream b = new ByteArrayOutputStream();
	private ConferenceClient conferenceclient;
	private String name = "";
	private myMessageBox msgbox = new myMessageBox();
	private static int numCommittee = 0;
	private int ino, issno, issNo;
	
	private static boolean wrDB = false;
	private static int yes_result = 0;
	private static int no_result = 0;
	private static int[] weighted_res, order_res;
	private  int MNO = 0;
	
	private  int check = 0;
	
	//######## FOR SWOT ####################################
	private ConfirmTopicSwotPanel confirmTopicSwotpanel;
	private CreateTopicSwotPanel createTopicSwotPanel;
	private TextPanel  textPanel1;
	private TextPanel  textPanel2;
	private TextPanel  textPanel3;
	private TextPanel  textPanel4;
	private ControlSwotPanel controlSwotPanel;
	private PicturePanel picturePanel1;
	private ConfirmSessionPanel confirmSessionPanel;
	private StrenghtSwotPanel strenghtSwotPanel;
	private ConfirmSuggestionPanel confirmSuggestionPanel;
	private ShowAllSuggestionPanel showAllSuggestionPanel;
	//##############################################################
	
	public ClientThread(Socket sock,ConferenceClient conferenceclient) {
		try {
			this.sock = sock; this.conferenceclient = conferenceclient;
      	din = new DataInputStream(this.sock.getInputStream());
      	dout = new DataOutputStream(this.sock.getOutputStream());
    	} catch(Exception e) { e.printStackTrace(); }
	}
	public void setPdfPanel(SetPdfPanel setpdfpanel) {
		this.setpdfpanel = setpdfpanel;
	}
	public void setWhiteBoardPanelHandle(WhiteBoardPanel whiteboardpanel) {
		this.whiteboardpanel = whiteboardpanel;
	}
	public void setPdfPanelHandle(PdfPanel pdfpanel) {
		this.pdfpanel = pdfpanel;
	}
	public void setTopicPanelHandle(TopicPanel topicpanel) {
		this.topicpanel = topicpanel;
	}
	public void setVotePanel(VotePanel votepanel) {
		this.votepanel = votepanel;
	}
	//#################### FOR SWOT ##############################
	public void setSwotPanel1(ConfirmTopicSwotPanel confirmTopicSwotpanel) {
		this.confirmTopicSwotpanel = confirmTopicSwotpanel;
	}
	public void setSwotPanel2(CreateTopicSwotPanel createTopicSwotPanel){
		this.createTopicSwotPanel = createTopicSwotPanel;
	}
	public void setSwotPanel3(TextPanel textPanel){
		this.textPanel1 = textPanel;
	}
	public void setSwotPanel4(TextPanel textPanel){
		this.textPanel2 = textPanel;
	}
	//####################################################################
	
	public synchronized ByteArrayOutputStream getPDF() {
    	try {
      	int size = din.readInt();
      	int c = 0;
      	for(int i = 0;i < size;i++) {
        		c = din.read();
        		b.write(c);
      	}
      	dout.writeInt(4);
    	} catch(Exception e) { e.printStackTrace(); }
    	return b;
  	}
  	private void SaveLogFile() throws Exception {
  		// if connection complete save ip address and localhost to inf file
  		FileWriter fw = new FileWriter("config.inf");
		BufferedWriter bw = new BufferedWriter(fw);
				
		bw.write("host ip address = " + conferenceclient.getHostIP()); bw.newLine();
		bw.write("port number = " + conferenceclient.getHostPort()); bw.close();
  	}
  	private void Disconnect() {
  		try {
  			dout.writeInt(2);
  		} catch(Exception e) {}
  	}
  	private void setProjector() {
		try {
			dout.writeInt(18);
			dout.writeInt(7);
			dout.writeInt(pdfpanel.getPageCurrent());
			dout.writeInt(pdfpanel.getScrollBar());
			dout.writeFloat(pdfpanel.getZoom());
		} catch(Exception e) { e.printStackTrace(); }
	}
  	// run method --> start thread
  	// ***************************
	public void run() {
		try {
      	while (true) {
        		processMessage(din.readInt());
      	}
    	} catch (Exception e) {}
    	finally { Disconnect(); }
	}
	private void processMessage(int message) throws Exception {
		switch(message) {
      	case 101 : { doMessage_101(); break; } // create instant for user [chairman/secretary/committee/projector]
      	case 102 : { doMessage_102(); break; } // set to whiteboard
      	case 103 : { doMessage_103(); break; } // get PDF from server and set into pdfpanel
      	case 104 : { doMessage_104(); break; } // set to createvotepanel
      	case 105 : { doMessage_105(); break; } // set topic into votepanel
      	case 106 : { doMessage_106(); break; } // restore panel to prev. panel
      	case 107 : { doMessage_107(); break; } // text: wait for secretary to create vote
      	case 109 : { doMessage_109(); break; } // set topic panel [topicname - filepath]
   
      	//************************************************
      	// Message more then 130 is a message's chairman.
      	//************************************************
      	case 130 : { doMessage_130(); break; } // set permitpanel for get projector from other user
      	case 131 : { doMessage_131(); break; } // other user get permission OK and set ... to projector
      	case 132 : { doMessage_132(); break; } // set summary display for chairman
		case 133 : { doMessage_133(); break; } // chairman cancel vote from secretary
      	//************************************************
      	// Message more then 150, 160 is a message's projector.
      	//************************************************
      	case 150 : { doMessage_150(); break; } // set pdf file to pdf panel
      	case 151 : { doMessage_151(); break; } // set mark on projector [pdfpanel]
      	case 152 : { doMessage_152(); break; } // set mark and set color on projector [whiteboardpanel]
      	case 153 : { doMessage_153(); break; } // set main panel to pdfpanel
      	case 154 : { doMessage_154(); break; } // set main panel to whiteboardpanel
      	case 155 : { doMessage_155(); break; } // clear points on whiteboardpanel
      	case 156 : { doMessage_156(); break; } // set topic into votepanel
      	case 158 : { doMessage_158(); break; } // cancel all permission of user to use projector
      	case 159 : { doMessage_159(); break; } // set vote result to projector for order vote
      	case 160 : { doMessage_160(); break; } // set vote result to projector for weighted vote
      	case 161 : { doMessage_161(); break; } // set vote result to projector for Yes/No vote

      	//************************************************
      	// Message more then 200 is a message's SWOT.
      	//************************************************
      	case 200 : { doMessage_200(); break;} // set to createSwotPanel
      	case 201 : { doMessage_201(); break;} // set topic into swotpanel
      	case 250 : { doMessage_250(); break;} // set topic into swotpanel
      	case 202 : { doMessage_202(); break;} // Load panel secretary wait for Confirm from Chairman
      	case 203 : { doMessage_203(); break;} // Load control swot panel at chaiman windows
     	case 204 : { doMessage_204(); break;} // broadcast topic swot to another usrer
      	case 205 : { doMessage_205(); break;} // Load Strenght Panel @ chairman
      	case 206 : { doMessage_206(); break;} // Load Strenght Panel @ chairman
     	case 207 : { doMessage_207(); break;} // Load Wait for Another user
      	case 208 : { doMessage_208(); break;} // Load Wait for Another user
      	case 209 : { doMessage_209(); break;} // Load Wait for Another user
      		
      	case 222 : { doMessage_222(); break;} // Load Wait for Another user
      	case 223 : { doMessage_223(); break;}// Test show Picture
      	case 224 : { doMessage_224(); break;}// Test show Picture
      	case 225 : { doMessage_225(); break;}// Load for show all 4 summary
     	case 226 : { doMessage_226(); break;}// Load wait panel wait for summary all
      	case 210 : { doMessage_210(); break;}// Test show Picture
      } // End switch
   } // End of processMessage

	//********************************************************************
	//************************* Message Zone *****************************
	public synchronized void doMessage_101() throws Exception {
  		// status
  		tmp = din.readUTF(); // Permission of user[chairman-commitee-etc]

	   	if(tmp.equals("chairman")) {
	   		name = din.readUTF();
  		 	RulePanel.setWelcome(name,"ประธาน");
	      	this.setName(tmp);
		    new Chairman(sock,this);
		    SaveLogFile();
		    conferenceclient.setVisible(false);
	    } else if(tmp.equals("committee")) {
	    	name = din.readUTF();
  		 	RulePanel.setWelcome(name,"กรรมการ");
	      	this.setName(tmp);
	      	new Committee(sock,this);
	      	SaveLogFile();
	    	conferenceclient.setVisible(false);
	    } else if(tmp.equals("secretary")) {
	    	name = din.readUTF();
  		 	RulePanel.setWelcome(name,"เลขานุการ");
	      	this.setName(tmp);
	     	new Secretary(sock,this);
	      	SaveLogFile();
	      	conferenceclient.setVisible(false);
	    } else if(tmp.equals("projector")) {
	    	name = din.readUTF();
  	//	 	RulePanel.setWelcome(name,"โปรเจคเตอร์");
	        this.setName(tmp);
	      	new Projector(sock,this);
	      	SaveLogFile();
	      	conferenceclient.setVisible(false);
	    } else if(tmp.equals("incorrect")) {
	    	msgbox.setText("User or password incorrect",25);
	    	msgbox.showBox();
	    }
  	}
  	public synchronized void doMessage_102() throws Exception {
  		setpdfpanel.setPanel("whiteboard");
      	whiteboardpanel.setFirst(true);
  	}
  	public synchronized void doMessage_103() throws Exception {
  		buff = getPDF();
      	setpdfpanel.setPanel("pdf",buff);
      	setpdfpanel.setPageCurrent(2);
      	setpdfpanel.setMem("pdf");
      	if(pdfpanel.getProjectorStatus()) {
      		dout.writeInt(7);
      		dout.writeInt(1);
			dout.writeInt(0);
			dout.writeFloat(1.5f);
      	}
  	}
  	public synchronized void doMessage_104() throws Exception {
  		String status = din.readUTF();
  		if(status.equals("secretary"))
  		{
  			// For Item of business
  			int sizeArr = din.readInt();
  			String[] itemBusinessArr = new String[sizeArr];
  			for(int i = 0; i < sizeArr; i++)
  				itemBusinessArr[i] = din.readUTF();
  			
  			// For type of vote
  			int sizeArr1 = din.readInt();
  			String[] typeVoteArr = new String[sizeArr1];
  			for(int i = 0; i < sizeArr1; i++)
  				typeVoteArr[i] = din.readUTF();
  			
  			// For all voteName
  			int sizeArr2 = din.readInt();
  			String[] allvname = new String[sizeArr2];
  			for(int i = 0; i < sizeArr2; i++)
  				allvname[i] = din.readUTF();
  				
  			int[] itemNo = new int[sizeArr2];
  			for(int i = 0; i < sizeArr2; i++)
  				itemNo[i] = din.readInt();
  				
  			setpdfpanel.setPanel("cvote");
  			CreateVotePanel.setValue(itemBusinessArr, typeVoteArr, allvname, itemNo);
  		}
  		else if(status.equals("projector"))
  		{
  			setpdfpanel.setPanel("noticeprojector");
  		}
  	}
  	public synchronized void doMessage_105() throws Exception {
  		int voteNo = din.readInt();
  		issNo = din.readInt();
  		int itemNo = din.readInt();
  		String comboItemName = din.readUTF();
  		int x = din.readInt();
  		int voteType = din.readInt();
  		String voteName = din.readUTF();
  		ino = din.readInt();

	    int point = 0;
	    // Closed&Open weighted vote
	    if(voteType == 2 || voteType == 3)
	    	point = din.readInt();

  		votepanel.removeVector();
  		
      	String tmp[] = new String[x];
      	for(int i=0;i<x;i++)
      		tmp[i] = din.readUTF();
		
      	// yes/no vote
   		if(voteType == 0 || voteType == 1)
      		votepanel.setTopic(voteType, voteName, voteNo, issNo,
      							 itemNo, comboItemName, ino);
      	// weighted vote
       	else if(voteType == 2 || voteType == 3)
      		votepanel.setTopicForWeightedVote(tmp, voteType, voteName,
      					voteNo, issNo, itemNo, comboItemName, ino, point, x);
      	// order vote
      	else if(voteType == 4 || voteType == 5)
      		votepanel.setTopicForOrderVote(tmp, voteType, voteName,
      					voteNo, issNo, itemNo, comboItemName, ino, x);
 
      setpdfpanel.setPanel("vote");
  	}
  	public synchronized void doMessage_106() throws Exception {
  		setpdfpanel.restorePanel();
  	}
  	public synchronized void doMessage_107() throws Exception {
  		String stmem = din.readUTF();
  		setpdfpanel.setPanel(stmem);
  	}
  	public synchronized void doMessage_109() throws Exception {
  		String topic,path;
  		MNO = din.readInt();
      	int row = din.readInt();
		for(int i=0;i<row;i++) {
			topic = din.readUTF();
			path = din.readUTF();
			topicpanel.setTopic(topic,path,0,i);
		}
  	} 	
  	
  	//////////////////////////////////////// MSG For Chairman ///////////////////////////////////////////////////
  	public synchronized void doMessage_130() throws Exception {
  		tmp = din.readUTF();
      	PermitPanel.setWhois(tmp);
     	setpdfpanel.setPanel("permit");
  	}
  	public synchronized void doMessage_131() throws Exception {
  		pdfpanel.setProjectorStatus(true);
	   whiteboardpanel.setProjectorStatus(true);
      switch(setpdfpanel.getPageCurrent()) {
	    	case 2 : {
	    		setProjector();
	    		break;
	    	}
	    	case 3 : {
	    		dout.writeInt(19);
	    		dout.writeInt(8);
	    		break;
	    	}
	    }
  	}
  	  	public synchronized void doMessage_132() throws Exception {
  		String meetingName = din.readUTF();
		String itemName = din.readUTF();
		String type = din.readUTF();
		String topic = din.readUTF();
		int itemNoSend = din.readInt();
		String comboItemName = din.readUTF();
		int typeVoteInt = din.readInt();
  		
  		int numChoice = 0;
		int valPoint = 0;		
		String[] tmp = new String[10]; // init max size of choice: may be change later by yourself
		// For weighted vote
  		if(typeVoteInt == 1)	// Weighted vote
  		{
  			numChoice = din.readInt();
			valPoint = din.readInt();
			
			tmp = new String[numChoice];
			for(int i = 0; i < numChoice; i++)
				tmp[i] = din.readUTF();
					
			SummaryWeightedPanel.setTextDisplay(meetingName, itemName, type, topic, 
							itemNoSend, comboItemName, numChoice, valPoint, tmp);
			setpdfpanel.setPanel("summary_w");
  		}
  		else if(typeVoteInt == 2)	// Order vote
  		{
  			numChoice = din.readInt();
			
			tmp = new String[numChoice];
			for(int i = 0; i < numChoice; i++)
				tmp[i] = din.readUTF();
					
			SummaryOrderPanel.setTextDisplay(meetingName, itemName, type, topic, 
							itemNoSend, comboItemName, numChoice, tmp);
			setpdfpanel.setPanel("summary_o");
  		}
  		// For Yes/No vote
  		else
  		{
  			SummaryYesNoPanel.setTextDisplay(meetingName, itemName, type, topic, 
  							itemNoSend, comboItemName);
			setpdfpanel.setPanel("summaryc");
  		}			
  	}
  	
	public synchronized void doMessage_133() throws Exception {	
		String msg = din.readUTF();
		String txt = din.readUTF();
		
		NoticePanel.setTextDisplay(txt, msg);
		setpdfpanel.setPanel("notice");		
	}
  	public synchronized void doMessage_150() throws Exception {
  		int page = din.readInt();
		int scroll = din.readInt();
		Float zoom = din.readFloat();
		pdfpanel.setPage(page);
		pdfpanel.setScrollBar(scroll);
		pdfpanel.setZoom(zoom);
		setpdfpanel.setPanel("pdf");
  	}
  	public synchronized void doMessage_151() throws Exception {
  		int x = din.readInt();
		int y = din.readInt();
		pdfpanel.MarkProjector(x,y);
  	}
  	public synchronized void doMessage_152() throws Exception {
  		int x = din.readInt();
      int y = din.readInt();
      int r = din.readInt();
      int g = din.readInt();
      int b = din.readInt();
      Color c = new Color(r,g,b);
      whiteboardpanel.MarkProjector(x,y,c);
  	}
  	public synchronized void doMessage_153() throws Exception {
  		setpdfpanel.setPanel("pdf");
  	}
  	public synchronized void doMessage_154() throws Exception {
  		whiteboardpanel.setFirst(true);
      setpdfpanel.setPanel("whiteboard");
  	}
  	public synchronized void doMessage_155() throws Exception {
  		whiteboardpanel.ClearPoints();
  	}
  	public synchronized void doMessage_156() throws Exception {
      int voteNo = din.readInt();
      issNo = din.readInt();
      int itemNo = din.readInt();
      String comboItemName = din.readUTF();
      int x = din.readInt();
      int voteType = din.readInt();
      String voteName = din.readUTF();
      int ino = din.readInt();
  		
      int point = 0;
      // Closed&Open weighted vote
      if(voteType == 2 || voteType == 3)
      	point = din.readInt();
      
      votepanel.removeVector();
      String tmp[] = new String[x];

      for(int i=0;i<x;i++)
      	tmp[i] = din.readUTF();
      	
      	// yes/ no vote
      	if(voteType == 0 || voteType == 1)
      		votepanel.setProjectorTopic(tmp, voteName);
      	// weighted vote
      	else if(voteType == 2 || voteType == 3)
      		votepanel.setProjectorTopicWeightedVote(tmp, point, voteName);
      	// order vote
      	else if(voteType == 4 || voteType == 5)
      		votepanel.setProjectorTopicOrderVote(tmp, voteName);

      setpdfpanel.setPanel("vote");
  	}

  	public synchronized void doMessage_158() throws Exception {
  		pdfpanel.setProjectorStatus(false);
	   	whiteboardpanel.setProjectorStatus(false);
  	}
  	public synchronized void doMessage_159() throws Exception {
  		int numChoice = din.readInt();
  		String vname = din.readUTF();
  		int numC = din.readInt();
  		
      	String result[] = new String[numChoice];
  		for(int i = 0; i < numChoice; i++)
  			result[i] = din.readUTF();				// result of vote (max->min)
  		
      	votepanel.setVoteResultForOrderVote(numChoice, vname, result, issNo);
  	}
  	public synchronized void doMessage_160() throws Exception {
  		int numChoice = din.readInt();		// Number of choices
  		String vname = din.readUTF();		// Vote name(Topic of vote)
  		int numC = din.readInt();			// Number of committee
 		String[] tmpIssNo =  new String[numChoice];
 		for(int i = 0; i < numChoice; i++)
 			tmpIssNo[i] = din.readUTF();
 		int[] totalRes =  new int[numChoice];
 		for(int i = 0; i < numChoice; i++)
 			totalRes[i] = din.readInt();
 			
      	votepanel.setVoteResultForWeightedVote(numChoice, vname, tmpIssNo, totalRes);    							
  	}
  	
  	public synchronized void doMessage_161() throws Exception {
  		int v = din.readInt();			// user chooses a choice
  		String v_name = din.readUTF();
  		int numC = din.readInt();				// Number of committee
  		
  		if(v == 0)
			yes_result++;
		else if(v == 1)
			no_result++;
  		
  		int syes = yes_result;
  		int sno = no_result;
  		
  		// if the last committee is voted then write data in VOTE_RESULT table
  		if(numCommittee == numC - 2)
  		{
			wrDB = true;
			yes_result = 0;
			no_result = 0;
			numCommittee = 0;
  		}
  		else
  		{
  			wrDB = false;
  			numCommittee++;
  		}

  		votepanel.setVoteResultForYesNoVote( wrDB, syes, sno, v_name);
  	}
  	
	//######### MESSAGE FOR SWOT ####################################
  	// Load Panel which get panelName from ServerThread and set panelName from that
  		public synchronized void doMessage_200() throws Exception {
    	String panelName = din.readUTF();
    	String pictureName = din.readUTF();
    	int check = din.readInt();
    	
    	setpdfpanel.setMenuSwotPanel();
    	
    	if(check==2){
    		setpdfpanel.setPanel(panelName);
   	   	} else{
   	   		picturePanel1.setPictureDisplay(pictureName);
   	   		setpdfpanel.setPanel("picturepanel");
   	   	}
  	}
  	public synchronized void doMessage_202() throws Exception {
  		String topic = din.readUTF();
  		String	sessionName = din.readUTF();
  	
  		if(sessionName.equals("s")){
  			confirmSessionPanel.setTopic(topic);  			  			
  			confirmSessionPanel.setPictureConfirmSession("confirmSessionStrenght.png");
  			setpdfpanel.setPanel("confirmSessionStrenght");
  		} else if (sessionName.equals("w")){
  			confirmSessionPanel.setTopic(topic);  			  			
  			confirmSessionPanel.setPictureConfirmSession("confirmSessionWeakness.png");
  			setpdfpanel.setPanel("confirmSessionStrenght");
   	   	} else if (sessionName.equals("o")){
  			confirmSessionPanel.setTopic(topic);  			  			
  			confirmSessionPanel.setPictureConfirmSession("confirmSessionOpportunities.png");
  			setpdfpanel.setPanel("confirmSessionStrenght");
  		} else if (sessionName.equals("t")) {
  			confirmSessionPanel.setTopic(topic);  			  			
  			confirmSessionPanel.setPictureConfirmSession("confirmSessionThread.png");
  			setpdfpanel.setPanel("confirmSessionStrenght");
  		}
  	}
  	public synchronized void doMessage_201() throws Exception {
  		String topicName =  din.readUTF();
      	confirmTopicSwotpanel.setTopic(topicName);
     	 setpdfpanel.setPanel("confirmtopicswot");
  	}
  	// 206 Test show Picture
  	public synchronized void doMessage_206() throws Exception {
  		String picDisplay = din.readUTF();
    	picturePanel1.setPictureDisplay(picDisplay);
   	   	setpdfpanel.setPanel("picturepanel");
  	}
  	public synchronized void doMessage_207() throws Exception {
        setpdfpanel.setPanel("rule");
  	}
  	public synchronized void doMessage_208() throws Exception {
     		Vector tem = new Vector();
  			int loop = 	din.readInt();
  			for(int i = 0 ; i < loop ; i++)
  				tem.addElement(din.readUTF());
  		
  			setpdfpanel.setNumberOfSelectedSuggestion("sss",tem);
  	}
  	public synchronized void doMessage_209() throws Exception {
     		Vector tem = new Vector();
  			int loop = 	din.readInt();
  			for(int i = 0 ; i < loop ; i++)
  				tem.addElement(din.readUTF());
  				
  			String yLabel = din.readUTF();
			int    yMax = din.readInt();
			int    yMin = din.readInt();
			String rLabel = din.readUTF();
			int	   rMax = din.readInt();
			int    rMin = din.readInt();
			
  			setpdfpanel.setEvaluatePanel("evaluate",tem,yLabel,yMax,yMin,rLabel,rMax,rMin);
  	}
  	public synchronized void doMessage_210() throws Exception {
			int  checkStatus  = din.readInt();
			if(checkStatus != 1)			
				setpdfpanel.setPanel("waitForNextSession");
  	}
  	// Load Control SWOT Panel @ Chairman windows
  	public synchronized void doMessage_203() throws Exception {
  		String topicSwot = din.readUTF();
  		votepanel.removeVector();
  		controlSwotPanel.setTopic(topicSwot);
        setpdfpanel.setPanel("ctrlswotpanel");
  	}  	
  	public synchronized void doMessage_204() throws Exception {
  		String textToDisplay1 = din.readUTF();
  			
  		votepanel.removeVector();
      	textPanel2.setTextDisplay("การวิเคราะห์สถานะและสถานการณ์ เรื่อง",textToDisplay1);
   	    setpdfpanel.setPanel("showtext");
  	}
  	//------- Load StrenghtSwot Panel
  	public synchronized void doMessage_205() throws Exception {
  		
  	//*********************************************************
  	
  		String sessionPicture = din.readUTF();		
  		strenghtSwotPanel.setPictureDisplay(sessionPicture);
  		setpdfpanel.setPanel("strenghtSwot");
  		
  	//*********************************************************
  	
  	}
  	public synchronized void doMessage_222() throws Exception {
  		String tp = din.readUTF();
  		String suggestion1 = din.readUTF();
  		String suggestion2 = din.readUTF();
  		String suggestion3 = din.readUTF();
  		
  		confirmSuggestionPanel.setTextDisplay(suggestion1,suggestion2,suggestion3);
  		confirmSuggestionPanel.setPictureDisplay("confirmSuggestionStrenght.png");
  		setpdfpanel.setPanel("confirmSuggestionPanel");
  	}
  	public synchronized void doMessage_224() throws Exception {
  			Vector sug = new Vector();
  			Vector pri = new Vector();
  			Vector pos = new Vector();
  			Vector cos = new Vector();
  			
  			int loop = 	din.readInt();
  			for(int i = 0 ; i < loop ; i++){
  				sug.addElement(din.readUTF());
  				pri.addElement(din.readUTF());
  				pos.addElement(din.readUTF());
  				cos.addElement(din.readUTF());
  			}
  			
			String aYAxisName = din.readUTF();
			int    yMax = din.readInt();
			int    yMin = din.readInt();
			String aRAxisName = din.readUTF();
			int	   rMax = din.readInt();
			int    rMin = din.readInt();
			
  			setpdfpanel.setSummarySessionPanel("summarySessionPanel", sug,pri, pos ,  cos , aYAxisName, 
  																			yMax, yMin, aRAxisName, rMax, rMin);
  	}
   public synchronized void doMessage_223() throws Exception {
  			Vector tem = new Vector();
  			
  			int loop = 	din.readInt();
  			for(int i = 0 ; i < loop ; i++)
  				tem.addElement(din.readUTF());
  		
  		    setpdfpanel.setNumberOfSuggetion("showAll",tem);
  	}
  	
  	public synchronized void doMessage_225() throws Exception {
 		
 			
  Vector SuggestionS = new Vector();
  Vector PriorityValueS = new Vector();
  Vector PosibilityValueS = new Vector();
  Vector CostValueS = new Vector();

  	
 Vector SuggestionW = new Vector();
 Vector PriorityValueW = new Vector();
 Vector PosibilityValueW = new Vector();
 Vector CostValueW = new Vector();

  	
 Vector SuggestionO = new Vector();
 Vector PriorityValueO = new Vector();
 Vector PosibilityValueO = new Vector();
 Vector CostValueO = new Vector();

  	
  Vector SuggestionT = new Vector();
  Vector PriorityValueT = new Vector();
  Vector PosibilityValueT = new Vector();
  Vector CostValueT = new Vector();

 		
 		//--------- Strenght -----------------
 		
 		int loop = 	din.readInt();
		for(int i = 0 ; i < loop ; i++){
			SuggestionS.addElement(din.readUTF());
			PriorityValueS.addElement(din.readUTF());
			PosibilityValueS.addElement(din.readUTF());
			CostValueS.addElement(din.readUTF());
		}
		String yLabelS = din.readUTF();
  		int yMaxS = din.readInt();
  		int yMinS = din.readInt();
  		String rLabelS = din.readUTF();
  		int rMaxS = din.readInt();
  		int rMinS = din.readInt();
		
		//--------Weakness---------------------	
 		
 		loop = 	din.readInt();
		for(int i = 0 ; i < loop ; i++){
			SuggestionW.addElement(din.readUTF());
			PriorityValueW.addElement(din.readUTF());
			PosibilityValueW.addElement(din.readUTF());
			CostValueW.addElement(din.readUTF());
		}
		String yLabelW = din.readUTF();
  		int yMaxW = din.readInt();
  		int yMinW = din.readInt();
  		String rLabelW = din.readUTF();
  		int rMaxW = din.readInt();
  		int rMinW = din.readInt();
 		
 		//--------Opportunities ----------------------
 		
 		loop = 	din.readInt();
		for(int i = 0 ; i < loop ; i++){
			SuggestionO.addElement(din.readUTF());
			PriorityValueO.addElement(din.readUTF());
			PosibilityValueO.addElement(din.readUTF());
			CostValueO.addElement(din.readUTF());
		}
		String yLabelO = din.readUTF();
  		int yMaxO = din.readInt();
  		int yMinO = din.readInt();
  		String rLabelO = din.readUTF();
  		int rMaxO = din.readInt();
  		int rMinO = din.readInt();
 		
 		//--------- Thread ---------------------
 		
 		loop = 	din.readInt();
		for(int i = 0 ; i < loop ; i++){
			SuggestionT.addElement(din.readUTF());
			PriorityValueT.addElement(din.readUTF());
			PosibilityValueT.addElement(din.readUTF());
			CostValueT.addElement(din.readUTF());
		}
		String yLabelT = din.readUTF();
  		int yMaxT = din.readInt();
  		int yMinT = din.readInt();
  		String rLabelT = din.readUTF();
  		int rMaxT = din.readInt();
  		int rMinT = din.readInt();
  		
  		 		
  		
  		setpdfpanel.setSummary4SessionPanel("summary4SessionPanel",SuggestionS,PriorityValueS,PosibilityValueS,CostValueS,yLabelS,yMaxS,yMinS,rLabelS,rMaxS,rMinS,
 									                                SuggestionW,PriorityValueW,PosibilityValueW,CostValueW,yLabelW,yMaxW,yMinW,rLabelW,rMaxW,rMinW,
 									                                SuggestionO,PriorityValueO,PosibilityValueO,CostValueO,yLabelO,yMaxO,yMinO,rLabelO,rMaxO,rMinO,					
																	SuggestionT,PriorityValueT,PosibilityValueT,CostValueT,yLabelT,yMaxT,yMinT,rLabelT,rMaxT,rMinT);																
  	}
 
 
 	public synchronized void doMessage_226() throws Exception {
			
				setpdfpanel.setPanel("waitForAllSummary");
  	}
  	
  	public synchronized void doMessage_250() throws Exception {
      int x = din.readInt();
      votepanel.removeVector();
      String tmp[] = new String[x];
      for(int i=0;i<x;i++) {
      	tmp[i] = din.readUTF();
      votepanel.setProjectorTopicSwot(tmp[i],i);
      }
      setpdfpanel.setPanel("vote");
  	}
	//************************* End of Message ***************************
	//********************************************************************
} // End of class