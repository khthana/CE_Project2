import java.awt.*;
import java.applet.*;

public class  ShowPic extends Applet implements Runnable
{
	private int size;
	private boolean draw = true;
	//private int 
	private int x;
	private int y;
	private Image pic;

	Thread t = new Thread(this);
	public void init()
	{
		getParam();
		pic = getImage( getCodeBase(),  "/images/map_2.jpg" );
		t.start();
		t.suspend();
	}
	public void start()	{ t.resume(); };
	public void stop()	{ t.suspend(); };
	public void run() 
	{
		while(true)
		{
			if (draw==true)
				repaint();
			try{
				Thread.sleep(200); 
				}
			catch( Exception e){};
		}
	}
	public void paint(Graphics g){
		g.drawImage(pic,0,0,this);
		int w = getSizeRect();
		int left = x-w/2;
		int top = y-w/2;
		int width = w;
		int height = w;
		/*int left = (x-w)<0?0:(x-w);
		int top = (y-w)<0?0:(y-w);
		int width = (x+w)>166?(166-x):w;
		int height = (y+w)>110?(110-y):w;
		*/
		g.drawRect( left , top , width, height );
		g.drawString( "Map Service" ,0,10);
		//g.drawString( ""+y,0,30);
		//g.drawString( ""+w,0,50);
		draw=false;
	}
	private void getParam()
	{

		size = Integer.parseInt( getParameter("size")  );
		x =  Integer.parseInt( getParameter("x")  );
		y =  Integer.parseInt( getParameter("y")  );
	}
	private int getSizeRect()
	{

		return (200/size);
		/*if( size == 1 )
			return 200;
		if( size == 2 )
			return 66;
		if( size == 3 )
			return 55;
		if( size == 4 )
			return 6;
		else
			return 100;
*/
		
		/*switch(size)
		{
			case 1: return 200;
			case 2: return 100;
			case 3: return 66;
			case 4: return 50;
			default : return 200;
		}*/
		//return 20;
	}
	 
	public void setXY(int xn, int yn )
	{
		x = xn;
		y = yn;
		draw=true;
	}
	public void  setSize(int s )
	{
		if ( s < 1)
			size = 1;
		else if ( s > 5 )
			size = 5;
		else
			size = s;

		draw=true;
	}

}
