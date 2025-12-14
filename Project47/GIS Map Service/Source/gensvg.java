package project;

import java.io.*;
import java.sql.*; // All we need for JDBC

public class gensvg {
  /*
    private Connection connection;        // A connection to the database
    private Statement sql;       // Our statement to run queries with
    private DatabaseMetaData dbmd;// This is basically info the driver delivers
                                                      // about the DB it just connected to. I use
                                                      // it to get the DB version to confirm the
                                                      // connection in this example.

   */
  private databaseHandler db = new databaseHandler();
  private int numberOfColumnGeo = 1;
  private double[] boundary = new double[4]; //xmax xmin ymax ymin
  private String b = "";
  private String temp = "";
  private char check = ' ';
  private StringBuffer old = new StringBuffer("");

  private String color = "";
  private String path = "C:\\tomcat\\webapps\\ROOT\\";

  public boolean genSVGfromAllLayer(String group, String userName) { //only layer that user has the right to view
    if(group.equals("")){
      group="all user";
    }
    System.out.println("Creating file svg .....");
    String fileName = path + userName + ".svg";
    File outputFile = new File(fileName);
  //  File outputFile = new File("data.svg");
    outputFile.delete();

    String element, element0;
    //************************************
    String tap = "      ";
    String att[] = new String[20];
    //************* element **************
    element = "svg ";
    element0 = "g ";

    //*********** att ******************
    att[0] = "viewBox=\"";
    att[1] = "transform=\"";
    att[2] = "id=\"";
    att[3] = "stroke-width=\"";

    //  bound="691614.3859229767 1518168.2843684342 595.4106058167526 448.4599221749231";  // x max, y max, x min ,y min
    //      String transformMatrix="1 0 0 -1 0 3036785.0286590434";  //transform matrix
    //    strokeWidth="8.397566236062029E-4";  // stroke width

    //********** display ***************
    try { // opens try

      BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile, true));
      //      NumberOfColumnGeom();
      String[] layerName = getAllLayerName(group);
      int loopNumber = layerName.length;
      String[] allLayer = new String[loopNumber];

      String bound = "0 0 0 0"; // x min , y min, dif x, dif y
      ResultSet resultset;
      for (int k = 0; k < loopNumber; k++) {
        System.out.println("Finding envelope....");
        resultset = db.queryDB("Select envelope(geomunion(the_geom)) " +
                               "From " + layerName[k]);
        System.out.println("Finish get envelope!!");
        if (resultset.next()) {
          allLayer[k] = resultset.getString(1);
        }
      }

      findAllBoundary(allLayer);
      bound = boundary[1] + " " + boundary[3] + " " + (boundary[0] - boundary[1]) +
          " " + (boundary[2] - boundary[3]);
      String transformMatrix = "1 0 0 -1 0 ";
      transformMatrix = transformMatrix + (boundary[2] + boundary[3]);
      //    double strokeWidth = 0.5/Math.max(boundary[0]-boundary[1],boundary[2]-boundary[3]);
      //       String strokeWidth = "6.584471714686278E-7";

      double maxdim = Math.max(boundary[0] - boundary[1],
                               boundary[2] - boundary[3]);
      double strokeWidth = 0.5 / maxdim;
      double lineStrokeWidth = 5000 / maxdim;
      double radius = 0.5 * maxdim / 100;

      String header =
          "<?xml version=\"1.0\" encoding=\"iso-8859-1\" standalone=\"no\"?>\n";
      bw.write(header);
      bw.write("<" + element +
               "xml:space=\"preserve\" width=\"900\" height=\"500\" " + att[0] +
               bound + "\" id=\"svgAll\" onmousemove=\"showCoords(evt)\" onzoom=\"resetCoords()\" onscroll=\"resetCoords()\" onload=\"initMap(evt)\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n");
      bw.write("<" + element0 + att[1] + "matrix(" + transformMatrix + ")\">\n");
      bw.write("<script xlink:href=\"show_coordinates.js\" type=\"text/javascript\" onmouseover=\"showCity('ECC')\" onmouseout=\"emptyCity()\"/>\n");

      // draw back ground polygon
      bw.write(
          "<g id =\"back_ground\"  stroke-width=\"0\" visibility=\"visible\">\n");
      //        <path id="agricultural_industry_building_0" fill="rgb(255,255,0)" stroke="rgb(0,0,0)" d="M692445.498434488 1518350.40579138,692457.617979191 1518350.40579138,692457.622181038 1518358.11904121,692464.533055251 1518358.11904121,692464.533055251 1518353.76775004,692473.51159264 1518353.8717331,692473.51159264 1518342.37360616,692445.516153121 1518342.37360616,692445.498434488 1518350.40579138z" onmouseover="showCity('\u00CD\u00D2\u00A4\u00D2\u00C3\u00BB\u00AF\u00D4\u00BA\u00D1\u00B5\u00D4\u00A1\u00D2\u00C31\u00C0\u00D2\u00A4\u00C7\u00D4\u00AA\u00D2\u00E0\u00B7\u00A4\u00E2\u00B9\u00E2\u00C5\u00C2\u00D5\u00A1\u00D2\u00C3\u00BC\u00C5\u00D4\u00B5\u00BE\u00D7\u00AA')" onmouseout="emptyCity()" onclick="cityClick('\u00CD\u00D2\u00A4\u00D2\u00C3\u00BB\u00AF\u00D4\u00BA\u00D1\u00B5\u00D4\u00A1\u00D2\u00C31\u00C0\u00D2\u00A4\u00C7\u00D4\u00AA\u00D2\u00E0\u00B7\u00A4\u00E2\u00B9\u00E2\u00C5\u00C2\u00D5\u00A1\u00D2\u00C3\u00BC\u00C5\u00D4\u00B5\u00BE\u00D7\u00AA')"/>
      bw.write("\t<path id=\"back_ground_0\" fill=\"rgb(255,255,255)\" stroke=\"rgb(255,255,255)\" d=\"M" +
               boundary[1] + " " + boundary[3] + "," + boundary[0] + " " +
               boundary[3] + "," + boundary[0] + " " + boundary[2] + "," +
               boundary[1] + " " + boundary[2] + "," + boundary[1] + " " +
               boundary[3] +
          "z\" onmouseover=\"showCity('')\" onmouseout=\"emptyCity()\"/>\n");
      bw.write("</g>\n");

      //********** for loop*************
      for (int loop = 0; loop < loopNumber; loop++) { //repeat loop for each layer

        color = getDefaultColor(layerName[loop]);

        resultset = db.queryDB("Select gid,the_geom,name " +
                               "From " + layerName[loop] +
                               " Order by gid ");

        resultset.last(); // move to last row
        int numberOfRow = resultset.getRow(); // get row number
        String[][] results = new String[numberOfRow][3];

        resultset.beforeFirst(); // move to first row

        int k = -1;
        while (resultset.next()) {
          if (++k > numberOfRow) {
            break;
          }
          results[k][0] = resultset.getString(1); //gid
          results[k][1] = resultset.getString(2); //the geom
          results[k][2] = resultset.getString(3); //name
        } //end while
        check = getType(layerName[loop]);
        if (check == 'b') {
          bw.write("<" + element0 + att[2] + layerName[loop] + "\" " + att[3] +
                   lineStrokeWidth + "\"" + " visibility=\"visible\">\n");

        }
        else {
          bw.write("<" + element0 + att[2] + layerName[loop] + "\" " + att[3] +
                   strokeWidth + "\"" + " visibility=\"visible\">\n");
        }
        for (int i = 0; i < numberOfRow; i++) {

          temp = results[i][numberOfColumnGeo];
          if (!temp.endsWith("(EMPTY)")) {
            testString();
            String c = "LINESTRING", a = "POLYGON", g = "POINT";
            results[i][numberOfColumnGeo] = results[i][numberOfColumnGeo].
                substring(0, results[i][numberOfColumnGeo].indexOf("("));
            if (results[i][numberOfColumnGeo].substring(results[i][
                numberOfColumnGeo].length() - 7,
                results[i][numberOfColumnGeo].length()).equals(a)) {
              bw.write(tap + "<path " + att[2] + layerName[loop] + "_" +
                       results[i][0] +
                       "\" fill=\"" + color + "\" stroke=\"rgb(0,0,0)\"");
              bw.write(" d=\"M" + b + "z\" onmouseover=\"showCity('" +
                       results[i][2] +
                       "')\" onmouseout=\"emptyCity()\" onclick=\"cityClick('" +
                       results[i][2] + "')\"/>\n");
            }
            else if (results[i][numberOfColumnGeo].substring(results[i][
                numberOfColumnGeo].length() - 10,
                results[i][numberOfColumnGeo].length()).equals(c)) {
              bw.write(tap + "<path " + att[2] + layerName[loop] + "_" +
                       results[i][0] +
                       "\" fill=\"none\" stroke=\"" + color + "\"");
              bw.write(" d=\"M" + b + "\" onmouseover=\"showCity('" +
                       results[i][2] +
                       "')\" onmouseout=\"emptyCity()\" onclick=\"cityClick('" +
                       results[i][2] + "')\"/>\n");

            }
            else {
              String cx, cy;
              cx = b.substring(0, b.indexOf(" "));
              cy = b.substring(b.indexOf(" ") + 1, b.length());
              bw.write(tap + "<ellipse " + att[2] + layerName[loop] + "_" +
                       results[i][0] +
                       "\" fill=\"" + color + "\" stroke=\"rgb(0,0,0)\"");
              bw.write(" cx=\"" + cx + "\" cy=\"" + cy +
                       "\" rx=\"" + radius + "\" ry=\"" + radius +
                       "\" onmouseover=\"showCity('" + results[i][2] +
                       "')\" onmouseout=\"emptyCity()\" onclick=\"cityClick('" +
                       results[i][2] + "')\"/>\n");

            }
            ///**************** check loop*************
             //System.out.println("finish row" + i);
          }
        } //end for (i)
        bw.write("<" + "/" + element0 + ">\n");
      } // end for (loop)

      //*********** end loop ************

       bw.write("<g id=\"groupShowCoords\" transform=\"translate(" + boundary[1] +
                " " + (boundary[2] + boundary[3]) + ")\">\n");
      bw.write("<" + "/" + element0 + ">\n");

      /////////////////////////////////////////////////////////////
      bw.write("<" + "/" + element0 + ">\n");
      bw.write("<" + "/" + element + ">\n");
      bw.flush();
      bw.close();

      System.out.println("finish create svg file");

      //        db.closeConnection() ;

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
  } //end gen svg from all layer

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public boolean genSVGfromAllLayer(String group, String[] box, String userName) { // xmax xmin ymax ymin
    //only layer that user has the right to view
    double[] doub = new double[4];

    for (int i = 0; i < 4; i++) {
      if (box[i].equals("")) {
        return false;
      }
      doub[i] = Double.parseDouble(box[i]);
    }
    if (doub[0] < doub[1]) {  //swap xmax xmin
      box[0] = doub[1] + "";
      box[1] = doub[0] + "";
      System.out.println("swap x value");
    }
    if (doub[2] < doub[3]) {  //swap ymax ymin
      box[2] = doub[3] + "";
      box[3] = doub[2] + "";
      System.out.println("swap y value");
    }

    System.out.println("Creating file svg (in box).....");
    String fileName = path + userName + ".svg";
    File outputFile = new File(fileName);
//    File outputFile = new File("data.svg");
    outputFile.delete();

    String element, element0;
    //************************************
    String tap = "      ";
    String att[] = new String[4];
    //************* element **************
    element = "svg ";
    element0 = "g ";

    //*********** att ******************
    att[0] = "viewBox=\"";
    att[1] = "transform=\"";
    att[2] = "id=\"";
    att[3] = "stroke-width=\"";
    //********** display ***************
    try { // opens try

      BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile, true));
      //      NumberOfColumnGeom();
      String[] layerName = getAllLayerName(group);
      int loopNumber = layerName.length;

      String bound = "0 0 0 0"; // x min , y min, dif x, dif y
      ResultSet resultset;

      boundary[0] = Math.max(Double.parseDouble(box[0]),
                             Double.parseDouble(box[1]));
      boundary[1] = Math.min(Double.parseDouble(box[0]),
                             Double.parseDouble(box[1]));
      boundary[2] = Math.max(Double.parseDouble(box[2]),
                             Double.parseDouble(box[3]));
      boundary[3] = Math.min(Double.parseDouble(box[2]),
                             Double.parseDouble(box[3]));

      for (int i = 0; i < 4; i++) {
        boundary[i] = Double.parseDouble(box[i]);
      }
      bound = boundary[1] + " " + boundary[3] + " " + (boundary[0] - boundary[1]) +
          " " + (boundary[2] - boundary[3]);
      String transformMatrix = "1 0 0 -1 0 ";
      transformMatrix = transformMatrix + (boundary[2] + boundary[3]);

      // building the box of area that user want
      String area = "MULTIPOLYGON(((";
      area = area + box[1] + " " + box[3] + ","; //xmin ymin;
      area = area + box[1] + " " + box[2] + ","; //xmin ymax;
      area = area + box[0] + " " + box[2] + ","; //xmax ymax;
      area = area + box[0] + " " + box[3] + ","; //xmax ymin;
      area = area + box[1] + " " + box[3] + ")))"; //xmin ymin;

      double maxdim = Math.max(boundary[0] - boundary[1],
                               boundary[2] - boundary[3]);
      double strokeWidth = 1 / maxdim;
      double lineStrokeWidth = 5000 / maxdim;
      double radius = 1.5 * maxdim / 100;

      String header =
          "<?xml version=\"1.0\" encoding=\"iso-8859-1\" standalone=\"no\"?>\n";
      bw.write(header);
      bw.write("<" + element +
               "xml:space=\"preserve\" width=\"900\" height=\"500\" " + att[0] +
               bound + "\" id=\"svgAll\" onmousemove=\"showCoords(evt)\" onzoom=\"resetCoords()\" onscroll=\"resetCoords()\" onload=\"initMap(evt)\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n");
      bw.write("<" + element0 + att[1] + "matrix(" + transformMatrix + ")\">\n");
      bw.write("<script xlink:href=\"show_coordinates.js\" type=\"text/javascript\" onmouseover=\"showCity('ECC')\" onmouseout=\"emptyCity()\"/>\n");

      // draw back ground polygon
      bw.write(
          "<g id =\"back_ground\"  stroke-width=\"0\" visibility=\"visible\">\n");
      bw.write("\t<path id=\"back_ground_0\" fill=\"rgb(255,255,255)\" stroke=\"rgb(255,255,255)\" d=\"M" +
               boundary[1] + " " + boundary[3] + "," + boundary[0] + " " +
               boundary[3] + "," + boundary[0] + " " + boundary[2] + "," +
               boundary[1] + " " + boundary[2] + "," + boundary[1] + " " +
               boundary[3] +
          "z\" onmouseover=\"showCity('')\" onmouseout=\"emptyCity()\"/>\n");
      bw.write("</g>\n");
      //********** for loop*************
      for (int loop = 0; loop < loopNumber; loop++) { //repeat loop for each layer

        color = getDefaultColor(layerName[loop]);
        resultset = db.queryDB("Select gid,intersection(the_geom,'" + area +
                               "'),name " +
                               "From " + layerName[loop] +
                               " Where not intersection(the_geom,'" + area +
                               "') = 'GEOMETRYCOLLECTION(EMPTY)'" +
                               " Order by gid ");

        resultset.last(); // move to last row
        int numberOfRow = resultset.getRow(); // get row number
        String[][] results = new String[numberOfRow][3];

        resultset.beforeFirst(); // move to first row

        int k = -1;
        while (resultset.next()) {
          if (++k > numberOfRow) {
            break;
          }
          results[k][0] = resultset.getString(1); //gid
          results[k][1] = resultset.getString(2); //the geom
          results[k][2] = resultset.getString(3); //name
        } //end while
        check = getType(layerName[loop]);
        if (check == 'b') {
          bw.write("<" + element0 + att[2] + layerName[loop] + "\" " + att[3] +
                   lineStrokeWidth + "\"" + " visibility=\"visible\">\n");

        }
        else {
          bw.write("<" + element0 + att[2] + layerName[loop] + "\" " + att[3] +
                   strokeWidth + "\"" + " visibility=\"visible\">\n");
        }
        for (int i = 0; i < numberOfRow; i++) {

          temp = results[i][numberOfColumnGeo];
          if (!temp.endsWith("(EMPTY)")) {
            testString();
            String c = "LINESTRING", a = "POLYGON", g = "POINT";
            results[i][numberOfColumnGeo] = results[i][numberOfColumnGeo].
                substring(0, results[i][numberOfColumnGeo].indexOf("("));
            if (results[i][numberOfColumnGeo].substring(results[i][
                numberOfColumnGeo].length() - 7,
                results[i][numberOfColumnGeo].length()).equals(a)) {
              bw.write(tap + "<path " + att[2] + layerName[loop] + "_" +
                       results[i][0] +
                       "\" fill=\"" + color + "\" stroke=\"rgb(0,0,0)\"");
              bw.write(" d=\"M" + b + "z\" onmouseover=\"showCity('" +
                       results[i][2] +
                       "')\" onmouseout=\"emptyCity()\" onclick=\"cityClick('" +
                       results[i][2] + "')\"/>\n");
              //   countP++;
            }
            else if (results[i][numberOfColumnGeo].substring(results[i][
                numberOfColumnGeo].length() - 10,
                     results[i][numberOfColumnGeo].length()).equals(c)) {
              bw.write(tap + "<path " + att[2] + layerName[loop] + "_" +
                       results[i][0] +
                       "\" fill=\"none\" stroke=\"" + color + "\"");
              bw.write(" d=\"M" + b + "\" onmouseover=\"showCity('" +
                       results[i][2] +
                       "')\" onmouseout=\"emptyCity()\" onclick=\"cityClick('" +
                       results[i][2] + "')\"/>\n");

            }
            else {
              String cx, cy;
              cx = b.substring(0, b.indexOf(" "));
              cy = b.substring(b.indexOf(" ") + 1, b.length());
              bw.write(tap + "<ellipse " + att[2] + layerName[loop] + "_" +
                       results[i][0] +
                       "\" fill=\"" + color + "\" stroke=\"rgb(0,0,0)\"");
              bw.write(" cx=\"" + cx + "\" cy=\"" + cy +
                       "\" rx=\"" + radius + "\" ry=\"" + radius +
                       "\" onmouseover=\"showCity('" + results[i][2] +
                       "')\" onmouseout=\"emptyCity()\" onclick=\"cityClick('" +
                       results[i][2] + "')\"/>\n");

            }
            ///**************** check loop*************
             //System.out.println("finish row" + i);
          }
        } //end for (i)
        bw.write("<" + "/" + element0 + ">\n");
      } // end for (loop)

      //*********** end loop ************

       bw.write("<g id=\"groupShowCoords\" transform=\"translate(" + boundary[1] +
                " " + (boundary[2] + boundary[3]) + ")\">\n");
      bw.write("<" + "/" + element0 + ">\n");

      /////////////////////////////////////////////////////////////
      bw.write("<" + "/" + element0 + ">\n");
      bw.write("<" + "/" + element + ">\n");
      bw.flush();
      bw.close();

      System.out.println("finish create svg file");

      //        db.closeConnection() ;

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
  } //end gen svg from all layer

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------

///////////////////////////////////////////////////////////////////////////////////////// private function /////////////////////////////////////////////////////////////////////////////////////////////
  public String[] getAllLayerName(String group) { //only geometry table that user have a right to access

    try {
      //    db.dbConnect();   //            <<<<<<<<<<<<<<<<<<<<<<<<<<<,

      ResultSet resultset = db.queryDB("Select L_Name " +
                                       "From Layer_table " +
                                       "Where owner in ( Select g_id " +
                                       "From group_table " +
                                       "Where g_name = '" + group + "')" +
                                       " or owner = '0' " +
                                       "Order by type,L_Name");

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
  public String char2string(char[] cha) {
    String st = "";
    int len = cha.length;
    for (int i = 0; i < len; i++) {
      st = st + cha[i];
    }
    return st;
  }

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private String[] getAllColumnName(String layer) {

    try {

      ResultSet resultset = db.queryDB("Select * " +
                                       "From " + layer +
                                       " Where g_id = ( Select min(g_id) From " +
                                       layer + " )");

      ResultSetMetaData metadata = resultset.getMetaData();
      int column = metadata.getColumnCount();
      String[] g = new String[column];

      if (resultset.next()) {
        for (int i = 1; i <= column; i++) {
          g[i - 1] = metadata.getColumnName(i);
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

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String getDefaultColor(String layer) {

    String color = "rgb(255,255,255)";
    try {
      //    db.dbConnect();          //<<<<<<<<<<<<<<<<<<<<<<<<<<
      ResultSet resultset = db.queryDB("Select color " +
                                       "From layer_table " +
                                       "Where l_name = '" + layer + "'");

      if (resultset.next()) {
        color = resultset.getString(1);
      }

      return color;

    }
    catch (SQLException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }
    catch (ClassNotFoundException ee) {
      // TODO Auto-generated catch block
      ee.printStackTrace();
    }

    return color;
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

//---------------------------------------------------------------------------------------------------------------------------------------------------------
  public String color2HexColor(String color1) {
    if (color1 == null) return "#000000";

    String hexC = "#";
    String tempC = "";
    String tempC1 = "";
    String color = "";
    int u = 0;
    int h = 0;
    for (int k = 0; k < 3; k++) {
      if (k == 0) {
        color = color1.substring(color1.indexOf("(") + 1, color1.indexOf(","));
      }
      else if (k == 1) {
        color = color1.substring(color1.indexOf(",") + 1,
                                 color1.lastIndexOf(","));
      }
      else {
        color = color1.substring(color1.lastIndexOf(",") + 1,
                                 color1.indexOf(")"));
      }

      u = Integer.parseInt(color) / 16;
      h = Integer.parseInt(color) - (u * 16);

      if (u == 10) {
        tempC = "A";
      }
      else if (u == 11) {
        tempC = "B";
      }
      else if (u == 12) {
        tempC = "C";
      }
      else if (u == 13) {
        tempC = "D";
      }
      else if (u == 14) {
        tempC = "E";
      }
      else if (u == 15) {
        tempC = "F";
      }
      else {
        tempC = String.valueOf(u);
      }
      if (h == 10) {
        tempC1 = "A";
      }
      else if (h == 11) {
        tempC1 = "B";
      }
      else if (h == 12) {
        tempC1 = "C";
      }
      else if (h == 13) {
        tempC1 = "D";
      }
      else if (h == 14) {
        tempC1 = "E";
      }
      else if (h == 15) {
        tempC1 = "F";
      }
      else {
        tempC1 = String.valueOf(h);
      }
      hexC = hexC + tempC + tempC1;

    }

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
    return hexC;
  }

//---------------------------------------------------------------------------------------------------------------------------------------------------------
  /*
//Connect to database
    private  void dbConnect()  throws ClassNotFoundException, SQLException {
      String database = "mapserver";
      String username = "postgres";
      String password = "michaelowen";
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
//---------------------------------------------------------------------------------------------------------------------------------------------------------
   */
  private void findAllBoundary(String[] s) {
    int row = s.length;
    double[][] array = new double[4][row]; //   xmax   xmin   ymax   ymin

    for (int k = 0; k < row; k++) {
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
  private void findBoundary(double[][] array) { //   xmax   xmin   ymax   ymin

    boundary[0] = findMax(array[0]);
    boundary[1] = findMin(array[1]);
    boundary[2] = findMax(array[2]);
    boundary[3] = findMin(array[3]);

  }

//---------------------------------------------------------------------------------------------------------------------------------------------------------
  private double findMax(double[] array) {

    int row = array.length;

    double max = array[0];
    for (int i = 1; i < row; i++) {
      if (max < array[i]) {
        max = array[i];
      }
    }

    return max;
  }

//---------------------------------------------------------------------------------------------------------------------------------------------------------
  private double findMin(double[] array) {

    int row = array.length;

    double min = array[0];
    for (int i = 1; i < row; i++) {
      if (min > array[i]) {
        min = array[i];
      }
    }

    return min;
  }

//---------------------------------------------------------------------------------------------------------------------------------------------------------
  private void testString() {

    b = temp.substring(temp.lastIndexOf("(") + 1);

    b = b.substring(0, (b.indexOf(")")));

  }

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------

  private void file(String userName) {

    //open file for reading
    try {
      try {
        String fileName = path + userName + ".svg";
        FileInputStream inputFile = new FileInputStream(fileName);
       // FileInputStream inputFile = new FileInputStream("data.svg");

        //create InputStreamReader that uses default character encoding for reading the
        //  characters from the file.
        InputStreamReader reader = new InputStreamReader(inputFile);
        BufferedReader bufferedReader = new BufferedReader(reader);

        String line; //line read from file

        old = old.delete(0, old.length());
        while ( (line = bufferedReader.readLine()) != null) {
          old = old.append(line + "\n");

        }

        inputFile.close();
        reader.close();
        bufferedReader.close();

      }
      catch (FileNotFoundException e) {
        System.out.println("File not found: " + e.toString());
      }

    }
    catch (IOException ioe) {
      System.out.println("Error found: " + ioe.toString());
    }

  }

  //---------------------------------------------------------------------------------------------------------------------
  private boolean setAllVisible(String userName) {
 String fileName = path + userName + ".svg";
    file(userName);
    StringBuffer n = new StringBuffer("");

    int index = old.indexOf("visibility=\"") + 12;
    while (index != 11) {
      n.append(old.substring(0, index));
      old.delete(0, index);

      n.append("visible");
      index = old.indexOf("\"");
      old.delete(0, index);

      index = old.indexOf("visibility=\"") + 12;
    }

    n.append(old);

    File outputFile = new File(fileName);
    outputFile.delete();

    try { // opens try

      BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile, true));

      bw.write(n.toString());
      bw.flush();
      bw.close();
      return true;
    } // closes try
    catch (IOException ioe) { // open catch
      System.out.println("Error found: " + ioe.toString());
    } // close catch

    return false;
  }

  //---------------------------------------------------------------------------------------------------------------------
  public boolean replaceString(String[] layerName, String userName) { //only hidden layer

    file(userName);

    //----------set all visible-----------------------
    String temp = old.toString();
    temp = temp.replaceAll("hidden", "visible");
    old.delete(0, old.length());
    old.append(temp);

    int row = layerName.length;
    StringBuffer n = new StringBuffer("");

    for (int i = 0; i < row; i++) {

      int index = old.indexOf(layerName[i]);
        index = index + layerName[i].length();
        n.append(old.substring(0, index));
        old.delete(0, index);

        index = old.indexOf("\"visible\"");
        n.append(old.substring(0, index));
        old.delete(0, index + 9);
        n.append("\"hidden\"");


    }

    n.append(old);
    String fileName = path + userName + ".svg";
    File outputFile = new File(fileName);
    outputFile.delete();
    try { // opens try

      BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile, true));

      bw.write(n.toString());
      bw.flush();
      bw.close();
      return true;
    } // closes try
    catch (IOException ioe) { // open catch
      System.out.println("Error found: " + ioe.toString());
    } // close catch

    return false;
  }

  //------------------------------------------------------------------------------------------------------------------------------------------------------------
  public boolean deleteSymbol(String userName) {
    file(userName);

    String pattern = "<g id=\"addSymbol\">";
    int index = old.indexOf(pattern);
//   old.delete(index,pattern.length());
    if (index != -1) { //do delete
      pattern = "</g >";
      int end = old.lastIndexOf(pattern);
      old.delete(index, end);
      return true;
    }
    return false;
  }

  //------------------------------------------------------------------------------------------------------------------------------------------------------------
  public boolean addSymbol(String[] layer, String searchedName, String userName) {
    System.out.println("\nadding symbol......");

    deleteSymbol(userName);

    //String n = "";
    String fileName = path + userName + ".svg";
    File outputFile = new File(fileName);
//    File outputFile = new File("data.svg");
    outputFile.delete();
    try { // opens try
      BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile, true));

      int index = old.indexOf("<defs>");
      if (index == -1) { //do insert symbol pattern
        index = old.indexOf("<g id");
        //       index--;
        bw.write(old.substring(0, index));
        old.delete(0, index);

        bw.write("\n<defs>\n");
        bw.write("\t<symbol id=\"pool_indoor\" overflow=\"visible\"  transform=\"translate(-16,-17.5)\">\n");
        bw.write("\t\t<rect x=\"0\" y=\"-2.5\" rx=\"2\" ry=\"2\" width=\"32\" height=\"35\" style=\"fill:none\"/>\n");
        bw.write("\t\t<path d=\"M6 7.5 l0 20 l20 0 l0 -20\" style=\"fill:red;stroke:rgb(0,0,0);stroke-width:7\"/>\n");
        bw.write("\t\t<path d=\"M1 10 l15 -10 l15 10\" style=\"fill:red;stroke:rgb(0,0,0);stroke-width:7\"/>\n");
        bw.write("\t</symbol>\n");
        bw.write("</defs>\n");

      }

      // create symbol header
      index = old.indexOf("<use ");
      index = old.lastIndexOf("</g >");
      bw.write(old.substring(0, index));
      old.delete(0, index);

      bw.write("<g id=\"addSymbol\">\n");

      String[][] result = getGeometryCenterByName(searchedName, layer);
      int loop = result.length;
      for (int i = 0; i < loop; i++) {
        int inLoop = result[i].length;
        for (int j = 0; j < inLoop; j++) {
          if (!result[i][j].equals("")) {
            bw.write("\t<use x=\"");
            index = result[i][j].lastIndexOf("(");
            result[i][j] = result[i][j].substring(index, result[i][j].length());
            index = result[i][j].indexOf(" ");
            bw.write(result[i][j].substring(1, index) + "\" y=\"");
            bw.write(result[i][j].substring(index + 1,
                                            result[i][j].length() - 1));
            bw.write("\" xlink:href=\"#pool_indoor\"/>\n");
          }
        } //end for j
      } //end for i

      bw.write("</g >\n" + old);
      bw.flush();
      bw.close();
      System.out.println("finish adding symbol!!");

      return true;
    } // closes try
    catch (IOException ioe) { // open catch
      System.out.println("Error found: " + ioe.toString());
    } // close catch

    return false;
  }

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------
  private String[][] getGeometryCenterByName(String name, String[] layerName) {
    try {

      name = new String(name.getBytes("UTF-8"), "WINDOWS-874").toString();
      int loop = layerName.length;
      String[][] g = new String[loop][0];

      // db.dbConnect();   //            <<<<<<<<<<<<<<<<<<<<<<<<<<<,
      for (int i = 0; i < loop; i++) {
        ResultSet resultset = db.queryDB("Select astext(Centroid(the_geom)) " +
                                         "From " + layerName[i] +
                                         " Where name = '" + name + "'");
        resultset.last(); // move to last row
        int row = resultset.getRow(); // get row number
        g[i] = new String[row];
        resultset.beforeFirst(); // move to first row
        int j = -1;
        while (resultset.next()) {
          g[i][++j] = resultset.getString(1);
        } //end while
      }

      //     String[] gg = new String[len];

      //db.closeConnection();
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
  } //end get geometry center by name

//-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[] getColorFromFile(String[] layerName, String userName) {
    file(userName);

    int row = layerName.length;
    String[] color = new String[row];
    int index = -1;
    String s = "<g id=\"";
    String pattern = "";

    for (int i = 0; i < row; i++) { //for each layer
      index = old.indexOf(s + layerName[i] + "\"");
      color[i] = "rgb(0,0,0)";
//      if (index != -1) {
      old.delete(0, index);

      pattern = "fill=\"";
      index = old.indexOf(pattern);
      int end = old.indexOf("</g >");
      if (index < end ) {
        if (index != -1) {
          index = index + pattern.length();
          old.delete(0, index);

          pattern = "\"";
          index = old.indexOf(pattern);
          String c = old.substring(0, index);

          if (c.equals("none")) {
            pattern = "stroke=\"";
            index = old.indexOf(pattern) + pattern.length();
            old.delete(0, index);

            pattern = "\"";
            index = old.indexOf(pattern);
            //  color[i] = layerName[i];
            color[i] = old.substring(0, index);
          }
          else {
            //color[i] = layerName[i];
            color[i] = c;
          }
        } //end if
      }

    } //end for

    return color;
  }

//-------------------------------------------------------------------------------------------------------------------------------------------------------------

  public boolean replaceColor(String[] layer, String[] color, String userName) {

    file(userName);

    int column = layer.length;

    String n = "";
    String tail = "";
    for (int i = 0; i < column; i++) { //for each layer
      if (!color[i].equals("")) { //do replace color
        int index = old.indexOf(layer[i]);
          int len = layer[i].length();
          n = n + old.substring(0, index + len);
          old.delete(0, index + len);

          index = old.indexOf("</g >") + 5;
   //       String backup = old.substring(0,index);
          tail = old.substring(index);
          old.delete(index, old.length());

          index = old.indexOf("fill=") + 6; // fill="
          int end = old.indexOf("</g >");
          if ((end > index ) && (index != 5)){

              boolean isLine = false;
              if (old.substring(index, index + 4).equals("none")) {
                isLine = true;

              }
              String word = "fill=\"";
              if (isLine) {
                word = "stroke=\"";
              }
              len = word.length();

              index = old.indexOf(word);
              while (index != -1) {

                n = n + old.substring(0, index + len);
                old.delete(0, index + len);
                n = n + color2rgb(color[i]);
                index = old.indexOf("\"");
                old.delete(0, index);

                index = old.indexOf(word);
              }

              n = n + old.toString();
            } //end if
            else {
              n = n + old;
           //   index = old.indexOf(">");
             // n = n + "\" ";
            }
      }
      else {
        int index = old.indexOf("</g >") + 5;
        n = n + old.substring(0, index);
        tail = old.substring(index, old.length());
      }

      old.delete(0, old.length());
      old.append(tail);
    } //end for i

    n = n + tail;
       String fileName = path + userName + ".svg";
    File outputFile = new File(fileName);
    outputFile.delete();
    try { // opens try
      BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile, true));

      bw.write(n);
      bw.flush();
      bw.close();

      return true;
    } // closes try
    catch (IOException ioe) { // open catch
      System.out.println("Error found: " + ioe.toString());
    } // close catch

    return false;
  }

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public String[][] getAllGeoNameAndCenter(String layerName) { //for geometry table only, get all geometry name and its center
    // no center return for line layer

    try {
      //     db.dbConnect();          //<<<<<<<<<<<<<<<<<<<<<<<<<<

      boolean isLine = false;
      if (getType(layerName) == 'b') {
        isLine = true;

      }
      ResultSet resultset = db.queryDB(
          "Select name,astext(centroid(the_geom)) " +
          "From " + layerName +
          " Order by gid");

      resultset.last(); // move to last row
      int row = resultset.getRow(); // get row number
      String[][] g = new String[2][row];

      resultset.beforeFirst(); // move to first row
      int i = -1;
      while (resultset.next()) {
        if (++i > row) {
          break;
        }
        g[0][i] = resultset.getString(1);
        g[1][i] = "";
        if (!isLine) {
          g[1][i] = resultset.getString(2);
        }
      } //end while

      //     db.closeConnection();

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
  }

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public char getType(String layerName) {
    try {
      //    db.dbConnect();   //            <<<<<<<<<<<<<<<<<<<<<<<<<<<,

      ResultSet resultset = db.queryDB("Select type " +
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

  public boolean replaceStroke(String layerName, boolean isMul2, String userName) {

    file(userName);

    StringBuffer n = new StringBuffer("");

    int index = old.indexOf(layerName);
    n.append(old.substring(0, index + layerName.length() + 1));
    old.delete(0, index + layerName.length() + 1);

    index = old.indexOf("\" visibility=");
    String tail = old.substring(index);
    old.delete(index, old.length());

    index = old.indexOf("stroke-width=\"") + 14; //  stroke-width="
 //   if (index == -1) return false;
    old.delete(0, index);

    // now "old" is the old size
    // increase or decrease size
    double size = Double.parseDouble(old.toString());
    if (isMul2) {
      size = size * 2;
    }
    else {
      size = size / 2;

    }
    old.delete(0, old.length());
    old.append(Double.toString(size));

    n.append(" stroke-width=\"" + old);
    n.append(tail);

    String fileName = path + userName + ".svg";
    File outputFile = new File(fileName);
    outputFile.delete();
    try { // opens try

      BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile, true));
      bw.write(n.toString());
      bw.flush();
      bw.close();

      return true;
    } // closes try
    catch (IOException ioe) { // open catch
      System.out.println("Error found: " + ioe.toString());
    } // close catch

    return false;
  }

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------
  public boolean replaceRadias(String layerName, boolean isMul2, String userName) {
    file(userName);

    int index = old.indexOf(layerName);
    int len = layerName.length();
    String n = old.substring(0, index + len);
    old.delete(0, index + len);

    index = old.indexOf("</g >");
    String tail = old.substring(index);
    old.delete(index, old.length());

    index = old.indexOf("rx=") + 4; // rx="
    if (index == 3) return false;
    while (index != 3) {

      n = n + old.substring(0, index);
      old.delete(0, index);

      index = old.indexOf("\"");

      double size = Double.parseDouble(old.substring(0, index));
      if (isMul2) {
        size = size * 2;
      }
      else {
        size = size / 2;

      }

      n = n + Double.toString(size) + "\" ry=\"" + Double.toString(size) + "\"";
      index = old.indexOf("ry=\"");
      old.delete(0, index);
      index = old.indexOf("\"") + 1;
      old.delete(0, index);
      index = old.indexOf("\"") + 1;
      old.delete(0, index);

      index = old.indexOf("rx=") + 4; // rx="

    }

    n = n + old + tail;

    String fileName = path + userName + ".svg";
    File outputFile = new File(fileName);
    outputFile.delete();
    try { // opens try

      BufferedWriter bw = new BufferedWriter(new FileWriter(outputFile, true));

      bw.write(n);
      bw.flush();
      bw.close();

      return true;
    } // closes try
    catch (IOException ioe) { // open catch
      System.out.println("Error found: " + ioe.toString());
    } // close catch

    return false;
  }

  //-------------------------------------------------------------------------------------------------------------------------------------------------------------

}
