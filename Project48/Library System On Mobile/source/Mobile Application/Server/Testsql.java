import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;
class   Testsql{
	public  static void main(String  args[]) {	
String url = "jdbc:odbc:ConnectODBCdb1";
String test=" ";

try{
	String sql ="SELECT * FROM   Book";
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
Connection conn = DriverManager.getConnection(url); 
 PreparedStatement pstat = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);

	ResultSet rs = pstat.executeQuery();
		rs.first(); 

	System.out.println(	rs.getString(1));
	rs.next(); 
		System.out.println(	rs.getRow());

	rs.close();
  conn.close();
}catch(ClassNotFoundException e){
 				System.out.println(e.getMessage());
 			}catch(SQLException e){
 				System.out.println(e.getMessage());
 			} 

}
}
