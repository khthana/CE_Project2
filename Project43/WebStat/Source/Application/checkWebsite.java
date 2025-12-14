import java.io.*;
import java.net.*;
import java.lang.*;
import java.util.*;

public class checkWebsite extends Date
{
    static Date dateOld = new Date();

	public static void main(String[] args)
	{
		String time = args[0];
		DataInputStream DataIn;
	    SearchRec data = new SearchRec();
	    int count = 0;
		String Url,Email,Pager,NumPager,Icq,Flag;
    	long timeOld,timeNew,timeSet;
	    timeOld = dateOld.getTime();
		timeSet = (Integer.parseInt(time))*60000;

	    while (true) {
		   Date dateNew = new Date();
	       timeNew = dateNew.getTime();
		   System.out.println(timeOld+" "+timeNew);
		   if ((timeNew-timeOld)>=timeSet) {
			  count = 1;
			  while (data.getRecord() > count) { 
				 if  (!(data.getUrl(count).equals(""))) {
		    			 Url = data.getUrl(count);
						 Email = data.getEmail(count);
	     			     Pager = data.getPager(count);
	    				 NumPager = data.getNumpager(count);
		    			 Icq = data.getIcq(count);
						 Flag = data.getFlag(count);
						 try	  {
							URL u = new URL(Url);
					    	DataIn = new DataInputStream(u.openConnection().getInputStream());
						    int s=0;
		  				    while ((s=DataIn.read()) != -1)   {
							   System.out.print((char)s);
							}
		    				 if (data.getFlag(count).equals("f")) {
								update(count,Url,Email,Pager,NumPager,Icq);
							 }
						 } catch (Exception e) {
							System.out.println(e);
		    				 if (data.getFlag(count).equals("t")) {
								alert(count,Url,Email,Pager,NumPager,Icq);
							 }
						 } //try
				  }	//if 
				  count++;
			   }//while	have record 	
			   Date time1 = new Date();
		       timeOld = time1.getTime();
			} //if time
		}//while true
	}

	public static void alert(int count,String Url,String Email,String Pager,String NumPager,String Icq)
	{
		Runtime r = Runtime.getRuntime();
		String id = Integer.toString(count);
		try
		{		
				r.exec("java sendMail "+Email+" s1013524@ce.kmitl.ac.th 161.246.4.3 false");
				r.exec("java sendMail "+Icq+"@pager.mirabilis.com s1013524@ce.kmitl.ac.th 161.246.4.3 false");
				r.exec("java sendPager "+Pager+" "+NumPager);
				r.exec("java modifyFile Update "+id+" "+Url+"; "+Email+"; "+Pager+"; "+NumPager+"; "+Icq+"; f;");
		}
		catch (Exception e)	{ System.out.println(e);		}
	}

	public static void update(int count,String Url,String Email,String Pager,String NumPager,String Icq)
	{
		Runtime r = Runtime.getRuntime();
		String id = Integer.toString(count);
		try
		{
			r.exec("java modifyFile Update "+id+" "+Url+"; "+Email+"; "+Pager+"; "+NumPager+"; "+Icq+"; t;");
		}
		catch (Exception e)	{ System.out.println(e);		}
	}
}

