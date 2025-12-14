package project;

import java.io.*;
import java.sql.*; // All we need for JDBC

public class genDTD {

  private Connection connection; // A connection to the database
  private Statement sql; // Our statement to run queries with
  private DatabaseMetaData dbmd; // This is basically info the driver delivers
                                                                // about the DB it just connected to. I use
                                                                // it to get the DB version to confirm the
                                                                // connection in this example.
  private String path = "C:\\tomcat\\webapps\\ROOT\\";

  public boolean genDTD4SpicificLayer(String layerName,String userName) {
    String fileName = path + layerName + ".dtd";
    File outputFile = new File(fileName);
    //File outputFile = new File("data.dtd");
    outputFile.delete();

    try { // opens try

      BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile, true));

      dbConnect();
      String[] columnName = getAllColumnNameNoGID(layerName);
      int column = columnName.length;

      String e_head = "<!ELEMENT ";
      String a_head = "<!ATTLIST ";
      String tab = "\t";
      String pc = "(#PCDATA)";
      StringBuffer allColumn = new StringBuffer("");
      StringBuffer element = new StringBuffer("");

      for (int i = 0; i < column; i++) {
        allColumn = allColumn.append(columnName[i] + ",");

        element = element.append(e_head + columnName[i] + " " + pc + ">\n");
      } //end for

      allColumn = allColumn.deleteCharAt(allColumn.length() - 1);

      bw.write(e_head + "EditDatabase (Table)>\n\n");

      bw.write(e_head + "Table (Delete?,Insert?)>\n");
      bw.write(a_head + "Table\n");
      bw.write(tab + "table_name CDATA #FIXED \"" + layerName + "\">\n\n");

      bw.write(e_head + "Delete (name+)>\n");
      bw.write(e_head + "name " + pc + ">\n\n");

      bw.write(e_head + "Insert (Row+)>\n");
      bw.write(e_head + "Row (" + allColumn.toString() + ")>\n");
      bw.write(element.toString());

      bw.flush();
      bw.close();

      closeConnection();
      return true;
    }
    catch (IOException ioe) { // open catch
      ioe.printStackTrace();
    }
    catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }

    return false;
  } //end gen DTD for  spicific layer

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
///////////////////////////////////////////////////////////////////////////////////////// private function /////////////////////////////////////////////////////////////////////////////////////////////
  private String[] getAllColumnNameNoGID(String layer) {

    try {

      ResultSet resultset = queryDB("Select * " +
                                    "From " + layer +
                                    " Where gid = ( Select min(gid) From " +
                                    layer + " )");

      ResultSetMetaData metadata = resultset.getMetaData();
      int column = metadata.getColumnCount();
      String[] g = new String[column - 1];

      int x = 1;

      if (resultset.next()) {
        for (int i = 1; i <= column; i++) {
          g[i - x] = metadata.getColumnName(i);
          if (g[i - x].equals("gid")) {
            x++;
          }
        }
      }

      return g;
    }
    catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }

    return new String[0];
  } //end getAllColumnName

  //--------------------------------------------------------------------------------------------------------------
//Connect to database
  private void dbConnect() throws ClassNotFoundException, SQLException {
    String database = "mapserver";
    String username = "postgres";
    String password = "password";
    String IP = "161.246.6.111";
    Class.forName("org.postgresql.Driver"); //load the driver
    System.out.println("Connecting .... ");
    connection = DriverManager.getConnection("jdbc:postgresql://" + IP + "/" +
                                             database,
                                             username,
                                             password); //connect to the db
    System.out.println("Finish Connect ! ");
    dbmd = connection.getMetaData(); //get MetaData to confirm connection
    System.out.println("Connection to " + dbmd.getDatabaseProductName() + " " +
                       dbmd.getDatabaseProductVersion() + " successful.");
    sql = connection.createStatement(); //create a statement that we can use later
  } //end dbConnect()

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private ResultSet queryDB(String query) throws ClassNotFoundException,
      SQLException {
    sql = connection.createStatement(); //create Statement for querying database
    ResultSet resultset = sql.executeQuery(query);
    //  sql.close();
    //connection.close();
    return resultset;
  } //end queryDB()

//---------------------------------------------------------------------------------------------------------------------------------------------------------
  private void closeConnection() {

    try {
      sql.close(); //<<<<<<<<<<<<<<<<<<<<<<<<
      connection.close(); //<<<<<<<<<<<<<<<<<<<<<<<<<<
      System.out.println("Connection Close!!\n\n");
    }
    catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
  }
}
