import javax.microedition.lcdui.*;
import javax.microedition.media.MediaException;
import javax.microedition.media.control.VideoControl;

public class picture
{
  public int[] pic;
  public int[] bw;
  public int[] st;

  public int width;
  public int height;

  public int min;
  public int max;
  
  public picture(Image m) {
	width = m.getWidth();
	height = m.getHeight();
    pic=new int[width*height];
	m.getRGB(pic,0,width,0,0,width,height);
  }

  public Image getpicbw()
  {
  	bw=new int[width*height];
  	int x,y,gray;
	min=255;
	max=0;
	for(x=0;x<width;x++)
		for(y=0;y<height;y++)
		{
			gray=getgray(x,y);
			if (gray>max) max=gray;
			if (gray<min) min=gray;
		 }	

  	int threshold = (max + min) /3;
	for(x=0;x<width;x++)
		for(y=0;y<height;y++)
			bw[(y*width)+x] = (getgray(x,y)>=threshold)?0xFFFFFFFF:0xFF000000;	

    Image m = Image.createImage(width,height);
	Graphics g = m.getGraphics();
	g.drawRGB(bw,0,width,0,0,width,height,false);
	return m;
  }

  public Image getpic()
  {
    Image m = Image.createImage(width,height);
	Graphics g = m.getGraphics();
	g.drawRGB(pic,0,width,0,0,width,height,false);
	return m;
  }
 
 public Image getclip(int l,int r,int u,int d)
  {
	 if (l < 0) l=0;
	 if (r >= width ) r = width-1;
	 if (u < 0) u=0;
	 if (d >= height ) d = height-1;

	int w=r-l+1;
	int h=d-u+1;
    Image m = Image.createImage(w,h);
	Image p  = getpic();

	Graphics g = m.getGraphics();
	g.setClip(0,0,w,h);
    g.drawImage(p,-l,-u, Graphics.LEFT | Graphics.TOP);
	return m;
  }
  
  public Image getresize(int w,int h)
  {
    Image m = Image.createImage(w,h);
	Image p  = getpic();
	Graphics g = m.getGraphics();

	for (int y = 0; y < h; y++)
		for (int x = 0; x < w; x++)
		{
			g.setClip(x, y, 1, 1);
			int dx = x * width / w;
			int dy = y * height / h;
			g.drawImage(p,x - dx, y - dy, Graphics.LEFT | Graphics.TOP);
		}
	return m;    
  }

  /*public void setrgb(int x,int y,int r,int g,int b)
  {
    int i = (y*width)+x;
	int a = 255;
	pic[i] = ((a<<24)&0xFF000000) | ((r<<16)&0x00FF0000) | ((g<<8)&0x0000FF00) | (b&0x000000FF);
  }*/

  public void setrgb(int x,int y,int rgb)
  {
    int i = (y*width)+x;
	pic[i] = rgb;
  }

  public int getrgb(int x,int y)
  {
    int i = (y*width)+x;
	int r = pic[i];
	return r;
  }
  
 /* public int getr(int x,int y)
  {
    int i = (y*width)+x;
	int r=(int)((pic[i]&0x00FF0000)>>>16); //Red level
	return r;
  }

  public int getg(int x,int y)
  {
    int i = (y*width)+x;
	int g=(int)((pic[i]&0x0000FF00)>>>8); //Green level
	return g;
  }

  public int getb(int x,int y)
  {
    int i = (y*width)+x;
	int b=(int)((pic[i]&0x000000FF)); //Blue level
	return b;
  }*/

  public int getgray(int x,int y)
  {
    int	i	=	(y*width)+x;
	int	r	=	((pic[i]&0x00FF0000)>>16); //Red level
	int	g	=	((pic[i]&0x0000FF00)>>8); //Green level
	int	b	=	((pic[i]&0x000000FF)); //Blue level
	int xx = (r*30/100)+(g*59/100)+(b*11/100);
	return  xx;
  }

  public Image getstrenchup()
  {
	// find up left point ...........................................................................................................
	int firstx=width-1;
	int firsty=height-1;
	int first = (firstx*firstx)+(firsty*firsty);
	int dist;
	int x,y;
	for(x=0;x<width;x++)
		for(y=0;y<height;y++)
			if (getrgb(x,y)!=0xFFFFFFFF)
			{
				dist=(x*x)+(y*y);
				if (dist<=first)	{first=dist;firstx=x;	firsty=y;}
			}

	// strenchup ......................................................................................................................
  	st=new int[width*height];
	for(x=0;x<firstx;x++)
		for(y=0;y<height;y++)
	   {
			st[(y*width)+x] = getrgb(x,firsty+(y*(height-firsty)/height));
	   }

	for(x=firstx;x<width;x++)
   {
		int starty=firsty-3;
		if (starty<0) starty=0;
		int stopy=firsty+3;
		if (stopy>=height) stopy = height-1;
		for(y=starty;(y<stopy)&&(getrgb(x,y)==0xFFFFFFFF);y++);
		if (getrgb(x,y)==0XFFFFFFFF) y=firsty;
		firsty=y;

		for(y=0;y<height;y++)
	   {
			st[(y*width)+x] = getrgb(x,firsty+(y*(height-firsty)/height));
	   }
   }

    Image m = Image.createImage(width,height);
	Graphics g = m.getGraphics();
	g.drawRGB(st,0,width,0,0,width,height,false);
	return m;
  }

  public Image getstrenchright()
  {
	// find down right point ...........................................................................................................
	int firstx=0;
	int firsty=0;
	int first = 0;
	int dist;
	int x,y;
	for(x=0;x<width;x++)
		for(y=0;y<height;y++)
			if (getrgb(x,y)!=0xFFFFFFFF)
			{
				dist=(x*x)+(y*y);
				if (dist>=first)	{first=dist;firstx=x;	firsty=y;}
			}

	// strenchright ......................................................................................................................
  	st=new int[width*height];
	for(y=height-1;y>firsty;y--)
		for(x=0;x<width;x++)
	   {
			st[(y*width)+x] = getrgb((x*(firstx+1)/width),y);
	   }

	for(y=firsty;y>=0;y--)
   {
		int startx=firstx+3;
		if (startx>=width) startx=width-1;
		int stopx=firstx-3;
		if (stopx<0) stopx =0;
		for(x=startx;(x>stopx)&&(getrgb(x,y)==0xFFFFFFFF);x--);
		if (getrgb(x,y)==0XFFFFFFFF) x=firstx;
		firstx=x;

		for(x=0;x<width;x++)
	   {
			st[(y*width)+x] = getrgb((x*(firstx+1)/width),y);
	   }
   }

    Image m = Image.createImage(width,height);
	Graphics g = m.getGraphics();
	g.drawRGB(st,0,width,0,0,width,height,false);
	return m;
  }

 public Image getstrenchleft()
  {
	// find up left point ...........................................................................................................
	int firstx=width-1;
	int firsty=height-1;
	int first = (firstx*firstx)+(firsty*firsty);
	int dist;
	int x,y;
	for(x=0;x<width;x++)
		for(y=0;y<height;y++)
			if (getrgb(x,y)!=0xFFFFFFFF)
			{
				dist=(x*x)+(y*y);
				if (dist<=first)	{first=dist;firstx=x;	firsty=y;}
			}


	// strenchleft ......................................................................................................................
  	st=new int[width*height];
	for(y=0;y<firsty;y++)
		for(x=0;x<width;x++)
	   {
			st[(y*width)+x] = getrgb(firstx+(x*(width-firstx)/width),y);
	   }

	for(y=firsty;y<height-1;y++)
   {
		int startx=firstx-3;
		if (startx<0) startx=0;
		int stopx=firstx+3;
		if (stopx>=width) stopx =width-1;
		for(x=startx;(x<stopx)&&(getrgb(x,y)==0xFFFFFFFF);x++);
		if (getrgb(x,y)==0XFFFFFFFF) x=firstx;
		firstx=x;

		for(x=0;x<width;x++)
	   {
			st[(y*width)+x] = getrgb(firstx+(x*(width-firstx)/width),y);
	   }

	  // setrgb(firstx,y,0xFFFF0000);
	  // setrgb(firstx+1,y,0xFFFF0000);
   	  // setrgb(firstx+2,y,0xFFFF0000);
   	  // setrgb(firstx+3,y,0xFFFF0000);
   }

    Image m = Image.createImage(width,height);
	Graphics g = m.getGraphics();
	g.drawRGB(st,0,width,0,0,width,height,false);
	return m;
  }

 public Image getstrenchdown()
  {
	// find down right point ...........................................................................................................
	int firstx=0;
	int firsty=0;
	int first = 0;
	int dist;
	int x,y;
	for(x=0;x<width;x++)
		for(y=0;y<height;y++)
			if (getrgb(x,y)!=0xFFFFFFFF)
			{
				dist=(x*x)+(y*y);
				if (dist>=first)	{first=dist;firstx=x;	firsty=y;}
			}

	// strenchdown ......................................................................................................................
  	st=new int[width*height];
	for(x=width-1;x>firstx;x--)
		for(y=0;y<height;y++)
	   {
			st[(y*width)+x] = getrgb(x,y*(firsty+1)/height);
	   }

	for(x=firstx;x>=0;x--)
   {
		int starty=firsty+3;
		if (starty>=height) starty=height-1;
		int stopy=firsty-3;
		if (stopy<0) stopy =0;
		for(y=starty;(y>stopy)&&(getrgb(x,y)==0xFFFFFFFF);y--);
		if (getrgb(x,y)==0XFFFFFFFF) y=firsty;
		firsty=y;

		for(y=0;y<height;y++)
	   {
			st[(y*width)+x] = getrgb(x,y*(firsty+1)/height);
	   }
   }

    Image m = Image.createImage(width,height);
	Graphics g = m.getGraphics();
	g.drawRGB(st,0,width,0,0,width,height,false);
	return m;
  }


}
