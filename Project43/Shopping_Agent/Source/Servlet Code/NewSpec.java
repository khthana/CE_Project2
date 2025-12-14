package Sagent2;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import javax.servlet.http.HttpSession;
import java.net.URL;
import java.util.List;
public class NewSpec extends HttpServlet{
 String username;
 public void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
  {
    PrintWriter writer = res.getWriter();
    res.setContentType("text/html");
    //writer.println("bankbankbank");
    HttpSession session = req.getSession(true);
    if (session.isNew())
    {
      res.sendRedirect("http://161.246.5.185:8080/Sagent/sendlogin.html");
    }
    else
    {
      username = (String)session.getValue("user.username");
      Profile profile = new Profile();
      URL url =  new URL("http://161.246.5.185:8080/profile/"+username+".xml");
      profile.ReadXML(url);
      Specification2 temp[] = new Specification2[profile.count+1];
      Specification2 tempSpec = new Specification2();
      Specification2 Spec = new Specification2();
      Spec = (Specification2)session.getValue("user.NewSpec");
      tempSpec.area = Spec.area;
      tempSpec.bathroom = Spec.bathroom;
      tempSpec.bedroom = Spec.bedroom;
      tempSpec.fitness = Spec.fitness;
      tempSpec.funished = Spec.funished;
      tempSpec.kitchen = Spec.kitchen;
      tempSpec.laundry = Spec.laundry;
      tempSpec.need_to = Spec.need_to;
      tempSpec.price = Spec.price;
      tempSpec.province = Spec.province;
      tempSpec.size = Spec.size;
      tempSpec.swimming_pool = Spec.swimming_pool;
      tempSpec.type = Spec.type;
      tempSpec.found = "No";
      for(int i=0;i<profile.count;i++){
        temp[i] = profile.property[i];
      }
      temp[profile.count] = new Specification2();
      temp[profile.count] = tempSpec;
      profile.count++;
      profile.property = new Specification2[profile.count];
      for(int i=0;i<profile.count;i++){
        profile.property[i] = temp[i];
        /*writer.println(profile.property[i].type+"\n");
        writer.println(profile.property[i].area+"\n");
        writer.println(profile.property[i].bathroom+"\n");
        writer.println(profile.property[i].bedroom+"\n");
        writer.println(profile.property[i].fitness+"\n");
        /*writer.println(profile.property[i].funished+"\n");
        writer.println(profile.property[i].kitchen+"\n");
        writer.println(profile.property[i].laundry+"\n");
        writer.println(profile.property[i].need_to+"\n");
        writer.println(profile.property[i].price+"\n");
        writer.println(profile.property[i].province+"\n");
        writer.println(profile.property[i].size+"\n");
        writer.println(profile.property[i].swimming_pool+"\n");
        writer.println(profile.property[i].found); */
      }
      profile.writeXml(username);
      res.sendRedirect("http://161.246.5.185:8080/Sagent/servlet/Sagent2.Display");
      writer.close();
    }
  }
}