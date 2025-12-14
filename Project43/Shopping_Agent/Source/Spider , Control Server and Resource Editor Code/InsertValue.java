package Spider2;
import java.io.*;
import java.util.*;
import java.sql.*;
import java.net.*;
import oracle.sql.*;
import java.lang.*;
import oracle.jdbc.driver.*;
public class InsertValue {
  Spider control;
  DriverManager driver;
  Connection conn;
  Statement stmt = null;
  ResultSet rst = null;
  public InsertValue(Spider control) {
    this.control = control;
    try{
      System.out.println("Connecting to Database");
      driver.registerDriver(new OracleDriver());
      conn = driver.getConnection("jdbc:oracle:thin:@161.246.5.185:1521:Sagent","scott","tiger");
      conn.setAutoCommit(true);      
      stmt = conn.createStatement();
      System.out.println("Connected");
      /*rst = stmt.executeQuery("select  SPIDER_SPIDER from PROJECT");
      if(rst.next())
      {
        control.spiderTable = rst.getString(1);
      }
      stmt.executeQuery("delete from "+control.spiderTable);  */
    }catch(Exception e){
      e.printStackTrace(System.out);
    }   
  }
  public void insert(String TableName,Vector value){
    String temp = "insert into ";
    temp = temp + TableName + " values(";
    Enumeration e = value.elements();
    while(e.hasMoreElements())
    {
      temp = temp + "'"+(String)e.nextElement()+"',";
    }
    temp = temp.substring(0,temp.length()-1);
    temp = temp + ")";
    System.out.println(temp);
    try{
      stmt.executeQuery(temp);
    }catch(Exception ex){
      ex.printStackTrace(System.out);
    }
  }
  public void closeConnection()throws Exception{
    conn.close();
  }
  public ResultSet query(String sqlCommand)throws Exception{
    ResultSet temp = stmt.executeQuery(sqlCommand);
    return temp;
  }
} 