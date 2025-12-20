package gisoncampusservices;

import java.util.*;

public class InformationServices
{
    public InformationServices(){}

   public String getInformationFromID(String sessionkey,String objectid,String layerid)
   {
       UserServices service = new UserServices();
        int memberid = service.checkSession(sessionkey);
         if (memberid != -1)
         {
             try
             {
                 GisDBConnect gdb = new GisDBConnect();
                 gdb.query("SELECT * FROM information WHERE objectid="+objectid+"AND layerid="+layerid+";");
                 gdb.getReturn().next();


                 String information = new String("<?xml version=\"1.0\"?>\r\n");
                 information += "<information id='"+gdb.getReturn().getString("informationid")+"'>\n";
                 information += "      <name>"+gdb.getReturn().getString("name")+"</name>\n";
                 information += "      <details>"+gdb.getReturn().getString("details")+"</details>\n";
                 information += "      <objectid>"+objectid+"</objectid>\n";
                 information += "      <layerid>"+layerid+"</layerid>\n";
                 information += "</information>";

                 System.out.println(information);
                 return information;
             }
             catch (Exception ex) {
                 System.out.println("Error : "+ex.getMessage());
                 return "Error : "+ex.getMessage();
             }
         }
         System.out.println("Error : Session error");
         return "Error : Session error";

   }
}
