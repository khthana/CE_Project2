import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.util.*;
import java.text.*;
import java.lang.Math;

public class aml4 extends HttpServlet {
static String u;
static String p;
static String Knot;
public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException{
ServletOutputStream out = res.getOutputStream();
res.setContentType("text/vnd.wap.wml");
HttpSession session=req.getSession(true);
String NoParameter=(String)session.getValue("NoParameter");
String Username=(String)session.getValue("Username");
String Goods=(String)session.getValue("Goods");

String Parameter1=req.getParameter("Parameter1");
String Parameter2=req.getParameter("Parameter2");
String Parameter3=req.getParameter("Parameter3");
String Table = Username + "_" + Goods;
int PInt = (new Integer(NoParameter)).intValue();

     for (int Count = 0; Count < PInt; Count++){
     int pCount = Count + 1;
          String xyz=req.getParameter("Parameter" + pCount);
          Table=Table + "_" + xyz;
     }
session.putValue("Table",Table);


out.println("<?xml version=\"1.0\"?>");
out.println("<!DOCTYPE wml PUBLIC \"-//WAPFORUM//DTD WML 1.1//EN\" \"http://www.wapforum.org/DTD/wml_1.1.xml\">");
out.println("<wml><template><do type=\"prev\"><prev/></do></template>");
out.println("<card id=\"Cardselect\" title=\"Select Parameter\">");
out.println("<do type=\"accept\" label=\"Next\">");
out.println("<go href=\"http://localhost:8080/servlet/aml5\">");
out.println("<postfield name=\"Transaction\" value=\"$Transaction\" />");
out.println("<postfield name=\"Amount\" value=\"$Amount\" />");

try {performQuery2("select count(*) from " + Username + "_Spec",1,1);}
catch (Exception exp){}
session.putValue("SpecX",Knot);
String WmlTmp1="";
int KnotInt = (new Integer(Knot)).intValue();
     for (int tableCount = 0; tableCount < KnotInt; tableCount++){
     int parameterCount = tableCount + 1;
     out.println("<postfield name=\"Spec" + parameterCount + "\" value=\"$Spec" + parameterCount +"\" />");
     WmlTmp1 = WmlTmp1 + "<postfield name=\"Spec" + parameterCount + "\" value=\"$Spec" + parameterCount +"\" />";
     }
try {performQuery2("select count(*) from " + Username + "_Dyna",1,1);}
catch (Exception exp){}
session.putValue("DynaX",Knot);

int KnotInt2 = (new Integer(Knot)).intValue();
     for (int tableC = 0; tableC < KnotInt2; tableC++){
     int parameterCount = tableC + 1;
     out.println("<postfield name=\"Dyna" + parameterCount + "\" value=\"$Dyna" + parameterCount +"\" />");
     WmlTmp1 = WmlTmp1 + "<postfield name=\"Dyna" + parameterCount + "\" value=\"$Dyna" + parameterCount +"\" />";
     }
out.println("</go></do><p align=\"center\">");
out.println("Transaction<select name =\"Transaction\" title = \"Transaction\" multiple=\"false\">");
out.println("<option  value=\"In\"> In</option>");
out.println("<option value=\"Out\"> Out </option>");
out.println("<option value=\"View\"> View </option></select>");
out.println("Amount<input name=\"Amount\" />"); 
String Spec ="";
String Dyna ="";
String WmlTmp2="";
     for (int tableCount = 0; tableCount < KnotInt; tableCount++){
     int parameterCount = tableCount + 1;
        try {performQuery2("select * from " + Username + "_Spec",parameterCount,1);}
        catch (Exception exp){}
        Spec = Spec + "," + Knot;
        out.println(Knot);
        WmlTmp2 = WmlTmp2 + Knot;
        session.putValue("SpecX" + parameterCount,Knot);

        out.println("<input name=\"Spec" + parameterCount +"\"/>");
        WmlTmp2 = WmlTmp2 + "<input name=\"Spec" + parameterCount +"\"/>";
        

     }
String WmlTmp3="";
     for (int tableCount = 0; tableCount < KnotInt2; tableCount++){
     int parameterCount = tableCount + 1;
        try {performQuery2("select * from " + Username + "_Dyna",parameterCount,1);}
        catch (Exception exp){}
        Dyna = Dyna + "," + Knot;
        WmlTmp3 = WmlTmp3 + Knot;
        out.println(Knot);
        session.putValue("DynaX" + parameterCount,Knot);
        WmlTmp3 = WmlTmp3 + "<input name=\"Dyna" + parameterCount +"\"/>";
        
        out.println("<input name=\"Dyna" + parameterCount +"\"/>");
     }
out.println("</p></card></wml>"); 
session.putValue("Spec",Spec);
session.putValue("Dyna",Dyna);
session.putValue("WmlTmp1",WmlTmp1);
session.putValue("WmlTmp2",WmlTmp2);
session.putValue("WmlTmp3",WmlTmp3);

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

