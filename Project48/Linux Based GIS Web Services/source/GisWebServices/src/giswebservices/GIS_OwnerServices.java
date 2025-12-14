package giswebservices;

import java.util.LinkedList;

public class GIS_OwnerServices {
    public GIS_OwnerServices(){}

    //**********************************************************************INSERT OWNER
    public int insertOwner(String name, String address, String phone,
                           String email, String website,
                           String username, String password){
        GisGenerateMD gmd = new GisGenerateMD();

        //---------------------- password must be more than 23 chars
        if (password.length()<6) return 23;
        //---------------------- check name
        try{
            GisDBConnect gdb=new GisDBConnect();
            gdb.query("SELECT name FROM owner WHERE LOWER(name)='"+name.toLowerCase()+"'");
            gdb.getReturn().next();
            String ownername="";
            ownername=gdb.getReturn().getString("name");
            if (ownername.length()>2) return 19;
        }catch(Exception e){

        }

        //---------------------- check username
        try{
            GisDBConnect gdb=new GisDBConnect();
            gdb.query("SELECT username FROM member WHERE LOWER(username)="+username.toLowerCase());
            gdb.getReturn().next();
            String usr="";
            usr=gdb.getReturn().getString("username");
            if (usr.length() >2) return 24;
        }catch(Exception e){

        }


        //------------------------------------ do insert
        String passMD = gmd.genMD(password);
        try{
            //---create database connection object---
            GisDBConnect gdb = new GisDBConnect();


            String sqlstr = new String();

            //---sql command insert to OWNER---
            sqlstr = "INSERT INTO OWNER";
            sqlstr += "(name, address, phone, email, website)";
            sqlstr += "VALUES ('";
            sqlstr += name + "', '" + address + "', '" + phone + "', '" ;
            sqlstr += email + "', '" + website + "');" ;

            gdb.exeSQL(sqlstr) ;

            //---sql command get current sequence---
            sqlstr = "SELECT last_value from owner_seq;";
            gdb.query(sqlstr) ;
            gdb.getReturn() .next() ;

            int ownID = gdb.getReturn().getInt(1);

            //---sql command insert to MEMBER---
            sqlstr = "INSERT INTO MEMBER";
            sqlstr += "(name, address, phone, email,  username, password, level, ownID)";
            sqlstr += "VALUES ('";
            sqlstr += name + "', '" + address + "', '" + phone + "', '" + email + "', '" ;
            sqlstr += username + "', '" + passMD + "', " ;
            sqlstr += 2 + ", " + ownID + ");" ;

            gdb.exeSQL(sqlstr) ;



            return  ownID ;

        }catch(Exception e){
            return 14   ;
        }
    }

    //********************************************************************** LIST OWNER
    public String listOwner (){

        try{
            String xmlRes = new String("<?xml version=\"1.0\"?>\r\n");
            xmlRes += "<ownerlist>\r\n";

            GisDBConnect gdb = new GisDBConnect();

            gdb.query("SELECT ownid, name FROM owner WHERE active=1 ORDER BY name");
            while (gdb.getReturn().next() ){
                int id=gdb.getReturn().getInt("ownid");
                String ownname=gdb.getReturn().getString("name");
                xmlRes += "  <owner id='"+id+"'>"+ownname+"</owner>\r\n";

            }
            xmlRes += "</ownerlist>\r\n";
            return xmlRes;
        }catch(Exception e){
            return "";
        }

    }

    //********************************************************************* SEARCH OWNER
     public String searchOwner(String name, String address, String phone,
                            String email, String website){
         try{
            String xmlRes = new String("<?xml version=\"1.0\"?>\r\n");
            xmlRes += "<ownerlist>\r\n";

            GisDBConnect gdb = new GisDBConnect();
            String sqlstr = new String("");

            sqlstr+="SELECT ownid, name FROM owner WHERE active=1 ";
            sqlstr+="AND LOWER(name) LIKE '%" + name.toLowerCase() + "%' ";
            sqlstr+="AND LOWER(address) LIKE '%" + address.toLowerCase() + "%' ";
            sqlstr+="AND LOWER(phone) LIKE '%" + phone.toLowerCase() + "%' ";
            sqlstr+="AND LOWER(email) LIKE '%" + email.toLowerCase() + "%' ";
            sqlstr+="AND LOWER(website) LIKE '%" + website.toLowerCase() + "%' ";

            gdb.query(sqlstr);
            while (gdb.getReturn().next() ){
                int id=gdb.getReturn().getInt("ownid");
                String ownname=gdb.getReturn().getString("name");
                xmlRes += "  <owner id='"+id+"'>"+ownname+"</owner>\r\n";
            }
            xmlRes += "</ownerlist>\r\n";
            return xmlRes;
        }catch(Exception e){
            return "";
        }
     }

       //********************************************************************** DETAIL OWNER

       public String detailOwner (int ownerID){

          try{
              String xmlRes = new String("<?xml version=\"1.0\"?>\r\n");
              xmlRes += "<ownerdetail>\r\n";

              GisDBConnect gdb = new GisDBConnect();

              gdb.query("SELECT * FROM owner WHERE ownid=" + ownerID);
              while (gdb.getReturn().next() ){
                  int ownid=gdb.getReturn().getInt("ownid");
                  xmlRes += ("  <owner id='"+ownid+"'>\r\n");
                  xmlRes += ("    <name>"+gdb.getReturn().getString("name")+"</name>\r\n");
                  xmlRes += ("    <address>"+gdb.getReturn().getString("address")+"</address>\r\n");
                  xmlRes += ("    <phone>"+gdb.getReturn().getString("phone")+"</phone>\r\n");
                  xmlRes += ("    <email>"+gdb.getReturn().getString("email")+"</email>\r\n");
                  xmlRes += ("    <website>"+gdb.getReturn().getString("website")+"</website>\r\n");
                  xmlRes += ("  </owner>\r\n");
              }
              xmlRes += "</ownerdetail>\r\n";
              return xmlRes;
          }catch(Exception e){
              return "7";
          }

       }

      //************************************************************** UPDATE OWNER
      public int updateOwner(String sessionkey,String name, String address, String phone,
                            String email, String website){

        try{
            GisDBConnect gdbs=new GisDBConnect();
            gdbs.exeSQL("UPDATE session SET time=60 WHERE sessID='"+sessionkey+"' ");
        }catch(Exception e){}


          int id=0;
          int level=7;
          GisDBConnect gdb;

          //-------------- check is logging in
          try{
              gdb = new GisDBConnect();
              gdb.query("SELECT ownid, level FROM sessionview WHERE sessid='"+sessionkey+"'");
              gdb.getReturn().next();
              id = gdb.getReturn().getInt("ownid") ;
              level = gdb.getReturn().getInt("level") ;
              if (level>2) return 5;
          }catch(Exception e){
              return 3;
          }

          //-------------- update
          try{
              String sqlstr=new String("");
              sqlstr += "UPDATE owner SET ";
              if(name.length() >0) sqlstr += "name='" + name + "', ";
              if(address.length() >0) sqlstr += "address='" + address + "', ";
              if(phone.length() >0) sqlstr += "phone='" + phone + "', ";
              if(email.length() >0) sqlstr += "email='" + email + "', ";
              if(website.length() >0) sqlstr += "website='" + website + "' ,";
              sqlstr += "ownid=" + id + " ";
              sqlstr += "WHERE ownid=" + id;
              gdb.exeSQL(sqlstr);


           }catch(Exception e){
               return 15;
           }

          return id;
      }

      //*************************************************************** DELETE OWNER

      public int deleteOwner(String sessionkey, int ownID){
          try{
            GisDBConnect gdbs=new GisDBConnect();
            gdbs.exeSQL("UPDATE session SET time=60 WHERE sessID='"+sessionkey+"' ");
        }catch(Exception e){}


          int level=7;
         GisDBConnect gdb;

         //-------------- check is logging in root
         try{
             gdb = new GisDBConnect();
             gdb.query("SELECT level FROM sessionview WHERE sessid='"+sessionkey+"'");
             gdb.getReturn().next();
             level = gdb.getReturn().getInt("level") ;
             if (level>0) return 4;
         }catch(Exception e){
             return 4;
         }

         try{
              GisDBConnect gdbx = new GisDBConnect() ;
              String sqlstr=new String("");

              gdb.exeSQL("BEGIN");
              sqlstr += "SELECT tbname FROM layer WHERE ownid="+ownID;
              gdb.query(sqlstr);
              LinkedList list= new LinkedList();
              while (gdb.getReturn().next()){
                  list.add(gdb.getReturn().getString("tbname"));
              }

              for (int i=0; i<list.size() ; i++){
                  gdb.exeSQL("DROP TABLE " +(String)list.get(i));
                  gdb.exeSQL("DROP SEQUENCE " +(String)list.get(i)+"_seq ");
              }
              //gdbx.exeSQL("DROP TABLE " +gdb.getReturn().getString("tbname"));
              //gdbx.exeSQL("DROP SEQUENCE " +gdb.getReturn().getString("tbname")+"_seq ")


              sqlstr = "DELETE FROM member WHERE ownid="+ownID;
              gdb.exeSQL(sqlstr);

              sqlstr = "DELETE FROM layer WHERE ownid="+ownID;
              gdb.exeSQL(sqlstr);

              sqlstr = "DELETE FROM owner WHERE ownid="+ownID;
              gdb.exeSQL(sqlstr);
              gdb.exeSQL("END");

           }catch(Exception e){
               return 16;
           }


         return ownID;
      }

      //****************************************************************** LIST NEW OWNER
    public String listNewOwner (String sessionkey){
        try{
            GisDBConnect gdbs=new GisDBConnect();
            gdbs.exeSQL("UPDATE session SET time=60 WHERE sessID='"+sessionkey+"' ");
        }catch(Exception e){}


        //-------------- check is logging in root
         try{
             GisDBConnect gdb = new GisDBConnect();
             int level=7;
             gdb = new GisDBConnect();
             gdb.query("SELECT level FROM sessionview WHERE sessid='"+sessionkey+"'");
             gdb.getReturn().next();
             level = gdb.getReturn().getInt("level") ;
             if (level>0) return "4";
         }catch(Exception e){
             return "4";
         }


        try{
            String xmlRes = new String("<?xml version=\"1.0\"?>\r\n");
            xmlRes += "<ownerlist>\r\n";

            GisDBConnect gdb = new GisDBConnect();

            gdb.query("SELECT ownid, name FROM owner WHERE active=0;");
            while (gdb.getReturn().next() ){
                int id=gdb.getReturn().getInt("ownid");
                String ownname=gdb.getReturn().getString("name");
                xmlRes += "  <owner id='"+id+"'>"+ownname+"</owner>\r\n";

            }
            xmlRes += "</ownerlist>\r\n";
            return xmlRes;
        }catch(Exception e){
            return "";
        }

    }

    //************************************************************ PERMIT OWNER
     public int activateOwner(String sessionkey,int ownID,boolean isActive){
         try{
            GisDBConnect gdbs=new GisDBConnect();
            gdbs.exeSQL("UPDATE session SET time=60 WHERE sessID='"+sessionkey+"' ");
        }catch(Exception e){}


          int level=7;
          int active=0;
          if (isActive==true) active=1;
          GisDBConnect gdb;

          //-------------- check is logging in
          try{
              gdb = new GisDBConnect();
              gdb.query("SELECT level FROM sessionview WHERE sessid='"+sessionkey+"'");
              gdb.getReturn().next();
              level = gdb.getReturn().getInt("level") ;
              if (level>0) return 4;
          }catch(Exception e){
              return 3;
          }

          //-------------- update
          try{
              gdb.exeSQL("BEGIN");

              String sqlstr=new String("");
              sqlstr += "UPDATE owner SET ";
              sqlstr += "active=" + active + " ";
              sqlstr += "WHERE ownid=" + ownID;
              gdb.exeSQL(sqlstr);

              sqlstr = "UPDATE member SET ";
              sqlstr += "active=" + active + " ";
              sqlstr += "WHERE ownid=" + ownID + " AND level=2 ";
              gdb.exeSQL(sqlstr);
              gdb.exeSQL("END");



           }catch(Exception e){
               return 17;
           }

          return ownID;
      }





}
