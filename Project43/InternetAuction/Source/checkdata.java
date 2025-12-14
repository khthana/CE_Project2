

//package auction;
import  java.sql.*;
import  oracle.jdbc.driver.*;
import  java.io.*;
import  java.util.*;


public class checkdata
{
    String Str_out ;
    String sqlState ="" ;
    public void  sql()
   	throws  java.io.IOException
  	{
      Connection con = null;
      Statement stmt = null;
      ResultSet rs= null;
      int rowCount = 0;
      try
      {
        DriverManager.registerDriver (new oracle.jdbc.driver.OracleDriver());
	    	con = DriverManager.getConnection ("jdbc:oracle:thin:@161.246.5.182:1521:Internet","auction", "auction");
    		stmt = con.createStatement();
		    rs = stmt.executeQuery(sqlState);
    		ResultSetMetaData rsmd = rs.getMetaData();
    		int columnCount = rsmd.getColumnCount();
		    while (rs.next())
	      {
    	   rowCount++;
         for (int i = 0; i < columnCount; i++)
             {
	   	        Str_out =  rs.getString(i + 1) ;
 //               System.out.println(Str_out);
       			 }
        }
	   }
	   catch (Exception ex) { System.out.println("error");}
     finally
	   {
      try
	    {
	      if (rs != null)   {rs.close();}
     	  if (stmt != null) {stmt.close();}
  		  if (con != null)  {con.close();}
	    }
	    catch (Exception ex){}
      }
     }
}





