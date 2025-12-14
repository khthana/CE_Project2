import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.lang.Math;

public class aml3 extends HttpServlet {
static String u;
static String p;
static String Knot;
public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException{
ServletOutputStream out = res.getOutputStream();
res.setContentType("text/vnd.wap.wml");
HttpSession session=req.getSession(true);

String Goods = req.getParameter("Goods");
session.putValue("Goods",Goods);
String Username=(String)session.getValue("Username");
String Ssql = "select NoParameter from " + Username + " where Goods = '" + Goods + "'";
try {performQuery2(Ssql,1,1);}
catch (Exception exp){}
session.putValue("NoParameter",Knot);

out.println("<?xml version=\"1.0\"?>");
out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
out.println("<card id=\"Cardselect\" title=\"Select Parameter\">");
out.println("<do type=\"accept\" label=\"Next\">");
out.println("<go href=\"http://localhost:8080/servlet/aml4\">");

System.out.println("<?xml version=\"1.0\"?>");
System.out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
System.out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
System.out.println("<card id=\"Cardselect\" title=\"Select Parameter\">");
System.out.println("<do type=\"accept\" label=\"Next\">");
System.out.println("<go href=\"http://localhost:8080/servlet/aml4\">");


Ssql = "select * from " + Username + "_" + Goods;
int KnotInt = (new Integer(Knot)).intValue();
     for (int tableCount = 0; tableCount < KnotInt; tableCount++){
     int parameterCount = tableCount + 1;
                try {performQuery2(Ssql,parameterCount,1);}
                catch (Exception exp){}
out.println("<postfield name=\"Parameter" + parameterCount + "\" value=\"$" + Knot + "\" />");
System.out.println("<postfield name=\"Parameter" + parameterCount + "\" value=\"$" + Knot + "\" />");

     }
out.println("</go></do><p align=\"center\">");
System.out.println("</go></do><p align=\"center\">");

     for (int tCount = 0; tCount < KnotInt; tCount++){
     int pCount = tCount + 1;
          try {performQuery2(Ssql,pCount,1);}
          catch (Exception exp2){}
          out.println(Knot + "<select name =\"" + Knot + "\" title = \"" + Knot + "\" multiple=\"false\">");
          String Knot2=Knot;
          try {performQuery2(Ssql,pCount,2);}
          catch (Exception exp3){}
          int KnotInt2 = (new Integer(Knot)).intValue();
          String Ssql2="select * from " + Username + "_" + Goods + "_" + Knot2;

            for (int tCount2 = 0; tCount2 < KnotInt2; tCount2++){
              int pCount2 = tCount2 + 1;
              try {performQuery2(Ssql2,pCount2,1);}
              catch (Exception exp4){}
              out.println("<option  value=\"" + Knot + "\"> " + Knot + "</option>");
              System.out.println("<option  value=\"" + Knot + "\"> " + Knot + "</option>");

             }

          out.println("</select>");
          System.out.println("</select>");

      }
out.println("</p></card></wml>"); 
System.out.println("</p></card></wml>"); 

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

