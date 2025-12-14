// You need to import the java.sql package to use JDBC
import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
//import oracle.html.*; // import Oracle HTML classes which deal with HTML
public class FormSuggest extends HttpServlet
implements SingleThreadModel {
private Connection conn = null;
public void init( ServletConfig config ) throws ServletException {
super.init(config);
try {
Class.forName ("oracle.jdbc.driver.OracleDriver");
conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:PROJECT","scott","tiger");
} catch ( SQLException e ) {
System.err.println("Could not establish connection.");
} catch ( ClassNotFoundException e ) {
System.err.println("Could not load database driver.");
}
} // init
//---------------------------GetMethod--------------------------------
public void doGet(
 HttpServletRequest req,
 HttpServletResponse res )
throws ServletException, IOException {
String []c1 =new String[100];
boolean bb=false;
try {
// Get Type Cartoon For Select Name
String name = req.getParameter("name");
// Create a Statement
Statement stmt = conn.createStatement ();
// Select the ENAME column from the EMP table
ResultSet rset = stmt.executeQuery("select * from Cartoon_new");
// Get data to variable
  int i=1,j;
  bb = rset.next();
  while(bb){
        c1[i]=rset.getString(1);
        bb = rset.next();
        i++;
  }
  j=i-1;
    res.setContentType("text/html");
    PrintWriter out = res.getWriter();
    out.println("<html>");
    out.println("<head><title>Edit Suggest</title></head>");
  	out.println("<body bgcolor=\"#326698\">");
    out.println("<b>Select Book For Remove</b><br>");
    out.println("<form method=get action=\"http://myproject/jservlets/RemoveSuggest\">");
    for(i=1;i<=j;i++){
	    out.println("<input type=checkbox name=\"c"+i+"\"  value=\""+c1[i].trim()+"\">");
      out.println(i+"."+c1[i]+"<br>");
	  }
    out.println("<input type=hidden name=\"book_quantity\" value="+j+">");
  	out.println("<br><br><input type=submit name=\"inst\" value=\"Remove\">");
    out.println("<input type=reset  value=\"Reset\">");
    out.println("</form><br><br>");
    out.println("<form method=get action=\"http://myproject/jservlets/InsertSuggest\">");
		out.println("<b>Insert New Suggest Book</b><br>");
		out.println("<br>");
   	out.println("book_name:");
   	out.println("<INPUT TYPE=\"text\" NAME=\"book_name\"></center>");
   	out.println("<br><input type=submit value=\"Insert\">");
   	out.println("<INPUT type=reset value=\"Reset\">");
   	out.println("</form>");
    out.println("</body></html>");
    out.close();
 } catch ( SQLException e ) {
System.err.println("A database error occurred.");
}
} // doPost
//-------------------Distroy----------------------
public void destroy() {
 try {
 // close the database connection
  if ( conn != null) conn.close();
  } catch (SQLException e) {
     System.err.println("Error closing database connection.");
  }
 } // destroy
} // class
