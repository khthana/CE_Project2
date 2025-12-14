import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class Page12n extends HttpServlet {



public void doGet(HttpServletRequest req,HttpServletResponse res)
                        throws ServletException,IOException {
res.setContentType("text/html");
PrintWriter out = res.getWriter();
out.println(" <html><head> <title>Page Signin </title> </head>        <body>        <FORM METHOD=GET ACTION=\"http://localhost:8080/servlet/Page2n\">                <b>USERNAME:</b>        <input type = text name=Username size = 10 ><br>        <b>PASSWORD:</b>        <input type = password name=Password size = 10 ><br>        <hr>        <b>FIRSTNAME:</b>        <input type = text name=Firstname size = 20 ><br>        <b>LASTNAME:</b><input type = text name=Lastname size = 20 ><br><b>ADDRESS:</b><input type = text name=Address size = 40 ><br><b>TELEPHONE:</b><input type = text name=Telephone size = 20 ><br><hr><b>NUMBER OF GOODS:<select name = Goods><option> 1<option> 2<option> 3<option> 4<option> 5<option> 6<option> 7<option> 8<option> 9<option> 10</select><hr><b>COMMENT: </b><br><TextArea name=Comment rows = 10 Cols = 40></TextArea><hr>");
out.println("<b>CHECK YOUR DATA BEFORE ClICK SUBMIT</b><br><input type = submit value = \"SUBMIT\"</FORM></body></html> ");
}
}















