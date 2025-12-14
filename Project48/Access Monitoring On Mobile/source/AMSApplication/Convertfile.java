/*
 * Convertfile.java
 *
 * Created on 20 มกราคม 2549, 0:03 น
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

/**
 *
 * @author IBM
 */
import java.io.*;
// This class is convert file to *.3gp and
class Convertfile {
    String commandconvert = variableCode.convertfile+" -i ";
    //String commandconvert = "MMConverterCon -i ";
    String con;
    String rootpath;
    public Convertfile(){
     //convert =commandconvert+rootpath+filename[1];
     //convert ="MMConverterCon -i capture.avi -p";
    }
    public void convert(String[] filename,String rootpath){
         try
        {	
            String webpath = variableCode.webpathvideo+filename[0];
            //String webpath = "C:\\AppServ\\www\\video\\"+filename[0];
            //String webpath = "C:\\Program Files\\netbeans-4.1\\enterprise1\\jakarta-tomcat-5.5.7\\webapps\\ROOT\\video\\"+filename[0];
            File rootBackup;
            rootBackup = new File(webpath);
	    if(rootBackup.exists()){
	   		if(rootBackup.isDirectory())
	   		    System.out.println (webpath+"\\ is exists.");
	   		else
	   			rootBackup.mkdir();	   	
	    } 
	    else
	    { 
	   	 	System.out.println ("make "+ webpath +"\\");
	     	rootBackup.mkdir();   
       	}     
        con = commandconvert+rootpath+filename[1]+".avi -o \""+webpath+"\\"+filename[1]+"\" -p";
        //con = commandconvert+rootpath+filename[1]+".avi -o \"C:\\Program Files\\netbeans-4.1\\enterprise1\\jakarta-tomcat-5.5.7\\webapps\\ROOT\\video\\"+filename[0]+"\\"+filename[1]+"\" -p";
        System.out.println(con);
        Runtime rt = Runtime.getRuntime();
        Process proc = rt.exec(con);
    } catch (Throwable t)
      {
        t.printStackTrace();
      }
    }
    public void setrootpath(String rootpath){
        this.rootpath = rootpath;
    }    
}
