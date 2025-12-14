package Sagent2;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.net.*;
import oracle.sql.*;
import java.lang.*;
import oracle.jdbc.driver.*;
import javax.servlet.http.HttpSession;
public class RemovePosting extends HttpServlet {

  //Initialize global variables
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
  }
  String username;
  DriverManager driver;
  //Process the HTTP Post request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = new PrintWriter (response.getOutputStream());
    HttpSession session = request.getSession(true);
    username = (String)session.getValue("user.username");

    Connection conn;
    Statement stmt = null;
    Statement stmt2=null;
    Statement stmt3=null;
    ResultSet rst = null;
    ResultSet rst2 = null;
    ResultSet rst3=null;
    try{
    driver.registerDriver(new OracleDriver());
    conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
    stmt = conn.createStatement();
    stmt2= conn.createStatement();
    stmt3= conn.createStatement();
    rst = stmt.executeQuery("select PRODUCT_ID from PRODUCT where OWNER='"+username+"'");
    rst3= stmt3.executeQuery("select count(*) from PRODUCT where OWNER='"+username+"'");
    rst3.next();
    int postCount=Integer.parseInt(rst3.getString(1));
    out.println("<html><!-- #BeginTemplate \"/Templates/main.dwt\" -->");
    out.println("<head>");
    out.println("<!-- #BeginEditable \"doctitle\" --> ");
    out.println("<title>RealAgent...Your total solution</title>");
    out.println("<!-- #EndEditable -->");
    out.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">");
    out.println("<style>");
    out.println("a {text-decoration:none;font-family:Cordia New}");
    out.println("table{font-size:14pt;font-family:Cordia New}");
    out.println("div{font-size:14pt;font-family:Cordia New}");
    out.println("</style>");
    out.println("<script language=\"JavaScript\">");
    out.println("<!--");
    out.println("function MM_displayStatusMsg(msgStr) { //v1.0");
    out.println("  status=msgStr;");
    out.println("  document.MM_returnValue = true;");
    out.println("}");

    out.println("function MM_findObj(n, d) { //v4.0");
    out.println("  var p,i,x;  if(!d) d=document; if((p=n.indexOf(\"?\"))>0&&parent.frames.length) {");
    out.println("    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}");
    out.println("  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];");
    out.println("  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);");
    out.println("  if(!x && document.getElementById) x=document.getElementById(n); return x;");
    out.println("}");

    out.println("function MM_swapImgRestore() { //v3.0");
    out.println("  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;");
    out.println("}");

    out.println("function MM_swapImage() { //v3.0");
    out.println("  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)");
    out.println("   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}");
    out.println("}");

    out.println("function MM_preloadImages() { //v3.0");
    out.println("  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();");
    out.println("    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)");
    out.println("    if (a[i].indexOf(\"#\")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}");
    out.println("}");
    out.println("//-->");
    out.println("</script>");
    out.println("<script language=\"JavaScript\">");
    out.println("<!--");
    out.println("function MM_reloadPage(init) {  //reloads the window if Nav4 resized");
    out.println("  if (init==true) with (navigator) {if ((appName==\"Netscape\")&&(parseInt(appVersion)==4)) {");
    out.println("    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}");
    out.println("  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();");
    out.println("}");
    out.println("MM_reloadPage(true);");
    out.println("// -->");
    out.println("</script>");
    out.println("<script language=\"JavaScript\" src=\"citychange.js\"></script>");
    out.println("</head>");

    out.println("<body background=\"../images/mycolloseum.jpg\" bgproperties=\"fixed\" bgcolor=\"#FFFFFF\" text=\"#000000\"  topmargin=\"0\" marginheight=\"0\" leftmargin=\"0\" marginwidth=\"0\" link=\"#0099FF\" onLoad=\"MM_preloadImages('../images/ed_profiley.jpg','../images/searchy.jpg','../images/posty.jpg','../images/logouty.jpg','../images/mainy.jpg','../images/homey.jpg')\" vlink=\"#0099FF\" alink=\"#FF9933\">");
    out.println("<table width=\"640\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");
    out.println("  <tr>");
    out.println("    <td><img src=\"../../images/blackline.GIF\" width=\"640\" height=\"2\"></td>");
    out.println("  </tr>");
    out.println("</table>");
    out.println("<table width=\"640\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");
    out.println("  <tr> ");
    out.println("    <td bgcolor=\"#003399\" width=\"235\"><img src=\"../images/logo2.GIF\" width=\"160\" height=\"44\"></td>");
    out.println("    <td bgcolor=\"#003399\" width=\"404\">");
    out.println("      <table width=\"100%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#000000\">");
    out.println("        <tr> ");
    out.println("          <td width=\"19%\"><img src=\"../images/building3.jpg\" width=\"74\" height=\"70\"></td>");
    out.println("          <td width=\"81%\"><img src=\"../images/banner.gif\" width=\"330\" height=\"70\"></td>");
    out.println("        </tr>");
    out.println("      </table>");
    out.println("    </td>");
    out.println("  </tr>");
    out.println("</table>");
    out.println("<table width=\"160\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");
    out.println("  <tr>");
    out.println("    <td><img src=\"../images/line.GIF\" width=\"640\" height=\"2\"></td>");
    out.println("  </tr>");
    out.println("</table>");
    out.println("<table width=\"640\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"5\">");
    out.println("  <tr> ");
    out.println("    <td background=\"../images/gradient.jpg\" > ");
    out.println("      <div align=\"center\"></div>");
    out.println("      <div align=\"center\"><font color=\"#FFFFFF\"><b> <script>");
    out.println("			  var mont= new Array('January','February','March','April','May','June','July','August','September','October','November','December');");
    out.println("			  currentdate=new Date();");
    out.println("			  document.write(mont[currentdate.getMonth()]+' '+currentdate.getDate()+', '+currentdate.getYear());");
    out.println("			  </script></b></font></div>");
    out.println("    </td>");
    out.println("  </tr>");
    out.println("</table>");
    out.println("<table width=\"640\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"0\">");
    out.println("  <tr>");
    out.println("    <td><img src=\"../images/blackline.GIF\" width=\"640\" height=\"2\"></td>");
    out.println("  </tr>");
    out.println("</table>");
    out.println("<table width=\"640\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#003399\">");
    out.println("  <tr> ");
    out.println("    <td width=\"160\" bgcolor=\"#003399\" background=\"../images/building5.jpg\" valign=\"top\"> ");
    out.println("      <div align=\"center\"><!-- #BeginEditable \"menubar\" --> <br>");
    out.println("        <table width=\"154\" border=\"0\" cellspacing=\"0\" cellpadding=\"2\">");
    out.println("          <tr> ");
    out.println("            <td><a href=\"Templates/index.html\" onMouseOver=\"MM_displayStatusMsg('Home');return document.MM_returnValue\" onMouseOut=\"MM_displayStatusMsg('');return document.MM_returnValue\"></a><a href=\"../index.html\" onMouseOut=\"MM_swapImgRestore();MM_displayStatusMsg('');return document.MM_returnValue\" onMouseOver=\"MM_swapImage('homex','','../images/homey.jpg',1);MM_displayStatusMsg('home');return document.MM_returnValue\"><img src=\"../images/homex.jpg\" width=\"150\" height=\"30\" border=\"0\" name=\"homex\" onLoad=\"\"></a></td>");
    out.println("          </tr>");
    out.println("          <tr> ");
    out.println("            <td><a href=\"Templates/login.html\" onMouseOver=\"MM_displayStatusMsg('Member Login');return document.MM_returnValue\" onMouseOut=\"MM_displayStatusMsg('');return document.MM_returnValue\"></a><a href=\"http://161.246.5.185:8080/Sagent/servlet/Sagent2.EditInfo\" onMouseOut=\"MM_swapImgRestore();MM_displayStatusMsg('');return document.MM_returnValue\" onMouseOver=\"MM_swapImage('Image1','','../images/ed_profiley.jpg',1);MM_displayStatusMsg('Edit Profile');return document.MM_returnValue\"><img src=\"../images/ed_profilex.jpg\" width=\"150\" height=\"30\" border=\"0\" name=\"Image1\"></a></td>");
    out.println("          </tr>");
    out.println("          <tr> ");
    out.println("            <td><a href=\"Templates/register.html\" onMouseOver=\"MM_displayStatusMsg('Register');return document.MM_returnValue\" onMouseOut=\"MM_displayStatusMsg('');return document.MM_returnValue\"></a><a href=\"../search.html\" onMouseOut=\"MM_swapImgRestore();MM_displayStatusMsg('');return document.MM_returnValue\" onMouseOver=\"MM_swapImage('Image2','','../images/searchy.jpg',1);MM_displayStatusMsg('Search');return document.MM_returnValue\"><img src=\"../images/searchx.JPG\" width=\"150\" height=\"30\" border=\"0\" name=\"Image2\"></a></td>");
    out.println("          </tr>");
    out.println("          <tr> ");
    out.println("            <td><a href=\"Templates/services.html\" onMouseOver=\"MM_displayStatusMsg('Services');return document.MM_returnValue\" onMouseOut=\"MM_displayStatusMsg('');return document.MM_returnValue\"></a><a href=\"../post.html\" onMouseOut=\"MM_swapImgRestore();MM_displayStatusMsg('');return document.MM_returnValue\" onMouseOver=\"MM_swapImage('Image3','','../images/posty.jpg',1);MM_displayStatusMsg('Post');return document.MM_returnValue\"><img src=\"../images/postx.jpg\" width=\"150\" height=\"30\" border=\"0\" name=\"Image3\"></a></td>");
    out.println("          </tr>");
    out.println("          <tr> ");
    out.println("            <td><a href=\"http://161.246.5.185:8080/Sagent/servlet/Sagent2.Logout\" onMouseOut=\"MM_swapImgRestore();MM_displayStatusMsg('');return document.MM_returnValue\" onMouseOver=\"MM_swapImage('Image4','','../images/logouty.jpg',1);MM_displayStatusMsg('Logout');return document.MM_returnValue\"><img src=\"../images/logoutx.jpg\" width=\"150\" height=\"30\" border=\"0\" name=\"Image4\"></a></td>");
    out.println("          </tr>");
    out.println("        </table>");
    out.println("        <p>&nbsp;</p>");
    out.println("        <!-- #EndEditable --><br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("        <br>");
    out.println("      </div>");
    out.println("    </td>");
    out.println("    <td width=\"480\" valign=\"top\" bgcolor=\"#FFFFFF\"> ");
    out.println("      <div align=\"right\">");
    out.println("        <table width=\"435\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">");
    out.println("          <tr>");
    out.println("            <td> <!-- #BeginEditable \"content\" --><br>");
    out.println("              <b></b><img src=\"../images/remove_property.gif\" width=\"240\" height=\"20\"><br>");
    out.println("              <img src=\"../images/line.GIF\" width=\"400\" height=\"2\"> <br>");
    out.println("You can delete your posting by clicking on the link of product number<br>");
    if (postCount==0){
      out.println("<font color=\"red\">You don't have any posting.</font>");
    }else{
      while (rst.next()) {
          String productID=rst.getString(1);
          System.out.println("xxxxxxxxxxxxxx"+productID);
          rst2= stmt2.executeQuery("select PROPERTY,NAME,NEED_TO,PRICE from PRODUCT_ATTRIBUTE where PRODUCT_ID='"+productID+"'");
          rst2.next();
          String property1=rst2.getString(1);
          String name1=rst2.getString(2);
          String needto1=rst2.getString(3);
          String price1=rst2.getString(4);
          out.println("<a href=\"http://161.246.5.185:8080/Sagent/servlet/Sagent2.DeletePosting?productID="+productID+"\">");
          out.println("<li>"+property1+"&nbsp;"+name1+"&nbsp;"+needto1+"&nbsp;"+price1);
          out.println("</a>");
      }
    }
    out.println("              <!-- #EndEditable --></td>");
    out.println("          </tr>");
    out.println("        </table>");
    out.println("      </div>");
    out.println("    </td>");
    out.println("  </tr>");
    out.println("</table>");
    out.println("<div align=\"center\"><br>");
    out.println("  &copy; Hitman and Zatan Co.,Ltd 2001 All Rights Reserved</div>");
    out.println("</body>");
    out.println("<!-- #EndTemplate --></html>");
    out.close();
    }catch(Exception e){
      e.printStackTrace(System.out);
    }
  }

  //Get Servlet information
  public String getServletInfo() {
    return "Sagent2.RemovePosting Information";
  }
}