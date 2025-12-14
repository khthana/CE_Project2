package giswebservices;

import java.security.SecureRandom;

public class GIS_UserServices {
    public GIS_UserServices() {}

    //******************************************************* LOGIN
    public String login(String username, String password){
        GisGenerateMD gmd = new GisGenerateMD();
        String passMD = gmd.genMD(password);

        try{
            //---create database connection object---
            GisDBConnect gdb = new GisDBConnect();

            gdb.query("SELECT memid FROM member WHERE username='" + username +
                      "' AND password='" + passMD +"' AND active=1;") ;

            gdb.getReturn() .next() ;

            int memID = gdb.getReturn().getInt(1);

             //---generate session key
             char key[] = { 'a','b','c','d','e','f','g','h','i','j','k','l','m',
                          'n','o','p','q','r','s','t','u','v','w','x','y','z',
                          '0','1','2','3','4','5','6','7','8','9',
                          'A','B','C','D','E','F','G','H','I','J','K','L','M',
                          'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
             SecureRandom scr = new SecureRandom() ;
             String sessionkey = new String("");
             for (int i=0; i<10; i++){
                 int rnd =scr.nextInt(62);
                 sessionkey+=key[rnd];
             }

             //---sql command insert to SESSION---
             gdb.exeSQL("INSERT INTO session (sessid, memid) VALUES('"
                        + sessionkey + "', " + memID + ");") ;


            return  sessionkey ;

        }catch(Exception e){
            return "2" ;
        }
    }

    //****************************************************** LOG OUT
    public String logout(String sessionkey){
        try{
            GisDBConnect gdb = new GisDBConnect();
            gdb.exeSQL("DELETE FROM session WHERE sessid='" + sessionkey + "';");
            return sessionkey;
        }catch(Exception e){
            return "2";
        }
    }

    //***************************************************** myProfile
     public String detailUser (String sessionkey){
         try{
            GisDBConnect gdbs=new GisDBConnect();
            gdbs.exeSQL("UPDATE session SET time=60 WHERE sessID='"+sessionkey+"' ");
        }catch(Exception e){}


         GisDBConnect gdb;
         int memid=0;
         int level=7;
         int ownid=0;
         String ownername;
         try{
               gdb = new GisDBConnect();
               gdb.query("SELECT memid, ownid, ownname, level FROM sessionview WHERE sessid='"+sessionkey+"'");
               gdb.getReturn().next();
               memid = gdb.getReturn().getInt("memid") ;
               ownid = gdb.getReturn().getInt("ownid") ;
               level = gdb.getReturn().getInt("level") ;
               ownername = gdb.getReturn().getString("ownname") ;
               if (memid<100) return "6";
            }catch(Exception e){
                return "SELECT memid, ownid, ownname FROM sessionview WHERE sessid='"+sessionkey+"'";
            }


         try{
             String xmlRes = new String("<?xml version=\"1.0\"?>\r\n");
             xmlRes += "<memberdetail>\r\n";

             String playroll="General User";
             if (level==0) playroll="Gis Administrator";
             if (level==2) playroll="Map Owner";
             if (level==4) playroll="Writable Member";
             if (level==5) playroll="Readable Member";

             gdb = new GisDBConnect();

             gdb.query("SELECT * FROM member WHERE memid=" + memid);
             while (gdb.getReturn().next() ){
                 xmlRes += ("  <member id='"+memid+"' ownid='"+ownid+"'  >\r\n");
                 xmlRes += ("    <name>"+gdb.getReturn().getString("name")+"</name>\r\n");
                 xmlRes += ("    <address>"+gdb.getReturn().getString("address")+"</address>\r\n");
                 xmlRes += ("    <phone>"+gdb.getReturn().getString("phone")+"</phone>\r\n");
                 xmlRes += ("    <email>"+gdb.getReturn().getString("email")+"</email>\r\n");
                 xmlRes += ("    <ownername>"+ownername+"</ownername>\r\n");
                 xmlRes += ("    <playroll>"+playroll+"</playroll>\r\n");
                 xmlRes += ("  </member>\r\n");
             }
             xmlRes += "</memberdetail>\r\n";
             return xmlRes;
         }catch(Exception e){
             return "7";
         }
     }

}
