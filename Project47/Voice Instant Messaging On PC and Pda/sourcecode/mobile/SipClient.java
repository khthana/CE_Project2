import java.util.*;
import java.io.*;

import javax.microedition.io.*;
import javax.microedition.midlet.*;
import javax.microedition.lcdui.*;

import javax.microedition.sip.*;

public class SipClient extends MIDlet implements CommandListener, SipClientConnectionListener, SipServerConnectionListener {
	
		
	public SipClientConnection scc = null;
	public SipClientConnection sccTemp = null;
	
	
	public SipConnectionNotifier scn = null;
	
	public SipServerConnection ssc = null;
	
	
	private SipServerConnection sscAccept = null;
	public  SipServerConnection sscTemp = null;
	private SipServerConnection sscDeny = null;
	private SipServerConnection origSSC = null;
	
	
	private Display display;
	
	public String myComSip;							//sip:xxx@xxx.xxx.xxx.xxx:xxxx
	public String mySipUri;							//sip:xxx@xxx.xxx.xxx.xxx
	public String myContactAddr;					//sip:xxx.xxx.xxx.xxx:xxxx
	public String myIpAddr;							//xxx.xxx.xxx.xxx
	public final int myLocalPort = 5070;			//xxxx
	
	public final String listenPort = "sip:5070";
	
	

	
	private String sdp;
	
	//variables of splash screen 
	private Alert splashScreenAlert;
	private Image splashScreen;
	
	
	private Alert screenAlert;
	
	private boolean imageLoaded;
	private boolean firstTime;
	
	static final int Timeout = 500;
	
	//variable of main menu
	private static final String[] mainMenu_function = {"Sign in","Chat","Sign Out"};
	private static List mainMenu_List;	
	private int menuNo = 0;
	
	
	// command
	private Command exitCmd = new Command("EXIT",Command.EXIT,1);
	private Command aboutCmd = new Command("About",Command.HELP,1);
	
//------------------------------------------------------------------------------	
	// Sign In
	Form signIn_Form;
	
	boolean connected = false;
	
	String contactAddr;
	String sipUri;
	String serverAddr;
	String displayName;
	String buddyName;
	
	TextField server_TextField;
	TextField uri_TextField;
	TextField name_TextField;
	
	//Alert logInAlert;
	
	private Command backCmd = new Command("BACK",Command.BACK,1);
	private Command signCmd	= new Command("OK",Command.OK,1);
	private Command clearSignCmd = new Command("CANCEL",Command.CANCEL,2);
	
	private static final String logInOk = "log in pass!";
	private static final String logInFail = "log in fail!";
	
//------------------------------------------------------------------------------
	Form authen_Form;
	
	String realm;
	
	TextField realm_TextField;
	TextField userName_TextField;
	TextField password_TextField;
	
	private Command authenCmd = new Command("OK",Command.OK,1);


//------------------------------------------------------------------------------

	// Invite
	Form invite_Form;
	
	TextField invite_TextField;
	
	private Command inviteCmd = new Command("INVITE",Command.OK,1);
	private Command clearInviteCmd = new Command("CANCEL",Command.CANCEL,2);
	private Command cancelInviteCmd = new Command("CANCEL",Command.CANCEL,1);
	private Command reInviteCmd = new Command("Try Again",Command.OK,1);
	
	StringItem invite_Str;
	
	public SipDialog dialog;
	
	public boolean inviting = false;
	public boolean invited = false;
	
	private String inviteName;
	public String buddyUri;

//------------------------------------------------------------------------------
	// incomming Invite
	private Form inComming_Form;
	
	private Command acceptCmd = new Command("ACCEPT",Command.BACK,1);
	private Command denyCmd = new Command("DENY",Command.OK,2);
		
//------------------------------------------------------------------------------
	// InStant Messaging
	public boolean chating = false;
	
	private Form imWindow_Form;
	private TextField message_TextField;
	
	private Command sendCmd = new Command("SEND",Command.OK,1);
	private Command byeCmd = new Command("EXIT",Command.BACK,0);
	
	private long startTime;
	
	private boolean lastMsg = false;



//------------------------------------------------------------------------------	
// Constructor
	public SipClient(){
		
		String status;
		System.out.println("SipClient"); 
		
		SipConnectionNotifier scn = null;
		try{
			scn = (SipConnectionNotifier) Connector.open(listenPort);
			if(scn != null){
				//resolve Contact address form SipConnectNotifier 
				contactAddr = new String("sip:"+scn.getLocalAddress()+":"+myLocalPort);
				System.out.println(contactAddr);
				myIpAddr = new String(scn.getLocalAddress());
			}
			scn.close();
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("Exception SipClient");
		}
		
		
		display = Display.getDisplay(this);
		
//------------------------------------------------------------------------------		
		//Main Form
		if(connected){
			status = "Status : Online";
		}else{
			status = "Status : Offline";
		}
		
		// new main menu List
		
		mainMenu_List = new List(status,Choice.IMPLICIT);
		mainMenu_List.addCommand(exitCmd);
		mainMenu_List.addCommand(aboutCmd);
		mainMenu_List.setCommandListener(this);
		
		
		
		// put main menu function to main menu list 
		for(int i = 0; i < mainMenu_function.length; i++){
			mainMenu_List.append(mainMenu_function[i],null);
		}
		
//------------------------------------------------------------------------------
				
		//Splash Screen
		try{
			splashScreen = Image.createImage("/splashScreen.png");
			imageLoaded = true;
		}catch(java.io.IOException ex){
			System.out.println("Load image error");			
		}
		splashScreenAlert = new Alert("Sip Client","",splashScreen, AlertType.INFO);
		
		splashScreenAlert.setTimeout(Timeout);
		
		
		firstTime = true;
		
		
		
	}


//commandAction
	public void commandAction(Command cmd, Displayable displayable){
				
		if(cmd == exitCmd){
			destroyApp(true);
		}else if((displayable == mainMenu_List && cmd == List.SELECT_COMMAND)){
			menuNo = mainMenu_List.getSelectedIndex();
			switch(menuNo){
				case 0:
					if(connected){
						//alert "you signIn already" and back to main menu
						alertToMain("you signIn already!!!");
					}else{
						signIn();
					}
					break;
				case 1:
					if(connected){
						invite();
					}else{
						alertToMain("Please sign in ");
					}
					break;
				case 2:
					if(connected){
						signOut();
					}else{
						alertToMain("Please sign in ");
					}
					break;
				default:
					//System.out.println("don't know");
					break;
					
			}
		}else if(cmd == backCmd){
			showMainMenu();
//command signIn				
		}else if(cmd == signCmd){
				
			Thread t = new Thread(){
				public void run(){
					doSignIn();
				}
			};
			t.start();
				
		}else if(cmd == authenCmd){
			Thread t = new Thread(){
				public void run(){
					//doAuthen();
				}
			};
			t.start();	
		}else if(cmd == clearSignCmd){
			name_TextField.setString("");
			uri_TextField.setString("sip:");
			server_TextField.setString("sip:");
			
		}else if(cmd == inviteCmd){
			System.out.println("invite");
			invite_Form.deleteAll();
			invite_Form.removeCommand(inviteCmd);
			invite_Form.removeCommand(clearInviteCmd);
			invite_Form.addCommand(cancelInviteCmd);
			Thread t = new Thread(){
				public void run(){
					doInvite();
				}
			};
			t.start();
		}else if(cmd == clearInviteCmd){
			invite_TextField.setString("sip:");
		}else if(cmd == cancelInviteCmd){
			System.out.println("Cancel invite");
			if(inviting){
				cancelInvite();
			}else{
				System.out.println("Nothing");
				showMainMenu();
			}
		}else if(cmd == reInviteCmd){
			invite();
		}else if(cmd == acceptCmd){
			System.out.println("accept incomming");
			showMainMenu();
			acceptInComming();
		}else if(cmd == denyCmd){
			System.out.println("deny incomming");
			buddyUri = null;
			showMainMenu();
			denyInComming();
		}else if(cmd == sendCmd){
			System.out.println("send Message");
			Thread t = new Thread(){
				public void run(){
					doSendMessage();
				}
			};
			t.start();
		}else if(cmd == byeCmd){
			System.out.println("bye IM");
			doSendBye();
		}
		
	}
	


//showMainMenu
	void showMainMenu(){
		System.out.println("ShowMainMenu");
		String status;
		
		if(connected){
			status = "Status : Online";
		}else{
			status = "Status : Offline";
		}
		
		// new main menu List
		mainMenu_List = new List(status,Choice.IMPLICIT);
		mainMenu_List.addCommand(exitCmd);
		mainMenu_List.addCommand(aboutCmd);
		mainMenu_List.setCommandListener(this);
		
		// put main menu function to main menu list 
		for(int i = 0; i < mainMenu_function.length; i++){
			mainMenu_List.append(mainMenu_function[i],null);
		}	
		
		display.setCurrent(mainMenu_List);
	}
	
//signIn
	private void signIn(){
		signIn_Form = new Form("Sign In:");
		
		System.out.println("signIn()");
		name_TextField = new TextField("Your Name:","",40, TextField.LAYOUT_LEFT);
		uri_TextField = new TextField("sip URI:", "sip:44010025@161.246.6.114", 40, TextField.LAYOUT_LEFT);
		server_TextField = new TextField("Server Address:", "sip:161.246.6.114", 40, TextField.LAYOUT_LEFT);
		
		serverAddr = server_TextField.getString();
		
		signIn_Form.append(name_TextField);
		signIn_Form.append(uri_TextField);
		signIn_Form.append(server_TextField);
		
		signIn_Form.addCommand(backCmd);
		signIn_Form.addCommand(signCmd);
		signIn_Form.addCommand(clearSignCmd);
		
		signIn_Form.setCommandListener(this);
		
		
		display.setCurrent(signIn_Form);
		
	}
	
//signOut
	private void signOut(){
		connected = false;
		inviting = false;
		invited = false;
		stopListener();
		//alertToMain();
		showMainMenu();
	}
	
/*
//authentication
	private void authentication(){
		System.out.println("authentication()");
		authen_Form = new Form("Server Require password");
		
		
		int a,b;
		
		a = serverAddr.indexOf(':');
		b = serverAddr.length();
		
		realm = serverAddr.substring(a+1,b);	
		
		String username;
		
		username = uri_TextField.getString();
		
		int c,d;
		
		c = username.indexOf(':');
		d = username.indexOf('@');
		
		username = username.substring(c+1,d);
	

		realm_TextField = new TextField("Server Address",realm,40,TextField.UNEDITABLE);
		userName_TextField = new TextField("sip URI:",username,40,TextField.UNEDITABLE);
		password_TextField = new TextField("password : ","",40,TextField.PASSWORD);
		
		
		authen_Form.addCommand(backCmd);
		authen_Form.addCommand(authenCmd);
		
		authen_Form.append(realm_TextField);
		authen_Form.append(userName_TextField);
		authen_Form.append(password_TextField);
		
		authen_Form.setCommandListener(this);
		display.setCurrent(authen_Form);
		
		
		
		
	}
*/	
	
//invite
	private void invite(){
		invite_Form = new Form("Invite Contact:");
		
		System.out.println("invite()");
		invite_TextField = new TextField("sip URI:","sip:44010084@161.246.6.114",40, TextField.LAYOUT_LEFT);
		
		invite_Form.append(invite_TextField);
		
		invite_Form.addCommand(backCmd);
		invite_Form.addCommand(inviteCmd);
		invite_Form.addCommand(clearInviteCmd);
		
		invite_Form.setCommandListener(this);
		
		display.setCurrent(invite_Form);
	}
	
//inComming
	private void inComming(String inviteFrom){
		
		System.out.println("inComming");
				
		inComming_Form = new Form("INCOMMING INVITE:");
		inComming_Form.append(inviteFrom+" invite you!!!");
		inComming_Form.addCommand(acceptCmd);
		inComming_Form.addCommand(denyCmd);
		inComming_Form.setCommandListener(this);
					
					
		display.setCurrent(inComming_Form);
		
	}
//acceptInComming
	void acceptInComming(){
		System.out.println("acceptInComming");
		SipServerConnection sscAccept;
		sscAccept = sscTemp;
		try{
			sscAccept.initResponse(200);
			System.out.println("send 200 OK");
		
			String sdp = new String("v=0"+
									"\no=- 0 0 IN IP4 "+myIpAddr+
									"\ns=session"+
									"\nc=IN IP4 "+myIpAddr+
									"\nt=0 0"+
									"\nm=message 5060 sip null");
		
			sscAccept.setHeader("Content-Length", ""+sdp.length());
			sscAccept.setHeader("Content-Type", "application/sdp");
			//sscAccept.setHeader("Contact",myContactAddr);
			//send 200 ok with my complete sip uri
			sscAccept.setHeader("Contact",myComSip);
		
			OutputStream outStr = sscAccept.openContentOutputStream();
			outStr.write(sdp.getBytes());
			outStr.close();
			
			
			//save Dialog
			dialog = sscAccept.getDialog();
			System.out.print("Dialog state : ");
			System.out.println(dialog.getState());
			System.out.println("Waiting ACK...");
			
			sscAccept.close();
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("Exception acceptInComming");
		}		
	}

//denyInComming
	void denyInComming(){
		System.out.println("deny InComming");
		SipServerConnection sscDeny;
		sscDeny = sscTemp;
		
		invited = false;

		try{
			sscDeny.initResponse(486);
			sscDeny.send();
			System.out.println("Session close : Busy here!");
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("Exception denyInComming");
		}
	}
	
//FetchIM
	private void fetchIM(){
		System.out.println("FetchIM()");
		imWindow_Form = new Form("Chat box");
		message_TextField = new TextField("Message","",255,TextField.LAYOUT_LEFT);
					
		imWindow_Form.append(message_TextField);
		imWindow_Form.addCommand(sendCmd);
		imWindow_Form.addCommand(byeCmd);
					
		imWindow_Form.setCommandListener(this);
					
		display.setCurrent(imWindow_Form);
	}
//alertToMain
	private void alertToMain(String alertText){
		System.out.println("alertToMain()");
		screenAlert = new Alert("Message",alertText,null, AlertType.INFO);	
		screenAlert.setTimeout(2000);
		display.setCurrent(screenAlert,mainMenu_List);
		
	}
	
//doSignIn
	private void doSignIn(){
		System.out.println("doSignIn()");
		try{
			
			SipClientConnection scc = null;
			
			displayName = name_TextField.getString();
			
			scc = (SipClientConnection) Connector.open(server_TextField.getString());
			
			scc.setListener(this);
			
			scc.initRequest("REGISTER",null);
			
			scc.setHeader("From",uri_TextField.getString());
			
			scc.setHeader("To",uri_TextField.getString());
			
			scc.setHeader("Contact",contactAddr);
			
			scc.send();
			
			//wait for get 200 ok
			boolean gotit = scc.receive(10000);
			if(gotit){
				if(scc.getStatusCode() == 200){
					System.out.println("Time out");
						
					connected = false;

					alertToMain(logInFail);
						
				}else{
					System.out.println("Error : "+scc.getReasonPhrase());
				}
			}
			
			
				
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("Exception doSignIn");
		}
	}
/*
//doAuthen
	private void doAuthen(){
		System.out.println("doAuthen()");
		
		try{
			
			SipClientConnection scc = null;
			
			scc = (SipClientConnection) Connector.open(server_TextField.getString());
			
			scc.setListener(this);
			
			scc.initRequest("REGISTER",null);
			
			scc.setHeader("From",uri_TextField.getString());
			
			scc.setHeader("To",uri_TextField.getString());
			
			scc.setHeader("Contact",contactAddr);
			
			scc.setCredentials(userName_TextField.getString(),password_TextField.getString(),realm_TextField.getString());
			
			scc.send();
				
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("Exception doAuthen");
		}
		
		
	}
*/	
//doInvite
	private void doInvite(){
		System.out.println("doInvite()");
		
		try{
			SipClientConnection scc = null;
			scc = (SipClientConnection) Connector.open(invite_TextField.getString());
			//get it for reuse when user want to cancel
			sccTemp = scc;
			
			scc.setListener(this);
			
			inviteName = invite_TextField.getString();
			
			String sdp = new String("v=0"+
									"\no=- 0 0 IN IP4 "+myIpAddr+
									"\ns=session"+
									"\nc=IN IP4 "+myIpAddr+
									"\nt=0 0"+
									"\nm=message 5060 sip null");
			
			scc.initRequest("INVITE",null);
			
			scc.setHeader("From",mySipUri);
		
			
			scc.setHeader("Contact",myContactAddr);
			
			scc.setHeader("Content-Length", ""+sdp.length());
			scc.setHeader("Content-Type", "application/sdp");
			
			OutputStream outStr = scc.openContentOutputStream();
			outStr.write(sdp.getBytes());
			outStr.close();
			
			invite_Str = new StringItem("Inviting...",scc.getHeader("To"));
			
			invite_Form.append(invite_Str);
			
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("Exception doInvite");
		}
		
	}
	private void cancelInvite(){
		System.out.println("cancelInvite()");
		
		System.out.print(sccTemp);
		//get scc after invite and then reuse it for cancle invite
		scc = sccTemp;
		
		if(scc != null){
			try{
				SipClientConnection cancel = scc.initCancel();
				cancel.send();
				System.out.println("send Cancel");
				if(cancel.receive(30000)){
					System.out.print("Session canceled : ");
					System.out.println(cancel.getReasonPhrase());
					
				}else{
					System.out.println("Error canceling the call...");
				}
			}catch(Exception ex){
				ex.printStackTrace();
				System.out.println("Exception cancelInvite");
			}
		}
		
		buddyUri = null;
	}

//doSendMessage
	private void doSendMessage(){
		System.out.println("doSendMessge()");
		SipClientConnection scc = null;
		try{
			scc = (SipClientConnection) Connector.open(buddyUri);
			scc.setListener(this);
			String text = message_TextField.getString();
			scc.initRequest("MESSAGE",null);
			scc.setHeader("From",mySipUri);
			scc.setHeader("DisplayName",displayName);
			scc.setHeader("Content-Type","text/plain");
			scc.setHeader("Content-Length",""+text.length());
			
			//String sender = scc.getHeader("From");
			
			OutputStream outStr = scc.openContentOutputStream();
			outStr.write(text.getBytes());
			outStr.close();
			
			System.out.println("Send MESSAGE");
			
			System.out.println("sender is "+displayName);
			System.out.println("message is "+text);
			
			message_TextField = new TextField("Message","",255,TextField.LAYOUT_LEFT);
			
			setImForm(displayName,text);
			
			
			startTime = System.currentTimeMillis();
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("Exception doSendMessage");		
		}
		
	}

//setImForm
	private void setImForm(String name,String msg){
		System.out.println("setImForm");
		
		int count = imWindow_Form.size();
		
		/*
		int a,b;
		
		a = name.indexOf(':');
		b = name.indexOf('@');
		
		name = name.substring(a+1,b);
		*/
		
		String sender;
		if(lastMsg){
			sender = new String(name+" ");
		}else{
			sender = new String(name+" says:\n");
		}
		
		StringItem strItem = new StringItem(sender,msg);
		
		imWindow_Form.delete(count-1);
		imWindow_Form.append(strItem);
		imWindow_Form.append(message_TextField);
		
		display.setCurrent(imWindow_Form);
	}


//doSendBye
	private void doSendBye(){
		System.out.println("doSendBye");
		if(dialog != null){
			try{
				SipClientConnection scc = dialog.getNewClientConnection("BYE");
				scc.send();
				
				System.out.println("Send bye...");
				
				//wait for get 200 ok
				boolean gotit = scc.receive(10000);
				if(gotit){
					if(scc.getStatusCode() == 200){
						System.out.println("Session closed successfully...");
						System.out.println("Dialog state : "+dialog.getState());
						
						//set variable chating invitng invited = false
						chating = false;
						inviting = false;
						invited = false;
						showMainMenu();
						
						// add nat
						System.out.println("scn after send bye : "+scn);
						
					}else{
						System.out.println("Error : "+scc.getReasonPhrase());
					}
				}
				
				scc.close();
				
			}catch(IOException iox){
				iox.printStackTrace();
				System.out.println("Exception sendBye");
			}
		}else{
			System.out.println("No dialog information!");
		}
		
	}	
	
//startApp
	public void startApp(){
		if(firstTime){
			display.setCurrent(splashScreenAlert, mainMenu_List);
			firstTime = false;		
			//SipClientConnection scc = null;			
		}
		
	}
	
//pauseApp
	public void pauseApp(){
		
	}
//destroyApp
	public void destroyApp(boolean conditional){
		notifyDestroyed();
	}
//notifyResponse
	public void notifyResponse(SipClientConnection scc){
		System.out.println("notifyResponse()");
		int statusCode;
		try{
			scc.receive(0);
			statusCode = scc.getStatusCode();
			
			if(statusCode < 200){
				switch(statusCode){
					case 100:
						System.out.print("100 Trying...");
						if(scc.getMethod().equals("REGISTER")){
							System.out.println("of REGISTER");
						}else if(scc.getMethod().equals("INVITE")){
							System.out.println("of INVITE");
							//inviting = true;
						}
						break;
					case 180:
						System.out.print("180 Ringing...");
						if(scc.getMethod().equals("INVITE")){
							System.out.println("of INVITE");
							inviting = true;
							dialog = scc.getDialog();
							System.out.println("Early-Dialog state: "+dialog.getState());
							
						}
						break;
					default:
						System.out.println(statusCode);
						break;
				}
				
			}else if(statusCode == 200){
				System.out.println("200 OK");
				System.out.println("getMethod : "+scc.getMethod());
				
				if(scc.getMethod().equals("REGISTER")){
					System.out.println("REGISTER OK");
					connected = true;
					mySipUri = uri_TextField.getString();
					myContactAddr = contactAddr; 
					
											
					showMainMenu();
					
					startListener();
					
					myComSip = new String(mySipUri+":"+myLocalPort);
					
				}else if(scc.getMethod().equals("INVITE")){
					System.out.println("INVITE OK");
					String contentType = scc.getHeader("Content-Type");
					String contentLength = scc.getHeader("Content-Length");
					
					
					System.out.println("Session Established : ");
					System.out.println(scc.getHeader("Call-ID"));
					
					 
					buddyUri = inviteName;
					
					System.out.println("buddyUri : "+buddyUri);
					
					
					int length = Integer.parseInt(contentLength);
					if(contentType.equals("application/sdp")){
						//
						//handle SDP here
						//
					}
					dialog = scc.getDialog();
					System.out.println("Dialog state: "+dialog.getState());
					
					scc.initAck();
					scc.send();
					System.out.println("Send ACK");
					
					scc.close();
					
					//goto Instant Messageing windows
					chating = true;
					//inviting fetch
					fetchIM();
					
					System.out.println("FetchIM already!!");
								
				}else if(scc.getMethod().equals("CANCEL")){
					System.out.println("CANCEL OK");
				}
				
			}else if(statusCode >= 300){
				System.out.println("statusCode >= 300");
				if(scc.getMethod().equals("INVITE")){
					switch(statusCode){
						case 487:
							System.out.println("Request Terminated Already");
							inviting = false;
							buddyUri = null;
							showMainMenu();
							break;
						default:
							invite_Str = new StringItem("Session Failed: ",scc.getHeader("Call-ID"));
							invite_Form.append(invite_Str);
							invite_Form.removeCommand(cancelInviteCmd);
							invite_Form.addCommand(reInviteCmd);
							invite_Form.setCommandListener(this);
							
							inviting = false;
							buddyUri = null;
							
							break;
					}
					alertToMain("Cann't invite.");
				}else if(scc.getMethod().equals("REGISTER")){
					switch(statusCode){
						/*
						case 401:
							System.out.println("Unauthorized");
							connected = false;
							authentication();
						*/
						default:
							alertToMain("Please Sign in again!!");
							connected = false;
							break;
							
					}
				}
				
				//alert and back to main menu
				
			}
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("Exception notifyResponse");
		}
	}
	
	//notifyRequest
	public void notifyRequest(SipConnectionNotifier scn){
		System.out.println("notifyRequest()");
		SipServerConnection ssc = null;	
		try{
			ssc = scn.acceptAndOpen();
			sscTemp = ssc;
			
			if(ssc.getMethod().equals("INVITE")){
				origSSC = ssc;
				System.out.println("Receive INVITE");
				invited = true;
				
				String contentType = ssc.getHeader("Content-Type");
				String contentLength = ssc.getHeader("Content-Length");
				int length = Integer.parseInt(contentLength);
				
				
				System.out.println(contentType);
				if(contentType.equals("application/sdp")){
				
					InputStream is = ssc.openContentInputStream();
					
		    		byte content[] = new byte[length];
		    		is.read(content);
		    		
					
					
					ssc.initResponse(180);
					ssc.send();
					
					dialog = ssc.getDialog();
		    		System.out.println("Dialog state: " + dialog.getState());
					
							
					String from;
					
					from = ssc.getHeader("From");
					
					int a = from.indexOf('<');
					int b = from.indexOf('>');
					from = from.substring(a+1,b);					
					
					System.out.print("From :");
					System.out.println(from);
					
					buddyUri = from;
					inComming(from);
					return;
					
				}		
			}else if(ssc.getMethod().equals("ACK")){
				if(invited){
					System.out.println("");
					System.out.println("Receive ACK");
					System.out.println("Session established : "+ssc.getHeader("Call-ID"));
					System.out.println("Dialog state : "+dialog.getState());
					
					ssc.close();
				
					//goto InstantMessage
					chating = true;
					//invited fetch
				
					fetchIM();
				
					System.out.println("FetchIM Already!!");
				}
					
				
			}else if(ssc.getMethod().equals("CANCEL")){
				System.out.println("Receive CANCEL");
				
				if(invited){
					ssc.initResponse(200);
					ssc.send();
					System.out.println("Send 200");
					origSSC.initResponse(487);
					origSSC.send();
					System.out.println("Send 487");
					invited = false;
					System.out.print("Session cancled : ");
					System.out.println(ssc.getHeader("Call-ID"));
					ssc.close();
					
					buddyUri = null;
					
					inComming_Form.append("\nSession Canceled!!!");
					inComming_Form.removeCommand(acceptCmd);
					inComming_Form.removeCommand(denyCmd);
					inComming_Form.addCommand(backCmd);				
				}
				
			}else if(ssc.getMethod().equals("MESSAGE")){
				System.out.println("Receive Message");
				String contentType = ssc.getHeader("Content-Type");
				String contentLength = ssc.getHeader("Content-Length");
				int length = Integer.parseInt(contentLength);
				if((contentType != null) && contentType.equals("text/plain")){
					InputStream inStr = ssc.openContentInputStream();
					int i = 0;
					byte testBuffer[] = new byte[length];
					i = inStr.read(testBuffer);
					
					String tmp = new String(testBuffer,0,i);
					
					buddyName = ssc.getHeader("DisplayName");
					
					/*
					String sender = ssc.getHeader("From");
					
					int a,b;
					
					a = sender.indexOf('<');
					b = sender.indexOf('>');
					sender = sender.substring(a+1,b);
					*/
					
					System.out.println("sender is "+buddyName);
					System.out.println("message is "+tmp);
					
					setImForm(buddyName,tmp);
					
					
				}
				ssc.initResponse(200);
				ssc.send();	
				
				ssc.close();
						
			}else if(ssc.getMethod().equals("BYE")){
				System.out.println("Receive Bye");
				ssc.initResponse(200);
				ssc.send();
				System.out.println("send 200");
				
				System.out.println("Other side send bye");
				
				System.out.println("Closing notifier...");
				
				
				lastMsg = true; 
				setImForm(buddyName," has been left this chat");
				
				imWindow_Form.removeCommand(byeCmd);
				imWindow_Form.removeCommand(sendCmd);
				imWindow_Form.addCommand(backCmd);
				
				//add nat
				//didn't use because user can invite again
				//scn.close();
				//set variable chating invited inviting = false;
				chating = false;
				invited = false;
				inviting = false;
				
			}
			
		}catch(IOException ex){
			// handle IOException
			ex.printStackTrace();
			System.out.println("Exception notifyRequest");
		}
	}
	
	//startListener()
	private void startListener(){
		System.out.println("startListener()");
		try{
			if(scn != null){
				scn.close();
				System.out.println("scn close");
			}
			//start a listener for incomming request
			scn = (SipConnectionNotifier) Connector.open(listenPort);
			System.out.print("Listening on port: ");
			System.out.println(scn.getLocalPort());
			scn.setListener(this);
			
		}catch(Exception ex){
			ex.printStackTrace();
			System.out.println("Exception startListener");
		}
	}
	
	//stopListener()
	private void stopListener(){
		System.out.println("stopListener()");
		try{
			if(scn != null){
				scn.close();
				System.out.println("scn.close");
			}
			scn = null;
			System.out.println("scn = null");
		}catch(IOException ex){
			// handle IOException
			System.out.println("Exception stopListener");
		}
	}
	
//-------------------------------------------------------------------------------------------------
	
}