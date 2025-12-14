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
public class Search extends HttpServlet{
  DriverManager driver;
  Connection conn;
  Statement stmt = null;
  ResultSet rst = null;
  ResultSet rst2 = null;
  String SearchTable,username;
  Specification2 spec = new Specification2();
  int price,size,bed,bathroom;
  String province,area,type,needto,kitchen,laundry,furnished,fitness,swimming_pool;
  public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
  {
    PrintWriter writer = res.getWriter();
	  res.setContentType("text/html");
    HttpSession session = req.getSession(true);
    username = (String)session.getValue("user.username");
    Integer number = new Integer(Integer.parseInt(req.getParameter("number")));
    if(number.intValue()==0)
    {
      province = MTThai.MS874ToUnicode(req.getParameter("province"));
      area = MTThai.MS874ToUnicode(req.getParameter("area"));
      price = Integer.parseInt(req.getParameter("price"));
      size = Integer.parseInt(req.getParameter("size"));
      
      type = MTThai.MS874ToUnicode(req.getParameter("type"));
      needto = MTThai.MS874ToUnicode(req.getParameter("needto"));
      bed = Integer.parseInt(req.getParameter("bedroom"));
      bathroom = Integer.parseInt(req.getParameter("bathroom"));
      kitchen = MTThai.MS874ToUnicode(req.getParameter("kitchen"));
      laundry = MTThai.MS874ToUnicode(req.getParameter("laundry"));
      furnished = MTThai.MS874ToUnicode(req.getParameter("furnished"));
      swimming_pool = MTThai.MS874ToUnicode(req.getParameter("swimming_pool"));
      fitness = MTThai.MS874ToUnicode(req.getParameter("fitness"));
      spec.price = price;
      spec.area  = area;
      spec.province = province;
      spec.size = size;
      spec.type = type;
      spec.need_to = needto;
      spec.bedroom = bed;
      spec.bathroom = bathroom;
      spec.kitchen = kitchen;
      spec.laundry = laundry;
      spec.funished = furnished;
      spec.fitness = fitness;
      spec.swimming_pool = swimming_pool;
    }else
    {
      Profile profile = new Profile();
      profile.ReadXML(new URL("http://161.246.5.185:8080/profile/"+username+".xml"));
      spec.price = profile.property[number.intValue()-1].price;
      spec.area  = profile.property[number.intValue()-1].area;
      spec.province = profile.property[number.intValue()-1].province;
      spec.size = profile.property[number.intValue()-1].size;
      spec.type = profile.property[number.intValue()-1].type;
      spec.need_to = profile.property[number.intValue()-1].need_to;
      spec.bedroom = profile.property[number.intValue()-1].bedroom;
      spec.bathroom = profile.property[number.intValue()-1].bathroom;
      spec.kitchen = profile.property[number.intValue()-1].kitchen;
      spec.laundry = profile.property[number.intValue()-1].laundry;
      spec.funished = profile.property[number.intValue()-1].funished;
      spec.fitness = profile.property[number.intValue()-1].fitness;
      spec.swimming_pool = profile.property[number.intValue()-1].swimming_pool;
    }
//    writer.println("<html><head><title>Result</title></head><body>");
    writer.println("<html><!-- #BeginTemplate \"/Templates/main.dwt\" -->");
    writer.println("<head>");
    writer.println("<!-- #BeginEditable \"doctitle\" --> ");
    writer.println("<title>RealAgent...Your total solution</title>");
    writer.println("<!-- #EndEditable --> ");
    writer.println("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=windows-874\">");
    writer.println("<style>");
    writer.println("a {text-decoration:none;font-family:Cordia New}");
    writer.println("div{font-size:14pt;font-family:Cordia New}");
    writer.println("table{font-size:14pt;font-family:Cordia New}");
    writer.println(".bold{font-size:14pt;font-family:Cordia New;font-weight:bold}");
    writer.println("</style>");
    writer.println("<script language=\"JavaScript\">");
    writer.println("<!--");
    writer.println("function MM_displayStatusMsg(msgStr) { //v1.0");
    writer.println("  status=msgStr;");
    writer.println("  document.MM_returnValue = true;");
    writer.println("}");
    writer.println("");
    writer.println("function MM_swapImgRestore() { //v3.0");
    writer.println("  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;");
    writer.println("}");
    writer.println("");
    writer.println("function MM_preloadImages() { //v3.0");
    writer.println("  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();");
    writer.println("    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)");
    writer.println("    if (a[i].indexOf(\"#\")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}");
    writer.println("}");
    writer.println("");
    writer.println("function MM_findObj(n, d) { //v4.0");
    writer.println("  var p,i,x;  if(!d) d=document; if((p=n.indexOf(\"?\"))>0&&parent.frames.length) {");
    writer.println("    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}");
    writer.println("  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];");
    writer.println("  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);");
    writer.println("  if(!x && document.getElementById) x=document.getElementById(n); return x;");
    writer.println("}");
    writer.println("");
    writer.println("function MM_swapImage() { //v3.0");
    writer.println("  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)");
    writer.println("   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}");
    writer.println("}");
    writer.println("//-->");
    writer.println("</script>");
    writer.println("<script language=\"JavaScript\">");
    writer.println("<!--");
    writer.println("function MM_reloadPage(init) {  //reloads the window if Nav4 resized");
    writer.println("  if (init==true) with (navigator) {if ((appName==\"Netscape\")&&(parseInt(appVersion)==4)) {");
    writer.println("    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}");
    writer.println("  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();");
    writer.println("}");
    writer.println("MM_reloadPage(true);");
    writer.println("// -->");
    writer.println("</script>");
    writer.println("<script language=\"JavaScript\" src=\"citychange.js\"></script>");
    writer.println("</head>");
    writer.println("");
    writer.println("<body background=\"../images/mycolloseum.jpg\" bgproperties=\"fixed\" bgcolor=\"#FFFFFF\" text=\"#000000\"  topmargin=\"0\" marginheight=\"0\" leftmargin=\"0\" marginwidth=\"0\" link=\"#0099FF\" onLoad=\"MM_preloadImages('../images/ed_profiley.jpg','../images/searchy.jpg','../images/posty.jpg','../images/logouty.jpg','../images/mainy.jpg')\" vlink=\"#0099FF\" alink=\"#FF9933\">");
    writer.println("<table width=\"640\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");
    writer.println("  <tr>");
    writer.println("    <td><img src=\"../images/blackline.GIF\" width=\"640\" height=\"2\"></td>");
    writer.println("  </tr>");
    writer.println("</table>");
    writer.println("<table width=\"640\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");
    writer.println("  <tr> ");
    writer.println("    <td bgcolor=\"#003399\" width=\"235\"><img src=\"../images/logo2.GIF\" width=\"160\" height=\"44\"></td>");
    writer.println("    <td bgcolor=\"#003399\" width=\"404\">");
    writer.println("      <table width=\"100%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#000000\">");
    writer.println("        <tr> ");
    writer.println("          <td width=\"19%\"><img src=\"../images/building3.jpg\" width=\"74\" height=\"70\"></td>");
    writer.println("          <td width=\"81%\"><img src=\"../images/banner.gif\" width=\"330\" height=\"70\"></td>");
    writer.println("        </tr>");
    writer.println("      </table>");
    writer.println("    </td>");
    writer.println("  </tr>");
    writer.println("</table>");
    writer.println("<table width=\"160\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">");
    writer.println("  <tr>");
    writer.println("    <td><img src=\"../images/line.GIF\" width=\"640\" height=\"2\"></td>");
    writer.println("  </tr>");
    writer.println("</table>");
    writer.println("<table width=\"640\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"5\">");
    writer.println("  <tr> ");
    writer.println("    <td background=\"../images/gradient.jpg\" > ");
    writer.println("      <div align=\"center\"></div>");
    writer.println("      <div align=\"center\"><font color=\"#FFFFFF\"><b> <script>");
    writer.println("			  var mont= new Array('January','February','March','April','May','June','July','August','September','October','November','December');");
    writer.println("			  currentdate=new Date();");
    writer.println("			  document.write(mont[currentdate.getMonth()]+' '+currentdate.getDate()+', '+currentdate.getYear());");
    writer.println("			  </script></b></font></div>");
    writer.println("    </td>");
    writer.println("  </tr>");
    writer.println("</table>");
    writer.println("<table width=\"640\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"0\">");
    writer.println("  <tr>");
    writer.println("    <td><img src=\"../images/blackline.GIF\" width=\"640\" height=\"2\"></td>");
    writer.println("  </tr>");
    writer.println("</table>");
    writer.println("<table width=\"100%\" border=\"1\" cellpadding=\"0\" cellspacing=\"0\" bordercolor=\"#003399\">");
    writer.println("  <tr> ");
    writer.println("    <td width=\"160\" bgcolor=\"#003399\" background=\"../images/building5.jpg\" valign=\"top\"> ");
    writer.println("      <div align=\"center\"><!-- #BeginEditable \"menubar\" --> <br>");
    writer.println("        <table width=\"154\" border=\"0\" cellspacing=\"0\" cellpadding=\"2\">");
    writer.println("          <tr> ");
    writer.println("            <td><a href=\"Templates/index.html\" onMouseOver=\"MM_displayStatusMsg('Home');return document.MM_returnValue\" onMouseOut=\"MM_displayStatusMsg('');return document.MM_returnValue\"></a><a href=\"../main.html\" onMouseOut=\"MM_swapImgRestore();MM_displayStatusMsg('');return document.MM_returnValue\" onMouseOver=\"MM_swapImage('homex','','../images/mainy.jpg',1);MM_displayStatusMsg('Main');return document.MM_returnValue\"><img src=\"../images/mainx.jpg\" width=\"150\" height=\"30\" border=\"0\" name=\"homex\" onLoad=\"\"></a></td>");
    writer.println("          </tr>");
    writer.println("          <tr> ");
    writer.println("            <td><a href=\"Templates/login.html\" onMouseOver=\"MM_displayStatusMsg('Member Login');return document.MM_returnValue\" onMouseOut=\"MM_displayStatusMsg('');return document.MM_returnValue\"></a><a href=\"../profile.html\" onMouseOut=\"MM_swapImgRestore();MM_displayStatusMsg('');return document.MM_returnValue\" onMouseOver=\"MM_swapImage('Image1','','../images/ed_profiley.jpg',1);MM_displayStatusMsg('Edit Profile');return document.MM_returnValue\"><img src=\"../images/ed_profilex.jpg\" width=\"150\" height=\"30\" border=\"0\" name=\"Image1\"></a></td>");
    writer.println("          </tr>");
    writer.println("          <tr> ");
    writer.println("            <td><a href=\"Templates/register.html\" onMouseOver=\"MM_displayStatusMsg('Register');return document.MM_returnValue\" onMouseOut=\"MM_displayStatusMsg('');return document.MM_returnValue\"></a><a href=\"../search.html\" onMouseOut=\"MM_swapImgRestore();MM_displayStatusMsg('');return document.MM_returnValue\" onMouseOver=\"MM_swapImage('Image2','','../images/searchy.jpg',1);MM_displayStatusMsg('Search');return document.MM_returnValue\"><img src=\"../images/searchx.JPG\" width=\"150\" height=\"30\" border=\"0\" name=\"Image2\"></a></td>");
    writer.println("          </tr>");
    writer.println("          <tr> ");
    writer.println("            <td><a href=\"Templates/services.html\" onMouseOver=\"MM_displayStatusMsg('Services');return document.MM_returnValue\" onMouseOut=\"MM_displayStatusMsg('');return document.MM_returnValue\"></a><a href=\"../post.html\" onMouseOut=\"MM_swapImgRestore();MM_displayStatusMsg('');return document.MM_returnValue\" onMouseOver=\"MM_swapImage('Image3','','../images/posty.jpg',1);MM_displayStatusMsg('Post');return document.MM_returnValue\"><img src=\"../images/postx.jpg\" width=\"150\" height=\"30\" border=\"0\" name=\"Image3\"></a></td>");
    writer.println("          </tr>");
    writer.println("          <tr> ");
    writer.println("            <td><a href=\"http://161.246.5.185:8080/Sagent/servlet/Sagent2.Logout\" onMouseOut=\"MM_swapImgRestore();MM_displayStatusMsg('');return document.MM_returnValue\" onMouseOver=\"MM_swapImage('Image4','','../images/logouty.jpg',1);MM_displayStatusMsg('Logout');return document.MM_returnValue\"><img src=\"../images/logoutx.jpg\" width=\"150\" height=\"30\" border=\"0\" name=\"Image4\"></a></td>");
    writer.println("          </tr>");
    writer.println("        </table>");
    writer.println("        <p>&nbsp;</p>");
    writer.println("        <!-- #EndEditable --><br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("        <br>");
    writer.println("      </div>");
    writer.println("    </td>");
    writer.println("    <td width=\"100%\" valign=\"top\" bgcolor=\"#FFFFFF\"> ");
    writer.println("      <div align=\"right\">");
    writer.println("        <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"10\">");
    writer.println("          <tr>");
    writer.println("            <td> <!-- #BeginEditable \"content\" --><br>");
    writer.println("              <img src=\"../images/search.GIF\" width=\"126\" height=\"20\"> <br>");
    writer.println("              <img src=\"../images/line.GIF\" width=\"100%\" height=\"2\"> <br>");
    writer.println("              <form name=\"form1\" method=\"post\" action=\"http://161.246.5.185:8080/Sagent/servlet/Sagent2.NewSpec\" onSubmit=\"valid\">");
    writer.println("                <div id=\"Layer1\" style=\"position:relative; width:100%; height:450px; z-index:1; overflow: auto\">");
    writer.println("                  <table width=\"95%\" border=\"1\" cellspacing=\"0\" cellpadding=\"5\" bordercolor=\"#000000\" align=\"center\">");

    try{
      driver.registerDriver(new OracleDriver());
      conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
      conn.setAutoCommit(false);
      stmt = conn.createStatement();
      rst = stmt.executeQuery("select SEARCH from PROJECT");
      if(rst.next())
      {
        SearchTable = rst.getString(1);
      }
      String sizeQS;
      String priceQS;
      String provinceQS;
      String areaQS;
      Vector QS = new Vector();
      String QueryString,QueryString1;
      sizeQS = "";
      priceQS = "";
      provinceQS = "";
      areaQS = "";
      QueryString = "";
      QueryString1 = "";
      switch(spec.size){
        case(0):sizeQS = "space>=0";break;
        case(1):sizeQS = "space<50";break;
        case(2):sizeQS = "space>=50 and space<100";break;
        case(3):sizeQS = "space>=100 and space<150";break;
        case(4):sizeQS = "space>=150 and space<200";break;
        case(5):sizeQS = "space>=200";break;
      }
      switch(spec.price){
        case(0):priceQS = "price>=0";break;
        case(1):priceQS = "price<8000"; break;
        case(2):priceQS = "price>=8000 and price<15000";break;
        case(3):priceQS = "price>=15000 and price<50000"; break;
        case(4):priceQS = "price>=50000 and price<100000"; break;
        case(5):priceQS = "price>=100000 and price<500000"; break;
        case(6):priceQS = "price>=500000 and price<1000000"; break;
        case(7):priceQS = "price>=1000000 and price<5000000"; break;
        case(8):priceQS = "price>=5000000 and price<10000000"; break;
        case(9):priceQS = "price>=10000000"; break;
      }
      provinceQS = "province='"+spec.province+"'";
      if(spec.area.compareTo("All")!=0)
      {
        areaQS = "area='"+spec.area+"'";
        QS.addElement(areaQS);
      }
      QS.addElement(sizeQS);
      QS.addElement(priceQS);
      QS.addElement(provinceQS);
      Enumeration e = QS.elements();
      if(e.hasMoreElements())
      {
        QueryString = "where";
        while(e.hasMoreElements())
        {
          QueryString = QueryString + " " + (String)e.nextElement()+" and";
        }
        QueryString = QueryString.substring(0,QueryString.length()-3);
      }
      int colorswitch=0;
        QS.addElement(new String("property='"+spec.type+"'"));
        QS.addElement(new String("need_to='"+spec.need_to+"'"));
        if(spec.bedroom!=0)QS.addElement(new String("bedroom='"+spec.bedroom+"'"));
        if(spec.bathroom!=0)QS.addElement(new String("bathroom='"+spec.bathroom+"'"));
        if(spec.kitchen.compareTo("Yes")==0)QS.addElement(new String("kitchen='"+spec.kitchen+"'"));
        if(spec.laundry.compareTo("Yes")==0)QS.addElement(new String("laundry='"+spec.laundry+"'"));
        if(spec.funished.compareTo("Yes")==0)QS.addElement(new String("furnished='"+spec.funished+"'"));
        if(spec.swimming_pool.compareTo("Yes")==0)QS.addElement(new String("swimming_pool='"+spec.swimming_pool+"'"));
        e = QS.elements();
        if(e.hasMoreElements())
        {
          QueryString1 = "where";
          while(e.hasMoreElements())
          {
            QueryString1 = QueryString1 + " " + (String)e.nextElement()+" and";
          }
          QueryString1 = QueryString1.substring(0,QueryString1.length()-3);
        }
        ResultSet rst2 = stmt.executeQuery("select property,need_to,name,street_address,province,area,space,price,floor,bedroom,bathroom,kitchen,laundry,furnished,air_condition,cable_tv,parking,security,swimming_pool,fitness,product_id,more_info_url from product_attribute "+QueryString1+" order by price");
      boolean resultFind=false;
      while (rst2.next())
      {
        resultFind = true;
        writer.println("                    <tr>");
        if (colorswitch==0)
        {
          writer.println("                      <td bgcolor=\"#DDDDDD\"> ");
          colorswitch=1;
        }else
        {
          writer.println("                      <td bgcolor=\"white\"> ");
          colorswitch=0;
        }
        writer.println("<font class=\"bold\">Property:</font>"+MTThai.UnicodeToMS874(rst.getString(1))+"<br>");
        writer.println("<font class=\"bold\">Type:</font>"+MTThai.UnicodeToMS874(rst.getString(2))+"<br>");
        writer.println("<font class=\"bold\">Name:</font>"+MTThai.UnicodeToMS874(rst.getString(3))+"<br>");
        writer.println("<font class=\"bold\">Address:</font>"+MTThai.UnicodeToMS874(rst.getString(4))+"<br>");
        writer.println("<font class=\"bold\">Province:</font>"+MTThai.UnicodeToMS874(rst.getString(5))+"<br>");
        writer.println("<font class=\"bold\">Area:</font>"+MTThai.UnicodeToMS874(rst.getString(6))+"<br>");
        writer.println("<font class=\"bold\">Space:</font>"+MTThai.UnicodeToMS874(rst.getString(7))+"&nbsp; Square Meters"+"<br>");
        writer.println("<font class=\"bold\">Price:</font>"+MTThai.UnicodeToMS874(rst.getString(8))+"<br>");
        writer.println("<font class=\"bold\">Floor:</font>"+MTThai.UnicodeToMS874(rst.getString(9))+"<br>");
        writer.println("<font class=\"bold\">Bedroom:</font>"+MTThai.UnicodeToMS874(rst.getString(10))+"<br>");
        writer.println("<font class=\"bold\">Bathroom:</font>"+MTThai.UnicodeToMS874(rst.getString(11))+"<br>");
        writer.println("<font class=\"bold\">Facility:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>");
        if (rst.getString(12).equals("Yes"))        writer.println("<font color=\"white\" style=\"background:black;font-size:14pt;font-family:Cordia New\"><b>&nbsp;Kitchen&nbsp;</b></font>");
        if (rst.getString(13).equals("Yes"))        writer.println("<font color=\"white\" style=\"background:#333333;font-size:14pt;font-family:Cordia New\"><b>&nbsp;Laundry&nbsp;</b></font>");
        if (rst.getString(14).equals("Yes"))        writer.println("<font color=\"white\" style=\"background:#666666;font-size:14pt;font-family:Cordia New\"><b>&nbsp;Furnished&nbsp;</b></font>");
        if (rst.getString(15).equals("Yes"))        writer.println("<font color=\"white\" style=\"background:#999999;font-size:14pt;font-family:Cordia New\"><b>&nbsp;Air Conditioned&nbsp;</b></font>");
        if (rst.getString(16).equals("Yes"))        writer.println("<font color=\"black\" style=\"background:#CCCCCC;font-size:14pt;font-family:Cordia New\"><b>&nbsp;Cable TV&nbsp;</b></font>");
        if (rst.getString(17).equals("Yes"))        writer.println("<font color=\"white\" style=\"background:#999999;font-size:14pt;font-family:Cordia New\"><b>&nbsp;Parking&nbsp;</b></font>");
        if (rst.getString(18).equals("Yes"))        writer.println("<font color=\"white\" style=\"background:#666666;font-size:14pt;font-family:Cordia New\"><b>&nbsp;Security&nbsp;</b></font>");
        if (rst.getString(19).equals("Yes"))        writer.println("<font color=\"white\" style=\"background:#333333;font-size:14pt;font-family:Cordia New\"><b>&nbsp;Pool&nbsp;</b></font>");
        if (rst.getString(20).equals("Yes"))        writer.println("<font color=\"white\" style=\"background:black;font-size:14pt;font-family:Cordia New\"><b>&nbsp;Fitness&nbsp;</b></font>");
        String productID=rst.getString(21);
        System.out.println(productID);
        ResultSet rst3 = stmt.executeQuery("select owner from product where product_id="+productID);
        rst3.next();
        String productOwner=rst3.getString(1);
        System.out.println(productOwner);
        ResultSet rst4 = stmt.executeQuery("select name,lastname,phone,email from member_attribute where username='"+productOwner+"'");
        System.out.println(productOwner);
        rst4.next();
        writer.println("<br><div><font class=\"bold\">Contact Info:</font><div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+MTThai.UnicodeToMS874(rst4.getString(1))+"&nbsp;"+MTThai.UnicodeToMS874(rst4.getString(2))+"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Phone:"+rst4.getString(3)+"<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:"+rst4.getString(4)+"</div></div>");
        writer.println("                        </td>");
        writer.println("                    </tr>");
      }
      rst = stmt.executeQuery("select province,area,space,price,more_info,address,bed,name from "+SearchTable+" "+QueryString+"order by price");
      while(rst.next())
      {
        resultFind = true;
        writer.println("                    <tr>");
        if (colorswitch==0){
          writer.println("                      <td bgcolor=\"#DDDDDD\"> ");
          colorswitch=1;
        }else{
          writer.println("                      <td bgcolor=\"white\"> ");
          colorswitch=0;
        }
        if (rst.getString(8)!=null)        writer.println("              	    <font class=\"bold\">Name:</font>"+MTThai.UnicodeToMS874(rst.getString(8))+"<br>");
        if (rst.getString(6)!=null)        writer.println("              	    <font class=\"bold\">Address:</font>"+MTThai.UnicodeToMS874(rst.getString(6))+"<br>");
        writer.println("                          <font class=\"bold\">Province:</font>"+MTThai.UnicodeToMS874(rst.getString(1))+"<br>");
        writer.println("                          <font class=\"bold\">Area:</font>"+MTThai.UnicodeToMS874(rst.getString(2))+"<br>");
        writer.println("                          <font class=\"bold\">Size:</font>"+rst.getString(3)+"&nbsp;Square Meter<br>");
        writer.println("                          <font class=\"bold\">Price:</font>"+rst.getString(4)+"&nbsp;Baht<br>");
        if (rst.getString(7)!=null) writer.println("                          <font class=\"bold\">Bedroom:</font>"+rst.getString(7)+"&nbsp;<br>");
        writer.println("                          <font class=\"bold\">More Info:</font><a href='"+rst.getString(5)+"' target=\"new\">"+rst.getString(5)+"</a></br>");
        writer.println("                        </td>");
        writer.println("                    </tr>");

      }
      writer.println("                  </table>");
      if(resultFind)writer.println("<b>End of Result</b>");else
      if(number.intValue()==0){
        session.putValue("user.NewSpec",spec);
        writer.println("We Couldn't find what you want. You can save your spec for the offline search by clicking on save button or go back to previous page to do new search");
        writer.println("<a href=\"http://161.246.5.185:8080/Sagent/servlet/Sagent2.NewSpec\"><img src=\"http://161.246.5.185:8080/Sagent/images/save_button.jpg\" width=\"46\" height=\"14\" border=\"0\"></a>");
      }
      writer.println("                </div>");
      writer.println("              </form>");
      writer.println("              <!-- #EndEditable --></td>");
      writer.println("          </tr>");
      writer.println("        </table>");
      writer.println("      </div>");
      writer.println("    </td>");
      writer.println("  </tr>");
      writer.println("</table>");
      writer.println("<div align=\"center\"><br>");
      writer.println("  &copy; Hitman and Zatan Co.,Ltd 2001 All Rights Reserved</div>");
      writer.println("</body>");
      writer.println("<!-- #EndTemplate --></html>");
      writer.close();
    }catch(Exception e){
      e.printStackTrace(System.out);
    }
  }
}