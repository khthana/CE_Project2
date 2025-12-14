import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.lang.Math;

public class aml6 extends HttpServlet {
static String u;
static String p;
static String Knot;
public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException{
ServletOutputStream out = res.getOutputStream();
res.setContentType("text/vnd.wap.wml");
HttpSession session=req.getSession(true);
String InsertSql=(String)session.getValue("InsertSql");


String DynaX=(String)session.getValue("DynaX");
             try {performQuery2(InsertSql,1,1);}
             catch (Exception exp){}
String WmlTmp1=(String)session.getValue("WmlTmp1");
String WmlTmp2=(String)session.getValue("WmlTmp2");
String WmlTmp3=(String)session.getValue("WmlTmp3");
String Username=(String)session.getValue("Username");
String Goods=(String)session.getValue("Goods");

String TInt3S = (String)session.getValue("TInt3S");
int TInt2 = (new Integer(TInt3S)).intValue();
String CheckNear="select Alert from " + Username + " where Goods ='" + Goods + "'";
try {performQuery2(CheckNear,1,1);}
                 catch (Exception exp){}
                 int AInt2 = (new Integer(Knot)).intValue();
                 if (TInt2 <= AInt2)
                 {

out.println("<?xml version=\"1.0\"?>");
out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
out.println("<card id=\"CardAlert2\" title=\"ALERT\">");
out.println("<do type=\"accept\" label=\"Next\">");
out.println("<go href=\"http://localhost:8080/servlet/aml7\">");
out.println("</go></do><p align=\"center\">");
out.println("Your goods are near out of stock.Please stock in.Click next.</p>");
out.println("</card></wml>");






}
else{
out.println("<?xml version=\"1.0\"?>");
out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
out.println("<card id=\"Cardselect\" title=\"Select Parameter\">");
out.println("<do type=\"accept\" label=\"Next\">");
out.println("<go href=\"http://localhost:8080/servlet/aml5\">");
out.println("<postfield name=\"Transaction\" value=\"$Transaction\" />");
out.println("<postfield name=\"Amount\" value=\"$Amount\" />");
out.println(WmlTmp1);
out.println("</go></do><p align=\"center\">");
out.println("Transaction<select name =\"Transaction\" title = \"Transaction\" multiple=\"false\">");
out.println("<option  value=\"In\"> In</option>");
out.println("<option value=\"Out\"> Out </option>");
out.println("<option value=\"View\"> View </option></select>");
out.println("Amount<input name=\"Amount\" />"); 
out.println(WmlTmp2);
out.println(WmlTmp3);
out.println("</p></card></wml>");
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

