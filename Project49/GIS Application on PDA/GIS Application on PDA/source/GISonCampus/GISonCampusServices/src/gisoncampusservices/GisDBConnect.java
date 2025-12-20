package gisoncampusservices;


import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.*;

public class GisDBConnect  {
    private Connection conn ;
    private Statement stmt ;
    private ResultSet rset ;

    public GisDBConnect() throws Exception{
        try {
            Class.forName("org.postgresql.Driver");

            conn = DriverManager.getConnection("jdbc:postgresql:GISonCampus","postgres","gisgis");

            stmt = conn.createStatement();
          } catch(Exception e) {
                throw e;
          }
      }

      public void query(String sqlstr) throws Exception{
          try {
              rset = stmt.executeQuery(sqlstr);
          }catch(Exception e){
              throw e;
          }
      }

      public void exeSQL(String sqlstr) throws Exception{
          try {
              stmt.execute(sqlstr);
          }catch(Exception e){
              throw e;
          }
      }

      public ResultSet getReturn (){
          return rset;
      }

      public int getSeqVal(){
          return 1;
      }
}
