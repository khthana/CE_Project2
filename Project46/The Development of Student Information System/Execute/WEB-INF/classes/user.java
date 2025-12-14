package auth;
import java.sql.*;
import sql_code.sqlCom;
public class user{
	String User = new String(); 	String Pass = new String(); String Name = new String();
	sqlCom SQLC = new sqlCom(); String group = new String();
	public boolean Auth() throws SQLException {
			String SQL = "select * from user where username ='"+User+"';";
			ResultSet rs = SQLC.select(SQL); rs.next();
			if ( Pass.equals(rs.getString("pass")) ) {
				Name = rs.getString("name");
				group = rs.getString("gro");
				return true;
			}
			else { return false; }
	}
	public void setUser(String str) {  User = str; } public void setPass(String str) { Pass = str; }
	public String getName() { return Name;} public String getUser() { return User;}
	public String getGroup() { return group; }
}