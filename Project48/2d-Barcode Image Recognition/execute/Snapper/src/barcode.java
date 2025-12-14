import javax.microedition.lcdui.*;
import javax.microedition.media.MediaException;
import javax.microedition.media.control.VideoControl;

public class barcode
{
  public picture pic,bw;
  public toarray arr;
 
  public barcode(Image m)
  {
	  pic = new picture(m);
	  pic = new picture(pic.getpicbw());
	  bw = new picture(pic.getpic());
	  region r = new region(pic);
	  int w = (r.right-r.left+1)*5/100;
	  int h = (r.down-r.up+1)*5/100;
	  bw = new picture(bw.getclip(r.left-w,r.right+w,r.up-h,r.down+h));
	  bw = new picture(bw.getstrenchup());
	  bw = new picture(bw.getstrenchright());
	  bw = new picture(bw.getstrenchdown());
	  bw = new picture(bw.getstrenchleft());
	  arr = new toarray(bw);

	  bw = new picture(arr.pic.getresize(170,bw.height*170/bw.width));
  }

  Image getpic()
  {
	  return bw.getpic();
  }
  byte[] getdata()
  {
    return arr.decodedata;
  }

   int  geterror()
  {
    return arr.errorcount;
  }


}
