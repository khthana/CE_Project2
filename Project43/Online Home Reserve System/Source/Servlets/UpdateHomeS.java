import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class UpdateHomeS extends HttpServlet
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

//-------------------------------Get Method------------------------------

public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

 	String HOMEID="";
  String HOMENUMBER="";
  String HAMPHUR="";
  String HPROVINCE="";
  String AREA="";
  String FLOOR="";
  String BEDROOM="";
  String KITCHEN="";
  String BATHROOM="";
  String PRICE="";
  String XPOSITION ="";
  String YPOSITION="";
  String STATUSRESERV="";
  String HOMETYPE="";
  String PROJECTID="";
 	//----------------------get Data Session---------------
  HOMEID=req.getParameter("HOMEID");
  HOMENUMBER=req.getParameter("HOMENUMBER");
  HAMPHUR=req.getParameter("HAMPHUR");
  HPROVINCE=req.getParameter("HPROVINCE");
  AREA=req.getParameter("AREA");
  FLOOR=req.getParameter("FLOOR");
  BEDROOM=req.getParameter("BEDROOM");
  KITCHEN=req.getParameter("KITCHENROOM");
  BATHROOM=req.getParameter("BATHROOM");
  PRICE=req.getParameter("PRICE");
  XPOSITION =req.getParameter("XPOSITION");
  YPOSITION=req.getParameter("YPOSITION");
  STATUSRESERV=req.getParameter("STATUSRESERV");
  HOMETYPE=req.getParameter("HOMETYPE");
  PROJECTID=req.getParameter("PROJECTID");

 //--------------------------Data Base-------------------------------

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
/*        stmt.executeUpdate("INSERT INTO  home VALUES ("+"'"+HOMEID+"'"+",'"+HOMENUMBER+"','"+HAMPHUR+"','"+HPROVINCE+"','"+
                             AREA+"','"+FLOOR+"','"+BEDROOM+"','"+KITCHEN+"','"+BATHROOM+"','"+PRICE+"','"+XPOSITION+"','"+YPOSITION+"','"+STATUSRESERV+"','"+HOMETYPE+")");*/
         stmt.executeUpdate("UPDATE home SET homeid ="+"'"+HOMEID+"',homenumber='"+HOMENUMBER+"',hamphur='"+HAMPHUR+"',hprovince='"+HPROVINCE+"',area='"+AREA+"',floor='"+FLOOR+"',bedroom='"+BEDROOM+"',kitchenroom='"+KITCHEN+"',bathroom='"+BATHROOM+"',price='"+PRICE+"',xposition='"+XPOSITION+"',yposition='"+YPOSITION+"',statusreserv = '"+STATUSRESERV+"', hometype='"+HOMETYPE+"' WHERE projectid = '"+PROJECTID+"' and xposition='"+XPOSITION+"' and yposition = '"+YPOSITION+"'");

        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
       out.println(HOMEID+"/"+HOMENUMBER+"/"+HAMPHUR+"/"+HPROVINCE+"/"+AREA+"/"+FLOOR+"/"+BEDROOM+"/"+KITCHEN+"/"+BATHROOM+"/"+PRICE+"/"+XPOSITION+"/"+YPOSITION+"/"+STATUSRESERV+"/"+HOMETYPE+"/"+PROJECTID);












      } catch ( SQLException e ) {
        System.err.println("A database error occurred.");
      }


  } //doGet



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

