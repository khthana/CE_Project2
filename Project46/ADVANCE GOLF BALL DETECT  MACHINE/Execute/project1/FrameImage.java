import java.awt.*;
import javax.swing.*;
import java.io.*;


public class FrameImage extends JFrame{
	Image f = null;
	Image p = null;
	Panel degree;
	int h,w;
	static double vix,viy;
	static	String q,b,c;
	static int time,x,y;
	static double x1,y1;
	static double x_x,cc;
	static double time_math;
	static float time_a;           
	static float degreeUp,degreeSide,distant,distant1;     //degree output
	
//	static int x_ball1,y_ball1,dec_ball1;
//	static int x_ball2,y_ball2,dec_ball2;
//	static int x_ball3,y_ball3,dec_ball3;
//	static int x_ball4,y_ball4,dec_ball4;
//	static int x_ball5,y_ball5,dec_ball5;
//	static int x_ball6,y_ball6,dec_ball6;
	
	
	FrameImage() {
		super("Golfball");
		setSize(1024,768);
		setVisible(true);
		Toolkit tk = getToolkit();
		f = tk.getImage("images/new_golf.gif");
		p = tk.getImage("images/golfball.gif");
//		Set default close operation
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);	
	}
	
	public void paint(Graphics g){
		w=p.getWidth(this);
		w=w-30;
		h=p.getHeight(this);
		h=h-30;
		double intitial=0;
		g.drawImage(f,0,0,1024,768,this);
		
		
		g.setFont(new Font("Dialog",Font.BOLD,25));
		g.setColor(Color.blue);
		g.drawString("องศาด้านบน="+degreeUp+" องศา",20,70);
		g.drawString("องศาด้านข้าง="+degreeSide+" องศา",630,70);
		g.drawString("ระยะทาง="+distant+" เมตร",20,130);
		g.drawString("ความเร็ว="+time_a+" เมตร/วินาที",630,130);
//		g.drawString("data="+cc,80,400);

		
		while(distant>intitial){
		
		      ball(distant-intitial,degreeSide,g,p);
		      intitial=intitial+8;
		      }
		
/*		g.drawLine(x_ball1+11-(dec_ball1/2),y_ball1+11-(dec_ball1/2),x_ball2+11-(dec_ball2/2),y_ball2+11-(dec_ball2/2));
		g.drawLine(x_ball2+11-(dec_ball2/2),y_ball2+11-(dec_ball2/2),x_ball3+11-(dec_ball3/2),y_ball3+11-(dec_ball3/2));
		g.drawLine(x_ball3+11-(dec_ball3/2),y_ball3+11-(dec_ball3/2),x_ball4+11-(dec_ball4/2),y_ball4+11-(dec_ball4/2));
		g.drawLine(x_ball4+11-(dec_ball4/2),y_ball4+11-(dec_ball4/2),x_ball5+11-(dec_ball5/2),y_ball5+11-(dec_ball5/2));
		g.drawLine(x_ball5+11-(dec_ball5/2),y_ball5+11-(dec_ball5/2),x_ball5+11-(dec_ball6/2),y_ball6+11-(dec_ball6/2));

//		g.drawImage(p,x_ball1,y_ball1,w-dec_ball1,h-dec_ball1,this);
		g.drawImage(p,x_ball2,y_ball2,w-dec_ball2,h-dec_ball2,this);
		g.drawImage(p,x_ball3,y_ball3,w-dec_ball3,h-dec_ball3,this);
		g.drawImage(p,x_ball4,y_ball4,w-dec_ball4,h-dec_ball4,this);
		g.drawImage(p,x_ball5,y_ball5,w-dec_ball5,h-dec_ball5,this);
		g.drawImage(p,x_ball6,y_ball6,w-dec_ball6,h-dec_ball6,this);  */
//		g.drawImage(p,550,280,w-17,h-17,this); 
//		g.drawImage(p,520,200,w-5,h-5,this);
//		g.drawImage(p,540,100,w-10,h-10,this);

		
//		g.drawLine(505,670,555,670);  //line at point 400
//		g.drawLine(1,730,1023,730);   //line at point 1
//		g.drawLine(505,288,1,765);    //เส้นทะแยงมุมไปหาตรงกลาง
//		g.drawLine(555,288,1023,765); //เส้นทะแยงมุมไปหาตรงกลาง 
//		g.drawLine(505,288,505,253); //เส้นขึ้นตรงกลางแกน y
//		g.drawLine(1,27,505,253); //เส้นจากด้านบนไปหาตรงกลาง
		
	//	g.clearRect(0,0,500,500);

	}
	public double convert(double time_v,double degreey){
		double dx_re;
		double dx;
		degreey=(degreey*3.14)/180;
		vix=time_v*Math.cos(degreey);
		viy=time_v*Math.sin(degreey);
		dx_re=vix*((2*viy)/9.81);
		distant=(float)dx_re;
		dx=dx_re;
		return dx;
		
	}
	public double convert1(double time_v,double degreey){
		double dx_re;
		double dx;
		degreey=(degreey*3.14)/180;
		vix=time_v*Math.cos(degreey);
		viy=time_v*Math.sin(degreey);
		dx_re=vix*((2*viy)/9.81);
		dx_re=dx_re*1.5;
		distant1=(float)dx_re;
		dx=dx_re;
		return dx;
		
	}
	public double convert_dx(double dx,double degreex) //เปลี่ยนค่าระยะให้เข้ากับ องศาด้านข้าง
	{   
		degreex=(degreex*3.14)/180;
		dx=Math.pow(dx,2)/(Math.pow(Math.sin(degreex),2)+1);
		dx=Math.sqrt(dx);
//		distant=(float)dx;

		return dx;
	}
	public void ball(double dx,double degreeside,Graphics g,Image p){
				double dx_r,dy_r,y_r,dec_r,buffer_r,t,dy,degree,dx_return;
				int x_ball=0;int y_ball,dec_ball;
//				dx=dx*1.5;
				dx_r=dx;
				degree=degreeside;
				buffer_r=dx;

				dx=2.4325*dx;
				dx=1022-dx;
				dx=dx/2;								//หาตำแหน่งว่างลูก
				dec_r=0.0425*buffer_r;
				dec_ball=(int)dec_r;
		if(degreeside==0){
					dx=530;
					dec_r=23-dec_r;
					dec_r=dec_r/2;
					dx=dx-dec_r;                           //หาจุดกลางลูก
					x_ball=(int)dx;
				}
				else {if(degreeside<0){
		
						degreeside=degreeside*-1;
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530-dx;
						dec_r=23-dec_r;
						dx=dx-dec_r;
						x_ball=(int)dx;
						}	
					else if(degreeside>0){
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530+dx;
						x_ball=(int)dx;
						}}
		
	
				
				t=buffer_r/vix;
				dy=(viy*t)-(4.905*Math.pow(t,2));
				cc=dy;
				dy=dy*100;

				dy=dy*0.03;
				dy=733-dy;
				dx_return=convert_dx(buffer_r,degree);
				dx_return=dx_return*0.2075;
				dy=dy-dx_return;
				y_ball=(int)dy;
				g.drawImage(p,x_ball,y_ball,w-dec_ball,h-dec_ball,this);
	
	}	
/*	public void ball1(double dx,double degreeside){
		double dx_r,dy_r,y_r,dec_r,buffer_r;
		dx_r=dx;
		buffer_r=dx;
		dx=2.4325*dx;
		dx=1022-dx;
		dx=dx/2;								//หาตำแหน่งว่างลูก
		dec_r=0.0425*buffer_r;
		dec_ball1=(int)dec_r;
		if(degreeside==0){
			dx=530;
			dec_r=23-dec_r;
			dec_r=dec_r/2;
			dx=dx-dec_r;                           //หาจุดกลางลูก
			x_ball1=(int)dx;
		}
		else {if(degreeside<0){
		
				degreeside=degreeside*-1;
				degreeside=(degreeside*3.14)/180;
				dy_r=dx_r*Math.sin(degreeside);
				dx=dy_r*1;
				dx=530-dx;
				dec_r=23-dec_r;
				dx=dx-dec_r;
				x_ball1=(int)dx;
				}	
			else if(degreeside>0){
				degreeside=(degreeside*3.14)/180;
				dy_r=dx_r*Math.sin(degreeside);
				dx=dy_r*1;
				dx=530+dx;
				x_ball1=(int)dx;
				}}
		
	

		y_r=0.1625*buffer_r;
		y_r=100-y_r;
		y_r=y_r/2;
		y_r=y_r+660;
		y_r=y_r-11;
		y_ball1=(int)y_r;


		
	}
	public void ball2(double dx,double degreeside){
			double dx_r,dy_r,y_r,dec_r,buffer_r,t,dy;
			dx_r=dx;
			buffer_r=dx;
			dx=2.4325*dx;
			dx=1022-dx;
			dx=dx/2;								//หาตำแหน่งว่างลูก
			dec_r=0.0425*buffer_r;
			dec_ball2=(int)dec_r;
		if(degreeside==0){
					dx=530;
					dec_r=23-dec_r;
					dec_r=dec_r/2;
					dx=dx-dec_r;                           //หาจุดกลางลูก
					x_ball2=(int)dx;
				}
				else {if(degreeside<0){
		
						degreeside=degreeside*-1;
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530-dx;
						dec_r=23-dec_r;
						dx=dx-dec_r;
						x_ball2=(int)dx;
						}	
					else if(degreeside>0){
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530+dx;
						x_ball2=(int)dx;
						}}
		
	
						t=buffer_r/vix;
						dy=(viy*t)-(4.905*Math.pow(t,2));
						cc=dy;
						dy=dy*100;
						dy=dy*0.03;
						dy=733-dy;
						y_ball2=(int)dy;

	}	
	public void ball3(double dx,double degreeside){
			double dx_r,dy_r,y_r,dec_r,buffer_r,t,dy;
			dx_r=dx;
			buffer_r=dx;
			dx=2.4325*dx;
			dx=1022-dx;
			dx=dx/2;								//หาตำแหน่งว่างลูก
			dec_r=0.0425*buffer_r;
			dec_ball3=(int)dec_r;
		if(degreeside==0){
					dx=530;
					dec_r=23-dec_r;
					dec_r=dec_r/2;
					dx=dx-dec_r;                           //หาจุดกลางลูก
					x_ball3=(int)dx;
				}
				else {if(degreeside<0){
		
						degreeside=degreeside*-1;
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530-dx;
						dec_r=23-dec_r;
						dx=dx-dec_r;
						x_ball3=(int)dx;
						}	
					else if(degreeside>0){
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530+dx;
						x_ball3=(int)dx;
						}}
		
	
						t=buffer_r/vix;
						dy=(viy*t)-(4.905*Math.pow(t,2));
						cc=dy;
						dy=dy*100;
						dy=dy*0.03;
						dy=733-dy;
						y_ball3=(int)dy;
	}
	public void ball4(double dx,double degreeside){
				double dx_r,dy_r,y_r,dec_r,buffer_r,t,dy;
				dx_r=dx;
				buffer_r=dx;
				dx=2.4325*dx;
				dx=1022-dx;
				dx=dx/2;								//หาตำแหน่งว่างลูก
				dec_r=0.0425*buffer_r;
				dec_ball4=(int)dec_r;
		if(degreeside==0){
					dx=530;
					dec_r=23-dec_r;
					dec_r=dec_r/2;
					dx=dx-dec_r;                           //หาจุดกลางลูก
					x_ball4=(int)dx;
				}
				else {if(degreeside<0){
		
						degreeside=degreeside*-1;
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530-dx;
						dec_r=23-dec_r;
						dx=dx-dec_r;
						x_ball4=(int)dx;
						}	
					else if(degreeside>0){
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530+dx;
						x_ball4=(int)dx;
						}}
		
	
			
				t=buffer_r/vix;
				dy=(viy*t)-(4.905*Math.pow(t,2));
				cc=dy;
				dy=dy*100;
				dy=dy*0.03;
				dy=733-dy;
				y_ball4=(int)dy;
	}
	public void ball5(double dx,double degreeside){
				double dx_r,dy_r,y_r,dec_r,buffer_r,t,dy;
				dx_r=dx;
				buffer_r=dx;
				dx=2.4325*dx;
				dx=1022-dx;
				dx=dx/2;								//หาตำแหน่งว่างลูก
				dec_r=0.0425*buffer_r;
				dec_ball5=(int)dec_r;
		if(degreeside==0){
					dx=530;
					dec_r=23-dec_r;
					dec_r=dec_r/2;
					dx=dx-dec_r;                           //หาจุดกลางลูก
					x_ball5=(int)dx;
				}
				else {if(degreeside<0){
		
						degreeside=degreeside*-1;
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530-dx;
						dec_r=23-dec_r;
						dx=dx-dec_r;
						x_ball5=(int)dx;
						}	
					else if(degreeside>0){
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530+dx;
						x_ball5=(int)dx;
						}}
		
	
				
				t=buffer_r/vix;
				dy=(viy*t)-(4.905*Math.pow(t,2));
				cc=dy;
				dy=dy*100;
				dy=dy*0.03;
				dy=733-dy;
				y_ball5=(int)dy;
	}				
	public void ball6(double dx,double degreeside){
				double dx_r,dy_r,y_r,dec_r,buffer_r,t,dy;
				dx_r=dx;
				buffer_r=dx;
				dx=2.4325*dx;
				dx=1022-dx;
				dx=dx/2;								//หาตำแหน่งว่างลูก
				dec_r=0.0425*buffer_r;
				dec_ball5=(int)dec_r;
		if(degreeside==0){
					dx=530;
					dec_r=23-dec_r;
					dec_r=dec_r/2;
					dx=dx-dec_r;                           //หาจุดกลางลูก
					x_ball6=(int)dx;
				}
				else {if(degreeside<0){
		
						degreeside=degreeside*-1;
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*1;
						dx=530-dx;
						dec_r=23-dec_r;
						dx=dx-dec_r;
						x_ball6=(int)dx;
						}	
					else if(degreeside>0){
						degreeside=(degreeside*3.14)/180;
						dy_r=dx_r*Math.sin(degreeside);
						dx=dy_r*2;
						dx=530+dx;
						x_ball6=(int)dx;
						}}
		
	
				
				t=buffer_r/vix;
				dy=(viy*t)-(4.905*Math.pow(t,2));
				cc=dy;
				dy=dy*100;
				dy=dy*0.03;
				dy=733-dy;
				y_ball6=(int)dy;
	}		*/		
	public static void main(String args[]) throws IOException, InterruptedException  {
	FrameImage a;
	a=new FrameImage();
	FileReader fin ;
	double dx,dd;
	
	boolean t=false;
			q="";
			b="";
			c="";
	

			
			int i=0;
			while(true){
			
			fin= new FileReader("images/out.txt");
			BufferedReader bin = new BufferedReader(fin);



			String s;
			for(i=0;i<3;i++)
				{
				if(i==0)
					{
					s = bin.readLine();
					if(s==null)
					  	t=true; 
					if(q!=s)
						{
						q=s;

						}
					}
				if(i==1)
					{
					s = bin.readLine() ;
					if(s==null)
						t=true; 
					if(b!=s)
						{
						b=s;

						}
					}
				if(i==2)
					{
					s = bin.readLine();
					if(s==null)
						t=true; 
					if(c!=s)
						{
						c=s;

						}
					}
				}

			if(t)
			{
				q="0";
				b="0";
				c="0";
				t=false;
			}
		

		    time=Integer.parseInt(q);          
			x=Integer.parseInt(b);
			y=Integer.parseInt(c);
			time=time*5;
			x1=(double)x;
			x1=98-x1;
			y1=(double)y;
			
			if(y1==49)                                     //คำนวณ องศา ด้านข้าง
			{ 
				y1=0.0;
				degreeSide=(float)y1; 
			} 
			else if(y1<49)
				{
					y1=49-y1;
					y1=y1*2;
					y1=Math.asin(y1/200);
					y1=(y1/3.14)*180;
					
					degreeSide=(float)y1;
				}
				else if(y1>49)
					{
						y1=y1-49;
						y1=y1*2;
						y1=Math.asin(y1/200);
						y1=(y1/3.14)*180;
						y1=y1*-1;
						degreeSide=(float)y1;
		    		}
				
		    x1=x1+49.7638;				// คำนวณองศาด้านบน
		    x_x=x1/100;								// x_x นำไปหาค่า กำลังสองของ x_x หน่วยเป็น เมตร
		    x1=Math.asin(x1/200);                   // คำนวณหาความสูงของแกน y
		    x1=(x1/3.14)*180;
		    degreeUp=(float)x1;
		    cc=Math.pow(x_x,2);					    // คำนวนหาระยะห่างของ เวลาที่จับได้เพื่อคำนวณความเร็ว
		    cc=Math.pow(2,2)+cc;
		    cc=Math.sqrt(cc);
//		    distant=(float)cc;
		    time_math=(cc/time)*1000;
		    time_a=(float)time_math;
		    
		    dx=a.convert(time_a,degreeUp);          //คำนวณหาระยะทาง และ return ระยะทาง หน้าจอ
//		    dx=a.convert(time_a,degreeUp);
//		    dd=dx;
		    dx=a.convert_dx(dx,degreeSide);
//		    a.ball1(dx,degreeSide);
//		    a.ball2(dx*3/4,degreeSide);
//		    a.ball3(dx/2,degreeSide);
//		    a.ball4(dx/4,degreeSide);
//		    a.ball5(dx/8,degreeSide);
//		    a.ball6(dx/64,degreeSide);
		 
				     	
			bin.close();
			i=0;
			Thread.sleep(1000);
		    a.repaint();
			}
		}    
}	