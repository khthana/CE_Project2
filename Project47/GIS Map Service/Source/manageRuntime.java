package project;

public class manageRuntime {

  private String path = "C:\\tomcat\\webapps\\ROOT\\";
  private String toolsPath = "C:\\tomcat\\tools\\";

//////////////////////////////////////////////////////////////// public function //////////////////////////////////////////////////////////////////
  public boolean genSVGFromGML(String userName) {
    String gmlFile = userName + "toSVG.gml";
    String xslFile = "last.xsl";
    String svgFile = userName + "fromGML.svg";

    try {
      Runtime rt = Runtime.getRuntime();
      rt.exec(toolsPath + "xt " + toolsPath + gmlFile + " " + toolsPath +
              xslFile + " " + path + svgFile);
      System.out.println("Convert finish!!");
      return true;
    }
    catch (Exception e) {
      e.printStackTrace();
    }

    return false;
  }
//----------------------------------------------------------------------------------------------------------------------------
  public boolean zipGMLFile(String userName) {  // type  = ".dtd" or ".gml"
    String zipName = userName + "_gml.zip";
    String inputFile = userName + ".gml";

    try {
      Runtime rt = Runtime.getRuntime();
      rt.exec(toolsPath + "rar a " + path + zipName + " " + path + inputFile);
      System.out.println("Zip finish!!");
      return true;
    }
    catch (Exception e) {
      e.printStackTrace();
    }

    return false;
  }
//----------------------------------------------------------------------------------------------------------------------------
  public boolean zipDTDFile(String layerName) {
    String zipName = layerName + "_dtd.zip";
    String inputFile = layerName + ".dtd";

    try {
      Runtime rt = Runtime.getRuntime();
      rt.exec(toolsPath + "rar a " + path + zipName + " " + path + inputFile);
      System.out.println("Zip finish!!");
      return true;
    }
    catch (Exception e) {
      e.printStackTrace();
    }

    return false;
  }
//----------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------------------
  public boolean zipSVGFile(String userName,boolean isConverted) {

    String zipName = "";
    String svgFile = "";
    String javaScripFile = "show_coordinates.js";

    if (isConverted) {
      zipName = "convertFromGML_" + userName + ".zip";
//      svgFile = "jane.svg";
      svgFile = userName + "fromGML.svg";
    }
    else {
      zipName = userName + "_svg.zip";
//      svgFile = "jane.svg";
      svgFile = userName + ".svg";
    }

    try {
     Runtime rt = Runtime.getRuntime();
     rt.exec(toolsPath + "rar a " + path + zipName + " " + path + svgFile + " " + path + javaScripFile);
     System.out.println("Zip SVG finish!!");
     return true;
   }
   catch (Exception e) {
     e.printStackTrace();
   }

   return false;
  }
//-------------------------------------------------------------------------------------------------------------------------------------------------------------
/*
  public boolean logOut(String userName) {
    String[] file = new String[6];
    int len = file.length;
    file[0] = userName + ".svg";   //svg file
    file[1] = userName + "_svg.zip";  //svg zip file
    file[2] = userName + ".gml";  // gml file
    file[3] = userName + "_gml.zip";  //gml zip file
    file[4] = userName + "fromGML.svg";  // generated svg
    file[5] = "convertFromGML_" + userName + ".zip";  //generate zip svg

    String uploadedGML = userName + "toSVG.gml";  // uploaded gml
//    String uploadedXML = userName + "user";

    try {
      for (int i=0; i<len; i++) {
        Runtime rt = Runtime.getRuntime();
        rt.exec("del " + path + file[i]);
//        p.exitValue(
        System.out.println(file[i] + " deleted!!");
      }
      Runtime rt = Runtime.getRuntime();
      rt.exec("del " + toolsPath + uploadedGML);
      System.out.println(uploadedGML + " deleted!!");
      return true;
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  return false;
}
      }
     */
    //-------------------------------------------------------------------------------------------------------------------------------------------------------------

}

