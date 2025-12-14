import oracle.sql.*;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import oracle.jdbc.driver.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
public class SendSpecToDatabase extends HttpServlet implements Serializable
{
    public synchronized void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
      java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
      Connection con = null;
      Statement stmt = null;
      ResultSet rs= null;
      resp.setContentType("text/html");
      HttpSession session = req.getSession(true);
      Specification General_Spec = new Specification();
      String Spec_type    = req.getParameter("Spec_type");
      String Cpu          = req.getParameter("Cpu");
      String Ram          = req.getParameter("Ram");
      String Harddisk     = req.getParameter("Harddisk");
      String Cdrom        = req.getParameter("Cdrom");
      String Mainboard    = req.getParameter("Mainboard");
      String Display_card = req.getParameter("Display");
      String Sound_card   = req.getParameter("Soundcard");
      String Monitor      = req.getParameter("Monitor");
      String Modem        = req.getParameter("Modem");
      String Floppy_disk  = req.getParameter("Floppy");
      String Speaker      = req.getParameter("Speaker");
      String Mouse        = req.getParameter("Mouse");
      String Keyboard     = req.getParameter("Keyboard");
      String Price        = req.getParameter("Price");
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Show Member List</title>");
      out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\">");
      out.println("</head>");
      out.println("<body bgcolor=\"#FFFFFF\">");
      Part   part   = new Part() ;
      General_Spec.Listpart.addElement(part);
      General_Spec.GetPart(0).Partname        = "Computer Only";
      General_Spec.GetPart(0).Partdescription = "Computer Specification only";
      for (int row = 0 ; row < 13 ; row++)
      {
         Device device = new Device(1) ;
         General_Spec.GetPart(0).Listdevice.addElement(device);
      }
      General_Spec.GetPart(0).GetDevice(0).Data[0]  = Cpu;
      General_Spec.GetPart(0).GetDevice(1).Data[0]  = Ram;
      General_Spec.GetPart(0).GetDevice(2).Data[0]  = Mainboard ;
      General_Spec.GetPart(0).GetDevice(3).Data[0]  = Harddisk ;
      General_Spec.GetPart(0).GetDevice(4).Data[0]  = Cdrom ;
      General_Spec.GetPart(0).GetDevice(5).Data[0]  = Display_card;
      General_Spec.GetPart(0).GetDevice(6).Data[0]  = Sound_card;
      General_Spec.GetPart(0).GetDevice(7).Data[0]  = Monitor ;
      General_Spec.GetPart(0).GetDevice(8).Data[0]  = Modem ;
      General_Spec.GetPart(0).GetDevice(9).Data[0]  = Floppy_disk;
      General_Spec.GetPart(0).GetDevice(10).Data[0] = Mouse ;
      General_Spec.GetPart(0).GetDevice(11).Data[0] = Keyboard;
      General_Spec.GetPart(0).GetDevice(12).Data[0] = Speaker;
      General_Spec.GetPart(0).GetDevice(0).Type_Device  = "CPU" ;
      General_Spec.GetPart(0).GetDevice(1).Type_Device  = "RAM" ;
      General_Spec.GetPart(0).GetDevice(2).Type_Device  = "MAINBOARD" ;
      General_Spec.GetPart(0).GetDevice(3).Type_Device  = "HARDDISK" ;
      General_Spec.GetPart(0).GetDevice(4).Type_Device  = "CDROM" ;
      General_Spec.GetPart(0).GetDevice(5).Type_Device  = "DISPLAY CARD" ;
      General_Spec.GetPart(0).GetDevice(6).Type_Device  = "SOUND CARD" ;
      General_Spec.GetPart(0).GetDevice(7).Type_Device  = "MONITOR" ;
      General_Spec.GetPart(0).GetDevice(8).Type_Device  = "MODEM" ;
      General_Spec.GetPart(0).GetDevice(9).Type_Device  = "FLOPPY DISK" ;
      General_Spec.GetPart(0).GetDevice(10).Type_Device = "MOUSE" ;
      General_Spec.GetPart(0).GetDevice(11).Type_Device = "KEYBOARD" ;
      General_Spec.GetPart(0).GetDevice(12).Type_Device = "SPEAKER" ;
      try
      {
      	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    }
	    catch (java.sql.SQLException ko){ out.println("Register error");}
      try
     {
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      con.setAutoCommit(false);
      stmt = con.createStatement();
      /////--------Delete old data--------/////
      String delete ;
      delete = "delete from standard_spec where spec_type = 'Basic PC'";
    	rs  = stmt.executeQuery(delete);
      out.println("<br>");
    	out.println("string delete >>>  "   + delete);
      /////--------insert new EMPTY_BLOB()--------/////
      String insert ;
      insert = "insert into standard_spec(standard_spec,spec_type)";
      insert += " values(empty_BLOB(),'Basic PC')";
    	out.println("string insert >>>  "   + insert);
    	rs  = stmt.executeQuery(insert);
      BLOB blob;
      /////--------insert new Data--------/////
      String select = "Select standard_spec from standard_spec" ;
      select += " where spec_type = '"+ Spec_type + "'" ;
    	rs = stmt.executeQuery(select);
      out.println("<br>");
    	out.println("string select >>>  "   + select);
    	rs.next();
    	blob = ((OracleResultSet)rs).getBLOB(1);
 	    OutputStream outstream = blob.getBinaryOutputStream();
    	ObjectOutputStream oos = new ObjectOutputStream(outstream);
	  	oos.writeObject(General_Spec);
	    oos.flush();
      out.println("<br>");
 	    out.println("Send General Spec Success>>> <BR>");
      ///---------query spec from database------------------///
      con.commit();
     }
     catch (Exception ex)
     {
    	 out.println(ex);
	     ex.printStackTrace(out);
	   }
     finally
     {
	     try
	     { if (rs != null)  {rs.close();}
         if (stmt != null){stmt.close();}
  		   if (con != null) {con.close();}
       }
	     catch (Exception ex){ out.println(ex) ;}
	   }
    out.println("</body>");
    out.println("</html>");
    out.flush();
    }

}
