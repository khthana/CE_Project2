package session;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.*;
import java.util.*;



//-------------------------------------------------------- RUN Thread
public class GIS_SessionDemon {
  public GIS_SessionDemon() {
  }

  public static void main(String[] args) {
    GIS_SessionThread session = new GIS_SessionThread();
    //session.start() ;
    while(true){
      session.start();
    }
  }
}


//-------------------------------------------------- THREAD CLASS

class GIS_SessionThread extends Thread{

  private Connection conn ;
  private Statement stmt;
  private Statement upd ;
  private ResultSet rset ;

  public GIS_SessionThread(){
    try {
             Class.forName("org.postgresql.Driver");
             conn = DriverManager.getConnection("jdbc:postgresql:GISonCampus","postgres","gisgis");
             stmt = conn.createStatement();
             upd = conn.createStatement() ;
      } catch(Exception e) {
        e.printStackTrace() ;
      }
  }
  public void run(){
    try {

      int usrcount=0;
      rset = stmt.executeQuery("select sessionid, timeout from session");
      while (rset.next()) {
        String sessionid = rset.getString("sessionid");
        int time = rset.getInt("timeout")-10 ;
        if (time>0) {
          upd.execute("update session set timeout=" + time + " where sessionid='" +
                      sessionid + "'");
          usrcount++;
        }
        else upd.execute("delete from session where sessionid='"+sessionid+"'") ;
      }

      Calendar cal = new GregorianCalendar();

      System.out.println(cal.getTime() + " --- has " + usrcount + " users") ;

    } catch(Exception e) {
      e.printStackTrace() ;
    }

    try{
      //sleep(5000);
      sleep(600000);
    }catch(InterruptedException e){}
  }
}
