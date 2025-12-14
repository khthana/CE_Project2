import java.sql.*;
import java.io.*;
import java.lang.*;
import javax.servlet.*;
import javax.servlet.http.*;


public class admin extends HttpServlet
implements SingleThreadModel {

  private Connection conn = null;
  private ResultSet rs = null;

  public void doPost(HttpServletRequest req, HttpServletResponse res)
                                throws ServletException, IOException {
  	String Username="";
	  String Passwd="",times="";
    String fileName = "C:/javawebserver2.0/server.conf";
    String WebstatServer = ReadFile(fileName);


	  Username=req.getParameter("txUser");
  	Passwd=req.getParameter("txPass");

    final String username = "admin";
    final String password = "admin";
    HttpSession session = req.getSession(true);
    session.putValue("Adminname",username);
    session.putValue("Adminpass",password);

    String adminlogin = (String)session.getValue("Adminname");
    String passwdlogin = (String)session.getValue("Adminpass");

    PrintWriter out = res.getWriter();
    res.setContentType("text/html");


    if ((!(adminlogin.equals(Username)))||(!(passwdlogin.equals(Passwd)))) {
      out.println("<html><head><body> Login Failed ....! </body></html>");
    } else {
      out.println("<html><head><title>Admin Tools </title>");
out.println("<SCRIPT language=JavaScript src=\"../dhtmllib.js\"></SCRIPT>");
out.println("<SCRIPT language=JavaScript src=\"../navbar.js\"></SCRIPT>");
out.println("<SCRIPT language=JavaScript>");
out.println("var myNavBar1 = new NavBar(0);");
out.println("var tempMenu;");
out.println("tempMenu = new NavBarMenu(0, 0);");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Home\", \"http://"+WebstatServer+"/index.html\"));");
out.println("myNavBar1.addMenu(tempMenu);");
out.println("tempMenu = new NavBarMenu(0,60);");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Search\", \"\"));");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Personal\", \"http://"+WebstatServer+"/search_personal.html\"));");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Detail\", \"http://"+WebstatServer+"/search_detail.html\"));");
out.println("myNavBar1.addMenu(tempMenu);");
out.println("tempMenu = new NavBarMenu(0,100);");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Modify Personal\", \"\"));");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Insert\", \"http://"+WebstatServer+"/insert_personal.html\"));");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Delete\", \"http://"+WebstatServer+"/delete_personal.html\"));");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Update\", \"http://"+WebstatServer+"/update_personal.html\"));");
out.println("myNavBar1.addMenu(tempMenu);");
out.println("tempMenu = new NavBarMenu(0,80);");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Modify Detail\", \"\"));");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Insert\", \"http://"+WebstatServer+"/insert_detail.html\"));");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Delete\", \"http://"+WebstatServer+"/delete_detail.html\"));");
out.println("tempMenu.addItem(new NavBarMenuItem(\"Update\", \"http://"+WebstatServer+"/update_detail.html\"));");
out.println("myNavBar1.addMenu(tempMenu);");
out.println("var myNavBar2 = new NavBar(500);");
out.println("myNavBar2.setSizes(1, 2, 0);");
out.println("myNavBar2.setColors(\"#000000\", \"#ffffff\", \"#669999\", \"#000000\", \"#66cccc\", \"#ffffff\", \"#339999\", \"#000000\", \"#99ffff\");");
out.println("myNavBar2.setFonts(\"Verdana\", \"plain\", \"bold\", \"10pt\", \"Arial\", \"italic\", \"normal\", \"10pt\");");
out.println("var fullWidth;");
out.println("function init() {");
out.println("fullWidth = getWindowWidth()");
out.println("- (isMinNS4 && getWindowHeight() < getPageHeight() ? 16 : 0);");
out.println("myNavBar1.resize(10);");
out.println("myNavBar1.create();");
out.println("myNavBar2.create();");
out.println("myNavBar2.hide();");
out.println("myNavBar2.moveTo(fullWidth - myNavBar2.getWidth(), 100);");
out.println("myNavBar1.setzIndex(2);");
out.println("myNavBar2.setzIndex(1);");
out.println("}");
out.println("</SCRIPT>");
out.println("<META HTTP-EQUIV=\"Content-Type\" CONTENT=\"text/html;charset=tis-620\">");
out.println("<meta name=\"description\" content=\"Fireworks Splice HTML\">");
out.println("<style type=\"text/css\">");
out.println("<!--");
out.println("-->");
out.println("</style>");
out.println("</head>");
out.println("<body bgcolor=\"#dfdfdf\" onload=init()>");
out.println("<p align=\"center\">&nbsp;</p>");
out.println("<p align=\"center\">&nbsp;</p>");
out.println("<p align=\"center\">&nbsp;</p>");
out.println("<p align=\"center\">");
out.println("  <input type=\"image\" border=\"0\" name=\"imageField\" src=\"../77245834.jpg\" width=\"115\" height=\"115\">");
out.println("</p>");
out.println("<p align=\"center\"><font size=\"+7\"><b>Admin Tools</b></font></p>");
        out.println("</body></html>");

      }
/*    } catch (IOException e ) {
      System.out.println(e);
    }*/
  }

  String ReadFile(String File) {
    String inPut=new String("");
    FileInputStream s;
    int readVar;

    try {
      s = new FileInputStream(File);
      readVar = 0;
      //--------------------Read File to String-----------
      while (readVar != ';') {
        try {
          readVar = s.read();
          inPut+=(char)readVar;
//          System.out.print("" + ((char)readVar));
        } catch (IOException e){
          System.out.println("Unknown IO error reading file " + File);
          System.exit(2);
        }
      }
//      inPut = inPut.substring(inPut.indexOf("?"),1);
    } catch (FileNotFoundException e) {
      System.out.println("File " + File + " not found");
      System.exit(1);
    }
    System.out.println();
	inPut = inPut.substring(0,inPut.indexOf(';'));
    return inPut;
  }


}

