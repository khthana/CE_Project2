package insert;
import java.util.Date;
import java.sql.*;
import java.text.*;
import sql_code.sqlCom;
public class add_sub {
	int 			[] m1; int [] m2; int m3[];
	int			isthesis = 0, islang = 0, lecture = 0, lab = 0, credit = 0;
	String 	subid = "", tname = "", ename ="", facid ="", sec ="", level ="", term1 ="0",  term2 ="0",  term3 ="0";
	String		tday1_1 = "", tday1_2 = "", tday1_3 = "", tday2_1 = "", tday2_2 = "", tday2_3 = "", tday3_1 = "", tday3_2 = "", tday3_3 = "";
	String		tmon1_1 = "", tmon1_2 = "", tmon1_3 = "", tmon2_1 = "", tmon2_2 = "", tmon2_3 = "", tmon3_1 = "", tmon3_2 = "", tmon3_3 = "";
	String		tstart1_1 = "", tstart1_2 = "", tstart1_3 = "", tstart2_1 = "", tstart2_2 = "", tstart2_3 = "", tstart3_1 = "", tstart3_2 = "", tstart3_3 = "";
	String		tend1_1 = "", tend1_2 = "", tend1_3 = "", tend2_1 = "", tend2_2 = "", tend2_3 = "", tend3_1 = "", tend3_2 = "", tend3_3 = "";
	String [] psubid; String [] s1; String [] s3; String [] s2;
	String [] note11; String [] note12; String [] note13;
	String [] note21; String [] note22; String [] note23;
	sqlCom SQLC = new sqlCom();
	public String getAdd() throws Exception{
			credit = lab + lecture;
			String SQL = "insert into subject(SUBID, TNAME, ENAME, FACID, LECTURE, LAB, CREDIT, ISTHESIS, ISLANG) values ( '"+subid+"','"+tname+"','"+ename+"','"+facid+"','"+lecture+"','"+lab+"','"+credit+"','"+isthesis+"','"+islang+"'); ";//insertdata
			if( !SQLC.insert(SQL) ) return "";
			for(int i = 0; i < psubid.length; i++ ) {
				SQL = "insert into prerequisite(SUBID, PSUBID) values ('"+subid+"','"+psubid[i]+"'); ";
				if (!SQLC.insert(SQL)) return "" + psubid.length;
			}
			//SimpleDateFormat tdate1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//SimpleDateFormat tdate2 = new SimpleDateFormat("HH:mm:ss");
			//Date datemb = new Date(); Date dateme = new Date();
			//Date datefb = new Date(); Date datefe = new Date();
			String tmp1 = new String();String tmp2 = new String();
			if(term1.equals("1"))  {
				/*tmp = tmon1_1 + "." + tday1_1 + "." + tstart1_1;
				//return tmp + tend1_1;
				datemb = tdate1.parse(tmp);	dateme = tdate2.parse(tend1_1);
				tmp = tmon1_2 + "." + tday1_2 + "." + tstart1_2;
				datefb = tdate1.parse(tmp); datefe = tdate2.parse(tend1_2);
				SQL = "insert into openterm(SUBID, MIDTERMBEG, MIDTERMEND, FINALBEG, FINALEND, TERM) values ('"+subid+"','"+datemb+"','"+dateme+"','"+datefb+"','"+datefe+"','1');";*/
				tmp1 = tmon1_1 + "." + tday1_1 + "." + tstart1_1; tmp2 = tmon1_2 + "." + tday1_2 + "." + tstart1_2;
				SQL = "insert into openterm(SUBID, MIDTERMBEG, MIDTERMEND, FINALBEG, FINALEND, TERM) values ('"+subid+"','"+tmp1+"','"+tend1_1+"','"+tmp2+"','"+tend1_2+"','1');";
				if ( !SQLC.insert(SQL)) return "not";
				for(int i = 0; i < s1.length; i++) {
					SQL =  "insert into section(SUBID, SEC, MAXSTD, NOTE1, NOTE2,TERM) values ('"+subid+"','"+s1[i]+"','"+m1[i]+"','"+note11[i]+"','"+note21[i]+"','1');";
				}

			}
			if(term2.equals("1"))  {
				/*tmp = "0000-" + tmon2_1 + "-" + tday2_1 + " " + tstart2_1 + ":00";
				//return tmp + tend1_1;
				datemb = tdate1.parse(tmp);	dateme = tdate2.parse(tend2_1+":00");
				tmp = "0000-" + tmon2_2 + "-" + tday2_2 + " " + tstart2_2 + ":00";
				datefb = tdate1.parse(tmp); datefe = tdate2.parse(tend2_2+":00");
				SQL = "insert into openterm(SUBID, MIDTERMBEG, MIDTERMEND, FINALBEG, FINALEND, TERM) values ('"+subid+"','"+datemb+"','"+dateme+"','"+datefb+"','"+datefe+"','2');";*/
				tmp1 = tmon2_1 + "." + tday2_1 + "." + tstart2_1; tmp2 = tmon2_2 + "." + tday2_2 + "." + tstart2_2;
				SQL = "insert into openterm(SUBID, MIDTERMBEG, MIDTERMEND, FINALBEG, FINALEND, TERM) values ('"+subid+"','"+tmp1+"','"+tend2_1+"','"+tmp2+"','"+tend2_2+"','2');";
				if ( !SQLC.insert(SQL)) return "not";
			}
			if(term3.equals("1"))  {
				/*tmp = "0000-" + tmon3_1 + "-" + tday3_1 + " " + tstart3_1 + ":00";
				//return tmp + tend1_1;
				datemb = tdate1.parse(tmp);	dateme = tdate2.parse(tend3_1+":00");
				tmp = "0000-" + tmon3_2 + "-" + tday3_2 + " " + tstart3_2 + ":00";
				datefb = tdate1.parse(tmp); datefe = tdate2.parse(tend3_2+":00");
				SQL = "insert into openterm(SUBID, MIDTERMBEG, MIDTERMEND, FINALBEG, FINALEND, TERM) values ('"+subid+"','"+datemb+"','"+dateme+"','"+datefb+"','"+datefe+"','3');";*/
				tmp1 = tmon3_1 + "." + tday3_1 + "." + tstart3_1; tmp2 = tmon3_2 + "." + tday3_2 + "." + tstart3_2;
				SQL = "insert into openterm(SUBID, MIDTERMBEG, MIDTERMEND, FINALBEG, FINALEND, TERM) values ('"+subid+"','"+tmp1+"','"+tend3_1+"','"+tmp2+"','"+tend3_2+"','3');";
				if ( !SQLC.insert(SQL)) return "not";
			}
			return "complete";
	}


	public void setSubid(String val) { subid = val; }
	public void setTname(String val) { tname = val; }
	public void setEname(String val) { ename = val; }
	public void setFacid(String val) { facid = val; }
	public void setTday1_1(String val) { tday1_1 = val; }//term_m or f
	public void setTday1_2(String val) { tday1_2 = val; }
	public void setTday1_3(String val) { tday1_3 = val; }
	public void setTday2_1(String val) { tday2_1 = val; }
	public void setTday2_2(String val) { tday2_2 = val; }
	public void setTday2_3(String val) { tday2_3 = val; }
	public void setTday3_1(String val) { tday3_1 = val; }
	public void setTday3_2(String val) { tday3_2 = val; }
	public void setTday3_3(String val) { tday3_3 = val; }
	public void setTmon1_1(String val) { tmon1_1 = val; }
	public void setTmon1_2(String val) { tmon1_2 = val; }
	public void setTmon1_3(String val) { tmon1_3 = val; }
	public void setTmon2_1(String val) { tmon2_1 = val; }
	public void setTmon2_2(String val) { tmon2_2 = val; }
	public void setTmon2_3(String val) { tmon2_3 = val; }
	public void setTmon3_1(String val) { tmon3_1 = val; }
	public void setTmon3_2(String val) { tmon3_2 = val; }
	public void setTmon3_3(String val) { tmon3_3 = val; }
	public void setTstart1_1(String val) { tstart1_1 = val; }
	public void setTstart1_2(String val) { tstart1_2 = val; }
	public void setTstart1_3(String val) { tstart1_3 = val; }
	public void setTstart2_1(String val) { tstart2_1 = val; }
	public void setTstart2_2(String val) { tstart2_2 = val; }
	public void setTstart2_3(String val) { tstart2_3 = val; }
	public void setTstart3_1(String val) { tstart3_1 = val; }
	public void setTstart3_2(String val) { tstart3_2 = val; }
	public void setTstart3_3(String val) { tstart3_3 = val; }
	public void setTend1_1(String val) { tend1_1 = val; }
	public void setTend1_2(String val) { tend1_2 = val; }
	public void setTend1_3(String val) { tend1_3 = val; }
	public void setTend2_1(String val) { tend2_1 = val; }
	public void setTend2_2(String val) { tend2_2 = val; }
	public void setTend2_3(String val) { tend2_3 = val; }
	public void setTend3_1(String val) { tend3_1 = val; }
	public void setTend3_2(String val) { tend3_2 = val; }
	public void setTend3_3(String val) { tend3_3 = val; }
	public void setLab(String val) { lab = Integer.parseInt( val); }
	public void setLecture(String val) { lecture = Integer.parseInt( val); }
	public void setTerm1(String  val) {		term1 = val;	}
	public void setTerm2(String  val) {		term2 = val;	}
	public void setTerm3(String  val) {		term3 = val;	}
	public void setNote11(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		note11 = new String[tmp];
		for ( int i = 0; i < tmp; i++) {
			note11[i] = val[i + 1];
		}
	}
	public void setNote21(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		note21 = new String[tmp];
		for ( int i = 0; i < tmp; i++) {
			note21[i] = val[i + 1];
		}
	}
	public void setNote12(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		note12 = new String[tmp];
		for ( int i = 0; i < tmp; i++) {
			note12[i] = val[i + 1];
		}
	}
	public void setNote22(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		note22 = new String[tmp];
		for ( int i = 0; i < tmp; i++) {
			note22[i] = val[i + 1];
		}
	}
	public void setNote13(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		note13 = new String[tmp];
		for ( int i = 0; i < tmp; i++) {
			note13[i] = val[i + 1];
		}
	}
	public void setNote23(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		note23 = new String[tmp];
		for ( int i = 0; i < tmp; i++) {
			note23[i] = val[i + 1];
		}
	}

	public void setPsubid(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		psubid = new String[tmp];
		for ( int i = 0; i < tmp; i++) {
			psubid[i] = val[i + 1];
		}
	}
	public void setLevel(String val) {
		if(val.equals("1")) { islang = 0; isthesis = 0;}
		if(val.equals("2")) { islang = 0; isthesis = 1;}
		if(val.equals("3")) { islang = 0; isthesis = 1;}
		if(val.equals("4")) { islang = 1; isthesis = 0;}
	}
	public void setS1(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		s1 = new String[tmp];
		for ( int i = 0; i < tmp; i++) {
			s1[i] = val[i + 1];
		}
	}
	public void setS2(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		s2 = new String[tmp];
		for ( int i = 0; i < tmp; i++) {
			s2[i] = val[i + 1];
		}
	}
	public void setS3(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		s3 = new String[tmp];
		for ( int i = 0; i < tmp; i++) {
			s3[i] = val[i + 1];
		}
	}
	public void setM1(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		m1 = new int[tmp];
		for ( int i = 0; i < tmp; i++) {
			m1[i] = Integer.parseInt(val[i + 1]);
		}
	}
	public void setM2(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		m2 = new int[tmp];
		for ( int i = 0; i < tmp; i++) {
			m2[i] = Integer.parseInt(val[i + 1]);
		}
	}
	public void setM3(String [] val) {
		int tmp = 0;
		for( int i = 1 ; i < val.length; i++ ) {
			if( val[i].equals("")) break;
			tmp++;
		}
		m3 = new int[tmp];
		for ( int i = 0; i < tmp; i++) {
			m3[i] = Integer.parseInt(val[i + 1]);
		}
	}
}
