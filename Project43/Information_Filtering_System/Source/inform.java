import java.awt.*;
import java.awt.MenuItem;
import java.awt.MenuBar;
import java.awt.event.*;
import java.io.*;
import java.lang.*;
import java.awt.Button;
import java.util.*;
import java.net.*;

// ------------------------------------------------------------------------- //
//					Main frame class						
// ------------------------------------------------------------------------- //
public class inform extends Frame implements ActionListener
	{
//		general display variables
		private Button SearchBT,LaunchBT[],AddBT,LikeBT,DislikeBT,PrevBT,NextBT;
		public  Checkbox FirstCB,SecondCB,ThirdCB,FourthCB,FifthCB;
		private Label StatusLB,Active_ProfileLB,DirectoryLB;
		private TextField KeywordTF;

//     share display variables
		public static Label Status_DetailLB,Showed_LinkLB;
		public static TextField Sum_RateTF[];
		public static Label Profile_NameLB;
		public static String GetPath;
		public static int Page=0;
		static TextArea ResultTA;
		static MenuItem Keyword,Int_Links,Make_Schedule,Quit,Added_Links,Schedule_Links,Add_Profile,Choose_Profile,Edit_Profile,Delete_Profile;

//     active user's variables		
		public static String Active_Usname = "";
		public static Vector Train_Rate = new Vector();
		public static int Active_Rate[];
		public static Vector UsedLink = new Vector();
		public static float Out_Dir[] = new float[14];

//     search + link + weight variables
		public static String LLink[]=new String[40],TitleLink[]=new String[40],DetailLink[]=new String[40];
		public static int WeightMeta[],LinkNum=0,DirNum[];
		public static String Dir[][][]=new String[40][40][5];
		public static String Ref[];
		public static int Sum_Rate[];
		public static int toplus[][];
		public static float neural[] = new float[4];
		int pos[] = new int[3];
//   ********************************** end declare variable ****************************************
		public inform()
		{
			// initail zone	******************************
			super(" Information Filtering System Program");
			setFont(new Font("TimesRoman",0,14));
			Active_Rate = new int[14];
			File hi = new File ("inform.java");
			GetPath = hi.getAbsolutePath().substring(0,hi.getAbsolutePath().length()-11);
			Sum_Rate = new int[30];
		// read name of directory into Ref[]
			Ref = new String[4037];
			for (int a=0;a<4037 ;a++ ) Ref[a]="";
			String tmp;
			int ref_pos=0,line_pos=0;
			try
			{
				FileReader fr = new FileReader (GetPath+"directory.txt");
				BufferedReader frb = new BufferedReader(fr);
				while (ref_pos<4037)
				{
					tmp=frb.readLine();
					line_pos=0;
					while (line_pos<tmp.length())
					{
						if (tmp.charAt(line_pos)!='%') Ref[ref_pos]=Ref[ref_pos]+tmp.charAt(line_pos);
						else ref_pos++;
						line_pos++;
					}
				}// end last while loop all ref are loaded
				frb.close();
			}
			catch (IOException ex){}
		//  write toplus
			toplus = new int[14][45];
			toplus[0][0] = 22;toplus[0][1] = 13;toplus[0][2] = 6;toplus[0][3] = 0;toplus[0][4] = 0;
			toplus[0][5] = 2;toplus[0][6] = 24;toplus[0][7] = 3;toplus[0][8] = 88;toplus[0][9] = 25;
			toplus[0][10] = 8;toplus[0][11] = 2;toplus[0][12] = 2;toplus[0][13] = 16;toplus[0][14] = 2;
			toplus[0][15] = 9;toplus[0][16] = 3;toplus[0][17] = 7;toplus[0][18] = 27;toplus[0][19] = 3;
			toplus[0][20] = 13;toplus[0][21] = 28;toplus[0][22] = 0;
			for (int x=23;x<45 ;x++ ) toplus[0][x]= -1;

			toplus[1][0] = 26;toplus[1][1] = 91;toplus[1][2] = 60;toplus[1][3] = 0;toplus[1][4] = 1;
			toplus[1][5] = 7;toplus[1][6] = 3;toplus[1][7] = 1;toplus[1][8] = 1;toplus[1][9] = 1;
			toplus[1][10] = 3;toplus[1][11] = 10;toplus[1][12] = 17;toplus[1][13] = 3;toplus[1][14] = 26;
			toplus[1][15] = 7;toplus[1][16] = 1;toplus[1][17] = 10;toplus[1][18] = 4;toplus[1][19] = 7;
			toplus[1][20] = 9;toplus[1][21] = 7;toplus[1][22] = 8;toplus[1][23] = 5;toplus[1][24] = 0;
			toplus[1][25] = 8;toplus[1][26] = 29;
			for (int x=27;x<45 ;x++ ) toplus[1][x]= -1;

			toplus[2][0] = 25;toplus[2][1] = 0;toplus[2][2] = 35;toplus[2][3] = 1;toplus[2][4] = 0;
			toplus[2][5] = 13;toplus[2][6] = 2;toplus[2][7] = 1;toplus[2][8] = 1;toplus[2][9] = 16;
			toplus[2][10] = 8;toplus[2][11] = 3;toplus[2][12] = 29;toplus[2][13] = 4;toplus[2][14] = 21;
			toplus[2][15] = 3;toplus[2][16] = 2;toplus[2][17] = 25;toplus[2][18] = 6;toplus[2][19] = 91;
			toplus[2][20] = 26;toplus[2][21] = 32;toplus[2][22] = 3;toplus[2][23] = 1;toplus[2][24] = 0;
			toplus[2][25] = 10;
			for (int x=26;x<45 ;x++ ) toplus[2][x]= -1;

			toplus[3][0] = 31;toplus[3][1] = 8;toplus[3][2] = 3;toplus[3][3] = 7;toplus[3][4] = 0;
			toplus[3][5] = 0;toplus[3][6] = 6;toplus[3][7] = 4;toplus[3][8] = 2;toplus[3][9] = 8;
			toplus[3][10] = 4;toplus[3][11] = 2;toplus[3][12] = 3;toplus[3][13] = 6;toplus[3][14] = 1;
			toplus[3][15] = 3;toplus[3][16] = 8;toplus[3][17] = 6;toplus[3][18] = 0;toplus[3][19] = 19;
			toplus[3][20] = 1;toplus[3][21] = 3;toplus[3][22] = 12;toplus[3][23] = 4;toplus[3][24] = 7;
			toplus[3][25] = 3;toplus[3][26] = 7;toplus[3][27] = 9;toplus[3][28] = 0;toplus[3][29] = 5;
			toplus[3][30] = 13;toplus[3][31] = 0;
			for (int x=32;x<45 ;x++ ) toplus[3][x]= -1;

			toplus[4][0] = 25;toplus[4][1] = 4;toplus[4][2] = 16;toplus[4][3] = 3;toplus[4][4] = 6;
			toplus[4][5] = 14;toplus[4][6] = 7;toplus[4][7] = 10;toplus[4][8] = 16;toplus[4][9] = 2;
			toplus[4][10] = 1;toplus[4][11] = 3;toplus[4][12] = 0;toplus[4][13] = 56;toplus[4][14] = 7;
			toplus[4][15] = 39;toplus[4][16] = 45;toplus[4][17] = 2;toplus[4][18] = 1;toplus[4][19] = 2;
			toplus[4][20] = 0;toplus[4][21] = 7;toplus[4][22] = 13;toplus[4][23] = 0;toplus[4][24] = 2;
			toplus[4][25] = 5;
			for (int x=26;x<45 ;x++ ) toplus[4][x]= -1;

			toplus[5][0] = 20;toplus[5][1] = 0;toplus[5][2] = 2;toplus[5][3] = 1;toplus[5][4] = 1;
			toplus[5][5] = 2;toplus[5][6] = 1;toplus[5][7] = 0;toplus[5][8] = 9;toplus[5][9] = 7;
			toplus[5][10] = 39;toplus[5][11] = 13;toplus[5][12] = 2;toplus[5][13] = 1;toplus[5][14] = 13;
			toplus[5][15] = 0;toplus[5][16] = 0;toplus[5][17] = 0;toplus[5][18] = 6;toplus[5][19] = 22;
			toplus[5][20] = 0;
			for (int x=21;x<45 ;x++ ) toplus[5][x]= -1;

			toplus[6][0] = 39;toplus[6][1] = 31;toplus[6][2] = 4;toplus[6][3] = 3;toplus[6][4] = 0;
			toplus[6][5] = 50;toplus[6][6] = 1;toplus[6][7] = 5;toplus[6][8] = 2;toplus[6][9] = 7;
			toplus[6][10] = 2;toplus[6][11] = 10;toplus[6][12] = 3;toplus[6][13] = 3;toplus[6][14] = 10;
			toplus[6][15] = 0;toplus[6][16] = 3;toplus[6][17] = 1;toplus[6][18] = 4;toplus[6][19] = 83;
			toplus[6][20] = 3;toplus[6][21] = 12;toplus[6][22] = 5;toplus[6][23] = 7;toplus[6][24] = 11;
			toplus[6][25] = 10;toplus[6][26] = 0;toplus[6][27] = 9;toplus[6][28] = 8;toplus[6][29] = 13;
			toplus[6][30] = 7;toplus[6][31] = 8;toplus[6][32] = 2;toplus[6][33] = 1;toplus[6][34] = 11;
			toplus[6][35] = 0;toplus[6][36] = 0;toplus[6][37] = 3;toplus[6][38] = 9;toplus[6][39] = 6;
			for (int x=40;x<45 ;x++ ) toplus[6][x]= -1;

			toplus[7][0] = 20;toplus[7][1] = 3;toplus[7][2] = 17;toplus[7][3] = 11;toplus[7][4] = 9;
			toplus[7][5] = 3;toplus[7][6] = 5;toplus[7][7] = 5;toplus[7][8] = 17;toplus[7][9] = 31;
			toplus[7][10] = 2;toplus[7][11] = 4;toplus[7][12] = 3;toplus[7][13] = 0;toplus[7][14] = 0;
			toplus[7][15] = 1;toplus[7][16] = 0;toplus[7][17] = 4;toplus[7][18] = 3;toplus[7][19] = 0;
			toplus[7][20] = 3;
			for (int x=21;x<45 ;x++ ) toplus[7][x]= -1;

			toplus[8][0] = 14;toplus[8][1] = 39;toplus[8][2] = 21;toplus[8][3] = 0;toplus[8][4] = 0;
			toplus[8][5] = 0;toplus[8][6] = 12;toplus[8][7] = 29;toplus[8][8] = 23;toplus[8][9] = 12;
			toplus[8][10] = 0;toplus[8][11] = 49;toplus[8][12] = 114;toplus[8][13] = 35;toplus[8][14] = 26;
			for (int x=15;x<45 ;x++ ) toplus[8][x]= -1;

			toplus[9][0] = 21;toplus[9][1] = 1;toplus[9][2] = 0;toplus[9][3] = 2;toplus[9][4] = 0;
			toplus[9][5] = 3;toplus[9][6] = 3;toplus[9][7] = 5;toplus[9][8] = 0;toplus[9][9] = 0;
			toplus[9][10] = 2;toplus[9][11] = 2;toplus[9][12] = 0;toplus[9][13] = 17;toplus[9][14] = 2;
			toplus[9][15] = 6;toplus[9][16] = 0;toplus[9][17] = 6;toplus[9][18] = 6;toplus[9][19] = 1;
			toplus[9][20] = 2;toplus[9][21] = 1;
			for (int x=22;x<45 ;x++ ) toplus[9][x]= -1;

			toplus[10][0] = 4;toplus[10][1] = 51;toplus[10][2] = 193;toplus[10][3] = 14;toplus[10][4] = 1;
			for (int x=5;x<45 ;x++ ) toplus[10][x]= -1;

			toplus[11][0] = 44;toplus[11][1] = 5;toplus[11][2] = 35;toplus[11][3] = 17;toplus[11][4] = 0;
			toplus[11][5] = 5;toplus[11][6] = 0;toplus[11][7] = 28;toplus[11][8] = 7;toplus[11][9] = 1;
			toplus[11][10] = 42;toplus[11][11] = 1;toplus[11][12] = 28;toplus[11][13] = 5;toplus[11][14] = 1;
			toplus[11][15] = 30;toplus[11][16] = 0;toplus[11][17] = 17;toplus[11][18] = 14;toplus[11][19] = 13;
			toplus[11][20] = 2;toplus[11][21] = 24;toplus[11][22] = 34;toplus[11][23] = 0;toplus[11][24] = 5;
			toplus[11][25] = 14;toplus[11][26] = 6;toplus[11][27] = 4;toplus[11][28] = 0;toplus[11][29] = 0;
			toplus[11][30] = 0;toplus[11][31] = 1;toplus[11][32] = 37;toplus[11][33] = 6;toplus[11][34] = 1;
			toplus[11][35] = 3;toplus[11][36] = 2;toplus[11][37] = 9;toplus[11][38] = 3;toplus[11][39] = 32;
			toplus[11][40] = 7;toplus[11][41] = 3;toplus[11][42] = 1;toplus[11][43] = 22;toplus[11][44] = 0;
	
			toplus[12][0] = 34;toplus[12][1] = 13;toplus[12][2] = 30;toplus[12][3] = 0;toplus[12][4] = 1;
			toplus[12][5] = 16;toplus[12][6] = 0;toplus[12][7] = 0;toplus[12][8] = 21;toplus[12][9] = 1;
			toplus[12][10] = 0;toplus[12][11] = 10;toplus[12][12] = 3;toplus[12][13] = 2;toplus[12][14] = 3;
			toplus[12][15] = 1;toplus[12][16] = 0;toplus[12][17] = 4;toplus[12][18] = 0;toplus[12][19] = 25;
			toplus[12][20] = 4;toplus[12][21] = 1;toplus[12][22] = 8;toplus[12][23] = 12;toplus[12][24] = 15;
			toplus[12][25] = 6;toplus[12][26] = 3;toplus[12][27] = 7;toplus[12][28] = 5;toplus[12][29] = 5;
			toplus[12][30] = 8;toplus[12][31] = 17;toplus[12][32] = 10;toplus[12][33] = 0;toplus[12][34] = 8;
			for (int x=35;x<45 ;x++ ) toplus[12][x]= -1;

			toplus[13][0] = 29;toplus[13][1] = 5;toplus[13][2] = 0;toplus[13][3] = 3;toplus[13][4] = 15;
			toplus[13][5] = 0;toplus[13][6] = 51;toplus[13][7] = 11;toplus[13][8] = 26;toplus[13][9] = 33;
			toplus[13][10] = 3;toplus[13][11] = 1;toplus[13][12] = 6;toplus[13][13] = 2;toplus[13][14] = 22;
			toplus[13][15] = 2;toplus[13][16] = 38;toplus[13][17] = 18;toplus[13][18] = 0;toplus[13][19] = 2;
			toplus[13][20] = 4;toplus[13][21] = 11;toplus[13][22] = 7;toplus[13][23] = 16;toplus[13][24] = 29;
			toplus[13][25] = 4;toplus[13][26] = 24;toplus[13][27] = 8;toplus[13][28] = 0;toplus[13][29] = 11;
			for (int x=30;x<45 ;x++ ) toplus[13][x]= -1;
			
			//   Menu Zone ********************************		
			MenuBar mbar = new MenuBar();
			Menu m = new Menu("Search");
			m.add(Keyword = new MenuItem("Use keyword"));
			m.add(Int_Links = new MenuItem("Find interesting links"));
			m.add(Make_Schedule = new MenuItem("Make schedule"));
			m.addSeparator();
			m.add(Quit = new MenuItem("Quit"));
			mbar.add(m);
			Keyword.disable();
			Int_Links.disable();
			Make_Schedule.disable();

			Menu n = new Menu("Link_book");
			n.add(Added_Links = new MenuItem("Your added link book"));
			n.add(Schedule_Links = new MenuItem("Your interesting link book"));
			mbar.add(n);
			Added_Links.disable();
			Schedule_Links.disable();
	
			Menu o = new Menu("Profile");
			o.add(Add_Profile = new MenuItem("Add new profile"));
			o.add(Choose_Profile = new MenuItem("Choose active profile"));
			o.add(Edit_Profile = new MenuItem("Edit active profile"));
			o.add(Delete_Profile = new MenuItem("Delete profile"));
			mbar.add(o);
			Edit_Profile.disable();
		
			setMenuBar(mbar);

			// register menu with addActionListener
			Keyword.addActionListener(this);
			Int_Links.addActionListener(this);
			Make_Schedule.addActionListener(this);
			Quit.addActionListener(this);
			Added_Links.addActionListener(this);
			Schedule_Links.addActionListener(this);
			Add_Profile.addActionListener(this);
			Choose_Profile.addActionListener(this);
			Edit_Profile.addActionListener(this);
			Delete_Profile.addActionListener(this);
	
			// put object zone
			setLayout(null);
			//       keyword and search button
			KeywordTF = new TextField(15);
			add(KeywordTF);
			KeywordTF.setBounds(20,50,120,20);
			SearchBT = new Button("Search");
			add(SearchBT);
			SearchBT.setBounds(150,49,50,21);

			Showed_LinkLB = new Label("");
			add(Showed_LinkLB);
			Showed_LinkLB.setBounds(122,98,160,20);
			PrevBT = new Button("Previous");
			add(PrevBT);
			PrevBT.setBounds(300,95,50,21);
			NextBT = new Button("Next");
			add(NextBT);
			NextBT.setBounds(360,95,32,21);

			//    3 button add like dislike		
			AddBT = new Button("Add");
			add(AddBT);
			AddBT.setBounds(475,95,35,21);
			LikeBT = new Button("Prefer");
			add(LikeBT);
			LikeBT.setBounds(520,95,40,21);
			DislikeBT = new Button("Not Prefer");
			add(DislikeBT);
			DislikeBT.setBounds(570,95,60,21);
			//   1-5 Checkbox
			FirstCB = new Checkbox();
			add(FirstCB);
			FirstCB.setBounds(20,127,18,18);
			SecondCB = new Checkbox();
			add(SecondCB);
			SecondCB.setBounds(20,178,18,18);
			ThirdCB = new Checkbox();
			add(ThirdCB);
			ThirdCB.setBounds(20,229,18,18);
			FourthCB = new Checkbox();
			add(FourthCB);
			FourthCB.setBounds(20,280,18,18);
			FifthCB = new Checkbox();
			add(FifthCB);
			FifthCB.setBounds(20,331,18,18);
			
			//     launch button
			LaunchBT = new Button[5];
			for (int launch_int=0;launch_int<5 ;launch_int++ )
			{
				LaunchBT[launch_int] = new Button("Launch");
				add(LaunchBT[launch_int]);
				LaunchBT[launch_int].setBounds(41,125+(launch_int*51),42,21);
			}
			//     Sum Rate  textfield
			Sum_RateTF = new TextField[5];
			for (int sum_int=0;sum_int<5 ;sum_int++ )
			{
				Sum_RateTF[sum_int] = new TextField(3);
				add(Sum_RateTF[sum_int]);
				Sum_RateTF[sum_int].setBounds(90,126+(sum_int*51),24,19);
			}

			//     result textarea		
			ResultTA = new TextArea("",15,60,2);
			add(ResultTA);
			ResultTA.setBounds(120,125,510,280);

			StatusLB = new Label("Status:");
			add(StatusLB);
			StatusLB.setBounds(15,418,40,20);
			Status_DetailLB = new Label("Please choose your profile or add a new one by using Profile menu");
			add(Status_DetailLB);
			Status_DetailLB.setBounds(60,418,400,20);

			//   right side Active profile
			Active_ProfileLB = new Label("Active Profile");
			add(Active_ProfileLB);
			Active_ProfileLB.setBounds(330,55,80,20);
			Profile_NameLB = new Label("(No profile selected)");
			add(Profile_NameLB);
			Profile_NameLB.setBounds(420,55,100,20);


			//         ActionListener Zone
			SearchBT.addActionListener(this);
			AddBT.addActionListener(this);
			LikeBT.addActionListener(this);
			DislikeBT.addActionListener(this);
			PrevBT.addActionListener(this);
			NextBT.addActionListener(this);
		}

// ------------------------------------------------------------------------- //
//					Take action with the button pressed						
// ------------------------------------------------------------------------- //
		public void actionPerformed(ActionEvent e)
		{
			String arg = e.getActionCommand();
			if (e.getSource() instanceof MenuItem)
			{
				if ("Quit".equals(arg))	
				{
					if (Active_Usname!="") Before_Exit();	
					System.exit(0);
				}
				// menu search
				if ("Use keyword".equals(arg))
				{
					dialog.createDialog("Put the keyword in the field and click 'Search' button to search");
				}
				if (arg.equals("Find interesting links"))
				{
					Frame v = new Interesting_Search();
					v.setSize(460,230);
					v.show();
				}
				if (arg.equals("Make schedule"))
				{
					Frame z = new Schedule();
					z.setSize(300,80);
					z.show();
				}
			
				// link_book menu
				if (arg.equals("Your added link book"))
				{
					Frame y = new AddedVInt_Link(true,"Your Added Link Book");
					y.setSize(670,420);
					y.show();
				}
				if (arg.equals("Your interesting link book"))
				{
					Frame x = new AddedVInt_Link(false,"Your Interesting Link Book");
					x.setSize(670,420);
					x.show();
				}

				// profile menu
				if (arg.equals("Add new profile"))
				{
					Frame w = new NewVEdit_Profile("Add new profile",true);
					w.setSize(630,535);
					w.show();
				}
				if (arg.equals("Choose active profile"))
				{
					Frame t = new Choose_Profile();
					t.setSize(265,140);
					t.show();
				}
				if (arg.equals("Edit active profile"))
				{
					Frame s = new NewVEdit_Profile("Edit active profile",false);
					s.setSize(630,535);
					s.show();
				}
				if (arg.equals("Delete profile"))
				{
					Frame u = new Delete_Profile();
					u.setSize(300,140);
					u.show();
				}
			}
			if (e.getSource() instanceof Button)
			{
				if (arg.equals("Search"))
				{
					if (Active_Usname.equals("")) dialog.createDialog("Please choose your profile or add a new one before search");
					else 
					{
						if (KeywordTF.getText().equals("")) dialog.createDialog("Please put the keyword in the field before clicking 'Search' button");
						else
						{
							Page=0;
							Showed_LinkLB.setText("");
							ResultTA.setText("");
							for (int a=0 ;a<5 ;a++ ) Sum_RateTF[a].setText("");
							Status_DetailLB.setText("Searching.....  Please wait!");
							try
							{
								MetacrawlerLinkParserThread abc = new MetacrawlerLinkParserThread(URLEncoder.encode(KeywordTF.getText()));	
								abc.grab();
								LLink = abc.llink;
								TitleLink = abc.titlelink;
								DetailLink = abc.detaillink;
								WeightMeta = abc.weightMeta;
								LinkNum = abc.linkNum;
								Dir = abc.dir;
								DirNum = abc.dirNum;
							}
							catch (IOException ex){}
//for special 3 links that link is in sub1 which is in com and internet
							for (int a=0;a<LinkNum ;a++ )
							{
								for (int b=0;b<DirNum[a] ;b++ )
								{
									if (Dir[a][b][0].equals("Home"))
									{
										Dir[a][b][0]=Dir[a][b][1];
										Dir[a][b][1]=null;
									}
								}
							}
// end for special 3 links
							Sum_Rate = new int[LinkNum];
							Cal_Rate();
							Sortlink();
							Showlink();
							Status_DetailLB.setText("Search completed");
						}
					}
				}
				if (arg.equals("Add"))
				{
					if (Active_Usname.equals("")) dialog.createDialog("Please identify yourself first");
					else 
					{
						if (!(FirstCB.getState())&&!(SecondCB.getState())&&!(ThirdCB.getState())&&!(FourthCB.getState())&&!(FifthCB.getState())) dialog.createDialog("Please check the link you like!");
						else
						{
							String us;
							Vector s = new Vector();
							try
							{
								FileReader fr = new FileReader (GetPath+"user/"+Active_Usname+".add");
								BufferedReader br = new BufferedReader(fr);
								while ((us=br.readLine()) != null) s.addElement(new String(us));
								br.close();
								FileWriter fw = new FileWriter (GetPath+"user/"+Active_Usname+".add");
								BufferedWriter fwb = new BufferedWriter(fw);
								PrintWriter fwp = new PrintWriter(fwb);
								for (int x=0;x<s.size() ;x++ ) fwp.println(s.elementAt(x).toString());
								if (FirstCB.getState())
								{
									fwp.print(LLink[(Page*5)]+" , Directory:");
									fwp.println(Dir[(Page*5)][0][0]+">"+Dir[(Page*5)][0][1]+">"+Dir[(Page*5)][0][2]+">");
									fwp.println(TitleLink[(Page*5)]);
									fwp.println(DetailLink[(Page*5)]);
									FirstCB.setState(false);
									UsedLink.addElement(LLink[(Page*5)]);
								}
								if (SecondCB.getState())
								{
									fwp.print(LLink[(Page*5)+1]+" , Directory:");
									fwp.println(Dir[(Page*5)+1][0][0]+">"+Dir[(Page*5)+1][0][1]+">"+Dir[(Page*5)+1][0][2]+">");
									fwp.println(TitleLink[(Page*5)+1]);
									fwp.println(DetailLink[(Page*5)+1]);
									SecondCB.setState(false);
									UsedLink.addElement(LLink[(Page*5)+1]);
								}
								if (ThirdCB.getState())
								{
									fwp.print(LLink[(Page*5)+2]+" , Directory:");
									fwp.println(Dir[(Page*5)+2][0][0]+">"+Dir[(Page*5)+2][0][1]+">"+Dir[(Page*5)+2][0][2]+">");
									fwp.println(TitleLink[(Page*5)+2]);
									fwp.println(DetailLink[(Page*5)+2]);
									ThirdCB.setState(false);
									UsedLink.addElement(LLink[(Page*5)+2]);
								}
								if (FourthCB.getState())
								{
									fwp.print(LLink[(Page*5)+3]+" , Directory:");
									fwp.println(Dir[(Page*5)+3][0][0]+">"+Dir[(Page*5)+3][0][1]+">"+Dir[(Page*5)+3][0][2]+">");
									fwp.println(TitleLink[(Page*5)+3]);
									fwp.println(DetailLink[(Page*5)+3]);
									FourthCB.setState(false);
									UsedLink.addElement(LLink[(Page*5)+3]);
								}
								if (FifthCB.getState())
								{
									fwp.print(LLink[(Page*5)+4]+" , Directory:");
									fwp.println(Dir[(Page*5)+4][0][0]+">"+Dir[(Page*5)+4][0][1]+">"+Dir[(Page*5)+4][0][2]+">");
									fwp.println(TitleLink[(Page*5)+4]);
									fwp.println(DetailLink[(Page*5)+4]);
									FifthCB.setState(false);
									UsedLink.addElement(LLink[(Page*5)+4]);
								}
								fwp.close();
							}
							catch (IOException ex) {}
							Write_UsedLink();
							dialog.createDialog("Link(s) added");							
						}// end else have box checked
					}// end else have username already
				}// end if add
				if ((arg.equals("Prefer"))||(arg.equals("Not Prefer")))
				{
					if (Active_Usname.equals("")) dialog.createDialog("Please identify yourself first");
					else 
					{
						String s[] = new String[3];
						boolean check=true;
						
						while ((FirstCB.getState())||(SecondCB.getState())||(ThirdCB.getState())||(FourthCB.getState())||(FifthCB.getState()))
						{
							check=true; // check to not do if link have no directory..
							if (FirstCB.getState()) 
							{
								if (Dir[(Page*5)][0][0]!=null) for (int q=0;q<3 ;q++ ) s[q]=Dir[(Page*5)][0][q]; 
								else 
								{
									dialog.createDialog("Link is unable to find directory!Can't train this link");
									check=false;
								}
								FirstCB.setState(false); 
							}
							else if (SecondCB.getState()) 
									 { 
										if (Dir[(Page*5)+1][0][0]!=null) for (int q=0;q<3 ;q++ ) s[q]=Dir[(Page*5)+1][0][q]; 
										else 
										{
											dialog.createDialog("Link is unable to find directory!Can't train this link");
											check=false;
										}
										SecondCB.setState(false); 
									 }
									 else if (ThirdCB.getState()) 
											  { 
													if (Dir[(Page*5)+2][0][0]!=null) for (int q=0;q<3 ;q++ ) s[q]=Dir[(Page*5)+2][0][q]; 
		 											else 
													{
														dialog.createDialog("Link is unable to find directory!Can't train this link");
														check=false;
													}
													ThirdCB.setState(false); 
											  }
											  else if (FourthCB.getState()) 
													   { 
															if (Dir[(Page*5)+3][0][0]!=null) for (int q=0;q<3 ;q++ ) s[q]=Dir[(Page*5)+3][0][q]; 
			 												else 
															{
																dialog.createDialog("Link is unable to find directory!Can't train this link");
																check=false;
															}
															FourthCB.setState(false); 
													   }
													   else if (FifthCB.getState()) 
																{ 
																	if (Dir[(Page*5)+4][0][0]!=null) for (int q=0;q<3 ;q++ ) s[q]=Dir[(Page*5)+4][0][q]; 
				 													else 
																	{
																		dialog.createDialog("Link is unable to find directory!Can't train this link");
																		check=false;
																	}
																	FifthCB.setState(false); 
																}
							if (check)
							{
								Find_Pos(s);
								int inc1=1,inc2=2,inc3=3;
								if (arg.equals("Not Prefer"))
								{
									inc1= -1;inc2 = -2; inc3 = -3;
								}
								int old1=Integer.parseInt(Train_Rate.elementAt(pos[0]).toString());
								int old2=Integer.parseInt(Train_Rate.elementAt(pos[1]).toString());
								int old3=Integer.parseInt(Train_Rate.elementAt(pos[2]).toString());
	
								Train_Rate.removeElementAt(pos[0]);
								Train_Rate.insertElementAt(new Integer(old1+inc1),pos[0]);
								Train_Rate.removeElementAt(pos[1]);
								Train_Rate.insertElementAt(new Integer(old1+inc2),pos[1]);
								Train_Rate.removeElementAt(pos[2]);
								Train_Rate.insertElementAt(new Integer(old1+inc3),pos[2]);
							}
						}// end while
						if (check) dialog.createDialog("Link(s) trained");
					}// end else
				}// end if like
				if (arg.equals("Previous"))
				{
					if (Page == 0) dialog.createDialog("This is the first page");
					else 
					{
						Page--;
						Showlink();
					}//end else
				}// end if pg. up.
				if (arg.equals("Next"))
				{
					if (LLink[(Page+1)*5]==null)
					{
						dialog.createDialog("No more links to display");
					}// end if
					else 
					{
						Page++;
						Showlink();					
					} // end else 
				} // end if pg dn.
			}// end button
		} // end action performed

		public boolean action(Event evt, Object whatAction)
		{
			if (evt.target instanceof Button)
			{
				for (int launch_int=0;launch_int<5 ;launch_int++ )
				{
					if (evt.target == LaunchBT[launch_int])
					{
						Runtime rr = Runtime.getRuntime();
						try
						{
							rr.exec("C:/Program Files/Internet Explorer/IEXPLORE.EXE "+LLink[launch_int+(Page*5)]);							
						}
						catch (Exception e) {}
					}
				}
				return true;
			}
			else return false;
		}

		public void Sortlink()  // to sort link by rating
		{
			for (int a=0;a<LinkNum-1 ;a++ )
			{
				int max= -600,pos=-1;
				for (int b=a;b<LinkNum ;b++ )
				{
					if (max<Sum_Rate[b]) 
					{
						max=Sum_Rate[b];
						pos=b;
					}
				}
				if (a!=pos)
				{
// switch all detail between a and pos
					int tmpint;
					String tmpstring;
					tmpint=Sum_Rate[a];
					Sum_Rate[a]=Sum_Rate[pos];
					Sum_Rate[pos]=tmpint;
					tmpstring=LLink[a];
					LLink[a]=LLink[pos];
					LLink[pos]=tmpstring;
					tmpstring=TitleLink[a];
					TitleLink[a]=TitleLink[pos];
					TitleLink[pos]=tmpstring;
					tmpstring=DetailLink[a];
					DetailLink[a]=DetailLink[pos];
					DetailLink[pos]=tmpstring;
					String tmparray[][] = Dir[a];
					Dir[a]=Dir[pos];
					Dir[pos]=tmparray;
// end switch
				}
			}
		}

		public static void Showlink()
		{
			for (int q=0;q<5 ;q++ ) Sum_RateTF[q].setText("");
			ResultTA.setText("");
			int last=5;
			if (((Page*5)+5)>LinkNum) last=LinkNum-(Page*5);
			if (LinkNum!=0) 
			{
				Showed_LinkLB.setText("Showing results: "+((Page*5)+1)+" to "+((Page*5)+last)+" of "+LinkNum+" results");
				for (int aaa=0;aaa<last ;aaa++ )
				{
					ResultTA.appendText(((Page*5)+aaa+1)+". "+LLink[(Page*5)+aaa]);
					if (Dir[(Page*5)+aaa][0][0]!=null)
					{
						ResultTA.appendText(" , Directory : "+Dir[(Page*5)+aaa][0][0]+">");
						if (Dir[(Page*5)+aaa][0][1]!=null) 
						{	
							ResultTA.appendText(Dir[(Page*5)+aaa][0][1]+">");
							if (Dir[(Page*5)+aaa][0][2]!=null) ResultTA.appendText(Dir[(Page*5)+aaa][0][2]+">");
						}
					}
					ResultTA.appendText("\n");
					ResultTA.appendText("   "+TitleLink[(Page*5)+aaa]+" \n");
					ResultTA.appendText("   "+DetailLink[(Page*5)+aaa]);
					if (aaa!=4) ResultTA.appendText(" \n");
					Sum_RateTF[aaa].setText(String.valueOf(Sum_Rate[(Page*5)+aaa]));
				}// end for
			}
			else Showed_LinkLB.setText("No link founded!");
		}
//   calculate rate
		public void Cal_Rate()
		{
			String s[] = new String[3];
			int prof_rate=0;
			for (int x=0;x<LinkNum ;x++ )
			{
				if (DirNum[x]!=0)
				{
					for (int m=0;m<3 ;m++ ) s[m]=Dir[x][0][m];
					if (DirNum[x]==1) prof_rate=Cal_Link_Rate(s);
					else 
					{
						float mult = 50/((DirNum[x]-1)*100);
						float prof_tmp=0;
						prof_tmp=Cal_Link_Rate(s)/2;
						for (int mm=1;mm<DirNum[x] ;mm++ )
						{
							for (int m=0;m<3 ;m++ ) s[m]=Dir[x][mm][m];
							prof_tmp=prof_tmp+(Cal_Link_Rate(s)*mult);
						}
						prof_rate = Math.round(prof_tmp);
					}
				}
				if (pos[0]<0)
				{
					Sum_Rate[x]= Math.round((150+(Math.round(WeightMeta[x]/10)*2))/5); // in case of no directory (150= mean of prof_rate=50*3)
				}
				else
				{
					Sum_Rate[x]= Math.round(((prof_rate*3)+(Math.round(WeightMeta[x]/10)*2)+Math.round(Out_Dir[pos[0]]*100))/6);
				}
			}// end for x=0 to linknum
		}
//    cal link rate.... 
		public int Cal_Link_Rate(String s[])
		{
			int r=0,rr=0,rrr=0;
			if (s[0]=="") return 0;
			Find_Pos(s);
			if (pos[0]== -1) return 0;
			else
			{
				r=Active_Rate[pos[0]]+Integer.parseInt(Train_Rate.elementAt(pos[0]).toString());
				if (r>100) r = 100;
				if (r< -100) r = -100;
				if (pos[1]!= -1)
				{
					rr=(Active_Rate[pos[0]]*2)+Integer.parseInt(Train_Rate.elementAt(pos[1]).toString());
					if (r>200) r = 200;
					if (r< -200) r = -200;
					if (pos[2]!= -1)
					{
						rrr=(Active_Rate[pos[0]]*3)+Integer.parseInt(Train_Rate.elementAt(pos[2]).toString());
						if (r>300) r = 300;
						if (r< -300) r = -300;
						return Math.round((r+rr+rrr)/6);
					}
					return Math.round((r+rr)/3);
				}
				return r;
			}
		}
//   end cal
		public void Find_Pos(String s[])
		{
			int a=0,aa=0,aaa=0;
			for (int o=0;o<3 ;o++ )pos[o]=0;
			for (a=0;a<15 ;a++ ) if (s[0].startsWith(Ref[a])) break;
			if (a>=14) pos[0]= -1;
			else
			{
				pos[0]=a;
				if (s[1]!=null)
				{
					pos[1]=14;
					for (int b=0;b<a ;b++ )	
						for (int bb=0;bb<=toplus[b][0] ;bb++ ) pos[1]=pos[1]+toplus[b][bb];
					for (aa=0;aa<=toplus[a][0] ;aa++ ) if (Ref[aa+pos[1]].equals(s[1])) break;
					if (aa>=toplus[a][0]) pos[1]= -1;
					else
					{
						pos[1]=pos[1]+aa;
						if (s[2]!=null)
						{
							pos[2]=pos[1]-aa;  
							for (int bb=0;bb<=aa ;bb++ ) pos[2]=pos[2]+toplus[a][bb];
							for (aaa=0;aaa<=toplus[a][aa+1] ;aaa++ ) if (Ref[aaa+pos[2]].equals(s[2])) break;
							if (aaa>=toplus[a][aa+1]) pos[2]= -1;
							else
							{
								pos[2]=pos[2]+aaa;
							}
						}
					}
				}
			}
		}

		public void Before_Exit() // save Train_Rate
		{
			try
			{	
				FileWriter fw = new FileWriter (GetPath+"user/"+Active_Usname+".tra");
				BufferedWriter fwb = new BufferedWriter(fw);
				PrintWriter fwp = new PrintWriter(fwb);
				for (int mm=0;mm<4037 ;mm++ ){
//  put Train_Rate.elementAt(mm) into file before exit
				fwp.println(Train_Rate.elementAt(mm));}
				fwp.close();
			}
			catch (IOException ex) {}
		}

		public static void Write_UsedLink() // save UsedLink to file
		{
			try
			{	
				FileWriter f = new FileWriter (GetPath+"user/"+Active_Usname+".use");
				BufferedWriter b = new BufferedWriter(f);
				PrintWriter p = new PrintWriter(b);
				for (int mm=0;mm<UsedLink.size() ;mm++ ){
				p.println(UsedLink.elementAt(mm));}
				p.close();
			}
			catch (IOException ex) {}
		}

		public void paint(Graphics g)
		{
			g.drawLine(0,85,690,85);
			g.drawLine(0,411,690,411);
			g.drawRoundRect(415,48,110,30,8,8);
		}

		public boolean handleEvent(Event e)
		{
			if (e.id == Event.WINDOW_DESTROY) 
			{
				if (Active_Usname!="") Before_Exit(); 
				System.exit(0);
			}
			return super.handleEvent(e);
		}
	
		public static void main(String[] args) 
		{	
			inform f = new inform();
			f.setSize(650,430);
			f.show();
		}
	}
// ------------------------------------------------------------------------- //
//					Interesting Search from search menu
// ------------------------------------------------------------------------- //
	class Interesting_Search extends Frame
	{
		private Checkbox normal,extra,regionCH,countryCH,guide,interesting;
		private Label or;
		private static Choice region,country;
		private Button OKBT,CancelBT;

		Interesting_Search ()
		{
			super("Search interesting link");
			setFont(new Font("TimesRoman",0,14));
			setLayout(null);
			CheckboxGroup choice = new CheckboxGroup();
			normal = new Checkbox("Normal",choice,true);
			add(normal);
			normal.setBounds(15,30,65,25);
			extra = new Checkbox("Advanced",choice,false);
			add(extra);
			extra.setBounds(15,55,75,25);
			CheckboxGroup rORc = new CheckboxGroup();
			regionCH = new Checkbox("Region",rORc,true);
			add(regionCH);
			regionCH.setBounds(100,55,65,25);
			region = new Choice();
			region.addItem("Africa");
			region.addItem("Antarctica");
			region.addItem("Arctic");
			region.addItem("Asia");
			region.addItem("Caribbean");
			region.addItem("Central America");
			region.addItem("Europe");
			region.addItem("Latin America");
			region.addItem("Mediterranean");
			region.addItem("Middle East");
			region.addItem("North America");
			region.addItem("Oceania");
			region.addItem("Pacific Rim");
			region.addItem("South America");
			add(region);
			region.setBounds(185,55,150,25);
			countryCH = new Checkbox("Country",rORc,false);
			add(countryCH);
			countryCH.setBounds(100,90,70,25);
			country = new Choice();
			country.addItem("Afghanistan"); 
			country.addItem("Albania");
			country.addItem("Algeria");
			country.addItem("Andorra");
			country.addItem("Angola");
			country.addItem("Antigua and Barbuda");
			country.addItem("Argentina");
			country.addItem("Armenia");
			country.addItem("Australia");
			country.addItem("Austria");
			country.addItem("Azerbaijan"); 
			country.addItem("Bahamas");
			country.addItem("Bahrain");
			country.addItem("Bangladesh");
			country.addItem("Barbados");
			country.addItem("Belarus");
			country.addItem("Belgium");
			country.addItem("Belize");
			country.addItem("Benin");
			country.addItem("Bhutan");
			country.addItem("Bolivia");
			country.addItem("Bosnia and Herzegovina");
			country.addItem("Botswana");
			country.addItem("Brazil");
			country.addItem("Brunei");
			country.addItem("Bulgaria");
			country.addItem("Burkina Faso");
			country.addItem("Burundi");
			country.addItem("Cambodia");
			country.addItem("Cameroon");
			country.addItem("Canada");
			country.addItem("Cape Verde");
			country.addItem("Central African Republic");
			country.addItem("Chad");
			country.addItem("Chile");
			country.addItem("China");
			country.addItem("Colombia");
			country.addItem("Comoros");
			country.addItem("Congo (Brazzaville)");
			country.addItem("Congo, Democratic Republic of");
			country.addItem("Costa Rica"); 
			country.addItem("Croatia"); 
			country.addItem("Cuba");
			country.addItem("Cyprus");
			country.addItem("Czech Republic");
			country.addItem("Cote d'Ivoire");
			country.addItem("Denmark");
			country.addItem("Djibouti");
			country.addItem("Dominica");
			country.addItem("Dominican Republic");
			country.addItem("Ecuador");
			country.addItem("Egypt");
			country.addItem("El Salvador");
			country.addItem("Equatorial Guinea"); 
			country.addItem("Eritrea");
			country.addItem("Estonia");
			country.addItem("Ethiopia");
			country.addItem("Fiji");
			country.addItem("Finland");
			country.addItem("France");
			country.addItem("Gabon");
			country.addItem("Gambia");
			country.addItem("Georgia");
			country.addItem("Germany");
			country.addItem("Ghana");
			country.addItem("Greece");
			country.addItem("Grenada");
			country.addItem("Guatemala"); 
			country.addItem("Guinea");
			country.addItem("Guinea-Bissau"); 
			country.addItem("Guyana");
			country.addItem("Haiti");
			country.addItem("Honduras");
			country.addItem("Hungary");
			country.addItem("Iceland");
			country.addItem("India");
			country.addItem("Indonesia"); 
			country.addItem("Iran");
			country.addItem("Iraq");
			country.addItem("Ireland");
			country.addItem("Israel");
			country.addItem("Italy");
			country.addItem("Jamaica");
			country.addItem("Japan");
			country.addItem("Jordan");
			country.addItem("Kazakhstan");
			country.addItem("Kenya");
			country.addItem("Kiribati");
			country.addItem("Korea, North");
			country.addItem("Korea, South");
			country.addItem("Kuwait");
			country.addItem("Kyrgyzstan"); 
			country.addItem("Laos");
			country.addItem("Latvia");
			country.addItem("Lebanon");
			country.addItem("Lesotho");
			country.addItem("Liberia");
			country.addItem("Libya");
			country.addItem("Liechtenstein"); 
			country.addItem("Lithuania");
			country.addItem("Luxembourg");
			country.addItem("Macedonia, Former Yugoslav Republic of");
			country.addItem("Madagascar"); 
			country.addItem("Malawi");
			country.addItem("Malaysia");
			country.addItem("Maldives");
			country.addItem("Mali");
			country.addItem("Malta");
			country.addItem("Marshall Islands");
			country.addItem("Mauritania");
			country.addItem("Mauritius"); 
			country.addItem("Mexico");
			country.addItem("Micronesia, Federated States of"); 
			country.addItem("Moldova");
			country.addItem("Monaco");
			country.addItem("Mongolia");
			country.addItem("Morocco");
			country.addItem("Mozambique"); 
			country.addItem("Myanmar");
			country.addItem("Namibia");
			country.addItem("Nauru");
			country.addItem("Nepal");
			country.addItem("Netherlands");
			country.addItem("New Zealand"); 
			country.addItem("Nicaragua"); 
			country.addItem("Niger");
			country.addItem("Nigeria");
			country.addItem("Norway");
			country.addItem("Oman"); 
			country.addItem("Pakistan"); 
			country.addItem("Palau"); 
			country.addItem("Panama"); 
			country.addItem("Papua New Guinea"); 
			country.addItem("Paraguay"); 
			country.addItem("Peru"); 
			country.addItem("Philippines"); 
			country.addItem("Poland"); 
			country.addItem("Portugal"); 
			country.addItem("Qatar"); 
			country.addItem("Romania"); 
			country.addItem("Russia"); 
			country.addItem("Rwanda"); 
			country.addItem("Saint Kitts and Nevis"); 
			country.addItem("Saint Lucia"); 
			country.addItem("Saint Vincent and The Grenadines"); 
			country.addItem("Samoa"); 
			country.addItem("San Marino"); 
			country.addItem("Sao Tome and Principe"); 
			country.addItem("Saudi Arabia"); 
			country.addItem("Senegal"); 
			country.addItem("Seychelles"); 
			country.addItem("Sierra Leone"); 
			country.addItem("Singapore"); 
			country.addItem("Slovakia"); 
			country.addItem("Slovenia"); 
			country.addItem("Solomon Islands"); 
			country.addItem("Somalia"); 
			country.addItem("South Africa"); 
			country.addItem("Spain"); 
			country.addItem("Sri Lanka"); 
			country.addItem("Sudan"); 
			country.addItem("Suriname"); 
			country.addItem("Swaziland"); 
			country.addItem("Sweden"); 
			country.addItem("Switzerland"); 
			country.addItem("Syria"); 
			country.addItem("Taiwan");
			country.addItem("Tajikistan"); 
			country.addItem("Tanzania"); 
			country.addItem("Thailand"); 
			country.addItem("Togo"); 
			country.addItem("Tonga"); 
			country.addItem("Trinidad and Tobago"); 
			country.addItem("Tunisia"); 
			country.addItem("Turkey"); 
			country.addItem("Turkmenistan");
			country.addItem("Tuvalu"); 
			country.addItem("Uganda"); 
			country.addItem("Ukraine"); 
			country.addItem("United Arab Emirates"); 
			country.addItem("United Kingdom");
			country.addItem("United States");
			country.addItem("Uruguay");
			country.addItem("Uzbekistan");
			country.addItem("Vanuatu");
			country.addItem("Vatican City"); 
			country.addItem("Venezuela");
			country.addItem("Vietnam");
			country.addItem("Western Sahara");
			country.addItem("Yemen");
			country.addItem("Yugoslavia (Serbia and Montenegro)");
			country.addItem("Zambia");
			country.addItem("Zimbabwe");
			add(country);
			country.setBounds(185,90,250,25);
			CheckboxGroup gORi = new CheckboxGroup();
			guide = new Checkbox("Travel or guide for Region or Country",gORi,true);
			interesting = new Checkbox("Search interesting web for Region or Country",gORi,false);
			add(guide);
			add(interesting);
			guide.setBounds(150,125,250,25);
			interesting.setBounds(150,150,300,25);
			OKBT = new Button("OK");
			add(OKBT);
			OKBT.setBounds(200,190,30,25);
			CancelBT = new Button("Cancel");
			add(CancelBT);
			CancelBT.setBounds(240,190,45,25);
		}

		public boolean action(Event evt, Object whatAction)
		{
			if (evt.target instanceof Button) 
			{
				String ock=(String)whatAction;
				if (ock.equals("OK"))
				{
					dialog.createDialog("Searching..... Please wait for complete dialog");
					boolean boo_normal=normal.getState();
					boolean boo_region=regionCH.getState();
					boolean boo_guide=guide.getState();
					int_search(boo_normal,boo_region,boo_guide);
					dialog.createDialog("Complete! See result in Interesting link book");
				}
				hide();
				return true;
			}
			return false;
		}

		public static void int_search(boolean norm,boolean reg,boolean guide)
		{
//       Start Searching................
			Vector interest = new Vector();
			Vector title = new Vector();
			Vector detail = new Vector();
			String ss[][] = new String[100][3];
			String sstogo[][] = new String[100][3];
			int ssrate[]= new int[101];
			int position=14;
// initial
			for (int m=0;m<100 ;m++ ) for (int mm=0;mm<3 ;mm++ ) 
			{
				ss[m][mm]="";
				sstogo[m][mm]="";
			}
			for (int xx=0;xx<101 ;xx++ ) ssrate[xx]= -600;

			if (norm)
			{
//  find what sub2 or sub3 is the most rating
				for (int m=0;m<14 ;m++ )
				{
// check for sub2 rating
					for (int mm=0;mm<inform.toplus[m][0] ;mm++ )
					{
						int temp=Math.round((Integer.parseInt(inform.Train_Rate.elementAt(position).toString())+(inform.Active_Rate[m]*2))/2);
						int t1=0;
						while ((t1<100)&&(temp<=ssrate[t1])) t1++;
						if (t1<100)
						{
							if (ssrate[t1]> -600)
							{
								for (int mmm=99;mmm>t1 ;mmm-- )
								{
									if (ssrate[mmm-1]> -600)
									{
										for (int m4=0;m4<2 ;m4++ )
										{
											ss[mmm][m4]=ss[mmm-1][m4];
										}
										ssrate[mmm]=ssrate[mmm-1];
									}
								}
							}
							ssrate[t1]=temp;
							ss[t1][0]=inform.Ref[m];
							ss[t1][1]=inform.Ref[position];
							ss[t1][2]="";
						}
						position++;
					}
// end sub2 check
//start sub3 check
					int tmp2=position-inform.toplus[m][0];
					for (int mm=1;mm<=inform.toplus[m][0] ;mm++ )
					{
						for (int mmm=0;mmm<inform.toplus[m][mm] ;mmm++ )
						{
							int t1=0;
							int tmp=Math.round((Integer.parseInt(inform.Train_Rate.elementAt(position).toString())+(inform.Active_Rate[m]*3))/3);
							while ((t1<100)&&(tmp<=ssrate[t1])) t1++;
							if (t1<100)
							{
								if (ssrate[t1]> -600)
								{
									for (int y=99;y>t1 ;y-- )
									{
										if (ssrate[y-1]> -600)
										{
											for (int yy=0;yy<2 ;yy++ )
											{
												ss[y][yy]=ss[y-1][yy];
											}
											ssrate[y]=ssrate[y-1];
										}
									}
								}
								ssrate[t1]=tmp;
								ss[t1][0]=inform.Ref[m];
								ss[t1][1]=inform.Ref[tmp2];
								ss[t1][2]=inform.Ref[position];
							}
							position++;
						}
						tmp2++;
					}
//end sub3 check
				}// end for loop 0-13 //end find 100 most rating..
// decode directory.. before send to InterestYahooLinkParser
				for (int a=0;a<100 ;a++ )	for (int b=0;b<3 ;b++ )
				{
					for (int c=0;c<ss[a][b].length() ;c++ )
					{
						if ((Character.getNumericValue(ss[a][b].charAt(c))<10)||(Character.getNumericValue(ss[a][b].charAt(c))>35))
						{
							sstogo[a][b]=sstogo[a][b]+"_";
						}
						else sstogo[a][b]=sstogo[a][b]+ss[a][b].charAt(c);
					}
				}
// end decode...
// start to call InterestingYahooLinkParser
				String tmp_s="";
				try
				{
					InterestYahooLinkParser ah = new InterestYahooLinkParser(sstogo);
					for (int oo=0;oo<ah.iinterest.size() ;oo++ )
					{
						inform.UsedLink.addElement(ah.iinterest.elementAt(oo));
						String te=ah.directory.elementAt(oo).toString();
						int po1=0;
						int po2=0;
						while (te.charAt(po1)!='/') po1++;
						po2=po1+1;
						while (te.charAt(po2)!='/') po2++;
						tmp_s=ah.iinterest.elementAt(oo).toString()+" , Directory:"+te.substring(0,po1)+">"+te.substring(po1+1,po2)+">";
						if (po2<te.length()-1)	tmp_s=tmp_s+te.substring(po2+1,te.length()-1)+">";
						interest.addElement(tmp_s);
						title.addElement(ah.titleinterest.elementAt(oo));
						detail.addElement(ah.detailinterest.elementAt(oo));
					}
				}
				catch (IOException ex) {}
// end get int link
			} // end normal mode
			else
// set ss[0] and sstog[]
			{
				if (guide)
				{
					ss[0][0]="Recreation/Travel/By Region";
					sstogo[0][0]="Recreation/Travel/By_Region";
					if (reg) 
					{
						ss[0][1]="Regions";
						ss[0][2]=region.getSelectedItem();
					}
					else 
					{
						ss[0][1]="Countries";
						ss[0][2]=country.getSelectedItem();
					}
				}
				else 
				{
					ss[0][0]="Regional";
					sstogo[0][0]=ss[0][0];
					if (reg) 
					{
						ss[0][1]="Regions";
						ss[0][2]=region.getSelectedItem();
					}
					else 
					{
						ss[0][1]="Countries";
						ss[0][2]=country.getSelectedItem();
					}
				}
				sstogo[0][1]=ss[0][1];
				for (int c=0;c<ss[0][2].length() ;c++ )
				{
					if ((Character.getNumericValue(ss[0][2].charAt(c))<10)||(Character.getNumericValue(ss[0][2].charAt(c))>35))
					{
						sstogo[0][2]=sstogo[0][2]+"_";
					}
					else sstogo[0][2]=sstogo[0][2]+ss[0][2].charAt(c);
				}
// end set and decode now call InterestYahooLinkParser
				String tmp_s="";
				try
				{
					InterestYahooLinkParser ah = new InterestYahooLinkParser(sstogo);//ss[0] is temp; don't mention it.
					for (int oo=0;oo<ah.iinterest.size() ;oo++ )
					{
						inform.UsedLink.addElement(ah.iinterest.elementAt(oo));
						if (guide) tmp_s=ah.iinterest.elementAt(oo).toString()+" , Directory:Recreation>Travel>By Region>";
						else tmp_s=ah.iinterest.elementAt(oo).toString()+" , Directory:"+ss[0][0]+">"+ss[0][1]+">"+ss[0][2]+">";
						interest.addElement(tmp_s);
						title.addElement(ah.titleinterest.elementAt(oo));
						detail.addElement(ah.detailinterest.elementAt(oo));
					}
				}
				catch (IOException exc) {}
			}// end else (for advance mode)
			try
			{
// start to write link to file .int
			    FileInputStream fin = new FileInputStream(inform.GetPath+"user/"+inform.Active_Usname+".int");
				BufferedInputStream bin = new BufferedInputStream(fin);
				DataInputStream din = new DataInputStream(bin);
				Vector keep = new Vector();
				String buf;
				while ((buf = din.readLine()) != null)
				{
					keep.addElement(new String(buf));
				}
				din.close();
				for (int m=0;m<interest.size() ;m++ )
				{
					keep.addElement(interest.elementAt(m));
					keep.addElement(title.elementAt(m));
					keep.addElement(detail.elementAt(m));
				}
				FileWriter ff = new FileWriter (inform.GetPath+"user/"+inform.Active_Usname+".int");
				BufferedWriter bb = new BufferedWriter(ff);
				PrintWriter pp = new PrintWriter(bb);
				for (int m=0;m<keep.size() ;m++ )
				{
					pp.println(keep.elementAt(m).toString());
				}
				bb.close();
				inform.Write_UsedLink();
			}
			catch (IOException ex) {}
		}

		public boolean handleEvent(Event e)
		{
			if (e.id == Event.WINDOW_DESTROY) hide(); 
			return super.handleEvent(e);
		}
	}
// ------------------------------------------------------------------------- //
//					Schedule from search menu
// ------------------------------------------------------------------------- //
	class Schedule extends Frame
	{
		long t=60000;
		public Schedule()
		{
			super("Make a Schedule for searching interesting link");
			setFont(new Font("TimesRoman",0,14));
			setLayout(new FlowLayout());
			add(new Label("What time?"));

			Choice time = new Choice();
			time.addItem("1 min Later");
			time.addItem("10 mins Later");
			time.addItem("30 mins Later");
			time.addItem("1 hour Later");
			time.addItem("3 hours Later");
			time.addItem("5 hours Later");
			add(time);
			add(new Button("OK"));
			add(new Button("Cancel"));
		}

		public boolean action(Event evt,Object whatAction)
		{
			if (evt.target instanceof Choice)
			{
				String selected =((Choice) evt.target).getSelectedItem();
				if (selected == "1 min Later")
				{ t=60000;}
				else if (selected == "10 mins Later")
				{ t=600000; }
				else if (selected == "30 mins Later")
				{ t=1800000; }
				else if (selected == "1 hour Later")
				{ t=6000000; }
				else if (selected == "3 hours Later")
				{ t=18000000; }
				else if (selected == "5 hours Later")
				{ t=30000000; }
			}
			else if (evt.target instanceof Button)
				 {
					String arg = (String)whatAction;
					if (arg.equals("OK"))
					{
						long now = System.currentTimeMillis();
						Date whenToRun = new Date(now+t);
						Timer timer = new Timer();
						TimerTask task = new TimerTask() 
						{
							public void run() 
							{
								Interesting_Search.int_search(true,true,true);
							}
						};
						timer.schedule(task, whenToRun);
					}
					hide(); 	
				 }
				 else return false;
			return true;
		}

		public boolean handleEvent(Event e)
		{
			if (e.id == Event.WINDOW_DESTROY) hide();
			return super.handleEvent(e);
		}
	}
// ------------------------------------------------------------------------- //
//					Link book ( added link and interesting link )
// ------------------------------------------------------------------------- //
	class AddedVInt_Link extends Frame
	{		
		boolean find=false;
		String link[],title[],detail[],ss[],dir[][],filename;
		int page=0,count=0,show[],pos[]= new int[3];
		int rub[],das=0;//das is count of finded links(0--count-1), rub = finded links;
		int sum_rate[];

		Button nextBT,addBT,removeBT,likeBT,dislikeBT,launchBT[],PrevBT,NextBT,okBT,cancelBT;
		TextArea linkTA;
		Checkbox findCB,firstCB,secondCB,thirdCB,fourthCB,fifthCB;
		TextField sum_rateTF[],find_wordTF;
		Label showingLB;

		AddedVInt_Link (boolean add,String sup)
		{
			super(sup);
			setFont(new Font("TimesRoman",0,14));
			setLayout(null);
			show = new int[5];
			// find area
			findCB = new Checkbox("Find");
			add(findCB);
			findCB.setBounds(200,31,45,20);
			find_wordTF = new TextField(15);
			add(find_wordTF);
			find_wordTF.setBounds(250,31,120,20);
			nextBT = new Button ("Find It!");
			add(nextBT);
			nextBT.setBounds(380,31,50,20);

			showingLB = new Label("");
			add(showingLB);
			showingLB.setBounds(122,70,160,19);

			PrevBT = new Button("Previous");
			add(PrevBT);
			PrevBT.setBounds(300,68,55,21);
			NextBT = new Button("Next");
			add(NextBT);
			NextBT.setBounds(360,68,35,21);
			//    4 button (add is for int link book) remove like dislike	
			if (!(add))
			{
				addBT = new Button("Add");
				add(addBT);
				addBT.setBounds(455,68,35,21);
			}
			removeBT = new Button("Remove");
			add(removeBT);
			removeBT.setBounds(495,68,50,21);
			likeBT = new Button("Prefer");
			add(likeBT);
			likeBT.setBounds(550,68,40,21);
			dislikeBT = new Button("Not Prefer");
			add(dislikeBT);
			dislikeBT.setBounds(595,68,55,21);
			//   1-5 Checkbox
			firstCB = new Checkbox();
			add(firstCB);
			firstCB.setBounds(20,97,18,18);
			secondCB = new Checkbox();
			add(secondCB);
			secondCB.setBounds(20,148,18,18);
			thirdCB = new Checkbox();
			add(thirdCB);
			thirdCB.setBounds(20,199,18,18);
			fourthCB = new Checkbox();
			add(fourthCB);
			fourthCB.setBounds(20,250,18,18);
			fifthCB = new Checkbox();
			add(fifthCB);
			fifthCB.setBounds(20,301,18,18);
			//     launch button
			launchBT = new Button[5];
			for (int launch_int=0;launch_int<5 ;launch_int++ )
			{
				launchBT[launch_int] = new Button("Launch");
				add(launchBT[launch_int]);
				launchBT[launch_int].setBounds(41,95+(launch_int*51),42,21);
			}
			//     Sum Rate
			sum_rateTF = new TextField[5];
			for (int sum_int=0;sum_int<5 ;sum_int++ )
			{
				sum_rateTF[sum_int] = new TextField();
				add(sum_rateTF[sum_int]);
				sum_rateTF[sum_int].setBounds(90,96+(sum_int*51),24,20);
			}

			//     result textarea		
			linkTA = new TextArea("",45,60,2);
			add(linkTA);
			linkTA.setBounds(120,95,530,280);
			// ok and cancel button
			okBT = new Button("OK");
			add(okBT);
			okBT.setBounds(300,382,30,22);
			cancelBT = new Button("Cancel");
			add(cancelBT);
			cancelBT.setBounds(350,382,50,22);
			//  get links from file
			String rest;
			if (add) filename=inform.GetPath+"user/"+inform.Active_Usname+".add";
			else filename=inform.GetPath+"user/"+inform.Active_Usname+".int";
			try
			{
				FileReader ff = new FileReader (filename);
				BufferedReader bb = new BufferedReader(ff);
				while ((rest=bb.readLine()) != null)
				{                           
					count++;
				}
				bb.close();
				ss = new String[count];
				count = count/3;
				link = new String[count];
				title = new String[count];
				detail = new String[count];
				rub = new int[count];
				dir = new String[count][3];
				sum_rate = new int[count];
				for (int v=0;v<count ;v++ ) for (int vv=0;vv<3 ;vv++ ) dir[v][vv]="";

				int a=0,bo=0;
				FileReader f = new FileReader (filename);
				BufferedReader b = new BufferedReader(f);
				for (int mm=0;mm<count ;mm++ )
				{
					a=0;bo=0;
					rest=b.readLine();
					ss[mm*3]=rest;
					while (rest.charAt(a)!=' ') a++;
					link[mm]=rest.substring(0,a);
					a=a+13; // move a to directory position
					rest=rest.substring(a);
					a=0;
					while (a<rest.length())
					{
						if (rest.charAt(a)!='>') dir[mm][bo]=dir[mm][bo]+rest.charAt(a);
						else bo++;
						a++;
					}
					title[mm]=b.readLine();
					ss[(mm*3)+1]=title[mm];
					detail[mm]=b.readLine();
					ss[(mm*3)+2]=detail[mm];
					sum_rate[mm]=Cal_Link_Rate(dir[mm]);
				}
				b.close();
			}
			catch (IOException ex) {}
			sortlink();
			// diaplay link
			if (count>0)
			{
				for (int x=0;x<5 ;x++ ) show[x]=x;
				if (count>5) showlink(5);
				else showlink(count);
			}
		}
		public void sortlink()
		{
			for (int a=0;a<count-1 ;a++ )
			{
				int max= -600,pos=-1;
				for (int b=a;b<count ;b++ )
				{
					if (max<sum_rate[b]) 
					{
						max=sum_rate[b];
						pos=b;
					}
				}
				if (a!=pos)
				{
// switch all detail between a and pos
					int tmpint;
					String tmpstring;
					tmpint=sum_rate[a];
					sum_rate[a]=sum_rate[pos];
					sum_rate[pos]=tmpint;
					tmpstring=link[a];
					link[a]=link[pos];
					link[pos]=tmpstring;
					tmpstring=title[a];
					title[a]=title[pos];
					title[pos]=tmpstring;
					tmpstring=detail[a];
					detail[a]=detail[pos];
					detail[pos]=tmpstring;
					String tmparray[] = dir[a];
					dir[a]=dir[pos];
					dir[pos]=tmparray;
					for (int c=0;c<3 ;c++ )
					{
						tmpstring=ss[(a*3)+c];
						ss[(a*3)+c]=ss[(pos*3)+c];
						ss[(pos*3)+c]=tmpstring;
					}
// end switch
				}
			}// end sort
//begin to write to file
			try
			{
				FileWriter fw = new FileWriter (filename);
				BufferedWriter fwb = new BufferedWriter(fw);
				PrintWriter fwp = new PrintWriter(fwb);
				for (int x=0;x<count*3 ;x++ ) fwp.println(ss[x]);
				fwp.close();
			}
			catch (IOException ex) {}
// end write file
		}
		public void showlink(int end)
		{
			linkTA.setText("");
			int n_result=count;
			if (find) n_result=das;
			if (end==0) n_result=0;
			if (n_result==0) showingLB.setText("");
			else showingLB.setText("Showing results: "+((page*5)+1)+" to "+((page*5)+end)+" of "+n_result+" results");
			for (int m=0;m<5 ;m++ ) sum_rateTF[m].setText("");
			for (int mm=0;mm<end ;mm++ )
			{
				linkTA.appendText(((page*5)+1+mm)+". "+link[show[mm]]+" , Directory:");
				for (int m=0;m<3 ;m++ ) if (dir[show[mm]][m]!="") linkTA.appendText(dir[show[mm]][m]+">");
				linkTA.appendText("\n");
				linkTA.appendText("   "+title[show[mm]]+" \n");
				linkTA.appendText("   "+detail[show[mm]]);
				if (mm!=4) linkTA.appendText(" \n");
				sum_rateTF[mm].setText(""+sum_rate[show[mm]]);
			}
		}

		public boolean action(Event evt, Object whatAction)
		{
			if (evt.target instanceof Button)
			{
				String arg = (String)whatAction;
				if (arg.equals("Find It!"))
	   			{
					if (findCB.getState())
					{
						find_word();
					}
					else dialog.createDialog("Check the 'Find' box to confirm searching the word and uncheck it to go back");
				}// end if find it
				if (arg.equals("Add"))
				{
					if (!(firstCB.getState())&&!(secondCB.getState())&&!(thirdCB.getState())&&!(fourthCB.getState())&&!(fifthCB.getState())) dialog.createDialog("Please check the link you want to add to your added link book!");
					else
					{
						String us;
						Vector s = new Vector();
						try
						{
							FileReader fr = new FileReader (inform.GetPath+"user/"+inform.Active_Usname+".add");
							BufferedReader br = new BufferedReader(fr);
							while ((us=br.readLine()) != null) s.addElement(new String(us));
							br.close();
							FileWriter fw = new FileWriter (inform.GetPath+"user/"+inform.Active_Usname+".add");
							BufferedWriter fwb = new BufferedWriter(fw);
							PrintWriter fwp = new PrintWriter(fwb);
							for (int x=0;x<s.size() ;x++ ) fwp.println(s.elementAt(x).toString());
							if (firstCB.getState())
							{
								for (int x=0;x<3 ;x++ ) fwp.println(ss[(show[0]*3)+x]);
								firstCB.setState(false);
							}
							if (secondCB.getState())
							{
								for (int x=0;x<3 ;x++ ) fwp.println(ss[(show[1]*3)+x]);
								secondCB.setState(false);
							}
							if (thirdCB.getState())
							{
								for (int x=0;x<3 ;x++ ) fwp.println(ss[(show[2]*3)+x]);
								thirdCB.setState(false);
							}
							if (fourthCB.getState())
							{
								for (int x=0;x<3 ;x++ ) fwp.println(ss[(show[3]*3)+x]);
								fourthCB.setState(false);
							}
							if (fifthCB.getState())
							{
								for (int x=0;x<3 ;x++ ) fwp.println(ss[(show[4]*3)+x]);
								fifthCB.setState(false);
							}
							fwp.close();
						}
						catch (IOException ex) {}
						dialog.createDialog("Link(s) added to added link book");	
					}// end else have box checked
				}// end if add
				if (arg.equals("Remove"))
				{
					if (!(firstCB.getState())&&!(secondCB.getState())&&!(thirdCB.getState())&&!(fourthCB.getState())&&!(fifthCB.getState())) dialog.createDialog("Please check the link you want to remove!");
					else
					{	
						// clear old value... prepare for a new one.
						for (int mm=0;mm<count ;mm++ )
						{
							link[mm]="";
							title[mm]="";
							detail[mm]="";
							for (int mmm=0;mmm<3 ;mmm++ ) dir[mm][mmm]="";
						}
// start to check which one is checked				
						Vector tm = new Vector();
						if (firstCB.getState()) {firstCB.setState(false); tm.addElement(new Integer(show[0]));}
						if (secondCB.getState()) {secondCB.setState(false); tm.addElement(new Integer (show[1]));}
						if (thirdCB.getState()) {thirdCB.setState(false); tm.addElement(new Integer (show[2]));}
						if (fourthCB.getState()) {fourthCB.setState(false); tm.addElement(new Integer (show[3]));}
						if (fifthCB.getState()) {fifthCB.setState(false); tm.addElement(new Integer (show[4]));}
// end check switch up the lower one(s) to cover the removed one(s)
						for (int x=1;x<=tm.size() ;x++ )
						{
							int um=Integer.parseInt(tm.elementAt(x-1).toString())-x+1;
							for (int xx=um;xx<count-x ;xx++ )
							{
								ss[xx*3]=ss[(xx+1)*3];
								ss[(xx*3)+1]=ss[((xx+1)*3)+1];
								ss[(xx*3)+2]=ss[((xx+1)*3)+2];
							}
							ss[(count-x)*3]="";
							ss[((count-x)*3)+1]="";
							ss[((count-x)*3)+2]="";
						}
						count=count-tm.size();
//write to file
						try
						{
							FileWriter fw = new FileWriter (filename);
							BufferedWriter fwb = new BufferedWriter(fw);
							PrintWriter fwp = new PrintWriter(fwb);
							for (int x=0;x<count*3 ;x++ ) fwp.println(ss[x]);
							fwp.close();
						}
						catch (IOException ex) {}
// rearrange all variables again
						String rest;
						for (int mm=0;mm<count ;mm++ )
						{
							int a=0,bo=0;
							rest=ss[mm*3];
							while (rest.charAt(a)!=' ') a++;
							link[mm]=ss[mm*3].substring(0,a);
							a=a+13; // move a to directory position
							rest=rest.substring(a);
							a=0;
							while (a<rest.length())
							{
								if (rest.charAt(a)!='>') dir[mm][bo]=dir[mm][bo]+rest.charAt(a);
								else bo++;
								a++;
							}
							title[mm]=ss[(mm*3)+1];
							detail[mm]=ss[(mm*3)+2];
							sum_rate[mm]=Cal_Link_Rate(dir[mm]);
						}
						dialog.createDialog("Removed!");
						int halt=5;
						page=0;
						if (find) find_word();
						else 
						{
							if (count<5) halt=count;
							for (int mm=0;mm<halt ;mm++ ) show[mm]=mm;
							showlink(halt);
						}
					}
				}
				if ((arg.equals("Prefer"))||(arg.equals("Not Prefer")))
				{
					String s[] = new String[3];
					while ((firstCB.getState())||(secondCB.getState())||(thirdCB.getState())||(fourthCB.getState())||(fifthCB.getState()))
					{
						boolean check=true;
						if (firstCB.getState()) 
						{
							if (dir[show[0]][0]!="null") for (int q=0;q<3 ;q++ ) s[q]=dir[show[0]][q]; 
							else 
							{
								dialog.createDialog("Link is unable to find directory!Can't train this link");
								check=false;
							}
							firstCB.setState(false); 
						}
						else if (secondCB.getState()) 
							 { 
								if (dir[show[1]][0]!="null") for (int q=0;q<3 ;q++ ) s[q]=dir[show[1]][q]; 
								else 
								{
									dialog.createDialog("Link is unable to find directory!Can't train this link");
									check=false;
								}
								secondCB.setState(false); 
							 }
							 else if (thirdCB.getState()) 
								  { 
									 if (dir[show[2]][0]!="null") for (int q=0;q<3 ;q++ ) s[q]=dir[show[2]][q]; 
									 else 
									 {
										dialog.createDialog("Link is unable to find directory!Can't train this link");
										check=false;
									 }
									 thirdCB.setState(false); 
								  }
								  else if (fourthCB.getState()) 
									   { 
											if (dir[show[3]][0]!="null") for (int q=0;q<3 ;q++ ) s[q]=dir[show[3]][q]; 
	 										else 
											{
												dialog.createDialog("Link is unable to find directory!Can't train this link");
												check=false;
											}
											fourthCB.setState(false); 
									   }
									   else if (fifthCB.getState()) 
											{ 
												if (dir[show[4]][0]!="null") for (int q=0;q<3 ;q++ ) s[q]=dir[show[4]][q]; 
		 										else 
												{
													dialog.createDialog("Link is unable to find directory!Can't train this link");
													check=false;
												}
												fifthCB.setState(false); 
											}
						if (check)
						{
							Find_Pos(s);
							int inc1=1,inc2=2,inc3=3;
							if (arg.equals("Not Prefer"))
							{
								inc1= -1;inc2 = -2; inc3 = -3;
							}
							int old1=Integer.parseInt(inform.Train_Rate.elementAt(pos[0]).toString());
							int old2=Integer.parseInt(inform.Train_Rate.elementAt(pos[1]).toString());
							int old3=Integer.parseInt(inform.Train_Rate.elementAt(pos[2]).toString());
							inform.Train_Rate.removeElementAt(pos[0]);
							inform.Train_Rate.insertElementAt(new Integer(old1+inc1),pos[0]);
							inform.Train_Rate.removeElementAt(pos[1]);
							inform.Train_Rate.insertElementAt(new Integer(old1+inc2),pos[1]);
							inform.Train_Rate.removeElementAt(pos[2]);
							inform.Train_Rate.insertElementAt(new Integer(old1+inc3),pos[2]);
						}
					}// end while
					dialog.createDialog("Link(s) trained");
				}// end if like
				if (arg.equals("Previous"))
				{
					if (page == 0) dialog.createDialog("This is the first page");
					else 
					{
						page--;
						if (find) for (int x=0;x<5 ;x++ ) show[x]=rub[(page*5)+x];
						else for (int x=0;x<5 ;x++ ) show[x]=(page*5)+x;;
						showlink(5);
					}//end else
				}// end if pg. up.
				if (arg.equals("Next"))
				{
					int stop=5;
					if (find)
					{
						if ((page+1)*5>=das) dialog.createDialog("No more page to display");
						else
						{
							page++;
							if ((page+1)*5>das) stop=das-(page*5);
							for (int mm=0;mm<stop ;mm++ )
							{
								show[mm]=rub[(page*5)+mm];
							}
							showlink(stop);
						}
					}
					else
					{	if ((page+1)*5>=count) dialog.createDialog("No more page to display");
						else 
						{
							page++;
							if ((page+1)*5>count) stop=count-(page*5);
							for (int mm=0;mm<stop ;mm++) show[mm]=(page*5)+mm;
							showlink(stop);
						} // end else 
					}
				} // end if pg dn.
				if (arg.equals("Launch"))
				{
					for (int launch_int=0;launch_int<5 ;launch_int++ )
					{
						if (evt.target == launchBT[launch_int])
						{
							Runtime rr = Runtime.getRuntime();
							try
							{
								rr.exec("C:/Program Files/Internet Explorer/IEXPLORE.EXE "+link[show[launch_int]]);
							}
							catch (Exception e) {}
						}
					}
				}
				if ((arg.equals("OK"))||(arg.equals("Cancel")))
				{
					hide();
				}
				return true;
			}
			else if (evt.target instanceof Checkbox) 
 				 {
					Checkbox act = (Checkbox)evt.target;
					if (act.getLabel() == "Find")
					{
						if (!(findCB.getState())) 
						{
							find=false;
							page=0;
							if (count>4)
							{
								for (int x=0;x<5 ;x++ ) show[x]=x;
								showlink(5);
							}
							else
							{
								for (int x=0;x<count ;x++ ) show[x]=x;
								showlink(count);
							}
						}
					 	else ;
					}
					return true;
				 }
				 else return false;
		}// end action
		public void find_word()
		{
			for (int mm=0;mm<count ;mm++ ) rub[mm]=-1;
			das=0;
			for (int mm=0;mm<count ;mm++ )
			{
				if ((link[mm].indexOf(find_wordTF.getText())>=0)||(title[mm].indexOf(find_wordTF.getText())>=0)||(detail[mm].indexOf(find_wordTF.getText())>=0))
				{
					rub[das]=mm;
					das++;
				}
			}
			if (rub[0]>=0) 
			{
				page=0;
				find=true;
				if (das>5)
				{
					for (int mm=0;mm<5 ;mm++ ) show[mm]=rub[mm];
					showlink(5);
				}
				else
				{
					for (int mm=0;mm<das ;mm++ ) show[mm]=rub[mm];
					showlink(das);
				}
			}
			else 
			{
				dialog.createDialog("Word not found");
				showlink(0);
			}
		}
		public int Cal_Link_Rate(String s[])
		{
			int r=0,rr=0,rrr=0;
			if (s[0]=="") return 0;
			Find_Pos(s);
			if (pos[0]== -1) return 0;
			else
			{
				r=inform.Active_Rate[pos[0]]+Integer.parseInt(inform.Train_Rate.elementAt(pos[0]).toString());
				if (r>100) r = 100;
				if (r< -100) r = -100;
				if (pos[1]!= -1)
				{
					rr=(inform.Active_Rate[pos[0]]*2)+Integer.parseInt(inform.Train_Rate.elementAt(pos[1]).toString());
					if (r>200) r = 200;
					if (r< -200) r = -200;
					if (pos[2]!= -1)
					{
						rrr=(inform.Active_Rate[pos[0]]*3)+Integer.parseInt(inform.Train_Rate.elementAt(pos[2]).toString());
						if (r>300) r = 300;
						if (r< -300) r = -300;
						return Math.round((Math.round((r+rr+rrr)/2)+Math.round(inform.Out_Dir[pos[0]]*100))/4);// = Math.round((Math.round((r+rr+rrr)/6)*3+Math.round(Out_Dir[pos[0]]*100))/4);
					}
					return Math.round((r+rr+Math.round(inform.Out_Dir[pos[0]]*100))/4); // = Math.round((Math.round((r+rr+rrr)/3)*3+Math.round(Out_Dir[pos[0]]*100))/4);
				}
				return Math.round(((r*3)+Math.round(inform.Out_Dir[pos[0]]*100))/4);
			}
		}
//   end cal
		public void Find_Pos(String s[])
		{
			int a=0,aa=0,aaa=0;
			for (int o=0;o<3 ;o++ )pos[o]=0;
			for (a=0;a<15 ;a++ ) if (s[0].startsWith(inform.Ref[a])) break;
			if (a>=14) pos[0]= -1;
			else
			{
				pos[0]=a;
				if (s[1]!="")
				{
					pos[1]=14;
					for (int b=0;b<a ;b++ )	
						for (int bb=0;bb<=inform.toplus[b][0] ;bb++ ) pos[1]=pos[1]+inform.toplus[b][bb];
					for (aa=0;aa<=inform.toplus[a][0] ;aa++ ) if (inform.Ref[aa+pos[1]].equals(s[1])) break;
					if (aa>=inform.toplus[a][0]) pos[1]= -1;
					else
					{
						pos[1]=pos[1]+aa;
						if (s[2]!="")
						{
							pos[2]=pos[1]-aa;  
							for (int bb=0;bb<=aa ;bb++ ) pos[2]=pos[2]+inform.toplus[a][bb];
							for (aaa=0;aaa<=inform.toplus[a][aa+1] ;aaa++ ) if (inform.Ref[aaa+pos[2]].equals(s[2])) break;
							if (aaa>=inform.toplus[a][aa+1]) pos[2]= -1;
							else
							{
								pos[2]=pos[2]+aaa;
							}
						}
					}
				}
			}
		}

		public boolean handleEvent(Event e)
		{
			if (e.id == Event.WINDOW_DESTROY) hide();
			return super.handleEvent(e);
		}

		public void paint(Graphics g)
		{
			g.drawLine(0,60,670,60);
		}
	}
// ------------------------------------------------------------------------- //
//					Add new profile  or  Edit Profile
// ------------------------------------------------------------------------- //
	class NewVEdit_Profile extends Frame 
	{
		 Choice sexCH,ageCH,educateCH,occupationCH;
		 Label nameLB,sexLB,ageLB,educateLB,occupationLB,usnameLB,passwordLB,repasswordLB;
		 Label oneDLB,twoDLB,threeDLB,fourDLB,fiveDLB,sixDLB,sevenDLB;
		 Label eightDLB,nineDLB,tenDLB,elevenDLB,twelveDLB,thirteenDLB,fourteenDLB;
		 Label sentence1LB,sentence2LB;
		 TextField R[],nameTF,usnameTF,passwordTF,repasswordTF;
		 Button okBT,cancelBT;
		 public String tmp,name,age,educate,sex,occupation,password,r[];
		 public boolean plus;

		NewVEdit_Profile (String sup,boolean aadd)
		{
			super(sup);
			plus = aadd;
			setFont(new Font("TimesRoman",0,14));
			R = new TextField[14];
			setLayout(null);
//----------------- detail -------------------------------//
			nameLB = new Label("Name - Surname");
			add(nameLB);
			nameLB.setBounds(20,40,93,20);
			nameTF = new TextField ();
			add(nameTF);
			nameTF.setBounds(125,40,210,20);
			ageLB = new Label ("Age");
			add(ageLB);
			ageLB.setBounds(20,80,25,20);
			ageCH = new Choice();
			ageCH.addItem("6-10");
			ageCH.addItem("11-15");
			ageCH.addItem("16-20");
			ageCH.addItem("21-25");
			ageCH.addItem("26-30");
			ageCH.addItem("31-35");
			ageCH.addItem("36-40");
			ageCH.addItem("41-45");
			ageCH.addItem("46-50");
			ageCH.addItem("51-55");
			ageCH.addItem("56-60");
			ageCH.addItem("60+");
			add(ageCH);
			ageCH.setBounds(50,80,60,20);
			educateLB = new Label ("Education");
			add(educateLB);
			educateLB.setBounds(125,80,60,20);
			educateCH = new Choice();
			educateCH.addItem("3rd grade");
			educateCH.addItem("6th grade");
			educateCH.addItem("9th grade");
			educateCH.addItem("12th grade");
			educateCH.addItem("Diploma");
			educateCH.addItem("Bachelor degree");
			educateCH.addItem("Master degree");
			educateCH.addItem("Docter degree");
			add(educateCH);
			educateCH.setBounds(190,80,115,20);
			sexLB = new Label ("Sex");
			add(sexLB);
			sexLB.setBounds(20,120,20,20);
			sexCH = new Choice();
			sexCH.addItem("male");
			sexCH.addItem("female");
			add(sexCH);
			sexCH.setBounds(50,120,60,20);
			occupationLB = new Label ("Occupation");
			add(occupationLB);
			occupationLB.setBounds(125,120,65,20);
			occupationCH = new Choice();
			occupationCH.addItem("Academic");
			occupationCH.addItem("Art/Entertainment");
			occupationCH.addItem("Business owner");
			occupationCH.addItem("College&University student");
			occupationCH.addItem("Community&Social");
			occupationCH.addItem("Computers");
			occupationCH.addItem("Financial");
			occupationCH.addItem("Government official");
			occupationCH.addItem("Home&Retired");
			occupationCH.addItem("Individual");
			occupationCH.addItem("Law");
			occupationCH.addItem("Managerial");
			occupationCH.addItem("Medical/Health");
			occupationCH.addItem("Military");
			occupationCH.addItem("Other Services");
			occupationCH.addItem("Primary&Secondary student");
			occupationCH.addItem("Professional&Technical");
			occupationCH.addItem("Retail");
			occupationCH.addItem("Science&Research");
			occupationCH.addItem("Sports");
			add(occupationCH);
			occupationCH.setBounds(190,120,170,20);
//------------------ end detail -------------//
//--------------- username  and password ---------------//
			if (aadd)
			{
				usnameLB = new Label("Username");
				add(usnameLB);
				usnameLB.setBounds(400,40,60,20);
				usnameTF = new TextField();
				add(usnameTF);
				usnameTF.setBounds(520,40,90,20);
				sentence1LB = new Label ("Please fill the Rating 0-100 in each blank below.");
				add(sentence1LB);
				sentence1LB.setBounds(220,160,300,20);
				sentence2LB = new Label ("Each Rating means how much you like each directory.");
				add(sentence2LB);
				sentence2LB.setBounds(205,180,330,20);
			}
			else 
			{
				sentence1LB = new Label ("Change your password here");
				add(sentence1LB);
				sentence1LB.setBounds(435,40,170,20);
				sentence2LB = new Label ("Change your rating here");
				add(sentence2LB);
				sentence2LB.setBounds(250,173,150,20);
			}
			passwordLB = new Label("Password");
			add(passwordLB);
			passwordLB.setBounds(400,80,60,20);
			passwordTF = new TextField();
			passwordTF.setEchoCharacter('*');
			add(passwordTF);
			passwordTF.setBounds(520,80,90,20);
			repasswordLB = new Label("Reenter password");
			add(repasswordLB);
			repasswordLB.setBounds(400,120,110,20);
			repasswordTF = new TextField();
			repasswordTF.setEchoCharacter('*');
			add(repasswordTF);
			repasswordTF.setBounds(520,120,90,20);
//---------------- directory ------------------------------//
			oneDLB = new Label("Art & Humanity");
			add(oneDLB);
			oneDLB.setBounds(50,220,100,20);
			twoDLB = new Label("Business & Economy");
			add(twoDLB);
			twoDLB.setBounds(50,260,125,20);
			threeDLB = new Label("Computers & Internet");
			add(threeDLB);
			threeDLB.setBounds(50,300,125,20);
			fourDLB = new Label("Education");
			add(fourDLB);
			fourDLB.setBounds(50,340,100,20);
			fiveDLB = new Label("Entertainment");
			add(fiveDLB);
			fiveDLB.setBounds(50,380,100,20);
			sixDLB = new Label("Government");
			add(sixDLB);
			sixDLB.setBounds(50,420,100,20);
			sevenDLB = new Label("Health");
			add(sevenDLB);
			sevenDLB.setBounds(50,460,100,20);
			eightDLB = new Label("News & Media");
			add(eightDLB);
			eightDLB.setBounds(350,220,100,20);
			nineDLB = new Label("Recreation & Sports");
			add(nineDLB);
			nineDLB.setBounds(350,260,110,20);
			tenDLB = new Label("Reference");
			add(tenDLB);
			tenDLB.setBounds(350,300,100,20);
			elevenDLB = new Label("Regional");
			add(elevenDLB);
			elevenDLB.setBounds(350,340,100,20);
			twelveDLB = new Label("Science");
			add(twelveDLB);
			twelveDLB.setBounds(350,380,100,20);
			thirteenDLB = new Label("Social Science");
			add(thirteenDLB);
			thirteenDLB.setBounds(350,420,100,20);
			fourteenDLB = new Label("Society & Cultures");
			add(fourteenDLB);
			fourteenDLB.setBounds(350,460,110,20);

			for (int I=0;I<7;I++)
			{
				R[I] = new TextField(3);
				add(R[I]);
				R[I].setBounds(200,(I*40)+220,25,20);
			}
			for (int J=7;J<14 ;J++ )
			{
				R[J] = new TextField(3);
				add(R[J]);
				R[J].setBounds(495,(J-7)*40+220,25,20);
			}

			okBT = new Button("OK");
			add(okBT);
			okBT.setBounds(265,497,30,22);
			cancelBT = new Button("Cancel");
			add(cancelBT);
			cancelBT.setBounds(315,497,50,22);

			if(!(aadd))
			{
				try
				{
					FileReader ff = new FileReader (inform.GetPath+"user/"+inform.Active_Usname+".pro");
					BufferedReader bb = new BufferedReader(ff);
					for (int ttt=1;ttt<=21 ;ttt++ )
					{
						switch(ttt)
						{
							case 1 : tmp = bb.readLine(); // temp...
									 break;
							case 2 : name = bb.readLine();nameTF.setText(name);
									 break;
							case 3 : age = bb.readLine();ageCH.select(age);
									 break;
							case 4 : educate = bb.readLine();educateCH.select(educate);
									 break;
							case 5 : sex = bb.readLine();sexCH.select(sex);
									 break;
							case 6 : occupation = bb.readLine();occupationCH.select(occupation);
									 break;
							case 7 : password = bb.readLine();
									 break;
							default : tmp = bb.readLine();R[ttt-8].setText(tmp);
						}
					}
					bb.close();
				}
				catch (IOException ex) {}
			}
 		}

		public boolean action(Event evt, Object whatAction)
		{
			if (!(evt.target instanceof Button)) return false;
			String haha = (String)whatAction;
			if (haha.equals("Cancel")) { hide(); return true;}
// check the correction of profile form
			if (nameTF.getText().equals(""))
			{
				dialog.createDialog("Name-Surname required");
				return false;
			}
			else if (!(passwordTF.getText().equals(repasswordTF.getText())))
			{
				dialog.createDialog("Password is not the same as Reenter password.Please type again.");
				return false;
			}
			else if ((plus)&&(usnameTF.getText().equals("")))
			{
				dialog.createDialog("Username required");
				return false;
			}
			else for (int ja=0;ja<14 ;ja++ )
			{
				try
				{
					Integer tmp = new Integer(R[ja].getText());
					if ((tmp.intValue()<0)|(tmp.intValue()>100))
					{
						dialog.createDialog("Rating must be number between 0-100");
						return false;
					}
				}
				catch (NumberFormatException ex)
				{ 
					dialog.createDialog("Rating must be number");
					return false;
				}
			}
			if (plus)	
			{
				File d = new File(inform.GetPath+"user");
				String n[] = d.list();
				for (int ha=0;ha<n.length ;ha++ )
				{
					if (n[ha].endsWith(".pro")) 
						{
							if (n[ha].substring(0,n[ha].length()-4).equals(usnameTF.getText()))
							{
								dialog.createDialog("This username has been used"); 
								return false;
							}
						}
				}	
// end check
//    send username and rating to inform (main) class
				inform.Active_Usname = usnameTF.getText();
				inform.Profile_NameLB.setText(usnameTF.getText());
			}
			try
			{	
				if (plus)
				{
					FileWriter us = new FileWriter(inform.GetPath+"user/" + usnameTF.getText() + ".use"); 
					us.close();
					FileWriter ad = new FileWriter(inform.GetPath+"user/" + usnameTF.getText() + ".add"); 
					ad.close();
					FileWriter intt = new FileWriter(inform.GetPath+"user/" + usnameTF.getText() + ".int");
					intt.close();
					tmp = usnameTF.getText();
					FileWriter FW = new FileWriter (inform.GetPath+"user/" + tmp + ".tra");
					BufferedWriter BW = new BufferedWriter(FW);
					PrintWriter PW = new PrintWriter(BW);
					for (int mm=0;mm<4037 ;mm++ ) 
					{
						PW.println("0");
						inform.Train_Rate.addElement(new Integer(0));
					}
					PW.close();
				}// end if plus
// end if plus that send train rate
				else {tmp = inform.Active_Usname;}

				FileWriter F = new FileWriter (inform.GetPath+"user/" + tmp + ".pro");
				BufferedWriter B = new BufferedWriter(F);
				PrintWriter P = new PrintWriter(B);
// start of file
				if (plus) P.println(usnameTF.getText()); else P.println(inform.Active_Usname);
				P.println(nameTF.getText());
				P.println(ageCH.getSelectedItem());
				P.println(educateCH.getSelectedItem());
				P.println(sexCH.getSelectedItem());
				P.println(occupationCH.getSelectedItem());
				if (!(passwordTF.getText().equals(""))) P.println(passwordTF.getText()); else P.println(password);
//	weight for 14 main Directories
				for (int a0=1;a0<=14 ;a0++ )
				{
					P.println(R[a0-1].getText());
					inform.Active_Rate[a0-1] = Integer.parseInt(R[a0-1].getText());
				}
				P.close();
// end of file
			}
			catch (IOException ex) {}
			Choose_Profile.Send_Out_Dir();
			hide();
			inform.Keyword.enable();
			inform.Int_Links.enable();
			inform.Make_Schedule.enable();
			inform.Added_Links.enable();
			inform.Schedule_Links.enable();
			inform.Edit_Profile.enable();
			if (plus) inform.Status_DetailLB.setText("Hi! "+usnameTF.getText()); else inform.Status_DetailLB.setText("Profile edited");

			return true;
		}

		public void paint(Graphics g)
		{
			g.drawLine(0,155,630,155);
			g.drawLine(385,10,385,155);
		}

		public boolean handleEvent(Event e)
		{
			if (e.id == Event.WINDOW_DESTROY) hide();
			return super.handleEvent(e);
		}
	}
// ------------------------------------------------------------------------- //
//					Profile : Choose Profile
// ------------------------------------------------------------------------- //
	class Choose_Profile extends Frame
	{
		String tmpp[];
		Choice allusn;
		String true_pw="";
		TextField pword;

		Choose_Profile ()
		{
			super("Choose profile");
			setFont(new Font("TimesRoman",0,14));
			setLayout(new FlowLayout());
			File ddd = new File(inform.GetPath+"user");
			String nnn[] = ddd.list();
			tmpp = new String[80];
			int tmp_inte = 0;
			for (int ha=0;ha<nnn.length ;ha++ )
				{	
					if (nnn[ha].endsWith(".pro")) 
					{
						tmpp[tmp_inte] = nnn[ha].substring(0,nnn[ha].length()-4);
						tmp_inte++;
					}
				}	
			add(new Label("  Choose your profile and enter the password      "));
			allusn = new Choice();
			for (int hb=0;hb<tmp_inte ;hb++ ) allusn.addItem(tmpp[hb]);
			add(allusn);
			add(new Label("Password"));
			pword = new TextField(15);
			pword.setEchoCharacter('*');
			add(pword);
			add(new Label ("   "));
			add(new Button("OK"));
			add(new Button("Cancel"));
		}

		public boolean action(Event evt, Object whatAction)
		{
			if (!(evt.target instanceof Button)) return false;
			String but = (String)whatAction;
			if (but.equals("OK"))
			{	
				try
				{
					FileReader ff = new FileReader (inform.GetPath+"user/"+allusn.getSelectedItem()+".pro");
					BufferedReader bb = new BufferedReader(ff);
					for (int ttt=0;ttt<7 ;ttt++ ) true_pw = bb.readLine();
					bb.close();
				}
				catch (IOException ex) {}
				if (true_pw.equals(pword.getText()))
				{
//		send username and Active_Rate and rating to inform class
					inform.Active_Usname = allusn.getSelectedItem();
					inform.Profile_NameLB.setText(allusn.getSelectedItem());
					Send_Out_Dir();
					String getrate="";
					try
					{
						FileReader fr = new FileReader (inform.GetPath+"user/"+allusn.getSelectedItem()+".pro");
						BufferedReader br = new BufferedReader(fr);
						for (int ttt=0;ttt<21 ;ttt++ ) 
						{
							getrate = br.readLine();
							if (ttt>=7) inform.Active_Rate[ttt-7]=Integer.parseInt(getrate);
						}
						br.close();
					}
					catch (IOException ex) {}
					String cc = "";
					int bb=inform.Train_Rate.size();
					if (!(inform.Active_Usname.equals("")))	for (int aa=0;aa<bb ;aa++) inform.Train_Rate.removeElementAt(0);
					try
					{
						FileReader fr = new FileReader (inform.GetPath+"user/"+allusn.getSelectedItem()+".tra");
						BufferedReader br = new BufferedReader(fr);
				//	 add element for main sub (sub1)
						for (int mm=0;mm<4037 ;mm++ )
						{
							cc=br.readLine();
							inform.Train_Rate.addElement(new Integer(cc));
						}
						br.close();
						InterestYahooLinkParser.getUsedLink(); // get used link use method in InterestYahooLinkParser
					}
					catch (IOException ex) {}
//		end send
					hide();
					inform.Keyword.enable();
					inform.Int_Links.enable();
					inform.Make_Schedule.enable();
					inform.Added_Links.enable();
					inform.Schedule_Links.enable();
					inform.Edit_Profile.enable();
					inform.Status_DetailLB.setText("Hi! "+allusn.getSelectedItem());
					inform.ResultTA.setText("");
					for (int a=0;a<5 ;a++ ) inform.Sum_RateTF[a].setText("");
					inform.Showed_LinkLB.setText("");
				}
				else dialog.createDialog("Wrong Password");
			}
			hide();
			return true;
		}

		public static void Send_Out_Dir()
		{
			String s[]= new String[4];
			float NProfile[]= new float[4];
			try
			{
			    FileInputStream fin = new FileInputStream(inform.GetPath+"user/"+inform.Active_Usname+".pro");
				BufferedInputStream bin = new BufferedInputStream(fin);
				DataInputStream din = new DataInputStream(bin);
				s[0] = din.readLine();//temp for username
				s[0] = din.readLine();//temp for name
				s[1] = din.readLine();//age
				s[3] = din.readLine();//education
				s[0] = din.readLine();//sex
				s[2] = din.readLine();//occupation
				din.close();
			}
			catch (IOException ex){}

			if (s[0].equals("male")) NProfile[0]=0.0f;
			else NProfile[0]=1.0f;

			if (s[1].equals("6-10")) NProfile[1]=0.0f;
			else if (s[1].equals("11-15")) NProfile[1]= 0.091f;
			else if (s[1].equals("16-20")) NProfile[1]= 0.182f;
			else if (s[1].equals("21-25")) NProfile[1]= 0.273f;
			else if (s[1].equals("26-30")) NProfile[1]= 0.364f;
			else if (s[1].equals("31-35")) NProfile[1]= 0.455f;
			else if (s[1].equals("36-40")) NProfile[1]= 0.545f;
			else if (s[1].equals("41-45")) NProfile[1]= 0.636f;
			else if (s[1].equals("46-50")) NProfile[1]= 0.727f;
			else if (s[1].equals("51-55")) NProfile[1]= 0.818f;
			else if (s[1].equals("56-60")) NProfile[1]= 0.910f;
			else NProfile[1]= 1.0f;

			if (s[3].equals("3rd grade")) NProfile[3]= 0.0f;
			else if (s[3].equals("6th grade")) NProfile[3]= 0.143f;
			else if (s[3].equals("9th grade")) NProfile[3]= 0.286f;
			else if (s[3].equals("12th grade")) NProfile[3]= 0.429f;
			else if (s[3].equals("Diploma")) NProfile[3]= 0.571f;
			else if (s[3].equals("Bachelor degree")) NProfile[3]= 0.714f;
			else if (s[3].equals("Master degree")) NProfile[3]= 0.857f;
			else NProfile[3]= 1.0f;

			if (s[2].equals("Academic")) NProfile[2]= 0.0f;
			else if (s[2].equals("Art/Entertainment")) NProfile[2]= 0.053f;
			else if (s[2].equals("Business owner")) NProfile[2]= 0.105f;
			else if (s[2].equals("College&University student")) NProfile[2]= 0.158f;
			else if (s[2].equals("Community&Social")) NProfile[2]= 0.211f;
			else if (s[2].equals("Computers")) NProfile[2]= 0.263f;
			else if (s[2].equals("Financial")) NProfile[2]= 0.316f;
			else if (s[2].equals("Government official")) NProfile[2]= 0.368f;
			else if (s[2].equals("Home&Retired")) NProfile[2]= 0.421f;
			else if (s[2].equals("Individual")) NProfile[2]= 0.474f;
			else if (s[2].equals("Law")) NProfile[2]= 0.526f;
			else if (s[2].equals("Managerial")) NProfile[2]= 0.579f;
			else if (s[2].equals("Medical/Health")) NProfile[2]= 0.632f;
			else if (s[2].equals("Military")) NProfile[2]= 0.684f;
			else if (s[2].equals("Other Services")) NProfile[2]= 0.737f;
			else if (s[2].equals("Primary&Secondary student")) NProfile[2]= 0.789f;
			else if (s[2].equals("Professional&Technical")) NProfile[2]= 0.845f;
			else if (s[2].equals("Retail")) NProfile[2]= 0.895f;
			else if (s[2].equals("Science&Research")) NProfile[2]= 0.947f;
			else NProfile[2]= 1.0f;

			NeuralNetwork neural = new NeuralNetwork("newTrain.dat");
			inform.Out_Dir = neural.Forward(NProfile);
		}

		public boolean handleEvent(Event e)
		{
			if (e.id == Event.WINDOW_DESTROY) hide();
			return super.handleEvent(e);
		}
	}
// ------------------------------------------------------------------------- //
//					Profile : Delete Profile
// ------------------------------------------------------------------------- //
	class Delete_Profile extends Frame
	{
		String tmp[];
		Choice usn;

		Delete_Profile ()
		{
			super("Delete profile");
			setFont(new Font("TimesRoman",0,14));
			setLayout(new FlowLayout());
			File dd = new File(inform.GetPath+"user");
			String nn[] = dd.list();
			tmp = new String[50];
			int tmp_int = 0;
			for (int ha=0;ha<nn.length ;ha++ )
				{	
					if (nn[ha].endsWith(".pro")) 
					{
						tmp[tmp_int] = nn[ha].substring(0,nn[ha].length()-4);
						tmp_int++;
					}
				}	
			add(new Label("   Choose profile to delete with the password of that profile   "));
			usn = new Choice();
			for (int hb=0;hb<tmp_int ;hb++ ) usn.addItem(tmp[hb]);
			add(usn);
			add(new Label(" Password "));
			TextField pw = new TextField(15);
			pw.setEchoCharacter('*');
			add(pw);
			add(new Label("             "));
			add(new Button("OK"));
			add(new Button("Cancel"));
		}

		public boolean action(Event evt, Object whatAction)
		{
			if (!(evt.target instanceof Button)) return false;
			String but = (String)whatAction;
			if (but.equals("OK")) 
			{	
				if (inform.Active_Usname.equals(usn.getSelectedItem()))
				{
					dialog.createDialog("You're using this profile. Unable to delete");
					return false;
				}
				File in = new File(inform.GetPath+"user/"+usn.getSelectedItem()+".int");
				File ad = new File(inform.GetPath+"user/"+usn.getSelectedItem()+".add");
				File pr = new File(inform.GetPath+"user/"+usn.getSelectedItem()+".pro");
				File tr = new File(inform.GetPath+"user/"+usn.getSelectedItem()+".tra");
				File us = new File(inform.GetPath+"user/"+usn.getSelectedItem()+".use");
				try
				{
					in.delete();
					ad.delete();
					pr.delete();
					tr.delete();
					us.delete();
				}
				catch (SecurityException ex){}
				dialog.createDialog("Profile Deleted");
			}
			hide();
			return true;
		}

		public boolean handleEvent(Event e)
		{
			if (e.id == Event.WINDOW_DESTROY) hide();
			return super.handleEvent(e);
		}
	}