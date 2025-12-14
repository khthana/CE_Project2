import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Page4n extends HttpServlet {
static String u;
static String p;
public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException {
res.setContentType("text/html");
PrintWriter out = res.getWriter();
HttpSession session=req.getSession(true);
HttpSession session2=req.getSession(true);
String Username=(String)session.getValue("Username");
String u=(String)session.getValue("us");
String gii=(String)session.getValue("Goods");
int gii2 = (new Integer(gii)).intValue();
String aa = "abc";
String cc = "abc";
int bb = 7;
String Goodsname = "asd";
String Parameter = "dsf";
out.println("<HTML><HEAD><TITLE>KNOT PROJECT</TITLE></HEAD><BODY>");
out.println("<FORM METHOD=GET ACTION=\"http://localhost:8080/servlet/Page5n\">");

for (int z = 0; z < gii2; z++){
int q = z+1;
Goodsname=(String)session.getValue("Goodsname"+q);
out.println("<h1>" + Goodsname + "</h1>");
Parameter=(String)session.getValue("Parameter"+q);
int bbb = (new Integer(Parameter)).intValue();
String Ssql = "create table " + Username + "_" + Goodsname + "(Parameter text,NoKind text)";
try {performQuery(Ssql);}
catch (Exception exc){}




for (int zz = 0; zz < bbb; zz++){
int qq = zz + 1;

aa = req.getParameter("Goodsname" + q + "_" + qq);
session.putValue("Goodsname" + q + "_" + qq,aa);



out.println("<b>" + aa + ":</b><br>");

cc = req.getParameter("N_Goodsname" + q + "_" + qq);
session.putValue("N_Goodsname" + q + "_" + qq,cc);
Ssql = "insert into " + Username + "_" + Goodsname + " values('" + aa + "','" + cc + "')";
try {performQuery(Ssql);}
catch (Exception excp){}




int bba = (new Integer(cc)).intValue();

for (int zzz = 0; zzz < bba; zzz++){
int qqq = zzz + 1; 
out.println("<input type = text name=  Goodsname" + q + "_" + "N" + qq + "_T" + qqq + " size = 10 ><br>");
}
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













