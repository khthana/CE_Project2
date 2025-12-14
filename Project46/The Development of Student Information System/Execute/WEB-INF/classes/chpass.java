package auth;
import java.sql.*;
import sql_code.sqlCom;
public class chpass{
	String opass = new String(); String cpass = new String(); String npass = new String(); String user = new String();
	sqlCom SQLC = new sqlCom();
	public boolean Change()  throws SQLException {
		if ( !npass.equals(cpass) ) { return false; }
			String SQL = "select pass from user where username ='"+user+"';";
			ResultSet rs = SQLC.select(SQL); rs.next();
			if ( !opass.equals(rs.getString("pass"))) { return false; }
			SQL = "update user set pass='"+npass +"' where username ='"+user+"';";
			SQLC.update(SQL);
			return true;
	}
	public void setOpass(String str) {  opass = str;} public void setCpass(String str) { cpass = str;} public void setNpass(String str) { npass = str;}
	public void setUser(String str) { user = str; }
}