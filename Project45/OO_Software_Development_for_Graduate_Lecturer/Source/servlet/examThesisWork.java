
/*
	@jaikla
*/
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import lecturer.Lecturer;
import thesis.Thesis;
import thesis.examThesis;
import thesis.superviseThesis;
import student.Student;
import myutil.thaiLanguage;
import myutil.myDate;
import myutil.htmlTemplate;
import myutil.server;

public class examThesisWork extends HttpServlet{

	private String url = "";
	private String user = "";
	private String passwd = "";
	private Connection con;
	private examThesis examthesis = new examThesis();

//--------------------------------------------------------------------------------------- start connectDB
	public void connectDB(PrintWriter out){
		try{			
			Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
			con = DriverManager.getConnection(url,user,passwd);
		}
		catch (ClassNotFoundException e){out.println(e.getMessage());return;}
		catch (SQLException e){out.println(e.getMessage());return;}
		catch (Exception e){out.println(e.getMessage());return;}		
	}
//--------------------------------------------------------------------------------------- end connectDB

//--------------------------------------------------------------------------------------- start closeDB
	public void closeDB(){
		try{
			con.close( );
        }catch (SQLException e){System.err.print(e.getMessage());return;}
	}
//--------------------------------------------------------------------------------------- end closeDB

//--------------------------------------------------------------------------------------- start isExist
	public boolean isExist(String sqlCommand ,PrintWriter out)throws Exception{
			ResultSet rs;
			Statement stmt;

			connectDB(out);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){		// มีข้อมูลอยู่
				rs.close();
				stmt.close();
				closeDB();
				return true;
			}
			rs.close();
			stmt.close();
			closeDB();
			return false;
	}
//--------------------------------------------------------------------------------------- end isExist
//--------------------------------------------------------------------------------------- start getThesisID
	public int getThesisID(String sqlCommand ,PrintWriter out)throws Exception{
			ResultSet rs;
			Statement stmt;
			int thesisID = 0;
			connectDB(out);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){		// มีข้อมูลอย				
				thesisID= rs.getInt("THESIS#");
				rs.close();
				stmt.close();
				closeDB();
				return thesisID;
			}
			rs.close();
			stmt.close();
			closeDB();
			return 0;
	}
//--------------------------------------------------------------------------------------- end getThesisID

//--------------------------------------------------------------------------------------- start listExamThesis
public void listExamThesis(String stdID,PrintWriter out)throws Exception{
		ResultSet rs;
		Statement stmt;
		examThesis exThesis = new examThesis();
		// get ข้อมูลนักวิทยานิพนธ์
		
		String sqlCommand = "SELECT * FROM THESIS T, FACULTY F WHERE T.STD#='"+stdID+"' ";
		connectDB(out);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sqlCommand);
		if(rs.next()){		// มีข้อมูล
				if(rs.getInt("THESIS#")!=0)
					exThesis.setThesisID(rs.getInt("THESIS#"));
				if(rs.getString("ACADEMICYEAR")!=null)
					exThesis.setAcademicYear(rs.getString("ACADEMICYEAR"));
				if(rs.getString("TOPIC_TH")!=null)
					exThesis.setTopic_th(thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_TH")));
				if(rs.getString("TOPIC_EN")!=null)
					exThesis.setTopic_en(thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_en")));
				if(rs.getString("APPROVEDATE")!=null)
					exThesis.setApproveDate(thaiLanguage.UnicodeToMS874(rs.getString("APPROVEDATE")));
				if(rs.getString("STD#")!=null)
					exThesis.setStdID(rs.getString("STD#"));
				if(rs.getString("COMPLETE")!=null)
					exThesis.setComplete(rs.getString("COMPLETE"));
		}
		else{				// ไม่มีข้อมูลอยู่
				out.println("<br><font style=\"font:16px\" color=\"#FF0000\">"+thaiLanguage.UnicodeToMS874("ไม่พบข้อมูลการสอบวิทยานิพนธ์")+"</font>");
				out.println("<form action=\"../viewexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");
				return;
		}
		rs.close();
		// get ข้อมูลนักศึกษาที่ทำ Thesis
		sqlCommand = "SELECT S.STD#, S.TPRE, S.TNAME AS SNAME,S.TFAMILY,F.TNAME AS FNAME , "+
					"D.TNAME AS DNAME, M.TNAME AS MNAME ,C.TNAME AS CNAME "+
					"FROM STUDENT S,FACULTY F,DEPARTMENT D,MAJOR M,COURSE C  "+
					"WHERE S.STD# = '"+exThesis.getStdID()+"' "+  
					"AND ( F.FACT# =( SELECT FACT# FROM STUDENT WHERE STD#='"+exThesis.getStdID()+"' )) "+
					"AND ( D.DEPT#=( SELECT DEPT# FROM STUDENT WHERE STD#='"+exThesis.getStdID()+"')) "+
					"AND ( M.MAJOR#=(SELECT MAJOR# FROM STUDENT WHERE STD#='"+exThesis.getStdID()+"'))"+   
					"AND ( C.CO#=(SELECT CO# FROM STUDENT WHERE STD#='"+exThesis.getStdID()+"'))";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){	// get student from database
					if(rs.getString("STD#")!=null)
						exThesis.setStdID(rs.getString("STD#"));
					if(rs.getString("TPRE")!=null)
						exThesis.setStdTitle( rs.getString("TPRE"));
					if(rs.getString("SNAME")!=null)
						exThesis.setStdName( rs.getString("SNAME"));
					if(rs.getString("TFAMILY")!=null)
						exThesis.setStdSurname( rs.getString("TFAMILY"));
					if(rs.getString("CNAME")!=null)
						exThesis.setStdCourseName(rs.getString("CNAME"));
					if(rs.getString("FNAME")!=null)
						exThesis.setStdFactName(rs.getString("FNAME"));
					if(rs.getString("DNAME")!=null)
						exThesis.setStdDeptName(rs.getString("DNAME"));
					if(rs.getString("MNAME")!=null)
						exThesis.setStdMajorName(rs.getString("MNAME"));			
			}
			rs.close();

			// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก
			sqlCommand =	"SELECT * FROM LECTURER WHERE LECTURER# = "+
										"(SELECT LECTURER# FROM SUPERVISETHESIS WHERE THESIS# ="+exThesis.getThesisID()+" "+
										"AND SUPERVISESTATUS = '"+thaiLanguage.MS874ToUnicode("หลัก")+"' )";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){	
				exThesis.setSuperID(rs.getString("LECTURER#"));
				exThesis.setSuperAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
				exThesis.setSuperName(rs.getString("NAME_TH"));
				exThesis.setSuperSurname(rs.getString("SURNAME_TH"));
			}
			rs.close();

			// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม
			sqlCommand =	"SELECT * FROM LECTURER WHERE LECTURER# IN "+
										"(SELECT LECTURER# FROM SUPERVISETHESIS WHERE THESIS# ="+exThesis.getThesisID()+" "+
										"AND SUPERVISESTATUS = '"+thaiLanguage.MS874ToUnicode("ร่วม")+"' )";
			rs = stmt.executeQuery(sqlCommand);
			int cnt =0;
			while(rs.next()){	
				if(cnt==0){	// อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม คนที่ 1
					exThesis.setJoin1ID(rs.getString("LECTURER#"));
					exThesis.setJoin1AcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
					exThesis.setJoin1Name(rs.getString("NAME_TH"));
					exThesis.setJoin1Surname(rs.getString("SURNAME_TH"));
					cnt++;
				}
				if(cnt==1){	// อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม คนที่ 2
					exThesis.setJoin2ID(rs.getString("LECTURER#"));
					exThesis.setJoin2AcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
					exThesis.setJoin2Name(rs.getString("NAME_TH"));
					exThesis.setJoin2Surname(rs.getString("SURNAME_TH"));					
				}
			}			
			rs.close();

			// แสดงข้อมูลนักศึกษาที่ทำThesis
			out.println("<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\">"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  bgcolor=\"#9999CC\" height=\"30\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("ข้อมูลนักศึกษา")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td width=\"190\" height=\"10\"></td>\n"+		// empty
								"		<td width=\"460\"></td>\n"+								
								"</tr>\n"+								
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>รหัสนักศึกษา</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+exThesis.getStdID()+" &nbsp;</font></td>\n"+
								"</tr>\n"+		
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>ชื่อ</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getStdTitle()+exThesis.getStdName()+"&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getStdSurname())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>ศึกษาอยู่หลักสูตร</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getStdCourseName())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>คณะ</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getStdFactName())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>ภาควิชา</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getStdDeptName())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>สาขา</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getStdMajorName())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  height=\"10\"></td>\n"+	// empty
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  bgcolor=\"#9999CC\" height=\"30\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("ข้อมูลวิทยานิพนธ์")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  height=\"10\"></td>\n"+	// empty
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>รหัสวิทยานิพนธ์</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\"valign=\"top\" bgcolor=\"#E5E5F2\" ><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(""+exThesis.getThesisID())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>หัวข้อวิทยานิพนธ์(ไทย)</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\"valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getTopic_th())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>หัวข้อวิทยานิพนธ์(อังกฤษ)</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\"valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getTopic_en())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>อาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getSuperAcademicAffiliation()+exThesis.getSuperName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getSuperSurname())+" &nbsp;</font></td>\n"+
								"</tr>\n");
						if(!exThesis.getJoin1ID().equals("")){
							out.println(	"<tr>\n"+
												"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม1</b>")+"&nbsp;</font></td>\n"+
												"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getJoin1AcademicAffiliation()+exThesis.getJoin1Name()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getJoin1Surname())+" &nbsp;</font></td>\n"+
												"</tr>\n");
						}
						if(!exThesis.getJoin2ID().equals("")){
							out.println(	"<tr>\n"+
												"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม2</b>")+"&nbsp;</font></td>\n"+
												"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getJoin2AcademicAffiliation()+exThesis.getJoin2Name()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getJoin2Surname())+" &nbsp;</font></td>\n"+
												"</tr>\n");
						}
						
						if(!exThesis.getComplete().equals("YES"))
							exThesis.setComplete("NO");
						out.println(	"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>ส่งวิทยานิพนธ์</b>")+"&nbsp;</font></td>\n"+
											"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+exThesis.getComplete()+"</font></td>\n"+
											"</tr>\n");
						
			myDate mydate = new myDate();
			// get ข้อมูลผลการสอบวิทยานิพนธ์
			sqlCommand = "SELECT * FROM EXAMTHESIS WHERE THESIS#="+exThesis.getThesisID()+" ORDER BY EXAMDATE";
			rs = stmt.executeQuery(sqlCommand);
			out.println(	"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  height=\"10\"></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  bgcolor=\"#9999CC\" height=\"30\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("ผลการสอบวิทยานิพนธ์")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  height=\"10\"></td>\n"+
								"</tr>\n"+
								"<tr>\n"+	 // Cover
								"	<td align=\"left\" valign=\"top\" colspan=\"2\">"+ // Cover
								"		<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\" rules=\"rows\" frame=\"void\">"+
								"		<tr>\n"+
								"			<td width=\"150\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;&nbsp;&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("สอบครั้งที่")+"</td>\n"+
								"			<td width=\"500\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;"+thaiLanguage.UnicodeToMS874("วันที่สอบ")+"</td>\n"+
								"		</tr>\n");
			cnt=1;
			while(rs.next()){
				exThesis.setExamDate(rs.getString("EXAMDATE"));
				out.println(	"<tr>\n"+
									"		<td align=\"left\"  valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\" style=\"font:16px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("<b>"+cnt+"&nbsp;.</b>")+"</font></td>\n"+
									"		<td align=\"left\"  valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"miniheader\">&nbsp;</font><a href=\"examThesisWork?date="+exThesis.getExamDate()+"&stdID="+exThesis.getStdID()+"\" class=\"link1\">"+thaiLanguage.UnicodeToMS874("วันที่&nbsp;"+myDate.getThaiDate(""+exThesis.getExamDate()))+"</a></td>\n"+
									"</tr>\n");
				cnt++;
			}
			if(cnt==1){		// ไม่มีการผลการสอบ
				out.println(	"<tr>\n"+
									"		<td align=\"center\" valign=\"bottom\" colspan=\"2\" ><font color=\"#FF0000\" style=\"font:16px\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ไม่มีผลการสอบ")+"</font></td>\n"+
									"</tr>\n");
				out.println(	"</table>	</td>\n"+	// Cover
									"</tr>\n"+		// Cover
									"</table><br>"+
									"<br><form action=\"../viewexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
									"<input type=\"submit\" name=\"cancelView\" value=\"    "+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;ตกลง&nbsp;&nbsp;")+"  \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");
				rs.close();
				stmt.close();
				con.close();	
				return;
									
			}
			out.println(	"</table></td>\n"+	// Cover
								"</tr>\n"+	// Cover
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  height=\"10\"></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  bgcolor=\"#9999CC\" height=\"3\"></td>\n"+
								"</tr>\n"+
								"</table>");
			out.println("<br><a href=\"../viewexamthesis.jsp\" class=\"link1\" >"+thaiLanguage.UnicodeToMS874("ยกเลิก")+"</a>");

			rs.close();
			stmt.close();
			con.close();
		
} // end listExamThesis
//--------------------------------------------------------------------------------------- end listExamThesis


//--------------------------------------------------------------------------------------- start viewExamThesis
public void viewExamThesis(String stdID,String date,PrintWriter out)throws Exception {
		ResultSet rs;
		Statement stmt;
		examThesis exThesis = new examThesis();
		// get ข้อมูลนักวิทยานิพนธ์
		
		String sqlCommand = "SELECT * FROM THESIS T, FACULTY F WHERE T.STD#='"+stdID+"' ";
		connectDB(out);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sqlCommand);
		if(rs.next()){		// มีข้อมูล
				if(rs.getInt("THESIS#")!=0)
					exThesis.setThesisID(rs.getInt("THESIS#"));
				if(rs.getString("ACADEMICYEAR")!=null)
					exThesis.setAcademicYear(rs.getString("ACADEMICYEAR"));
				if(rs.getString("TOPIC_TH")!=null)
					exThesis.setTopic_th(thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_TH")));
				if(rs.getString("TOPIC_EN")!=null)
					exThesis.setTopic_en(thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_en")));
				if(rs.getString("APPROVEDATE")!=null)
					exThesis.setApproveDate(thaiLanguage.UnicodeToMS874(rs.getString("APPROVEDATE")));
				if(rs.getString("STD#")!=null)
					exThesis.setStdID(rs.getString("STD#"));
				if(rs.getString("COMPLETE")!=null)
					exThesis.setComplete(rs.getString("COMPLETE"));
		}
		else{				// ไม่มีข้อมูลอยู่
				out.println("<br><font  color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลการสอบวิทยานิพนธ์</font>");
				out.println("<form action=\"../viewexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");
		}
		rs.close();
		// get ข้อมูลนักศึกษาที่ทำ Thesis
		sqlCommand = "SELECT S.STD#, S.TPRE, S.TNAME AS SNAME,S.TFAMILY,F.TNAME AS FNAME , "+
					"D.TNAME AS DNAME, M.TNAME AS MNAME ,C.TNAME AS CNAME "+
					"FROM STUDENT S,FACULTY F,DEPARTMENT D,MAJOR M,COURSE C  "+
					"WHERE S.STD# = '"+exThesis.getStdID()+"' "+  
					"AND ( F.FACT# =( SELECT FACT# FROM STUDENT WHERE STD#='"+exThesis.getStdID()+"' )) "+
					"AND ( D.DEPT#=( SELECT DEPT# FROM STUDENT WHERE STD#='"+exThesis.getStdID()+"')) "+
					"AND ( M.MAJOR#=(SELECT MAJOR# FROM STUDENT WHERE STD#='"+exThesis.getStdID()+"'))"+   
					"AND ( C.CO#=(SELECT CO# FROM STUDENT WHERE STD#='"+exThesis.getStdID()+"'))";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){	// get student from database
					if(rs.getString("STD#")!=null)
						exThesis.setStdID(rs.getString("STD#"));
					if(rs.getString("TPRE")!=null)
						exThesis.setStdTitle( rs.getString("TPRE"));
					if(rs.getString("SNAME")!=null)
						exThesis.setStdName( rs.getString("SNAME"));
					if(rs.getString("TFAMILY")!=null)
						exThesis.setStdSurname( rs.getString("TFAMILY"));
					if(rs.getString("CNAME")!=null)
						exThesis.setStdCourseName(rs.getString("CNAME"));
					if(rs.getString("FNAME")!=null)
						exThesis.setStdFactName(rs.getString("FNAME"));
					if(rs.getString("DNAME")!=null)
						exThesis.setStdDeptName(rs.getString("DNAME"));
					if(rs.getString("MNAME")!=null)
						exThesis.setStdMajorName(rs.getString("MNAME"));			
			}
			rs.close();

			// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก
			sqlCommand =	"SELECT * FROM LECTURER WHERE LECTURER# = "+
										"(SELECT LECTURER# FROM SUPERVISETHESIS WHERE THESIS# ="+exThesis.getThesisID()+" "+
										"AND SUPERVISESTATUS = '"+thaiLanguage.MS874ToUnicode("หลัก")+"' )";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){	
				exThesis.setSuperID(rs.getString("LECTURER#"));
				exThesis.setSuperAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
				exThesis.setSuperName(rs.getString("NAME_TH"));
				exThesis.setSuperSurname(rs.getString("SURNAME_TH"));
			}
			rs.close();

			// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม
			sqlCommand =	"SELECT * FROM LECTURER WHERE LECTURER# IN "+
										"(SELECT LECTURER# FROM SUPERVISETHESIS WHERE THESIS# ="+exThesis.getThesisID()+" "+
										"AND SUPERVISESTATUS = '"+thaiLanguage.MS874ToUnicode("ร่วม")+"' )";
			rs = stmt.executeQuery(sqlCommand);
			int cnt =0;
			while(rs.next()){	
				if(cnt==0){	// อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม คนที่ 1
					exThesis.setJoin1ID(rs.getString("LECTURER#"));
					exThesis.setJoin1AcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
					exThesis.setJoin1Name(rs.getString("NAME_TH"));
					exThesis.setJoin1Surname(rs.getString("SURNAME_TH"));
					cnt++;
				}
				if(cnt==1){	// อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม คนที่ 2
					exThesis.setJoin2ID(rs.getString("LECTURER#"));
					exThesis.setJoin2AcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
					exThesis.setJoin2Name(rs.getString("NAME_TH"));
					exThesis.setJoin2Surname(rs.getString("SURNAME_TH"));					
				}
			}			
			rs.close();

			// แสดงข้อมูลนักศึกษาที่ทำThesis
			out.println("<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\">"+								
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  bgcolor=\"#9999CC\" height=\"30\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ข้อมูลนักศึกษา")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td width=\"190\" height=\"10\"></td>\n"+			// empty				
								"		<td width=\"460\"></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสนักศึกษา</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+exThesis.getStdID()+" &nbsp;</font></td>\n"+								
								"</tr>\n"+		
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>ชื่อ</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\" ><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getStdTitle()+exThesis.getStdName()+"&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getStdSurname())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>ศึกษาอยู่หลักสูตร</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getStdCourseName())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>คณะ</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\"valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getStdFactName())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>ภาควิชา</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getStdDeptName())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>สาขา</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getStdMajorName())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  height=\"10\"></td>\n"+	// empty
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  bgcolor=\"#9999CC\" height=\"30\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ข้อมูลวิทยานิพนธ์")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  height=\"10\"></td>\n"+   // empty
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>รหัสวิทยานิพนธ์</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(""+exThesis.getThesisID())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>หัวข้อวิทยานิพนธ์(ไทย)</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getTopic_th())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>หัวข้อวิทยานิพนธ์(อังกฤษ)</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getTopic_en())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>อาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getSuperAcademicAffiliation()+exThesis.getSuperName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getSuperSurname())+" &nbsp;</font></td>\n"+
								"</tr>\n");
						if(!exThesis.getJoin1ID().equals("")){
							out.println(	"<tr>\n"+
												"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม1</b>")+"&nbsp;</font></td>\n"+
												"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getJoin1AcademicAffiliation()+exThesis.getJoin1Name()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getJoin1Surname())+" &nbsp;</font></td>\n"+
												"</tr>\n");
						}
						if(!exThesis.getJoin2ID().equals("")){
							out.println(	"<tr>\n"+
												"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม2</b>")+"&nbsp;</font></td>\n"+
												"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getJoin2AcademicAffiliation()+exThesis.getJoin2Name()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getJoin2Surname())+" &nbsp;</font></td>\n"+
												"</tr>\n");
						}
			rs.close();
						if(!exThesis.getComplete().equals("YES"))
							exThesis.setComplete("NO");
						out.println(	"<tr>\n"+
											"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>ส่งวิทยานิพนธ์</b>")+"&nbsp;</font></td>\n"+
											"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+exThesis.getComplete()+"</font></td>\n"+
											"</tr>\n");

			// get ข้อมูลผลการสอบวิทยานิพนธ์
			sqlCommand = "SELECT * FROM EXAMTHESIS WHERE THESIS#= (SELECT THESIS# FROM THESIS WHERE STD# ='"+stdID+"')  AND EXAMDATE='"+date+"' ";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){	
					if(rs.getString("RESULT")!=null)
						exThesis.setExamResult(rs.getString("RESULT"));
					if(rs.getString("EXAMDATE")!=null)
						exThesis.setExamDate(rs.getString("EXAMDATE"));
					if(rs.getString("EXAMTIME")!=null)
						exThesis.setExamTime(rs.getString("EXAMTIME"));
					if(rs.getString("EXAMLOCATION")!=null)
						exThesis.setExamLocation(rs.getString("EXAMLOCATION"));
					if(rs.getString("EXAMLECTURER1")!=null)
						exThesis.setExamLecturer1ID(rs.getString("EXAMLECTURER1"));
					if(rs.getString("EXAMLECTURER2")!=null)
						exThesis.setExamLecturer2ID(rs.getString("EXAMLECTURER2"));
					if(rs.getString("EXAMLECTURER3")!=null)
						exThesis.setExamLecturer3ID(rs.getString("EXAMLECTURER3"));
					if(rs.getString("EXAMLECTURER4")!=null)
						exThesis.setExamLecturer4ID(rs.getString("EXAMLECTURER4"));
					if(rs.getString("EXAMLECTURER5")!=null)
						exThesis.setExamLecturer5ID(rs.getString("EXAMLECTURER5"));
					if(rs.getString("EXAMLECTURER6")!=null)
						exThesis.setExamLecturer6ID(rs.getString("EXAMLECTURER6"));
			}
			rs.close();
			
			// get ข้อมูลของอาจารย์ผู้คุมสอบ คนที่ 1
			sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+exThesis.getExamLecturer1ID()+"' ";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){
					exThesis.setExamLAcademicAffiliation1(rs.getString("ACADEMICAFFILIATION"));
					exThesis.setExamLName1(rs.getString("NAME_TH"));
					exThesis.setExamLSurname1(rs.getString("SURNAME_TH"));
			}
			rs.close();
			// get ข้อมูลของอาจารย์ผู้คุมสอบ คนที่ 2
			sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+exThesis.getExamLecturer2ID()+"' ";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){
					exThesis.setExamLAcademicAffiliation2(rs.getString("ACADEMICAFFILIATION"));
					exThesis.setExamLName2(rs.getString("NAME_TH"));
					exThesis.setExamLSurname2(rs.getString("SURNAME_TH"));
			}
			rs.close();
			// get ข้อมูลของอาจารย์ผู้คุมสอบ คนที่ 3
			sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+exThesis.getExamLecturer3ID()+"' ";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){
					exThesis.setExamLAcademicAffiliation3(rs.getString("ACADEMICAFFILIATION"));
					exThesis.setExamLName3(rs.getString("NAME_TH"));
					exThesis.setExamLSurname3(rs.getString("SURNAME_TH"));
			}
			rs.close();
			// get ข้อมูลของอาจารย์ผู้คุมสอบ คนที่ 4
			sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+exThesis.getExamLecturer4ID()+"' ";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){
					exThesis.setExamLAcademicAffiliation4(rs.getString("ACADEMICAFFILIATION"));
					exThesis.setExamLName4(rs.getString("NAME_TH"));
					exThesis.setExamLSurname4(rs.getString("SURNAME_TH"));
			}
			rs.close();
			// get ข้อมูลของอาจารย์ผู้คุมสอบ คนที่ 5
			sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+exThesis.getExamLecturer5ID()+"' ";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){
					exThesis.setExamLAcademicAffiliation5(rs.getString("ACADEMICAFFILIATION"));
					exThesis.setExamLName5(rs.getString("NAME_TH"));
					exThesis.setExamLSurname5(rs.getString("SURNAME_TH"));
			}
			rs.close();
			// get ข้อมูลของอาจารย์ผู้คุมสอบ คนที่ 6
			sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+exThesis.getExamLecturer6ID()+"' ";
			rs = stmt.executeQuery(sqlCommand);
			if(rs.next()){
					exThesis.setExamLAcademicAffiliation6(rs.getString("ACADEMICAFFILIATION"));
					exThesis.setExamLName6(rs.getString("NAME_TH"));
					exThesis.setExamLSurname6(rs.getString("SURNAME_TH"));
			}
			rs.close();

			// แสดงข้อมูลผลการสอบวิทยานิพนธ์
			out.println(	"<tr>\n"+
								"		<td align=\"left\" colspan=\"2\"  height=\"10\"></td>\n"+		// empty
								"</tr>\n"+ 
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  bgcolor=\"#9999CC\" height=\"30\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ผลการสอบวิทยานิพนธ์")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  height=\"10\"></td>\n"+  // empty
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>วันที่สอบ</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(myDate.getThaiDate(exThesis.getExamDate()))+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>เวลาที่สอบ</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+exThesis.getExamTime()+" &nbsp;"+thaiLanguage.UnicodeToMS874("น.")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>ระดับคะแนนที่ได้</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+exThesis.getExamResult()+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"> "+thaiLanguage.UnicodeToMS874("<b>สถานที่สอบ</b>")+"&nbsp;</font></td>\n"+
								"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getExamLocation())+" &nbsp;</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  height=\"10\"></td>\n"+		// empty
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  bgcolor=\"#9999CC\" height=\"30\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("คณะกรรมการสอบวิทยานิพนธ์")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  height=\"10\"></td>\n"+	// empty
								"</tr>\n");
			if(!exThesis.getExamLecturer1ID().equals("")){
						out.println("<tr>\n"+
						"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>1.</b>&nbsp;</font></td>\n"+
						"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getExamLAcademicAffiliation1()+exThesis.getExamLName1()+"&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname1())+" &nbsp;</font></td>\n"+
						"</tr>\n");
			}
			if(!exThesis.getExamLecturer2ID().equals("")){
						out.println("<tr>\n"+
						"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>2.</b>&nbsp;</font></td>\n"+
						"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getExamLAcademicAffiliation2()+exThesis.getExamLName2()+"&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname2())+" &nbsp;</font></td>\n"+
						"</tr>\n");
			}
			if(!exThesis.getExamLecturer3ID().equals("")){
						out.println("<tr>\n"+
						"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>3.</b>&nbsp;</font></td>\n"+
						"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getExamLAcademicAffiliation3()+exThesis.getExamLName3()+"&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname3())+" &nbsp;</font></td>\n"+
						"</tr>\n");
			}
			if(!exThesis.getExamLecturer4ID().equals("")){
						out.println("<tr>\n"+
						"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>4.</b>&nbsp;</font></td>\n"+
						"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getExamLAcademicAffiliation4()+exThesis.getExamLName4()+"&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname4())+" &nbsp;</font></td>\n"+
						"</tr>\n");
			}
			if(!exThesis.getExamLecturer5ID().equals("")){
						out.println("<tr>\n"+
						"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>5.</b>&nbsp;</font></td>\n"+
						"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getExamLAcademicAffiliation5()+exThesis.getExamLName5()+"&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname5())+" &nbsp;</font></td>\n"+
						"</tr>\n");
			}
			if(!exThesis.getExamLecturer6ID().equals("")){
						out.println("<tr>\n"+
						"		<td align=\"right\"  valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>6.</b>&nbsp;</font></td>\n"+
						"		<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(exThesis.getExamLAcademicAffiliation6()+exThesis.getExamLName6()+"&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname6())+" &nbsp;</font></td>\n"+
						"</tr>\n");
			}
			out.println(	"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\" height=\"10\"></td>\n"+	// end line
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" colspan=\"2\"  bgcolor=\"#9999CC\" height=\"3\"></td>\n"+	// end line
								"</tr>\n"+
								"</table>");
			out.println("<br><form action=\"examThesisWork\" method=\"post\" name=\"form1\" ><br>\n"+
									"<input type=\"hidden\" name=\"stdID\" value=\""+exThesis.getStdID()+"\">\n"+
									"<input type=\"hidden\" name=\"date\" value=\""+exThesis.getExamDate()+"\">\n"+									
									"<input type=\"submit\" name=\"deleteExamThesis\" value=\"    "+thaiLanguage.UnicodeToMS874("&nbsp;ลบข้อมูล&nbsp;")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\" onClick=\"return confirmDel()\">\n");
			if(!exThesis.getExamResult().equals("F") && !exThesis.getExamResult().equals("f")){
									out.println( "<input type=\"hidden\" name=\"sendThesisID\" value=\""+exThesis.getThesisID()+"\">\n"+
														"&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"submit\" name=\"report\" value=\"  "+thaiLanguage.UnicodeToMS874("ออกใบรับรอง")+"  \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
														"&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"submit\" name=\"thesisComplete\" value=\""+thaiLanguage.UnicodeToMS874("ส่งวิทยานิพนธ์")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n");
			}									
			out.println("&nbsp;&nbsp;&nbsp;&nbsp;<input type=\"submit\" name=\"cancelView\" value=\"    "+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+						
									"</form>\n");			
			rs.close();			
			stmt.close();
			con.close();
} /// end viewExamThesis
//--------------------------------------------------------------------------------------- end viewExamThesis

//--------------------------------------------------------------------------------------- start getInfo From webpage
	//return sqlCommand
	public String getInfo(HttpServletRequest request,PrintWriter out)throws Exception{
			ResultSet rs;
			Statement stmt;
			String day="";
			String month="";
			String year="";
			String columnLecturer="";
			String valueLecturer="";
			String sqlCommand="";
			examthesis.setStdID(request.getParameter("stdID"));
			examthesis.setThesisID(Integer.parseInt(request.getParameter("thesisID")));
			if(!request.getParameter("examyear").equals("")){
				day=request.getParameter("examday");
				month=request.getParameter("exammonth");
				year=request.getParameter("examyear");
				examthesis.setExamDate(day+"/"+month+"/"+year);
			}
			else{
				examthesis.setExamDate("00/00/0000");
			}
			if(request.getParameter("time")!=null && request.getParameter("minute")!=null){
				examthesis.setExamTime(request.getParameter("time")+"."+request.getParameter("minute"));				
			}
			examthesis.setExamResult(request.getParameter("examPoint"));
			examthesis.setExamLocation(thaiLanguage.MS874ToUnicode(request.getParameter("examlocation")));
			if(!request.getParameter("examlecturerID1").equals("")){
				examthesis.setExamLecturer1ID(request.getParameter("examlecturerID1"));
				columnLecturer="EXAMLECTURER1";
				valueLecturer=" '"+examthesis.getExamLecturer1ID()+"' ";
			}
			if(!request.getParameter("examlecturerID2").equals("")){
				examthesis.setExamLecturer2ID(request.getParameter("examlecturerID2"));
				columnLecturer=columnLecturer+",EXAMLECTURER2";
				valueLecturer=valueLecturer+", '"+examthesis.getExamLecturer2ID()+"' ";
			}
			if(!request.getParameter("examlecturerID3").equals("")){
				examthesis.setExamLecturer3ID(request.getParameter("examlecturerID3"));
				columnLecturer=columnLecturer+",EXAMLECTURER3";
				valueLecturer=valueLecturer+", '"+examthesis.getExamLecturer3ID()+"' ";
			}
			if(!request.getParameter("examlecturerID4").equals("")){
				examthesis.setExamLecturer4ID(request.getParameter("examlecturerID4"));
				columnLecturer=columnLecturer+",EXAMLECTURER4";
				valueLecturer=valueLecturer+", '"+examthesis.getExamLecturer4ID()+"' ";
			}
			if(!request.getParameter("examlecturerID5").equals("")){
				examthesis.setExamLecturer5ID(request.getParameter("examlecturerID5"));
				columnLecturer=columnLecturer+",EXAMLECTURER5";
				valueLecturer=valueLecturer+", '"+examthesis.getExamLecturer5ID()+"' ";
			}
			if(!request.getParameter("examlecturerID6").equals("")){
				examthesis.setExamLecturer6ID(request.getParameter("examlecturerID6"));
				columnLecturer=columnLecturer+",EXAMLECTURER6";
				valueLecturer=valueLecturer+", '"+examthesis.getExamLecturer6ID()+"' ";
			}
			sqlCommand=	"INSERT INTO EXAMTHESIS( THESIS#,EXAMDATE,EXAMTIME,RESULT,EXAMLOCATION,"+columnLecturer+") "+
			" VALUES ("+examthesis.getThesisID()+" ,'"+examthesis.getExamDate()+"','"+examthesis.getExamTime()+"', '"+examthesis.getExamResult()+"','"+examthesis.getExamLocation()+"', "+valueLecturer+")";
			return sqlCommand;				
	}
//--------------------------------------------------------------------------------------- end getInfo From webpage
//--------------------------------------------------------------------------------------- start addExamThesis
	public void addExamThesis(String sqlCommand,PrintWriter out)throws Exception{
		connectDB(out);		
		PreparedStatement pstmt;
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();
		closeDB();	
	}
//--------------------------------------------------------------------------------------- end addExamThesis

//--------------------------------------------------------------------------------------- start addExamThesis
	public void deleteExamThesis(String sqlCommand,PrintWriter out)throws Exception{
		connectDB(out);		
		PreparedStatement pstmt;
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();
		closeDB();	
	}
//--------------------------------------------------------------------------------------- end addExamThesis

//--------------------------------------------------------------------------------------- start addExamThesis
	public void sendThesis(String thesisID,PrintWriter out)throws Exception{
		connectDB(out);		
		PreparedStatement pstmt;
		String sqlCommand = "UPDATE THESIS SET COMPLETE = 'YES' WHERE THESIS#="+thesisID+" ";
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();
		closeDB();
		out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >> ส่ง วิทยานิพนธ์ ","ส่งวิทยานิพนธ์"));
		out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">บันทึกการส่งวิทยานิพนธ์เรียบร้อยแล้ว</font>"));
		out.println(	"<br><form action=\"../viewexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
							"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
							"</form>\n");
		out.println(htmlTemplate.getEnd());
	}
//--------------------------------------------------------------------------------------- end addExamThesis


	//  ###########    doPost       #################
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();	

		if(request.getParameter("getThesisInfo") != null){		// get ข้อมูลวิทยานิพนธ์
			String stdID="";
			String thesisID="";
			if(request.getParameter("stdID") != null)
					stdID=request.getParameter("stdID");
			// ตรวจสอบข้อมูลวิทยานิพนธ์ว่ามีอยู่หรือไม่
			String sqlCommand = "SELECT * FROM THESIS WHERE STD#='"+stdID+"' ";
			try{
					if(!isExist(sqlCommand,out)){	// ไม่มี้อมูลวิยานิพนธ์อยู่
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >> <a href=\"../addjoinsupervisor.jsp\" class=\"pathlink2\">บันทึกข้อมูลการสอบ วิทยานิพนธ์</a>  >> เกิดข้อผิดพลาด","เกิดข้อผิดพลาด"));
						out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบหัวข้อวิทยานิพนธ์ ตามที่ระบุรหัสวิทยานิพนธ์</font>"));
						out.println("<form action=\"../addexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());
						return;
					} // end if(isExist(sqlCommand,out))		
					else{
						sqlCommand =  "SELECT * FROM THESIS WHERE STD#='"+stdID+ "' ";
						thesisID=""+getThesisID(sqlCommand,out);
					}
					session.setAttribute("getThesisInfo","getThesisInfo");
					session.setAttribute("thesisID",thesisID);
					response.sendRedirect("../addexamthesis.jsp");
			}
			catch (SQLException e){out.println("getThesisInfo SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("getThesisInfo Exception : "+e.getMessage());return;}	
		}	// end request.getParameter("getThesisInfo")

		if(request.getParameter("getExamLecturer1") != null){		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์  1
			String lecturerID="";
			if(request.getParameter("examlecturerID1") != null)
				lecturerID=request.getParameter("examlecturerID1");
			try{
					String sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+lecturerID+"' ";

					if(!isExist(sqlCommand,out)){	// ไม่มีข้อมูลอาจารย์อยู่
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >> <a href=\"../addexamthesis.jsp\" class=\"pathlink2\">บันทึกข้อมูลการสอบ วิทยานิพนธ์</a>  >> เกิดข้อผิดพลาด","เกิดข้อผิดพลาด"));
						out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่มีข้อมูลอาจารย์ ตามที่ระบุรหัสอาจารย์</font>"));
						out.println("<form action=\"../addexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());
						session.setAttribute("notFound","notFound");
						return;
					}

					session.setAttribute("getExamLecturer1","getExamLecturer1");
					session.setAttribute("lecturerID",lecturerID);
					response.sendRedirect("../addexamthesis.jsp");
			}
			catch (SQLException e){out.println("getExamLecturer1 SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("getExamLecturer1 Exception : "+e.getMessage());return;}	

		} // end request.getParameter("getExamLecturer1")

		if(request.getParameter("getExamLecturer2") != null){		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์  2
			String lecturerID="";
			if(request.getParameter("examlecturerID2") != null)
				lecturerID=request.getParameter("examlecturerID2");
			try{
					String sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+lecturerID+"' ";

					if(!isExist(sqlCommand,out)){	// ไม่มีข้อมูลอาจารย์อยู่
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >> <a href=\"../addexamthesis.jsp\" class=\"pathlink2\">บันทึกข้อมูลการสอบ วิทยานิพนธ์</a>  >> เกิดข้อผิดพลาด","เกิดข้อผิดพลาด"));
						out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่มีข้อมูลอาจารย์ ตามที่ระบุรหัสอาจารย์</font>"));
						out.println("<form action=\"../addexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());
						session.setAttribute("notFound","notFound");
						return;
					}

					session.setAttribute("getExamLecturer2","getExamLecturer2");
					session.setAttribute("lecturerID",lecturerID);
					response.sendRedirect("../addexamthesis.jsp");
			}
			catch (SQLException e){out.println("getExamLecturer2 SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("getExamLecturer2 Exception : "+e.getMessage());return;}	

		} // end request.getParameter("getExamLecturer2")

		if(request.getParameter("getExamLecturer3") != null){		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์  3
			String lecturerID="";
			if(request.getParameter("examlecturerID3") != null)
				lecturerID=request.getParameter("examlecturerID3");
			try{
					String sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+lecturerID+"' ";

					if(!isExist(sqlCommand,out)){	// ไม่มีข้อมูลอาจารย์อยู่
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >> <a href=\"../addexamthesis.jsp\" class=\"pathlink2\">บันทึกข้อมูลการสอบ วิทยานิพนธ์</a>  >> เกิดข้อผิดพลาด","เกิดข้อผิดพลาด"));
						out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่มีข้อมูลอาจารย์ ตามที่ระบุรหัสอาจารย์</font>"));
						out.println("<form action=\"../addexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());
						session.setAttribute("notFound","notFound");
						return;
					}

					session.setAttribute("getExamLecturer3","getExamLecturer3");
					session.setAttribute("lecturerID",lecturerID);
					response.sendRedirect("../addexamthesis.jsp");
			}
			catch (SQLException e){out.println("getExamLecturer3 SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("getExamLecturer3 Exception : "+e.getMessage());return;}	

		} // end request.getParameter("getExamLecturer3")

		if(request.getParameter("getExamLecturer4") != null){		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์  4
			String lecturerID="";
			if(request.getParameter("examlecturerID4") != null)
				lecturerID=request.getParameter("examlecturerID4");
			try{
					String sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+lecturerID+"' ";

					if(!isExist(sqlCommand,out)){	// ไม่มีข้อมูลอาจารย์อยู่
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >> <a href=\"../addexamthesis.jsp\" class=\"pathlink2\">บันทึกข้อมูลการสอบ วิทยานิพนธ์</a>  >> เกิดข้อผิดพลาด","เกิดข้อผิดพลาด"));
						out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่มีข้อมูลอาจารย์ ตามที่ระบุรหัสอาจารย์</font>"));
						out.println("<form action=\"../addexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());
						session.setAttribute("notFound","notFound");
						return;
					}

					session.setAttribute("getExamLecturer4","getExamLecturer4");
					session.setAttribute("lecturerID",lecturerID);
					response.sendRedirect("../addexamthesis.jsp");
			}
			catch (SQLException e){out.println("getExamLecturer4 SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("getExamLecturer4 Exception : "+e.getMessage());return;}	

		} // end request.getParameter("getExamLecturer4")

		if(request.getParameter("getExamLecturer5") != null){		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์  5
			String lecturerID="";
			if(request.getParameter("examlecturerID5") != null)
				lecturerID=request.getParameter("examlecturerID5");
			try{
					String sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+lecturerID+"' ";

					if(!isExist(sqlCommand,out)){	// ไม่มีข้อมูลอาจารย์อยู่
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink5\">Home</a> >> วิทยานิพนธ์ >> <a href=\"../addexamthesis.jsp\" class=\"pathlink2\">บันทึกข้อมูลการสอบ วิทยานิพนธ์</a>  >> เกิดข้อผิดพลาด","เกิดข้อผิดพลาด"));
						out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่มีข้อมูลอาจารย์ ตามที่ระบุรหัสอาจารย์</font>"));
						out.println("<form action=\"../addexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());
						session.setAttribute("notFound","notFound");
						return;
					}

					session.setAttribute("getExamLecturer5","getExamLecturer5");
					session.setAttribute("lecturerID",lecturerID);
					response.sendRedirect("../addexamthesis.jsp");
			}
			catch (SQLException e){out.println("getExamLecturer5 SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("getExamLecturer5 Exception : "+e.getMessage());return;}	

		} // end request.getParameter("getExamLecturer5")

		if(request.getParameter("getExamLecturer6") != null){		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์  6
			String lecturerID="";
			if(request.getParameter("examlecturerID6") != null)
				lecturerID=request.getParameter("examlecturerID6");
			try{
					String sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+lecturerID+"' ";

					if(!isExist(sqlCommand,out)){	// ไม่มีข้อมูลอาจารย์อยู่
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >> <a href=\"../addexamthesis.jsp\" class=\"pathlink2\">บันทึกข้อมูลการสอบ วิทยานิพนธ์</a>  >> เกิดข้อผิดพลาด","เกิดข้อผิดพลาด"));
						out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่มีข้อมูลอาจารย์ ตามที่ระบุรหัสอาจารย์</font>"));
						out.println("<form action=\"../addexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());
						session.setAttribute("notFound","notFound");
						return;
					}

					session.setAttribute("getExamLecturer6","getExamLecturer6");
					session.setAttribute("lecturerID",lecturerID);
					response.sendRedirect("../addexamthesis.jsp");
			}
			catch (SQLException e){out.println("getExamLecturer6 SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("getExamLecturer6 Exception : "+e.getMessage());return;}	

		} // end request.getParameter("getExamLecturer6")

		if(request.getParameter("cancelExamThesis") != null){		// ยกเลิก
			response.sendRedirect("../addexamthesis.jsp");

		} //  end request.getParameter("cancelExamThesis")

		if(request.getParameter("addExamThesis") != null){		// เพิ่มผลการสอบวิทยานิพนธ์
			try{
				// ตรวจสอบข้อมูลว่ามีอยู่แล้วหรือเปล่า
				
				String sqlCommand = getInfo(request,out);

				String sql = "SELECT * FROM EXAMTHESIS WHERE THESIS#="+examthesis.getThesisID()+" "+
									"AND EXAMDATE = '"+examthesis.getExamDate()+"' ";
				if(isExist(sql,out)){
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;<a href=\"../addexamthesis.jsp\" class=\"pathlink2\">บัณทึกผลการสอบวิทยานิพนธ์</a>","เกิดข้อผิดพลาด"));
					out.println(thaiLanguage.UnicodeToMS874("<font color=\"#FF0000\" style=\"font:16px\"><br>ไม่สามารถเพิ่มผลการสอบได้<br> เนื่องจากผลการสอบในวันที่ระบุมีการบันทึกไว้แล้ว</font>"));
					out.println("<form action=\"../addexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
					out.println(htmlTemplate.getEnd());
					return;
				}


				addExamThesis(sqlCommand,out);
				out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;<a href=\"../addexamthesis.jsp\" class=\"pathlink2\">บัณทึกผลการสอบวิทยานิพนธ์</a>","บัณทึกผลการสอบวิทยานิพนธ์"));
				out.println(thaiLanguage.UnicodeToMS874("<font class=\"insfont\" style=\"font:16px\"><br>เพิ่มข้อมูลผลการสอบวิทยานิพนธ์เรียบร้อยแล้ว</font>"));
				out.println("<form action=\"../addexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
				out.println(htmlTemplate.getEnd());

			}catch(NumberFormatException ne){out.println("NumberFormatException in request.getParameter\"addExamThesis\"): "+ne.getMessage());return;}
			 catch(SQLException se){out.println("SQLException in request.getParameter\"addExamThesis\"): "+se.getMessage());return;}
			 catch(Exception e){out.println("Exception in request.getParameter(\"addExamThesis\") : "+e.getMessage());return;}
		} // end request.getParameter("addExamThesis")

		if(request.getParameter("viewExamthesis") != null){		// ดูผลการสอบวิทยานิพนธ์ แสดงเป็น list
			String stdID ="";
			stdID = request.getParameter("stdID");
			try{
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;<a href=\"../viewexamthesis.jsp\" class=\"pathlink2\">ดูผลการสอบวิทยานิพนธ์</a>","ดูผลการสอบวิทยานิพนธ์"));
					listExamThesis(stdID,out);
					out.println(htmlTemplate.getEnd());
			}
			catch(SQLException e){out.println("SQLException in servlet request.getParameter(viewExamthesis) : "+e.getMessage());return;}
			catch(Exception e){out.println("Exception in servlet request.getParameter(viewExamthesis) : "+e.getMessage());return;}
		
		} //  end request.getParameter("viewExamthesis")
		
		if(request.getParameter("viewExamthesisFromThesisID") != null){		// ดูผลการสอบวิทยานิพนธ์ แสดงเป็น list
			String thesisID ="";
			String stdID="";
			ResultSet rs;
			Statement stmt;
			thesisID = request.getParameter("thesisID");
			try{
					// ตรวจสอบว่ามี thesis อยู่หรือไม่
					String sqlCommand = "SELECT STD# FROM THESIS WHERE THESIS# ="+thesisID+"";
					connectDB(out);
					stmt = con.createStatement();
					rs=stmt.executeQuery(sqlCommand);
					if(rs.next() ){
							if(rs.getString("STD#") != null )
								stdID = rs.getString("STD#");
					}					
					else{	 // ไม่มี
							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >> ดูผลการสอบวิทยานิพนธ์","ผลการสอบวิทยานิพนธ์"));
							out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูล</font>"));
							out.println("<form action=\"../viewexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
											   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
     										   "</form>\n");
							return;
					}			
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;<a href=\"../viewexamthesis.jsp\" class=\"pathlink2\">ดูผลการสอบวิทยานิพนธ์</a>","ดูผลการสอบวิทยานิพนธ์"));
					listExamThesis(stdID,out);
					out.println(htmlTemplate.getEnd());
			}
			catch(SQLException e){out.println("SQLException in servlet request.getParameter(viewExamthesis) : "+e.getMessage());return;}
			catch(Exception e){out.println("Exception in servlet request.getParameter(viewExamthesis) : "+e.getMessage());return;}
		}// end request.getParameter("viewExamthesisFromThesisID")

		if(request.getParameter("cancelView") != null){					// ยกเลิกดูผลการสอบวิทยานิพนธ์
			response.sendRedirect("../viewexamthesis.jsp");
		}// end request.getParameter("cancelView")

		if(request.getParameter("deleteExamThesis") != null){		// ลบผลการสอบวิทยานิพนธ์
			try{
					String stdID = request.getParameter("stdID");
					String date = request.getParameter("date");
					String sqlCommand="DELETE FROM EXAMTHESIS WHERE THESIS#=(SELECT THESIS# FROM THESIS WHERE STD#='"+stdID+"' ) AND EXAMDATE = '"+date+"' ";
					deleteExamThesis(sqlCommand,out);
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >> ลบข้อมูลผลการสอบวิทยานิพนธ์","ลบข้อมูลผลการสอบวิทยานิพนธ์"));
					out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">ข้อมูลผลการสอบวิทยานิพนธ์ได้ถูกลบแล้ว</font>"));
					out.println("<form action=\"../viewexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
									   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
     								   "</form>\n");
			}
			catch(SQLException e){out.println("SQLException in servlet request.getParameter(deleteExamThesis) : "+e.getMessage());return;}
			catch(Exception e){out.println("Exception in servlet request.getParameter(deleteExamThesis) : "+e.getMessage());return;}
			return;
		
		}// end request.getParameter("deleteExamThesis")

		if(request.getParameter("report") != null){								// print ใบรับรองผลการสอบวิทยานิพนธ์
			String stdID = request.getParameter("stdID");
			String date = request.getParameter("date");
			session.setAttribute("stdID",stdID);
			session.setAttribute("date",date);
			response.sendRedirect("../examthesisform.jsp");
			
		}// end request.getParameter("report")
		
		if(request.getParameter("thesisComplete") != null){		// บันทึกส่งวิทยานิพนธ์เรียบร้อย
			String thesisID= request.getParameter("sendThesisID");
			try{
					sendThesis(thesisID,out);
			}
			catch(SQLException e){out.println("SQLException in servlet request.getParameter(deleteExamThesis) : "+e.getMessage());return;}
			catch(Exception e){out.println("Exception in servlet request.getParameter(deleteExamThesis) : "+e.getMessage());return;}


		} //  end if(request.getParameter("thesisComplete")

	}	// end doPost
		
		
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		// get database server
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		String date = "";
		String stdID="";
		if(session.getAttribute("login")==null){
			response.sendRedirect("loginfail.jsp");
		}
		if(request.getParameter("stdID")!=null && request.getParameter("date")!=null){
				stdID=request.getParameter("stdID");
				date = request.getParameter("date");
		}
		try{
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;<a href=\"../viewexamthesis.jsp\" class=\"pathlink2\">ดูผลการสอบวิทยานิพนธ์</a>","ดูผลการสอบวิทยานิพนธ์"));
					viewExamThesis(stdID,date,out);
					out.println(htmlTemplate.getEnd());
			}
			catch(SQLException e){out.println("SQLException in servlet request.getParameter(viewExamthesis) : "+e.getMessage());return;}
			catch(Exception e){out.println("Exception in servlet request.getParameter(viewExamthesis) : "+e.getMessage());return;}
		

	} // end doGet
}	// end class examThesisWork