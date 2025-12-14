import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;
public class GenerateSearchSpec
{
    void query_select_spec(java.io.PrintWriter out,String Str_device,String Str_column)
    {
       Connection con = null;
       Statement stmt = null;
       ResultSet rs= null;
       try
       {
      	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
       }
	     catch (java.sql.SQLException ko){ out.println("Register error");}
       try
       {
       con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
       stmt = con.createStatement();
       String Findselect_spec = new String("select distinct " + Str_column + " from "+ Str_device);
       Findselect_spec +=  " order by 1" ;
       out.println(Findselect_spec);

       rs = stmt.executeQuery(Findselect_spec);
       out.println("<option> </option>");
       while (rs.next())
	     {
       String Seller_spec = new String("");
       {
          Seller_spec =   rs.getString(1) ;
       }
       out.println("<option>" + Seller_spec + "</option>");
       }
         out.println("<option>Other</option>");
      }
      catch (Exception ex)
      {
      	 out.println("Exception");
	       ex.printStackTrace(out);
	    }
      finally
      {
	     try
	     { if (rs != null)  {rs.close();}
         if (stmt != null){stmt.close();}
  		   if (con != null) {con.close();}
       }
	     catch (Exception ex){}
	    }
    }

}
