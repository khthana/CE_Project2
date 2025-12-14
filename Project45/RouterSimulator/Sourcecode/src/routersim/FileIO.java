/* save and open network design*/
package routersim;

import java.rmi.*;
import java.rmi.server.*;
import java.util.Vector;
import java.io.*;
import java.lang.String;
import java.lang.*;
import java.util.*;
import java.io.*;
import java.util.*;

public class FileIO {

  static int index1=0;
  static Vector name = new Vector();
  static Vector interfaces = new Vector();
  static boolean flag = true;
  static boolean found = true;
  static boolean empty = true;
  static boolean save_flage = false;

  static String Intname1;
  static String Newname;
  static String serverName = "";
  static int load=-1;
  static String filePath = ""; //-- selecting file
  static String fileName = ""; //-- selecting file

  final static String filename = "diagram.dat"; //-- working file
  private String newstr = "";


  public FileIO(){

    try { //-- create work file

      serverName = Frame3.getHostname();
      FileWriter fout = new FileWriter( filename );
      BufferedWriter bout = new BufferedWriter(fout);
      PrintWriter pout = new PrintWriter(bout);
      pout.print(""); //-- create blank file
      pout.close();
    }
    catch( Exception e ) {}
  }

  //-- save to the old file
  public void saveFile(){

    try {
      serverName = Frame3.serverName;
    }
    catch(Exception ex) {
      ex.printStackTrace();
    }

    try{
      CommandInt c1 = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");
      boolean flag = false; //flase means it is not right host

      //-- remove all for new write
      c1.getFileBuffer().removeAllElements();

      //-- Clear data
      newstr = "";

      //-- save network
      saveWire();
      saveRouter();
      saveHost();

      //-- save to server file
      c1.copyFile(newstr);

      //-- save to work file
      FileWriter fout1 = new FileWriter( filename );
      BufferedWriter bout1 = new BufferedWriter(fout1);
      PrintWriter pout1 = new PrintWriter(bout1);
      pout1.print(newstr);
      pout1.close();

      //-- add separate string
      newstr += ".\n";

      //-- add config file
      newstr += c1.readConfig();

      //-- save to target file
      File file = new File( filePath , fileName );
      FileWriter fout = new FileWriter( file );
      BufferedWriter bout = new BufferedWriter(fout);
      PrintWriter pout = new PrintWriter(bout);
      pout.print(newstr);
      pout.close();

    }catch( Exception e ){}
  }

  //-- save to the new file
  public void saveAsFile( String path , String file ){

    filePath = path;
    fileName = file;
    saveFile();
  }

  //-- Load file
  public void loadFile(){

    load=1;
    removeOldValue();
    readStartupRouter();
    readStartupWire();
    readStartupHost();

    try{

    serverName = Frame3.serverName;
    CommandInt c1 = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");
    c1.constructor();
    }
    catch(Exception e){e.printStackTrace();}
  }

  //-- Open file
  public void openFile( File file ){
    FileIO.load=1;
    removeOldValue();

    String config = "";
    String diagram = "";
    String temp = "";

    filePath = file.getParent();
    fileName = file.getName();

    //-- seperate file ( diagram , config file )
    try{

      serverName = Frame3.serverName;
      CommandInt c1 = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");

      File f = new File( filePath , fileName );
      FileReader fin = new FileReader(f);
      BufferedReader bin = new BufferedReader(fin);

      //-- get diagram file
      while (!(temp = bin.readLine()).equalsIgnoreCase(".")) {
        diagram += temp+"\n";
      }

      temp = ""; //-- clear

      //-- get config file
      while ((temp = bin.readLine()) != null ){
        config += temp+"\n";
      }

      //-- write to diagram file
      FileWriter fout = new FileWriter( filename );
      BufferedWriter bout = new BufferedWriter(fout);
      PrintWriter pout = new PrintWriter(bout);
      pout.print(diagram);
      pout.close();

      //-- write to diagram file on server
      c1.copyFile(diagram);

      //-- send config file to command class
      c1.sendConfig( config );

      readStartupRouter();
      readStartupWire();
      readStartupHost();

      c1.constructor();
    }catch( Exception e ){e.printStackTrace();}
   }

   public void removeOldValue(){

    ImageMotion.vWire.removeAllElements();
    ImageMotion.wireImg.removeAllElements();
    ImageMotion.routerImg.removeAllElements();
    Host.vHost.removeAllElements(); //-- remove host elements

    //-- delete vector at server side
    try{

      serverName = Frame3.serverName;
      NewRouterInt n = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
      System.out.println(" VRouter" + n.getvRouter());
      n.deleteAllVector();
      Frame3.vConsole.removeAllElements();
      for(int i=0;i<Frame3.vFrame.size();i++)
      {
        FrameR fr =(FrameR)Frame3.vFrame.elementAt(i);
        fr.dispose();
      }
      Frame3.vFrame.removeAllElements();
      System.out.println(" VRouter" + n.getvRouter());

    }catch( Exception c ){}

  }

  //-- Save host file
  public void saveHost(){

    if(Frame3.getSelectMode() == 1){

      if(Host.vHost.size() != 0){

        for(int i=0;i<Host.vHost.size();i++) {

          //-- Save host variable --------------------------------------------------------------------
          Host h =(Host)Host.vHost.elementAt(i);
          System.out.println("save config of host");
          newstr += "!\n";
          newstr += "ip " + h.getIP()+ "\n"; // Set host ip address
          newstr += "wireindex " + h.getWireIndex()+ "\n";// Set wire index
          newstr += "Xhpos " + h.getXPos()+ "\n";// Set xpos
          newstr += "Yhpos " + h.getYPos()+ "\n";// set ypos
          newstr += "!\nend\n";
        }
      }
      else { //-- have not Host in network
      }
    }
    save_flage = false;
  }

  //-- Read Host
  public void readStartupHost(){

    try {

      CommandInt c1 = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");
      FileReader fin = new FileReader(filename); //-- file in use to set
      BufferedReader bin = new BufferedReader(fin);
      String s;
      Host h=null;
      int type=0;
      int linenum=0;

      if(Frame3.getSelectMode() == 2 || !save_flage) {
        //-- get fileBuffer from command class
        for(int i=0; i < c1.getFileBuffer().size(); i++) {

          String temp = String.valueOf(c1.getFileBuffer().elementAt(i));
          FileWriter fout = new FileWriter(filename);
          BufferedWriter bout = new BufferedWriter(fout);
          PrintWriter pout = new PrintWriter(bout);
          pout.print(temp);
          pout.close();
          save_flage = true;
        }
      }

      //-- while not End of File ( Host file )
      while ((s = bin.readLine()) != null) {

        linenum++; //-- increase line number
        StringTokenizer st = new StringTokenizer(s);

        //-- while not end of  host
        if (s.startsWith("ip")){

          //-- set host name
          if (st.hasMoreTokens()){

            String ip = (String)st.nextToken();
            ip = (String)st.nextToken();
            h = new Host();
            h.setIP(ip);
          }
        }
        //-- set host index
        else if (s.startsWith("wireindex")){

          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          int index =Integer.parseInt(name1);
          h.setWireIndex(index);
        }
        //-- set position
        else if (s.startsWith("Xhpos")){

          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          int xpos =Integer.parseInt(name1);
          h.setXPos(xpos);
          System.out.println("Xhpos:"+h.getXPos());
        }
        //-- set position
        else if (s.startsWith("Yhpos")){

          String name2 = (String)st.nextToken();
          name2 = (String)st.nextToken();
          int ypos =Integer.parseInt(name2);
          h.setYPos(ypos);
          Host.vHost.addElement(h);
        }
        else{}
      }//-- end while ( All host set already )
    }
    catch (IOException exp){
      System.out.println("Error with File");
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }

  //-- save wire file -----------------------------------------------------------------------------------
  public void saveWire(){

    if(Frame3.getSelectMode() == 1){

      if(ImageMotion.vWire.size() != 0){

        for(int i=0;i<ImageMotion.vWire.size();i++){

          Wire w =(Wire)ImageMotion.vWire.elementAt(i);
          WireImage wimg =(WireImage)ImageMotion.wireImg.elementAt(i);

          newstr += "!\n";
          newstr += "wirename " + w.getWirename()+ "\n";// Set wirename
          newstr += "WType " + wimg.getType()+ "\n";// Set xpos
         // newstr += "Cost " + w.getCost()+ "\n";   // Set cost
          newstr += "Index1 " + w.getIndexRouter1()+ "\n";// Set xpos
          newstr += "Index2 " + w.getIndexRouter2()+ "\n";// Set xpos
          newstr += "Intname1 " + w.getIntName1()+ "\n";// Set xpos
          newstr += "Intname2 " + w.getIntName2()+ "\n";// Set xpos
          newstr += "NetAdd " + w.getNetworkAddress()+ "\n";// Set xpos
          newstr += "Xwpos " + wimg.getXPos()+ "\n";// Set xpos
          newstr += "Ywpos " + wimg.getYPos()+ "\n";// set ypos
          newstr += "!\nend\n";
        }
      }
      else { //-- have not wire in network
      }
    }
    save_flage = false;
  }

  //-- Read wire properties
  public void readStartupWire(){

    try{

      CommandInt c1 = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");
      NewRouterInt   nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
        System.out.println(" Enter readStartup");
      if(Frame3.getSelectMode() == 2 ){
        for(int i=0;i<c1.getFileBuffer().size();i++) {

          String newstr = String.valueOf(c1.getFileBuffer().elementAt(i));
          System.out.println(" newstr :::: " + newstr );
          FileWriter fout = new FileWriter(filename);
          BufferedWriter bout = new BufferedWriter(fout);
          PrintWriter pout = new PrintWriter(bout);
          pout.print(newstr);
          pout.close();
          save_flage = true;
        }
      }

      FileReader fin = new FileReader( filename );
      BufferedReader bin = new BufferedReader(fin);
      String s;
      Wire w =null;
      WireImage wimg =null;
      int linenum=0;

      //-- Read all wire
      while ((s = bin.readLine()) != null){

        linenum++;
        StringTokenizer st = new StringTokenizer(s);

        System.out.println( " dat :::: " + s );
        //-- set each wire
        if (s.startsWith("wirename")){

          //-- set wire name
          if (st.hasMoreTokens()){
            String name = (String)st.nextToken();
            name = (String)st.nextToken();
            w = new Wire(name);
          }
        }
        //-- set wire type
        else if (s.startsWith("WType")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          int type =Integer.parseInt(name1);
          w.setType(type);
          wimg = new WireImage(w.getType());
        }
            //-- set router index  1
        else if (s.startsWith("Index1")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          index1 =Integer.parseInt(name1);
        }
        //-- set router index 2
        else if (s.startsWith("Index2")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          int index2 =Integer.parseInt(name1);
          w.setIndexRouter(index1,index2);
          }
        //-- set interface name 1
        else if (s.startsWith("Intname1")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          Intname1 =name1;
        }
        //-- set interface name 2
        else if (s.startsWith("Intname2")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          String  Intname2 = name1;
          w.setIntName(Intname1,Intname2);
        }
        //-- set network address
        else if (s.startsWith("NetAdd")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          w.setNetworkAddress(name1);
        }
        //-- set wire position
        else if (s.startsWith("Xwpos")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          int xpos =Integer.parseInt(name1);
          wimg.setXPos(xpos);
        }
        //-- set wire position
        else if (s.startsWith("Ywpos")){
          String name2 = (String)st.nextToken();
          name2 = (String)st.nextToken();
          int ypos =Integer.parseInt(name2);
          wimg.setYPos(ypos);
          ImageMotion.vWire.addElement(w);
          ImageMotion.wireImg.addElement(wimg);
        }
        else{}
      }//end while
    }
    catch (IOException exp){
      System.out.println("Error with File");
    }
    catch(Exception e){e.printStackTrace();  }
  }

  //-- save router
  public void saveRouter(){

    try{

      NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
      nr.setvRouter();
      boolean flag = false;

      if(Frame3.getSelectMode() == 1){

        if(nr.getvRouter().size() != 0){

          for(int i=0;i<nr.getvRouter().size();i++){
            Router r1 =(Router)nr.getvRouter().elementAt(i);
            RouterImg rimg =(RouterImg)ImageMotion.routerImg.elementAt(i);
            newstr += "!\n";
            newstr += "Routername " + String.valueOf(nr.getvName().elementAt(i))+ "\n"; // Set Routername
            newstr += "RType " + rimg.getType()+ "\n";   // Set xpos
            // newstr += "Cost " + r1.getCost()+ "\n";   // Set cost
            newstr += "Xrpos " + rimg.getXPos()+ "\n";  // Set xpos
            newstr += "Yrpos "  + rimg.getYPos()+ "\n"; // set ypos
            newstr += "!\nend\n";
          }
        }
        else{ //-- have not router in network
        }
        save_flage = false;
      }//end if
    }
    catch(Exception e){
      e.printStackTrace();
    }
  }

 //-- read router
 public void readStartupRouter() {

   Vector vname = new Vector();
   try{

     NewRouterInt nr = (NewRouterInt)Naming.lookup("//"+serverName+"/NewRouterService");
     CommandInt c1 = (CommandInt)Naming.lookup("//"+serverName+"/CommandService");
     //c1.constructor();

     if(Frame3.getSelectMode() == 2 || !save_flage ){
       for(int i=0;i<c1.getFileBuffer().size();i++){

         String newstr = String.valueOf(c1.getFileBuffer().elementAt(i));
         FileWriter fout = new FileWriter(filename);
         BufferedWriter bout = new BufferedWriter(fout);
         PrintWriter pout = new PrintWriter(bout);
         pout.print(newstr);
         pout.close();
         save_flage = true;
       }
     }

     FileReader fin = new FileReader(filename);
     BufferedReader bin = new BufferedReader(fin);
     String s;
     Router r =null;
     RouterImg rimg =null;
     int type=0;
     int linenum=0;
     String Rname="";
     int size= nr.getvRouter().size();
     Vector rtmp = new Vector();
     rtmp = nr.getvRouter();

   if(size!=0)
   {
     Frame3.vFrame.removeAllElements();
     ImageMotion.routerImg.removeAllElements();
     //-- read all router
     while ((s = bin.readLine()) != null){

       linenum++;

       //-- set each router
       StringTokenizer st = new StringTokenizer(s);
       //-- set router name
       if (s.startsWith("Routername")){
         if (st.hasMoreTokens()){
           String name = (String)st.nextToken();
           name = (String)st.nextToken();
           Rname=name;
           empty = false;
         }// end if
       }
       //-- set router type
       else if (s.startsWith("RType")){
         String name1 = (String)st.nextToken();
         name1 = (String)st.nextToken();
         int model =Integer.parseInt(name1);
         for(int j=0;j<rtmp.size();j++)
         {
           Router rt =(Router)nr.getvRouter().elementAt(j);
           if(rt.getName().equalsIgnoreCase(Rname))
           {

             FrameR fr = new FrameR(rt,Rname);
             rimg = new RouterImg(model);
             fr.setIconImage(rimg.getImge());
             Frame3.vFrame.addElement(fr);
           }// end if
         }//end for

       }
       //-- set position
       else if (s.startsWith("Xrpos")){
         String name1 = (String)st.nextToken();
         name1 = (String)st.nextToken();
         int xpos =Integer.parseInt(name1);
        // System.out.println("Xpos"+"\n");
         rimg.setXPos(xpos);
       }
       //-- set position
       else if (s.startsWith("Yrpos")){
         String name2 = (String)st.nextToken();
         name2 = (String)st.nextToken();
         int ypos =Integer.parseInt(name2);
         rimg.setYPos(ypos);
       //  System.out.println("Ypos"+"\n");
         ImageMotion.routerImg.addElement(rimg);
         }
         size = 1;
     }//end while

   }// end if
    // vRouter is empty
    else{
      //-- read all router
      while ((s = bin.readLine()) != null){

        linenum++;

        //-- set each router
        StringTokenizer st = new StringTokenizer(s);
        //-- set router name
        if (s.startsWith("Routername")){
          if (st.hasMoreTokens()){
            String name = (String)st.nextToken();
            name = (String)st.nextToken();
            Rname=name;
            empty = false;
          }// end if
        }
        //-- set router type
        else if (s.startsWith("RType")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          int model =Integer.parseInt(name1);
          System.out.println("presize "+nr.getvRouter().size()+"\n");
          nr.NewFrameR(Rname,model);
          System.out.println("Type");
          System.out.println("postsize "+nr.getvRouter().size()+"\n");
          FrameR fr = new FrameR( nr.getRouter(),Rname);
          rimg = new RouterImg(model);
          fr.setIconImage(rimg.getImge());
          Frame3.vFrame.addElement(fr);
          StatusPanelInt stat = (StatusPanelInt)Naming.lookup("//"+serverName+"/SPservice");
          stat.NewStatus();
        }
        //-- set position
        else if (s.startsWith("Xrpos")){
          String name1 = (String)st.nextToken();
          name1 = (String)st.nextToken();
          int xpos =Integer.parseInt(name1);
          System.out.println("Xpos"+"\n");
          rimg.setXPos(xpos);
        }
        //-- set position
        else if (s.startsWith("Yrpos")){
          String name2 = (String)st.nextToken();
          name2 = (String)st.nextToken();
          int ypos =Integer.parseInt(name2);
          rimg.setYPos(ypos);
          System.out.println("Ypos"+"\n");
          ImageMotion.routerImg.addElement(rimg);
        }
      }//end while
    }//end else
      }
   catch (IOException exp){
     System.out.println("Error with File");
   }
   catch (Exception e){e.printStackTrace();
   System.out.println("Error with size");
   }
 }
}
