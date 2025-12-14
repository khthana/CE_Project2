import java.sql.*;
import java.io.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class login extends HttpServlet
implements SingleThreadModel {

private Connection conn = null;
private ResultSet rs = null;

public void init( ServletConfig config ) throws ServletException {
  super.init(config);
  try {
   Class.forName ("sun.jdbc.odbc.JdbcOdbcDriver");
	 conn = DriverManager.getConnection("jdbc:odbc:database","","");
  } catch ( SQLException e ) {
  System.err.println("Could not establish connection.");
  } catch ( ClassNotFoundException e ) {
  System.err.println("Could not load database driver.");
  }
} // init
//-------------------------------Get Method------------------------------
public void doPost(HttpServletRequest req, HttpServletResponse res)
                               throws ServletException, IOException {
	String Username="";
	String Passwd="",times="";
  boolean CheckData = false;
  int Total=0,GraphWidth=500,value=0;
  double Percent=0,Width=0;

	Username=req.getParameter("txUser");
	Passwd=req.getParameter("txPass");

	PrintWriter out = res.getWriter();
  res.setContentType("text/html");
  try {
    Statement stmt = conn.createStatement();
    String User = "SELECT * FROM register WHERE Login = '"+ Username +"'";
    rs = stmt.executeQuery(User);
    if (!(rs.next()))
      out.println("<html><head><body> "+Username+"Login Failed ....! </body></html>");
    else {
      out.println("<html><head><title> CheckUser </title></head>");
      out.println("<body>");
      do {
        if (Passwd.equals(rs.getString(12))) {
//          out.println("<h1>"+rs.getString(5)+"</h1>");
          CheckData = true;

////////////                      DISPLAY GRAPH          //////////////////////                                   //cc0000 red
          String Id = rs.getString(1);                                                                            //ffffdd yellow
//          out.println(Id);                                                                                      //9999ff whiteblue


///////////////   Search Total information  /////////////////
          String getTotal = "SELECT count(*) FROM Data WHERE IdUser = '"+Id+"'";
          rs = stmt.executeQuery(getTotal);
          rs.next();
          Total = rs.getInt(1);
          out.println("<br>Total of Visitors = "+Total);
// Summary  Date
          String getdate = "SELECT Day,Date,Month,Year,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by Day,Date,Month,Year order by Date";
          rs = stmt.executeQuery(getdate);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Dates</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(5);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
// Summary  time
          String gettime = "SELECT Time,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by Time";
          rs = stmt.executeQuery(gettime);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Times</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(2);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            times = rs.getString(1);
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+times+":00 - "+times+":59</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
// Summary  Day
          String getDay = "SELECT Day,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by Day";
          rs = stmt.executeQuery(getDay);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Days</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(2);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
// Summary  Month
          String getMonth = "SELECT Month,Year,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by Month,Year";
          rs = stmt.executeQuery(getMonth);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Months</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(3);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+" "+rs.getString(2)+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
// Summary  Year
          String getYear = "SELECT Year,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by Year";
          rs = stmt.executeQuery(getYear);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Years</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(2);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
// Summary  OS
          String getOs = "SELECT OS,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by OS";
          rs = stmt.executeQuery(getOs);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Operating Systems</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(2);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
// Summary  Referer
          String getReferer = "SELECT Referer,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by Referer";
          rs = stmt.executeQuery(getReferer);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Referrers</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(2);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
// Summary  BROWSER
          String getBrowser = "SELECT Browser,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by Browser";
          rs = stmt.executeQuery(getBrowser);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Browsers</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(2);
            Percent = 100*value/Total;                                                                                                                                                                                                                                                                                                                                                                                        //9999ff
            Width = (Percent*GraphWidth)/100;                     //cc0000                                                        //ffffdd                                                                                  //ffffdd                              //000000
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=FF0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
//            out.println("<br>"+rs.getString(1)+rs.getString(2));
          }
//          out.println("<hr width=\"70%\" align=\"center\">");
// Summary  VERSION
          String getVersion = "SELECT Version,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by Version";
          rs = stmt.executeQuery(getVersion);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Versions</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(2);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
// Summary  Platform
          String getPlatform = "SELECT Platform,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by Platform";
          rs = stmt.executeQuery(getPlatform);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Platforms</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(2);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
// Summary  ScreenWidth
          String getScreenWidth = "SELECT ScreenWidth,ScreenHeight,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by ScreenWidth,ScreenHeight";
          rs = stmt.executeQuery(getScreenWidth);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>Screens</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(3);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+"X"+rs.getString(2)+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffff00 align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
/*
// Summary  ScreenHeight
          String getScreenHeight = "SELECT ScreenHeight,count(*) FROM Data WHERE IdUser = '"+ Id +"'group by ScreenHeight";
          rs = stmt.executeQuery(getScreenHeight);
          out.println("</TABLE></TD></TR></TABLE><P>");
          out.println("<TABLE cellpadding=10 height=2% align=left><TR><TD> </TD></TR></TABLE><TABLE border=0 cellpadding=1><TR><TD bgcolor=\"#000000\"><TABLE cellpadding=3 border=0 cellspacing=1><TR><TD bgcolor=white colspan=4><TABLE cellpadding=5 border=0 width=100%><TR><TD><FONT color=000000 face=arial size=4> <B>ScreenHeight</TD><TD align=right></TD></TR></TABLE></TD></TR>");
          while(rs.next()) {
            value = rs.getInt(2);
            Percent = 100*value/Total;
            Width = (Percent*GraphWidth)/100;
            out.println("<TR><TD bgcolor=white nowrap><FONT color=0000FF face=arial size=2><B>"+rs.getString(1)+"</TD><TD bgcolor=ffffdd align=right nowrap><FONT color=000000 face=arial size=2><B>"+value+"</TD><TD bgcolor=ffffdd align=right nowrap><FONT color=000000 face=arial size=2><B>"+Percent+"% </TD><TD bgcolor=white><TABLE width= "+Width+"  height=16 border=0 cellpadding=0 cellspacing=0><TR><TD bgcolor=ff0000><IMG src=t_s.gif width=1 height=1></TD></TR></TABLE></TD></TR>");
          }
*/
        }
      }while(rs.next()&&(!CheckData));
      if (!CheckData) out.println("Password incorrect");
//      else //out.println("Complete ...");
      out.println("</body></html>");
    }
  } catch ( SQLException e ) {
      System.err.println("A database error occurred.");
  }
    //---------------------Response User------------
}
  //-------------------Distroy----------------------
public void destroy() {
  try {
 // close the database connection
    if (conn != null) conn.close();
  } catch (SQLException e) {
    System.err.println("Error closing database connection.");
  }
} // destroy
}

