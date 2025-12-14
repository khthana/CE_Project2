import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Page5 extends HttpServlet {
static String u;
static String p;
public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException {
res.setContentType("text/html");
PrintWriter out = res.getWriter();
HttpSession session=req.getSession(true);
HttpSession session2=req.getSession(true);
String Parameter = "fd";
String Column = "fd";
String Username=(String)session.getValue("Username");
String Password=(String)session.getValue("Password");
String xyz ="sdf";
String pp ="sdf";
String cc ="sdf";
String pp2 ="sdf";
String cc2 ="sdf";
String pp3 ="sdf";
String cc3 ="sdf";
String pp4 ="sdf";
String cc4 ="sdf";
String pp5 ="sdf";
String cc5 ="sdf";

String Goods=(String)session.getValue("Goods");
int GoodsInt = (new Integer(Goods)).intValue();
String stmtTmpt = "CREATE TABLE " + Username + "Message (MessageID auto,Sender text,Subject text,Message text,DateTimer text,New text)";
try
{
	performQuery(stmtTmpt);
}
catch (Exception abcdfsd)
{
}
System.out.println(stmtTmpt);
        for (int tableCount = 0; tableCount < GoodsInt; tableCount++){
        int parameterCount = tableCount + 1;
        String Goodsname=(String)session.getValue("Goodsname" + parameterCount);
        String Parameterja=(String)session.getValue("Parameter" + parameterCount);
        int ParameterInt = (new Integer(Parameterja)).intValue();


        String stmtTmp="CREATE TABLE ";
        String stmtTmp2="INSERT INTO ";

        
        stmtTmp=stmtTmp + Username + "_" + Goodsname + "(";
        stmtTmp2=stmtTmp2 + Username + "_" + Goodsname + " VALUES ('";
        String stmtTmp3 = stmtTmp2;

                for (int columnCount = 0; columnCount < ParameterInt; columnCount++){
                int columnCount2 = columnCount + 1;
                Parameter=(String)session.getValue("Parameter" + parameterCount + columnCount2);

                stmtTmp = stmtTmp + Parameter + " text,";

                }
                stmtTmp = stmtTmp + "In text,Out text,Total text)";
                
                
         try {
        performQuery(stmtTmp);}
               catch (Exception ex) {
               ex.printStackTrace();
               }
System.out.println(stmtTmp);





         if (ParameterInt == 1)
         {
         pp=(String)session.getValue("Parameter" + parameterCount + "1");
         cc=(String)session.getValue("Column" + parameterCount + "1");
         int ccInt = (new Integer(cc)).intValue();
         for (int ccc = 0; ccc < ccInt; ccc++){
         int cccc = ccc + 1;
         xyz = req.getParameter(Goodsname + "_" + pp + cccc);
         stmtTmp2 = stmtTmp2 + xyz + "','0','0','0')";
         try {
        performQuery(stmtTmp2);}
               catch (Exception ex2) {
               }
         System.out.println(stmtTmp2);
         stmtTmp2 = stmtTmp3;
         }
         }
         else if (ParameterInt == 2)
         {
         pp=(String)session.getValue("Parameter" + parameterCount + "1");
         cc=(String)session.getValue("Column" + parameterCount + "1");
         int ccInt = (new Integer(cc)).intValue();
         for (int ccc = 0; ccc < ccInt; ccc++){
         int cccc = ccc + 1;
         xyz = req.getParameter(Goodsname + "_" + pp + cccc);
         stmtTmp2 = stmtTmp2 + xyz + "','";
         String ss2 = stmtTmp2; 
         pp2=(String)session.getValue("Parameter" + parameterCount + "2");
         cc2=(String)session.getValue("Column" + parameterCount + "2");
         int ccInt2 = (new Integer(cc2)).intValue();
         for (int ccc2 = 0; ccc2 < ccInt2; ccc2++){
         int cccc2 = ccc2 + 1;
         xyz = req.getParameter(Goodsname + "_" + pp2 + cccc2);
         stmtTmp2 = stmtTmp2 + xyz + "','0','0','0')";
         try {
        performQuery(stmtTmp2);}
               catch (Exception ex3) {
               }
        System.out.println(stmtTmp2);
		 stmtTmp2 = ss2;
         }stmtTmp2 = stmtTmp3;
         }
         }

         else if (ParameterInt == 3)
         {

         pp=(String)session.getValue("Parameter" + parameterCount + "1");
         cc=(String)session.getValue("Column" + parameterCount + "1");
         int ccInt = (new Integer(cc)).intValue();
         for (int ccc = 0; ccc < ccInt; ccc++){
         int cccc = ccc + 1;
         xyz = req.getParameter(Goodsname + "_" + pp + cccc);
         stmtTmp2 = stmtTmp2 + xyz + "','";
         String ss3 = stmtTmp2;
         pp2=(String)session.getValue("Parameter" + parameterCount + "2");
         cc2=(String)session.getValue("Column" + parameterCount + "2");
         int ccInt2 = (new Integer(cc2)).intValue();
         for (int ccc2 = 0; ccc2 < ccInt2; ccc2++){
         int cccc2 = ccc2 + 1;
         xyz = req.getParameter(Goodsname + "_" + pp2 + cccc2);
         stmtTmp2 = stmtTmp2 + xyz + "','";
         String ss4 = stmtTmp2;
         pp3=(String)session.getValue("Parameter" + parameterCount + "3");
         cc3=(String)session.getValue("Column" + parameterCount + "3");
         int ccInt3 = (new Integer(cc3)).intValue();
         for (int ccc3 = 0; ccc3 < ccInt3; ccc3++){
         int cccc3 = ccc3 + 1;
         xyz = req.getParameter(Goodsname + "_" + pp3 + cccc3);
         stmtTmp2 = stmtTmp2 + xyz + "','0','0','0')";
         try {
        performQuery(stmtTmp2);}
               catch (Exception ex3) {
               }
          System.out.println(stmtTmp2);
		 stmtTmp2 = ss4;
         }stmtTmp2 = ss3;
         }stmtTmp2 = stmtTmp3;
         }
         }
         else if (ParameterInt == 4)
         {
         pp=(String)session.getValue("Parameter" + parameterCount + "1");
         cc=(String)session.getValue("Column" + parameterCount + "1");
         int ccInt = (new Integer(cc)).intValue();
         for (int ccc = 0; ccc < ccInt; ccc++){
         int cccc = ccc + 1;
         xyz = req.getParameter(Goodsname + "_" + pp + cccc);
         stmtTmp2 = stmtTmp2 + xyz + "','";
         String ss5 = stmtTmp2;
         pp2=(String)session.getValue("Parameter" + parameterCount + "2");
         cc2=(String)session.getValue("Column" + parameterCount + "2");
         int ccInt2 = (new Integer(cc2)).intValue();
         for (int ccc2 = 0; ccc2 < ccInt2; ccc2++){
         int cccc2 = ccc2 + 1;
         xyz = req.getParameter(Goodsname + "_" + pp2 +cccc2);
         stmtTmp2 = stmtTmp2 + xyz + "','";
         String ss6 = stmtTmp2;
         pp3=(String)session.getValue("Parameter" + parameterCount + "3");
         cc3=(String)session.getValue("Column" + parameterCount + "3");
         int ccInt3 = (new Integer(cc3)).intValue();
         for (int ccc3 = 0; ccc3 < ccInt3; ccc3++){
         int cccc3 = ccc3 + 1;
         xyz = req.getParameter(Goodsname + "_" + pp3 + cccc3);
         stmtTmp2 = stmtTmp2 + xyz + "','";
         String ss7 =stmtTmp2;
         pp4=(String)session.getValue("Parameter" + parameterCount + "4");
         cc4=(String)session.getValue("Column" + parameterCount + "4");
         int ccInt4 = (new Integer(cc4)).intValue();
         for (int ccc4 = 0; ccc4 < ccInt4; ccc4++){
         int cccc4 = ccc4 + 1;
         xyz = req.getParameter(Goodsname + "_" + pp4 + cccc4);
         stmtTmp2 = stmtTmp2 + xyz + "','0','0','0')";
         try {
        performQuery(stmtTmp2);}
               catch (Exception ex4) {
               }
         System.out.println(stmtTmp2);
		 
         stmtTmp2 = ss7;
		 }stmtTmp2 = ss6;
         }stmtTmp2 = ss5;
         }stmtTmp2 = stmtTmp3;
         }
         }




         else
         {
         pp=(String)session.getValue("Parameter" + parameterCount + "1");
         cc=(String)session.getValue("Column" + parameterCount + "1");
         int ccInt = (new Integer(cc)).intValue();
         for (int ccc = 0; ccc < ccInt; ccc++){
         int cccc = ccc + 1;
         xyz = req.getParameter(Goodsname + "_" + pp + cccc);
         stmtTmp2 = stmtTmp2 + xyz + "','";
         String ss8 =stmtTmp2;
         pp2=(String)session.getValue("Parameter" + parameterCount + "2");
         cc2=(String)session.getValue("Column" + parameterCount + "2");
         int ccInt2 = (new Integer(cc2)).intValue();
         for (int ccc2 = 0; ccc2 < ccInt2; ccc2++){
         int cccc2 = ccc2 + 1;
         xyz = req.getParameter(Goodsname + "_" + pp2 + cccc2);
         stmtTmp2 = stmtTmp2 + xyz + "','";
         String ss9 = stmtTmp2;
         pp3=(String)session.getValue("Parameter" + parameterCount + "3");
         cc3=(String)session.getValue("Column" + parameterCount + "3");
         int ccInt3 = (new Integer(cc3)).intValue();
         for (int ccc3 = 0; ccc3 < ccInt3; ccc3++){
         int cccc3 = ccc3 + 1;
         xyz = req.getParameter(Goodsname + "_" + pp3 + cccc3);
         stmtTmp2 = stmtTmp2 + xyz + "','";
         String ss10 = stmtTmp2;
         pp4=(String)session.getValue("Parameter" + parameterCount + "4");
         cc4=(String)session.getValue("Column" + parameterCount + "4");
         int ccInt4 = (new Integer(cc4)).intValue();
         for (int ccc4 = 0; ccc4 < ccInt4; ccc4++){
         int cccc4 = ccc4 + 1;
         xyz = req.getParameter(Goodsname + "_" + pp4 + cccc4);
         stmtTmp2 = stmtTmp2 + xyz + "','";
         String ss11 = stmtTmp2;
         pp5=(String)session.getValue("Parameter" + parameterCount + "5");
         cc5=(String)session.getValue("Column" + parameterCount + "5");
         int ccInt5 = (new Integer(cc5)).intValue();
         for (int ccc5 = 0; ccc5 < ccInt5; ccc5++){
         int cccc5 = ccc5 + 1;
         xyz = req.getParameter(Goodsname + "_" + pp5 + cccc5);
         stmtTmp2 = stmtTmp2 + xyz + "','0','0','0')";
         try {
        performQuery(stmtTmp2);}
               catch (Exception ex5) {
               }
       System.out.println(stmtTmp2);
   	   stmtTmp2 = ss11;
         }stmtTmp2 = ss10;
         }stmtTmp2 = ss9;
         }stmtTmp2 = ss8;
         }stmtTmp2 = stmtTmp3;
         }
         }



            

     }
out.println("<html><head><title>Page 1 </title></head><body><FORM METHOD=GET ACTION=\"http://161.246.5.120:8080/servlet/Page11\"><b>USERNAME:</b><input type = text name=Username size = 10 ><br><b>PASSWORD:</b><input type = password name=Password size = 10 ><br><b>Enter Here To Login</b><br><input type = submit value = \"Login\"></FORM>");
out.println("<FORM METHOD=GET ACTION=\"http://161.246.5.120:8080/servlet/Page12\"><b>If you don't have password. Please Signin</b><br><input type = submit value = \"Signin\"></FORM></body></html>");


      }

public static void performQuery(String aa) throws Exception {
        String driverName = "sun.jdbc.odbc.JdbcOdbcDriver";
        String connectionURL = "jdbc:odbc:userp";
        Connection con = null;
        Statement stmt = null;
        String sqlStatement =aa;

        ResultSet rs = null;
      
        Class.forName(driverName).newInstance();

        con = DriverManager.getConnection(connectionURL);
        stmt = con.createStatement();
        rs = stmt.executeQuery(sqlStatement);

                 }
                 }













