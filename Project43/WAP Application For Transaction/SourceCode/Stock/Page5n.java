import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Page5n extends HttpServlet {
static String u;
static String p;
public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException {
res.setContentType("text/html");
PrintWriter out = res.getWriter();
HttpSession session=req.getSession(true);
String Parameter = "fd";
String Column = "fd";
String Username=(String)session.getValue("Username");

String Goods=(String)session.getValue("Goods");
int GoodsInt = (new Integer(Goods)).intValue();


        for (int tableCount = 0; tableCount < GoodsInt; tableCount++){
        int parameterCount = tableCount + 1;
        String Goodsname=(String)session.getValue("Goodsname" + parameterCount);

        String ParameterN=(String)session.getValue("Parameter" + parameterCount);
        int ParameterInt = (new Integer(ParameterN)).intValue();

                for (int columnCount = 0; columnCount < ParameterInt; columnCount++){
                int columnCount2 = columnCount + 1;
                String N_G=(String)session.getValue("N_Goodsname" + parameterCount + "_" + columnCount2);
                int N_GInt = (new Integer(N_G)).intValue();
                String NGO=(String)session.getValue("Goodsname" + parameterCount + "_" + columnCount2);


String Ssql = "create table " + Username + "_" + Goodsname + "_" + NGO + "(Kind text)";
try {performQuery(Ssql);}
catch (Exception exc){}



                for (int NCount = 0; NCount < N_GInt; NCount++){
                int N_GInt2 = NCount + 1;

        String aa = req.getParameter("Goodsname" + parameterCount + "_N" + columnCount2 + "_T" + N_GInt2);
        session.putValue("Goodsname" + parameterCount + "_N" + columnCount2 + "_T" + N_GInt2,aa);
Ssql = "insert into " + Username + "_" + Goodsname + "_" + NGO + " values('" + aa + "')";
try {performQuery(Ssql);}
catch (Exception excp){}


                  }
                  }
                  }  

out.println("<html><head><title>Input Type </title></head><body><FORM METHOD=GET ACTION=\"http://localhost:8080/servlet/Page6n\"><b>SPECIFIC SIGN:</b><br>");
out.println("<input type = text name=Spec1 size = 10 ><br><input type = text name=Spec2 size = 10 ><br><input type = text name=Spec3 size = 10 >");
out.println("<br><b>DYNAMIC VALUE:</b><br><input type = text name=Dyna1 size = 10 ><br><input type = text name=Dyna2 size = 10 ><br><input type = text name=Dyna3 size = 10 ><br><input type = text name=Dyna4 size = 10 ><br><input type = text name=Dyna5 size = 10 >");
out.println("<br><b>DYNAMIC CALCULATE:</b><br><input type = text name=Cal1 size = 10 ><b>  MEANING:<input type = text name=Mean1 size = 10 ><br><input type = text name=Cal2 size = 10 ><b>  MEANING:<input type = text name=Mean2 size = 10 ><br><input type = text name=Cal3 size = 10 ><b>  MEANING:<input type = text name=Mean3 size = 10 ><br><input type = text name=Cal4 size = 10 ><b>  MEANING:<input type = text name=Mean4 size = 10 >");
out.println("<br><hr><b>COMMENT: </b><br><TextArea name=Comment2 rows = 10 Cols = 40></TextArea><hr><b>CHECK YOUR DATA BEFORE ClICK SUBMIT</b><br><input type = submit value = \"SUBMIT\"</FORM></body></html>");

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













