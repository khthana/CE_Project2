import java.sql.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class DeletePersonal extends HttpServlet
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

  String FIRSTSEARCH = "SELECT count(*) FROM register WHERE ";
  String DELETEFILE = "SELECT * FROM register ";
  String SEARCH = "DELETE FROM register WHERE ";
  int Number = 0;

	String Status="";
	String Id="";
	String Name="";
	String Surname="";
	String Sex="";
	String Address="";
	String Phone="";
	String Pager="";
	String NumPager="";
	String Email="";
	String WebSite="";
  String Icq="";
	String Username="";
	String Password="";

	Sex=req.getParameter("rbutton");
  Id=req.getParameter("txIdUser");
  Name=req.getParameter("txName");
	Surname=req.getParameter("txSurname");
	Address=req.getParameter("txAddress");
  Phone=req.getParameter("txPhone");
	Pager=req.getParameter("txPager");
	NumPager=req.getParameter("txNumPager");
	Email=req.getParameter("txEmail");
	WebSite=req.getParameter("txUrl");
  Icq=req.getParameter("txIcq");
	Username=req.getParameter("txUsername");
	Password=req.getParameter("txPassword");

  long startMS = System.currentTimeMillis();

	PrintWriter out = res.getWriter();
  res.setContentType("text/html");

  HttpSession session = req.getSession(true);
  String adminlogin = (String)session.getValue("Adminname");
  String passwdlogin = (String)session.getValue("Adminpass");

  if ((!(adminlogin.equals("admin")))||(!(passwdlogin.equals("admin")))) {
    out.println("<html><head><body> Login Failed ....! </body></html>");
  } else {

	try {
    if ((Sex==null)&&(Id.equals(""))&&(Name.equals(""))&&(Surname.equals(""))&&(Address.equals(""))&&(Phone.equals(""))
        &&(Pager.equals(""))&&(NumPager.equals(""))&&(WebSite.equals(""))&&(Icq.equals(""))&&(Email.equals(""))&&(Username.equals(""))) {
      out.println("<html><head><title>Data is missed...!</title></head><body><H1>Please, put data ...!<br>"+
      "You should back to re-put Data again.</h1></body></html>");
     } else {
        if (!(Sex==null)) {
          if (Sex.equals("rMr")) Status = "Mr";
          else if (Sex.equals("rMs")) Status = "Mis";
          else if (Sex.equals("rMrs")) Status = "Miss";
        }
        if (!(Id.equals(""))) FIRSTSEARCH += "Id = "+ Id +" and ";
        if (!(Name.equals(""))) FIRSTSEARCH += "Name = '"+ Name +"' and ";
        if (!(Surname.equals(""))) FIRSTSEARCH += "Surname = '"+ Surname +"' and ";
        if (!(Status.equals(""))) FIRSTSEARCH += "Sex = '"+ Status +"' and ";
        if (!(Address.equals(""))) FIRSTSEARCH += "Address = '"+ Address +"' and ";
        if (!(Phone.equals(""))) FIRSTSEARCH += "Phone = '"+ Phone +"' and ";
        if (!(Pager.equals(""))) FIRSTSEARCH += "Pager = '"+ Pager +"' and ";
        if (!(NumPager.equals(""))) FIRSTSEARCH += "NumberPage = '"+ NumPager +"' and ";
        if (!(Email.equals(""))) FIRSTSEARCH += "Email = '"+ Email +"' and ";
        if (!(Username.equals(""))) FIRSTSEARCH += "Login = '"+ Username +"' and ";
        if (!(Password.equals(""))) FIRSTSEARCH += "Password = '"+ Password +"' and ";
        if (!(WebSite.equals(""))) FIRSTSEARCH += "Url = '"+ WebSite +"' and ";
        if (!(Icq.equals(""))) FIRSTSEARCH += "Icq = '"+ Icq +"' and ";

        FIRSTSEARCH = FIRSTSEARCH.substring(0,FIRSTSEARCH.lastIndexOf(" and"))+";";
     // Create a Statement
        Statement stmt = conn.createStatement();
        rs = stmt.executeQuery(FIRSTSEARCH);
        rs.next();
        Number = rs.getInt(1);
        if (Number == 0) {
          out.println("<html><head><title>Data is missed...!</title></head><body><H1>"+
          "Not have Data"+
          "<br>Please, put data Again!<br></h1></body></html>");
        } else {
          if (!(Id.equals(""))) SEARCH += "Id = "+ Id +" and ";
          if (!(Name.equals(""))) SEARCH += "Name = '"+ Name +"' and ";
          if (!(Surname.equals(""))) SEARCH += "Surname = '"+ Surname +"' and ";
          if (!(Status.equals(""))) SEARCH += "Sex = '"+ Status +"' and ";
          if (!(Address.equals(""))) SEARCH += "Address = '"+ Address +"' and ";
          if (!(Phone.equals(""))) SEARCH += "Phone = '"+ Phone +"' and ";
          if (!(Pager.equals(""))) SEARCH += "Pager = '"+ Pager +"' and ";
          if (!(NumPager.equals(""))) SEARCH += "NumberPage = '"+ NumPager +"' and ";
          if (!(Email.equals(""))) SEARCH += "Email = '"+ Email +"' and ";
          if (!(Username.equals(""))) SEARCH += "Login = '"+ Username +"' and ";
          if (!(Password.equals(""))) SEARCH += "Password = '"+ Password +"' and ";
          if (!(WebSite.equals(""))) SEARCH += "Url = '"+ WebSite +"' and ";
          if (!(Icq.equals(""))) SEARCH += "Icq = '"+ Icq +"' and ";

          SEARCH = SEARCH.substring(0,SEARCH.lastIndexOf(" and"))+";";
      // Create a Statement

          DELETEFILE += FIRSTSEARCH.substring(FIRSTSEARCH.indexOf("WHERE"),FIRSTSEARCH.length());
          rs = stmt.executeQuery(DELETEFILE);
          while(rs.next()) {
          	Id=Integer.toString(rs.getInt(1));
          	Pager=rs.getString(7);
          	NumPager=rs.getString(8);
          	Email=rs.getString(9);
          	WebSite=rs.getString(13);
            Icq=rs.getString(10);
          	DeleteFile(Id,WebSite,Email,Pager,NumPager,Icq);
//          	DeleteFile(rs.getString(1),rs.getString(13),rs.getString(9),rs.getString(7),rs.getString(8),rs.getString(10));
          }
          stmt.executeUpdate(SEARCH);
          long elapsed = System.currentTimeMillis()-startMS;

          out.println("<br><h4>Delete "+Number+" Row complete in "+elapsed+ " mS</i></h4>"/*+DELETEFILE+Id+WebSite+Email+Pager+NumPager+Icq*/);
          out.println("</html>");
        }
      }
    } catch ( SQLException e ) {
      System.err.println("A database error occurred.");
    } catch (Exception e) {
      out.println("Exception");
    }
  }
    //---------------------Response User------------
//    out.println("<br>"+SEARCH);
}

  public void DeleteFile(String id,String Url,String Email,String Pager,String NumPager,String Icq) {
			Runtime r = Runtime.getRuntime();

			try
			{
 				r.exec("java modifyFile Delete "+id+" "+Url+"; "+Email+"; "+Pager+"; "+NumPager+"; "+Icq+"; t;");
			}
			catch (Exception e)
			{
				System.out.println(e);
			}
  }

  //-------------------Distroy----------------------
  public void destroy() {
  try {
 // close the database connection
   if ( conn != null) conn.close();
   } catch (SQLException e) {
     System.err.println("Error closing database connection.");
   }
  } // destroy
}

