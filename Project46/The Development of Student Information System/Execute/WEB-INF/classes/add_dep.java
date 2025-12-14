package insert;
import java.sql.*;
import sql_code.sqlCom;
public class  add_dep {
	String tname = "",  ename = "", facid = ""; int id, fid;
	sqlCom SQLC = new sqlCom();
	public boolean getAdd() throws SQLException {
			String SQL = "select max(DEPID) from department;"; //find max  depid
			ResultSet rs = SQLC.select(SQL); rs.next();
			id = rs.getInt("max(DEPID)"); id++;
			SQL = "insert into department(DEPID, FACID, TNAME, ENAME ) values ( '"+id+"','"+fid+"','"+tname+"','"+ename+"'); ";//insertdata
			SQLC.insert(SQL);
			return true;
	}
	public void getView() throws SQLException {
		String SQL = "select * from department where DEPID = " + id + ";";
		ResultSet rs = SQLC.select(SQL); rs.next();
		try {
			tname = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
			ename = new String(rs.getString("ENAME").getBytes("ISO8859_1"), "TIS-620");
			tname = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
		} catch(Exception e) {}
	}//String SQL = "update faculty set TNAME='" + tname + "', ENAME='" + ename + "', TABB='" + tabb + "', EABB='" + eabb + "', TDEAN='" + tdean + "', EDEAN='" + edean + "', TREGIS='" + tregis + "', EREGIS='" + eregis + "', TAUTH='" + tauth + "', EAUTH='" + eauth + "', TAUTHRANK='" + tauthrank + "', EAUTHRANK='" + eauthrank + "' where FACID=" + id + ";";
	public String getEdit() throws SQLException {
		String SQL = "update department set TNAME='" + tname + "', ENAME='" + ename + "', FACID='" + fid + "' where DEPID=" + id + ";";
		if ( SQLC.update(SQL) ) return "complete";
		else return "not complete";
	}//String SQL = "delete from faculty where facid ="+id+";";
	public String getDele() throws SQLException {
		String SQL = "delete from department where DEPID  ="+id+";";
		if (SQLC.delete(SQL) ) return "complete" ;
		else return "not complete";
	}
	public void setTname(String val) { tname = val; }		public String getTname() { return tname; }
	public void setEname(String val) { ename = val; }	public String getEname() { return ename; }
	public void setFac(String val) {  fid = Integer.parseInt(val); }		public String getFac() { return Integer.toString(fid); }
	public void setDep(String val) { id = Integer.parseInt(val); }		public String getDep() { return Integer.toString(id); }
};