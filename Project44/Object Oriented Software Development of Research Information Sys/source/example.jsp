
 <%
 import java.sql.*; (1) 
class DB2Appl {
 
   static {
      try {
         Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance();
      } catch (Exception e) {
         System.out.println(e);
      }
   }
 
   public static void main(String argv[]) {
      Connection con = null; (2)
 
      // URL is jdbc:db2:dbname
      String url = "jdbc:db2:sample"; (3)
 
      try {
         if (argv.length == 0) {
            // connect with default id/password
            con = DriverManager.getConnection(url);
            }
         else if (argv.length == 2) {
            String userid = argv[0];
            String passwd = argv[1];
 
            // connect with user-provided username and password
            con = DriverManager.getConnection(url, userid, passwd); (4)
            }
         else {
            System.out.println("Usage: java DB2Appl [username password]");
            System.exit(0);
         }
 
         // retrieve data from the database
         System.out.println("Retrieve some data from the database...");
         Statement stmt = con.createStatement(); (5)
         ResultSet rs = stmt.executeQuery("SELECT * from employee"); (6)
 
         System.out.println("Received results:");
 
         // display the result set
         // rs.next() returns false when there are no more rows
         while (rs.next()) { (7)
            String a = rs.getString(1); (8)
            String str = rs.getString(2);
 
            System.out.print(" empno= " + a);
            System.out.print(" firstname= " + str);
            System.out.print("");
         }
 
         rs.close();
         stmt.close();
 
         // update the database
         System.out.println("Update the database... ");
         stmt = con.createStatement();
         int rowsUpdated = stmt.executeUpdate("UPDATE employee 
	        SET firstnme = 'SHILI' where empno = '000010'");(9)
 
         System.out.print("Changed "+rowsUpdated);
 
         if (1 == rowsUpdated)
            System.out.println(" row.");
         else
            System.out.println(" rows.");
 
         stmt.close();
         con.close();
      } catch( Exception e ) {
         System.out.println(e);
      }
   }
}
%>