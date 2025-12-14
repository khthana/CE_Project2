package project;

import java.io.*;
import java.sql.*;   // All we need for JDBC

public class manageFile {

  private Connection connection;        // A connection to the database
  private Statement sql;       // Our statement to run queries with
  private DatabaseMetaData dbmd;// This is basically info the driver delivers
                                                    // about the DB it just connected to. I use
                                                    // it to get the DB version to confirm the
                                                    // connection in this example.












//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String updateDBFromFile (String fileName) {
   // String fileName="C:\\tomcat\\tools\\janedata.xml";

    try {
      FileInputStream inputFile = new FileInputStream(fileName);
//      FileInputStream inputFile = new FileInputStream("data.xml");

      //create InputStreamReader that uses default character encoding for reading the
      //  characters from the file.
      InputStreamReader reader = new InputStreamReader(inputFile);
      BufferedReader bufferedReader = new BufferedReader(reader);

      String line; //line read from file
      String input = new String("");
      while ( (line = bufferedReader.readLine()) != null) {
        input = input + line;
      }
      // end reading from file

      int countDelete = 0;
      int countUpdate = 0;
      int countInsert = 0;
      String incomplete = "";

      int index = input.indexOf("<Table");
      dbConnect();     // <<<<<<<<<<<<<<<<<<<<
//      while (index != -1)                            //for each layer
  //    {
        input = input.substring(index + 1);

        index = input.indexOf("\"");
        input = input.substring(index + 1);
        index = input.indexOf("\"");
        String layerName = input.substring(0,index);
        String[] columnName = getAllColumnNameNoGID(layerName);
        /*
        String[] columnName = new String[3];
        columnName[0] = "Id";
        columnName[1] = "Name";
        columnName[2] = "the_geom";
  */

        input = input.substring(index + 1);

        index = input.indexOf("</Delete>");
        String s = "";
        if (index != -1) {
          s = input.substring(input.indexOf("<Delete>"), index);
          input = input.substring(index + 1);

          //  do delete--------------------------------------------------------
          index = s.indexOf("<Coordinate>");
          while (index != -1) { //for each row (delete)
            index = s.indexOf(">");
            s = s.substring(index + 1);
            index = s.indexOf(">");
            s = s.substring(index + 1);

            index = s.indexOf("<");
            String coordinate = s.substring(0, index).trim();
            //       coordinate = toWKT(coordinate,layerName);

            // deleting....
            boolean flag = deleteGeometryRowByCoordinate(layerName, coordinate);

            if (flag) countDelete++;
            else incomplete = incomplete + "Cannot delete >>" + coordinate + "<BR>";

            index = s.indexOf("<Coordinate>");
          } //end while for each row (delete)
        }

        index = input.indexOf("</Insert>");
        if (index != -1) {
          s = input.substring(input.indexOf("<Insert>"), index);
          input = input.substring(index + 1);

          // do insert-----------------------------------------------------------
          index = s.indexOf("<Row>");
          while (index != -1) { //for each row (insert)
            int column = columnName.length;
            String[] insert = new String[column];
            int geoColumn = -1;
            int nameColumn = -1;

            for (int i = 0; i < column; i++) { //for each column (insert)
              index = s.indexOf("<" + columnName[i] + ">");
              s = s.substring(index + 1);
              index = s.indexOf(">");
              s = s.substring(index + 1);

              insert[i] = s.substring(0, s.indexOf("</"));
              if (columnName[i].equals("the_geom")) geoColumn = i;
              else if (columnName[i].equals("name")) nameColumn = i;
            } //end for each column (insert)

            insert[geoColumn] = toWKT(insert[geoColumn], layerName);
            // is update or not
            boolean update = checkGeometryEqual(layerName, insert[geoColumn]);

            if (update) { // do update-------------------------
              if (updateGeometryRow(layerName, columnName, insert)) countUpdate++;
              else incomplete = incomplete + "Cannot Update >> " +
                  insert[nameColumn] + "<BR>";

            }
            else { // do insert-----------------------------
              if (insertGeometryRow(layerName, insert, columnName)) countInsert++;
              else incomplete = incomplete + "Cannot Insert >> " +
                  insert[nameColumn] + "<BR>";
            }

            index = s.indexOf("<Row>");
          } //end while for each row (insert)
        }

//        index = input.indexOf("<Table");
  //    }  //end while for each layer



      inputFile.close();
      reader.close();
      bufferedReader.close();
      closeConnection();

      incomplete =  incomplete + countDelete + " rows deleted<BR>" + countUpdate + " rows updated<BR>" + countInsert + " rows inserted<BR>" ;
      System.out.print(incomplete);
      return incomplete;
    }
    catch (FileNotFoundException e) {
      System.out.println("File not found: " + e.toString());
    }
    catch (IOException ioe) {
      System.out.println("Error found: " + ioe.toString());
    } catch (SQLException ee) {
// TODO Auto-generated catch block
      ee.printStackTrace();
    } catch (ClassNotFoundException ee) {
// TODO Auto-generated catch block
      ee.printStackTrace();
}
    return "";
  }
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
///////////////////////////////////////////////////////////////////////////////////////// private function /////////////////////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private String toWKT(String coordinate, String layer) {

    char type = getType(layer);
    String t = "";
    switch (type) {
    case 'a' : t = "MULTIPOLYGON";  break;
    case 'b' : t = "MULTILINESTRING"; break;
    case 'c' : t = "POINT"; break;
    default : return "";
  }  //end switch

  String s = "";
  coordinate = coordinate.toUpperCase().replaceAll("_"," ");
  if (!coordinate.regionMatches(0,t,0,t.length())) {
    s = s + t;
    if (!(coordinate.charAt(0) == '(')) s = s + '(';
    s = s + coordinate;
    if (!(coordinate.charAt(coordinate.length()-1) == ')')) s = s + ')';
    return s;
  }

    return coordinate;
  }
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private char getType(String layerName) {
  try {
    dbConnect();   //            <<<<<<<<<<<<<<<<<<<<<<<<<<<,

    ResultSet resultset = queryDB("Select type " +
                                                            "From layer_table " +
                                                            "Where l_name = '" + layerName + "'");

    char g = ' ';
    if (resultset.next()) {
      g = resultset.getString(1).charAt(0);
    }  //end while

    return g;

  } catch (SQLException ee) {
    // TODO Auto-generated catch block
    ee.printStackTrace();
  } catch (ClassNotFoundException ee) {
    // TODO Auto-generated catch block
    ee.printStackTrace();
  }
  return ' ';
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private boolean insertGeometryRow(String layer, String[] insertedValue, String[] columnName) {  //not include gid value

    //manage column name
    int col = columnName.length;
    String column = new String("");
    int geo = -1;
    for (int i = 0; i<col; i++) {
      if (i != 0) column = column + ", ";
      column = column + columnName[i];
      if (columnName[i].equals("the_geom")) geo = i;
    }
/*
    if (geo != -1) {
      insertedValue[geo] = toWKT(insertedValue[geo],layer);
     }
*/
    //manage value
    col = insertedValue.length;
    String value = new String("");
    for (int i = 0; i<col; i++) {
      if (i != 0) value = value + ", ";
      String s = "";
      String t = "";
//      if (i == geo) { s = "geometryFromtext("; t = ",-1)";}
      value = value + s + "'" + insertedValue[i] + "'" + t;
    }




    //do insert
    try {
      value = new String(value.getBytes("UTF-8"), "WINDOWS-874").toString(); //encode string

      sql = connection.createStatement();  //create Statement for querying database

      String test = "Insert into " +  layer + " (" + column + ") " +
                                                     "Values (" + value + ")" ;

      int i = sql.executeUpdate(test);
//      int i =  sql.executeUpdate("Insert into " +  layer + " (" + column + ") " +
  //                                                   "Values (" + value + ")" );

      return true;

    } catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    } catch (UnsupportedEncodingException ex) {
      ex.printStackTrace();
    }

    return false;
  }  //end insertGeometryRow
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private boolean updateGeometryRow(String layer, String[] column, String[] value) {  //only geometry table only

    int col = column.length;
    String coordinate = "";
    String update = "";

    for (int i = 0; i< col; i++) {
      if (column[i].equals("the_geom")) {
        coordinate = value[i];
        coordinate = toWKT(coordinate,layer);
      }
      else {
        update = update + column[i] + " = '";
        if (column[i].equals("the_geom")) value[i] = toWKT(value[i],layer);
        update = update + value[i] + "',";
      }
    }  //end for;

    update = update.substring(0,update.length()-1);

    try {
      update = new String(update.getBytes("UTF-8"), "WINDOWS-874").toString(); //encode string
    //  name = new String(name.getBytes("UTF-8"),"WINDOWS-874").toString();  //encode string

      sql = connection.createStatement();  //create Statement for querying database

      int i =  sql.executeUpdate("Update " + layer +
                                 " Set " + update +
                                 " Where equals('" + coordinate + "',the_geom)");

      closeConnection();
      if (i == 0 ) return false;
      return true;
  } catch (SQLException ee) {
    // TODO Auto-generated catch block
    ee.printStackTrace();
  } catch (UnsupportedEncodingException ex) {
    ex.printStackTrace();
  }

  return false;
}  //end updateGeometryRow
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
private boolean updateGeometryRow(String layer, String column, String coordinate, String value) {  //only geometry table only

 try {
   dbConnect();       // <<<<<<<<<<<<<<<<<<<<<<<<
   sql = connection.createStatement();  //create Statement for querying database

   if (column.equals("the_geom")) {
     value = toWKT(value,layer);
   } else {
     value = new String(value.getBytes("UTF-8"), "WINDOWS-874").toString();
   }

   coordinate = toWKT(coordinate,layer);
   int i =  sql.executeUpdate("Update " + layer +
                                                  " Set " + column + " = '" + value +
                                                  "' Where equals(the_geom,'" + coordinate + "')");

 closeConnection();
  if (i == 0 ) return false;
   return true;
 } catch (SQLException ee) {
   // TODO Auto-generated catch block
   ee.printStackTrace();
 } catch (ClassNotFoundException ee) {
   // TODO Auto-generated catch block
   ee.printStackTrace();
 } catch (UnsupportedEncodingException ee) {
   // TODO Auto-generated catch block
   ee.printStackTrace();
 }


 return false;
}  //end updateGeometryRow
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
 private boolean checkGeometryEqual(String layer,String geometry) {  //geometry table only

    try {
      ResultSet resultset = queryDB("Select gid " +
                                                              "From " + layer +
                                                             " Where equals('" + geometry + "',the_geom)");

      resultset.last();                              // move to last row
      int row = resultset.getRow();      // get row number
      boolean flag = false;
      if (row == 1) flag = true;

      return  flag;
  } catch (SQLException ee) {
    // TODO Auto-generated catch block
    ee.printStackTrace();
  } catch (ClassNotFoundException ee) {
    // TODO Auto-generated catch block
    ee.printStackTrace();
  }


    return false;
  }  //end check geometry equal
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private boolean deleteGeometryRowByCoordinate(String layer, String geom) {  //geometry table only

    try {
      dbConnect();     //      <<<<<<<<<<<<<<<<<<<<<<<<
      sql = connection.createStatement();  //create Statement for querying database

      geom = toWKT(geom,layer);

      int i =  sql.executeUpdate("Delete From " + layer +
                                                     " Where equals(the_geom,'" + geom + "')");

     closeConnection();
      if (i == 0) return false;
      return true;
    } catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    } catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
   }

    return false;
  }  //end deleteGeometryRowByCoordinate
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private String[] getAllGeoData(String layer) {  // in the geometry table only

    try {
      ResultSet resultset = queryDB("Select astext(the_geom) " +
                                                               "From " + layer +
                                                               " Order by name");

      resultset.last();                              // move to last row
      int row = resultset.getRow();      // get row number
      String[] g = new String[row];

      resultset.beforeFirst();                              // move to first row
      int i = -1;
      while (resultset.next()) {
        if (++i  > row) break;
        g[i] = resultset.getString(1);
      }  //end while

      return g;

    } catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    } catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }

    return new String[0];
  }  // end get all geometry data
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private String[] getAllColumnNameNoGID(String layer) {

    try {

      ResultSet resultset = queryDB("Select * " +
                                    "From " + layer +
                                    " Where gid = ( Select min(gid) From " + layer + " )");

      ResultSetMetaData metadata = resultset.getMetaData();
      int column = metadata.getColumnCount();
      String[] g = new String[column-1];

      int x = 1;

      if (resultset.next()) {
        for (int i = 1; i <= column; i++) {
          g[i - x] = metadata.getColumnName(i);
          if (g[i - x].equals("gid")) x++;
        }
      }


      return g;
    } catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    } catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }

    return new String[0];
  }  //end getAllColumnName
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//Connect to database
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
  private ResultSet queryDB(String query) throws ClassNotFoundException, SQLException {
    sql = connection.createStatement();  //create Statement for querying database
    ResultSet resultset = sql.executeQuery(query);
    //  sql.close();
    //connection.close();
    return  resultset;
  } //end queryDB()
//---------------------------------------------------------------------------------------------------------------------------------------------------------
  private void closeConnection()  {

    try {
      sql.close();                //<<<<<<<<<<<<<<<<<<<<<<<<
      connection.close();           //<<<<<<<<<<<<<<<<<<<<<<<<<<
      System.out.println("Connection Close!!\n\n");
    } catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
  }
}
