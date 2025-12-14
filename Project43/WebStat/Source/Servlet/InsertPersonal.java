import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class InsertPersonal extends HttpServlet
implements SingleThreadModel {

private Connection conn = null;
private ResultSet Id = null;

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
  String New = "SELECT count(*) FROM register;";
  String NewId = "SELECT Id FROM register WHERE Id >= All(SELECT Id FROM register);";
  int Number=0;

	String Status="";
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
	String ConfirmPwd="";

	Sex=req.getParameter("rbutton");
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
	ConfirmPwd=req.getParameter("txConfirmpwd");

 //--------------------------Data Base-------------------------------

			Runtime r = Runtime.getRuntime();
	PrintWriter out = res.getWriter();

  HttpSession session = req.getSession(true);
  String adminlogin = (String)session.getValue("Adminname");
  String passwdlogin = (String)session.getValue("Adminpass");

  if ((!(adminlogin.equals("admin")))||(!(passwdlogin.equals("admin")))) {
    out.println("<html><head><body> Login Failed ....! </body></html>");
  } else {

    if ((Sex==null)||(Name.equals(""))||(Surname.equals(""))||(Address.equals(""))||(Phone.equals(""))||(Icq.equals(""))
        ||(Pager.equals(""))||(NumPager.equals(""))||(WebSite.equals(""))||(Email.equals(""))||(Username.equals(""))) {
      out.println("<html><head><title>Data is missed...!</title></head><body><H1>Please, put data ...!<br>"+
      "You should back to re-put Data again.</h1></body></html>");
  }
  else {
  if ((!Password.equals(ConfirmPwd))||(Password.equals(""))) {
  	out.println(Password);
	  out.println(ConfirmPwd);
  	out.println("<html><head><title>Password Failed...!</title></head><body><H1>Password Failed...!<br>"+
    "You should back to re-input password again.</h1></body></html>");
    }
    else {
      if (Sex.equals("rMr")) Status = "Mr";
      else if (Sex.equals("rMs")) Status = "Mis";
      else Status = "Miss";
   	  try {
        Statement stmt = conn.createStatement();
       // insert row
        Id = stmt.executeQuery(New);
        Id.next();
        Number = Id.getInt(1);
        if (Number == 0) Number = 1;
        else {
          Id = stmt.executeQuery(NewId);
          Id.next();
          Number = Id.getInt(1);
          Number++;
        }
//				r.exec("java modifyFile Insert "+Number+"; "+WebSite+"; "+Email+"; "+Pager+"; "+NumPager+"; "+Icq+"; t;");
      	writeFile(Number,WebSite,Email,Pager,NumPager,Icq);
//       stmt.executeUpdate("INSERT INTO Table1 VALUES ('"+Number+"','a','b')");
   	    stmt.executeUpdate("INSERT INTO register VALUES ("+"'"+Number+"'"+",'"+Name+"'"+",'"+Surname+"'"+",'"+Status+"'"+",'"
                                                           +Address+"'"+",'"+Phone+"'"+",'"+Pager+"'"+",'"+NumPager+"'"+",'"
	 										                                     +Email+"'"+",'"+Icq+"'"+",'"+Username+"'"+",'"+Password+"'"+",'"+WebSite+"')");
//      stmt.executeUpdate("INSERT INTO register VALUES ('3','a','s','male','10','589','123','kl','name','ConfirmPwd','eak')");
      } catch ( SQLException e ) {
      System.err.println("A database error occurred.");
      }
    //---------------------Response User------------

    res.setContentType("text/html");
	  out.println("Register Complete");
    }
  }
  }
}

  public void writeFile(int id,String Url,String Email,String Pager,String NumPager,String Icq) {
			Runtime r = Runtime.getRuntime();

      String account = Integer.toString(id);
			try
			{
        r.exec("java sendCode "+Email+" s1013562@ce.kmitl.ac.th  161.246.4.3  false "+account+" "+Url);
// 				r.exec("java modifyFile Insert 1 eak; lan; 152; 134461; 45612378; t;");
 				r.exec("java modifyFile Insert "+account+" "+Url+"; "+Email+"; "+Pager+"; "+NumPager+"; "+Icq+"; t;");
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


