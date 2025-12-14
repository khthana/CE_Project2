//  Search  จาก Title
import javax.swing.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;
class   Title{
	
static	 String  Find(String q){
String		Query = q;
String  result="";
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con =
DriverManager.getConnection("jdbc:mysql://localhost/databook?user=root");
Statement stmt = con.createStatement();
String     sql = "SELECT * FROM  book  WHERE  name_book  LIKE'"+Query+"%' ";

System.out.println(sql);
System.out.println();
ResultSet rs = stmt.executeQuery(sql);


String  test2=" ";
//	rs.first(); 
while (rs.next()) {
// System.out.println(rs.getString("name_book") +" : " +  rs.getString("company"));
//result  += "Book name"+" "+rs.getString("name_book") +" Company" +" "+ rs.getString("company")+"Detail :"+" "+ rs.getString("detail");

String returnbook = rs.getString("return_book");

if(returnbook.equals("")){
result  += "Book name:"+" "+rs.getString("name_book") +" "+"Auther:"+" "+rs.getString("writer") +" "+" Company:" +" "+ rs.getString("company")+" "+"CALL#:"+" "+ rs.getString("detail");

}else {
result  += "Book name:"+" "+rs.getString("name_book") +" "+"Auther:"+" "+rs.getString("writer") +" "+" Company:" +" "+ rs.getString("company")+" "+"CALL# :"+" "+ rs.getString("detail")+" "+"Due:"+returnbook;

}
}
stmt.close();
con.close();
//JOptionPane.showMessageDialog(null,test2);
//System.out.println(result);

//

} catch (SQLException ex) {

} catch (Exception e) {}

/*String url = "jdbc:odbc:ConnectODBCdb1";
//String test=in;
String sql ="SELECT * FROM   Book  WHERE  Title  LIKE '";

//sql += test + "%'";
 System.out.println(sql);
try{


Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");  
Connection conn = DriverManager.getConnection(url); 
 PreparedStatement pstat = conn.prepareStatement(sql,ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	ResultSet rs = pstat.executeQuery();
		rs.first(); 
  while(!rs.isAfterLast()){
//	  ey1  =   ey1+=" Author"+" "+rs.getString(2)+"  Title  "+rs.getString(3)+"  Imprint   "+rs.getString(4)+"  Status  "+rs.getString(5)+"  Due  "+rs.getString(6)+"  Location  "+rs.getString(7);  
	rs.next();
  }
//	System.out.println(ey1);
//	PrintStream op = new PrintStream(s.getOutputStream());
	//	op.println(ey1);
rs.close();
  conn.close();
}catch(ClassNotFoundException e){
 				System.out.println(e.getMessage());
 			}catch(SQLException e){
					System.out.println("No Book");
//					ey1="No Book";
//	PrintStream op = new PrintStream(s.getOutputStream());
	//	op.println("No Data");
		//			System.exit(0);
 				//System.out.println(e.getMessage());


	
			} 


*/
return result;
}


}