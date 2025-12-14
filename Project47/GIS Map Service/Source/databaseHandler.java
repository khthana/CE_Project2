package project;

import java.sql.*;
import java.io.*;   // All we need for JDBC

public class databaseHandler {


public Connection connection;        // A connection to the database
public Statement sql;       // Our statement to run queries with
public DatabaseMetaData dbmd;// This is basically info the driver delivers
                                                    // about the DB it just connected to. I use
                                                    // it to get the DB version to confirm the
                                                    // connection in this example.

  public databaseHandler() {
    try {
      dbConnect();
      System.out.println("construct databaseHandler");
    }
    catch (SQLException ex) {
      ex.printStackTrace();
    }
    catch (ClassNotFoundException ex) {
      ex.printStackTrace();
    }
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  protected void finalizer() {
    closeConnection();
    System.out.println("destruct databaseHandler\n");
  }
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
  private  void dbConnect()  throws ClassNotFoundException, SQLException {
    String database = "mapserver";
    String username = "postgres";
    String password = "password";
    String IP = "161.246.6.111";
    Class.forName("org.postgresql.Driver"); //load the driver
    System.out.println("Connecting .... ");
    connection = DriverManager.getConnection("jdbc:postgresql://"+IP+"/"+database,
                                             username,
                                             password); //connect to the db
    System.out.println("Finish Connect ! ");
    dbmd = connection.getMetaData(); //get MetaData to confirm connection
    System.out.println("Connection to "+dbmd.getDatabaseProductName()+" "+
                       dbmd.getDatabaseProductVersion()+" successful.");
    sql = connection.createStatement(); //create a statement that we can use later
  }  //end dbConnect()
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public ResultSet queryDB(String query) throws ClassNotFoundException, SQLException {
    sql = connection.createStatement();  //create Statement for querying database
    ResultSet resultset = sql.executeQuery(query);
  //  sql.close();
    //connection.close();
    return  resultset;
  } //end queryDB()
//---------------------------------------------------------------------------------------------------------------------------------------------------------
  private  void closeConnection()  {

    try {
      sql.close();                //<<<<<<<<<<<<<<<<<<<<<<<<
      connection.close();           //<<<<<<<<<<<<<<<<<<<<<<<<<<
      System.out.println("Connection Close!!\n");
    } catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
  }
  //---------------------------------------------------------------------------------------------------------------------------------------------------------
}
