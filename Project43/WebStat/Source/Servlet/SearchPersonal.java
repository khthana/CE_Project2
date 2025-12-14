import java.sql.*;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class SearchPersonal extends HttpServlet
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

  String SEARCH = "SELECT * FROM register WHERE ";
  int rowCount=0;
  boolean flag=false;
//  int LenString=0;
//  int TempLen=0;

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
  String Bottom="";

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
  Bottom=req.getParameter("hidden");

  long startMS = System.currentTimeMillis();

	PrintWriter out = res.getWriter();
  res.setContentType("text/html");
////////////////
    HttpSession session = req.getSession(true);
    String adminlogin = (String)session.getValue("Adminname");
    String passwdlogin = (String)session.getValue("Adminpass");

    if ((!(adminlogin.equals("admin")))||(!(passwdlogin.equals("admin")))) {
      out.println("<html><head><body> Login Failed ....! </body></html>");
    } else {
//////////////////
	try {
    if (!(Bottom.equals("Search"))) {
      SEARCH = SEARCH.substring(0,SEARCH.lastIndexOf(" WHERE "))+";";
    } else {
      if ((Sex==null)&&(Id.equals(""))&&(Name.equals(""))&&(Surname.equals(""))&&(Address.equals(""))&&(Phone.equals(""))
        &&(Pager.equals(""))&&(NumPager.equals(""))&&(WebSite.equals(""))&&(Icq.equals(""))&&(Email.equals(""))&&(Username.equals(""))) {
        flag = true;
        out.println("<html><head><title>Data is missed...!</title></head><body><H1>Please, put data ...!<br>"+
        "You should back to re-put Data again.</h1></body></html>");
      } else {
        if (!(Sex==null)) {
          if (Sex.equals("rMr")) Status = "Mr";
          else if (Sex.equals("rMs")) Status = "Mis";
          else if (Sex.equals("rMrs")) Status = "Miss";
        }
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
      }
    }
      if(!flag) {
       // Create a Statement
        out.println("<html><head>");
        out.println("<title>Result Search</title>");
        out.println("</head>");
        out.println("<h2><center> Search Result Detail");
        out.println("</center></h2><br>");

        Statement stmt = conn.createStatement();
        rs = stmt.executeQuery(SEARCH);
        rowCount = createTable(rs,out);
        long elapsed = System.currentTimeMillis()-startMS;
        out.println("<br><h4>Total 0f Result = <i>"+rowCount+" rows in "+elapsed+ " mS</i></h4>");
        out.println("</html>");
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
  //-------------------Distroy----------------------

  private int createTable(java.sql.ResultSet rs,java.io.PrintWriter out) throws Exception {
    int rowCount = 0;

    out.println("<center><table border>");

    ResultSetMetaData rsmd = rs.getMetaData();
    int columnCount = rsmd.getColumnCount();

    columnCount--;
    out.println("<tr>");

    for(int i=0;i<columnCount;i++)
      out.println("<th>"+rsmd.getColumnLabel(i+2)+"</tr>");

    while(rs.next()) {
      rowCount++;
      out.println("<tr>");
      for(int i=0;i<columnCount;i++)
        out.println("<td>"+rs.getString(i+2)+"</td>");
      out.println("</tr>");
    }
    out.println("</table></center>");

    return rowCount;
  }

  public void destroy() {
  try {
 // close the database connection
   if ( conn != null) conn.close();
   } catch (SQLException e) {
     System.err.println("Error closing database connection.");
   }
  } // destroy
}

