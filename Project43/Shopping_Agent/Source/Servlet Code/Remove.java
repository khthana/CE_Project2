package Sagent2;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.net.*;
import java.lang.*;
import javax.servlet.http.HttpSession;
public class Remove extends HttpServlet {
  String username,number;
  public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
  {
    PrintWriter writer = res.getWriter();
    res.setContentType("text/html");
    HttpSession session = req.getSession(true);
    if (session.isNew()){res.sendRedirect("http://161.246.5.185:8080/Sagent/sendlogin.html");}
    else {
    username = (String)session.getValue("user.username");
    number = req.getParameter("number");
    if(username.length()==0){
    }else
    {
      Integer IntTemp = new Integer(number);
      Profile profile = new Profile();
      URL url =  new URL("http://161.246.5.185:8080/profile/"+username+".xml");
      profile.ReadXML(url);
      profile.remove(IntTemp.intValue());
      profile.writeXml(username);
      res.sendRedirect("http://161.246.5.185:8080/Sagent/servlet/Sagent2.Display");
      writer.close();
    }
  }
}
}