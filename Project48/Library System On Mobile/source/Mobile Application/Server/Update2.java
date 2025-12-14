//   ยืมหนังสือต่อ
import javax.swing.*;
import java.io.*;
import java.net.*;
import java.sql.*;
import java.util.*;
import javax.swing.JOptionPane;
class   Update2{
Update2 (String a ,String b){ 
   String	  Idstudent = a;
   String        Idbook = b;
	String due = Find(a,b);
	System.out.println(due);		
	int day;
	int month=0;
	int year=0;
  String  test =   due.substring(1,2);
if(test.equals("-")){
 day =  Integer.parseInt(due.substring(0,1));
  month = Integer.parseInt(due.substring(3,4));
  year = Integer.parseInt(due.substring(5,7));
  day+=7;
	   System.out.println(day);
	    System.out.println(month);
		   System.out.println(year);
	}else{
		 day =  Integer.parseInt(due.substring(0,2));
		 day+=7;
	System.out.println(day);
	
	
	}
String newday =   Integer.toString(day);
String newmonth = Integer.toString(month);
String newyear = Integer.toString(year);

String  newdmy = newday +"-"+ newmonth +"-"+ newyear;
System.out.println(newdmy);

Updatesql(newdmy,Idstudent);
	}

static	 String  Find(String q,String n_book){
String		Query = q;
String name_book = n_book;
String  result="";

System.out.println("Debug");
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con =
DriverManager.getConnection("jdbc:mysql://localhost/databook?user=root");
Statement stmt = con.createStatement();
String     sql = "SELECT * FROM  book  WHERE  isbn LIKE'"+ name_book+"%'" +"AND id_student LIKE'"+Query+"'" ;
System.out.println(sql);
System.out.println();
//ResultSet rs = stmt.executeQuery(sql);


String  test2=" ";

/*while (rs.next()) {

result  += rs.getString("return_book");
}*/
stmt.close();
con.close();
} catch (SQLException ex) {
} catch (Exception e) {}
return result;
}

public  void Updatesql(String tempdmy,String tempid){
String newdmy = tempdmy; 
String id = tempid;
String result="";

System.out.println("Debug");
System.out.println("newdmy"+" "+newdmy);
System.out.println( "id"+" "+tempid);
System.out.println("Debug");

try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con =
DriverManager.getConnection("jdbc:mysql://localhost/databook?user=root");
Statement stmt = con.createStatement();
String     sql = "UPDATE   book  SET  return_book = " +" "+newdmy+" WHERE  id_student  = "+id; 

//"UPDATE  Book SET Due = ";     sql +="'"+newdmy+"'"+"WHERE ID ="+"'"+id+"'";
System.out.println(sql);
System.out.println();
int  rs = stmt.executeUpdate(sql);
String  test2=" ";

/*while (rs.next()) {
result  += rs.getString("return_book");
}
*/
/*if(rs!=0){

result  += rs.getString("return_book");
}*/
System.out.println("resultupdate  "+result);
stmt.close();
con.close();

} catch (SQLException ex) {
} catch (Exception e) {}

/*String url =  "jdbc:odbc:ConnectODBCdb1";
		String sql = "UPDATE  Book SET Due = ";
     sql +="'"+newdmy+"'"+"WHERE ID ="+"'"+id+"'";


System.out.println("Debug");
System.out.println(sql);
System.out.println("Debug");
try {
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection conn = DriverManager.getConnection(url);
		Statement stat = conn.createStatement();
		int s = stat.executeUpdate(sql);
		if(s!=0){
		JOptionPane.showMessageDialog(null,"Ok");
		//	String input =  JOptionPane.showInputDialog("ป้อนรหัสนักศึกษาที่ต้องการค้นหา!");
//                String  test =  getDate(input);
              //       System.out.println(test);
		//	System.exit(0);
		}else{
			JOptionPane.showMessageDialog(null,"No ok");
		}
}catch(ClassNotFoundException e){
	System.out.println(e.getMessage());
}catch(SQLException e){
		System.out.println(e.getMessage());
	}

*/
}


}