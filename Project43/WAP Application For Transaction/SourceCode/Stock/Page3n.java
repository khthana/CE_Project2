
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Page3n extends HttpServlet {
static String u;
static String p;
public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException {
res.setContentType("text/html");
PrintWriter out = res.getWriter();
HttpSession session=req.getSession(true);
HttpSession session2=req.getSession(true);

String u=(String)session.getValue("us");
String gii=(String)session.getValue("Goods");

String Username=(String)session.getValue("Username");
String Ssql = "create table " + Username + "(Goods text,NoParameter text,Sort text,Alert text)";
try {performQuery(Ssql);}
catch (Exception ec){}


int gii2 = (new Integer(gii)).intValue();
String yy = "ad";
String aa = "abc";
String cc = "abc";
String ff = "abc";
String ee = "abc";

out.println("<HTML><HEAD><TITLE>KNOT PROJECT</TITLE></HEAD><BODY>");
out.println("<FORM METHOD=GET ACTION=\"http://localhost:8080/servlet/Page4n\">");

for (int z = 0; z < gii2; z++){
int q = z+1;
 aa = req.getParameter("Goodsname"+ q);
 cc = req.getParameter("Parameter"+q);
 ff = req.getParameter("Sort"+q);
 ee = req.getParameter("Alert"+q);
session.putValue("Alert"+q,ee);
session.putValue("Sort"+q,ff);
session.putValue("Parameter"+q,cc);
session.putValue("Goodsname"+q,aa);
int bb = (new Integer(cc)).intValue();
Ssql = "insert into " + Username + " values('" + aa + "','" + cc + "','" + ff + "','" + ee + "')";
try {performQuery(Ssql);}
catch (Exception exc){}



out.println("<h1>" + aa + "</h1>");


for (int zz = 0; zz < bb; zz++){
int qq = zz +1;

out.println("<b>PARAMETER:</b>");
out.println("<input type = text name= Goodsname" + q + "_" +  qq + " size = 10 ><br>");
out.println("<b>TYPE OF PARAMETER:");
out.println("<select name = N_Goodsname" + q + "_" + qq + ">");
out.println("<option> 1<option> 2<option> 3<option> 4<option> 5<option> 6<option> 7<option> 8<option> 9<option> 10</select><br>");
}
out.println("<hr>");
}
out.println("<b>CHECK YOUR DATA BEFORE ClICK SUBMIT</b><br><input type = submit value = \"SUBMIT\"</FORM></body></html>");

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













