package project;

import java.sql.*;
import java.io.*; // All we need for JDBC

public class editDatabase {

  private Connection connection; // A connection to the database
  private Statement sql; // Our statement to run queries with
  private DatabaseMetaData dbmd; // This is basically info the driver delivers

  // about the DB it just connected to. I use
  // it to get the DB version to confirm the
  // connection in this example.

/////////////////////////////////////////////////////////////////////////////////// public function ////////////////////////////////////////////////////////////////////////////////////////////////////
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[] getAllLayerName(String group) { //only geometry table that user have a right to access

    try {
      dbConnect(); //            <<<<<<<<<<<<<<<<<<<<<<<<<<<,

      ResultSet resultset = queryDB("Select L_Name " +
                                    "From Layer_table " +
                                    "Where owner in ( Select g_id " +
                                    "From group_table " +
                                    "Where g_name = '" + group + "')" +
                                    "Order by L_Name");

      resultset.last(); // move to last row
      int row = resultset.getRow(); // get row number
      String[] g = new String[row];

      resultset.beforeFirst(); // move to first row
      int i = -1;
      while (resultset.next()) {
        if (++i > row) {
          break;
        }
        g[i] = resultset.getString(1);
      } //end while

      closeConnection();

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
  } //end getAllLayer

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[] getAllColumnName(String layername) {

    try {
      dbConnect(); // <<<<<<<<<<<<<<<<<<<<<<<<<<<

      ResultSet resultset = queryDB("Select * " +
                                    "From " + layername +
                                    " Where gid = ( Select min(gid) From " +
                                    layername + " )");

      return getAllColumnName(resultset);

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

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private String toWKT(String coordinate, String layer) {

    if (coordinate.equals("")) {
      return "";
    }
    char type = getType(layer);
    String t = "";
    switch (type) {
      case 'a':
        t = "MULTIPOLYGON";
        break;
      case 'b':
        t = "MULTILINESTRING";
        break;
      case 'c':
        t = "POINT";
        break;
      default:
        return "";
    } //end switch

    String s = "";
    coordinate = coordinate.toUpperCase().replaceAll("_", " ");
    if (!coordinate.regionMatches(0, t, 0, t.length())) {
      s = s + t;
      if (! (coordinate.charAt(0) == '(')) {
        s = s + '(';
      }
      s = s + coordinate;
      if (! (coordinate.charAt(coordinate.length()-1) == ')')) {
        s = s + ')';
      }
      return s;
    }
    return coordinate;
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  private String toWKT(String coordinate, char type) {

    if (coordinate.equals("")) {
      return "";
    }
    String t = "";
    switch (type) {
      case 'a':
        t = "MULTIPOLYGON";
        break;
      case 'b':
        t = "MULTILINESTRING";
        break;
      case 'c':
        t = "POINT";
        break;
      default:
        return "";
    } //end switch

    String s = "";
    coordinate = coordinate.toUpperCase().replaceAll("_", " ");
    if (!coordinate.regionMatches(0, t, 0, t.length())) {
      s = s + t;
      if (! (coordinate.charAt(0) == '(')) {
        s = s + '(';
      }
      s = s + coordinate;
      if (! (coordinate.charAt(coordinate.length()-1) == ')')) {
        s = s + ')';
      }
      return s;
    }
    return coordinate;
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------------
  public String color2rgb(String color) {

    String rgb = "";
    String temp = "", temp1 = "";
    String[] RGB = new String[3];
    int R, k = 0, i = 1;
    while (i < 7) {
      color = color.toUpperCase();
      temp = color.substring(i, i + 1);
      temp1 = color.substring(i + 1, i + 2);

      if (temp.equals("A")) {
        temp = "10";
      }
      else if (temp.equals("B")) {
        temp = "11";
      }
      else if (temp.equals("C")) {
        temp = "12";
      }
      else if (temp.equals("D")) {
        temp = "13";
      }
      else if (temp.equals("E")) {
        temp = "14";
      }
      else if (temp.equals("F")) {
        temp = "15";
      }
      if (temp1.equals("A")) {
        temp1 = "10";
      }
      else if (temp1.equals("B")) {
        temp1 = "11";
      }
      else if (temp1.equals("C")) {
        temp1 = "12";
      }
      else if (temp1.equals("D")) {
        temp1 = "13";
      }
      else if (temp1.equals("E")) {
        temp1 = "14";
      }
      else if (temp1.equals("F")) {
        temp1 = "15";
      }

      R = (Integer.parseInt(temp) * 16) + (Integer.parseInt(temp1));
      RGB[k] = String.valueOf(R);
      i = i + 2;
      k = k + 1;
    }

    rgb = "rgb(" + RGB[0] + "," + RGB[1] + "," + RGB[2] + ")";

    /*  if (color.equals("black")) rgb = "rgb(0,0,0)";
      else if (color.equals("red")) rgb = "rgb(255,0,0)";
      else if (color.equals("green")) rgb = "rgb(0,255,0)";
      else if (color.equals("blue")) rgb = "rgb(0,0,255)";
      else if (color.equals("yellow")) rgb = "rgb(255,255,0)";
      else if (color.equals("cyan")) rgb = "rgb(0,255,255)";
      else if (color.equals("margenta")) rgb = "rgb(255,0,255)";
      else if (color.equals("gray")) rgb = "rgb(192,192,192)";
      else rgb = "rgb(255,255,255)";
     */
    return rgb;
  }

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private char getType(String layerName) {
    try {
//    db.dbConnect();   //            <<<<<<<<<<<<<<<<<<<<<<<<<<<,

      ResultSet resultset = queryDB("Select type " +
                                    "From layer_table " +
                                    "Where l_name = '" + layerName + "'");

      char g = ' ';
      if (resultset.next()) {
        g = resultset.getString(1).charAt(0);
      } //end while

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
    return ' ';
  }

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private boolean checkGeometryEqual(String layer, String geometry) { //geometry table only

    try {
      ResultSet resultset = queryDB("Select gid " +
                                    "From " + layer +
                                    " Where equals('" + geometry +
                                    "',the_geom)");

      resultset.last(); // move to last row
      int row = resultset.getRow(); // get row number
      boolean flag = false;
      if (row == 1) {
        flag = true;

      }
      return flag;
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
  } //end check geometry equal

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private String[] getAllColumnName(ResultSet resultset) {

    try {
      ResultSetMetaData metadata = resultset.getMetaData();
      int column = metadata.getColumnCount();
      String[] g = new String[column];

      resultset.beforeFirst();
      if (resultset.next()) {
        for (int i = 1; i <= column; i++) {
          g[i - 1] = metadata.getColumnName(i);
        }
      }
      closeConnection();

      return g;
    }
    catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    return new String[0];
  } //end getAllColumnName

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[] getAllColumnNameNoGID(String layer) {

    try {
      dbConnect();
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
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[][] getGeometryRowByCoordinate(String layer, String coordinate) { //for geometry table only

    coordinate = coordinate.replace('_', ' ');
    try {
      //   dbConnect();          //<<<<<<<<<<<<<<<<<<<<<<<<<<
      String[] columnName = getAllColumnNameNoGID(layer);
      int col = columnName.length;
      String column = new String("");
      for (int i = 0; i < col; i++) {
        if (columnName[i].equals("the_geom")) {
          columnName[i] = "astext(" + columnName[i] + ")";
        }
        if (i != 0) {
          column = column + ", ";
        }
        column = column + columnName[i];
      }

      coordinate = coordinate.replaceAll("_", " ").toUpperCase();

      ResultSet resultset = queryDB("Select " + column + //
                                    "From " + layer +
                                    " Where equals(the_geom,'" + coordinate +
                                    "')");

      ResultSetMetaData metadata = resultset.getMetaData();
      int colCount = metadata.getColumnCount();
      resultset.last(); // move to last row
      int row = resultset.getRow(); // get row number
      String[][] g = new String[row][colCount];

      resultset.beforeFirst(); // move to first row

      int j = -1;
      while (resultset.next()) {
        if (++j > row) {
          break;
        }
        //     if (resultset.next()) {
        for (int i = 1; i <= colCount; i++) {
          g[j][i - 1] = resultset.getString(i).replaceAll(" ", "_");
          //  }
        }
      } //end while

      closeConnection();

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

    return new String[0][0];
  } //end getGeometryRowByCoordinate

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[][] getGeometryRowByName(String layer, String name) { //for geometry table only

    name = name.replace('_', ' ');
    try {
      //   dbConnect();          //<<<<<<<<<<<<<<<<<<<<<<<<<<
      String[] columnName = getAllColumnNameNoGID(layer);
      int col = columnName.length;
      String column = new String("");
      for (int i = 0; i < col; i++) {
        if (columnName[i].equals("the_geom")) {
          columnName[i] = "astext(" + columnName[i] + ")";
        }
        if (i != 0) {
          column = column + ", ";
        }
        column = column + columnName[i];
      }

      name = new String(name.getBytes("UTF-8"), "WINDOWS-874").toString(); //encode string

      ResultSet resultset = queryDB("Select " + column + //
                                    "From " + layer +
                                    " Where name = '" + name + "'");

      //   ResultSet resultset=queryDB("select * from group_table where g_id='0' " );
//     ResultSetMetaData metadata = resultset.getMetaData();
      //   int colCount = metadata.getColumnCount();
      resultset.last(); // move to last row
      int row = resultset.getRow(); // get row number
      String[][] g = new String[row][col];

      resultset.beforeFirst(); // move to first row

      int j = -1;
      while (resultset.next()) {
        if (++j > row) {
          break;
        }
        //     if (resultset.next()) {
        for (int i = 1; i <= col; i++) {
          g[j][i - 1] = resultset.getString(i).replace(' ', '_');
          //  }
        }
      } //end while

      closeConnection();

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
    catch (UnsupportedEncodingException ex) {
      ex.printStackTrace();
    }

    return new String[0][0];
  } //end getGeometryRowByName

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[] getAllGeometryName(String layer) { // in the table only

    try {
      dbConnect(); //  <<<<<<<<<<<<<<<<<<<<<
      ResultSet resultset = queryDB("Select distinct(name) " +
                                    "From " + layer +
                                    " Order by name");

      resultset.last(); // move to last row
      int row = resultset.getRow(); // get row number
      String[] g = new String[row];

      resultset.beforeFirst(); // move to first row
      int i = -1;
      while (resultset.next()) {
        if (++i > row) {
          break;
        }
        g[i] = resultset.getString(1);
        if (!g[i].equals(null)) {
          g[i] = g[i].replace(' ', '_');
        }
      } //end while

      closeConnection();

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
  } // end get all geometry name

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[] getAllGeometryCoordinate(String layer) { // in the table only

    try {
      dbConnect(); //  <<<<<<<<<<<<<<<<<<<<<
      ResultSet resultset = queryDB("Select astext(the_geom) " +
                                    "From " + layer +
                                    " Order by gid");

      resultset.last(); // move to last row
      int row = resultset.getRow(); // get row number
      String[] g = new String[row];

      resultset.beforeFirst(); // move to first row
      int i = -1;
      while (resultset.next()) {
        if (++i > row) {
          break;
        }
        g[i] = resultset.getString(1).replaceAll(" ", "_");
      } //end while

      closeConnection();

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
  } // end get all geometry coordinate

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public boolean updateGeometryRow(String layer, String column,
                                   String coordinate, String value) { //only geometry table only

    try {
      dbConnect(); // <<<<<<<<<<<<<<<<<<<<<<<<
      sql = connection.createStatement(); //create Statement for querying database

      if (column.equals("the_geom")) {
        value = toWKT(value, layer);
      }
      else {
        value = new String(value.getBytes("UTF-8"), "WINDOWS-874").toString();
      }

      coordinate = toWKT(coordinate, layer);
      int i = sql.executeUpdate("Update " + layer +
                                " Set " + column + " = '" + value +
                                "' Where equals(the_geom,'" + coordinate + "')");

      closeConnection();
      if (i == 0) {
        return false;
      }
      return true;
    }
    catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    catch (UnsupportedEncodingException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }

    return false;
  } //end updateGeometryRow

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public boolean deleteGeometryRowByCoordinate(String layer, String geom) { //geometry table only

    try {
      dbConnect(); //      <<<<<<<<<<<<<<<<<<<<<<<<
      sql = connection.createStatement(); //create Statement for querying database

      geom = toWKT(geom, layer);

      int i = sql.executeUpdate("Delete From " + layer +
                                " Where equals(the_geom,'" + geom + "')");
      if (i == 0) {
        closeConnection();
        return false;
      }

      ResultSet resultset = queryDB("Select count(*) from " + layer);
      if (resultset.next()) {
        int n = Integer.parseInt(resultset.getString(1));
        if (n == 0) deleteLayer(layer);
      }

      closeConnection();
      System.out.println("Delete row by coordinate");
      return true;
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
  } //end deleteGeometryRowByCoordinate

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public boolean deleteGeometryRowByName(String layer, String name) { //geometry table only

    try {
      dbConnect(); //      <<<<<<<<<<<<<<<<<<<<<<<<
      sql = connection.createStatement(); //create Statement for querying database

      name = new String(name.getBytes("UTF-8"), "WINDOWS-874").toString();

      int i = sql.executeUpdate("Delete From " + layer +
                                " Where name = '" + name + "'");

      if (i == 0) {
        closeConnection();
        return false;
      }

      ResultSet resultset = queryDB("Select count(*) from " + layer);
      if (resultset.next()) {
        int n = Integer.parseInt(resultset.getString(1));
        if (n == 0) deleteLayer(layer);
      }

      closeConnection();
      System.out.println("Delete row by name");
      return true;

    }
    catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    catch (UnsupportedEncodingException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }

    return false;
  } //end deleteGeometryRowByName

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public int insertGeometryRow(String layer, String[][] insertedValue) { //not include gid value

    //manage column name
    String[] columnName = getAllColumnName(layer);
    int col = columnName.length;
    int geo = -1;
    // String column = new String("");
    for (int i = 0; i < col; i++) {
      if (columnName[i].equals("the_geom")) {
        geo = i - 1;
        i = col;
      }
      //   if (i != 0) column = column + ", ";
      //   column = column + columnName[i];
    }

    //do insert
    int num = 0;
    try {
      dbConnect(); //     <<<<<<<<<<<<<<<<<<<<<<<<<<<
      //manage value
      int gid = 0;
      ResultSet resultset = queryDB("Select max(gid) " +
                                    "From " + layer);
      if (resultset.next()) {
        gid = Integer.parseInt(resultset.getString(1));
      }
      else {
        return 0;
      }

      for (int j = 0; j < 10; j++) {
        col = insertedValue[0].length;
        String value = new String("'" + ++gid + "'");

        insertedValue[j][geo] = toWKT(insertedValue[j][geo], layer);
        boolean isEmpty = true;
        for (int i = 0; i < col; i++) {
          if (!insertedValue[j][i].equals("")) {
            isEmpty = false;
          }
          value = value + ",'" + insertedValue[j][i] + "'";
        } //end for i

        if (!isEmpty) {
          value = new String(value.getBytes("UTF-8"), "WINDOWS-874").toString(); //encode string

          sql = connection.createStatement(); //create Statement for querying database

          num = num + sql.executeUpdate("Insert into " + layer +
                                        " Values ( " + value + " )");
        } //end if
        else {
          break;
        }
      } //end for j

      closeConnection();
      return num;
    }
    catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    catch (UnsupportedEncodingException ex) {
      ex.printStackTrace();
    }

    return 0;
  } //end insertGeometryRow

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public boolean deleteLayer(String layername) {

    try {
      dbConnect(); //<<<<<<<<<<<<<<<<<<<<<<<<<<<
      sql = connection.createStatement(); //create Statement for querying database

      int i = sql.executeUpdate("Drop table " + layername);
      if (i == 0) {
        closeConnection();
        return false;
      }

      i = sql.executeUpdate("Delete from geometry_columns " +
                            "Where f_table_name = '" + layername + "'");
      if (i == 0) {
        closeConnection();
        return false;
      }

      i = sql.executeUpdate("Delete from layer_table " +
                            "Where l_name = '" + layername + "'");

      closeConnection();
      if (i == 0) {
        return false;
      }
      return true;

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
  } //end deleteLayer

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[] getColumnType() { //use when new layer
    String[] g = new String[4];

    g[0] = "integer";
    g[1] = "varchar(16)";
    g[2] = "varchar(64)";
    g[3] = "varchar(128)";
    g[4] = "varchar(256)";

    return g;
  }

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public boolean newLayer(String layername, String[] column, String[] value,
                          String type, String ownerGroup, String color) { //not include gid column
    // column[0][i] = column name
    // column[1][i] = column type

    System.out.println("creating table " + layername + ".....");
    if (color.equals("")) {
      color = "rgb(0,0,0)";
    }
    else {
      color = color2rgb(color);

    }
    String var = " varchar(256)";
    int row = column.length;
    String s = "gid integer not null primary key";
    String v = "'0'";
    String geom = "";
    char t = ' ';
    if (type.equals("MULTIPOLYGON")) {
      t = 'a';
    }
    else if (type.equals("MULTILINESTRING")) {
      t = 'b';
    }
    else {
      t = 'c';
    }

    for (int i = 0; i < row; i++) {
      if (column[i].equals("gid")) {
        ;
      }
      else if (column[i].equals("the_geom")) {
        if ( (value[i] == null) || (value[i].equals(""))) {
          return false;
        }
        value[i] = toWKT(value[i],t);
        geom = value[i];
//        v = v + ",'" + value[i] + "'";
      }
      else if ((column[i].equals("")) || (column[i] == null)) {
        ;
      }
      else {
        s = s + ", " + column[i] + var;
        v = v + ",'" + value[i] + "'";
      }
    } //end for
    s = s.substring(0, s.length());

      /*
          String t = "";
          switch (type) {
        case 'a' : t = "MULTIPOLYGON";  break;
        case 'b' : t = "MULTILINESTRING"; break;
        case 'c' : t = "POINT"; break;
        default : return false;
          }  //end switch
       */
      v = v + ",'" + geom + "'";

    try {
      dbConnect(); //<<<<<<<<<<<<<<<<<<<<<<<<<<<
      sql = connection.createStatement(); //create Statement for querying database

      int l_id = 0;
      ResultSet resultset = queryDB("Select max(l_id) From layer_table");
      if (resultset.next()) {
        l_id = Integer.parseInt(resultset.getString(1));
      }
      l_id++;

      int g_id = 0;
      resultset = queryDB("Select g_id From group_table where g_name = '" +
                          ownerGroup + "'");
      if (resultset.next()) {
        g_id = Integer.parseInt(resultset.getString(1));

      }
      int i = sql.executeUpdate("Create table " + layername + "(" + s + ")");
      if (i == 0) {
        closeConnection();
        return false;
      }

      queryDB("Select addgeometrycolumn('mapserver','" + layername +
              "','the_geom',-1,'" + type + "',2)");
      if (i == 0) {
        closeConnection();
        return false;
      }

      i = sql.executeUpdate("Insert into layer_table " +
                            "values('" + l_id + "','" + layername + "','" +
                            color + "','" + t + "','" + g_id + "')");

      if (i == 0) {
        closeConnection();
        return false;
      }

      i = sql.executeUpdate("Insert into " + layername +
              " values(" + v + ")");

      closeConnection();
      if (i == 0) {
        return false;
      }
      return true;

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
  } //end newLayer

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public boolean changeDefaultColor(String layerName, String color) {

    try {
      dbConnect(); // <<<<<<<<<<<<<<<<<<<<<<<<
      sql = connection.createStatement(); //create Statement for querying database

      int i = sql.executeUpdate("Update layer_table" +
                                " Set color  = '" + color +
                                "' Where l_name = '" + layerName + "'");

      closeConnection();
      if (i == 0) {
        return false;
      }
      return true;

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
  }

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[] getGeometryCenterByCoordinate(String layerName,
                                                String coordinate) {
    try {

      coordinate = coordinate.replaceAll("_", " ").toUpperCase();

      dbConnect(); //            <<<<<<<<<<<<<<<<<<<<<<<<<<<,

      ResultSet resultset = queryDB("Select centroid(the_geom) " +
                                    "From " + layerName +
                                    "Where equals(the_geom,'" + coordinate +
                                    "')");
      resultset.last(); // move to last row
      int row = resultset.getRow(); // get row number
      String[] g = new String[row];

      resultset.beforeFirst(); // move to first row
      int i = 0;
      while (resultset.next()) {
        g[++i] = resultset.getString(1);
      } //end while

      closeConnection();

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
  } //end get geometry center by coordinate

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////////////////////// private function /////////////////////////////////////////////////////////////////////////////////////////////
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
      System.out.println("Connection Close!!\n");
    }
    catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
  }

  //---------------------------------------------------------------------------------------------------------------------------------------------------------
} //end class editDatabase
