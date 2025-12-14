package project;

import java.sql.*;   // All we need for JDBC

public class userLogin {

  private Connection connection;        // A connection to the database
  private Statement sql;       // Our statement to run queries with
  private DatabaseMetaData dbmd;// This is basically info the driver delivers
                                                      // about the DB it just connected to. I use
                                                      // it to get the DB version to confirm the
                                                      // connection in this example.

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[] getAllGroupName(){
    try {
      dbConnect();          //<<<<<<<<<<<<<<<<<<<<<<,,
      ResultSet resultset = queryDB("Select Distinct G_Name " +
                                                             "From Group_table " +
                                                             "Where not (g_id = '0') " +   // don't get the "all user" group
                                                             "Order by G_Name");
      resultset.last();                              // move to last row
      int row = resultset.getRow();      // get row number
      String[] g = new String[row];

      resultset.beforeFirst();                              // move to first row
      int i = -1;
      while (resultset.next()) {
        if (++i > row) break;
        g[i] = resultset.getString(1);
      }

      closeConnection() ;

      return g;
    } catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    } catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }

    return new String[0];
  }  //end getAllGroupName
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String getGroupName(String userName){

    try {
      dbConnect();          //<<<<<<<<<<<<<<<<<<<<<<,,
      ResultSet resultset = queryDB("Select g_name " +
                                                             "From Group_table " +
                                                             "Where g_id in  " +
                                                                                         "(Select g_id " +
                                                                                         "From user_table " +
                                                                                         "Where u_name = '" + userName + "')");

      String group = "";
      if (resultset.next()) group = resultset.getString(1);

      closeConnection() ;

      return group;
    } catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    } catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }

    return "all user";
  }  //end getAllGroupName
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String isMatch(String username,String password) {
    try {
      dbConnect();   //      <<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      ResultSet resultset = queryDB("Select Password,Level " +
                                                               "From User_table " +
                                                               "Where U_Name = '" + username + "'" );
      //                                                          " and G_ID IN (Select G_ID " +
        //                                                                                  "From Group_table " +
          //                                                                                "Where G_Name = '" + group + "')");

      String dbPassword = "";
      char level = ' ';
      if (resultset.next()) {
        dbPassword = resultset.getString(1);
        level = resultset.getString(2).charAt(0);
      }

      closeConnection() ;
      if (dbPassword.equals(password)) {
        if ((level == 'a' )|| (level == 'm'))  // admin or member
          return level + "";
        else  return "n";   // not match

      }

    } catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    } catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    return "n";
  }  //end isMatch;
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
 public boolean changePassword(String username, String group, String oldPW, String newPW) {
    String level = isMatch(username,oldPW);
    if (level.equals("n")) return false;    // if old password not match then don't update

    try {
      dbConnect();//    <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
      sql = connection.createStatement();  //create Statement for querying database
      int i =  sql.executeUpdate("Update User_table " +
                                                     "Set Password = '" + newPW +
                                                     "' Where U_name = '" + username +
                                                     "' and G_ID IN (Select G_ID " +
                                                                               "From Group_table " +
                                                                               "Where G_Name = '" + group + "')");
      closeConnection() ;
      return true;
    } catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    } catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    return false;
  }  //end changePassword
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  //Connect to database
 private void dbConnect()  throws ClassNotFoundException, SQLException {
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
  private ResultSet queryDB(String query) throws ClassNotFoundException, SQLException {
  sql = connection.createStatement();  //create Statement for querying database
  ResultSet resultset = sql.executeQuery(query);
 // sql.close();
 // connection.close();
  return  resultset;
} //end queryDB()
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
private void closeConnection()  {

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
