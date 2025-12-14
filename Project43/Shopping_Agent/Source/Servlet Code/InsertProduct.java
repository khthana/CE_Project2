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
public class InsertProduct extends HttpServlet {
      DriverManager driver;
      Connection conn;
      Statement stmt = null;
      ResultSet rst = null;
      Integer intTemp;
      Integer intTemp2;
      String strTemp;
  String property,name,needto,size,price,floor,bedroom,bathroom,kitchen,laundry,furnished,air_condition,pets,monthly_fee,size_unit;
  String cable_tv,parking,security,elevator,swimming_pool,fitness,area,street_address,owner,contact_info,map_url,floor_url,room_url,posted_date,province;
  String price_range,size_range;
  java.util.Date postDate;
  public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException
  {
    PrintWriter writer = res.getWriter();
    res.setContentType("text/html");
    property = req.getParameter("property");
    name = req.getParameter("name");
    needto = req.getParameter("need_to");
    size = req.getParameter("size");
    price = req.getParameter("price");
    floor = req.getParameter("floor");
    bedroom = req.getParameter("bedroom");
    bathroom = req.getParameter("bathroom");
    kitchen = req.getParameter("kitchen");
    laundry = req.getParameter("laundry");
    furnished = req.getParameter("furnished");
    air_condition = req.getParameter("air_condition");
    pets = req.getParameter("pets");
    monthly_fee = req.getParameter("monthly_fee");
    cable_tv = req.getParameter("cable_tv");
    parking = req.getParameter("parking");
    security = req.getParameter("security");
    elevator = req.getParameter("elevator");
    swimming_pool = req.getParameter("swimming_pool");
    fitness = req.getParameter("fitness");
    area = req.getParameter("area");
    street_address = req.getParameter("street_address");
    owner = req.getParameter("owner");
    contact_info = req.getParameter("contact_info");
    map_url = req.getParameter("map_url");
    floor_url = req.getParameter("floor_url");
    room_url = req.getParameter("room_url");
    province = req.getParameter("province");
    Integer intPrice = new Integer(price);
    if(intPrice.intValue()<8000){
      price_range="1";
    }else
    if((intPrice.intValue()>=8000)&&(intPrice.intValue()<15000)){
      price_range="2";
    }else
    if((intPrice.intValue()>=15000)&&(intPrice.intValue()<50000)){
      price_range="3";
    }else
    if((intPrice.intValue()>=50000)&&(intPrice.intValue()<100000)){
      price_range="4";
    }else
    if((intPrice.intValue()>=100000)&&(intPrice.intValue()<500000)){
      price_range="5";
    }else
    if((intPrice.intValue()>=500000)&&(intPrice.intValue()<1000000)){
      price_range="6";
    }else
    if((intPrice.intValue()>=1000000)&&(intPrice.intValue()<5000000)){
      price_range="7";
    }else
    if((intPrice.intValue()>=5000000)&&(intPrice.intValue()<10000000)){
      price_range="8";
    }else
    if((intPrice.intValue()>=10000000)&&(intPrice.intValue()<50000000)){
      price_range="9";
    }
    Integer sizeInt = new Integer(size);
    if(sizeInt.intValue()<50){
      size_range = "1";
    }else
    if((sizeInt.intValue()>=50)&&(sizeInt.intValue()<100)){
      size_range = "2";
    }else
    if((sizeInt.intValue()>=100)&&(sizeInt.intValue()<150)){
      size_range = "3";
    }else
    if((sizeInt.intValue()>=150)&&(sizeInt.intValue()<200)){
      size_range = "4";
    }else
    if(sizeInt.intValue()>=200){
      size_range = "5";
    }
         Integer temp;
         postDate=  new java.util.Date();
         String dateString,dayString,monthString,yearString;
         temp =  new Integer(postDate.getDate());
         dayString = temp.toString();
         if(dayString.length()==1) dayString = "0"+dayString;
         temp = new Integer(postDate.getMonth()+1);
         monthString = temp.toString();
         if(monthString.length()==1) monthString = "0"+monthString;
         temp = new Integer(postDate.getYear()+1900);
         yearString = temp.toString();
         dateString = dayString+"/"+monthString+"/"+yearString;
         posted_date = dateString;
         try{
          driver.registerDriver(new OracleDriver());
          synchronized (conn){
            conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
            stmt = conn.createStatement();
            rst = stmt.executeQuery("select product_id from project");
            rst.next();
            strTemp = rst.getString(1);
            intTemp = new Integer(strTemp);
            intTemp2 = new Integer(intTemp.intValue()+1);
            stmt.executeQuery("update project set product_id='"+intTemp2.toString()+"' where product_id = '"+strTemp+"'");
          }
          stmt.executeQuery("insert into product_attribute values('"+property+"','"+name+"','"+needto+"','"+size+"','"+price+"','"+floor+"','"+
          bedroom+"','"+bathroom+"','"+kitchen+"','"+laundry+"','"+furnished+"','"+air_condition+"','"+
          pets+"','"+monthly_fee+"','"+cable_tv+"','"+parking+"','"+security+"','"+elevator+"','"+swimming_pool+"','"+
          fitness+"','"+area+"','"+street_address+"','"+owner+"','"+contact_info+"','"+map_url+"','"+floor_url+"','"+room_url+"',to_date('"+posted_date+"','dd/mm/yyyy'),'"+
          province+"','"+price_range+"','"+size_range+"','"+intTemp.toString()+"')");
          res.sendRedirect("http://161.246.5.185:8080/Sagent/addproduct.html");
         }catch(Exception e){}
  }
}