import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class GetHomeDetailS extends HttpServlet
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

 	String ProjectId="";
  String PositionX="";
  String PositionY="";
  String HomeId="";
  String HomeNumber="";
  String Amphur="";
  String Province="";
  String HomeType="";
  String Status="";
  String Position="";
  String Floor="";
  String Bedroom="";
  String Bathroom="";
  String Kitchen="";
  String Area = "";
  String Price="";
  PositionX=req.getParameter("POSITIONX");
  PositionY=req.getParameter("POSITIONY");
  ProjectId=req.getParameter("PROJECTID");


 //--------------------------Data Base-------------------------------

	try {
        //---- Create a Statement ----
        Statement stmt = conn.createStatement ();
        ResultSet rset;
        rset = stmt.executeQuery("SELECT homeid,homenumber,hamphur,hprovince,area,floor,bedroom,kitchenroom,bathroom,price,statusReserv,hometype FROM home WHERE xposition='"+PositionX+"' and yposition = '"+PositionY+"' and projectid= '"+ProjectId+"'");
        rset.next();
        HomeId = rset.getString(1);
        HomeNumber = rset.getString(2);
        Amphur=rset.getString(3);
        Province=rset.getString(4);
        Area = rset.getString(5);
        Floor=rset.getString(6);
        Bedroom=rset.getString(7);
        Kitchen=rset.getString(8);
        Bathroom=rset.getString(9);
        Price=rset.getString(10);
        Status=rset.getString(11);
        HomeType=rset.getString(12); 

        res.setContentType("text/html;charset=windows-874");
        PrintWriter out = res.getWriter();
        out.println(HomeId+";"+HomeNumber+";"+Amphur+";"+Province+";"+Area+";"+Floor+";"+Bedroom+";"+Kitchen+";"+Bathroom+";"+Price+";"+HomeType+";"+Status);

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

