import java.awt.*;
import java.applet.*;
import java.lang.*;
import java.io.*;
import java.rmi.*;

class EditorClient 
{
	EditorServer server = null;
	Agent agent = null;
	int agentID = 0;
	public static void main(String[] args) 
	{
		EditorClient client = new EditorClient();
		try
		{
			client.connect();
			Show_window work1 = new Show_window();
			Userinterface work2 = new Userinterface(client);
			work1.show();
		}
		catch (Exception e)
		{
			System.out.println("Cannot Connect to server");
		}
	//	work2.interfaces();
	//	System.out.println("Hello World!");
	}
	protected void connect() throws java.rmi.RemoteException, java.net.MalformedURLException, java.rmi.NotBoundException {
//		String hostname = getParameter("hostname");
		server = (EditorServer) java.rmi.Naming.lookup("//" +"161.246.5.105"+"/EditorServer");
//		server.login(my_name, chatter);
		agent = new AgentImpl();
		agentID = server.Register(agent);
		System.out.println("Connect to Server Success");
		System.out.println("You have ID#" + agentID);
	}
	public EditorServer getEditorServer() { return server; }
	public Agent getAgent() { return agent; }
	public int getAgentID() { return agentID; } 

}


class Show_window extends Thread 
{	
	String CurrentDocument;
	Show_window(){ }

 	public void show()
	{
		String[] arrayofdata = new String[100];
		getformat format = new getformat();
		for (; ; )
		{
			format.passarray(arrayofdata);
			Frame frame = new Myframe("Editor Client",arrayofdata);

			frame.resize(850,560);
			frame.show();
		//	wait(tmp);
			try {
				sleep(5000);
			}
			catch (InterruptedException e) {}
			//CurrentDocument = server.refresh();
			frame.hide();
		}
	}

	public void pause(int time)
	{
		try{
			Thread.sleep(time);
		}
		catch(InterruptedException e) {}
	}

}

class Myframe extends Frame
{
	private int coX=20,coY=60;
	int sizeint=0;
	String style="",size="",type="",color="",data="";
	Label label;
	String[] format = new String[100];

	public boolean handleEvent(Event e)
	{
		if (e.id == Event.WINDOW_DESTROY)
		{
			dispose();
			System.exit(0);
		}
		return super.handleEvent(e);
	}

	public void paint(Graphics g)
	{
		int index=0;
		do{
			
			style = format[index];	index++;
			size  = format[index];	index++;	sizeint = Integer.parseInt(size);
			type  = format[index];	index++;
			color = format[index];	index++;
			data  = format[index];	index++;

			if (format[index] == "BR") {index++;}

			Font f1 = new Font(style,Font.PLAIN,sizeint);
			Font f2 = new Font(style,Font.BOLD,sizeint);
			Font f3 = new Font(style,Font.ITALIC,sizeint);

			Font f4 = new Font("Courier New",Font.BOLD,10);
			g.setFont(f4);
			g.setColor(Color.black);
			g.drawString("0",5,60);
			g.drawString("1",5,105);
			g.drawString("2",5,150);
			g.drawString("3",5,195);
			g.drawString("4",5,240);
			g.drawString("5",5,285);
			g.drawString("6",5,330);
			g.drawString("7",5,375);
			g.drawString("8",5,420);
			g.drawString("9",5,465);
			g.drawString("10",5,510);
			g.drawString("11",5,555);
			int movepixel_coX = 0;
			//set type of string
			if (type.equals("PLAIN"))
			{
	//			System.out.println("art1");
				g.setFont(f1);
			}
			if (type.equals("BOLD"))
			{
	//			System.out.println("art2");
				g.setFont(f2);
			}
			if (type.equals("ITALIC"))
			{
	//			System.out.println("art3");
				g.setFont(f3);
			}

			//set color of string
			if (color.equals("white"))
			{
				g.setColor(Color.white);
			}   
			else if (color.equals("black"))
			{
				g.setColor(Color.black);
			}
			else if (color.equals("lightGray"))
			{
				g.setColor(Color.lightGray);
			}
			else if (color.equals("gray"))
			{
				g.setColor(Color.gray);
			}
			else if (color.equals("darkGray"))
			{
				g.setColor(Color.darkGray);
			}
			else if (color.equals("red"))
			{
				g.setColor(Color.red);
			}
			else if (color.equals("green"))
			{
				g.setColor(Color.green);
			}
			else if (color.equals("blue"))
			{
				g.setColor(Color.blue);
			}
			else if (color.equals("yellow"))
			{
				g.setColor(Color.yellow);
			}
			else if (color.equals("magenta"))
			{
				g.setColor(Color.magenta);
			}
			else if (color.equals("cyan"))
			{
				g.setColor(Color.cyan);
			}
			else if (color.equals("pink"))
			{
				g.setColor(Color.pink);
			}
			else if (color.equals("orange"))
			{
				g.setColor(Color.orange);
			}

			int tmpcoX = 0;
			String data_left="",data_right="";

			FontMetrics fm1 = g.getFontMetrics(f1);
			FontMetrics fm2 = g.getFontMetrics(f2);
			FontMetrics fm3 = g.getFontMetrics(f3);

			if (type.equals("PLAIN"))
			{
	//			FontMetrics fm1 = g.getFontMetrics(f1);
				movepixel_coX = fm1.stringWidth(data);
				tmpcoX = movepixel_coX+coX;
				int width=0;
				char ch;
				int len = data.length();
	//			System.out.println(data);
				if (tmpcoX > 850)
				{
					for (int i = 0;i<len;i++)
					{
						width += fm1.charWidth(data.charAt(i));
						if ((coX+width)<850)
						{
							data_left += data.charAt(i);
						}
						else  data_right += data.charAt(i);
					}
				}
				else data_left = data;
			}

			if (type.equals("BOLD"))
			{
		//		FontMetrics fm2 = g.getFontMetrics(f2);
				movepixel_coX = fm2.stringWidth(data);
				tmpcoX = movepixel_coX+coX;
				int width=0;
				char ch;
				int len = data.length();
	//			System.out.println(data);
				if (tmpcoX > 850)
				{
					for (int i = 0;i<len;i++)
					{
						width += fm2.charWidth(data.charAt(i));
						if ((coX+width)<850)
						{
							data_left += data.charAt(i);
						}
						else  data_right += data.charAt(i);
					}
				}
				else data_left = data;
			}

			if (type.equals("ITALIC"))
			{
		//		FontMetrics fm3 = g.getFontMetrics(f3);
				movepixel_coX = fm3.stringWidth(data);
				tmpcoX = movepixel_coX+coX;
				int width=0;
				char ch;
				int len = data.length();
	//			System.out.println(data);
				if (tmpcoX > 850)
				{
					for (int i = 0;i<len;i++)
					{
						width += fm3.charWidth(data.charAt(i));
						if ((coX+width)<850)
						{
							data_left += data.charAt(i);
						}
						else  data_right += data.charAt(i);
					}
				}
				else data_left = data;
			}
			
			g.drawString(data_left,coX,coY);
			if (data_right.length()!=0)
			{
				coX = 20;
				coY += 45;
				g.drawString(data_right,coX,coY);
			}

			//next paint string
			if (type.equals("PLAIN") && data_right.equals(""))
			{ 
	//			FontMetrics fm1 = g.getFontMetrics(f1);
				movepixel_coX = fm1.stringWidth(data_left);
				coX += movepixel_coX;
			}
			else  if (type.equals("PLAIN") && data_right != "")
			{
				movepixel_coX = fm1.stringWidth(data_right);
				coX += movepixel_coX;
			}
			if (type.equals("BOLD") && data_right.equals(""))
			{
	//			System.out.println("art2");
				movepixel_coX = fm2.stringWidth(data_left);
				coX += movepixel_coX;
			}
			else if (type.equals("BOLD") && data_right != "")
			{
				movepixel_coX = fm2.stringWidth(data_right);
				coX += movepixel_coX;
			}
			
			if (type.equals("ITALIC") && data_right.equals(""))
			{
	//			System.out.println("art3");
				movepixel_coX = fm3.stringWidth(data_left);
				coX += movepixel_coX;
			}
			else if (type.equals("ITALIC") && data_right != "")
			{
				movepixel_coX = fm3.stringWidth(data_right);
				coX += movepixel_coX;
			}
			
			if (format[index-1] == "BR")
			{
				coX = 20;
				coY += 45;
			}
					
		} while(format[index] != null);
	}

/*	Myframe(String title)
	{
		super(title);
		coX = 0; coY = 0;

		MenuBar menubar = new MenuBar();
		setMenuBar(menubar);
		setLayout(new GridLayout(1,1));

//		label = new Label("This is a Window",Label.CENTER);
//		add(label);
	}*/
	Myframe(String title,String[] str)
	{
		super(title);

		for (int v=0;v<str.length;v++)
		{
//			System.out.println(str[v]);
			format[v] = str[v];
		}
	//	for (; ; )
	//	{
    //	getformat get = new getformat();
	//	get.passarray(str);
	//	repaint();
	//	}

	//	for (int u=0;u<format.length;u++ )
	//	{
	//		System.out.println(format[u]);
	//		format[v] = str[v];
	//	}

		MenuBar menubar = new MenuBar();
		setMenuBar(menubar);
		setLayout(new GridLayout(1,1));
	//	repaint();
	}
}



class getformat 
{
	getformat() {  }

	//move index of fileinputstream at 1
	void Forwardchar(int i,FileReader fis)
	{
		int tmp=0;
		try
		{	
			for (int j=0;j<i;j++)
			{	
				tmp = fis.read(); 
			}
		}
		catch(IOException e)
		{	System.out.println("Unknown IO error reading file"+"tag.txt");	System.exit(2);	}
	}

	//main
	void passarray(String[] format) 
	{
		getformat ragnarok;
		ragnarok = new getformat();
	//	FileInputStream fp;
		try
		{
		File file = new File("tag.txt");
		FileReader fp = new FileReader(file);
		int readVar,index=0;
	//	String[] format;
	//	format = new String[20];

		
	//		fp = new FileInputStream("tag.txt");
			readVar = 0;
			while(readVar != -1)
			{
				try
				{
					readVar = fp.read();
					int i=0,j=0,k=0,l=0,sizeint=0;
					String style="",size="",type="",colour="",data="";
					if (((char)readVar == '<') || ((char)readVar == 'O'))
					{
						if ((char)readVar == '<')
						{
						ragnarok.Forwardchar(6,fp);
						readVar = fp.read();
						}
						if ((char)readVar == 'O')
						{
						ragnarok.Forwardchar(4,fp);
						readVar = fp.read();
						}

						//get format of font style
						while ((char)readVar != '"')
						{
							style += (char)readVar;
							readVar = fp.read();
							i++;
						}
						format[index] = style; index++;
			
			//			System.out.println(style);
			
						ragnarok.Forwardchar(1,fp);
						readVar = fp.read();
						
						//get format of font size
						while ((char)readVar != '"')
						{
							size += (char)readVar;
							readVar = fp.read();
							j++;
						}
						format[index] = size; index++;
						sizeint = Integer.parseInt(size);

			
			//			System.out.println(size);
			
						ragnarok.Forwardchar(2,fp);
						readVar = fp.read();
			
						//get format of type charecter
						while ((char)readVar != '>')
						{
							type += (char)readVar;
							readVar = fp.read();
							k++;
						}
						format[index] = type; index++;

			//			System.out.println(type);
						ragnarok.Forwardchar(1,fp);
						readVar = fp.read();
			
						//get format of colour charecter
						while ((char)readVar != '>')
						{
							colour += (char)readVar;
							readVar = fp.read();
							l++;
						}
						format[index] = colour; index++;

			//			System.out.println(colour);
		
				
					readVar = fp.read();
					int indexdata=0;

					//get real data
					while ((char)readVar != '<')
					{
						data += (char)readVar;
						readVar = fp.read();
						indexdata++;
					}
					format[index] = data; index++;

			//		System.out.println(data);
		
					ragnarok.Forwardchar((l+3)+(k+3)+7,fp);
					readVar = fp.read();
					if ((char)readVar == 'B')
					{
			//			System.out.println("art-1");
			//			System.out.println(style+"  "+sizeint+"  "+type+"  "+colour+"  "+data);					
						ragnarok.Forwardchar(2,fp);
						format[index] = "BR"; index++;
					}	//first if
					}
				}
				catch(IOException e)
				{
					System.out.println("Unknown IO error reading file"+"tag.txt");
					System.exit(2);
				}
			} //end first while
	//		for (int v=0;v<format.length;v++ )
	//		{
	//			System.out.println(format[v]);
	//		}
				
		}
		catch(FileNotFoundException e)
		{
			System.out.println("File" + "tag.txt" + "not found");
			System.exit(1);
		}
	}
}


class Userinterface extends Frame
{
	TextField textfield;
//	TextField textField;
	private String fileName = null;
//	private AboutDialog aboutDialog = null;
	private FindDialog findDialog = null;
	private StatusUserDialog statusUserDialog = null;
	private StatuslockDialog statuslockDialog = null;
	private FileDialog saveDialog;
	String str="",list="Arial",style="PLAIN",color="black",size="14",line="Nolock";
	private boolean canlock;
	private boolean canunlock;
	public boolean nowlock;
	//EditorServer server;
	EditorClient client = null;
/*	Userinterface() {}
	public void interfaces()
	{
		Userinterface app = new Userinterface();
	}*/
	

	public Userinterface(EditorClient cli)
	{
		super("User Interface");
		client = cli;
		setup();
		pack();
		AddDialog();
		resize(880,150);
		show();
	}

	void setup()
	{
		setupMenuBars();
		setupPanels();
	}

	private void AddDialog()
	{
		saveDialog = new FileDialog(this,"Save File",FileDialog.SAVE);
	}
	void setupMenuBars()
	{
		MenuBar menuBar = new MenuBar();
		Menu fileMenu = new Menu("File");
		Menu StatusMenu = new Menu("Status");
//		fileMenu.add(new MenuItem("Open"));
		fileMenu.add(new MenuItem("Save"));
		fileMenu.add(new MenuItem("Exit"));
		StatusMenu.add(new MenuItem("User Status"));
		StatusMenu.add(new MenuItem("Lock Status"));
		menuBar.add(fileMenu);
		menuBar.add(StatusMenu);
		setMenuBar(menuBar);
	}

	void setupPanels()
	{
		EditorServer server = client.getEditorServer();
		int agentID = client.getAgentID();

		Panel mainPanel = new Panel();
		mainPanel.setLayout(new GridLayout(2,1));

		Panel panel[][] = new Panel[2][1];

		for(int i = 0;i<1;++i)
		{
			for(int j = 0;j<2;++j)
			{
				panel[j][i] = new Panel();
				
				panel[j][i].setLayout(new FlowLayout(FlowLayout.LEFT));
			}
		}

//		panel[0][0].add(new MyButton("Open",textArea));
//		panel[0][0].add(new MyButton("Save",textArea));

//		String str;
		panel[0][0].add(new Label("Text Field:"));
		textfield = new TextField("A text field.",70);
		panel[0][0].add(textfield);
//		panel[0][0].add(new TextField("A text field.",70));

//		panel[0][0].add(new TextField(2));
		Choice choice0 = new Choice();
		String lineString[]={"Nolock","0","1","2","3","4","5","6","7","8","9","10","11"};
		for(int l = 0;l<lineString.length;++l)
			choice0.addItem(lineString[l]);
		panel[0][0].add(choice0);

		panel[0][0].add(new Button("LOCK AREA"));
		panel[0][0].add(new Button("UNLOCK"));
		panel[0][0].add(new Button("OK"));

//		panel[1][0].add(new MyButton("Open"));
//		panel[1][0].add(new MyButton("Save"));
//		panel[1][0].add(new Button("REPLACE"));
//		panel[1][0].add(new Button("DELETE"));
//		panel[1][0].add(new MyButton("Lock"));
//		panel[1][0].add(new Button("<<<"));
//		panel[1][0].add(new Button(">>>"));

		panel[1][0].add(new Label("FONT"));
		Choice choice1 = new Choice();
		String listString[]={"Arial","Angsana New","Courier New","MS Sans Serif","Times New Roman"};
		for(int i = 0;i<listString.length;++i)
			choice1.addItem(listString[i]);
		panel[1][0].add(choice1);

		panel[1][0].add(new Label("STYLE"));
		Choice choice2 = new Choice();
		String styleString[]={"PLAIN","BOLD","ITALIC"};
		for(int j = 0;j<styleString.length;++j)
			choice2.addItem(styleString[j]);
		panel[1][0].add(choice2);


		panel[1][0].add(new Label("COLOR"));
		Choice choice3 = new Choice();
		String colorString[]={"black","lightGray","gray","darkGray","red","green","blue","yellow","magenta","cyan","pink","orange"};
		for(int k = 0;k<colorString.length;++k)
			choice3.addItem(colorString[k]);
		panel[1][0].add(choice3);

//		String size="";
		panel[1][0].add(new Label("SIZE"));
		panel[1][0].add(new TextField("14",2));

		panel[1][0].add(new Label("You have ID#"+agentID));
		
		for(int i = 0;i<1;++i)
			for(int j = 0;j<2;++j)
				mainPanel.add(panel[j][i]);
				add("Center",mainPanel);

	}

	public void handleButton(String label)
	{
		boolean locked;
		EditorServer server = client.getEditorServer();
		int agentID = client.getAgentID();
//		MyTextField text;

//		System.out.println("Ok sucess");
		if (label.equals("OK"))
		{
			String temp1="";
			String temp2="";
			String temp="";
			String temp3="";
			temp = "<FONT=\""+list+"\"\"" +size+"\"><"+style+"><"+color+">"+str+"</"+color+"></"+style+"></FONT>";
/*			if(canlock==true)
			{
			FileInputStream fp;
			try
			{
				fp = new FileInputStream("tag.txt");

				int readVar=0;
				int index=0;
				while(readVar != -1)
				{
					try
					{
					readVar = fp.read();
					temp1 += (char)readVar;
					}
					catch(IOException e)
					{
						System.out.println("Unknown IO error reading file"+"tag.txt");
						System.exit(2);
					}
				}
				temp3 = temp1.substring(0,temp1.length()-1);
			}
			catch (IOException e)
			{
				System.out.println("File no found");
				System.exit(1);
			}	  */

	//		temp2 = temp3.concat(temp);

			try{
/**
				FileWriter fout = new FileWriter("tag.txt");
				BufferedWriter bufferedWriter = new BufferedWriter(fout);
				PrintWriter pout = new PrintWriter(bufferedWriter);
			
				pout.print(temp2);
				pout.close();
				*/

				server.sendDocumentData(agentID, line, temp);
			}
			catch(IOException e)
			{
				System.out.println("File" + " tag.txt " + "not found");
				System.exit(1);
			}
	//	  }//end if
			//server.SendDocumentData(temp2);
		}
		if(label.equals("LOCK AREA"))
		{
			try
			{
				if (nowlock==false)
				{
					canlock = server.lock(agentID, line);
//				System.out.println("Now lock is "+nowlock);
//				if (nowlock==false)
//				{
				if (canlock==true)
				{
					System.out.println("Lock Success"+" "+line);
//				String str = server.getlineData(line);
//				System.out.println("String u want is : "+str);
						nowlock = true;
					System.out.println("Now lock is "+nowlock);
					showfindDialog("Lock line "+line+" Success.");
					String str = server.getlineData(line);
//				MyTextField text = new MyTextField(str,70);
					textfield.setText(str);
//						nowlock = true;
				}
				
//				System.out.println("Lock Success"+" "+line);
//				String str = server.getlineData(line);
//				System.out.println("String u want is : "+str);
//				showfindDialog("Lock Success");
//				String str = server.getlineData(line);
//				MyTextField text = new MyTextField(str,70);
//				textfield.setText(str);
//				System.out.println("String u want is : "+str);
				if(canlock==false)
				{	
					int ID = server.getlock_user(line);
					System.out.println("Lock not Success"+" "+line);
					showfindDialog("Can't Lock line "+line+". It locked by UserID#"+ID);

				}
				}
				else if (nowlock==true) 
				{
					System.out.println("Can't lock  Now you lock other line");
					showfindDialog("Can't Lock line "+line+". Now you lock other line");
				}
			}
			catch (RemoteException e)
			{
				System.out.println("RemoteException with Lock");
			}
			
		}
		if(label.equals("UNLOCK"))
		{
			try
			{
				canunlock = server.unlock(agentID, line);
				if (canunlock == true)
				{
					System.out.println("Unlock Success"+" "+line);
					showfindDialog("UnLock Success");
					nowlock = false;
				}
				if (canunlock == false)
				{
					System.out.println("Unlock fail"+" "+line);
					showfindDialog("UnLock Fail! It wasn't locked by you");
				}
//				System.out.println("Unlock Success"+" "+line);
//				showfindDialog("UnLock Success");
			}
			catch (RemoteException e)
			{
				System.out.println("RemoteException with Unlock");
			}
			
		}

	}

	public void handleChoice(Event evt)
	{
		Choice x = (Choice)evt.target;
//		System.out.println(x.getSelectedItem()+","+x.getSelectedIndex());
		String temp = x.getSelectedItem();
		if ((temp == "Arial")||(temp == "Angsana New")||(temp=="Courier New")||(temp=="Ms Sans Serif")||(temp=="Times New Roman"))
		{
			list = temp;
		}
		else if ((temp=="PLAIN")||(temp=="BOLD")||temp==("ITALIC"))
		{
			style = temp;
		}
		else if ((temp=="black")||(temp=="lightGray")||(temp=="gray")||(temp=="darkGray")||(temp=="red")||(temp=="green")||(temp=="blue")||(temp=="yellow")||(temp=="magenta")||(temp=="cyan")||(temp=="pink")||(temp=="orange"))
		{
			color = temp;
		}
		else if ((temp=="0")||(temp=="1")||(temp=="2")||(temp=="3")||(temp=="4")||(temp=="5")||(temp=="6")||(temp=="7")||(temp=="8")||(temp=="9")||(temp=="10")||(temp=="11"))
		{
			line = temp;
		}
//	System.out.println(temp);
	}

	public void handleMenuItem(Event evt)
	{
		EditorServer server = client.getEditorServer();
		int agentID = client.getAgentID();
		int[] user;
		user = new int[10];

		String[] lock_status;
		lock_status = new String[10];

		if(evt.id == Event.ACTION_EVENT)
		{
			if("Save".equals(evt.arg))
			{
				String filename;

				saveDialog.show();
				filename = saveDialog.getFile();

				if(filename != null)
				{
//					filename=check(filename);
						if(write(filename))
							fileName = filename;

				}
			}
			if("Exit".equals(evt.arg))
			{
				try{
				server.dead_user(agentID);
				System.exit(0);
//				return true;
				}
				catch (RemoteException e)
				{
				System.out.println("RemoteException with dead user");
				}
			}
			if("User Status".equals(evt.arg))
			{
				try{
				user = server.get_user();
//				for (int i=0;i<user.length;i++)
//				{
//					System.out.print("User is : ");
//					System.out.print(user[i]+"  ");
//				}
				showStatusUserDialog(user);
//				System.out.println("My status");
//				showStatusDialog(String[20] status); 
				}
				catch (RemoteException e)
				{
				System.out.println("RemoteException with get information of user");
				}
			}
			if ("Lock Status".equals(evt.arg))
			{
				try{
				lock_status = server.get_status();
				showStatuslockDialog(lock_status);
				}
				catch (RemoteException e)
				{
				System.out.println("RemoteException with get information of lock");
				}
			}
		}
//		return true;
	}

/*	public boolean handleEvent(Event event)
	{
		if(event.id == Event.WINDOW_DESTROY)
		{
			dispose();
			System.exit(0);
			return true;
		}
		else if(event.id == Event.ACTION_EVENT)
		{
		  if(event.target instanceof MenuItem)
		  {
			if("Exit".equals(event.arg))
			{
				System.exit(0);
				return true;
			}
		  }
	    }
		return false;
	}  */
	
	public boolean action(Event evt, Object arg)
	{
		if(evt.target instanceof Button)
		{
			handleButton((String)arg);
			return true;

		}
		else if(evt.target instanceof Choice)
		{
			handleChoice(evt);
			return true;
		}
		else if(evt.target instanceof TextField)
		{
			TextField x = (TextField)evt.target;
			String temp = "";
			temp=x.getText();
			if (temp.length() <=2)
			{
				size = temp;
			}
			else str = temp;
//			System.out.println(temp);
		} 
		else if(evt.target instanceof MenuItem)
		{
			handleMenuItem(evt);
			return true;
		}
		return super.action(evt,arg);



	}

	public void showfindDialog(String message)
	{
		if(findDialog != null)
			findDialog.dispose();
		findDialog = new FindDialog(this,message);
		findDialog.show();
	} 
	
	public void showStatusUserDialog(int[] user)
	{
		if(statusUserDialog != null)
			statusUserDialog.dispose();
		statusUserDialog = new StatusUserDialog(this,user);
		statusUserDialog.show();

	}

	public void showStatuslockDialog(String[] lock_status)
	{
		if(statuslockDialog != null)
			statuslockDialog.dispose();
		statuslockDialog = new StatuslockDialog(this,lock_status);
		statuslockDialog.show();
	}

	private boolean write(String filename)
	{
		FileOutputStream fos = null;
		try{
			fos = new FileOutputStream(filename);
			saveFile(filename);
		}
		catch(Throwable e)
		{
			System.out.println("Can't write \""+filename+"\"");
			showfindDialog("Can't Write \""+filename+"\"");
			return(false);
		}
		return(true);
	}

	public void saveFile(String filename)
	{
		String[] format = new String[100];
		getformat get = new getformat();
		get.passarray(format);
		for(int i=0;i<format.length;i++)
		{
			System.out.println("format#"+i+"="+format[i]);
		}
		try{
		FileWriter fo = new FileWriter(filename);
		BufferedWriter buf = new BufferedWriter (fo);
		PrintWriter pw = new PrintWriter (buf);
		pw.println("<!-- This Document Composed by Co-operative Editor -->");
		pw.println("<?xml version=\"1.0\" encoding=\"windows-874\"?>");
		pw.println("<?xml-stylesheet href=\"document.xsl\" type=\"text/xsl\"?>");
		pw.println("");
		pw.println("<!-- Here is a sample XML file -->");
		pw.println("<page>");
		pw.print("    ");
		pw.println("<content>");

		for (int i=0;i<72;i+=6)
		{
			pw.println("");
			pw.print("        ");
			pw.print("<"); pw.print(format[i+2]); pw.println(">");
			pw.print("        "); pw.println("<line>");
			pw.print("            "); pw.print("<font>"); pw.print(format[i]); pw.println("</font>");
			pw.print("            "); pw.print("<color>"); pw.print(format[i+3]); pw.println("</color>");
			int tmp = Integer.parseInt(format[i+1]);
			int size = tmp/10;
			pw.print("            "); pw.print("<size>"); pw.print("+"); pw.print(size); pw.println("</size>");
			pw.print("            "); pw.print("<text>"); pw.print(format[i+4]); pw.println("</text>");
			pw.print("        "); pw.println("</line>");
			pw.print("        ");
			pw.print("<"); pw.print("/"); pw.print(format[i+2]); pw.println(">");
		}
		pw.println("");
		pw.print("    ");
		pw.println("</content>");
		pw.println("</page>");

		pw.close();
		System.out.println("Save file is "+filename);
		}
		catch(IOException e)
		{
			System.out.println("Can't write file "+filename);
		}
	}

/*	public String getlineoflock(String line)
	{
		FileInputStream fp;
		String[] str = new String[12];
		String temp="";
		int readVar;
		try{
			fp = new FileInputStream("tag.txt");
			readVar = 0;
			int i=0;
			while(readVar != -1)
			{
				try{
					readVar = fp.read(); temp+=(char)readVar;
					if ((char)readVar=='<') {readVar = fp.read();}
					if ((char)readVar=='B') {readVar = fp.read();}
					if ((char)readVar=='R') {readVar = fp.read();}
					if ((char)readVar=='>') {readVar = fp.read();}
				}
				catch(IOException e)
				{
					System.out.println("Unknown IO error reading file"+"tag.txt");
					System.exit(2);
				}
			}
		}
		catch(FileNotFoundException e)
		{
			System.out.println("File" + "tag.txt" + "not found");
			System.exit(1);
		}
	}*/
/*	private String check(String filename)
	{
		if(filename.endswith(".*.*"))
		{
			filename = filename.substring(0,filename.length()-4);
		}
		return(filename);
	}*/

}

class FindDialog extends Dialog
{
	Userinterface parent;
	String message;
	public FindDialog(Userinterface parent,String message)
	{
		super(parent,"Message !",true);
		setBackground(Color.white);
		Panel panel;
		panel = new Panel();
		panel.add(new Label(message));
		panel.setFont(new Font("System",Font.BOLD,14));

		add("Center",panel);
		Dimension dim;
		dim = parent.size();
		reshape(200,600,350,80);

		setResizable(false);
	}
	public boolean handleEvent(Event e)
	{
		if (e.id == Event.WINDOW_DESTROY)
		{
			dispose();
		}
		return super.handleEvent(e);
	}
}


class StatusUserDialog extends Dialog
{
	Userinterface parent;
	int[] user;
	public StatusUserDialog(Userinterface parent,int[] user)
	{
		super(parent,"Status User",true);
		setBackground(Color.white);
		Panel panel;
		panel = new Panel();
		panel.add(new Label("All User is"));
		
		for (int i=0;i<user.length;i++)
		{
			if (user[i] != 0)
			{
				int j = i+1;
				panel.add(new Label("User ID#"+j));
			}
		}



//		panel.add(new Label(message));
		panel.setFont(new Font("System",Font.BOLD,14));

		add("Center",panel);
		Dimension dim;
		dim = parent.size();
		reshape(200,500,150,250);

		setResizable(false);
	}
	public boolean handleEvent(Event e)
	{
		if (e.id == Event.WINDOW_DESTROY)
		{
			dispose();
		}
		return super.handleEvent(e);
	}
}

class StatuslockDialog extends Dialog
{
	Userinterface parent;
	String[] lockstatus;
	public StatuslockDialog(Userinterface parent,String[] lockstatus)
	{
		super(parent,"Status Lock",true);
		setBackground(Color.white);
		Panel panel;
		panel = new Panel();
		panel.add(new Label("Lock Status is"));
		
		for (int i=0;i<lockstatus.length;i++)
		{
			panel.add(new Label(lockstatus[i]));
		}



//		panel.add(new Label(message));
		panel.setFont(new Font("System",Font.BOLD,14));

		add("Center",panel);
		Dimension dim;
		dim = parent.size();
		reshape(200,500,200,250);

		setResizable(false);
	}
	public boolean handleEvent(Event e)
	{
		if (e.id == Event.WINDOW_DESTROY)
		{
			dispose();
		}
		return super.handleEvent(e);
	}
}

class MyTextField extends TextField
{
	String text;
	public MyTextField(String text,int columns)
	{
		super(text,columns);
//		setEditable(true);
		
	}
		
	public boolean action(Event event,Object arg)
	{
		if (event.target instanceof TextField)
		{
			TextField x = (TextField)event.target;
			text=x.getText();
//			System.out.println(text);
			System.out.println(arg);
		} 
//		text = getText();
//		setText(text.toUpperCase());
//		System.out.println(arg);
//		System.out.println(text);
		return false;//true;
	}
}

class MyButton extends Button
{
	public MyButton(String text)
	{
		super(text);
	}
	public void handleButton(String label)
	{
		if (label.equals("OK"))
		{
			System.out.println("Ok success");
		}

	}
	public boolean action(Event event,Object arg)
	{
		handleButton((String)arg);
		return true;
	}
}

class Mylist extends List
{
	public Mylist(String strings[])
	{
		super(3,false);
		for(int i=0;i<strings.length;++i)
			addItem(strings[i]);
	}
	public boolean handleEvent(Event event)
	{
		if(event.id == Event.LIST_SELECT)
		{
			getItem((new Integer(event.arg.toString())).intValue());
			return true;
		}
		else if(event.id == Event.LIST_DESELECT)
		{
			getItem((new Integer(event.arg.toString())).intValue());
			return true;
		}
		return false;
	}
}

class MyChoice extends Choice
{
	Userinterface user;
	String text;
	public MyChoice(String strings[],String text)
	{
		super();
		try
		{
			for(int i = 0;i<strings.length;++i)
				addItem(strings[i]);
		}
		catch(NullPointerException ex)
		{
			System.exit(0);
		}
	}

/*	public void handleChoice(String label)
	{
		if (label.equals("OK"))
		{
			System.out.println("Ok success");
		}

	}*/
	
	
	public boolean action(Event event,Object arg)
	{
//		text = ((String)arg);
//		handleButton((String)arg);
		Choice x = (Choice)event.target;
		System.out.println(x.getSelectedItem()+","+x.getSelectedIndex());
		text = x.getSelectedItem();
		System.out.println(text);
		return true;
	}
}

