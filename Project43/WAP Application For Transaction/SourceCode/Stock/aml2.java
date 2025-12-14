import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.lang.Math;

public class aml2 extends HttpServlet {
static String u;
static String p;
static String Knot;
public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException{
ServletOutputStream out = res.getOutputStream();
res.setContentType("text/vnd.wap.wml");
HttpSession session=req.getSession(true);

 u = req.getParameter("Username");
 p = req.getParameter("Password");
session.putValue("Username",u);
session.putValue("Password",p);


String Ssql ="select Password from Admin where Username = '" + u + "'";
try {performQuery(Ssql);}
catch (Exception ec){}
if (Knot.equals(p))
{


System.out.println("knot" + u + p);

System.out.println("YOKO");
out.println("<?xml version=\"1.0\"?>");
out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
out.println("<card id=\"Card2\" title=\"Select Goods\">");
out.println("<do type=\"accept\" label=\"Next\"><go href=\"http://localhost:8080/servlet/aml3\">");
out.println("<postfield name=\"Goods\" value=\"$Goods\" />");
out.println("</go></do><p align=\"center\">Select Goods You want to do.<br/>");
out.println("<select name=\"Goods\" multiple=\"false\">");

System.out.println("<?xml version=\"1.0\"?>");
System.out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
System.out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
System.out.println("<card id=\"Card2\" title=\"Select Goods\">");
System.out.println("<do type=\"accept\" label=\"Next\"><go href=\"http://localhost:8080/servlet/aml3\">");
System.out.println("<postfield name=\"Goods\" value=\"$Goods\" />");
System.out.println("</go></do><p align=\"center\">Select Goods You want to do.<br/>");
System.out.println("<select name=\"Goods\" multiple=\"false\">");


Ssql ="select Goods from Admin where Username = '" + u + "'";
try {performQuery(Ssql);}
catch (Exception effc){}

int KnotInt = (new Integer(Knot)).intValue();
     for (int tableCount = 0; tableCount < KnotInt; tableCount++){
     int parameterCount = tableCount + 1;
     Ssql = "select Goods from " + u ;
                try {performQuery2(Ssql,parameterCount,1);}
                catch (Exception edc){}

out.println("<option value=\"" + Knot + "\" > " + Knot + " </option>");
System.out.println("<option value=\"" + Knot + "\" > " + Knot + " </option>");
      

}
out.println("</select></p></card></wml>");
System.out.println("</select></p></card></wml>");

}
  }
public static void performQuery(String aa) throws Exception {
        String driverName = "sun.jdbc.odbc.JdbcOdbcDriver";
        String connectionURL = "jdbc:odbc:userp";
        Connection con = null;
        Statement stmt = null;
        String sqlStatement = aa;
        ResultSet rs = null;

        try {
  
        Class.forName(driverName).newInstance();

        con = DriverManager.getConnection(connectionURL);
        stmt = con.createStatement();
        rs = stmt.executeQuery(sqlStatement);
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();

        System.out.println(" ");
        String line = " ";
        for (int i = 0; i < columnCount; i++)
        {
                if (i > 0)
                {line += ", ";}
                line += rsmd.getColumnLabel(i + 1);
        }
      //   System.out.println(line);
         int rowCount = 0;


         while (rs.next())
         {
                rowCount++;
                line = "";
                         for (int i = 0; i < columnCount; i++)
                         {
                         if (i > 0)
                          {line += "";}
                          line += rs.getString(i + 1);
                         Knot = line;
                         }
            //    System.out.println(line);
         }
        }
         finally {
         if (rs != null) {
         rs.close();
         }
         if (stmt != null) {
         stmt.close();
         }
         if (con != null) {
         con.close();
         }
    

         }
         }

        public static void performQuery2(String aa,int bb,int cc) throws Exception {
        String driverName = "sun.jdbc.odbc.JdbcOdbcDriver";
        String connectionURL = "jdbc:odbc:userp";
        Connection con = null;
        Statement stmt = null;
        String sqlStatement = aa;
        ResultSet rs = null;

        try {
  
        Class.forName(driverName).newInstance();

        con = DriverManager.getConnection(connectionURL);
        stmt = con.createStatement();
        rs = stmt.executeQuery(sqlStatement);
        ResultSetMetaData rsmd = rs.getMetaData();
        int columnCount = rsmd.getColumnCount();
        String line = "asd";
        for (int ii = 0; ii < bb; ii++)
        {
                rs.next();
        }
                  
         line = rs.getString(cc);//column of answer
         Knot = line;                
          System.out.println(line);
         
        }
         finally {
         if (rs != null) {
         rs.close();
         }
         if (stmt != null) {
         stmt.close();
         }
         if (con != null) {
         con.close();
         }
         }
         }






}

