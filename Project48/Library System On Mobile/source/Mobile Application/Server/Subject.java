//  Search  จาก Subject
import javax.swing.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;
class Subject{	
static	 String  Find(String q){
String		Query = q;
String  result="";
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con =
DriverManager.getConnection("jdbc:mysql://localhost/databook?user=root");
Statement stmt = con.createStatement();
String     sql = "SELECT * FROM  book  WHERE  subject  LIKE'"+Query+"%' ";

System.out.println(sql);
System.out.println();
ResultSet rs = stmt.executeQuery(sql);


String  test2=" ";
//	rs.first(); 
while (rs.next()) {

//result  += "Book name"+" "+rs.getString("name_book") +" Company" +" "+ rs.getString("company")+" :"+" "+"Due"+rs.getString("return_book");

String returnbook = rs.getString("return_book");

if(returnbook.equals("")){
result  += "Book name:"+" "+rs.getString("name_book") +" "+"Auther:"+" "+rs.getString("writer") +" "+" Company:" +" "+ rs.getString("company")+" "+"CALL#:"+" "+ rs.getString("detail");

}else {
result  += "Book name:"+" "+rs.getString("name_book") +" "+"Auther:"+" "+rs.getString("writer") +" "+" Company:" +" "+ rs.getString("company")+" "+"CALL# :"+" "+ rs.getString("detail")+" "+"Due:"+returnbook;

}

}
stmt.close();
con.close();


} catch (SQLException ex) {

} catch (Exception e) {}

return result;
}


}