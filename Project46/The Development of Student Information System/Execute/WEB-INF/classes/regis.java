package insert;
import java.sql.*;
import sql_code.sqlCom;
public class regis {
	//authen
	String stdid = "", year = "", term = "", tfname = "", tlname = "", tpren = "", crcid = "", libfac = "", faclibfac = "", status = "", stdkind = "";
	//register
	String [] subid; String [] sec; String [] sname;
	//withdraw
	String [] subdel;

	//tmp
	String SQL; String [][] tmp;
	//flag
	int flag; //  ลงทะเบียนได้ = 1  ลงไม่ได้ = 0
	String [] result;

	static sqlCom SQLC = new sqlCom();
	public void init() {
		stdid = ""; year = ""; term = ""; tfname = ""; tlname = ""; tpren = ""; crcid = ""; libfac = ""; faclibfac = ""; status = ""; stdkind = "";
		subid = new String[0];
	}
	public void init2() {
		 flag = 1; subid = new String[0];
	}
	public String authen() throws Exception {
		String SQL = "select tfname, tlname, tpren, crcid, libfac, faclibfac, stdkind, status from student where STDID = " + stdid + ";";
		ResultSet rs = SQLC.select(SQL);
		if( !rs.next() ) { return "1"; }
		tfname = new String(rs.getString("TfNAME").getBytes("ISO8859_1"), "TIS-620");
		tlname = new String(rs.getString("TlNAME").getBytes("ISO8859_1"), "TIS-620");
		tpren = new String(rs.getString("TPREN").getBytes("ISO8859_1"), "TIS-620");
		crcid = new String(rs.getString("CRCID").getBytes("ISO8859_1"), "TIS-620");
		libfac = new String(rs.getString("LIBFAC").getBytes("ISO8859_1"), "TIS-620");
		faclibfac = new String(rs.getString("FACLIBFAC").getBytes("ISO8859_1"), "TIS-620");
		status = new String(rs.getString("STATUS").getBytes("ISO8859_1"), "TIS-620");
		stdkind = new String(rs.getString("STDKIND").getBytes("ISO8859_1"), "TIS-620");
		return tpren + tfname + "     " + tlname;
	}
	public String register() throws Exception {
		int tmp = 0;
		for(int i = 0; i < subid.length; i++) {
			SQL = "insert into grade(STDID, YEAR, TERM, SUBID, SEC) values ( '"+stdid+"','"+year+"','"+term+"','"+subid[i]+"','"+sec[i]+"');";
			if (!SQLC.insert(SQL)) return "not";

//			SQL = "select nowstd  from section where subid ='"+subid[i]+"' and term ='"+term+"' and year ='"+year+"';";
//			ResultSet rs = SQLC.select(SQL); rs.next();
//			tmp = rs.getInt("nowstd"); tmp++;
//SQL = "update faculty set TNAME='" + tname + "', ENAME='" + ename + "', TABB='" + tabb + "', EABB='" + eabb + "', TDEAN='" + tdean + "', EDEAN='" + edean + "', TREGIS='" + tregis + "', EREGIS='" + eregis + "', TAUTH='" + tauth + "', EAUTH='" + eauth + "', TAUTHRANK='" + tauthrank + "', EAUTHRANK='" + eauthrank + "' where FACID=" + id + ";";
//			SQL = "update section set nowstd ='" + tmp + ";";
//			SQLC.update(SQL);
		}

		subid = new String[0];
		return "0";
	}
	public String check() throws Exception {
		flag =1;
		for(int i = 0; i < subid.length; i++) {
			SQL = "select * from subject where subid ='"+subid[i]+"';";
			ResultSet rs = SQLC.select(SQL);
			if( !rs.next() ) {
				result[i] = "no subject";   flag = 0; continue;
			}
			else {
				sname[i] = new String(rs.getString("tname").getBytes("ISO8859_1"), "TIS-620");
				SQL = "select * from openterm where subid ='"+subid[i]+"' and term ='"+term+"';";
				rs = SQLC.select(SQL);
				if( !rs.next() ) { result[i] ="not open term";   flag = 0; continue; }
				else {
					SQL = "select * from section where subid ='"+subid[i]+"' and term ='"+term+"' and sec ='"+sec[i]+"';";
					rs = SQLC.select(SQL);
					if( !rs.next() ) { result[i] ="not open sec";   flag = 0; continue; }
					else {
						int t1 = rs.getInt("nowstd"); int t2 = rs.getInt("maxstd");
						if(  t1 >= t2 ) { result[i] = "section full"; flag = 0; continue; }
					}
				}
			}
			result[i] = "no problem";
		}
		return "" + flag;
	}
	public void del() throws Exception {
		//String SQL = "delete from faculty where facid ="+id+";";
		for(int i = 0; i < subdel.length; i++ ) {
			SQL = "delete from grade where subid ='"+subdel[i]+"' and stdid ='"+ stdid +"' and term ='"+term+"' and year ='"+year+"';";
			SQLC.delete(SQL);
		}

	}

	public void setStdid(String val) { stdid = val; }	public String getStdid() { return stdid; }
	public void setYear(String val) { year = val;} public String getYear() { return year; }
	public void setTerm(String val) { term = val; }	public String getTerm() {return term; }
	public void setSubdel(String [] val) { subdel = val; }

	public void setSubid(String [] val) {
		int tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	tmp++;
		}
		subid = new String[tmp]; result = new String[tmp]; sname = new String[tmp]; tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	subid[tmp++] = val[i];
		}

	}
	public void setSec(String [] val) {
			int tmp = 0;
			for( int i = 0; i < val.length; i++ ) {
				if( !val[i].equals("") )	tmp++;
			}
			sec = new String[tmp]; tmp = 0;
			for( int i = 0; i < val.length; i++ ) {
				if( !val[i].equals("") )	sec[tmp++] = val[i];
			}
	}
	public String [] getResult() { return result; }
	public String [] getSubid() { return subid; }
	public String [] getSname() { return sname; }
	public int getFlag() { return flag; }
	public String getTfname() { return tlname; }
	public String getTlname() { return tfname; }
	public String [][] getSubr() throws Exception {
		tmp = new String[0][0];
		SQL = "select count(*) as xx  from grade where stdid ='"+stdid+"' and term ='"+term+"' and year ='"+year+"';";
		ResultSet rs = SQLC.select(SQL); int cou;
		if ( rs.next() ) {
			cou = rs.getInt( "xx" );
			tmp = new String[3][cou];
		}
/*		SQL = "select subid, sec  from grade where stdid ='"+stdid+"' and term ='"+term+"' and year ='"+year+"';";
		rs = SQLC.select(SQL); cou = 0;
		while( rs.next() ) {
			tmp[0][cou] = rs.getString("subid");
			tmp[1][cou] =  rs.getString("sec");
			cou++;
		}*/
		SQL = "select a.subid, a.tname, b.sec from subject a, grade b  where	a.subid = b.subid and stdid ='"+stdid+"' and term ='"+term+"' and year ='"+year+"';";
		rs = SQLC.select(SQL);	cou = 0;
		while( rs.next() ) {
			tmp[0][cou] = rs.getString("subid");
			tmp[1][cou] = rs.getString("tname");
			tmp[2][cou] =  rs.getString("sec");
			cou++;
		}
		return tmp;
	}
}