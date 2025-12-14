package sql_code;
import java.sql.*;
import var.VarDB;

public class sqlCom {
	VarDB v = new VarDB();	Connection con;	Statement stmt; ResultSet rs;
	public sqlCom() {
		try { 	Class.forName(v.JDBCNAME).newInstance(); }
		catch (Exception ex) {  }
	}
	public boolean insert(String SQL) {
		try {
			Connection con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			Statement stmt = con.createStatement();
			int ret = stmt.executeUpdate(SQL);
			con.close();
		} catch (SQLException ex) { return false; }
		return true;
	}
	public boolean update(String SQL) {
		try {
			Connection con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			Statement stmt = con.createStatement();
			int ret = stmt.executeUpdate(SQL);
			con.close();
		} catch (SQLException ex) { return false; }
		return true;
	}
	public boolean delete(String SQL) {
		try {
			Connection con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			Statement stmt = con.createStatement();
			int ret  = stmt.executeUpdate(SQL);
			con.close();
		} catch (SQLException ex) {  return false; }
		return true;
	}
	public ResultSet select(String SQL) {
		try {
			Connection con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(SQL);
			con.close();
		} catch (SQLException ex) { }
		return rs;
	}
}