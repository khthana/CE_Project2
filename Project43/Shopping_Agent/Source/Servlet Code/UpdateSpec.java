package Sagent2;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.net.*;
public class UpdateSpec extends HttpServlet{
  String kitchen,swimming_pool,laundry,furnished,fitness,username,province,area,type,needto;
  Integer number,size,bedroom,bathroom,price;
  public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
  {
    PrintWriter writer = res.getWriter();
    res.setContentType("text/html");
    HttpSession session = req.getSession(true);
    if (session.isNew()){res.sendRedirect("http://161.246.5.185:8080/Sagent/sendlogin.html");}
    else {
    username = (String)session.getValue("user.username");
    province = req.getParameter("province");
    area = req.getParameter("area");
    type = req.getParameter("type");
    number = new Integer(req.getParameter("number"));
    needto = req.getParameter("needto");
    size = new Integer(req.getParameter("size"));
    bedroom = new Integer(req.getParameter("bedroom"));
    bathroom = new Integer(req.getParameter("bathroom"));
    kitchen = req.getParameter("kitchen");
    swimming_pool = req.getParameter("swimming_pool");
    laundry = req.getParameter("laundry");
    furnished = req.getParameter("furnished");
    fitness = req.getParameter("fitness");
    price = new Integer(req.getParameter("price"));
    Profile profile = new Profile();
    URL url = new URL("http://161.246.5.185:8080/profile/"+username+".xml");
    profile.ReadXML(url);
    profile.property[number.intValue()-1].province = this.province;
    profile.property[number.intValue()-1].area = this.area;
    profile.property[number.intValue()-1].type = this.type;
    profile.property[number.intValue()-1].bathroom = this.bathroom.intValue();
    profile.property[number.intValue()-1].bedroom = this.bedroom.intValue();
    profile.property[number.intValue()-1].fitness = this.fitness;
    profile.property[number.intValue()-1].funished = this.furnished;
    profile.property[number.intValue()-1].kitchen = this.kitchen;
    profile.property[number.intValue()-1].laundry = this.laundry;
    profile.property[number.intValue()-1].need_to = this.needto;
    profile.property[number.intValue()-1].price = this.price.intValue();
    profile.property[number.intValue()-1].size = this.size.intValue();
    profile.writeXml(username);
    res.sendRedirect("http://161.246.5.185:8080/Sagent/Sagent2.Display");
  }
}}