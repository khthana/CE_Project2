import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.util.*;

public class Query_data
{
    void Query(String Str_Value,String Str_Table,String Str_where,java.io.PrintWriter out)
    {
      Connection con = null;
      Statement stmt = null;
      ResultSet rs= null;
      String Str_Query ;
      java.util.Properties props = new java.util.Properties();
      try
      {
     	  DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    }
	    catch (java.sql.SQLException ko){ out.println("Register error");}

      Str_Query = "select distinct " + Str_Value + " from "  + Str_Table + Str_where;
      out.println(Str_Query);
      try
      {
       DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
       con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
       stmt = con.createStatement();
       rs = stmt.executeQuery(Str_Query);
       show_data(rs, out);
      }
      catch (Exception ex)
      {
    	 out.println("Exception");
	     ex.printStackTrace(out);
	    }
      finally
      {
	      try
	     {
         if (rs != null)  {rs.close();}
         if (stmt != null){stmt.close();}
  		   if (con != null) {con.close();}
       }
	     catch (Exception ex){}
      }
    }
    void show_data(java.sql.ResultSet rs,java.io.PrintWriter out)
	  throws Exception
	  {
	    int rowCount = 0;
     out.println("<option>Not specific</option>");
	    ResultSetMetaData rsmd = rs.getMetaData();
      int columnCount = rsmd.getColumnCount();
		  while (rs.next())
		  {
        rowCount++;
			  for (int i = 0; i < columnCount; i++)
         {
			     out.println("<option>" + rs.getString(i+1) +"</option>");
         }
			}

		 }

}
