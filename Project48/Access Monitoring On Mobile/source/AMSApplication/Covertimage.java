/*
 * Covertimage.java
 *
 * Created on 24 ?????? 2549, 17:55 ¹.
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
class Convertimage {
    String commandconvert = variableCode.convertimage+" -size 160x120";
    //String commandconvert = "\"C:\\Program Files\\ImageMagick-5.5.6-Q16\\convert\" -size 160x120"; 
    String size = "160x120";
    String con;
    String rootpath;
    public Convertimage(){
        //convert(filename,rootpath);
    }
    public void convert(String[] filename,String rootpath){
         try
        {	
            String webpath = variableCode.webpathimage+filename[0];
            //String webpath = "C:\\AppServ\\www\\image\\"+filename[0];
            //String webpath = "C:\\Program Files\\netbeans-4.1\\enterprise1\\jakarta-tomcat-5.5.7\\webapps\\ROOT\\image\\"+filename[0];
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
        
        con = commandconvert+" \""+Imagemaker.getImagepath()+filename[1]+".png\" -resize "+size+" -colors 64 \""+webpath+"\\"+filename[1]+".png\"";
        //con = commandconvert+" \""+Imagemaker.getImagepath()+filename[1]+".png\" -resize "+size+" -colors 64 \"C:\\Program Files\\netbeans-4.1\\enterprise1\\jakarta-tomcat-5.5.7\\webapps\\ROOT\\image\\"+filename[0]+"\\"+filename[1]+".png\"";
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


