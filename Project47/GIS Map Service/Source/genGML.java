package project;

import java.io.*;
import java.sql.*;   // All we need for JDBC


public class genGML {

  private Connection connection;        // A connection to the database
  private Statement sql;       // Our statement to run queries with
  private DatabaseMetaData dbmd;// This is basically info the driver delivers
                                                    // about the DB it just connected to. I use
                                                    // it to get the DB version to confirm the
                                                    // connection in this example.

  private String b="";
  private String temp="";
  private double[] boundary = new double[4];   //xmax xmin ymax ymin
  private String path = "C:\\tomcat\\webapps\\ROOT\\";

//*************************************************************  my code ***********************************************************************
  public void file(String group,String[] layerName, String userName){
    String fileName = path + userName + ".gml";
    File outputFile = new File(fileName);
//    File outputFile = new File("data.gml");

    outputFile.delete();

    String element, element1, element2, element3;
    String elementB[] = new String[30]; // boundary element
    String elementS[] = new String[30]; //sub element
    //*************** data **************
//    String dataNameShp[] = new String[30]; //Stored name each shap file Ex  theme1 ,line

//    String bound = "1.123,1.11545,5.4564,6.879"; //data Boundary
    String columnName1;
    //************************************
    String tap = "      ";
    String tap1 = "      ";

    int y = 1;
    String att[] = new String[20];
    // before use this funtion you must buil jDisplay(jTextarea)
    //************* element **************
    element = "gml:featureCollection";
    element1 = "gml:Polygon"; //gml:..........(type)
    element2 = "gml:Point";
    element3 = "gml:LineString";
    elementB[0] = "gml:boundedBy";
    elementB[1] = "gml:Box";
    elementB[2] = "gml:coordinates";
    elementS[0] = "gml:featureMember";
    elementS[1] = "gml:outerBoundaryIs"; // not use in point
    elementS[2] = "gml:LinearRing"; // not use in point

    elementS[3] = "gml:coordinates";
  //*********** att ******************
  att[0] = "xmlns:gml =\"http://www.opengis.net/gml\"\n";
  att[1] = "xmlns:xlink=\"htttp://www.w3.org/1999/xlink\"";
  att[2] = "srsName=\" \"";
  //**************  Example  data*******************************

  columnName1="FeatureID";
  /*
  dataNameShp[1] = "theme1";
  dataNameShp[2]="test";
  dataNameShp[3]="ice";
  */

//       numberOfColumn=4;
  //     numberOfRow=2;
// dataB="123,123,456";

  //****** polygon **********
//  results[1][1]="1";results[1][2]="LINE";results[1][3]="SRID = MULTILINE((123.123 123))";results[1][4]="adress";
 // results[2][1]="2";results[2][2]="LINE";results[2][3]="SRID = MULTILINE((333.123 123))";results[2][4]="adressffdf";



//********** display ***************
  try { // opens try

    int numberOfLayer = layerName.length;
    String[] allLayer = new String[numberOfLayer];
    dbConnect();

    String bound = "0 0 0 0";  // x min , y min, dif x, dif y
    ResultSet  resultset;
    for (int k = 0; k<numberOfLayer; k++) {
      resultset = queryDB("Select envelope(geomunion(the_geom)) " +
                                            "From " + layerName[k] );
      if (resultset.next()) allLayer[k] = resultset.getString(1);
    }

    findAllBoundary(allLayer);
    bound = boundary[1] + "," + boundary[3] + " " + boundary[0] + "," + boundary[2] ;

    BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile, true));
    String header = "<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n";
    bw.write(header);
    bw.newLine();
    bw.write("<" + element + "\t" + att[0] + att[1] + ">");
    bw.newLine();
    bw.write(tap + "<" + elementB[0] + ">");
    bw.newLine();
    bw.write(tap + tap + "<" + elementB[1] + "  " + att[2] + ">");
    bw.newLine();
    bw.write(tap + tap + tap + "<" + elementB[2] + ">"+bound);


    for (int i = 2; i >= 0; i--) {
      for (int j = y; j >= 0; j--) {
        tap = tap + tap1;
      }
      bw.write( "<" + "/" + elementB[i] + ">");
      bw.newLine();
      y--;
      tap = "      ";
    }

     //************* for outer loop ***********************************
     for (int loop = 0; loop<numberOfLayer; loop++) {
       int id = 1;
       String[] columnName = getAllColumnName(layerName[loop]);
       int numberOfColumn = columnName.length;
  //    int numberOfColumn = 3;
       int numberOfColumnGeo = NumberOfColumnGeom(columnName);

       resultset = queryDB("Select  * " +
                                                         "From " + layerName[loop] +
                                                         " Order by gid ");

       resultset.last(); // move to last row
       int numberOfRow = resultset.getRow(); // get row number
       String[][] results = new String[numberOfRow][numberOfColumn];

       resultset.beforeFirst(); // move to first row


       int ii = -1;
       while (resultset.next()) {
         if (++ii > numberOfRow) break;
         for (int z = 0; z < numberOfColumn; z++) {
           results[ii][z] = resultset.getString(z+1); //gid
         } //end for
       } //end while


     //********** for loop (inner layer)*************
      for (int i = 0; i < numberOfRow; i++) {
        temp = results[i][numberOfColumnGeo];
        bw.write(tap + "<" + elementS[0] + ">\n");
        bw.write(tap + tap + "<" + layerName[loop] + ">\n");
        bw.write(tap + tap + tap + "<" + layerName[loop]+ "." +
                 columnName1 + ">" + id);
        id++;
        bw.write( "</" + layerName[loop]+ "." + columnName1 +
                 ">\n  ");
        for (int j = 0; j < numberOfColumn; j++) {

          bw.write(tap + tap + tap + "<" + layerName[loop] + "." +
                   columnName[j] + ">");
          bw.write(results[i][j]+"");
  //        System.out.print(columnName[j] + ":  " + results[i][j]);
          bw.write(  "</" + layerName[loop] + "." + columnName[j] +
                   ">\n");
          if (numberOfColumnGeo - 1 == j) {
            j++;
          }

        }

        bw.write(tap + tap + tap + tap + "<" + layerName[loop] + "." +
                 columnName[numberOfColumnGeo] + ">\n");



               if (!temp.endsWith("(EMPTY)")){
                 testString();
                 String c = "LINESTRING", a = "POLYGON", g = "POINT";
                 results[i][numberOfColumnGeo] = results[i][numberOfColumnGeo].
                     substring(0, results[i][numberOfColumnGeo].indexOf("("));

 if (results[i][numberOfColumnGeo].substring(results[i][
                           numberOfColumnGeo].length() - 10,
                                results[i][numberOfColumnGeo].length()).equals(c))
{
          bw.write(tap + tap + tap + tap + tap + "<gml:" +
                   "LineString>\n");
         bw.write(tap + tap + tap + tap + tap + tap + "<" + elementS[1] +
                  ">\n");
         bw.write(tap + tap + tap + tap + tap + tap + tap + "<" +
                  element3 + ">\n");
         bw.write(tap + tap + tap + tap + tap + tap + tap + tap + "<" +
                  elementS[3] + ">");

         bw.write(b);

       }
       else    if (results[i][numberOfColumnGeo].substring(results[i][
                           numberOfColumnGeo].length() - 7,
                           results[i][numberOfColumnGeo].length()).equals(a))
 {
         bw.write(tap + tap + tap + tap + tap + "<gml:" + "Polygon>\n");
         bw.write(tap + tap + tap + tap + tap + tap + "<" + elementS[1] +
                  ">\n");
         bw.write(tap + tap + tap + tap + tap + tap + tap + "<" +
                  elementS[2] + ">\n");
         bw.write(tap + tap + tap + tap + tap + tap + tap + tap + "<" +
                  elementS[3] + ">");

         bw.write(b);
       }
       else {
         bw.write(tap + tap + tap + tap + tap + "<gml:" + "Point>\n");
         bw.write(tap + tap + tap + tap + tap + tap + "<" + elementS[3] +
                  ">");

         bw.write(b);
       }

       //****** close element *************
        bw.write("<" + "/" + elementS[3] + ">\n");
    //    String ice=results[i][numberOfColumnGeo];
        if (results[i][numberOfColumnGeo].substring(results[i][
                          numberOfColumnGeo].length() - 7,
                          results[i][numberOfColumnGeo].length()).equals(a))
 {
         y = 5;
         for (int k = 2; k >= 1; k--) {
           for (int j = y; j >= 0; j--) {
             tap = tap + tap1;
           }
           bw.write(tap + "</" + elementS[k] + ">\n");
           y--;
           tap = "      ";
         }
           bw.write(tap + tap + tap + tap + tap + "</gml:" + "Polygon>\n");

       }
       else if (results[i][numberOfColumnGeo].substring(results[i][
                           numberOfColumnGeo].length() - 10,
                                results[i][numberOfColumnGeo].length()).equals(c))
{


           bw.write(tap+tap+tap+tap+tap+tap+tap+"</"+element3+">\n");
            bw.write(tap+tap+tap+tap+tap+tap + "</" + elementS[1] + ">\n");
            bw.write(tap + tap + tap + tap + tap + "</gml:" + "LineString>\n");

       }


         else {
           bw.write(tap + tap + tap + tap + tap + "</gml:" + "Point>\n");

         }


         bw.write(tap + tap + tap + tap + "</" + layerName[loop] + "." +
                 columnName[numberOfColumnGeo] + ">\n");
       //*****************************************
       bw.write(tap + tap + "</" + layerName[loop] + ">\n");
       bw.write(tap + "</" + elementS[0] + ">\n");

     }

  //*********** end loop  (inner layer) ************
}}
  //************end outer loop***************************
   bw.write("<" + "/" + element + ">");
  bw.newLine();
  bw.flush();
  bw.close();
  closeConnection();

}
catch (IOException ioe)
{ // open catch
  ioe.printStackTrace();
} catch (SQLException ee) {
  // TODO Auto-generated catch block
  ee.printStackTrace();
} catch (ClassNotFoundException ee) {
  // TODO Auto-generated catch block
  ee.printStackTrace();
}


}

//*******************************************************

  //******************************************************** private function ******************************************************
   private  void testString(){


    b = temp.substring(temp.lastIndexOf("(")+1);

    b = b.substring(0, (b.indexOf(")")));

  }

 //----------------------------------------------------------------------------------------------------------
 private int NumberOfColumnGeom(String[] columnName){
   int col = -1;
   int n = columnName.length;

   for (int i = 0; i < n; i++) {
    if(columnName[i].equals("the_geom")){
      col = i;
    }
   }
   return col;
 }
 //----------------------------------------------------------------------------------------------------------
 //----------------------------------------------------------------------------------------------------------
 ///////////////////////////////////////////////////////////////////////////////////////// private function /////////////////////////////////////////////////////////////////////////////////////////////
 public String[] getAllLayerName(String group) {  //only geometry table that user have a right to access

   try {

     ResultSet resultset = queryDB("Select L_Name " +
                                                              "From Layer_table " +
                                                              "Where owner in ( Select g_id " +
                                                                                               "From group_table " +
                                                                                               "Where g_name = '" + group + "')" +
                                                                          " or owner = '0' " +
                                                              "Order by type,L_Name");

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
 }  //end getAllLayer
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
private String[] getAllColumnName(String layer) {

try {

  ResultSet resultset = queryDB("Select * " +
                                                        "From " + layer +
                                                        " Where gid = ( Select min(gid) From " + layer + " )");

  ResultSetMetaData metadata = resultset.getMetaData();
  int column = metadata.getColumnCount();
  String[] g = new String[column ];

  if (resultset.next()) {
    for (int i = 1; i <= column; i++)
      g[i - 1] = metadata.getColumnName(i);
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
  private void findAllBoundary(String[] s) {
  int row = s.length;
  double[][] array = new double[4][row];      //   xmax   xmin   ymax   ymin

  for (int k=0; k<row; k++) {
    int i = s[k].indexOf(",");
    s[k] = s[k].substring(i + 1, s[k].length());

    String temp;

    i = s[k].indexOf(" ");
    temp = s[k].substring(0, i);
    array[1][k] = Double.parseDouble(temp);
    s[k] = s[k].substring(i + 1, s[k].length());

    i = s[k].indexOf(",");
    temp = s[k].substring(0, i);
    array[2][k] = Double.parseDouble(temp);
    s[k] = s[k].substring(i + 1, s[k].length());

    i = s[k].indexOf(",");
    s[k] = s[k].substring(i + 1, s[k].length());

    i = s[k].indexOf(" ");
    temp = s[k].substring(0, i);
    array[0][k] = Double.parseDouble(temp);
    s[k] = s[k].substring(i + 1, s[k].length());

    i = s[k].indexOf(",");
    temp = s[k].substring(0, i);
    array[3][k] = Double.parseDouble(temp);
    s[k] = s[k].substring(i + 1, s[k].length());

  }
//  transformMatrix = transformMatrix +  (ymin+ymax);
//  ymin = "0";
   findBoundary(array);

}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
private void findBoundary(double[][]array) {   //   xmax   xmin   ymax   ymin

  boundary[0] = findMax(array[0]);
  boundary[1] = findMin(array[1]);
  boundary[2] = findMax(array[2]);
  boundary[3] = findMin(array[3]);

}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
private double findMax (double[] array) {

  int row = array.length;

  double max = array[0];
  for (int i =1; i<row; i++ ){
    if (max < array[i]) max = array[i];
  }

  return max;
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
private double findMin (double[] array) {

  int row = array.length;

  double min = array[0];
  for (int i =1; i<row; i++ ){
    if (min > array[i]) min = array[i];
  }

  return min;
}
//---------------------------------------------------------------------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------------------------------------------------------------------------
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
    System.out.println("Connection Close!!\n");
  } catch (SQLException ee) {
    // TODO Auto-generated catch block
    ee.printStackTrace();
  }
}


}  //end class
