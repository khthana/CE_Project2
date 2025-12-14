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

public class Post extends HttpServlet {
  //Initialize global variables
  DriverManager driver;
  Connection conn;
  Statement stmt = null;
  ResultSet rst = null;
  ResultSet rst2 = null;
  Socket socket;
  String username,password,property,name,province,area,address,need_to,size,price,floor,bedroom,bathroom,kitchen;
  String furnished,air_condition,cable_tv,parking,security,swimming_pool,fitness,url,laundry,more_info_url;
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
  }

  //Process the HTTP Post request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    response.setContentType("text/html");
    PrintWriter out = new PrintWriter (response.getOutputStream());
    HttpSession session = request.getSession(true);
    if (session.isNew()) {response.sendRedirect("http://161.246.5.185:8080/Sagent/sendlogin.html");}
    else {
      try{
        socket = new Socket("161.246.5.185",888);
        DataOutputStream o = new DataOutputStream(new BufferedOutputStream(socket.getOutputStream()));
        o.writeUTF("PST");
        o.flush();
        o.writeUTF("DSC");
        o.flush();
        o.close();
      }catch(Exception e){
      }
      username = (String)session.getValue("user.username");
      password = (String)session.getValue("user.password");
      property = request.getParameter("property");
      name = MTThai.MS874ToUnicode(request.getParameter("name"));
      province = MTThai.MS874ToUnicode(request.getParameter("province"));
      area = MTThai.MS874ToUnicode(request.getParameter("area"));
      address = MTThai.MS874ToUnicode(request.getParameter("address"));
      need_to = request.getParameter("need_to");
      size = request.getParameter("size");
      price = request.getParameter("price");
      floor = request.getParameter("floor");
      bedroom = request.getParameter("bedroom");
      bathroom = request.getParameter("bathroom");
      kitchen = request.getParameter("kitchen");
      laundry = request.getParameter("laundry");
      furnished = request.getParameter("furnished");
      air_condition = request.getParameter("air_condition");
      cable_tv = request.getParameter("cable_tv");
      parking = request.getParameter("parking");
      security = request.getParameter("security");
      swimming_pool = request.getParameter("swimming_pool");
      fitness = request.getParameter("fitness");
      more_info_url = "url";
      try {
        driver.registerDriver(new OracleDriver());
        conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
        stmt = conn.createStatement();
        conn.setAutoCommit(false);
        stmt.executeQuery("select * from product_attribute for update");
        rst2 = stmt.executeQuery("select MAX(product_id) from product");
        String product_id;
        int productCount = 0;
        if (rst2.next())
        try{
          productCount =Integer.parseInt(rst2.getString(1))+1;
        }catch(Exception e){productCount = 1;}
        product_id=Integer.toString(productCount);
        stmt.executeQuery/*System.out.println*/("insert into product_attribute values ('"+property+"','"+name+"','"+need_to+"','"+price+"','"+floor+"','"+bedroom+"','"+bathroom+"','"+kitchen+"','"+laundry+"','"+furnished+"','"+air_condition+"','"+cable_tv
        +"','"+parking+"','"+security+"','"+swimming_pool+"','"+fitness+"','"+area+"','"+address+"','"+province+"','"+product_id+"','"+more_info_url+"','"+size+"')");
        stmt.executeQuery("insert into product values('"+product_id+"','"+username+"')");
        conn.commit();
        conn.close();
       // rst = stmt.executeQuery("select * from product1 where username='"+username+"' and password='"+password+"'");
        response.sendRedirect("http://161.246.5.185:8080/Sagent/post.html");
      } catch (SQLException sqle){System.out.println(sqle.getMessage());
    }
  }
  }
}