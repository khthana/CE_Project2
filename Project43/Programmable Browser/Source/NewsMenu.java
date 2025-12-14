import java.awt.*;
import java.awt.event.*;
import java.io.*;
import java.net.*;
import java.util.Vector;
import java.util.StringTokenizer;
import java.rmi.Naming;
import java.rmi.server.*;
import java.io.Serializable;


//News Interface Menu : User can read News & user can send them to his friend by RMI
class NewsMenu extends Frame implements AgentInf,Serializable,WindowListener 
{
	Label server = new Label();
	Label group = new Label();
	TextField textServer = new TextField();
	TextField textGroup = new TextField();
	TextArea newsArea = new TextArea();
	List subjectList = new List();
	Label subject = new Label();

	MenuBar menu = new MenuBar ();
	Menu fileMenu = new Menu ("File");
	Menu editMenu = new Menu ("Edit");
	Menu userMenu = new Menu ("User");

	String path = "";

	Socket news;
	PrintStream newsOut;
	DataInputStream newsIn;
	BufferedReader in;
	NewsArticle currentArt;
	Vector articles = new Vector();

	String newsServer,newsGroup;
	String name = "";
	String status = "";
	String friend ="";
	String allDetail="";
	ServerInf agentServer;
	boolean connect = false;
	boolean profile = true;
	String key;
	boolean script = false;
	boolean sendNewsScript = false;
	String newsScript = "";

//Interface Menu
	NewsMenu(String s) throws Exception
	{	
		super(s);
		setLayout(null);
		server.setText("News Server : ");
		server.setBounds(15, 67, 81, 23);
		group.setText("News Group : ");
		group.setBounds(15, 113, 82, 19);
		textServer.setBounds(105, 71, 149, 20);
		textServer.setEditable (false);
		textGroup.setBounds(105, 111, 152, 23);
		textGroup.setEditable (false);
		newsArea.setBounds(15, 150, 500, 402);
		subjectList.setBounds(280, 65, 233, 69);
		subject.setText("Subject : ");
		subject.setBounds(280, 46, 69, 14);

		newsArea.setText("If you want to forward your friend news !!\n, You must select 'Create Profile Connection' in User Menu .");

		add(newsArea);
		add(textGroup);
		add(textServer);
		add(server);
		add(group);
		add(subject);
		add(subjectList);

		menu.add (fileMenu);
		fileMenu.add ("Reset");	
		fileMenu.addSeparator ();
		fileMenu.add ("Save");
		fileMenu.add ("Save As");
		fileMenu.addSeparator();
		fileMenu.add ("Exit");
		menu.add (editMenu);
		editMenu.add ("Config News Server");
		editMenu.add ("Close Host");

		menu.add (userMenu);
		userMenu.add("Create Profile Connection");
		userMenu.add("User Profile");
		setMenuBar (menu);
		MenuAction menuAct = new MenuAction ();
		ListAction listAct = new ListAction ();
		fileMenu.addActionListener (menuAct);
		editMenu.addActionListener (menuAct);
		userMenu.addActionListener (menuAct);

		subjectList.addItemListener(listAct);

		addWindowListener(this);
	}

	

	NewsMenu(String server,String group,String send2Friend) throws Exception
	{
		script = true;
		newsServer = server;
		newsGroup = group;
		if (send2Friend.equals("yes"))
		{
			sendNewsScript = true;
			setConnection();
		//	connectRmi();
		}
		connectHost();
		readNews();	
		closeHost();
	
	}

//------------- Window ------------------------
	public void windowClosed (WindowEvent e) {}
	public void windowClosing (WindowEvent e) 
	{
		try
		{
			if (connect){agentServer.remove(name);}
			dispose();
		}
		catch (Exception ex){System.out.println(ex);}
	}
	public void windowOpened (WindowEvent e) {}
	public void windowIconified (WindowEvent e) {}
	public void windowDeiconified (WindowEvent e) {}
	public void windowActivated (WindowEvent e) {}
	public void windowDeactivated (WindowEvent e) {}

//------------- end window -------------------------

	public static void main(String[] args) throws Exception 
	{
		NewsMenu a = new NewsMenu("News Reader");
		a.setBackground(Color.lightGray);
		a.setSize(530,555);
		a.show();
		a.setVisible(true);
	}
//Action that user select
	class MenuAction implements ActionListener
	{
		public void actionPerformed (ActionEvent e) 
		{
			String args = e.getActionCommand();
			if ( args == "Reset" )
			{
				textServer.setText (" ");
				textGroup.setText  (" ");
				newsArea.setText   (" ");
				subjectList.removeAll ();
			}
			if ( args == "Save As" ){saveAs (e);}
			if ( args == "Save" ){save (e);}
			if ( args == "Close Host" ){closeHost (e);}
			if ( args == "Exit" ){exit(e);}
			if ( args == "Config News Server" ){addNewsDialog (e);}
			if (args == "User Profile"){setUserProfile (e);}
			if (args == "Create Profile Connection")
			{
				try{setConnection ();}
				catch (Exception ex){System.out.println(ex);}	
			}
		}//end actionperformed
	}//end MenuAction

	class ListAction implements ItemListener
	{
		public void itemStateChanged(ItemEvent e) 
		{
			int index = subjectList.getSelectedIndex();
			currentArt = (NewsArticle)articles.elementAt(index) ;
			newsArea.setText(currentArt.body) ;
		}
	}//end ListAction

//******************************************** Action ****************************************//

//exit from NewsMenu
	void exit(ActionEvent e)
	{
		try
		{
			if (connect){agentServer.remove(name);}	
			dispose();
		}
		catch (Exception ex){System.out.println(ex);}
	}

//setConnection to NewsServer
	void setConnection() throws Exception
	{
		getUserProfile();
		if (profile)
		{
			UnicastRemoteObject.exportObject (this);
			agentServer = (ServerInf) Naming.lookup("rmi://161.246.5.111/Agent Server");
			agentServer.register(this,name);
			connect = true;
		}	
	}


//user fill in userProfile form & save at C:\\My Documents\\user_profile.txt
	void setUserProfile (ActionEvent ae)
	{
		String userDetail;
		try
		{
			//show userProfile form
			UserProfile user = new UserProfile(this,"User Profile",true);
			user.setSize(270,186);
			user.show();
			
			if (!(user.userName.equals(null)))
			{
				userDetail = "Name:"+user.userName+"\n"
						 + "Interest:"+user.userInterest+"\n"
						 + "Friend:"+user.userFriend;
				name = user.userName;
				status = user.userInterest;
				friend = user.userFriend;				
				FileOutputStream userFile = new FileOutputStream("C:\\My Documents\\user_profile.txt");
				userFile.write(userDetail.getBytes());
				userFile.close();
			}
		}
		catch (Exception e){System.out.println(e);}	
	}

//get value from userProfile for sending News to friend
	void getUserProfile()
	{
		boolean more=true;
		String line;
		try
		{
			FileInputStream fin = new FileInputStream("C:\\My Documents\\user_profile.txt");
			BufferedReader in = new BufferedReader(new InputStreamReader(fin));
			while (more)
			{	line = in.readLine();
				if (line == null)
				{
					more = false;
				}
				else 
				{
					StringTokenizer detail = new StringTokenizer(line,":");
					String type = detail.nextToken();
					if (type.equals("Name")){name = detail.nextToken();}
					if (type.equals("Interest")){status = detail.nextToken();}
					if (type.equals("Friend")){friend = detail.nextToken();}
				}
			}	
			in.close();
			profile = true;
		}
		catch (FileNotFoundException fe)
		{
			if (!sendNewsScript)
			{
				System.out.println(fe);
				WarnProfile pf = new WarnProfile("You must create user-profile in User Menu and create Profile Connection Again !!");
				pf.setSize(450,100);
				pf.setBackground(Color.lightGray);
				pf.show();
			}
		

			profile = false;
		}		
		catch (IOException ie){System.out.println(ie);}
	}
	
//save News Data	
	void saveAs ( ActionEvent ae ) {
		try
		{
			FileDialog saveAs = new FileDialog ( (Frame)this, "Save As", FileDialog.SAVE);
			saveAs.show ();
			String dir = saveAs.getDirectory ();
			String fname = saveAs.getFile ();
			path = dir+fname;

			FileOutputStream fout = new FileOutputStream ( path );
			String data = newsArea.getText ();
			fout.write ( data.getBytes () );
			fout.close ();	
		}
		catch ( FileNotFoundException fnf){System.out.println ("There is FileNotFoundException occurs.");}
		catch ( SecurityException se){}
		catch ( IOException ioe){System.out.println (ioe);}
	}//end saveAs
	
//save News Data
	void save ( ActionEvent ae ) {
		try
		{
			if ( path != null)
			{
				FileOutputStream fout = new FileOutputStream ( path );
				String data = newsArea.getText ();
				fout.write ( data.getBytes () );
				fout.close ();
			}else saveAs (ae);
		}
		catch ( FileNotFoundException fnf)
		{ System.out.println ("There is FileNotFoundException occurs."); }
		catch ( SecurityException se)
		{}
		catch ( IOException ioe)
		{ System.out.println (ioe); }
	}//end save

//user can find news by filling NewsServer & NewsGroup in addNewsDialog
	void addNewsDialog ( ActionEvent ae ) {
		AddNewsDialog a = new AddNewsDialog ( this, "Add News Server", true);
		a.show ();
		textServer.setText (a.server);// get NewsServer
		textGroup.setText (a.group);  // get NewsGroup
		newsServer = a.server;
		newsGroup = a.group;
		connectHost();
		readNews();		
		closeHost();
	}//end addNewsServer

	void closeHost ( ActionEvent ae ) {closeHost();}


//******************************************** End Action ************************************//

//open connecting to NewsServer
	public void connectHost()
	{
		try
		{
			news = new Socket(newsServer,119);
			newsIn = new DataInputStream(news.getInputStream());
			in = new BufferedReader (new InputStreamReader (newsIn) );
			newsOut = new PrintStream(news.getOutputStream());
			String reply = in.readLine();
			allDetail = "";
			newsArea.append ("Connect : \n");	
			newsArea.append (reply+"\n");	
		}
		catch (Exception e){}	
	}//end connectHost

//close connection to NewsServer
	public void closeHost()
	{
		try
		{
			String cmd = "QUIT \n";
			newsOut.println(cmd);
			newsArea.append("Quit \n");
			newsIn.close();
			news.close();
		}
		catch (Exception e){System.out.println("close");}
	}//end closeHost()

//read news from newsServer & set them into page and can select subject of news in itemList & can send mail to friend
	public void readNews() {

	   int maxArticles = 20 ; //maximum news = 20
	   boolean exit = false ;
	   String id;
	   String tmp = "";
	   try {
			 String cmd = "GROUP " + newsGroup + " \n" ;
			 if (!script){newsArea.append(cmd);}
			
			 newsOut.println(cmd) ;
			 String reply = in.readLine();
			 if (!script){newsArea.append(reply + "\n") ;}

			 StringTokenizer st = new StringTokenizer(reply) ;
			 String s1 = st.nextToken() ;  // response code
			 String s2 = st.nextToken() ;  // number of appends
			 String s3 = st.nextToken() ;  // first id
			 String s4 = st.nextToken() ;  // last id
			 String s5 = st.nextToken() ;  // newsgroup

			 cmd = "STAT " + s3  + "\n" ;
			 newsOut.println(cmd) ;
			 reply = in.readLine();
			 if (!script){newsArea.append( cmd + " \n" + reply + "\n") ;}

			 String retCode ;
			 
			 do {
				if (!script){newsArea.setText("");}
				newsScript = "";
				cmd = "HEAD \n" ;
				newsOut.println(cmd) ;
				reply = in.readLine();
				if (!script){newsArea.append( cmd + " \n" + reply + "\n") ;}
				newsScript = newsScript + cmd + " \n" + reply + "\n";
				StringTokenizer tok = new StringTokenizer(reply, " ") ;
				retCode = tok.nextToken() ;
				id = tok.nextToken() ;
				String msgId = tok.nextToken() ;

				if (!retCode.equals("221")) continue ;

				// now read all header records for this article and parse
				NewsArticle art = parseHeader(id) ;
				articles.addElement(art) ;  // add to Vector

				cmd = "BODY \n" ;
				newsOut.println(cmd) ;
				reply = in.readLine();
				StringTokenizer stok = new StringTokenizer(reply) ;
				retCode = stok.nextToken() ;  // response code
				if (!retCode.equals("222")) {  // error?
				  articles.removeElement(art) ; // bad article
				  continue ;
				}

				if (!script){newsArea.append( cmd + " \n" + reply + "\n") ;}
				newsScript = newsScript + cmd + " \n" + reply + "\n";
				do {
				  reply = in.readLine();
				  if (!script){newsArea.append( reply + "\n") ;}
				  newsScript = newsScript + reply + "\n";
				} while(!reply.equals(".")) ;
				subjectList.add(art.subject);
				if (!script)
				{
					tmp = newsArea.getText();
				}
				else tmp = newsScript;
				//String tmp = newsArea.getText();
				art.body = tmp;
				allDetail = allDetail + tmp;
				allDetail = allDetail + "\n*************************************************************************************************\n";


				cmd = "\n NEXT \n" ;
				newsOut.println(cmd) ;
				reply = in.readLine();
				if (!script){newsArea.append( cmd + " \n" + reply + "\n") ;}
				newsScript = newsScript + cmd + " \n" + reply + "\n";
				StringTokenizer st2 = new StringTokenizer(reply) ;
				retCode = st2.nextToken() ;  // response code

			 } while (retCode.equals("223") && (articles.size() < maxArticles)) ;  // 421 = no  next article
			 subjectList.select(0) ;
			 currentArt = (NewsArticle)articles.elementAt(0) ;
			 newsArea.setText(currentArt.body) ;
			 FileOutputStream fileDetail = new FileOutputStream("C:\\My Documents\\news_"+newsGroup+".txt");
			 fileDetail.write ( allDetail.getBytes () );
			 fileDetail.close ();	
			 if (connect){sendToFriend();}//if you have connection to your friend ,you will send news to your friend
		 }
		 catch (Exception e) {System.out.println("Exception:" + e) ;}
	}

//send message to friend
	public void sendToFriend() throws Exception
	{agentServer.sendMessage(name,friend,newsGroup,allDetail);}

	NewsArticle parseHeader(String id) {
     NewsArticle art = new NewsArticle(id) ;
     String subject ;
     String line ;
     try {
       do {
          line = in.readLine();
          if (line.charAt(0) == 'S') {
           StringTokenizer tagTok = new StringTokenizer(line," ") ;
           if (tagTok.nextToken().equals("Subject:")) {
             art.subject = id + " "+line ;
           }
          }
       } while(!line.equals(".")) ;
     }
     catch (Exception e) {
         System.out.println("Exception:" + e) ;
     }
     return art;
  }

  public String getStatus(){return status;}

//user can recieve news from his friend too   
  public void recieve(String data,String sender)
	{
		try
		{
			FileOutputStream a = new FileOutputStream("C:\\My Documents\\tmpNews_"+sender+".txt");
			a.write(data.getBytes());
			a.close();	

			WarnProfile pf = new WarnProfile("C:\\My Documents\\tmpNews_"+sender+".txt is updated by " + sender+"......Please Check!!");
			pf.setSize(450,100);
			pf.setBackground(Color.lightGray);
			pf.show();
		}
		catch (Exception e){System.out.println(e);}	
	}

	public void setKey(String key){this.key = key;}

}//end 
