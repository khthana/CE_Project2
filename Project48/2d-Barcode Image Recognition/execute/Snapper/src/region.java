import javax.microedition.lcdui.*;
import javax.microedition.media.MediaException;
import javax.microedition.media.control.VideoControl;

public class region
{
  public picture pic;
  public int count;
  public int left,right,up,down;
  public int l,r,u,d;
  
  public region(picture p)
  {
	  pic=p;
	  count=0;
	  int x,y,maxarea=0;
	  for(x=0;x<pic.width;x++)
		  for(y=0;y<pic.height;y++)
				if(pic.getrgb(x,y)==0xFF000000)
				{
					count++;
					l=r=x;
					u=d=y;
					fillregion(x,y,count);
					int area = (r-l+1)*(d-u+1);
					if (area > maxarea)
					{
						maxarea=area;
						left=l;
						right=r;
						up=u;
						down=d;
					}
				}
  }

  public void fillregion(int x,int y,int rr)
  {
	  if (x<l)	l	= x;
  	  if (x>r)	r	= x;
   	  if (y<u)	u	= y;
   	  if (y>d)	d	= y;
  	  pic.setrgb(x,y,0xFF000000+(rr*100));
	  if (x-1>=0)				if (pic.getrgb(x-1,y	)==0xFF000000)		fillregion(x-1		,y,rr);
	  if (x+1< pic.width)	if (pic.getrgb(x+1,y	)==0xFF000000)		fillregion(x+1		,y,rr);
  	  if (y-1>=0)				if (pic.getrgb(x,y-1	)==0xFF000000)		fillregion(x,y-1	,rr);
	  if (y+1< pic.height)	if (pic.getrgb(x,y+1	)==0xFF000000)		fillregion(x,y+1	,rr);
  }

}
