import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class Page2n extends HttpServlet {
static String u;
static String p;
static String f;
static String l;
static String a;
static String t;
static String g;
static String c;



public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException {
res.setContentType("text/html");
PrintWriter out = res.getWriter();

HttpSession session = req.getSession(true);
HttpSession session2 = req.getSession(true);
String Username = req.getParameter("Username");
String Password = req.getParameter("Password");
String Firstname = req.getParameter("Firstname");
String Lastname = req.getParameter("Lastname");
String Address = req.getParameter("Address");
String Telephone = req.getParameter("Telephone");
String Goods = req.getParameter("Goods");
String Comment = req.getParameter("Comment");
 u = req.getParameter("Username");
 p = req.getParameter("Password");
 f = req.getParameter("Firstname");
 l = req.getParameter("Lastname");
 a = req.getParameter("Address");
 t = req.getParameter("Telephone");
 g = req.getParameter("Goods");
 c = req.getParameter("Comment");

session.putValue("Username",u);
session.putValue("Password",p);
session.putValue("Firstname",f);
session.putValue("Lastname",l);
session.putValue("Address",a);
session.putValue("Telephone",t);
session.putValue("Goods",g);
session.putValue("Comment",c);

session.putValue("us",u);
session2.putValue("gi2",g);

String Ssql = "insert into Admin values('" + u + "','" + p + "','" + f + "','" + l + "','" + a + "','" + t + "','" + g + "','" + c + "')";
try {performQuery(Ssql);}
catch (Exception exc){}





int gi = (new Integer(g)).intValue();


out.println("<HTML><HEAD><TITLE>KNOT PROJECT</TITLE></HEAD><BODY>");
out.println("<FORM METHOD=GET ACTION=\"http://localhost:8080/servlet/Page3n\">");

int y = gi;
for (int z = 0; z < y; z++){
int q = z+1;
out.println("<b>GOODSNAME" + q + ":</b>");
out.println("<input type = text name=Goodsname" + q +  "  size = 10 ><br><b>NUMBER OF PARAMETER:</b>");
out.println("<select name = Parameter" + q + ">");
out.println("<option> 1<option> 2<option> 3</select>");
out.println("<b>SORT:");
out.println("<select name = Sort" + q + "><option> FIFO<option> LIFO<option> NONE</select>");
out.println("<b>ALERT WHEN:");
out.println("<input type = text name=Alert" + q + " size = 10 >");
out.println("<br><hr>");
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













