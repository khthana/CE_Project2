import java.io.*;
import java.util.*;
import java.lang.*;
import java.awt.*;
import java.awt.image.*;
import com.sun.image.codec.jpeg.*;

public class PortalUtil
{
  public PortalUtil() {};
  
//-----------------------------------------------
// Function MakePieJpeg is used to create 
// pie graph and save it to file in format JPEG
//-----------------------------------------------
// Parameter :
// gparam	-> data for make graph
// fname	-> file name for save graph
//-----------------------------------------------
  public static boolean MakePieJpeg(String gparam,String fname)
  {
    StringTokenizer stoken;
    String st;
    int iparam[] = new int[10];

    try
    {
// Get data
      stoken = new StringTokenizer(gparam,",");
      int i = 0;
      while (stoken.hasMoreElements() && (i<10))
      {
        st = new String(stoken.nextToken());
        iparam[i] = Integer.valueOf(st).intValue();
        i++;
      }
// Calculate percent
      int j;
      int total = 0;
      for (j=0; j<i; j++)
      {
        total = total + iparam[j];
      }
      int gpercent;
      for (j=0; j<i; j++)
      {
        gpercent = (iparam[j]*360)/total;
        iparam[j] = gpercent;
      }
// Make graph
      int cdegree = 0;
      Graphics gpie;
      BufferedImage bi = new BufferedImage(300,300,1);
      gpie = bi.getGraphics();
      gpie.setColor(new Color(255,255,255));
      gpie.fillRect(0,0,300,300);
      for (j=0; j<(i-1); j++)
      {
        if ((j%10)==0) gpie.setColor(Color.red);
        if ((j%10)==1) gpie.setColor(Color.green);
        if ((j%10)==2) gpie.setColor(Color.blue);
        if ((j%10)==3) gpie.setColor(Color.magenta);
        if ((j%10)==4) gpie.setColor(Color.pink);
        if ((j%10)==5) gpie.setColor(Color.lightGray);
        if ((j%10)==6) gpie.setColor(Color.orange);
        if ((j%10)==7) gpie.setColor(Color.yellow);
        if ((j%10)==8) gpie.setColor(Color.cyan);
        if ((j%10)==9) gpie.setColor(Color.gray);
        gpie.fillArc(0,0,300,300,cdegree,iparam[j]);
        cdegree = cdegree + iparam[j];
	  }
      i = i-1;
	  if ((i%10)==0) gpie.setColor(Color.red);
      if ((i%10)==1) gpie.setColor(Color.green);
      if ((i%10)==2) gpie.setColor(Color.blue);
      if ((i%10)==3) gpie.setColor(Color.magenta);
      if ((i%10)==4) gpie.setColor(Color.pink);
      if ((i%10)==5) gpie.setColor(Color.lightGray);
      if ((i%10)==6) gpie.setColor(Color.orange);
      if ((i%10)==7) gpie.setColor(Color.yellow);
      if ((i%10)==8) gpie.setColor(Color.cyan);
      if ((i%10)==9) gpie.setColor(Color.gray);
      gpie.fillArc(0,0,300,300,cdegree,(360-cdegree));
// Create JPEG file
      JPEGImageEncoder ImgEnc;
      ImgEnc = JPEGCodec.createJPEGEncoder(new FileOutputStream(fname));
      ImgEnc.encode(bi);
      ImgEnc.getOutputStream().close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
      return false;
    }
    return true;
  };

//-----------------------------------------------
// Function MakeLineJpeg is used to create 
// line graph and save it to file in format JPEG
//-----------------------------------------------
// Parameter :
// gparam	-> data for make graph
// fname	-> file name for save graph
//-----------------------------------------------
  public static boolean MakeLineJpeg(String gparam,String fname)
  {
    StringTokenizer stoken;
    String st;
    int iparam[] = new int[10];
    int count;
    int ymax;
    int xscale;
    int yscale;

    try
    {
// Get data
      stoken = new StringTokenizer(gparam,",");
      count = 0;
      ymax = 0;
      while (stoken.hasMoreElements() && (count<10))
      {
        st = new String(stoken.nextToken());
        iparam[count] = Integer.valueOf(st).intValue();
        if (iparam[count]>ymax)
        {
          ymax = iparam[count];
        }
        count++;
      }
      if (ymax < 10)
      {
        ymax = 10;
      }
      yscale = ymax / 10;
      xscale = 250 / count;

      Graphics gline;
      BufferedImage bi = new BufferedImage(300,300,1);
      gline = bi.getGraphics();
      gline.setColor(new Color(255,255,255));
      gline.fillRect(0,0,300,300);
// Draw axle
      gline.setColor(Color.black);
      gline.drawLine(9,10,9,291);
      gline.drawLine(10,10,10,291);
      gline.drawLine(10,290,290,290);
      gline.drawLine(10,291,290,291);
// Draw arrow
      gline.drawLine(9,10,4,15);
      gline.drawLine(9,11,4,16);
      gline.drawLine(10,10,15,15);
      gline.drawLine(10,11,15,16);
      gline.drawLine(290,290,285,285);
      gline.drawLine(289,290,284,285);
      gline.drawLine(290,291,285,296);
      gline.drawLine(289,291,284,296);
// Draw scale
      int i;
      for (i=1; i<11; i++)
      {
        gline.drawLine(7,(290-(25*i)),12,(290-(25*i)));
      }
// Make graph
      int j,k,lastx,lasty;
      lastx = 0;
      lasty = 0;
	  k = 35;
      for (i=0; i<count; i++)
      {
        j = 290 - ((iparam[i] * 25) / yscale);
        gline.setColor(Color.black);
        gline.drawLine(k,288,k,293);
        gline.setColor(Color.red);
        gline.fillRect(k-1,j-1,3,3);
        if (lastx != 0)
        {
          gline.setColor(Color.cyan);
          gline.drawLine(lastx,lasty,k,j);
        }
        gline.setColor(Color.red);
		gline.drawString(new Integer(iparam[i]).toString(),k - 3,j - 3);
        lastx = k;
        lasty = j;
        k = k + xscale;
      }
// Create JPEG file
      JPEGImageEncoder ImgEnc;
      ImgEnc = JPEGCodec.createJPEGEncoder(new FileOutputStream(fname));
      ImgEnc.encode(bi);
      ImgEnc.getOutputStream().close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
      return false;
    }
    return true;
  };

//-----------------------------------------------
// Function MakeBarJpeg is used to create 
// bar graph and save it to file in format JPEG
//-----------------------------------------------
// Parameter :
// gparam	-> data for make graph
// fname	-> file name for save graph
//-----------------------------------------------
  public static boolean MakeBarJpeg(String gparam,String fname)
  {
    StringTokenizer stoken;
    String st;
    int iparam[] = new int[10];
    int count;
    int ymax;
    int xscale;
    int yscale;

    try
    {
// Get data
      stoken = new StringTokenizer(gparam,",");
      count = 0;
      ymax = 0;
      while (stoken.hasMoreElements() && (count<10))
      {
        st = new String(stoken.nextToken());
        iparam[count] = Integer.valueOf(st).intValue();
        if (iparam[count]>ymax)
        {
          ymax = iparam[count];
        }
        count++;
      }
      if (ymax < 10)
      {
        ymax = 10;
      }
      yscale = ymax / 10;
      xscale = 250 / (count * 2);

      Graphics gbar;
      BufferedImage bi = new BufferedImage(300,300,1);
      gbar = bi.getGraphics();
      gbar.setColor(new Color(255,255,255));
      gbar.fillRect(0,0,300,300);
// Draw axle
      gbar.setColor(Color.black);
      gbar.drawLine(9,10,9,291);
      gbar.drawLine(10,10,10,291);
      gbar.drawLine(10,290,290,290);
      gbar.drawLine(10,291,290,291);
// Draw arrow
      gbar.drawLine(9,10,4,15);
      gbar.drawLine(9,11,4,16);
      gbar.drawLine(10,10,15,15);
      gbar.drawLine(10,11,15,16);
      gbar.drawLine(290,290,285,285);
      gbar.drawLine(289,290,284,285);
      gbar.drawLine(290,291,285,296);
      gbar.drawLine(289,291,284,296);
// Draw scale
      int i;
      for (i=1; i<11; i++)
      {
        gbar.drawLine(7,(290-(25*i)),12,(290-(25*i)));
      }
// Make graph
      int j,k;
	  k = 35;
      for (i=0; i<count; i++)
      {
        j = 290 - ((iparam[i] * 25) / yscale);
        if ((i%10)==0) gbar.setColor(Color.red);
        if ((i%10)==1) gbar.setColor(Color.green);
        if ((i%10)==2) gbar.setColor(Color.blue);
        if ((i%10)==3) gbar.setColor(Color.magenta);
        if ((i%10)==4) gbar.setColor(Color.pink);
        if ((i%10)==5) gbar.setColor(Color.lightGray);
        if ((i%10)==6) gbar.setColor(Color.orange);
        if ((i%10)==7) gbar.setColor(Color.yellow);
        if ((i%10)==8) gbar.setColor(Color.cyan);
        if ((i%10)==9) gbar.setColor(Color.gray);
        gbar.fillRect(k,j,xscale,(290 - j));
		gbar.drawString(new Integer(iparam[i]).toString(),k,(j - 3));
        k = k + (2 * xscale);
      }
// Create JPEG file
      JPEGImageEncoder ImgEnc;
      ImgEnc = JPEGCodec.createJPEGEncoder(new FileOutputStream(fname));
      ImgEnc.encode(bi);
      ImgEnc.getOutputStream().close();
    }
    catch (Exception e)
    {
      e.printStackTrace();
      return false;
    }
    return true;
  };

//-----------------------------------------------
// Function isUpperChar is used to check character  
// if character is upper character then return true
// else return false
//-----------------------------------------------
// Parameter :
// c	-> character for check
//-----------------------------------------------
  public static boolean isUpperChar(char c)
  {
    if ((c=='A') || (c=='B') || (c=='C') || (c=='D') || (c=='E') || (c=='F')
     || (c=='G') || (c=='H') || (c=='I') || (c=='J') || (c=='K') || (c=='L')
     || (c=='M') || (c=='N') || (c=='O') || (c=='P') || (c=='Q') || (c=='R')
     || (c=='S') || (c=='T') || (c=='U') || (c=='V') || (c=='W') || (c=='X')
     || (c=='Y') || (c=='Z'))
    {
      return true;
    }
    else
    {
      return false;
    }
  };

//-----------------------------------------------
// Function isNum is used to check character  
// if character is number then return true
// else return false
//-----------------------------------------------
// Parameter :
// c	-> character f|| check
//-----------------------------------------------
  public static boolean isNum(char c)
  {
    if ((c=='0') || (c=='1') || (c=='2') || (c=='3') || (c=='4')
     || (c=='5') || (c=='6') || (c=='7') || (c=='8') || (c=='9'))
    {
      return true;
    }
    else
    {
      return false;
    }
  };
};
