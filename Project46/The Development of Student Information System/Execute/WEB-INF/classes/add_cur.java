package insert;
import java.sql.*;
import sql_code.sqlCom;

public class add_cur {
	//curriculum
	String depid, tname, ename, degree, eduyear, totalcredit, kind;	int crcid;
	//extraexp
	String []code1; String [] yearapplied1;	int [] amt1;//ไทย
	String []code2; String [] yearapplied2;	int [] amt2;//ต่างชาติ

	//addexp
	String [] expense1; String [] e1; int [] a1;//ไทย
	String [] expense2; String [] e2; int [] a2;//ต่างชาติ
	//for program
	String SQL = ""; sqlCom SQLC	= new sqlCom();	ResultSet rs;
	public void initval() {
		crcid = 0; depid = ""; tname = ""; ename = ""; degree = ""; eduyear = ""; totalcredit = ""; kind = "";
		code1 = new String[0]; 	code2 = new String[0];	expense1 = new String[0];	expense2 = new String[0];
	}
	public String add() throws Exception {
		SQL = "select max(CRCID) from curriculm;"; //find max facid
		rs = SQLC.select(SQL);
		if ( !rs.next() ) crcid = 1;
		else crcid = rs.getInt("max(CRCID)");		crcid++;
		SQL = "insert into curriculm(CRCID, DEPID, TNAME, ENAME, DEGREE, EDUYEAR, TCREDIT, KIND ) values ( '"+crcid+"','"+depid+"','"+tname+"','"+ename+"','"+degree+"','"+eduyear+"','"+totalcredit+"','"+kind+"');";
		SQLC.insert(SQL);
		for(int i = 0; i < code1.length; i++) {
			SQL = "insert into extraexp(CRCID, CODE, AMT, YEARAPPLIED, STDTYPE ) values ( '"+crcid+"','"+code1[i]+"','"+amt1[i]+"','"+yearapplied1[i]+"','1');";
			if(!SQLC.insert(SQL)) return "not";
		}
		for(int i = 0; i < code2.length; i++) {
			SQL = "insert into extraexp(CRCID, CODE, AMT, YEARAPPLIED, STDTYPE ) values ( '"+crcid+"','"+code2[i]+"','"+amt2[i]+"','"+yearapplied2[i]+"','2');";
			if(!SQLC.insert(SQL)) return "not";
		}
		for(int i = 0; i < expense1.length; i++) {
			SQL = "insert into addexp(CRCID, EXPENSE, AMT, YEARAPPLIED, STDTYPE ) values ( '"+crcid+"','"+expense1[i]+"','"+a1[i]+"','"+e1[i]+"','1');";
			if(!SQLC.insert(SQL)) return "not";
		}
		for(int i = 0; i < expense2.length; i++) {
			SQL = "insert into addexp(CRCID, EXPENSE, AMT, YEARAPPLIED, STDTYPE ) values ( '"+crcid+"','"+expense2[i]+"','"+a2[i]+"','"+e2[i]+"','2');";
			if(!SQLC.insert(SQL)) return "not";
		}
		return "complete";
	}
	//curriculum
	public void setDepid(String val) { depid = val;	}
	public void setTname(String val) { tname = val; }
	public void setEname(String val) { ename = val;	}
	public void setDegree(String val) { degree = val; }
	public void setEduyear(String val) { eduyear = val; }
	public void setTotalcredit(String val) { totalcredit = val; }
	public void setKind(String val) { kind = val; }
	//extraexp
	public void setCode1(String [] val) { code1 = val; }
	public void setCode2(String [] val) { code2 = val; }
	public void setYearapplied1(String [] val) { yearapplied1 = val; }
	public void setYearapplied2(String [] val) { yearapplied2 = val; }
	public void setAmt1(String [] val) {
		amt1 = new int[val.length];
		for( int i = 0; i <val.length; i++ ) amt1[i] = Integer.parseInt(val[i]);
	}
	public void setAmt2(String [] val) {
		amt2 = new int[val.length];
		for( int i = 0; i <val.length; i++ ) amt2[i] = Integer.parseInt(val[i]);
	}
	//addexp
	public void setExpense1(String [] val) {
		int tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	tmp++;
		}
		expense1 = new String[tmp]; tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	expense1[tmp++] = val[i];
		}
	}
	public void setExpense2(String [] val) {
		int tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	tmp++;
		}
		expense2 = new String[tmp]; tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	expense2[tmp++] = val[i];
		}
	}
	public void setE1(String [] val) {
		int tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	tmp++;
		}
		e1 = new String[tmp]; tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	e1[tmp++] = val[i];
		}
	}
	public void setE2(String [] val) {
		int tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	tmp++;
		}
		e2 = new String[tmp]; tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	e2[tmp++] = val[i];
		}
	}
	public void setA1(String [] val) {
		int tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	tmp++;
		}
		a1 = new int[tmp]; tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	a1[tmp++] = Integer.parseInt(val[i]);
		}
	}
	public void setA2(String [] val) {
		int tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	tmp++;
		}
		a2 = new int[tmp]; tmp = 0;
		for( int i = 0; i < val.length; i++ ) {
			if( !val[i].equals("") )	a2[tmp++] = Integer.parseInt(val[i]);
		}
	}
}