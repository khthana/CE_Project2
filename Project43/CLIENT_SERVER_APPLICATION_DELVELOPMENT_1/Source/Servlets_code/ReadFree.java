import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class ReadFree extends HttpServlet
implements SingleThreadModel {

public void init( ServletConfig config ) throws ServletException {
  super.init(config);
} // init
//-------------------------------Get Method------------------------------
public void doGet(HttpServletRequest req, HttpServletResponse res)
                               throws ServletException, IOException {

  String numpage="10";
	String volume ="3";
	String pt     ="Chinjung";
  numpage=req.getParameter("numpage");
  volume=req.getParameter("volume");
  pt=req.getParameter("pt");
  //----------------------get Data Session---------------
  res.setContentType("text/html;charset=windows-874");
  //---------------------Response User------------
	  PrintWriter out = res.getWriter();
    out.println("<!--BASE HREF=\"http://myproject/jservlets/\"-->"+
"       <html> "+
"				<head>  "+
"				<title>ตัวอย่างการ์ตูน</title>   "+
"				<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">"+
"    			</head>  "+
" 				<body bgcolor=\"#326698\">"+
"			        <applet code=\"ReadFreeApplet.class\" codebase=\"http://myproject\" width=\"750\" height=\"650\">"+
"					<param name=numpage value=\""+numpage+"\">"+
"					<param name=volume value=\""+volume+"\">"+
" 				<param name=pt value=\""+pt+"\">"+
"					</applet>"+
"					</body> "+
"					</html>  "
);
}
}

