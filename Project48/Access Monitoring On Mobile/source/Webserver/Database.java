/*
 * Database.java
 *
 * Created on November 3, 2005, 12:08 AM
 *
 * To change this template, choose Tools | Options and locate the template under
 * the Source Creation and Management node. Right-click the template and choose
 * Open. You can then make changes to the template in the Source Editor.
 */

/**
 *
 * @author Administrator
 */
import java.lang.*;
import java.lang.Exception.*;
import java.io.*;
import java.util.Vector;
import java.sql.*;
import java.text.*;
public class Database {
   static Connection  aConnection;
   static Statement  aStatement;
   static String url = "jdbc:mysql://localhost:3306/ams";
   static String urlLogin = "jdbc:mysql://localhost:3306/ams";
   static String user = "root";
   static String password = "komate";
   static String pass = "komate";
    /** Creates a new instance of Database */
    public Database() {
    }
    public void connect()
    {
        
    }
    
     public  String queryevent(String keyQuery){
        try {
           
           Class.forName("com.mysql.jdbc.Driver");
           //aConnection =  DriverManager.getConnection(url,user,password); 
           //aConnection= DriverManager.getConnection("d","y","y");
          // aStatement  = aConnection.createStatement(); 
           
          aStatement  = DriverManager.getConnection(url,user,password).createStatement(); 
 //          String videoQuery = "SELECT * FROM videofile WHERE Datestart='"+keyQuery+"'";
           String videoQuery = "SELECT * FROM videofile WHERE Datestart='"+keyQuery+"'";
           String imgQuery = "SELECT * FROM imagefile WHERE Date='"+keyQuery+"'";
           String tempset="";
           String timeset="";
           String urlset="";
           String imgset="";

              try{ 
                    //query video
	            
                    ResultSet rs = aStatement.executeQuery(videoQuery);
                    if(rs==null){
                        tempset="No File";
                        
                    }
                    else{
                            //video url and time
                        while(rs.next()){
                            String urltmp=rs.getString(4)+";";
                            String timetmp=rs.getString(6)+";";
                            timeset=timeset+timetmp;
                            urlset=urlset+urltmp;

                        }
                        rs.close();
                        
                        //query image
                      ResultSet irs = aStatement.executeQuery(imgQuery);  
                        while(irs.next()){
                            String imgtmp=irs.getString(4)+";";
 
                            imgset=imgset+imgtmp;                           
                        }
                        irs.close();
                        
                        tempset=timeset+"@"+urlset+"$"+imgset;
                         return tempset;                                                                                     
	              
	             } 
                   
	            
 
                    
	           }catch(Exception e){
                       return e.toString();
	            //throw (new NotFound("not Found"));
	             //throw (new NoSuchFieldException ("not Found")); 
	           }
             return "No File";
                    
        } catch (ClassNotFoundException e) {
            return e.toString();     
        }catch(SQLException e){
            return e.toString();
        }
     }

      public  String recently(){
        try {
           
           Class.forName("com.mysql.jdbc.Driver");
  
          aStatement  = DriverManager.getConnection(url,user,pass).createStatement(); 
           String videoQuery = "SELECT * FROM videofile WHERE ID=(select max(ID) from videofile)" ;
           String imgQuery = "SELECT * FROM imagefile WHERE ID=(select max(ID) from imagefile)" ;
           String imgtmp="";
           String timetmp="";
           String datetmp="";
           String urltmp="";
           
	           try{ 
	            ResultSet rs = aStatement.executeQuery(videoQuery);     
	            boolean gotIt = rs.next();
                    
	            if(gotIt){
	                //extract the data
	             timetmp= rs.getString(6)+";";
                     
                     urltmp= rs.getString(4)+"#";
                     datetmp=rs.getString(5);
                     
                      rs.close();
                    }
                    
                     ResultSet irs = aStatement.executeQuery(imgQuery); 
                    gotIt = irs.next();
                    if(gotIt){
                                        
                     imgtmp=irs.getString(4)+"@";
                                             
                      irs.close();
                    }
                    
	              return timetmp+urltmp+imgtmp+datetmp;
	           
	           
	           }catch(Exception e){
                       return e.toString();
	            //throw (new NotFound("not Found"));
	             //throw (new NoSuchFieldException ("not Found")); 
	           }
            
        } catch (ClassNotFoundException e) {
            return e.toString();     
        }catch(SQLException e){
            return e.toString();
        }
     }    
     
 
 
      
     
       public  String Login(String userid,String password){
        try {
           
           Class.forName("com.mysql.jdbc.Driver");
           //aConnection =  DriverManager.getConnection(url,user,password); 
           //aConnection= DriverManager.getConnection("d","y","y");
          // aStatement  = aConnection.createStatement(); 
           
          aStatement  = DriverManager.getConnection(urlLogin,user, pass).createStatement(); 
           String query = "SELECT * " +
                 "FROM mobileaccount " + "WHERE username = '" + 
                             userid + "' AND password ='" +
                              password + "'";
           
        try{
           ResultSet rs = aStatement.executeQuery(query);
           
         // ตรวจสอบว่ามีข้อมูลในเรคอร์ดถัดไปหรือไม่ 
           String check;
           if(rs.next()){
               check="valid";
           }
           else{
               check="invalid";
           }
           rs.close();
           return check;
       } catch (Exception e ){ 
        return e.toString();    
       }
                 
          
        } catch (ClassNotFoundException e) {
            return e.toString();     
        }catch(SQLException e){
            return e.toString();
        }
     }
}
