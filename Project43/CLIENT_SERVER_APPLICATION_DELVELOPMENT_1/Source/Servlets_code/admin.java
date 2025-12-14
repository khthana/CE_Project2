import java.sql.*;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class admin extends HttpServlet {

		public void doGet(HttpServletRequest req, HttpServletResponse res)throws ServletException, IOException{

			Connection  conn= null;
			Statement   stmtt = null;
			ResultSet   rss = null;

      String temp="";

			res.setContentType("text/html;charset=windows-874");
			PrintWriter out = res.getWriter();
      out.println("<HTML><HEAD><TITLE>Administrator</TITLE>");
			//out.println("<BODY>");

			HttpSession session = req.getSession(true);

			String username = req.getParameter("username").trim();
      String password = req.getParameter("password").trim();

      if (!username.equals("")&& !password.equals("")){
        try
			  {
          if (username.equals("admin")){
            Class.forName ("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@jim:1521:project","scott","tiger");
				    stmtt = conn.createStatement();
            rss = stmtt.executeQuery("select password from users where users ='"+username+"'");
            if (rss.next()){
              temp = rss.getString("password").trim();
              if (temp.equals(password)){
                out.println("<BASE HREF=\"http://myproject/\">");
                out.println("<script language=\"JavaScript\">");
                out.println("<!--");
                out.println("function MM_swapImgRestore() { //v3.0");
                out.println("  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;");
                out.println("}");
                out.println("function MM_preloadImages() { //v3.0");
                out.println("  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();");
                out.println("    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)");
                out.println("    if (a[i].indexOf(\"#\")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}");
                out.println("}");
                out.println("function MM_findObj(n, d) { //v3.0");
                out.println("  var p,i,x;  if(!d) d=document; if((p=n.indexOf(\"?\"))>0&&parent.frames.length) {");
                out.println("    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}");
                out.println("  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];");
                out.println("  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document); return x;");
                out.println("}");
                out.println("function MM_swapImage() { //v3.0");
                out.println("  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)");
                out.println("   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}");
                out.println("}");
                out.println("//-->");
                out.println("</script>");
                out.println("</head>");
out.println("<body bgcolor=\"#FFFFFF\" onLoad=\"MM_preloadImages('IMAGES/DelOldMember2.jpg','IMAGES/AddNewBook2.jpg','IMAGES/UpdateBook2.jpg','IMAGES/RemoveBook2.jpg','IMAGES/AddNewVolume2.jpg','IMAGES/RemoveVolume2.jpg','IMAGES/AddSuggest2.jpg')\">");
out.println("<table width=\"100%\" border=\"0\">");
out.println("  <tr><td width=\"2%\">&nbsp;</td><td colspan=\"2\">");
out.println("      <div align=\"center\"><b><font size=\"5\" color=\"#FF6666\">Administrator</font></b></div>");
out.println("    </td><td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td><td colspan=\"2\">");
out.println("      <hr></td><td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td> <td colspan=\"2\"><b>About User</b></td>");
out.println("    <td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td>    <td width=\"33%\">");
out.println("      <div align=\"center\"><a href=\"jservlets/DelMember\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image1','','IMAGES/DelOldMember2.jpg',1)\"><img name=\"Image1\" border=\"0\" src=\"IMAGES/DelOldMember1.jpg\" width=\"164\" height=\"49\"></a></div>");
out.println("    </td><td width=\"61%\"><font face=\"AngsanaUPC\" size=\"5\">ลบรายชื่อลูกค้าที่ขาดการติดต่อนานเกิน 3  เดือน </font></td>");
out.println("    <td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td>");
out.println("    <td colspan=\"2\"><hr></td><td width=\"4%\">&nbsp;</td></tr>  <tr>");
out.println("    <td width=\"2%\">&nbsp;</td><td colspan=\"2\"><b>About Book</b></td>");
out.println("    <td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td>");
out.println("    <td width=\"33%\"><div align=\"center\"><a href=\"jservlets/FormSuggest\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image7','','IMAGES/AddSuggest2.jpg',1)\"><img name=\"Image7\" border=\"0\" src=\"IMAGES/AddSuggest1.jpg\" width=\"163\" height=\"53\"></a></div>");
out.println("    </td><td width=\"61%\"><font face=\"AngsanaUPC\" size=\"5\">เพิ่มรายชื่อการ์ตูนในหน้าจอแนะนำการ์ตูนใหม่ </font></td>");
out.println("    <td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td>");
out.println("    <td width=\"33%\"><div align=\"center\"><a href=\"InsertBook.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image2','','IMAGES/AddNewBook2.jpg',1)\"><img name=\"Image2\" border=\"0\" src=\"IMAGES/AddNewBook1.jpg\" width=\"163\" height=\"53\"></a></div>");
out.println("    </td><td width=\"61%\"><font face=\"AngsanaUPC\" size=\"5\">เพิ่มรายชื่อการ์ตูนใหม่ลง Database </font></td>");
out.println("    <td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td>");
out.println("    <td width=\"33%\"><div align=\"center\"><a href=\"Insertvol.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image5','','IMAGES/AddNewVolume2.jpg',1)\"><img name=\"Image5\" border=\"0\" src=\"IMAGES/AddNewVolume1.jpg\" width=\"163\" height=\"53\"></a></div>");
out.println("    </td><td width=\"61%\"><font face=\"AngsanaUPC\" size=\"5\">เพิ่มจำนวนเล่มให้กับหนังสือการ์ตูน </font></td>");
out.println("    <td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td>");
out.println("    <td width=\"33%\"><div align=\"center\"><a href=\"UpdateBook.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image3','','IMAGES/UpdateBook2.jpg',1)\"><img name=\"Image3\" border=\"0\" src=\"IMAGES/UpdateBook1.jpg\" width=\"163\" height=\"53\"></a></div>");
out.println("    </td><td width=\"61%\"><font face=\"AngsanaUPC\" size=\"5\">แก้ไขเพิ่มเติมรายละเอียดเกี่ยวกับหนังสือการ์ตูน </font></td>");
out.println("    <td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td>");
out.println("    <td width=\"33%\"><div align=\"center\"><a href=\"removebook.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image4','','IMAGES/RemoveBook2.jpg',1)\"><img name=\"Image4\" border=\"0\" src=\"IMAGES/RemoveBook1.jpg\" width=\"163\" height=\"53\"></a></div>");
out.println("    </td><td width=\"61%\"><font face=\"AngsanaUPC\" size=\"5\">ลบหนังสือการ์ตูนออกจาก Database </font></td>");
out.println("    <td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td>");
out.println("    <td width=\"33%\"><div align=\"center\"><a href=\"removevol.html\" onMouseOut=\"MM_swapImgRestore()\" onMouseOver=\"MM_swapImage('Image6','','IMAGES/RemoveVolume2.jpg',1)\"><img name=\"Image6\" border=\"0\" src=\"IMAGES/RemoveVolume1.jpg\" width=\"163\" height=\"53\"></a></div>");
out.println("    </td><td width=\"61%\"><font face=\"AngsanaUPC\" size=\"5\">ลบเล่มที่ไม่ต้องการออกจาก Database </font></td>");
out.println("    <td width=\"4%\">&nbsp;</td></tr><tr><td width=\"2%\">&nbsp;</td>");
out.println("    <td colspan=\"2\"><hr></td><td width=\"4%\">&nbsp;</td></tr>");
out.println("</table>");

                //out.println("<br>Hello Admin.");
              }else{out.println("<br>You are not administrator!!");}
            }else{out.println("<br>You are not administrator!!");}
          }else{out.println("<br>You are not administrator!!");}
				  out.println("</BODY></HTML>");
			  }
			  catch ( SQLException e ) {
						System.err.println("Could not establish connection.");
				}
				catch ( ClassNotFoundException e ) {
						System.err.println("Could not load database driver.");
				}
				finally {
						try{
							if (conn != null)
								conn.close();
							}
						catch (SQLException ignored)	{ }
				}
      }else{
        out.println("<br>Username or password must not null");
        out.println("</BODY></HTML>");
      }
		}
}
