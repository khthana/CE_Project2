package insert;
import java.sql.*;
import sql_code.sqlCom;
import var.VarDB;

public class add_fac {
	static String tname = "",  ename = "", tabb = "", eabb = "", tdean = "", edean = "", tregis = "" , eregis = "",
				  	      tauth = "", eauth = "", tauthrank = "", eauthrank = "";
	static String result = "";
	static public int id;
	static Connection con;
	static ResultSet rs;
	static VarDB v = new VarDB();
	public String getAdd() {
		try { //load driver
			Class.forName(v.JDBCNAME).newInstance();
		} catch (Exception ex) {
			return "";
		}
		try {
			con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			String SQL = "select max(FACID) from faculty;"; //find max  facid
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(SQL);
			rs.next();
			id = rs.getInt("max(FACID)");
			//create new id
			id++;
			//insert value
			SQL = "insert into faculty(FACID, TNAME, ENAME, TABB, EABB, TDEAN, EDEAN, TREGIS, EREGIS, TAUTH, EAUTH, TAUTHRANK, EAUTHRANK) values ( '"+id+"','"+tname+"','"+ename+"','"+tabb+"','"+eabb+"','"+tdean+"','"+edean+"','"+tregis+"','"+eregis+"','"+tauth+"','"+eauth+"','"+tauthrank+"','"+eauthrank+"' ); ";//insertdata
			int ret = stmt.executeUpdate(SQL);
			//close connection
			con.close();
		} catch (SQLException ex) {
			return result = "not complete";
		}
		return "";
	}
	public String getView() {
		String str;
		try { //load driver
			Class.forName(v.JDBCNAME).newInstance();
		} catch (Exception ex) {
			return result = "not complete";
		}
		try {
			con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			String SQL = "select * from faculty where FACID = " + id + ";"; //find max  facid
			Statement stmt = con.createStatement();
			rs = stmt.executeQuery(SQL);
			rs.next();
			//new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
			try {
				tname = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
				ename = new String(rs.getString("ENAME").getBytes("ISO8859_1"), "TIS-620");
				tabb = new String(rs.getString("TABB").getBytes("ISO8859_1"), "TIS-620");
				eabb = new String(rs.getString("EABB").getBytes("ISO8859_1"), "TIS-620");
				tdean = new String(rs.getString("TDEAN").getBytes("ISO8859_1"), "TIS-620");
				edean = new String(rs.getString("EDEAN").getBytes("ISO8859_1"), "TIS-620");
				tregis = new String(rs.getString("TREGIS").getBytes("ISO8859_1"), "TIS-620");
				eregis = new String(rs.getString("EREGIS").getBytes("ISO8859_1"), "TIS-620");
				tauth = new String(rs.getString("TAUTH").getBytes("ISO8859_1"), "TIS-620");
				eauth = new String(rs.getString("EAUTH").getBytes("ISO8859_1"), "TIS-620");
				tauthrank = new String(rs.getString("TAUTHRANK").getBytes("ISO8859_1"), "TIS-620");
				eauthrank = new String(rs.getString("EAUTHRANK").getBytes("ISO8859_1"), "TIS-620");
			} catch (Exception ex) {
				return result = "not complete 1 ";
			}
			//close connection
			con.close();
		} catch (SQLException ex) {
			return result = "not complete  2";
		}
		return "";
	}
	public String getEdit() {
		try { //load driver
			Class.forName(v.JDBCNAME).newInstance();
		} catch (Exception ex) {
			return result = "not complete";
		}
		try {
			con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			String SQL = "update faculty set TNAME='" + tname + "', ENAME='" + ename + "', TABB='" + tabb + "', EABB='" + eabb + "', TDEAN='" + tdean + "', EDEAN='" + edean + "', TREGIS='" + tregis + "', EREGIS='" + eregis + "', TAUTH='" + tauth + "', EAUTH='" + eauth + "', TAUTHRANK='" + tauthrank + "', EAUTHRANK='" + eauthrank + "' where FACID=" + id + ";";
			Statement stmt = con.createStatement();
			int re = stmt.executeUpdate(SQL);
			//close connection
			con.close();
		} catch (SQLException ex) {
			return result = "not complete";
		}
		return "";
	}
	public String getDele() {
		try { //load driver
			Class.forName(v.JDBCNAME).newInstance();
		} catch (Exception ex) {
			return result = "not complete";
		}
		try {//DELETE FROM faculty WHERE FACID=4
			con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			String SQL = "delete from faculty where facid ="+id+";";
			Statement stmt = con.createStatement();
			int re = stmt.executeUpdate(SQL);
			//close connection
			con.close();
		} catch (SQLException ex) {
			return result = "not complete";
		}
		return "";
	}
	public void setTname(String val) { tname = val; } public String getTname() { return tname; }
	public void setEname(String val) { ename = val; } public String getEname() { return ename; }
	public void setTabb(String val) { tabb = val; } public String getTabb() { return tabb; }
	public void setEabb(String val) { eabb = val; } public String getEabb() { return eabb; }
	public void setTdean(String val) { tdean = val; } public String getTdean() { return tdean; }
	public void setEdean(String val) { edean = val; } public String getEdean() { return edean; }
	public void setTregis(String val) { tregis = val; } public String getTregis() { return tregis; }
	public void setEregis(String val) { eregis = val; } public String getEregis() { return eregis; }
	public void setTauth(String val) { tauth= val; } public String getTauth() { return tauth; }
	public void setEauth(String val) { eauth= val; } public String getEauth() { return eauth; }
	public void setTauthrank(String val) { tauthrank =  val; } public String getTauthrank() { return tauthrank; }
	public void setEauthrank(String val) { eauthrank= val; } public String getEauthrank() { return eauthrank; }
	public void setFac(String val) { id = Integer.parseInt(val); } public String getFac() { return Integer.toString(id); }
}