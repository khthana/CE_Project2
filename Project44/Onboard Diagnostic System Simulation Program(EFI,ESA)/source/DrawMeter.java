
import java.awt.*;
import javax.swing.*;
import java.text.*;
import java.lang.*;

public class DrawMeter extends JPanel {

	private static int r = 145;
	private static int h = 335;
	private static int k = 155;
	private int x = 335;
	private int y = 155;
	private int i,j;
	private double ze = 240.0;
	private int xco[] = {h,h,h,h};//{335,335,335,335};
	private int yco[] = {k,k,k,k};//{155,155,155,155};
	private int px1[] = new int[101];
	private int py1[] = new int[101];
	private int px2[] = new int[101];
	private int py2[] = new int[101];
	private int px3[] = new int[101];
	private int py3[] = new int[101];

	private String s_px1,s_px2,s_py1,s_py2;

	private int tho_per, air_thermo, water_thermo, rpm;

	private String s_vm = "";
	private String s_vt = "";
	private String s_va = "";
	private String s_vw = "";
	private String s_vo2 = "";
	private String s_vsp = "";
	private String s_vba = "";
	private String s_vtt = "";
	private String s_vadb = "";
	private String s_vdub = "";
	private String s_vad = "";
	private String s_vdu = "";
	private String s_vrpm = "";

	private String s_i = "";

	private boolean idl,knk,sta,nsw,ac,igf,bk,mil;

   public void paintComponent( Graphics g )
   { 
      super.paintComponent( g );
		
	//	setBackground(new Color(192,192,192));
	
  	/*************************Path Thottle meter*********************/
		
//		g.setColor(Color.green);
		g.setColor(new Color(0,192,0));
		g.fillRect(20,210-(2*tho_per),10,2*tho_per);

		g.setColor(Color.blue);
		g.drawRect(20,10,10,200);
		
		g.setColor(Color.black);
		String s_t = "";
		DecimalFormat df_t = new DecimalFormat("#,##0");
		 for (i=1;i<=11 ;i++ ){
			g.drawLine(20,10+(i*20)-5,30,10+(i*20)-5);
			g.drawLine(20,10+(i*20)-10,30,10+(i*20)-10);
			g.drawLine(20,10+(i*20)-15,30,10+(i*20)-15);
			g.drawLine(20,10+(i*20)-20,30,10+(i*20)-20);
			g.drawLine(20+15,(i*20)-10,30+10,(i*20)-10);
			s_t = " "+df_t.format(110-i*10)+'%';
			g.drawString(s_t,42,(i*20)-5);

		 }
		 
		 //g.setColor(Color.green);
		 g.setColor(new Color(0,192,0));
         g.fillRect( 10, 210, 30, 30 );
		
		 g.setColor(Color.blue);
		 g.drawRect(10,210,30,30);

		 g.setColor(Color.blue);
		 g.drawString("Throttle",5,257);
		 
		 g.setColor(Color.black);
		 g.fillRect(5,266,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vt,10,278);
		 
		 g.setColor(Color.blue);
		 g.drawString("%",20,295);

	/*************************Path air meter ***********************/
		 
		 //g.setColor(Color.red);
		 g.setColor(new Color(192,0,0));
         g.fillRect( 20+60, 210-(2*air_thermo), 10, 2*air_thermo );
		 
		 g.setColor(Color.blue);
		 g.drawRect(20+60,10,10,200);
		 
		 g.setColor(Color.black);
		 String s_a = "";
		 DecimalFormat df_a = new DecimalFormat("#,##0");
		 for (i=1;i<=11 ;i++ ){
			 g.drawLine(20+60,10+(i*20)-5,30+60,10+(i*20)-5);
			 g.drawLine(20+60,10+(i*20)-10,30+60,10+(i*20)-10);
			 g.drawLine(20+60,10+(i*20)-15,30+60,10+(i*20)-15);
			 g.drawLine(20+60,10+(i*20)-20,30+60,10+(i*20)-20);
			 g.drawLine(20+60+15,(i*20)-10,20+60+20,(i*20)-10);
			 s_a = " "+df_a.format(110-i*10);
			 g.drawString(s_a,42+60,(i*20)-5);
		 }

		 //g.setColor(Color.red);
		 g.setColor(new Color(192,0,0));
         g.fillOval( 70, 210, 30, 30 );
		 
		 g.setColor(Color.blue);
         g.drawOval( 70, 210, 30, 30 );

		 g.setColor(Color.blue);
		 g.drawString("Air",78,257);
		 
		 g.setColor(Color.black);
		 g.fillRect(65,266,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_va,70,278);
		 
		 g.setColor(Color.blue);
		 g.drawString("C",80,295);
		
   /***********************Path water meter ***************************/
		
		 g.setColor(new Color(192,0,0));
		 //g.setColor(Color.red);
         g.fillRect( 20+60+60, 210-(2*water_thermo), 10, 2*water_thermo );
		 
		 g.setColor(Color.blue);
		 g.drawRect(20+60+60,10,10,200);
		   
		 g.setColor(Color.black);
		 String s_w = "";
		 DecimalFormat df_w = new DecimalFormat("#,##0");
		  for (i=1;i<=11 ;i++ ){
			 g.drawLine(20+60+60,10+(i*20)-5,30+60+60,10+(i*20)-5);
			 g.drawLine(20+60+60,10+(i*20)-10,30+60+60,10+(i*20)-10);
			 g.drawLine(20+60+60,10+(i*20)-15,30+60+60,10+(i*20)-15);
			 g.drawLine(20+60+60,10+(i*20)-20,30+60+60,10+(i*20)-20);
			 g.drawLine(20+60+60+15,(i*20)-10,20+60+60+20,(i*20)-10);
			 s_w = " "+df_w.format(110-i*10);
			 g.drawString(s_w,42+60+60,(i*20)-5);
		   }

		 //g.setColor(Color.red);
		 g.setColor(new Color(192,0,0));
         g.fillOval( 130, 210, 30, 30 );
		 
		 g.setColor(Color.blue);
         g.drawOval( 130, 210, 30, 30 );

		 g.setColor(Color.blue);
		 g.drawString("Water",130,257);

		 g.setColor(Color.black);
		 g.fillRect(125,266,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vw,130,278);

		 g.setColor(Color.blue);
		 g.drawString("C",140,295);

		/**********************************************************/	
		//g.setColor(new Color(170,170,170));
		//g.fillRect(0,305,505,60);

		/***********************Path Map meter*********************/
		g.setColor(new Color(168,220,168));		
		g.fillRect(3,305,54,56);

		g.setColor(new Color(180,100,180));
		g.drawRect(3,305,54,56);

		 g.setColor(Color.blue);
		 g.drawString("Map",21,317);

		 g.setColor(Color.black);
		 g.fillRect(5,326,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vm,15,340);

		 g.setColor(Color.blue);
		 g.drawString("MBar",15,355);

		/***********************Path O2 meter*********************/
		 
		g.setColor(new Color(168,220,168));	
		 g.fillRect(63,305,54,56);

		g.setColor(new Color(180,100,180));
		g.drawRect(63,305,54,56);

		 g.setColor(Color.blue);
		 g.drawString("O2",83,317);

		 g.setColor(Color.black);
		 g.fillRect(65,326,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vo2,75,340);

		 g.setColor(Color.blue);
		 g.drawString("Volt",77,355);

		/***********************Path Speed meter*********************/
		 
		g.setColor(new Color(168,220,168));	
		g.fillRect(123,305,54,56);

		g.setColor(new Color(180,100,180));
		g.drawRect(123,305,54,56);

		 g.setColor(Color.blue);
		 g.drawString("Speed",133,317);

		 g.setColor(Color.black);
		 g.fillRect(125,326,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vsp,135,340);

		 g.setColor(Color.blue);
		 g.drawString("Kph",140,355);

		/***********************Path Batt ecu meter*********************/
		 
		g.setColor(new Color(168,220,168));		
		g.fillRect(181,305,60,56);

		g.setColor(new Color(180,100,180));
		g.drawRect(181,305,60,56);

		 g.setColor(Color.blue);
		 g.drawString("BATT",198,317);

		 g.setColor(Color.black);
		 g.fillRect(185,326,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vba,195,340);

		 g.setColor(Color.blue);
		 g.drawString("Volt",197,355);

		/***********************Path TT ecu meter*********************/
		 
		g.setColor(new Color(168,220,168));		
		g.fillRect(243,305,54,56);

		g.setColor(new Color(180,100,180));
		g.drawRect(243,305,54,56);

		 g.setColor(Color.blue);
		 g.drawString("TT",261,317);

		 g.setColor(Color.black);
		 g.fillRect(245,326,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vtt,255,340);

		 g.setColor(Color.blue);
		 g.drawString("Volt",257,355);

		/***********************Path Advance basic meter*********************/

		g.setColor(new Color(248,248,180)); 
		g.fillRect(311,305,90,56);

		g.setColor(new Color(180,180,100));		
		g.drawRect(311,305,90,56);

		 g.setColor(Color.blue);
		 g.drawString("Advance Basic",318,317);

		 g.setColor(Color.black);
		 g.fillRect(330,326,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vadb,345,340);

		 g.setColor(Color.blue);
		 g.drawString("Degree",332,355);

		/***********************Path Duration basic meter*********************/
		g.setColor(new Color(248,248,180)); 
		g.fillRect(403,305,90,56);
		g.setColor(new Color(180,180,100));		
		g.drawRect(403,305,90,56);

		 g.setColor(Color.blue);
		 g.drawString("Duration Basic",408,317);

		 g.setColor(Color.black);
		 g.fillRect(425,326,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vdub,435,340);

		 g.setColor(Color.blue);
		 g.drawString("ms",440,355);

		 /*************************************************************/
		// 		g.setColor(new Color(210,210,210));
		//		g.fillRect(505,300,155,70);
		/***********************Path Advance meter*********************/
		 
		g.setColor(new Color(200,248,248));
		g.fillRect(508,305,54,56);

		g.setColor(new Color(160,220,220));
		g.drawRect(508,305,54,56);

		 g.setColor(Color.blue);
		 g.drawString("Advance",515,317);

		 g.setColor(Color.black);
		 g.fillRect(510,326,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vad,520,340);

		 g.setColor(Color.blue);
		 g.drawString("Degree",512,355);

		/***********************Path Duration meter*********************/
		 
		g.setColor(new Color(200,248,248));
		g.fillRect(576,305,60,56);

		g.setColor(new Color(160,220,220));
		g.drawRect(576,305,60,56);
		 g.setColor(Color.blue);
		 g.drawString("Duration",580,317);

		 g.setColor(Color.black);
		 g.fillRect(581,326,50,16);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vdu,590,340);

		 g.setColor(Color.blue);
		 g.drawString("ms",600,355);

	
		/**********************Path RPM Meter**************************/

		g.setColor(new Color(138,138,138));
		g.fillArc(190,10,290,290,315,360);
		
		g.setColor(new Color(168,0,0));
		g.fillArc(190,10,290,290,315,81);

		g.setColor(new Color(100,100,100));//335 155
		g.fillArc(205,25,260,260,315,360);

		g.setColor(new Color(80,80,80));//335 155
		g.fillArc(190,10,290,290,225,90);

		g.setColor(new Color(100,100,100));//335 155
		g.fillArc(205,25,260,260,225,90);

		/**************************ARROW*************************/


		g.setColor(new Color(240,240,240));
		g.fillPolygon(xco,yco,4);
		g.setColor(new Color(26,162,81));
		g.fillPolygon(xco,yco,3);

		g.setColor(new Color(0,16,0));
		g.drawPolygon(xco,yco,4);

		g.setColor(new Color(125,125,125));
		g.fillArc(325,145,20,20,315,360);

		g.setColor(new Color(0,16,0));
		g.drawOval(325,145,20,20);//,315,360);

		g.setColor(new Color(0,16,0));
		g.drawOval(190,10,290,290);//,315,81);

		g.setColor(new Color(0,16,0));//335 155
		g.drawOval(205,25,260,260);//,315,360);

		g.setFont(new Font("TimesRoman",Font.BOLD,15));

		for (int i=0;i<=10 ;i++ )
		{
				DecimalFormat df_i = new DecimalFormat("#,##0");
				s_i = ""+df_i.format(i);
				g.setColor(new Color(238,238,168));

				g.drawString(s_i,px3[i*10],py3[i*10]);
				g.setColor(Color.black);

				g.drawLine(px1[i*10],py1[i*10],px2[i*10],py2[i*10]);
		
		}
		/*******************Path rpm meter value**************************/
		 g.setColor(new Color(238,238,168));
		 g.drawString(" X1000 ",308,200);

		 g.setColor(Color.black);
		 g.drawString("RPM",315,225);

		 g.setColor(Color.black);
		 g.fillRect(275,235,120,25);
		 
		 g.setColor(Color.green);
		 g.drawString(s_vrpm,320,254);

		 g.setColor(Color.black);
		 g.drawString("rpm",315,275);



/*************************STATUS*****************************/
g.setFont(new Font("TimesRoman",Font.PLAIN,12));
		g.setColor(new Color(240,218,218));
		g.fillRect(520,10,100,265);

		g.setColor(new Color(200,150,150));
		g.drawRect(520,10,100,265);

		g.setColor(new Color(55,25,25));
		g.drawString("STATUS",550,25);

		/**************IDLE SPPED**************/

		if(! idl)		
	    {
		g.setColor(new Color(255,255,255));
		g.fillRect(525,35,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("IDEL SPEED",535,53);
	    }
		else
	    {
		g.setColor(new Color(0,255,0));
		g.fillRect(525,35,90,25);

		g.setColor(new Color(0,0,0));
		
		g.drawString("IDEL SPEED",535,53);
		}
		/**************BRACK**************/
		if( ! bk)
	    {
		g.setColor(new Color(255,255,255));
		g.fillRect(525,65,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("BRAKE",550,83);
		}
		else
	    {
		g.setColor(new Color(0,255,0));
		g.fillRect(525,65,90,25);

		g.setColor(new Color(0,0,0));
		
		g.drawString("BRAKE",550,83);
		}
		/**************START**************/
		if( ! sta)
	    {
		g.setColor(new Color(255,255,255));
		g.fillRect(525,95,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("START",550,113);
		}
		else
	    {
		g.setColor(new Color(0,255,0));
		g.fillRect(525,95,90,25);

		g.setColor(new Color(0,0,0));

		g.drawString("START",550,113);
		}
		/**************NEUTRAL**************/
		if( ! nsw)
	    {
		g.setColor(new Color(255,255,255));
		g.fillRect(525,125,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("NEUTRAL",545,143);
		}
		else
	    {
		g.setColor(new Color(0,255,0));
		g.fillRect(525,125,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("NEUTRAL",545,143);
		}
		/**************A/C**************/
		if( ! ac)
	    {
		g.setColor(new Color(255,255,255));
		g.fillRect(525,155,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("A/C",565,173);
		}
		else
	    {
		g.setColor(new Color(0,255,0));
		g.fillRect(525,155,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("A/C",565,173);
		}
		/**************IGF**************/
		if( ! igf)
	    {
		g.setColor(new Color(255,255,255));
		g.fillRect(525,185,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("IGF",565,203);
		}
		else
	    {
		g.setColor(new Color(0,255,0));
		g.fillRect(525,185,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("IGF",565,203);
		}
		/**************BRAKE**************/
		if( ! knk)
	    {
		g.setColor(new Color(255,255,255));
		g.fillRect(525,215,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("KNOCK",550,233);
		}
		else
	    {
		g.setColor(new Color(255,0,0));
		g.fillRect(525,215,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("KNOCK",550,233);
		}
		/**************MIL**************/
		if( ! mil)
	    {
		g.setColor(new Color(255,255,255));
		g.fillRect(525,245,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("MIL",565,263);
		}
		else
	    {
		g.setColor(new Color(255,0,0));
		g.fillRect(525,245,90,25);

		g.setColor(new Color(0,0,0));
		g.drawString("MIL",565,263);
		}
}


   public void draw(double map, double tho, double air, double  water, 
					double  o2, double  sp, double  ba, double  tt, 
					double  adb, double  dub, double  ad, double  du,
					boolean b1, boolean b2, boolean b3, boolean b4, 
					boolean b5, boolean b6, boolean b7, boolean b8 ,double RPM)
   {
	  tho_per = (int) tho;
      air_thermo = (int) air;
	  water_thermo = (int) water;
		rpm = (int) RPM;

   double ze;//,zey;
   ze = 225-(rpm*0.027);
   double zr = Math.toRadians(ze);
	
   x = (int) ((r*Math.cos(zr))+h);
   y = (int) ((k -  r*Math.sin(zr)));

   	xco[0] = (int) (((r-40)*Math.cos(zr))+h);
	xco[1] = (int) (h-(10*Math.sin(zr)));
	xco[2] = (int) (h+(10*Math.sin(zr)));
	xco[3] = (int) (((r-40)*Math.cos(zr))+h);
	yco[0] = (int) ((k-(r-40)*Math.sin(zr)));
	yco[1] = (int) (k-(10*Math.cos(zr)));
	yco[2] = (int) (k+(10*Math.cos(zr)));
	yco[3] = (int) ((k-(r-40)*Math.sin(zr)));

	for (int i=0; i<=100; i++ )
	{
			px1[i] = (int) ((r*Math.cos(Math.toRadians(225-(i*2.7))))+h);
			py1[i] = (int) ((k -  (r)*Math.sin(Math.toRadians(225-(i*2.7)))));
		    px2[i] = (int) (((r-20)*Math.cos(Math.toRadians(225-(i*2.7))))+h);
		    py2[i] = (int) ((k -  (r-20)*Math.sin(Math.toRadians(225-(i*2.7)))));
			px3[i] = (int) (((r-35)*Math.cos(Math.toRadians(225-(i*2.7))))+h);
		    py3[i] = (int) ((k -  (r-35)*Math.sin(Math.toRadians(225-(i*2.7)))));

	}


	  idl = b1;
	  knk = b2;
	  sta = b3;
	  nsw = b4;
	  ac = b5;
	  igf = b6;
	  bk = b7;
	  mil = b8;

	
		DecimalFormat df_vm = new DecimalFormat("#,##0.00");
		s_vm = ""+df_vm.format(map);

		DecimalFormat df_vt = new DecimalFormat("#,##0.00");
		s_vt = ""+df_vt.format(tho);

		DecimalFormat df_va = new DecimalFormat("#,##0.00");
		s_va = ""+df_va.format(air);
		
		DecimalFormat df_vw = new DecimalFormat("#,##0.00");
		s_vw = ""+df_vw.format(water);
		
		DecimalFormat df_vo2 = new DecimalFormat("#,##0.00");
		s_vo2 = ""+df_vo2.format(o2);

		DecimalFormat df_vsp = new DecimalFormat("#,##0.00");
		s_vsp = ""+df_vsp.format(sp);

		DecimalFormat df_vba = new DecimalFormat("#,##0.00");
		s_vba = ""+df_vba.format(ba);

		DecimalFormat df_vtt = new DecimalFormat("#,##0.00");
		s_vtt = ""+df_vtt.format(tt);

		DecimalFormat df_vadb = new DecimalFormat("#,##0.00");
		s_vadb = ""+df_vadb.format(adb);

		DecimalFormat df_vdub = new DecimalFormat("#,##0.00");
		s_vdub = ""+df_vdub.format(dub);

		DecimalFormat df_vad = new DecimalFormat("#,##0.00");
		s_vad = ""+df_vad.format(ad);

		DecimalFormat df_vdu = new DecimalFormat("#,##0.00");
		s_vdu = ""+df_vdu.format(du);

		DecimalFormat df_vrpm = new DecimalFormat("#,##0.00");
		s_vrpm = ""+df_vrpm.format(rpm);
		
		repaint();
   }
}


