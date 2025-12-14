//  Search  จาก word
import javax.swing.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;
class Word{	
static	 String  Find(String q){
String		Query = q;
String  result="";
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con =
DriverManager.getConnection("jdbc:mysql://localhost/databook?user=root");
Statement stmt = con.createStatement();
String     sql = "SELECT * FROM  book  WHERE  subject  LIKE'"+Query+"%'"   + "OR  company LIKE'"+Query+"%'" ; 

System.out.println(sql);
System.out.println();
ResultSet rs = stmt.executeQuery(sql);


String  test2=" ";
//	rs.first(); 
while (rs.next()) {

result  += "Book name"+" "+rs.getString("name_book") +" Company" +" "+ rs.getString("company")+" :"+" "+"Due"+rs.getString("return_book");
}
stmt.close();
con.close();


} catch (SQLException ex) {

} catch (Exception e) {}

return result;
}


}