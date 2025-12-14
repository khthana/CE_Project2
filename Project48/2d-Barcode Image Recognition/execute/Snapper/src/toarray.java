import javax.microedition.lcdui.*;
import javax.microedition.media.MediaException;
import javax.microedition.media.control.VideoControl;

public class toarray
{
  public picture pic;
  int avgx;
  int avgy;
  int countx,county;
  int[] refx;
  int[] refy;
  boolean data[][];
  public byte serialdata[];
  public byte decodedata[];
  public int errorcount;

  
  public toarray(picture p)
  {
	  pic=p;
	  getavgx(3);
	  getavgy(pic.width-4);
      countx = getcountx(3,false);
      county = getcounty(pic.width-4,false);
	  refx = new int[countx];
	  refy = new int[county];
	  getcountx(3,true);
	  getcounty(pic.width-4,true);

	  getdata();
  }

 public void getavgx(int y)
 {
	  int s0=0,r0=0,w0=0;
	  int s1=0,r1=0,w1=0;

	  for(int x=0;x<pic.width;x++)
	 {
		if (pic.getrgb(x,y)==0xFFFFFFFF)		// white
		{
			s0+= r0*r0;
			w0 += r0;
			r0=0;
			r1++;
		}
		else															// black
		{
			s1+= r1*r1;
			w1 += r1;
			r1=0;
			r0++;
		}
	 }
	 int avg0 = s0 / w0;
	 int avg1 = s1 / w1;
	 avgx=(avg0+avg1)/2;
  }

 public void getavgy(int x)
 {
	  int s0=0,r0=0,w0=0;
	  int s1=0,r1=0,w1=0;

	  for(int y=0;y<pic.height;y++)
	 {
		if (pic.getrgb(x,y)==0xFFFFFFFF)		// white
		{
			s0+= r0*r0;
			w0 += r0;
			r0=0;
			r1++;
		}
		else															// black
		{
			s1+= r1*r1;
			w1 += r1;
			r1=0;
			r0++;
		}
	 }
	 int avg0 = s0 / w0;
	 int avg1 = s1 / w1;
	 avgy=(avg0+avg1)/2;
  }

public int getcountx(int y,boolean c)
{
	int x=0,oldx;
	int cx=0;
	int newtotal,total;
	int newcolor,color;

	 while(x<pic.width)
	{
        color=pic.getrgb(x,y);
        if(c) refx[cx]=x;
        total=0;        
        while((x<pic.width) && (pic.getrgb(x,y)==color))
		{
            total++;
            x++;
            //%%%%%%% check next %%%%%%%%%
            if ((x<pic.width) && (pic.getrgb(x,y) != color))
			{
                newcolor = pic.getrgb(x,y);
                newtotal = 0;
                oldx=x;
                while((x<pic.width) && (pic.getrgb(x,y)==newcolor))
				{
                    newtotal++;
                    x++;
				}
                if (newtotal>(avgx*70/100)) x=oldx;
			 }    
             //%%%%%%%%%%%%%%%%%%%%%%%            
        }              
        cx++;
    }
	if(c) refx[cx]=pic.width;
	cx++;
	return cx;
	
 }

 public int getcounty(int x,boolean c)
{
	int y=0,oldy;
	int cy=0;
	int newtotal,total;
	int newcolor,color;

	 while(y<pic.height)
	{
        color=pic.getrgb(x,y);
        if(c) refy[cy]=y;
        total=0;        
        while((y<pic.height) && (pic.getrgb(x,y)==color))
		{
            total++;
            y++;
            //%%%%%%% check next %%%%%%%%%
            if ((y<pic.height) && (pic.getrgb(x,y) != color))
			{
                newcolor = pic.getrgb(x,y);
                newtotal = 0;
                oldy=y;
                while((y<pic.height) && (pic.getrgb(x,y)==newcolor))
				{
                    newtotal++;
                    y++;
				}
                if (newtotal>(avgy*70/100)) y=oldy;
			 }    
             //%%%%%%%%%%%%%%%%%%%%%%%            
        }		
        cy++;
    }
	if(c) refy[cy]=pic.height;
	cy++;
	return cy;
 }

 public void getdata()
{
	data = new boolean[countx-1][county-1];
	 for(int x=0;x<(countx-1);x++)
		 for(int y=0;y<(county-1);y++)
		{
			int sum=0;
			int total=0;
			for(int xx=refx[x];xx<refx[x+1];xx++)
				for(int yy=refy[y];yy<refy[y+1];yy++)
				{
					sum += (pic.getrgb(xx,yy)==0xFFFFFFFF)?0:1;
					total += 1;
				}

			int rate=sum*100/total;
			data[x][y] = (rate>50)?true:false;			

			for(int xx=refx[x];xx<refx[x+1];xx++)
				for(int yy=refy[y];yy<refy[y+1];yy++)		
					pic.setrgb(xx,yy,(data[x][y])?0xFF000000:0xFFFFFFFF);
		}

	serialdata = new byte[255];
	int countbit=0;
	int countbyte=0;
	 for(int x=1;x<(countx-2);x++)
		 for(int y=1;y<(county-2);y++)
		{
			int d = (data[x][y])?1:0;
			serialdata[countbyte] += (d<<countbit);

			countbit++;
			if (countbit==8)
			{
				countbit=0;
				countbyte++;
			}
		}

    int re2 = (int)Math.ceil((double)(countx-2)*(countx-2) / 8 / 16);

	RSAlgorithm rs = new RSAlgorithm(255, 8, re2, 0);
    for(int i=0;i<255;i++) rs.codeReceive.coefficient[i] = bytetoint(serialdata[i]);
    rs.codeReceive.degree = rs.degree(rs.codeReceive);
    rs.calculateSyndrome();
    rs.errorProcessing();
    rs.calculateMessageReceive();
        
    byte[] dataout = new byte[rs.messageReceive.degree+1];
    for(int i=0;i<dataout.length;i++) dataout[i] = (byte)rs.messageReceive.coefficient[i];

    decodedata = dataout;
	errorcount = rs.errorNumber;	
}

int bytetoint(byte i)
{
	int r = i;
    if (r<0) return r+=256;
    return r;
}



}



