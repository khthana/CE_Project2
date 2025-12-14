


import  checkdata ;
import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class InsertNewMember extends HttpServlet
{
     
    public void   doPost(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, java.io.IOException
  	{
	  resp.setContentType("text/html");
	  java.io.PrintWriter out = new java.io.PrintWriter(resp.getOutputStream());
	  String username = req.getParameter("username");
	  String password = req.getParameter("password");
	  String confirm  = req.getParameter("confirm");
	  String email = req.getParameter("email");
	  String name = MTThai.MS874ToUnicode(req.getParameter("name"));
	  String surname = MTThai.MS874ToUnicode(req.getParameter("surname"));
	  String companyname = MTThai.MS874ToUnicode(req.getParameter("companyname"));
	  String sex = req.getParameter("sex");
	//  String BirthDate = req.getParameter("birthdate");
	//  String BirthMonth = req.getParameter("birthmonth");
	//  String BirthYear = req.getParameter("birthyear");
	  String telephone = req.getParameter("telephone");
   // String date = BirthDate + "/" + BirthMonth + "/" + BirthYear;
    String date = req.getParameter("date");
 	  String region = MTThai.MS874ToUnicode(req.getParameter("region"));
    String type = req.getParameter("type");
	  String province = MTThai.MS874ToUnicode(req.getParameter("province"));
	  String telephonecompany = req.getParameter("telephonecompany");
	  String address = MTThai.MS874ToUnicode(req.getParameter("address"));
	  String zipcode = req.getParameter("zipcode");
	  String pager = req.getParameter("pager");
	  String pagernumber = req.getParameter("pagernumber");
	  String mobilenumber = req.getParameter("mobilenumber");
	  String Str_Query;
    if (companyname.length() == 0)
        companyname = "-" ;
    out.println("<html>");
    out.println("<head>");
    out.println("<title> Insert New Member </title>");
	  out.println("</head>");
    out.println("company name = " + companyname);
    out.println("<h2><center>");
	  out.println("<br>");
    java.util.Properties props = new java.util.Properties();
    try
    {
     	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	  }
	  catch (java.sql.SQLException ko){}

      Str_Query =   "insert into member (USERNAME,PASSWORD,EMAIL,COMP_NAME,NAME,SURNAME,SEX,BIRTH_DATE,TELEPHONE,ADDRESS,REGION,PROVINCE,ZIPCODE,TELE_COMP,MOBILE,PAGER,PAGENUMBER,TYPE)";
	    Str_Query +=  " values('" +  username + "'," + "'" + password + "'," + "'" + email + "'," + "'" + companyname + "',";
      Str_Query +=  "'" + name +  "'," + "'" + surname + "','" + sex + "'," + "to_date('" + date + "','DD/MM/YYYY'),";
 	    Str_Query +=  "'" + telephone + "',"  + "'" + address +  "'," + "'" + region +  "'," ;
	    Str_Query +=  "'" + province  + "'," + "'" + zipcode +  "'," + "'" + telephonecompany + "'," ;
	    Str_Query +=  "'" + mobilenumber +"','"  + pager + "','" + pagernumber + "','" + type + "')" ;
   //   out.println(Str_Query);

      query(Str_Query,props,out,username,resp,email);
	    out.println("success");
	    out.println("</html>");
      resp.sendRedirect("../index.html");
	    out.flush();

    }






boolean query (String sqlState,java.util.Properties props,java.io.PrintWriter out,
                 String username,HttpServletResponse resp,String email)
{
   boolean rc = true;
   Connection con = null;
   Statement stmt = null;
   ResultSet rs= null;
   boolean have_user = false ;
   int rowCount = 0;
   try
     {
      DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
      con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
      stmt = con.createStatement();
      String finduser= new String("select username from member where username ='" + username + "'");
      out.println(finduser);
    	rs = stmt.executeQuery(finduser);
      con.setAutoCommit(false);
      while (rs.next())
		  {
        have_user = true ;
    	}
      finduser= "select email from member where email ='" + email + "'";
      out.println(finduser);
    	rs = stmt.executeQuery(finduser);
      while (rs.next())
		  {
        have_user = true ;
    	}

      con.commit();

      if (have_user == true)
          resp.sendRedirect("../ExistUser.html");
      else
      rs = stmt.executeQuery(sqlState);
     }
   catch (Exception ex)
     {
	    out.println("Exception");
	    ex.printStackTrace(out);
	    rc = false;
	   }
   finally {
	   try
	   {
	    if (rs != null)
	    {
	     rs.close();
	    }
	   	if (stmt != null)
	   	{
		  stmt.close();
	   	}
   		if (con != null)
	  	{
        con.close();
  		}

	   }
	   catch (Exception ex)
	   {
	   }
	   }
	   return rc;
		}

 }
