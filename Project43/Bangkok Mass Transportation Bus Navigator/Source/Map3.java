import java.util.*;
import java.lang.*;
import java.awt.*;
import java.awt.event.*;
import java.applet.*;

public class Map3 extends Applet
{
	Image Bangkok,D41,D51,D61,E41,E51,E61,F41,F51,F61,Point1,PointB1,Point2,Point3,Point4,Point5,PointS,PointS1,PointG,Start,Goal;
	int Small=0;
	String Printer,PrintR;
	String Cpre,Cnext = "C" ;
	boolean PrinterR,Show=false;
	boolean  Yak,Tong,Go,Four,Five = false;
	int[] input = new int[3];
	int StartorGoal = 0;
	int Downone= -1,Downtwo = -1;
	Button b1,b2,b3,b4;
	Label l5;
	int NodeG [ ] = { 1,2,3,23,37,41,42,45,48,51,53,54,56,61,62,63};
	int NodeY [ ] = {8,13,16,25,26,27,28,29,30,32,35,43,46,49,55,58,60 };
	int NodeN [ ] = {5,11,10,6,19,18,17,14,0,36,33,41,44,47,24,20,57};
	int NodeW [ ] ={7,12,15,9,0,21,22,31,38,39,40,42,45,48,0,0,59 };
	int NodeE [ ] = {9,15,17,0,21,22,23,19,12,31,34,7,38,39,56,59,61 };
	int NodeS [ ] = {11,14,18,10,20,24,0,34,36,33,37,44,47,50,57,62,63};
	int NodeT [ ] = {5,6,7,9,10,11,12,14,15,17,18,19,20,21,22,24,31,33,34,36,38,39,40,44,47,50,57,59};
	String PointY4 [ ] [ ] = { { "X","sign/Right.gif","sign/DownRight.gif","X","sign/DownLeft.gif","sign/RightDown.gif"},
										{ "sign/Left.gif","X","sign/DownRight.gif","X","sign/DownLeft.gif","sign/LeftDown.gif"},
										{ "sign/UpLeft.gif","sign/UpRight.gif","X","X","sign/Left.gif","sign/LeftDown.gif"},
										{ "X","X","X","X","X","X" },
										{ "sign/UpLeft.gif","sign/UpRight.gif","sign/Right.gif","X","X","sign/RightDown.gif"},
										{ "sign/UpLeft.gif","sign/UpRight.gif","sign/UpRight.gif","X","sign/UpLeft.gif","X"} };
	String PointY52 [ ] [ ] = { { "X","sign/DownLeft.gif","X","sign/Down.gif","sign/DownRight.gif","sign/DownRight.gif"},
										{ "sign/RightUp.gif","X","X","sign/RightDown.gif","sign/DownRight.gif","sign/Right.gif"},
										{ "X","X","X","X","X","X" },
										{ "sign/Up.gif","sign/UpLeft.gif","X","X","sign/UpRight.gif","sign/UpRight.gif"},
										{ "sign/LeftUp.gif","sign/UpLeft.gif","X","sign/LeftDown.gif","X","sign/UpRight.gif"},
										{ "sign/LeftUp.gif","sign/Left.gif","X","sign/LeftDown.gif","sign/DownRight.gif","X"} };
	String PointD [ ] [ ] = { { "sign/Right.gif","sign/Down.gif","sign/Right.gif","sign/Right.gif","sign/Down.gif","sign/NEtoSW.gif","sign/Right.gif","sign/Down.gif",//14
										"sign/Right.gif","sign/NWtoSE.gif","sign/Down.gif","sign/NWtoSE.gif","sign/NWtoSE.gif","sign/Right.gif","sign/Right.gif", //22
										"sign/Down.gif","sign/NWtoSE.gif","sign/Down.gif","sign/Right.gif","sign/Down.gif","sign/Right.gif","sign/NWtoSE.gif",//39
										"sign/NWtoSE.gif","sign/Down.gif","sign/Down.gif","sign/Down.gif","sign/Down.gif","sign/Right.gif" }, //59
								  { "sign/Left.gif","sign/Up.gif","sign/Left.gif","sign/Left.gif","sign/Up.gif","sign/SWtoNE.gif", "sign/Left.gif","sign/Up.gif",//14
										"sign/Left.gif","sign/SEtoNW.gif","sign/Up.gif","sign/SEtoNW.gif","sign/SEtoNW.gif","sign/Left.gif","sign/Left.gif", //22
										"sign/Up.gif","sign/SEtoNW.gif","sign/Up.gif","sign/Left.gif","sign/Up.gif","sign/Left.gif","sign/SEtoNW.gif", //39
										"sign/SEtoNW.gif","sign/Up.gif","sign/Up.gif","sign/Up.gif","sign/Up.gif","sign/Left.gif" } }; //59
	String NodeName [ ] = { "1.ลาดพร้าว","2.สุขาภิบาล 2","3.สุขาภิบาล 3","4.สี่แยกลำสาลี","5.รามคำแหง (ม.ราม)","6.ศรีนครินทร์(ม.นักกีฬา)",
												"7.พระราม 9","8.สี่แยกพระราม9-รามคำแหง","9.พระราม 9 ตัดใหม่","10.ศรีนครินทร์(สถานีรถไฟหัวหมาก)","11.รามคำแหง(รพ.แพทย์ปัญญา)",
												"12.เพชรบุรีตัดใหม่(คลองตัน)","13.สี่แยกคลองตัน","14.สุขุมวิท 71","15.พัฒนาการ(ม.เกษมบัณฑิต)","16.สี่แยกพัฒนาการ",
												"17.พัฒนาการ(ม.ผาสุก)","18.ศรีนครินทร์(ตลาดเอี่ยมสมบัติ)","19.สุขุมวิท (พระโขนง)","20.สุขุมวิท (บางจาก)","21.สุขุมวิท 77 (อ่อนนุช)",
												"22.อ่อนนุช (ม.เสรี)","23.อ่อนนุช(ประเวศ)","24.ศรีนครินทร์ (ซีคอน)","25.แยกพระราม9-ศรีนครินทร์","26.สามแยกอ่อนนุช",
												"27.สี่แยกอ่อนนุช","28.สามแยกผาสุก","29.แยกพระโขนง-พระราม 4","30.แยกเอกมัย-เพชรบุรี","31.สุขุมวิท(วัดธาตุทอง)",
												"32.แยกเอกมัย-สุขุมวิท","33.สุขุมวิท 42 (กล้วยน้ำไท)","34.พระราม 4 (พระโขนง)","35.แยกกล้วยน้ำไท","36.สุขุมวิท 63 (เอกมัย)",
												"37.อาจณรงค์","38.เพชรบุรี(RCA)","39.สุขุมวิท (สวนเบญจศิริ)","40.พระราม 4 (คลองเตย)","41.รัชดา (ฟอร์จูน)","42.ดินแดง",
												"43.สี่แยก อ.ส.ม.ท.","44.อโศก-ดินแดง","45.เพชรบุรี (มักกะสัน)","46.สี่แยกอโศกเพชรบุรี","47.สุขุมวิท 21 (อโศก)","48.สุขุมวิท (นานา)",
												"49.สี่แยกอโศกสุขุมวิท","50.รัชดา (ศูนย์ประชุม)","51.พระราม 4 (สวนลุม)","52.แยกคลองเตย","53.พระราม 3","54.สุนทรโกษา",
												"55.แยกอุดมสุข","56.สุขุมวิท 103 (สวนหลวงร.9)","57.ศรีนครินทร์ (วัดศรีเอี่ยม)","58.แยกบางนาสุขุมวิท","59.บางนา (กม.1 - 4)",
												"60.แยกบางนา กม.4","61.บางนา (ราม 2)","62.สุขุมวิท (สำโรง)","63.ศรีนครินทร์(เทพารักษ์)"};
	String linename [ ] [ ] = { { "ac 1 " ,"ปอ.1"},{ "2 " ,"สาย 2"},{ "4 " ,"สาย 4"},{ "ac 6 " ,"ปอ.พ.6"},{ "11 " ,"สาย 11"},{ "ac 12 " ,"ปอ.12"},{ "ac 14 " ,"ปอ.14"},
										   { "ac 15 " ,"ปอ.15"},{ "ac 18 " ,"ปอ.18"},{ "ac 19 " ,"ปอ.19"},{ "ac 20 " ,"ปอ.20"},{ "22 " ,"สาย 22"},{ "23 " ,"สาย 23"},
											{ "38 " ,"สาย 38"},{ "40 " ,"สาย 40"},{ "45 " ,"สาย 45"},{ "46 " ,"สาย 46"},{ "48 " ,"สาย 48"},{ "71 " ,"สาย 71"},
											{ "72 " ,"สาย 72"},{ "ac 92 " ,"ปอ.92"},{ "93 " ,"สาย 93"},{ "98 " ,"สาย 98"},{ "109 " ,"สาย 109"},{ "113 " ,"สาย 113"},
											{ "ac 126 " ,"ปอ.126"},{ "133 " ,"สาย 133"},{ "136 " ,"สาย 136"},{ "137 " ,"สาย 137"},{ "143 " ,"สาย 143"},{ "145 " ,"สาย 145"},
											{ "149 " ,"สาย 149"},{ "205 " ,"สาย 205"},{ "206 " ,"สาย 206"},{ "207 " ,"สาย 207"},{"จุดเดียวกัน","จุดเดียวกัน"}};

	//int Result [ ] = {2,4,6,25,10,16,18,27,24,55,57,60,59,58,20,26,19,29,34,35,40,52,54 };
	//int Result [ ] [ ] = {
	//							{2,4,6,25,10,16,18,27,21,26,19,29,34,35,40,52,54},
   //								{ 2,4,5,8,7,43,44,46,47,49,50,52,54 },
	//							{  2,4 ,5 ,8,11,13,12,30,36,32,39,49,50,52,54 } };
	int way = -1;
	Router router = new Router();
	Result[] showing;

	String Result2 [ ] = new String [5] ;
	//Vector Result3 = new Vector ( );
	 Image Direct [ ] ;
	 Image PointRe [ ];
	 Image PointReB [ ];
	  Image Direct2 [ ] ;
	 Image PointRe2 [ ];
	 Image PointReB2 [ ];
	 // Image [ ]  Direct = new Image [Result[way].length]; 
	 //Image [ ]  PointRe = new Image [Result[way].length];
	// Image [ ]  PointReB = new Image [Result[way].length];
	 Image [ ] PointTrue = new Image [7];
	int  Disp [ ] [ ] =      {{ 639 , 159 , 232 , 101 , 641 },
								    { 676 , 154 , 320 , 98 , 641 },
								    { 686 , 168 , 380 , 105 , 641 },
								    { 655 , 170 , 276 , 122 , 641 },
								    { 550 , 195 , 497 , 142 , 541 }, //5
							        { 648 , 228 , 248 , 243 , 641 },
								    { 481 , 235 , 233 , 264 , 541 },
								    { 505 , 242 , 285 , 281 , 541 },
								    { 566 , 266 , 444 , 344 , 541 },
								    { 637 , 275 , 239 , 375 , 641},//10
									{ 492 , 255 , 244 , 314 , 541 },
									{ 465 , 262 , 215 , 337 , 541 },
									{ 487,  267 , 237 , 345 , 541 },
									{ 468,  322 , 201 , 409 , 541 },
									{ 532 , 283 ,394 , 400 ,541 },//15
									{ 636 , 288 , 220 ,405 , 641 },
								    { 691 , 309 , 323 ,436 ,641 },
									{ 639 , 345 ,242 , 135 , 651 },
									{ 475 , 387 ,204 ,245 ,551 },
									{ 505 , 440 ,276 ,372 ,551 },//20
									{ 566 , 391 ,426 ,269 ,551 },
								    { 675 , 366 ,318 ,200 ,651 },
									{ 736 , 355, 474 ,195, 651 },
									{ 663 , 438 ,278 ,335 ,651 },
									{ 641 , 262 ,232 ,335 ,641 },//25
									{ 482 , 394,218 ,267 ,551 },
									{ 648 , 377 ,250 ,234 ,651 },
									{ 710 , 357 ,416 ,186 ,651 },
									{462 ,376 , 556 , 222 , 451},
									{450 ,257 , 535 , 313 , 441}, //30
									{449 ,367 , 525 , 186 , 451},
									{428 ,352 , 475 , 164 , 451},
									{427 ,366 , 460 , 204 , 451},
									{440 ,379 , 500 , 234 , 451},
									{426 ,379 , 466 , 234 , 451}, //35
									{436 ,297 , 492 , 437 , 441},
									{421 ,387 , 445 , 263 , 451},
									{405 ,249 , 380 , 280 , 441},
									{392 ,322 , 404 , 107 , 451},
									{374 ,357 , 343 , 183 , 451}, //40
									{369 ,182 , 312 , 130 , 441},
									{331 ,208 , 244 , 189 , 441},
									{353 ,209 , 284, 205 , 441},
									{348 ,225 , 274 , 249 , 441},
									{323 ,239 , 220 , 264 , 441}, //45
									{345 ,239 , 268 , 275 , 441},
									{340 ,263 , 252 , 338 , 441},
									{324 ,275 , 215 , 368 , 441},
									{339 ,285 , 250 , 397 , 441},
									{335 ,320 , 249 , 114 , 451}, //50
									{301 ,336 , 205 , 143 , 451},
									{330 ,352 , 225 , 169 , 451},
									{311 ,381 , 200, 204 , 451},
									{348 ,368 , 252 , 200 , 451},
									{660 ,511 , 276 , 172 , 661}, //55
									{698 ,514 , 334 , 166 , 661},
									{660 ,538 , 271 , 246 , 661},
									{514 ,530 , 291 , 215 , 561},
									{576 ,542 , 436 , 245 , 561},
									{657 ,558 , 264 , 287 , 661}, //60
									{726 ,577 , 360 , 303 , 661},
									{501 ,561 , 253 , 316 , 561},
									{650 ,588 , 232, 402 , 661}};//63

	int XBig,YBig =800,XSma,YSma ,Page;
	int XGBig,YGBig = 800,XGSma,YGSma,GPage;
    Choice c=new Choice(); 
	Choice c2=new Choice();
	//Choice c3=new Choice();
	Choice c4=new Choice();
	
	
	public void init() 
	{ 
	     // setFont (new Font ("MS Sans Serif",Font.PLAIN,12));
		 //
		  //
		 Printer = getParameter ("print");
	     PrintR="false";
		 PrinterR = (PrintR.length()==Printer.length());
		// if (PrinterR)
		 {
		c.addItem ("เริ่มที่ 1. ลาดพร้าว");
		for (int i=1; i < NodeName.length; i++ )
		{	c.addItem (NodeName[i]);
		}
		add (c);
		b1 =(Button) add (new Button("ตกลงจุดเริ่ม"));
		add (b1);
		b1.setEnabled(true);
		c2.addItem ("สิ้นสุดที่ 1. ลาดพร้าว");
		for (int i=1; i < NodeName.length; i++ )
		{	c2.addItem (NodeName[i]);
		}
		add (c2);
		c2.setEnabled(false);
		b2 =(Button) add (new Button("ตกลงจุดหมาย"));
		add (b2);
		b2.setEnabled(false);
		//c3.addItem("หาเส้นทางที่สั้นที่สุด ");
       // c3.addItem("หาการต่อสายรถเมล์น้อยสุด");
	//	add(c3);
//		c3.setEnabled(false);
		c4.addItem("Breadth-First-Search");
		c4.addItem("Iterative-Deepening-Search");
		add(c4);
		c4.setEnabled(false);
		b3 =(Button) add (new Button("ตกลงวิธีการหา"));
		add (b3);
		b3.setEnabled(false);
		b4 =(Button) add (new Button("เส้นทางต่อไป"));
		add (b4);
		b4.setEnabled(false);
		l5 =(Label) add   (new Label ("โหนดเดียวกัน"));
		add (l5);
		l5.setVisible(false);
		}
		Bangkok=getImage(getCodeBase(),"BBangkok3.gif");
		E41=getImage(getCodeBase(),"E4.gif");
		E51=getImage(getCodeBase(),"E5.gif");
		F41=getImage(getCodeBase(),"F4.gif");
		F51=getImage(getCodeBase(),"F5.gif");
		D41=getImage(getCodeBase(),"D4.gif");
		D51=getImage(getCodeBase(),"D5.gif");
		D61=getImage(getCodeBase(),"D6.gif");
		E61=getImage(getCodeBase(),"E6.gif");
		F61=getImage(getCodeBase(),"F6.gif");
		Start=getImage(getCodeBase(),"sign/Start.gif");
		Goal=getImage(getCodeBase(),"sign/Goal.gif");
		Point1=getImage(getCodeBase(),"sign/point11.gif");
        PointS1=getImage(getCodeBase(),"sign/point1.gif");
		Point2=getImage(getCodeBase(),"sign/point21.gif");
		PointS=getImage(getCodeBase(),"sign/pointS.gif");
		PointG=getImage(getCodeBase(),"sign/pointG.gif");
			for (int c=1; c<8; c++ )
		{
		  PointTrue[c-1]=getImage(getCodeBase(),"sign/point"+c+".gif");
		}
	}

	public boolean action(Event e,Object a)  {
	      if(e.target instanceof Choice) {
		  Choice x= (Choice)e.target;
		  System.out.println (x.getSelectedItem() + "," +x.getSelectedIndex() );
		 if (StartorGoal ==0 )
		 { XBig = Disp[x.getSelectedIndex()][0];
		  YBig = Disp[x.getSelectedIndex()][1];
		  XSma = Disp[x.getSelectedIndex()][2];
		  YSma = Disp[x.getSelectedIndex()][3];
          Page = Disp[x.getSelectedIndex()][4];
		  System.out.println(XBig+" "+YBig);
		  input[0] = x.getSelectedIndex()+1;
		 }
		 else if (StartorGoal == 1)
	  {
		  XGBig = Disp[x.getSelectedIndex()][0];
		  YGBig = Disp[x.getSelectedIndex()][1];
		  XGSma = Disp[x.getSelectedIndex()][2];
		  YGSma = Disp[x.getSelectedIndex()][3];
          GPage = Disp[x.getSelectedIndex()][4];
		   input[1] = x.getSelectedIndex()+1;
		  }
		  else if (StartorGoal == 2)
		  {  input[2] = x.getSelectedIndex();
		  }
		  repaint();
		  return true;
		  }
		   if (e.target == b1)
		  { c.setEnabled(false);
		    b1.setEnabled(false);
		   c2.setEnabled(true);
		   b2.setEnabled(true);
		   StartorGoal = 1 ;
		   if (input[0] == 0)
		   { XBig = Disp[0][0];   YBig = Disp[0][1];
		     XSma = Disp[0][2];   YSma = Disp[0][3];
          Page = Disp[0][4];    input[0]++;}
		  }
		   if (e.target == b2)
		  {c2.setEnabled(false);
		    b2.setEnabled(false);
		   //c3.setEnabled(true);
		   c4.setEnabled(true);
		   b3.setEnabled(true);
		   //b4.setEnabled(true);
		     if (input[1] == 0)
		   { XGBig = Disp[0][0];  YGBig = Disp[0][1];
	    	  XGSma = Disp[0][2];  YGSma = Disp[0][3];
               GPage = Disp[0][4];       input[1]++; }
		   StartorGoal = 2 ;
		  }
		  if (e.target == b4)
		  { e.target = b3;
		     if (way == showing.length-1)
		     {way = -1;
			    b4.setEnabled(false); } 
			 way =way +1;
		  }
		  if (e.target == b3)
		  { //c4.setEnabled(false);
		   //b3.setEnabled(false);
		   System.out.println("Input:"+input[0]+","+input[1]+","+input[2]);
		   b3.setVisible(false);
		   b2.setVisible(false);
		   b1.setVisible(false);
		   c4.setVisible(false);
		    b4.setEnabled(true);
		   Show = true;
	{
	//
	if (input[0] ==input[1])
	{    // b4.setVisible(false);
	      // l5.setVisible(true);
         b4.setLabel("โหนดเดียวกัน");
		}
		else  if (way == -1)
		{
		showing = new Result[router.goalnum];
		showing = router.route(input);
		way=0;
		}
	{
	   Direct = new Image [40];
	   PointRe = new Image [40];
	   PointReB = new Image [40];
	   String Result21 [ ] = new String [5] ;
	   Result2 = Result21;

			int ind = 0;
			PointRe[ind]=	getImage(getCodeBase(),"sign/point11.gif");
		    PointReB[ind]=	getImage(getCodeBase(),"sign/point1.gif");
            String Changestr ;
			Changestr = showing[way].lud.elementAt(0).toString( );
			Result2[0] = new String (Changestr);
		    Changestr = showing[way].lud.elementAt(2).toString( );
			int Changeint  = Integer.parseInt (Changestr);
			System.out.println (ind);
	   while (showing[way].backtk[ind] != Changeint )
		   {  ind++;
		      PointRe[ind]=	getImage(getCodeBase(),"sign/point11.gif");
		      PointReB[ind]=	getImage(getCodeBase(),"sign/point1.gif");
            }
       if (showing[way].lud.size( ) > 3)
       {
			  PointRe[ind] =	getImage(getCodeBase(),"sign/point51.gif");
		      PointReB[ind] =	getImage(getCodeBase(),"sign/point5.gif");
			  //ind--;
			  Changestr = showing[way].lud.elementAt(3).toString( );
			   Result2[1] = new String (Changestr);
			   Changestr = showing[way].lud.elementAt(5).toString( );
			   Changeint  = Integer.parseInt (Changestr);
			   while (showing[way].backtk[ind] != Changeint )
		       {  ind++;
			      PointRe[ind] =	getImage(getCodeBase(),"sign/point21.gif");
		          PointReB[ind] =	getImage(getCodeBase(),"sign/point2.gif");
               }				
		}
	   if (showing[way].lud.size( ) > 6)
       {
			  PointRe[ind] =	getImage(getCodeBase(),"sign/point61.gif");
		      PointReB[ind] =	getImage(getCodeBase(),"sign/point6.gif");
			  //ind --;
			  Changestr = showing[way].lud.elementAt(6).toString( );
			  Result2[2] = new String (Changestr);
			  Changestr = showing[way].lud.elementAt(8).toString( );
              Changeint  = Integer.parseInt (Changestr);
			   while (showing[way].backtk[ind] != Changeint )
		       {  ind++;
			      PointRe[ind] =	getImage(getCodeBase(),"sign/point31.gif");
		          PointReB[ind] =	getImage(getCodeBase(),"sign/point3.gif");
               }				
		}
      if (showing[way].lud.size( ) > 9)
       {
			  PointRe[ind] =	getImage(getCodeBase(),"sign/point71.gif");
		      PointReB[ind] =	getImage(getCodeBase(),"sign/point7.gif");
			  //ind--;
			  Changestr = showing[way].lud.elementAt(9).toString( );
			  Result2[3] = new String (Changestr);
			  Changestr = showing[way].lud.elementAt(11).toString( );
              Changeint  = Integer.parseInt (Changestr);
			   while (showing[way].backtk[ind] != Changeint )
		       {  ind++; 
			      PointRe[ind] =	getImage(getCodeBase(),"sign/point41.gif");
		          PointReB[ind] =	getImage(getCodeBase(),"sign/point4.gif");
               }				
		}	
	}
	//
	   int pre,now,next=0; 
		 Direct[0]=getImage(getCodeBase(),"sign/Start.gif"); 
		for (int i=1; i<(showing[way].backtk.length-1); i++)
		{
		 int Tong2=0;
		 int TongDirect=0;
		 int Yak2=0;
		 pre=showing[way].backtk[i-1];
		 now=showing[way].backtk[i];
		 next=showing[way].backtk[i+1];
		  Yak= false;Tong= false; Go= false; Four =false; Five = false;
		 //
		  for (int j=0; j < NodeY.length; j++ )
		      if (now==NodeY[j])
			  {
		       Yak =true; Yak2= j ;
			   }
		   for (int k=0; k < NodeT.length; k++ )
		      if (now==NodeT[k])
			    {
		       Tong =true; Tong2= k;
			    }
		   for (int l=0; l < NodeG.length; l++ )
		      if (now==NodeG[l])
		       Go =true;
		   if (now == 4 )
		      Four = true;
		  if (now == 52 )
		      Five = true; 
		 //
		   System.out.println (pre+","+now+","+next+","+Yak+","+Tong+","+Go+","+Five+",");
		        if (Go)
		        {    Direct[i]=getImage(getCodeBase(),"sign/Up.gif"); 
				   System.out.println("Go");
		        }
				else if (Tong)
				{
				   if ((Cnext == "S") || (Cnext == "E"))
				   {TongDirect= 0;}
				   else TongDirect = 1;
				   Direct[i]=getImage(getCodeBase(),PointD[TongDirect][Tong2]); 
				   System.out.println("Tong");
				}
				else if (Yak)
				{
				Cpre = "C" ;
				Cnext = "C" ;
					    if (pre==NodeN[Yak2])
							 Cpre = "N"; 
						else if (pre==NodeS[Yak2])
							 Cpre = "S"; 
						else if (pre==NodeE[Yak2])
							 Cpre = "E"; 
						else if (pre==NodeW[Yak2])
							 Cpre = "W"; 

					 if (next==NodeN[Yak2])
							  Cnext = "N";    
					 else  if (next==NodeS[Yak2])
							 Cnext = "S"; 	    
					 else if (next==NodeE[Yak2])
							 Cnext = "E";
					    else if (next==NodeW[Yak2])
							 Cnext = "W"; 
						System.out.println("Yak,"+Cpre+","+Cnext);
					if (Cpre=="N") 
					{ if (Cnext == "S") Direct[i]=getImage(getCodeBase(),"sign/Down.gif"); 
					  else if (Cnext == "W")   Direct[i]=getImage(getCodeBase(),"sign/DownLeft.gif"); 
					  else if (Cnext == "E")   Direct[i]=getImage(getCodeBase(),"sign/DownRight.gif"); 
					}
					else if (Cpre == "S")
					{ if (Cnext == "N") Direct[i]=getImage(getCodeBase(),"sign/Up.gif");
					  else if (Cnext == "W") Direct[i]=getImage(getCodeBase(),"sign/UpLeft.gif");
					  else if (Cnext == "E") Direct[i]=getImage(getCodeBase(),"sign/UpRight.gif");
					}
					else if (Cpre == "W")
					{ if (Cnext == "S") Direct[i]=getImage(getCodeBase(),"sign/RightDown.gif");  
					  else if (Cnext == "N") Direct[i]=getImage(getCodeBase(),"sign/RightUp.gif");
					  else if (Cnext == "E") Direct[i]=getImage(getCodeBase(),"sign/Right.gif");
					}
					else if (Cpre == "E")
					{ if (Cnext == "N") Direct[i]=getImage(getCodeBase(),"sign/LeftUp.gif");
					  else if (Cnext == "W") Direct[i]=getImage(getCodeBase(),"sign/Left.gif");
					  else if (Cnext == "S") Direct[i]=getImage(getCodeBase(),"sign/LeftDown.gif");
					}
					if ( ( now == 29) && (Cnext == "S"))
					{  Cnext ="W";}
				}
				else if (Four)
				{
				 Direct[i]=getImage(getCodeBase(), PointY4[pre -1][next-1]);
				  if ( next == 5)
				 { Cnext = "W";
				 }
				 else Cnext = "S";
				 System.out.println("Four");
				}
			else
				{
				 if (pre ==40) pre = 55;
				 if (next == 40) next = 55;
				 Direct[i]=getImage(getCodeBase(), PointY52[pre -50][next-50]);
				  if ( next == 40)
				 { Cnext = "E";
				 }
				 else Cnext = "N";
				 System.out.println("Five");
				}
		} 
		Direct[showing[way].backtk.length-1]=getImage(getCodeBase(),"sign/Goal.gif");
	 }
			}
		   repaint();
		   return true;
		}
	
	public boolean mouseDown(Event evt,int x,int y)
	{
	System.out.println (x+","+y+","+Printer);
	if (Small!=0)
	{ 
	      for (int k=0; k < Disp.length; k++)
	      {
	      if ( (Small==Disp[k][4]) && (x<=Disp[k][2]+15) &&  (x > Disp[k][2]) &&  (y<=Disp[k][3]+30) &&  (y > Disp[k][3]) )
				 { 
				      Downone=Downtwo;
					  Downtwo=k;
				    if (Downone==Downtwo)
			        {
				     input[StartorGoal] = k+1 ;
				    StartorGoal ++;
					System.out.println ("That's right"+(k+1));
					if (StartorGoal ==1)
					{ XBig = Disp[k][0];   YBig = Disp[k][1];
		               XSma = Disp[k][2];   YSma = Disp[k][3];
                     Page = Disp[k][4];  
					 c.select(k);
					 c.setEnabled(false);
				     b1.setEnabled(false);
					c2.setEnabled(true);
					b2.setEnabled(true);
					}
					else if (StartorGoal == 2)
					{ XGBig = Disp[k][0];  YGBig = Disp[k][1];
	    			  XGSma = Disp[k][2];  YGSma = Disp[k][3];
					 GPage = Disp[k][4];  
					 c2.select(k);
					 c2.setEnabled(false);
					 b2.setEnabled(false);
					 c4.setEnabled(true);
					b3.setEnabled(true);
					Small = 0;  
					}
				 } 
				}
		   }
	  if ( (x >550) && (x <= 600) && (y<= 500) && (y > 480))
	{ Small=0;
	   Downtwo = -1;}
	 }
	    else if(PrinterR == false)
		{x=751;}
		else if ((x<=630)&&(x>474)&&(y<=320)&&(y>162))
		{ Small=541;}
		else if ((x<=630)&&(x>474)&&(y<=478)&&(y>320))
		{ Small=551;}
		else if ((x<=630)&&(x>474)&&(y<=600)&&(y>478))
		{ Small=561;}
		else if ((x<=750)&&(x>630)&&(y<=320)&&(y>162))
		{ Small=641;}
		else if ((x<=750)&&(x>630)&&(y<=478)&&(y>320))
		{ Small=651;}
		else if ((x<=750)&&(x>630)&&(y<=600)&&(y>478))
		{ Small=661;}
		else if ((x<=474)&&(x>318)&&(y<=320)&&(y>162))
		{ Small=441;}
		else if ((x<=474)&&(x>318)&&(y<=478)&&(y>320))
		{ Small=451;}
		else if ((x<=474)&&(x>318)&&(y<=600)&&(y>478))
		{ Small=461;}
		repaint();
		return true;
    }
	public void update(Graphics g)
	{
		//if (Small!=0)
		//{g.clipRect(100,100,500,500);}
		paint(g);
	}
	public void paint(Graphics g)
	 {	
	 System.out.println(Small);
	 if (Small != 0)
	 {  g.drawImage(Bangkok,0,0,this); }
		 if (Small == 541)
		 { g.drawImage(E41,200,100,this); 
		     if (Show)
		     for (int i=0; i< showing[way].backtk.length; i++)
		    {
			 int j=showing[way].backtk[i] -1;
			 if (Disp[j][4] == 541)
			  {
		       g.drawImage(Direct[i],Disp[j][2],Disp[j][3],this);
			   g.drawImage(PointReB[i],Disp[j][2]+3,Disp[j][3]-2,this); 
			    g.setColor (Color.yellow);
			     g.fillRect(Disp[j][2]+17,Disp[j][3]+26,120,10);
				 g.setColor (Color.red);
				 g.drawString(NodeName[j],Disp[j][2]+18,Disp[j][3]+35);
		       } 
			}
			else 
			{   for (int j=0 ; j < Disp.length ;  j++)
			        {
			    if ( (StartorGoal == 0) && (Disp[j][4] == 541) )
			        {    g.drawImage(Start,Disp[j][2],Disp[j][3],this);  }
				 else if ( (StartorGoal == 1) && (Disp[j][4] == 541) )
				 {
				 g.drawImage(Goal,Disp[j][2],Disp[j][3],this); 
				  if (j == input[0]-1)
				         {   g.drawImage(PointS1,Disp[j][2]+3,Disp[j][3]-2,this); }
				 }
		            }
			 g.setColor (Color.yellow);
			 g.fillRect(Disp[Downtwo][2]+17,Disp[Downtwo][3]+26,120,10);
		     g.setColor (Color.red);
		     g.drawString(NodeName[Downtwo],Disp[Downtwo][2]+18,Disp[Downtwo][3]+35); 
			}
	   } 
		  else if (Small == 441)
		  { g.drawImage(D41,200,100,this); 
		     if (Show)
		     for (int i=0; i< showing[way].backtk.length; i++)
		    {
			 int j=showing[way].backtk[i] -1;
			 if (Disp[j][4] == 441)
			  {
		       g.drawImage(Direct[i],Disp[j][2],Disp[j][3],this);
			  g.drawImage(PointReB[i],Disp[j][2]+3,Disp[j][3]-2,this);
			  g.setColor (Color.yellow);
			     g.fillRect(Disp[j][2]+17,Disp[j][3]+26,120,10);
				 g.setColor (Color.red);
				 g.drawString(NodeName[j],Disp[j][2]+18,Disp[j][3]+35);
		       } 
			}
			else 
			{   for (int j=0 ; j < Disp.length ;  j++)
			        {
			     if ( (StartorGoal == 0) && (Disp[j][4] == 441) )
			     {  g.drawImage(Start,Disp[j][2],Disp[j][3],this);
				  }
				 else if ( (StartorGoal == 1) && (Disp[j][4] == 441) )
				 {
				 g.drawImage(Goal,Disp[j][2],Disp[j][3],this); 
					   if (j == input[0]-1)
				            g.drawImage(PointS1,Disp[j][2]+3,Disp[j][3]-2,this); 
				 }
		            }
			 g.setColor (Color.yellow);
			 g.fillRect(Disp[Downtwo][2]+17,Disp[Downtwo][3]+26,120,10);
		     g.setColor (Color.red);
		     g.drawString(NodeName[Downtwo],Disp[Downtwo][2]+18,Disp[Downtwo][3]+35);
			 }
		 } 
		 else if (Small == 461)
		 { g.drawImage(D61,200,100,this);
		  if (Show)
		     for (int i=0; i< showing[way].backtk.length; i++)
		    {
			 int j=showing[way].backtk[i] -1;
			 if (Disp[j][4] == 461)
			  {
		       g.drawImage(Direct[i],Disp[j][2],Disp[j][3],this);
		  	 g.drawImage(PointReB[i],Disp[j][2]+3,Disp[j][3]-2,this);
			          g.setColor (Color.yellow);
					  g.fillRect(Disp[j][2]+17,Disp[j][3]+6,120,10);
					  g.setColor (Color.red);
				     g.drawString(NodeName[j],Disp[j][2]+18,Disp[j][3]+15);
		       } 
			}
				else 
			{   for (int j=0 ; j < Disp.length ;  j++)
			        {
			      if ( (StartorGoal == 0) && (Disp[j][4] == 461) )
			     {  g.drawImage(Start,Disp[j][2],Disp[j][3],this);
				  }
				 else if ( (StartorGoal == 1) && (Disp[j][4] == 461) )
				 {
				 g.drawImage(Goal,Disp[j][2],Disp[j][3],this); 
					  if (j == input[0]-1)
				            g.drawImage(PointS1,Disp[j][2]+3,Disp[j][3]-2,this); 
				 }
		            }
						 g.setColor (Color.yellow);
						 g.fillRect(Disp[Downtwo][2]+17,Disp[Downtwo][3]+26,120,10);
						 g.setColor (Color.red);
					     g.drawString(NodeName[Downtwo],Disp[Downtwo][2]+18,Disp[Downtwo][3]+35);
			} 
		 } 
		 else if (Small == 561)
		 { g.drawImage(E61,200,100,this);
		  if (Show)
		     for (int i=0; i< showing[way].backtk.length; i++)
		    {
			 int j=showing[way].backtk[i] -1;
			 if (Disp[j][4] == 561)
			  {
		       g.drawImage(Direct[i],Disp[j][2],Disp[j][3],this);
			  g.drawImage(PointReB[i],Disp[j][2]+3,Disp[j][3]-2,this);
			   g.setColor (Color.yellow);
				g.fillRect(Disp[j][2]+17,Disp[j][3]+6,120,10);
				g.setColor (Color.red);
				g.drawString(NodeName[j],Disp[j][2]+18,Disp[j][3]+15);
		       } 
			}
				else 
			{   for (int j=0 ; j < Disp.length ;  j++)
			        {
			     if ( (StartorGoal == 0) && (Disp[j][4] == 561) )
			     {  g.drawImage(Start,Disp[j][2],Disp[j][3],this);
				  }
				 else if ( (StartorGoal == 1) && (Disp[j][4] == 561) )
				 {
				 g.drawImage(Goal,Disp[j][2],Disp[j][3],this); 
					  if (j == input[0]-1)
				            g.drawImage(PointS1,Disp[j][2]+3,Disp[j][3]-2,this); 
				 }
		            }
						 g.setColor (Color.yellow);
						g.fillRect(Disp[Downtwo][2]+17,Disp[Downtwo][3]+26,120,10);
						g.setColor (Color.red);
						g.drawString(NodeName[Downtwo],Disp[Downtwo][2]+18,Disp[Downtwo][3]+35);
			} 
		 } 
		 else if (Small == 661)
		 { g.drawImage(F61,200,100,this);
		   if (Show)
		     for (int i=0; i< showing[way].backtk.length; i++)
		    {
			 int j= showing[way].backtk[i] -1;
			 if (Disp[j][4] == 661)
			  {
		       g.drawImage(Direct[i],Disp[j][2],Disp[j][3],this);
			 g.drawImage(PointReB[i],Disp[j][2]+3,Disp[j][3]-2,this);
			          g.setColor (Color.yellow);
					  g.fillRect(Disp[j][2]+17,Disp[j][3]+6,120,10);
					  g.setColor (Color.red);
				     g.drawString(NodeName[j],Disp[j][2]+18,Disp[j][3]+15);
		       } 
			}
				else 
			{   for (int j=0 ; j < Disp.length ;  j++)
			        {
			    if ( (StartorGoal == 0) && (Disp[j][4] == 661) )
			     {  g.drawImage(Start,Disp[j][2],Disp[j][3],this);
				  }
				 else if ( (StartorGoal == 1) && (Disp[j][4] == 661) )
				 {
				 g.drawImage(Goal,Disp[j][2],Disp[j][3],this); 
					  if (j == input[0]-1)
				            g.drawImage(PointS1,Disp[j][2]+3,Disp[j][3]-2,this); 
				 }
		            }
						 g.setColor (Color.yellow);
						 g.fillRect(Disp[Downtwo][2]+17,Disp[Downtwo][3]+26,120,10);
						 g.setColor (Color.red);
						 g.drawString(NodeName[Downtwo],Disp[Downtwo][2]+18,Disp[Downtwo][3]+35);
			} 
		 } 
		  else if (Small == 451)
		 { g.drawImage(D51,200,100,this);
		  if (Show)
		     for (int i=0; i< showing[way].backtk.length; i++)
		    {
			 int j=showing[way].backtk[i] -1;
			 if (Disp[j][4] == 451)
			  {
		       g.drawImage(Direct[i],Disp[j][2],Disp[j][3],this);
			 g.drawImage(PointReB[i],Disp[j][2]+3,Disp[j][3]-2,this);
					  g.setColor (Color.yellow);
					  g.fillRect(Disp[j][2]+17,Disp[j][3]+6,120,10);
					  g.setColor (Color.red);
				      g.drawString(NodeName[j],Disp[j][2]+18,Disp[j][3]+15);
		       } 
			}
			else 
			{   for (int j=0 ; j < Disp.length ;  j++)
			        {
			    if ( (StartorGoal == 0) && (Disp[j][4] == 451) )
			     {  g.drawImage(Start,Disp[j][2],Disp[j][3],this);
				  }
				 else if ( (StartorGoal == 1) && (Disp[j][4] == 451) )
				 {
				 g.drawImage(Goal,Disp[j][2],Disp[j][3],this); 
					  if (j == input[0]-1)
				            g.drawImage(PointS1,Disp[j][2]+3,Disp[j][3]-2,this); 
				 }
		            }
						 g.setColor (Color.yellow);
						 g.fillRect(Disp[Downtwo][2]+17,Disp[Downtwo][3]+26,120,10);
						 g.setColor (Color.red);
						 g.drawString(NodeName[Downtwo],Disp[Downtwo][2]+18,Disp[Downtwo][3]+35);
			} 
		 } 
		  else if (Small == 551)
		 { g.drawImage(E51,200,100,this);
		    if (Show)
		     for (int i=0; i< showing[way].backtk.length; i++)
		     {
			 int j=showing[way].backtk[i] -1;
			 if (Disp[j][4] == 551)
			   {
		       g.drawImage(Direct[i],Disp[j][2],Disp[j][3],this);
			   g.drawImage(PointReB[i],Disp[j][2]+3,Disp[j][3]-2,this);
			    g.setColor (Color.yellow);
					  g.fillRect(Disp[j][2]+17,Disp[j][3]+6,120,10);
					  g.setColor (Color.red);
				     g.drawString(NodeName[j],Disp[j][2]+18,Disp[j][3]+15);
		       }
			 }
			else 
			{   for (int j=0 ; j < Disp.length ;  j++)
			        {
			     if ( (StartorGoal == 0) && (Disp[j][4] == 551) )
			     {  g.drawImage(Start,Disp[j][2],Disp[j][3],this);
				  }
				 else if ( (StartorGoal == 1) && (Disp[j][4] == 551) )
				 {
				 g.drawImage(Goal,Disp[j][2],Disp[j][3],this); 
					  if (j == input[0]-1)
				            g.drawImage(PointS1,Disp[j][2]+3,Disp[j][3]-2,this); 
				 }
		            }
						 g.setColor (Color.yellow);
						 g.fillRect(Disp[Downtwo][2]+17,Disp[Downtwo][3]+26,120,10);
						 g.setColor (Color.red);
						 g.drawString(NodeName[Downtwo],Disp[Downtwo][2]+18,Disp[Downtwo][3]+35);
			} 
		 }
		  else if (Small == 641)
		 { g.drawImage(F41,200,100,this); 
		      if (Show)
			   for (int i=0; i<showing[way].backtk.length; i++)
		            {
			 int j=showing[way].backtk[i] -1;
			// Image Test=Right;
			 if (Disp[j][4] == 641)
		        {
		       g.drawImage(Direct[i],Disp[j][2],Disp[j][3],this);
			  g.drawImage(PointReB[i],Disp[j][2]+3,Disp[j][3]-2,this);
			   g.setColor (Color.yellow);
					  g.fillRect(Disp[j][2]+17,Disp[j][3]+6,120,10);
					  g.setColor (Color.red);
				     g.drawString(NodeName[j],Disp[j][2]+18,Disp[j][3]+15);
		         }
		      }
			else 
			{   for (int j=0 ; j < Disp.length ;  j++)
			        {
			   if ( (StartorGoal == 0) && (Disp[j][4] == 641) )
			     {  g.drawImage(Start,Disp[j][2],Disp[j][3],this);
				  }
				 else if ( (StartorGoal == 1) && (Disp[j][4] == 641) )
				 {
				 g.drawImage(Goal,Disp[j][2],Disp[j][3],this); 
					  if (j == input[0]-1)
				            g.drawImage(PointS1,Disp[j][2]+3,Disp[j][3]-2,this); 
				 }
		            }
						 g.setColor (Color.yellow);
						 g.fillRect(Disp[Downtwo][2]+17,Disp[Downtwo][3]+26,120,10);
						 g.setColor (Color.red);
						 g.drawString(NodeName[Downtwo],Disp[Downtwo][2]+18,Disp[Downtwo][3]+35);
			} 
		 } 
		  else if (Small == 651)
		 { g.drawImage(F51,200,100,this);
		       if (Show)
		          for (int i=0; i< showing[way].backtk.length; i++)
		     {
			 int j=showing[way].backtk[i] -1;
			 if (Disp[j][4] == 651)
		       {
		       g.drawImage(Direct [i],Disp[j][2],Disp[j][3],this);
			   g.drawImage(PointReB[i],Disp[j][2]+3,Disp[j][3]-2,this);
			    g.setColor (Color.yellow);
					  g.fillRect(Disp[j][2]+17,Disp[j][3]+6,120,10);
					g.setColor (Color.red);
				     g.drawString(NodeName[j],Disp[j][2]+18,Disp[j][3]+15);
		       }
		     }
			 else 
			{   for (int j=0 ; j < Disp.length ;  j++)
			        {
			     if ( (StartorGoal == 0) && (Disp[j][4] == 651) )
			     {  g.drawImage(Start,Disp[j][2],Disp[j][3],this);
				  }
				 else if ( (StartorGoal == 1) && (Disp[j][4] == 651) )
				 {
				 g.drawImage(Goal,Disp[j][2],Disp[j][3],this); 
					  if (j == input[0]-1)
				            g.drawImage(PointS1,Disp[j][2]+3,Disp[j][3]-2,this); 
				 }
		            }
						 g.setColor (Color.yellow);
						 g.fillRect(Disp[Downtwo][2]+17,Disp[Downtwo][3]+26,120,10);
						 g.setColor (Color.red);
						 g.drawString(NodeName[Downtwo],Disp[Downtwo][2]+18,Disp[Downtwo][3]+35);
			} 
			} 
		 else if (Small != 0)
		 { //
		 }
		 else
		 {   
			  PrintR="false";
			  PrinterR = (PrintR.length()==Printer.length());
			//  System.out.println (PrinterR);
			//Big Map
			if ( PrinterR)
		     {   g.drawImage(Bangkok,0,0,this);
			 if(Show)
			   {
			    int preX= 0;
				int preY =0;
			    g.drawImage(PointS,XBig,YBig,this);
				preX =XBig;
				preY =YBig;
		for (int i=1 ; i< showing[way].backtk.length-1 ;  i++)
				   {
				  int j=showing[way].backtk[i] -1;
				  g.setColor(Color.blue);
			  g.drawLine(preX+6,preY+6,Disp[j][0]+6,Disp[j][1]+6);
				  g.drawLine(preX+7,preY+7,Disp[j][0]+7,Disp[j][1]+7);
				  g.drawLine(preX+8,preY+8,Disp[j][0]+8,Disp[j][1]+8);
				  g.drawImage(PointRe[i],Disp[j][0],Disp[j][1],this);
				  preX = Disp[j][0];
				  preY =Disp[j][1];
				    }
				g.setColor(Color.blue);
				g.drawLine(preX+6,preY+6,XGBig+6,YGBig+6);
				g.drawLine(preX+7,preY+7,XGBig+7,YGBig+7);
				g.drawLine(preX+8,preY+8,XGBig+8,YGBig+8);
				g.drawImage(PointG,XGBig,YGBig,this);
               }
			 else{
	       		g.drawImage(PointS,XBig,YBig,this);
	      		if (StartorGoal != 0)
	       		g.drawImage(PointG,XGBig,YGBig,this);
	     	        }
			 }
		   else {
		    g.drawImage(Bangkok,0,0,600,550,150,100,750,650,this);
			 if(Show)
			   {
			    int preX=0,preY=0;
			    g.drawImage(PointS,XBig-150,YBig-100,this);
				preX =XBig;
				preY =YBig;
				g.setColor(Color.blue);
				for (int i=1 ; i< showing[way].backtk.length-1 ;  i++)
				   {
				  int j=showing[way].backtk[i] -1;
				  g.drawLine(preX-150+6,preY-100+6,Disp[j][0]-150+6,Disp[j][1]-100+6);
				  g.drawLine(preX-150+7,preY-100+7,Disp[j][0]-150+7,Disp[j][1]-100+7);
				  g.drawLine(preX-150+8,preY-100+8,Disp[j][0]-150+8,Disp[j][1]-100+8);
				  g.drawImage(PointRe[i],Disp[j][0]-150 ,Disp[j][1]-100,this);
				  preX = Disp[j][0];
				  preY =Disp[j][1];
				    }
				    g.drawLine(preX-150+6,preY-100+6,XGBig-150+6,YGBig-100+6);
				    g.drawLine(preX-150+7,preY-100+7,XGBig-150+7,YGBig-100+7);
		    		g.drawLine(preX-150+8,preY-100+8,XGBig-150+8,YGBig-100+8);
					g.drawImage(PointG,XGBig-150,YGBig-100,this);
                }
			 else{
			g.drawImage(PointS,XBig-150,YBig-100,this);
			if (StartorGoal != 0)
			g.drawImage(PointG,XGBig-150,YGBig-100,this);
			        }
			}
		}
	// Set name of line bus
	if (Show)
	{  
	    int lineX = 100;
		int lineY = 120; 
	    if ( ! PrinterR)
	    {  
		lineX =50;
		lineY =70;
		g.setColor (Color.black);
	    g.fillRoundRect (50,50,100,400,0,0);
		g.setColor (Color.white);
	    }
		else if (Small == 0)
		{ 
		g.setColor (Color.yellow);
	    g.fillRoundRect (100,100,100,400,0,0);
		g.setColor (Color.black);
		}
		else{
	    g.setColor (Color.black);
	    g.fillRoundRect (100,100,100,400,0,0);
		g.setColor (Color.white);
		}
		int cnt=0,cnt2=0,cnt3=0;
		int lineno=0, linenonext=0;
		while ( Result2[cnt+1] != null )
		{
		System.out.println(Result2[0]+","+Result2[1]+","+Result2[2]+","+Result2[3]+","+lineno+","+cnt3+","+cnt);
		    for (cnt2=0; cnt2 < linename.length; cnt2++)
		           {
			       if (  Result2[cnt].startsWith( linename[cnt2][0] ) )
			            {   lineno = cnt2; }
                    else if (  Result2[cnt+1].startsWith( linename[cnt2][0]) )
			            {   linenonext = cnt2; }
		            }
					    g.drawImage(PointTrue[cnt3],lineX,lineY,this);
				    	g.drawString(linename[lineno][1],lineX+19,lineY+10);
						g.drawImage(PointTrue[cnt3+4],lineX,lineY+50,this);
					    g.drawString(" ลง "+linename[lineno][1],lineX+19,lineY+62);
			            g.drawString(" ต่อ "+linename[linenonext][1],lineX+19,lineY+82);
						lineY=lineY+100 ;
						cnt = cnt+1;
						cnt3= cnt3+1;
		}
     System.out.println(cnt+","+cnt3);
		    for (cnt2=0; cnt2 < linename.length; cnt2++)
		           {
			       if (  Result2[cnt].startsWith( linename[cnt2][0] ))
			            {   lineno = cnt2; }
					}
			g.drawImage(PointTrue[cnt3],lineX,lineY,this);
		    g.drawString(linename[lineno][1],lineX+19,lineY+12);
			g.drawString ("วิธีที่ "+(way+1),lineX+10,lineY+40);
			g.drawString ("จากทั้งหมด "+showing.length+" วิธี",lineX+10,lineY+52);
    	}
	 } //print
}
//
//
//<applet code="Map3" width=600 height=500>
//	<param name=print value=true> </applet>