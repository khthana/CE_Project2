import java.io.*;
import java.net.*;
import java.util.Date;
import java.sql.*;
import java.text.*;
import java.util.*;

public class ServerThread extends Thread {
	private Socket sock;
  	protected DataInputStream ddin;
  	protected DataOutputStream ddout;
  	private ByteArrayOutputStream b = new ByteArrayOutputStream();
  	private ByteArrayOutputStream buffer = new ByteArrayOutputStream();
  	private Vector clients;
  	private int x = 0,y = 0,rr = 0,gg = 0,bb = 0;
  	private String user,password,sql,tmp;
  	private ConnectionDatabase cb;
  	private ResultSet r;
  	private byte[] buff;
  	private boolean isFirst = false;
  	private ServerThread projectorthread,chairmanthread;
  	private String status;
  	private int page,scroll,num, voteType, point;
  	private float zoom;
  	private String suser,spassword,sdatabase;
  	private int MeetID = 0;
  	private String day = "",month = "",year = "";
  	private static int count = 0;
  	private static int yes_result = 0;
	private static int no_result = 0;
	private static int[] weighted_res, order_res;
	private static int numCommittee = 0;
	private static boolean wrDB = false;
  	
  	private ItemOfBusinessPanel itempanel;
  	private String[] itemBusinessArr, typeVoteArr, topicOfVote, tmpIssNo;
  	private static String[] result_arrange;
  	private TypeVotePanel typevotepanel;
  	private int[] itemNo ;
  	private String meetingName, itemName, type, comboItemName, topic;
  	private int voteNo, issNo;
  	
  	//############### FOR SWOT ####################################
  	private static String topicName = new String("");
  	private static int numberOfSuggested = 1;
  	private static Vector suggestion = new Vector();
  	private static Vector vectorSug = new Vector();
  	private static Vector vectorPri = new Vector();
  	private static Vector vectorPos = new Vector();
  	private static Vector vectorCos = new Vector();
  	
  	private static  int priValue[];
  	private static  int posValue[];
  	private static  int cosValue[];	
  	private static  int statusSession = 0;
  	
  	//****************************************************************
  	
  	
  	private static String typeOfSession[] = {"s","w","o","t"};
  	private static String thisSessionIs = "";
  	private static int countSwot = 0;
  	
  	
  	private static Vector vectorOfAllSuggestionS = new Vector();
  	private static Vector vectorOfAllPriorityValueS = new Vector();
  	private static Vector vectorOfAllPosibilityValueS = new Vector();
  	private static Vector vectorOfAllCostValueS = new Vector();
  	private static  String yLabelS = "";
  	private static  int yMaxS ;
  	private static  int yMinS ;
  	private static  String rLabelS ;
  	private static  int rMaxS ;
  	private static  int rMinS ;
  	
  	
  	private static Vector vectorOfAllSuggestionW = new Vector();
  	private static Vector vectorOfAllPriorityValueW = new Vector();
  	private static Vector vectorOfAllPosibilityValueW = new Vector();
  	private static Vector vectorOfAllCostValueW = new Vector();
  	private static  String yLabelW = "";
  	private static  int yMaxW ;
  	private static  int yMinW ;
  	private static  String rLabelW = "";
  	private static  int rMaxW ;
  	private static  int rMinW ;
  	
  	
  	private static Vector vectorOfAllSuggestionO = new Vector();
  	private static Vector vectorOfAllPriorityValueO = new Vector();
  	private static Vector vectorOfAllPosibilityValueO = new Vector();
  	private static Vector vectorOfAllCostValueO = new Vector();
  	private static  String yLabelO = "";
  	private static  int yMaxO ;
  	private static  int yMinO ;
  	private static  String rLabelO = "";
  	private static  int rMaxO ;
  	private static  int rMinO ;
  	
  	
  	private static Vector vectorOfAllSuggestionT = new Vector();
  	private static Vector vectorOfAllPriorityValueT = new Vector();
  	private static Vector vectorOfAllPosibilityValueT = new Vector();
  	private static Vector vectorOfAllCostValueT = new Vector();
  	private static  String yLabelT = "";
  	private static  int yMaxT ;
  	private static  int yMinT ;
  	private static  String rLabelT = "";
  	private static  int rMaxT ;
  	private static  int rMinT;
  	
  	
  	
  	//*****************************************************************
  	
  	//###########################################################
  	
  	// Constructor
  	public ServerThread(Socket socks,Vector clients) 
  	{
    	this.sock = socks; 
    	this.clients = clients;
    	
    	try 
    	{
      		ddin = new DataInputStream(sock.getInputStream());
      		ddout = new DataOutputStream(sock.getOutputStream());
      	
      		FileReader fr = new FileReader("config.inf");
			BufferedReader br = new BufferedReader(fr);
			tmp = br.readLine(); suser = tmp.substring(12);
			tmp = br.readLine(); spassword = tmp.substring(11);
			tmp = br.readLine(); sdatabase = tmp.substring(16);
			br.close();
		
      		cb = new ConnectionDatabase(suser,spassword,sdatabase);
    	} 
    	catch(Exception e) 
    	{ e.printStackTrace(); }
  	}
  	// read file from pdf file to byte[]
  	private byte[] OpenPDFStream(String filename) throws Exception {
    	FileInputStream file = new FileInputStream(filename);
    	int filesize = file.available();
    	byte[] bytedata = new byte[filesize];
    	file.read(bytedata,0,filesize);
    	file.close();
    	return bytedata;
  	}
  	// Disconnect client
  	private void Disconnect() 
  	{
    	try 
    	{
      		synchronized (clients) 
      		{ clients.remove(this);	}
      		
      		ConferenceServer.setNumberOfClient(clients.size());
      		ConferenceServer.removeClient(this.getName());
    	} 
    	catch(Exception e) {}
  	}
  	// Boardcast x,y from whiteboard client
  	private synchronized void BoardCastToProjector(int x,int y,int message) throws IOException {
  		if(projectorthread != null) {
  			projectorthread.ddout.writeInt(message);
      	projectorthread.ddout.writeInt(x);
      	projectorthread.ddout.writeInt(y);
  		} else { System.out.println("Projector Thread Null !!"); }	
  	}
  	// read data from pdfpanel mark()
  	private synchronized void ReadDataXY() throws IOException {
  		x = ddin.readInt();
      	y = ddin.readInt();
  	}
  	// send file pdf to client
  	public synchronized void sendPdf(int msg) throws Exception {
  		tmp = ddin.readUTF();
  	//	System.out.println("Tmp = " + tmp);
  		buff = OpenPDFStream(tmp);
      	ConferenceServer.setLogMessage(msg + " :: ส่งเอกสารให้ " + getName() + " [" + buff.length + "]");
      	ddout.writeInt(103);
      	ddout.writeInt(buff.length);
      	ddout.write(buff);
  	}
  	public synchronized void sendPdf() throws Exception {
  		if(projectorthread != null) {
      		projectorthread.ddout.writeInt(103);
      		projectorthread.ddout.writeInt(buff.length);
      		projectorthread.ddout.write(buff);
      	} else { System.out.println("Projector Thread Null !!"); }
  	}
  	// get pdf file to save ^^
  	public synchronized ByteArrayOutputStream getPDF() {
    	try {
      		int size = ddin.readInt();
      		int c = 0;
      		for(int i = 0;i < size;i++) {
        		c = ddin.read();
        		b.write(c);
      		}
    	} 
    	catch(Exception e) { e.printStackTrace(); }
    	return b;
  	}
  	private void setDate() {
  		Date now = new Date();
		DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
		String date = df.format(now);
  		
  		if(date.charAt(1) == '/') day = "0" + date.charAt(0);
      	else day = date.charAt(0) + "" + date.charAt(1);
		
		if(date.charAt(2) == '/' && date.charAt(4) == '/') month = "0" + date.charAt(3);
		else if(date.charAt(1) == '/' && date.charAt(3) == '/') month = "0" + date.charAt(2);
		else if(date.charAt(1) == '/' && date.charAt(4) == '/') month = date.charAt(2) + "" + date.charAt(3);
      	else month = date.charAt(3) + "" + date.charAt(4);
		year = date.substring(date.length() - 4);
  	}
  	// main method for thread
  	public void run() {
    	try 
    	{
      		while (true) 
      		{
      			processMessage(ddin.readInt()); 
      		}
    	}
    	catch (Exception e) { }
    	finally { Disconnect(); }
  	} // End method run
  	// Dispatch message from client
  	private void processMessage(int message) {
    	try {
      	switch (message) {
        	case 1: { doMessage_1(message); break; } // Connection
        	case 2: { doMessage_2(message); break; } // Disconnect
        	case 3: { doMessage_3(message); break; } // Send PDF
        	case 4: { doMessage_4(message); break; } // Ack from client .... file Transfer complete
        	case 5: { doMessage_5(); break; } // Boardcast whiteboardpanel mark point
        	case 6: { doMessage_6(); break; } // set mark points to projector
        	case 7: { doMessage_7(message); break; } // Set projector PdfPnael
        	case 8: { doMessage_8(message); break; } // Set projector WhiteboardPanel
        	case 9: { doMessage_9(message); break; } // Send topic for open conference system
        	case 10: { doMessage_10(message); break; }  // set display panel of projector to pdf pnael
        	case 11: { doMessage_11(message); break; }  // set display panel of projector to whiteboard panel
        	case 12: { doMessage_12(message); break; } // clear point x,y = null in array point[]
        	case 13: { doMessage_13(message); break; } // get projector from chairman
        	case 14: { doMessage_14(message); break; } // chairman permission OK!!
        	case 15: { doMessage_15(message); break; } // Chairman require Secretary create vote
        	case 16: { doMessage_16(message); break; } // Recive vote topic and boardcast to all user
        	case 17: { doMessage_17(message); break; } // Open yes/no Vote from client
        	case 18: { doMessage_18(message); break; } // set isFirst = true for send pdf stream again
        	case 19: { doMessage_19(message); break; } // set permisson of projector all user [not me]
        	case 20: { doMessage_20(message); break; } // set permisson of projector all user
        	case 21: { doMessage_21(message); break; }
        	case 22: { doMessage_22(message); break; } // similar message 17 : for Closed order vote
        	case 23: { doMessage_23(message); break; } // similar message 17 : for Closed weighted vote
      		case 24: { doMessage_24(message); break; } // Closed yes/no Vote from client
      		case 25: { doMessage_25(message); break; } // similar message 17 : for Open weighted vote
      		case 26: { doMessage_26(message); break; } // similar message 17 : for Open order vote
			case 27: { doMessage_27(message); break; } // Display summary of create vote for chairman
			case 28: { doMessage_28(message); break; } // Chairman canceled this vote
			case 29: { doMessage_29(message); break; } // Chairman want to recreate vote
			case 30: { doMessage_30(message); break; } // Notice secretary for cancel/recreate vote

			// FOR SWOT  	
        	case 71: { doMessage_71(message); break; }// Recive swot topic and boardcast to all user        	
        	case 72: { doMessage_72(message); break; }// Chairman Start to Swot Analysis After confirm topic from secretary
        	case 73: { doMessage_73(message); break; }// Broadcast Swot topic to all user After confirm topic from chairman        	
        	case 74: { doMessage_74(message); break; }// Broadcast Swot topic to all user After confirm topic from chairman      	
        	case 75: { doMessage_75(message); break; }// Broadcast Swot topic to all user After confirm topic from chairman
        	case 76: { doMessage_76(message); break; }// Broadcast Swot topic to all user After confirm topic from chairman
        	case 77: { doMessage_77(message); break; }// load page show suggest for confirm
        	case 78: { doMessage_78(message); break; }// wait for another give suggetion and check for already to next step
        	case 79: { doMessage_79(message); break; }// wait for another give suggetion and check for already to next step
        	case 80: { doMessage_80(message); break; }// wait for another give suggetion and check for already to next step
  			case 82: { doMessage_82(message); break; }// wait for another give suggetion and check for already to next step
        	case 83: { doMessage_83(message); break; }// wait for another give suggetion and check for already to next step
			} // End switch
    	} catch (Exception e) { e.printStackTrace(); }
  	} // Enf of processMessage
  	
  	
  	//********************************************************************
  	//************************* Message Zone *****************************
  	
  	public synchronized void doMessage_1(int message) throws Exception {
  		try {
        	user = ddin.readUTF();
        	password = ddin.readUTF();
        	
        	sql = "select MemberName,MemberSurname,Granted from member where UserName = '" + user + "' and PassWord = '" + password + "'";
    		r = cb.Query(sql); r.next();
    		status = r.getString(3);
    		setName(r.getString(1) + "   " + r.getString(2));
    		ddout.writeInt(101);
    		ddout.writeUTF(status); // send permission to client
    		ddout.writeUTF(r.getString(1) + "   " + r.getString(2));

    		ConferenceServer.setLogMessage(message + " :: " + this.getName() + " เชื่อมต่อเข้าสู่ระบบ");
    		ConferenceServer.setNameClient(this.getName());
         	ConferenceServer.setNumberOfClient(clients.size());
        } catch(SQLException e) { ddout.writeInt(101); ddout.writeUTF("ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง"); }
  	}
  	public synchronized void doMessage_2(int message) throws Exception {
  		ConferenceServer.setLogMessage(message + " :: " + this.getName() + " ออกจากระบบ");
      ddin.close(); ddout.close(); sock.close();
  	}
  	public synchronized void doMessage_3(int message) throws Exception {
  		sendPdf(message);
      	isFirst = true;
  	}
  	public synchronized void doMessage_4(int message) throws Exception {
  		ConferenceServer.setLogMessage(message + " :: การส่งไฟล์เสร็จสมบูรณ์");
  	}
  	public synchronized void doMessage_5() throws Exception {
		x = ddin.readInt();
      	y = ddin.readInt();
      	rr = ddin.readInt();
     	gg = ddin.readInt();
      	bb = ddin.readInt();
      	projectorthread.ddout.writeInt(152);
      	projectorthread.ddout.writeInt(x);
      	projectorthread.ddout.writeInt(y);
      	projectorthread.ddout.writeInt(rr);
      	projectorthread.ddout.writeInt(gg);
      	projectorthread.ddout.writeInt(bb);
  	}
  	public synchronized void doMessage_6() throws Exception {
  		ReadDataXY();
      	BoardCastToProjector(x,y,151);
  	}
  	public synchronized void doMessage_7(int message) throws Exception {
  		page = ddin.readInt();
		scroll = ddin.readInt();
		zoom = ddin.readFloat();
				
		if(projectorthread == null) {
			for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);
				if(thread.status.equals("projector")) {
      			projectorthread = thread;
      			break;
				}
			}
		}
		if(isFirst) {
      	sendPdf();
      	isFirst = false;
      }
      for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if(!thread.status.equals("projector") && thread != this) {
      		thread.ddout.writeInt(158);
			}
		}
      projectorthread.ddout.writeInt(150);
      projectorthread.ddout.writeInt(page);
      projectorthread.ddout.writeInt(scroll);
      projectorthread.ddout.writeFloat(zoom);
      ConferenceServer.setLogMessage(message + " :: " + this.getName() + " กำหนดการใช้งานไฟล์ PDF ให้กับโปรเจคเตอร์");
  	}
  	public synchronized void doMessage_8(int message) throws Exception {
  		if(projectorthread == null) {
			for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);
				if(thread.status.equals("projector")) {
      			projectorthread = thread;
      			break;
				}
			}
		}
		projectorthread.ddout.writeInt(102);
		ConferenceServer.setLogMessage(message + " :: " + this.getName() + " ใช้โปรเจคเตอร์");
  	}
  	public synchronized void doMessage_9(int message) throws Exception {
  		try {
  		//	System.out.println("9 : Get Topic.");
        	setDate();
        //	sql = "select MeetID from preparemeeting where d = " + day + " and m = " + month + " and y = " + year;
        	sql = "select MNO from MEETING where DATE = " + day + " and MONTH = " + month + " and YEAR = " + year;
        	r = cb.Query(sql); 
        	r.first();
        	MeetID = r.getInt(1);

        	sql = "select hTopic,PathFile from pathmeeting where MeetId = " + MeetID;
        	r = cb.Query(sql); 
        	r.last();
        	
        	int row = r.getRow();
        	ConferenceServer.setLogMessage(message + " :: ส่ง " + row + " หัวข้อสำหรับการเปิดประชุม");
        	ddout.writeInt(109);
        	ddout.writeInt(MeetID);
        	ddout.writeInt(row); 
        	r.first(); // send loop for client to get topic
        	// Write first row
        	ddout.writeUTF(r.getString(1)); // Topic name
      		ddout.writeUTF(r.getString(2)); // Path of pdf file
			while(r.next()) {
				ddout.writeUTF(r.getString(1)); // Topic name
      		ddout.writeUTF(r.getString(2)); // Path of pdf file
			}
      } catch(SQLException e) { e.printStackTrace(); }
  	}
  	public synchronized void doMessage_10(int message) throws Exception {
  		if(projectorthread == null) {
			for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);
				if(thread.status.equals("projector")) {
      			projectorthread = thread;
      			break;
				}
			}
		}
      projectorthread.ddout.writeInt(153);
      ConferenceServer.setLogMessage(message + " :: " + this.getName() + " กำหนดการใช้งานไฟล์ PDF ให้กับโปรเจคเตอร์");
  	}
  	public synchronized void doMessage_11(int message) throws Exception {
  		if(projectorthread == null) {
			for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);
				if(thread.status.equals("projector")) {
      			projectorthread = thread;
      			break;
				}
			}
		}
      projectorthread.ddout.writeInt(154);
      ConferenceServer.setLogMessage(message + " :: " + this.getName() + " กำหนดหน้าจอไวท์บอร์ดให้กับโปรเจคเตอร์");
  	}
  	public synchronized void doMessage_12(int message) throws Exception {
  		if(projectorthread == null) {
			for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);
				if(thread.status.equals("projector")) {
      			projectorthread = thread;
      			break;
				}
			}
		}
      projectorthread.ddout.writeInt(155);
      ConferenceServer.setLogMessage(message + " :: " + this.getName() + " ลบเครื่องหมายบนหน้าจอของโปรเจคเตอร์");
  	}
  	public synchronized void doMessage_13(int message) throws Exception {
  		if(chairmanthread == null) {
        	for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);
				if(thread.status.equals("chairman")) {
	      		chairmanthread = thread;
	      		break;
				}
			}
       }
       chairmanthread.ddout.writeInt(130);
       chairmanthread.ddout.writeUTF(this.getName());
       ConferenceServer.setLogMessage(message + " :: " + this.getName() + " รอการอนุญาตจากประธานให้ใช้โปรเจคเตอร์");
  	}
  	public synchronized void doMessage_14(int message) throws Exception {
  		tmp = ddin.readUTF();
  		doMessage_20(20);
      for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if(thread.getName().equals(tmp)) {
	      	thread.ddout.writeInt(131);
	      	isFirst = true;
	      	break;
			}
		}
		ConferenceServer.setLogMessage(message + " :: " + this.getName() + " ได้รับสิทธิในการใช้งานโปรเจคเตอร์");
  	}
  	public synchronized void doMessage_15(int message) throws Exception {
  		for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if(thread.status.equals("secretary")) {
		      	thread.ddout.writeInt(104);
		      	thread.ddout.writeUTF("secretary");
				///////// Item of Business //////////////////////////////////////////////////
		      	itempanel = new ItemOfBusinessPanel();
		      	itemBusinessArr = itempanel.setItemCombo(MeetID);
		      	
		      	thread.ddout.writeInt(itemBusinessArr.length);
		      	for(int j = 0; j < itemBusinessArr.length; j++)
		      		thread.ddout.writeUTF(itemBusinessArr[j]);
		      	////////////////////////////////////////////////////////////////////////////////////////////////////
		      	//////////////////////////////// Type of vote //////////////////////////////////////////////
		      	typevotepanel = new TypeVotePanel();
	 			typeVoteArr = typevotepanel.setTypeVote();
	 			
	 			thread.ddout.writeInt(typeVoteArr.length);
		      	for(int j = 0; j < typeVoteArr.length; j++)
		      		thread.ddout.writeUTF(typeVoteArr[j]);
		      	////////////////////////////////////////////////////////////////////////////////////////////////////
		      	//////////////////////////////// VoteName //////////////////////////////////////////////
				try	{
					sql = "select count(*) from vote";
					r = cb.Query(sql);
					r.next();
					int countVote = r.getInt(1);
			
					sql = "select * from vote";
					r = cb.Query(sql);
					topicOfVote = new String[countVote];
					itemNo = new int[countVote];
					for(int k = 0; k < countVote; k++)
					{
						r.next();
						topicOfVote[k] = r.getString(2);
						itemNo[k] = r.getInt(6);
					}
					} catch(SQLException e)
						{	System.out.println(e); 		}
			
			      	thread.ddout.writeInt(topicOfVote.length);
			      	for(int j = 0; j < topicOfVote.length; j++)
			      		thread.ddout.writeUTF(topicOfVote[j]);
			      		
			      	for(int j = 0; j < itemNo.length; j++)
			      		thread.ddout.writeInt(itemNo[j]);
			}
				
			if(thread.status.equals("projector")) {
	      	thread.ddout.writeInt(104);
	      	thread.ddout.writeUTF("projector");
	//      	break;
			}
		}	
		ConferenceServer.setLogMessage(message + " :: ประธานต้องการให้เลขานุการสร้างหัวข้อการลงมติ");
  	}
  	
  	public synchronized void doMessage_16(int message) throws Exception {
  		int voteNo = ddin.readInt();			// Number of vote topic
  		int itemNo = ddin.readInt();			// Number of Item of business that choosed from combobox
  		String comboItemName = ddin.readUTF();	// Item of business(not number)
  		num = ddin.readInt();					// Number of choice
  		voteType = ddin.readInt();				// type of vote(1 = yes/no, 2 = weighted, 3 = order)
 		String voteName = ddin.readUTF();		// vote topic(not number)		

  		// case: Closed&Open Weighted vote
  		if(voteType == 2 || voteType == 3)
  			point = ddin.readInt();
  		else
  			point = 0;
  	
     	String tmp[] = new String[num];
     	
     	// read all choice from stream
      	for(int i=0;i<num;i++)
      		tmp[i] = ddin.readUTF();
      	
      	///////////////// WRITE INTO DB //////////////////////////////////////////////////
      	// yes/no vote don't have a screen for setting about topic yes or no
 		// we will create automatically!
      	String cp_ind = "";
		if((voteType == 0) || (voteType == 2) || (voteType == 4))
			cp_ind = "ลับ";
		else if((voteType == 1) || (voteType == 3) || (voteType == 5))
			cp_ind = "เปิดเผย";
				
      	sql = "select count(*) from item_business";
		r = cb.Query(sql); 
		r.next();
		int loopItem = r.getInt(1);
		
		sql = "select ino from item_business where it_name = '" + comboItemName + "'";
		r = cb.Query(sql);
		r.next();
		int prim_ino = r.getInt(1);			// Number of Item of business(true from table)
		
		int vType = 0;
		if((voteType == 0) || (voteType == 1))
			vType = 1;
		else if((voteType == 2) || (voteType == 3))
			vType = 2;
		else if((voteType == 4) || (voteType == 5))
			vType = 3;
			
		sql = "insert into vote (v_name, num, v_point, cp_indic, ino, tno) values('" + 
				voteName + "', " + num + ", " + point + ", '" + cp_ind + "', " + prim_ino + ", '" + vType + "')";
		cb.Update(sql);
		
		// Get the last row of vote table
		sql = "select count(*) from vote";
		r = cb.Query(sql); 
		r.next();
		int loopLast = r.getInt(1);
		
		sql = "select * from vote";
		r = cb.Query(sql);
		for(int j = 0; j < loopLast; j++)
		{
			r.next();
			voteNo = r.getInt(1);
		}
		// Insert issue into database
		if(voteType == 0 || voteType == 1)
		{
			sql = "insert into issue (issname, vno) values('ใช่', " + voteNo + ")";
			cb.Update(sql);
			sql = "insert into issue (issname, vno) values('ไม่ใช่', " + voteNo + ")";
			cb.Update(sql);
			sql = "insert into issue (issname, vno) values('เสมอ', " + voteNo + ")";
			cb.Update(sql);
		}
		else
		{
			int lenAChoice = tmp.length;
			for(int i = 0; i < lenAChoice; i++)
			{
				sql = "insert into issue (issname, vno) values('" + tmp[i] + "', " + voteNo + ")";
				cb.Update(sql);
			}
		}
		
		sql = "select count(*) from issue";
		r = cb.Query(sql); 
		r.next();
		int loopLastI = r.getInt(1);
		
		sql = "select * from issue";
		r = cb.Query(sql);
		for(int j = 0; j < loopLastI; j++)
		{
			r.next();
			issNo = r.getInt(1);
		}
		//////////////////////////////////////////////////////////////////////////////////////////////
      	for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
		
			if(thread.status.equals("projector")) 
				thread.ddout.writeInt(156);
	      	else
	      		thread.ddout.writeInt(105);
	      
	      	thread.ddout.writeInt(voteNo);
	      	thread.ddout.writeInt(issNo);
	      	thread.ddout.writeInt(itemNo);
	      	thread.ddout.writeUTF(comboItemName);
	      	thread.ddout.writeInt(num);
	      	thread.ddout.writeInt(voteType);
	      	thread.ddout.writeUTF(voteName);
	      	thread.ddout.writeInt(prim_ino);

	    	// case: Closed&Open Weighted vote
	      	if(voteType == 2 || voteType == 3)
	      		thread.ddout.writeInt(point);	
	      
	      	for(int j=0;j<num;j++)
	      		thread.ddout.writeUTF(tmp[j]);	 
		}		
		ConferenceServer.setLogMessage(message + " :: แจ้งหัวข้อการลงมติให้ทุกคนในที่ประชุมทราบ");
  	}
  	public synchronized void doMessage_17(int message) throws Exception {
  		int vote = ddin.readInt();			// result of each committee
  		String voteName = ddin.readUTF();	// topic of vote
  		int itemNo = ddin.readInt();
  		issNo = ddin.readInt();
		
		int vn = 0;
		try
		{
			// get VNO from VOTE table
			sql = "select vno from vote where v_name = '" + voteName + 
					"' and INO = " + itemNo;
			r = cb.Query(sql);
			r.next();
			vn = r.getInt(1);
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		
		if(vote == 0)
			yes_result++;
		else if(vote == 1)
			no_result++;

  		int numC = clients.size();
  		// if the last committee is voted then write data in VOTE_RESULT table
  		if(numCommittee == numC - 2)
  		{
			int resultVote = 0;
			if(yes_result > no_result)
				resultVote = 2;
			else if(no_result > yes_result)
				resultVote = 1;
			else
				resultVote = 0;
				
			// write the result in VOTE_RESULT table
			try
			{
				// insert result to VOTE_RESULT table	
				sql = "insert into vote_result (issno, r_point) values(" +	(issNo - resultVote) + ", " + 0 + ")";
				cb.Update(sql);
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			yes_result = 0;
			no_result = 0;
			numCommittee = 0;
  		}
  		else
  			numCommittee++;
		
		String name, surname;
		StringTokenizer tokens = new StringTokenizer(this.getName());
		name = tokens.nextToken();		// name of committee
		surname = tokens.nextToken();	// surname of committee
	
		try
		{
			// convert result vote of each committee
			int res = 0;
			if(vote == 0)	// YES
				res = 2;
			else if(vote == 1)	// NO
				res = 1;
			
			sql = "select memberid from member where membername = '" + name + 
					"' and membersurname = '" + surname + "'";
			r = cb.Query(sql);
			r.next();
			int memNo = r.getInt(1);
			
			// insert result to COMMITTEE_RESULT table	
			sql = "insert into committee_result (vno, memberid, issno, point) values(" 
					+ voteNo + ", " + memNo + ", " + (issNo - res) + ", " + 0 + ")";
			cb.Update(sql);
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		
    	for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);			
			if(thread.status.equals("projector")) {
				thread.ddout.writeInt(161);
				thread.ddout.writeInt(vote);
				thread.ddout.writeUTF(voteName);
				thread.ddout.writeInt(clients.size());
				break;
			}
		}
		//ddout.writeInt(106);
		ddout.writeInt(107);
		ddout.writeUTF("rule");
		
		ConferenceServer.setLogMessage(message + " :: " + " การลงมติแบบใช่หรือไม่ใช่ (เปิดเผย) เสร็จสมบูรณ์!!");	
  	}
  	public synchronized void doMessage_18(int message) throws Exception {
  		isFirst = true;
  	}
  	public synchronized void doMessage_19(int message) throws Exception {
  		for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if(!thread.status.equals("projector") && thread != this) {
      		thread.ddout.writeInt(158);
			}
		}
		ConferenceServer.setLogMessage(message + " :: ยกเลิกสิทธิในการใช้โปรเจคเตอร์ของทุกคน ยกเว้นตัวเอง"); // Except me
  	}
  	public synchronized void doMessage_20(int message) throws Exception {
  		for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if(!thread.status.equals("projector")) {
      		thread.ddout.writeInt(158);
			}
		}
		ConferenceServer.setLogMessage(message + " :: ยกเลิกสิทธิในการใช้โปรเจคเตอร์ของทุกคน");
  	}
  	public synchronized void doMessage_21(int message) throws Exception {
  		ConferenceServer.setLogMessage(message + " :: รับรายงานการประชุมจากเลขานุการ");
  		buffer = getPDF();
  		
  		Date now = new Date();
  		String hour = "" + now.getHours(),minute = "" + now.getMinutes();
  		if(hour.length() == 1) hour = "0" + hour;
  		if(minute.length() == 1) minute = "0" + minute;
		DateFormat df = DateFormat.getDateInstance(DateFormat.MEDIUM);
		String s = df.format(now);
		s += "(" + hour + "." + minute + ").pdf";
			
  		FileOutputStream fo = new FileOutputStream("upload/" + s);
  		fo.write(buffer.toByteArray());
  		fo.close();
  		
  		// save into DB
  		sql = "insert into report values (0," + MeetID + ",'" + s + "')";
  		cb.Execute(sql);
  	}
  	public synchronized void doMessage_22(int message) throws Exception {
  		int numChoice = ddin.readInt();
  		String voteName = ddin.readUTF();
  		int itemNo = ddin.readInt();
  		issNo = ddin.readInt();

		String tmp[] = new String[numChoice];
      	for(int i=0;i<numChoice;i++)
      		tmp[i] = ddin.readUTF();				// user arrange choice
      	
      	int issNoDB = issNo - numChoice;
		if(issNoDB != 0)
			issNoDB += 1;
		else if(issNoDB == 0)
			issNoDB = 1;
		
		int issNoDB2 = issNoDB;
      	
      	String textRadio = "";
		int[] result = new int[numChoice];
		for(int x = 0; x < numChoice; x++)
		{
			textRadio = tmp[x];
	      	for(int y = 0; y < numChoice; y++)
			{
				sql = "select issname from issue where issno = " + (issNoDB2 + y);
				r = cb.Query(sql);
				r.next();
				if(textRadio.equals(r.getString(1)))
				{
					result[x] = y + 1;			// convert to point
					break;
				}
			}
		}
        
        int[] genPoint = new int[numChoice];
  		for(int i = 0; i < numChoice; i++)
  			 genPoint[i] = numChoice - i;
  		
  		// initiate value in order_res array
  		if(numCommittee == 0)
  		{
  			order_res = new int[numChoice];
  			for(int i = 0; i < numChoice; i++)
  				order_res[i] = 0;
  		}

  		int indexGenPoint = 0;
  		// calculate order of each choice
  		for(int i = 0; i < numChoice; i++)
  		{
  			indexGenPoint = result[i] - 1;
  			order_res[i] = order_res[i] + genPoint[indexGenPoint];			// sum points
  		}
        
        // if the last committee is voted then write data in VOTE_RESULT table
        int numC = clients.size();
  		if(numCommittee == numC - 2)
  		{
			try
			{
				// insert result to VOTE_RESULT table
				for(int i = 0; i < numChoice; i++)
				{
					sql = "insert into vote_result (issno, r_point) values(" +	issNoDB + ", " + order_res[i] + ")";
					cb.Update(sql);
				
					issNoDB++;
				}
				// Select data from issue table for use in for loop
				sql = "select issname from issue where issno between " + issNoDB2 + " and " + issNo;
				r = cb.Query(sql);
				String[] tmpIssName = new String[numChoice];
				for(int j = 0; j < numChoice; j++)
				{
					r.next();
					tmpIssName[j] = r.getString(1);
				}
				// Copy array totalRes
				int[] copyTotalRes = new int[numChoice];
				for(int i = 0; i < numChoice; i++)
					copyTotalRes[i] = order_res[i];
				////////////////////////////////////////////////////////////////
				// Arrange choice //////////////////////////////////////////
				int maxInt = 0;
				int index = 0;
					
				for(int j = 0; j < numChoice; j++)
				{
					for(int k = 0; k < numChoice; k++)
					{
						if(k > j)
						{
							if(copyTotalRes[j] < copyTotalRes[k])
							{
								index = k + 1;
								maxInt = copyTotalRes[k];
								copyTotalRes[k] = copyTotalRes[j];
								copyTotalRes[j] = maxInt;
							}
						}
					}
				}
				
				// count the number of issNo
				int[] count_issNoW = new int[numChoice];
				String issNameW = "";
				result_arrange = new String[numChoice];
				for(int x = 0; x < numChoice; x++)
				{
					// Select data from issue table
					sql = "select count(issno) from vote_result where issno between " + issNoDB2 + 
							" and " + issNo + " and r_point = " + copyTotalRes[x];
					r = cb.Query(sql);
					r.next();
					count_issNoW[x] = r.getInt(1);

					if(count_issNoW[x] == 1)
					{
						// Select data from issue table
						sql = "select issno from vote_result where issno between " + issNoDB2 + 
								" and " + issNo + " and r_point = " + copyTotalRes[x];
						r = cb.Query(sql);
						r.next();
						int issNoW = r.getInt(1);
						
						sql = "select issname from issue where issno = " + issNoW;
						r = cb.Query(sql);
						r.next();
						issNameW = r.getString(1);
						result_arrange[x] = issNameW;
					}
					else if(count_issNoW[x] == numChoice)
					{
						// Select data from issue table
						sql = "select issno from vote_result where issno between " + issNoDB2 + 
								" and " + issNo + " and r_point = " + copyTotalRes[x];
						r = cb.Query(sql);
						r.next();
						int issNoW = r.getInt(1);
						
						sql = "select issname from issue where issno = " + (issNoW + x);
						r = cb.Query(sql);
						r.next();
						issNameW = r.getString(1);
						result_arrange[x] = issNameW;
					}
					else
					{
						// Select data from issue table
						sql = "select issno from vote_result where issno between " + issNoDB2 + 
								" and " + issNo + " and r_point = " + copyTotalRes[x];
						r = cb.Query(sql);
						r.next();
						int issNoW = r.getInt(1);
						
						for(int i = 0; i < count_issNoW[x]; i++)
						{
							sql = "select issname from issue where issno = " + (issNoW + i);
							r = cb.Query(sql);
							r.next();
							issNameW = r.getString(1);
							result_arrange[x + i] = issNameW;
						}
						x = x + (count_issNoW[x] - 1);
					}
				}
				numCommittee = 0;
	  			for(int i = 0;i < clients.size();i++) {
					ServerThread thread = (ServerThread)clients.elementAt(i);
					if(thread.status.equals("projector")) {
						thread.ddout.writeInt(159);
						thread.ddout.writeInt(numChoice);
						thread.ddout.writeUTF(voteName);
						thread.ddout.writeInt(clients.size());
						for(int j = 0; j < result_arrange.length; j++) {
							System.out.println("result_arrange: " + result_arrange[j]);
										thread.ddout.writeUTF(result_arrange[j]);
						}
						break;
					}
				}
  			} catch(SQLException e) { System.out.println(e); }
		}
  		else
  			numCommittee++;
  		
		//ddout.writeInt(106);
		ddout.writeInt(107);
		ddout.writeUTF("rule");
		
		ConferenceServer.setLogMessage(message + " :: " + " การลงมติแบบเรียงลำดับความสำคัญ (ลับ) เสร็จสมบูรณ์");  		
  	}
  	public synchronized void doMessage_23(int message) throws Exception {
  		int numChoice = ddin.readInt();
  		String vname = ddin.readUTF();
  		int itemNo = ddin.readInt();
  		issNo = ddin.readInt();
  
  		tmpIssNo = new String[numChoice];
  			
  		// result of vote (point)
  		int[] result = new int[numChoice];
  		for(int i = 0; i < numChoice; i++)
  			result[i] = ddin.readInt();
  		///////////////////////////////////////////// SUM POINTS //////////////////////////////////////////////////
  		 // initiate value in weighted_res array
  		if(numCommittee == 0)
  		{
  			weighted_res = new int[numChoice];
  			for(int i = 0; i < numChoice; i++)
  				weighted_res[i] = 0;
  		}
  		// calculate total point of each choice
  		for(int i = 0; i < numChoice; i++)
  			weighted_res[i] += result[i];
  		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  		
	  	int issNoDB = issNo - numChoice;
		if(issNoDB != 0)
			issNoDB += 1;
		else if(issNoDB == 0)
			issNoDB = 1;
		
		int issNoDB2 = issNoDB;
		
		int numC = clients.size();
		if(numCommittee == numC - 2)
  		{
			try
			{
				// insert result to VOTE_RESULT table
				for(int i = 0; i < numChoice; i++)
				{
					sql = "insert into vote_result (issno, r_point) values(" + issNoDB + ", " + weighted_res[i] + ")";
					cb.Update(sql);
				
					issNoDB++;
				}
			} catch(Exception e) { System.out.println(e); }
			
			// Select data from issue table for use in for loop
			sql = "select issname from issue where issno between " + issNoDB2 + 
					" and " + issNo;
			r = cb.Query(sql);
			
			for(int j = 0; j < numChoice; j++)
			{
				r.next();
				tmpIssNo[j] = r.getString(1);
			}
			numCommittee = 0;
			
			for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);
				if(thread.status.equals("projector")) {
					thread.ddout.writeInt(160);
					thread.ddout.writeInt(numChoice);
					thread.ddout.writeUTF(vname);
					thread.ddout.writeInt(clients.size());
					for(int j = 0; j < numChoice; j++)
							thread.ddout.writeUTF(tmpIssNo[j]);
					for(int k = 0; k < numChoice; k++)
						thread.ddout.writeInt(weighted_res[k]);
					break;		
					}
  			}
  		}
  		else
  			numCommittee++;

	//	ddout.writeInt(106);
		ddout.writeInt(107);
		ddout.writeUTF("rule");
		
		ConferenceServer.setLogMessage(message + " :: " + " การลงมติแบบเรียงลำดับความสำคัญตามการให้คะแนน (ลับ) เสร็จสมบูรณ์");		
  	}
  	
  	public synchronized void doMessage_24(int message) throws Exception {
  		int vote = ddin.readInt();			// result of each committee
  		String voteName = ddin.readUTF();	// topic of vote
  		int itemNo = ddin.readInt();
  		issNo = ddin.readInt();
		
		if(vote == 0)
			yes_result++;
		else if(vote == 1)
			no_result++;

  		int numC = clients.size();
  		// if the last committee is voted then write data in VOTE_RESULT table
  		if(numCommittee == numC - 2)
  		{
			int resultVote = 0;
			if(yes_result > no_result)
				resultVote = 2;
			else if(no_result > yes_result)
				resultVote = 1;
			else
				resultVote = 0;
			
			// write the result in VOTE_RESULT table
			try
			{
				// insert result to VOTE_RESULT table	
				sql = "insert into vote_result (issno, r_point) values(" +
						(issNo - resultVote) + ", " + 0 + ")";
				cb.Update(sql);
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			yes_result = 0;
			no_result = 0;
			numCommittee = 0;
  		}
  		else
  			numCommittee++;
  		
    	for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);			
			if(thread.status.equals("projector")) {
				thread.ddout.writeInt(161);
				thread.ddout.writeInt(vote);
				thread.ddout.writeUTF(voteName);
				thread.ddout.writeInt(clients.size());
				break;
			}
		}
	//	ddout.writeInt(106);
		ddout.writeInt(107);
		ddout.writeUTF("rule");
		// don't show a voter name to server screen
		ConferenceServer.setLogMessage(message + " :: " + " การลงมติแบบใช่หรือไม่ใช่ (ลับ) เสร็จสมบูรณ์");
  	}
  	public synchronized void doMessage_25(int message) throws Exception {
  		int numChoice = ddin.readInt();
  		String vname = ddin.readUTF();
  		int itemNo = ddin.readInt();
  		issNo = ddin.readInt();
  		
  		tmpIssNo = new String[numChoice];
  		
  		// result of vote (point)
  		int[] result = new int[numChoice];
  		for(int i = 0; i < numChoice; i++)
  			result[i] = ddin.readInt();
  			
		int vn = 0;
		try
		{
			// get VNO from VOTE table
			sql = "select vno from vote where v_name = '" + vname + 
					"' and INO = " + itemNo;
			r = cb.Query(sql);
			r.next();
			vn = r.getInt(1);
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
		///////////////////////////////////////////// SUM POINTS //////////////////////////////////////////////////
  		 // initiate value in weighted_res array
  		if(numCommittee == 0)
  		{
  			weighted_res = new int[numChoice];
  			for(int i = 0; i < numChoice; i++)
  				weighted_res[i] = 0;
  		}
  		// calculate total point of each choice
  		for(int i = 0; i < numChoice; i++)
  			weighted_res[i] += result[i];
  		/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  		int issNoDB = issNo - numChoice;
		if(issNoDB != 0)
			issNoDB += 1;
		else if(issNoDB == 0)
			issNoDB = 1;
		
		int issNoDB2 = issNoDB;
		
		int numC = clients.size();
		if(numCommittee == numC - 2)
  		{
			try
			{
				// insert result to VOTE_RESULT table
				for(int i = 0; i < numChoice; i++)
				{
					sql = "insert into vote_result (issno, r_point) values(" + issNoDB + ", " + weighted_res[i] + ")";
					cb.Update(sql);
				
					issNoDB++;
				}
			} catch(Exception e) { System.out.println(e); }
			
			// Select data from issue table for use in for loop
			sql = "select issname from issue where issno between " + issNoDB2 + 
					" and " + issNo;
			r = cb.Query(sql);
			
			for(int j = 0; j < numChoice; j++)
			{
				r.next();
				tmpIssNo[j] = r.getString(1);
			}
			numCommittee = 0;
			
			for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);
				if(thread.status.equals("projector")) {
					thread.ddout.writeInt(160);
					thread.ddout.writeInt(numChoice);
					thread.ddout.writeUTF(vname);
					thread.ddout.writeInt(clients.size());
					for(int j = 0; j < numChoice; j++)
						thread.ddout.writeUTF(tmpIssNo[j]);
					for(int k = 0; k < numChoice; k++)
						thread.ddout.writeInt(weighted_res[k]);
	
					break;
				}
			}
  		}
  		else
  			numCommittee++;
  			
  		String name, surname;
		StringTokenizer tokens = new StringTokenizer(this.getName());
		name = tokens.nextToken();		// name of committee
		surname = tokens.nextToken();	// surname of committee
		
		// Write Committee's results to DB
		try
		{
			sql = "select memberid from member where membername = '" + name + 
					"' and membersurname = '" + surname + "'";
			r = cb.Query(sql);
			r.next();
			int memNo = r.getInt(1);
			
			int issNoDB3 = issNoDB2;
			
			// insert result to COMMITTEE_RESULT table
			for(int i = 0; i < numChoice; i++)
			{
				sql = "insert into committee_result (vno, memberid, issno, point) values(" 
					+ vn + ", " + memNo + ", " + issNoDB3 + ", " + result[i] + ")";
				cb.Update(sql);
				issNoDB3++;
			}		
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
	//	ddout.writeInt(106);
		ddout.writeInt(107);
		ddout.writeUTF("rule");
		
		ConferenceServer.setLogMessage(message + " :: " + this.getName() + " การลงมติแบบเรียงลำดับความสำคัญตามการให้คะแนน (เปิดเผย) เสร็จสมบูรณ์");		
  	}
  	public synchronized void doMessage_26(int message) throws Exception {
  		int numChoice = ddin.readInt();
  		String voteName = ddin.readUTF();
  		int itemNo = ddin.readInt();
  		issNo = ddin.readInt();
  		
  		String tmp[] = new String[numChoice];
      	for(int i=0;i<numChoice;i++)
      		tmp[i] = ddin.readUTF();				// user arrange choice
      	
      	int issNoDB = issNo - numChoice;
		if(issNoDB != 0)
			issNoDB += 1;
		else if(issNoDB == 0)
			issNoDB = 1;
		
		int issNoDB2 = issNoDB;
      	
      	String textRadio = "";
		int[] result = new int[numChoice];
		for(int x = 0; x < numChoice; x++)
		{
			textRadio = tmp[x];
	      	for(int y = 0; y < numChoice; y++)
			{
				sql = "select issname from issue where issno = " + (issNoDB2 + y);
				r = cb.Query(sql);
				r.next();
				if(textRadio.equals(r.getString(1)))
				{
					result[x] = y + 1;			
					break;
				}
			}
		}
		
		int[] genPoint = new int[numChoice];
  		for(int i = 0; i < numChoice; i++)
  			 genPoint[i] = numChoice - i;
		
		// initiate value in order_res array
  		if(numCommittee == 0)
  		{
  			order_res = new int[numChoice];
  			for(int i = 0; i < numChoice; i++)
  				order_res[i] = 0;
  		}
		
		int indexGenPoint = 0;
  		// calculate order of each choice
  		for(int i = 0; i < numChoice; i++)
  		{
  			indexGenPoint = result[i] - 1;
  			order_res[i] = order_res[i] + genPoint[indexGenPoint];
  		}
		
		// if the last committee is voted then write data in VOTE_RESULT table
        int numC = clients.size();
  		if(numCommittee == numC - 2)
  		{
			try
			{
				// insert result to VOTE_RESULT table
				for(int i = 0; i < numChoice; i++)
				{
					sql = "insert into vote_result (issno, r_point) values(" +	issNoDB + ", " + order_res[i] + ")";
					cb.Update(sql);
				
					issNoDB++;
				}
				// Select data from issue table for use in for loop
				sql = "select issname from issue where issno between " + issNoDB2 + " and " + issNo;
				r = cb.Query(sql);
				String[] tmpIssName = new String[numChoice];
				for(int j = 0; j < numChoice; j++)
				{
					r.next();
					tmpIssName[j] = r.getString(1);
				}
				// Copy array totalRes
				int[] copyTotalRes = new int[numChoice];
				for(int i = 0; i < numChoice; i++)
					copyTotalRes[i] = order_res[i];
				////////////////////////////////////////////////////////////////
				// Arrange choice //////////////////////////////////////////
				int maxInt = 0;
				int index = 0;
					
				for(int j = 0; j < numChoice; j++)
				{
					for(int k = 0; k < numChoice; k++)
					{
						if(k > j)
						{
							if(copyTotalRes[j] < copyTotalRes[k])
							{
								index = k + 1;
								maxInt = copyTotalRes[k];
								copyTotalRes[k] = copyTotalRes[j];
								copyTotalRes[j] = maxInt;
							}
						}
					}
				}
				
				// count the number of issNo
				int[] count_issNoW = new int[numChoice];
				String issNameW = "";
				result_arrange = new String[numChoice];
				for(int x = 0; x < numChoice; x++)
				{
					// Select data from issue table
					sql = "select count(issno) from vote_result where issno between " + issNoDB2 + 
							" and " + issNo + " and r_point = " + copyTotalRes[x];
					r = cb.Query(sql);
					r.next();
					count_issNoW[x] = r.getInt(1);
					
					if(count_issNoW[x] == 1)
					{
						// Select data from issue table
						sql = "select issno from vote_result where issno between " + issNoDB2 + 
								" and " + issNo + " and r_point = " + copyTotalRes[x];
						r = cb.Query(sql);
						r.next();
						int issNoW = r.getInt(1);
						
						sql = "select issname from issue where issno = " + issNoW;
						r = cb.Query(sql);
						r.next();
						issNameW = r.getString(1);
						result_arrange[x] = issNameW;
					}
					else if(count_issNoW[x] == numChoice)
					{
						// Select data from issue table
						sql = "select issno from vote_result where issno between " + issNoDB2 + 
								" and " + issNo + " and r_point = " + copyTotalRes[x];
						r = cb.Query(sql);
						r.next();
						int issNoW = r.getInt(1);
						
						sql = "select issname from issue where issno = " + (issNoW + x);
						r = cb.Query(sql);
						r.next();
						issNameW = r.getString(1);
						result_arrange[x] = issNameW;
					}
					else
					{
						// Select data from issue table
						sql = "select issno from vote_result where issno between " + issNoDB2 + 
								" and " + issNo + " and r_point = " + copyTotalRes[x];
						r = cb.Query(sql);
						r.next();
						int issNoW = r.getInt(1);
						
						for(int i = 0; i < count_issNoW[x]; i++)
						{
							sql = "select issname from issue where issno = " + (issNoW + i);
							r = cb.Query(sql);
							r.next();
							issNameW = r.getString(1);
							result_arrange[x + i] = issNameW;
						}
						x = x + (count_issNoW[x] - 1);
					}
				}
			} catch(SQLException e) { System.out.println(e); }
  			
  			numCommittee = 0;
		
			for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);
				if(thread.status.equals("projector")) {
					thread.ddout.writeInt(159);
					thread.ddout.writeInt(numChoice);
					thread.ddout.writeUTF(voteName);
					thread.ddout.writeInt(clients.size());
					for(int j = 0; j < numChoice; j++) 
						thread.ddout.writeUTF(result_arrange[j]);
	
					break;		
				}
			}
		}
  		else
  			numCommittee++;
      	
      	String name, surname;
		StringTokenizer tokens = new StringTokenizer(this.getName());
		name = tokens.nextToken();		// name of committee
		surname = tokens.nextToken();	// surname of committee
		
		// Write Committee's results to DB
		try
		{
			sql = "select memberid from member where membername = '" + name + 
					"' and membersurname = '" + surname + "'";
			r = cb.Query(sql);
			r.next();
			int memNo = r.getInt(1);
			
			int issNoDB3 = issNoDB2;
			
			int vn = 0;
			try
			{
				// get VNO from VOTE table
				sql = "select vno from vote where v_name = '" + voteName + 
						"' and INO = " + itemNo;
				r = cb.Query(sql);
				r.next();
				vn = r.getInt(1);
			}
			catch(SQLException e)
			{
				System.out.println(e);
			}
			
			// insert result to COMMITTEE_RESULT table
			for(int i = 0; i < numChoice; i++)
			{
				sql = "insert into committee_result (vno, memberid, issno, point) values(" 
					+ vn + ", " + memNo + ", " + issNoDB3 + ", " + result[i] + ")";
				cb.Update(sql);
				issNoDB3++;
			}		
		}
		catch(SQLException e)
		{
			System.out.println(e);
		}
      	
      	//ddout.writeInt(106);
		ddout.writeInt(107);
		ddout.writeUTF("rule");
		
		ConferenceServer.setLogMessage(message + " :: " + " การลงมติแบบเรียงลำดับความสำคัญ (เปิดเผย) เสร็จสมบูรณ์");  		
  	}
  	
  	public synchronized void doMessage_27(int message) throws Exception {
  		topic = ddin.readUTF();
  		int itemNoSend = ddin.readInt();
  		int typeNo = ddin.readInt();
  		comboItemName = ddin.readUTF();
  		int tnNo = ddin.readInt();
  		
  		int numChoice = 0;
		int valPoint = 0;
		String[] tmp = new String[10];		// init max size of choice: may be change later by yourself	
		// Weighted vote
		if(tnNo == 1)
		{
			numChoice = ddin.readInt();
			valPoint = ddin.readInt();
			
			tmp = new String[numChoice];
			for(int i = 0; i < numChoice; i++)
			{
				tmp[i] = ddin.readUTF();			// Choice that create from creatChoice method
			}
		}
			// Order vote
		else if(tnNo == 2)
		{
			numChoice = ddin.readInt();
			
			tmp = new String[numChoice];
			for(int i = 0; i < numChoice; i++)
				tmp[i] = ddin.readUTF();			// Choice that create from creatChoice method
		}
		
  		// For select MeetingName
  		try
		{
			sql = "select * from meeting where MNO = " + MeetID;
			r = cb.Query(sql);
			r.next();
			meetingName = r.getString(2);	
		}
		catch(SQLException e)
	 	{	System.out.println(e);	}
	 		
	 	// For select ItemName
	 	try
		{
			sql = "select count(*) from item_business where MNO = " + MeetID;
			r = cb.Query(sql);
			r.next();
			int loopItem = r.getInt(1);
			
			sql = "select * from item_business where MNO = " + MeetID;
			r = cb.Query(sql);
			for(int i = 0; i < loopItem; i++)
			{
				r.next();
				if(i == itemNoSend)
					itemName = r.getString(2);
			}
		}
		catch(SQLException e)
	 	{	System.out.println(e);	}
	 	
	 	// For select type of vote
	 	try
		{	String typest = "";
			if(typeNo == 0)
				typest = "ลับ";
			else if(typeNo == 1)
				typest = "เปิดเผย";
				
			sql = "select * from vote_type where TNO = " + (tnNo + 1);
			r = cb.Query(sql);
			r.next();
			String typest2 = r.getString(2);
			
			type = typest + " " + typest2;
		}
		catch(SQLException e)
	 	{	System.out.println(e);	}

  		for(int j = 0;j < clients.size();j++) {
			ServerThread thread = (ServerThread)clients.elementAt(j);
			if(thread.status.equals("chairman") || thread.status.equals("secretary")) {
				thread.ddout.writeInt(132);
				thread.ddout.writeUTF(meetingName);
				thread.ddout.writeUTF(itemName);
				thread.ddout.writeUTF(type);
				thread.ddout.writeUTF(topic);
				thread.ddout.writeInt(itemNoSend);
				thread.ddout.writeUTF(comboItemName);
				thread.ddout.writeInt(tnNo);
				
				if(tnNo == 1)		// Weighted vote
				{
					thread.ddout.writeInt(numChoice);
					thread.ddout.writeInt(valPoint);
					
					for(int i = 0; i < numChoice; i++)
						thread.ddout.writeUTF(tmp[i]);
				}
				else if(tnNo == 2)
				{
					thread.ddout.writeInt(numChoice);
					
					for(int i = 0; i < numChoice; i++)
						thread.ddout.writeUTF(tmp[i]);
				}
			}
  		}
		
		ConferenceServer.setLogMessage(message + " :: " + this.getName() + " รอการอนุมัติหัวข้อการลงมติจากประธาน");
  	}
  	public synchronized void doMessage_28(int message) throws Exception {
		for(int j = 0;j < clients.size();j++) {
			ServerThread thread = (ServerThread)clients.elementAt(j);
			if(thread.status.equals("chairman"))
			{
				thread.ddout.writeInt(107);
				thread.ddout.writeUTF("rule");
			}				

			if(thread.status.equals("secretary"))
			{
				thread.ddout.writeInt(133);
				thread.ddout.writeUTF("cancel");
				thread.ddout.writeUTF("ประธานในที่ประชุมยกเลิกการสร้างหัวข้อการลงมติ");				
			}
			
			if(thread.status.equals("projector"))
			{
				thread.ddout.writeInt(107);
				thread.ddout.writeUTF("rule");			
			}
  		}
  		ConferenceServer.setLogMessage(message + " :: " + " ประธานยกเลิกการสร้างหัวข้อการลงมติ");
  	}
  	public synchronized void doMessage_29(int message) throws Exception {
		for(int j = 0;j < clients.size();j++) {
			ServerThread thread = (ServerThread)clients.elementAt(j);
			if(thread.status.equals("chairman"))
			{
				thread.ddout.writeInt(107);
				thread.ddout.writeUTF("wait");
			}				

			if(thread.status.equals("secretary"))
			{
				thread.ddout.writeInt(133);
				thread.ddout.writeUTF("recreate");
				thread.ddout.writeUTF("ประธานในที่ประชุมต้องการแก้ไขหัวข้อการลงมติอีกครั้ง");
			}
  		}
  		ConferenceServer.setLogMessage(message + " :: " + " ประธานต้องการให้มีการแก้ไขหัวข้อการลงมติใหม่");
  	}
	public synchronized void doMessage_30(int message) throws Exception {
  		String sta = ddin.readUTF();

  		for(int j = 0;j < clients.size();j++) {
			ServerThread thread = (ServerThread)clients.elementAt(j);
			if(thread.status.equals("secretary"))
			{
				if(sta.equals("cancel"))
				{
					thread.ddout.writeInt(107);
					thread.ddout.writeUTF("rule");
					
					ConferenceServer.setLogMessage(message + " :: " + " แจ้งการยกเลิกการสร้างหัวข้อการลงมติให้เลขานุการทราบ");
					break;
				}
				else if(sta.equals("recreate"))
				{
					thread.ddout.writeInt(107);
					thread.ddout.writeUTF("cvote");
					
					ConferenceServer.setLogMessage(message + " :: " + " แจ้งการสร้างหัวข้อการลงมติอีกครั้งให้เลขานุการทราบ");
					break;
				}
			}			
  		}		
  	}
  	
  	// FOR SWOT
 	//------ Load Page Show Pharse " Wait for Chairman Confirm " @ Secretary  windows
  	public synchronized void doMessage_71(int message) throws Exception {	
			for(int i = 0;i < clients.size();i++) {
					ServerThread thread = (ServerThread)clients.elementAt(i);
					if(thread.status.equals("secretary")) {
						thread.ddout.writeInt(200);
			      		thread.ddout.writeUTF("ctswot");
			      		thread.ddout.writeUTF("fake");
			      		thread.ddout.writeInt(2);	
					}  else if(thread.status.equals("chairman")){
	      				thread.ddout.writeInt(206);
      	  				thread.ddout.writeUTF("waitForSecretaryCreateTopic1.png");
	      			} else if(thread.status.equals("committee") || thread.status.equals("projector")) {
	     				thread.ddout.writeInt(200);
      	  				thread.ddout.writeUTF("fake");
      	  				thread.ddout.writeUTF("waitForSecretaryCreateTopic.png");
      	  				thread.ddout.writeInt(3);
	      		   	}      	
		  }
		ConferenceServer.setLogMessage(message + " :: ประธานต้องการให้เลขานุการสร้างหัวข้อการวิเคราะห์ฯ");
  	}
  	public synchronized void doMessage_72(int message) throws Exception {	
  		String topic = ddin.readUTF();
  		
  		// check for first Session ? will save only topic from first session
  		if( statusSession == 0 )
  			topicName = topic;
  	
  		for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if(thread.status.equals("chairman"))
				thread.ddout.writeInt(203);
	      	else
	      		thread.ddout.writeInt(204);
	     	
	     if( statusSession == 0 )
	     	thread.ddout.writeUTF(topic);
	     else			//don't care topic
	     	thread.ddout.writeUTF(topicName);
		}
		ConferenceServer.setLogMessage(message + " :: ประธานยืนยันหัวข้อของการวิเคราะห์ฯ และเลือกหัวข้อของการวิเคราะห์");
	}
	public synchronized void doMessage_73(int message) throws Exception {
  		String topic1 = ddin.readUTF();
  		String topic2 = ddin.readUTF();
  	
  		for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if(thread.status.equals("secretary")) { // add another user naaa
				thread.ddout.writeInt(204);
				thread.ddout.writeUTF(topic1);
				thread.ddout.writeUTF(topic2);
			}
		}		  	
		ConferenceServer.setLogMessage(message + " :: เลขานุการรอการยืนยันหัวข้อจากประธาน");
  	}
  	//---------- Chairman Push select session Strenght to Analysis
   public synchronized void doMessage_74(int message) throws Exception {	
  		
  		
  		for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			
			
//**************************************************************************	
			
			if(thread.status.equals("chairman") || (thread.status.equals("secretary")) || (thread.status.equals("committee"))) { 
			
			thread.ddout.writeInt(205);
			
					if(thisSessionIs.equals("s")){
						
						thread.ddout.writeUTF("pleaseInputStrenghtSuggestion.png");
						
						}else if(thisSessionIs.equals("w")){
					
							thread.ddout.writeUTF("pleaseInputWeaknessSuggestion.png");
							
							}else if(thisSessionIs.equals("o")){
					
								thread.ddout.writeUTF("pleaseInputOpportunitiesSuggestion.png");
								
								}else if(thisSessionIs.equals("t")){
									thread.ddout.writeUTF("pleaseInputThreatSuggestion.png");
									
									}
									
			
					
			}
			
//**************************************************************************			

		}		  	
		ConferenceServer.setLogMessage(message + " :: ประธานแจ้งให้ทุกคนทราบว่าจะเริ่มทำการวิเคราะห์ฯ");
  	}
  	
  	 //--------------- Confirm Suggetion ------------------	
  	public synchronized void doMessage_75(int message) throws Exception {
  		String suggestion1 = ddin.readUTF();
  		String suggestion2 = ddin.readUTF();
  		String suggestion3 = ddin.readUTF(); 			
      			  			
  		for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);	
			if(thread.getName().equals(this.getName())){
	   	 		thread.ddout.writeInt(222);	
	      	 	thread.ddout.writeUTF(topicName);
	      	 	thread.ddout.writeUTF(suggestion1);
	      	 	thread.ddout.writeUTF(suggestion2);
	      	 	thread.ddout.writeUTF(suggestion3);
			}	  	
		}	
		ConferenceServer.setLogMessage(message + " :: รอรับข้อคิดเห็นจากผู้เข้าร่วมประชุม");
  }
  
  public synchronized void doMessage_76(int message) throws Exception {	
  		String topic = ddin.readUTF();
  		topicName = topic;
  		
  		for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if(thread.status.equals("chairman")) {
			  thread.ddout.writeInt(201);
	      	  thread.ddout.writeUTF(topic);
			}
	      	else if(thread.status.equals("secretary")){
	      	 thread.ddout.writeInt(206);
	      	 thread.ddout.writeUTF("waitForChaimanConfirm.png");
	      	}
		}
		ConferenceServer.setLogMessage(message + " :: เลขานุการรอการอนุมัติจากประธาน");
  	}
  	public synchronized void doMessage_77(int message) throws Exception {
  		String topic = ddin.readUTF();
  		String sessionType = ddin.readUTF();
  		
  		//************************************************
  		thisSessionIs = sessionType;
  		//*********************************************
  		for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if(thread.status.equals("chairman")){
				thread.ddout.writeInt(202);
				thread.ddout.writeUTF(topic); 
				thread.ddout.writeUTF(sessionType);
			}
			else{
				thread.ddout.writeInt(206);
				if(sessionType.equals("s")){
					thread.ddout.writeUTF("nextSessionIsStrenght.png");
				}else if(sessionType.equals("w")){
					thread.ddout.writeUTF("nextSessionIsWeakness.png");
				}else if(sessionType.equals("o")){
					thread.ddout.writeUTF("nextSessionOpportunities.png");
				}else if(sessionType.equals("t")){
					thread.ddout.writeUTF("nextSessionIsThread.png");
				}
			}
		}
		ConferenceServer.setLogMessage(message + " :: ประธานต้องการทำการวิเคราะห์จุดแข็ง");
  	}
  	
  	public synchronized void doMessage_78(int message) throws Exception {	
  		String suggestion1 = ddin.readUTF();
  		String suggestion2 = ddin.readUTF();
  		String suggestion3 = ddin.readUTF( ); 
  		
  		if(numberOfSuggested < (clients.size())){
      		suggestion.addElement(suggestion1);
  			suggestion.addElement(suggestion2);
 			suggestion.addElement(suggestion3);	
      			 			
  			for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);
				if((thread.getName().equals(this.getName())) && thread.status.equals("chairman")){
						thread.ddout.writeInt(206);
	      	 			thread.ddout.writeUTF("waitForAnotherSuggestion.png");
				}else if(thread.getName().equals(this.getName())){
						thread.ddout.writeInt(206);
	      	 			thread.ddout.writeUTF("waitForAnotherSuggestion.png");
				}
  			}
  			ConferenceServer.setLogMessage(message + " :: รอรับความคิดเห็นจากทุกคน");
  		}
  		
  		if(numberOfSuggested == (clients.size() - 1)){
  			ConferenceServer.setLogMessage(message + " :: รับความคิดเห็นจากทุกคนครบแล้ว");	
  			for(int i = 0;i < clients.size();i++) {
				ServerThread thread = (ServerThread)clients.elementAt(i);	
				if(thread.status.equals("chairman")){
					thread.ddout.writeInt(223);
					thread.ddout.writeInt(suggestion.size());
					
					for(int j = 0 ; j < suggestion.size() ; j++ ){
						String sug = suggestion.elementAt(j).toString();
	      				thread.ddout.writeUTF(sug);			 
	   	 			}
				}
  			}
  		}
  		numberOfSuggested = numberOfSuggested + 1 ;
  }
  public synchronized void doMessage_79(int message) throws Exception {	
  	    // you can insert suggestion to DB at here
  		int loop = ddin.readInt();
  		Vector tem = new Vector();	
  			
  		for(int i = 0;i < loop ;i++) {
			tem.addElement(ddin.readUTF ());
		}
		
		for(int i = 0;i < clients.size();i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if((thread.status.equals("secretary"))||(thread.status.equals("committee")) ||(thread.status.equals("projector")) ){
	   	 		thread.ddout.writeInt(208);	
	      	 	thread.ddout.writeInt(loop);
	      	 	
	      	 	for(int j = 0;j < loop ;j++) {
  						thread.ddout.writeUTF((tem.elementAt(j)).toString());
				}
			}
		}
		
		ConferenceServer.setLogMessage(message + " :: ส่งความคิดเห็นที่ประธานเลือกไว้แล้ว ให้ทุกคน");	
  }
  public synchronized void doMessage_80(int message) throws Exception {
  		int loop = ddin.readInt();
  		
  		// set for calculate summary at doMessage 82
  		priValue = new int[loop];
  		posValue = new int[loop];
  		cosValue = new int[loop];
  			
  		Vector tem = new Vector();	
  			
  		for(int i = 0;i < loop ;i++) {
			tem.addElement(ddin.readUTF ());
		}
		
		String yLabel = ddin.readUTF();
		int    yMax = ddin.readInt();
		int    yMin = ddin.readInt();
		String rLabel = ddin.readUTF();
		int	   rMax = ddin.readInt();
		int    rMin = ddin.readInt();
	      	 
		for(int i = 0;i < (clients.size());i++) {
			ServerThread thread = (ServerThread)clients.elementAt(i);
			if((thread.status.equals("secretary"))||(thread.status.equals("committee")) || 
								(thread.status.equals("chairman"))){
				thread.ddout.writeInt(209);	
		    	thread.ddout.writeInt(loop);
		    	
		      	for(int j = 0;j < loop ;j++) {
	  				thread.ddout.writeUTF((tem.elementAt(j)).toString());
				}
				
				thread.ddout.writeUTF(yLabel);
				thread.ddout.writeInt(yMax);	
			    thread.ddout.writeInt(yMin);
			    thread.ddout.writeUTF(rLabel);
			    thread.ddout.writeInt(rMax);	
				thread.ddout.writeInt(rMin);
			}
		}
			
		ConferenceServer.setLogMessage(message + " :: เริ่มการประเมิน");
  }
  
  
  public synchronized void doMessage_82(int message) throws Exception {
  	
  		int loop = ddin.readInt();
  		
  		Vector sug = new Vector();	
  		Vector pri = new Vector();
  		Vector pos = new Vector();
  		Vector cos = new Vector();
  		
  		
  		for(int i = 0;i < loop ;i++) {
  		
			sug.addElement(ddin.readUTF());	
			pri.addElement(ddin.readUTF());
			pos.addElement(ddin.readUTF());
			cos.addElement(ddin.readUTF());
						
			vectorSug.addElement(sug.elementAt(i));
			vectorPri.addElement(pri.elementAt(i));
			vectorPos.addElement(pos.elementAt(i));
			vectorCos.addElement(cos.elementAt(i));
			
	      	if(!((pri.elementAt(i)).toString()).equals(""))
	      	{			
			int t1 = Integer.parseInt((pri.elementAt(i)).toString());
			priValue[i] = priValue[i]+t1;		
			  	
			int t2 = Integer.parseInt((pos.elementAt(i)).toString()); 
			posValue[i] = posValue[i]+t2;		
			
			int t3 = Integer.parseInt((cos.elementAt(i)).toString()); 
			cosValue[i] = cosValue[i]+t3;
			}
			else
			{
				int t1 = 0;
				int t2 = 0;
				int t3 = 0;
			}	
		}
		
			
		String yLabel = ddin.readUTF();
		int    yMax = ddin.readInt();
		int    yMin = ddin.readInt();
		String rLabel = ddin.readUTF();
		int	   rMax = ddin.readInt();
		int    rMin = ddin.readInt();
		
		if(vectorSug.size() != ((clients.size()-1) * sug.size() ) ){
					
			for(int i = 0; i < clients.size(); i++) {
	  		
					ServerThread thread = (ServerThread)clients.elementAt(i);		
			
					if(thread.getName().equals(this.getName())){
						
											
								thread.ddout.writeInt(200);
								thread.ddout.writeUTF("fake");
								thread.ddout.writeUTF("waitEvaluatedFromAnother.png");
								thread.ddout.writeInt(1);		
																						
						break;
						
					} 
			
			}
					
			
		} else if(vectorSug.size() == ((clients.size()-1)*sug.size() ) ){
		
		
			ConferenceServer.setLogMessage(message + " :: ได้รับการประเมินจากทุกคนแล้ว");	
  	
		
			//****************************************************
			// save for show at finish 4 session
			
			if(thisSessionIs.equals("s")){
				
				for(int j = 0 ; j < sug.size() ; j++ ){
										
					  	
				  	vectorOfAllSuggestionS.addElement((sug.elementAt(j).toString()));
	  				vectorOfAllPriorityValueS.addElement((Integer.toString(priValue[j]/(clients.size()-1))));
	  				vectorOfAllPosibilityValueS.addElement((Integer.toString(posValue[j]/(clients.size()-1))));
	  				vectorOfAllCostValueS.addElement((Integer.toString(cosValue[j]/(clients.size()-1))));
	  			  	
				}
				
				
	  				yLabelS = yLabel;
	  				yMaxS = yMax;
	  				yMinS = yMin;
	  				rLabelS = rLabel;
	  				rMaxS = rMax;
	  				rMinS = rMin;
				
			}else if(thisSessionIs.equals("w")){
						
						
				for(int j = 0 ; j < sug.size() ; j++ ){
										
					  	
				  	vectorOfAllSuggestionW.addElement((sug.elementAt(j).toString()));
	  				vectorOfAllPriorityValueW.addElement((Integer.toString(priValue[j]/(clients.size()-1))));
	  				vectorOfAllPosibilityValueW.addElement((Integer.toString(posValue[j]/(clients.size()-1))));
	  				vectorOfAllCostValueW.addElement((Integer.toString(cosValue[j]/(clients.size()-1))));
	  	
	  			}
	  			
  				yLabelW = yLabel;
  				yMaxW = yMax;
  				yMinW = yMin;
  				rLabelW = rLabel;
  				rMaxW = rMax;
  				rMinW = rMin;
				
				
								
			}else if(thisSessionIs.equals("o")){
				
						for(int j = 0 ; j < sug.size() ; j++ ){
											
							  	
						  	vectorOfAllSuggestionO.addElement((sug.elementAt(j).toString()));
			  				vectorOfAllPriorityValueO.addElement((Integer.toString(priValue[j]/(clients.size()-1))));
			  				vectorOfAllPosibilityValueO.addElement((Integer.toString(posValue[j]/(clients.size()-1))));
			  				vectorOfAllCostValueO.addElement((Integer.toString(cosValue[j]/(clients.size()-1))));
			 
						}
						
							yLabelO = yLabel;
			  				yMaxO = yMax;
			  				yMinO = yMin;
			  				rLabelO = rLabel;
			  				rMaxO = rMax;
			  				rMinO = rMin;
			  				
							
				
				
			}else if(thisSessionIs.equals("t")){
											
				for(int j = 0 ; j < sug.size() ; j++ ){
									
					  	
				  	vectorOfAllSuggestionT.addElement((sug.elementAt(j).toString()));
	  				vectorOfAllPriorityValueT.addElement((Integer.toString(priValue[j]/(clients.size()-1))));
	  				vectorOfAllPosibilityValueT.addElement((Integer.toString(posValue[j]/(clients.size()-1))));
	  				vectorOfAllCostValueT.addElement((Integer.toString(cosValue[j]/(clients.size()-1))));
		  	
				}
					yLabelT = yLabel;
	  				yMaxT = yMax;
	  				yMinT = yMin;
	  				rLabelT = rLabel;
	  				rMaxT = rMax;
	  				rMinT = rMin;
	  				
	
			}
								
							
			//**********************************************************	
					
		
			for(int i = 0; i < clients.size(); i++) {
	  		
					ServerThread thread = (ServerThread)clients.elementAt(i);		
							
							thread.ddout.writeInt(224);
							thread.ddout.writeInt(loop);
								
							for(int j = 0 ; j < sug.size() ; j++ ){
									
																
									thread.ddout.writeUTF((sug.elementAt(j).toString()));
									thread.ddout.writeUTF(Integer.toString(priValue[j]/(clients.size()-1)));
									thread.ddout.writeUTF(Integer.toString(posValue[j]/(clients.size()-1)));
									thread.ddout.writeUTF(Integer.toString(cosValue[j]/(clients.size()-1)));
							}
							
							
						thread.ddout.writeUTF(yLabel);
						thread.ddout.writeInt(yMax);	
					    thread.ddout.writeInt(yMin);
					    thread.ddout.writeUTF(rLabel);
					    thread.ddout.writeInt(rMax);	
						thread.ddout.writeInt(rMin);
							
			
			}
					
		//*************************************************
		
		
			countSwot  = 0;
		
		//************************************************	
		
		}
		
		
		ConferenceServer.setLogMessage(message + " :: รอรับข้อคิดเห็นจากผู้เข้าร่วมประชุม");	
  			
  }
  
  
 public synchronized void doMessage_83(int message) throws Exception {	
  		
  	
  		countSwot  = countSwot + 1;
  		
		if( statusSession < 4){
			
			if(statusSession < 3){
				
				
				for(int i = 0;i < clients.size();i++) {
				
  		
					ServerThread thread = (ServerThread)clients.elementAt(i);		
					
					if(thread.getName().equals(this.getName()) && (thread.status.equals("chairman"))) {
								
										
						statusSession = statusSession + 1;
						
							
						thread.ddout.writeInt(203);
						thread.ddout.writeUTF(topicName);
					//	thread.ddout.writeInt(4);
						
						for(int j = 0 ; j < 4 ; j++){
							
							
							if(typeOfSession[j].equals(thisSessionIs)){
								
								typeOfSession[j] = "0";
							}
							
					//	thread.ddout.writeUTF(typeOfSession[j]);
						}							
									
					} else if(thread.getName().equals(this.getName()) && ((thread.status.equals("secretary")) || (thread.status.equals("committee")))) {
				
					
						 thread.ddout.writeInt(210);	
						 thread.ddout.writeInt(2);
					
					}	
						
				}
					
				numberOfSuggested = 1;
				suggestion.removeAllElements();
				countSwot  = 0; 

			 	vectorSug.removeAllElements();
			  	vectorPri.removeAllElements();
			  	vectorPos.removeAllElements();
			  	vectorCos.removeAllElements();
						
				
			}else if(statusSession == 3){
				
				if(countSwot < (clients.size()-1)){
					
					for(int j = 0; j <	clients.size() ; j++) {
	
		    			ServerThread thread = (ServerThread)clients.elementAt(j);
		    	 	
		    			if(thread.getName().equals(this.getName())){
		    	 		
				 			thread.ddout.writeInt(226);
			
						}
					}
					
				}else{
					
					for(int j = 0; j <	clients.size() ; j++) {
	  	
						ServerThread thread = (ServerThread)clients.elementAt(j);
						
						
					//	if(thread.getName().equals(this.getName()) && (thread.status.equals("chairman"))) {
						
										
						thread.ddout.writeInt(225);
								
						thread.ddout.writeInt(vectorOfAllSuggestionS.size());				
						for(int t = 0 ; t <vectorOfAllSuggestionS.size(); t++ ){
							
														
							thread.ddout.writeUTF(vectorOfAllSuggestionS.elementAt(t).toString());
							thread.ddout.writeUTF(vectorOfAllPriorityValueS.elementAt(t).toString());
							thread.ddout.writeUTF(vectorOfAllPosibilityValueS.elementAt(t).toString());
							thread.ddout.writeUTF(vectorOfAllCostValueS.elementAt(t).toString());
									
												
						}		
							thread.ddout.writeUTF(yLabelS);
							thread.ddout.writeInt(yMaxS);	
						    thread.ddout.writeInt(yMinS);
						    thread.ddout.writeUTF(rLabelS);
						    thread.ddout.writeInt(rMaxS);	
							thread.ddout.writeInt(rMinS);
							
							
											
						thread.ddout.writeInt(vectorOfAllSuggestionW.size());				
						for(int t = 0 ; t <vectorOfAllSuggestionW.size(); t++ ){
									
														
							thread.ddout.writeUTF(vectorOfAllSuggestionW.elementAt(t).toString());
							thread.ddout.writeUTF(vectorOfAllPriorityValueW.elementAt(t).toString());
							thread.ddout.writeUTF(vectorOfAllPosibilityValueW.elementAt(t).toString());
							thread.ddout.writeUTF(vectorOfAllCostValueW.elementAt(t).toString());
									
												
						}		
							thread.ddout.writeUTF(yLabelW);
							thread.ddout.writeInt(yMaxW);	
						    thread.ddout.writeInt(yMinW);
						    thread.ddout.writeUTF(rLabelW);
						    thread.ddout.writeInt(rMaxW);	
							thread.ddout.writeInt(rMinW);
							
					
						thread.ddout.writeInt(vectorOfAllSuggestionO.size());					
						for(int t = 0 ; t <vectorOfAllSuggestionO.size(); t++ ){
									
														
						thread.ddout.writeUTF(vectorOfAllSuggestionO.elementAt(t).toString());
						thread.ddout.writeUTF(vectorOfAllPriorityValueO.elementAt(t).toString());
						thread.ddout.writeUTF(vectorOfAllPosibilityValueO.elementAt(t).toString());
						thread.ddout.writeUTF(vectorOfAllCostValueO.elementAt(t).toString());
								
												
						}		
						thread.ddout.writeUTF(yLabelO);
						thread.ddout.writeInt(yMaxO);	
					    thread.ddout.writeInt(yMinO);
					    thread.ddout.writeUTF(rLabelO);
					    thread.ddout.writeInt(rMaxO);	
						thread.ddout.writeInt(rMinO);
						
								
								
						thread.ddout.writeInt(vectorOfAllSuggestionT.size());
						for(int t = 0 ; t <vectorOfAllSuggestionT.size(); t++ ){
								
																
						thread.ddout.writeUTF(vectorOfAllSuggestionT.elementAt(t).toString());
						thread.ddout.writeUTF(vectorOfAllPriorityValueT.elementAt(t).toString());
						thread.ddout.writeUTF(vectorOfAllPosibilityValueT.elementAt(t).toString());
						thread.ddout.writeUTF(vectorOfAllCostValueT.elementAt(t).toString());
																	
						}			
						thread.ddout.writeUTF(yLabelT);
						thread.ddout.writeInt(yMaxT);	
					    thread.ddout.writeInt(yMinT);
					    thread.ddout.writeUTF(rLabelT);
					    thread.ddout.writeInt(rMaxT);	
						thread.ddout.writeInt(rMinT);
						
										
						countSwot  = 1;
					//	statusSession = 1;
						numberOfSuggested = 1;
	  					suggestion.removeAllElements(); 
	  	
	  	
					 	vectorSug.removeAllElements();
					  	vectorPri.removeAllElements();
					  	vectorPos.removeAllElements();
					  	vectorCos.removeAllElements();
				//	}
					
					}	
				}
			}
		}
				
		
		ConferenceServer.setLogMessage(message + " :: สรุปผลการวิเคราะห์");	 
} 
	//************************* End of Message ***************************
	//********************************************************************
}// End of class