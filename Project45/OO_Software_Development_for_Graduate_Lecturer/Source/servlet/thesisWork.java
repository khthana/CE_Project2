import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import lecturer.Lecturer;
import thesis.Thesis;
import thesis.superviseThesis;
import student.Student;
import myutil.thaiLanguage;
import myutil.htmlTemplate;
import myutil.myDate;
import myutil.server;

public class thesisWork extends HttpServlet{
	
	private Lecturer myLecturer = new Lecturer();
	private String url = "";
	private String user = "";
	private String passwd = "";
	private Connection con;
	private Thesis thesis = new Thesis();
//--------------------------------------------------------------------------------------- start connectDB

	public void connectDB(PrintWriter out){
		try{			
			Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
			//out.println("class for name ok");			//test
			con = DriverManager.getConnection(url,user,passwd);
			//out.println("con Driver ok");			//test
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

//--------------------------------------------------------------------------------------- start getThesisData
	public void getThesisData(HttpServletRequest request,PrintWriter out)throws Exception{
		String approvedate = "";
		String approvemonth="";
		String approveyear="";
		if(request.getParameter("academicyear")!=null)
			thesis.setAcademicYear(request.getParameter("academicyear"));
		if(request.getParameter("topic_th")!=null)
			thesis.setTopic_th(request.getParameter("topic_th"));
		if(request.getParameter("topic_en")!=null)
			thesis.setTopic_en(request.getParameter("topic_en"));
		if(request.getParameter("faculty")!=null)
			thesis.setFactID(request.getParameter("faculty"));
		if(request.getParameter("approveyear")!=null && !request.getParameter("approveyear").equals("")){
			approvedate=request.getParameter("approvedate");
			approvemonth=request.getParameter("approvemonth");
			approveyear=request.getParameter("approveyear");
			thesis.setApproveDate(approvedate+"/"+approvemonth+"/"+approveyear);
		}
		else{
			thesis.setApproveDate("00/00/0000");
		}
		if(request.getParameter("stdID")!=null)
			thesis.setStdID(request.getParameter("stdID"));
		if(request.getParameter("superID")!=null)
			thesis.setSuperID(request.getParameter("superID"));
		if(request.getParameter("join1ID")!=null)
			thesis.setJoin1ID(request.getParameter("join1ID"));
		if(request.getParameter("join2ID")!=null)
			thesis.setJoin2ID(request.getParameter("join2ID"));	
	}// end getThesisTopic
//--------------------------------------------------------------------------------------- start getThesisData

//--------------------------------------------------------------------------------------- start printData
	//   --- for test data
	public void printData(PrintWriter out){
		out.println(thaiLanguage.UnicodeToMS874("thesisID : "+thesis.getThesisID())+"\n");
		out.println(thaiLanguage.UnicodeToMS874("academic year : "+thesis.getAcademicYear())+"\n");
		out.println(thaiLanguage.UnicodeToMS874("thesis topic th : "+thesis.getTopic_th())+"\n");
		out.println(thaiLanguage.UnicodeToMS874("thesis topic en : "+thesis.getTopic_en())+"\n");
		out.println(thaiLanguage.UnicodeToMS874("factID : "+thesis.getFactID())+"\n");		
		out.println(thaiLanguage.UnicodeToMS874("approve date : "+thesis.getApproveDate())+"\n");
		out.println(thaiLanguage.UnicodeToMS874("stdID : "+thesis.getStdID())+"\n");
		out.println(thaiLanguage.UnicodeToMS874("superID : "+thesis.getSuperID())+"\n");
		out.println(thaiLanguage.UnicodeToMS874("join1ID : "+thesis.getJoin1ID())+"\n");
		out.println(thaiLanguage.UnicodeToMS874("join2ID : "+thesis.getJoin2ID())+"\n");
		
	} // end printData
//--------------------------------------------------------------------------------------- end printData

//--------------------------------------------------------------------------------------- start addThesis
	public void addThesis(HttpServletRequest request,PrintWriter out)throws Exception{
		PreparedStatement pstmt;
		Statement stmt;
		ResultSet rs;
		// insert Thesis
		String sqlCommand = "INSERT INTO THESIS(ACADEMICYEAR,TOPIC_TH,TOPIC_EN,APPROVEDATE,FACT#,STD#) "+
											   "VALUES('"+thaiLanguage.MS874ToUnicode(thesis.getAcademicYear())+"','"+thaiLanguage.MS874ToUnicode(thesis.getTopic_th())+"' "+
											   ",'"+thaiLanguage.MS874ToUnicode(thesis.getTopic_en())+"','"+thaiLanguage.MS874ToUnicode(thesis.getApproveDate())+"' "+
											   ",'"+thesis.getFactID()+"','"+thesis.getStdID()+"')";

		connectDB(out);		
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		
		// get ThesisID 
		sqlCommand = "SELECT THESIS# FROM THESIS WHERE STD# ='"+thesis.getStdID()+"' "+
									"AND FACT#='"+thesis.getFactID()+"' ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sqlCommand);
		if(rs.next()){
			thesis.setThesisID(rs.getInt("THESIS#"));
		}
		stmt.close();
		rs.close();

		// insert to SUPERVISETHESIS TABLE
		if(!thesis.getSuperID().equals("")){
			sqlCommand = "INSERT INTO SUPERVISETHESIS(THESIS#,LECTURER#,SUPERVISESTATUS) "+
										"VALUES("+thesis.getThesisID()+",'"+thesis.getSuperID()+"','"+thaiLanguage.MS874ToUnicode("หลัก")+"')";
			pstmt = con.prepareStatement(sqlCommand);
			pstmt.executeUpdate();		
		}
		if(!thesis.getJoin1ID().equals("")){
			sqlCommand = "INSERT INTO SUPERVISETHESIS(THESIS#,LECTURER#,SUPERVISESTATUS) "+
										"VALUES("+thesis.getThesisID()+",'"+thesis.getJoin1ID()+"','"+thaiLanguage.MS874ToUnicode("ร่วม")+"')";
			pstmt = con.prepareStatement(sqlCommand);
			pstmt.executeUpdate();
		}
		if(!thesis.getJoin2ID().equals("")){
			sqlCommand = "INSERT INTO SUPERVISETHESIS(THESIS#,LECTURER#,SUPERVISESTATUS) "+
										"VALUES("+thesis.getThesisID()+",'"+thesis.getJoin2ID()+"','"+thaiLanguage.MS874ToUnicode("ร่วม")+"')";
			pstmt = con.prepareStatement(sqlCommand);
			pstmt.executeUpdate();		
		}
		pstmt.close();
		closeDB();
	} // end addThesis
//--------------------------------------------------------------------------------------- end addThesis

//--------------------------------------------------------------------------------------- start viewThesisInfo
public boolean viewThesisInfo(String sqlCommand,PrintWriter out)throws Exception{  // แสดงข้อมูล Thesis แต่ละอัน
			Statement stmt;
			ResultSet rs;
			Thesis thesis = new Thesis();
			Lecturer[] lecturer={new Lecturer(),new Lecturer(),new Lecturer()};
			superviseThesis[] superThesis={new superviseThesis(),new superviseThesis(),new superviseThesis()};
			Student std = new Student();			
			String TfactName="";
			String factName="";
			String deptName="";
			String majorName="";
			String courseName="";
			String[] LFactName={"","",""};
			String[] LDeptName={"","",""};
			String[] LMajorName={"","",""};
			String sql="";


			connectDB(out);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sqlCommand);			
			if(rs.next()){
				// get Thesis from database
				if(rs.getInt("THESIS#")!=0)
					thesis.setThesisID(rs.getInt("THESIS#"));
				if(rs.getString("ACADEMICYEAR")!=null)
					thesis.setAcademicYear(thaiLanguage.UnicodeToMS874(rs.getString("ACADEMICYEAR")));
				if(rs.getString("TOPIC_TH")!=null)
					thesis.setTopic_th(thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_TH")));
				if(rs.getString("TOPIC_EN")!=null)
					thesis.setTopic_en(thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_en")));
				if(rs.getString("APPROVEDATE")!=null)
					thesis.setApproveDate(thaiLanguage.UnicodeToMS874(rs.getString("APPROVEDATE")));
				if(rs.getString("FACT#")!=null)
					thesis.setFactID(rs.getString("FACT#"));
				if(rs.getString("STD#")!=null)
					thesis.setStdID(rs.getString("STD#"));
				if(rs.getString("TNAME")!=null)
					TfactName=thaiLanguage.UnicodeToMS874(rs.getString("TNAME"));
			}
			else{	// ไม่พบข้อมูลวิทยานิพนธ์
					out.println( thaiLanguage.UnicodeToMS874("<br><br><font style=\"font:16px\" color=\"#FF0000\">ไม่พบข้อมูลวิทยานิพนธ์</font><br>\n"+
											"<form action=\"../viewthesis.jsp\" method=\"post\" name=\"form1\" >\n"+
											"<input name=\"ok\" type=\"submit\" value=\"&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
											"</form>"));
					rs.close();
					closeDB();
					return false;
			}
			rs.close();


			//  get ข้อมูลนักศึกษาที่ทำโปรเจค
			sql= "SELECT S.STD#, S.TPRE, S.TNAME AS SNAME,S.TFAMILY,F.TNAME AS FNAME , "+
					"D.TNAME AS DNAME, M.TNAME AS MNAME ,C.TNAME AS CNAME "+
					"FROM STUDENT S,FACULTY F,DEPARTMENT D,MAJOR M,COURSE C  "+
					"WHERE S.STD# = '"+thesis.getStdID()+"' "+  
					"AND ( F.FACT# =( SELECT FACT# FROM STUDENT WHERE STD#='"+thesis.getStdID()+"' )) "+
					"AND ( D.DEPT#=( SELECT DEPT# FROM STUDENT WHERE STD#='"+thesis.getStdID()+"')) "+
					"AND ( M.MAJOR#=(SELECT MAJOR# FROM STUDENT WHERE STD#='"+thesis.getStdID()+"'))"+   
					"AND ( C.CO#=(SELECT CO# FROM STUDENT WHERE STD#='"+thesis.getStdID()+"'))";
			rs = stmt.executeQuery(sql);
			if(rs.next()){	// get student from database
					if(rs.getString("STD#")!=null)
						std.setStdID(thaiLanguage.UnicodeToMS874(rs.getString("STD#")));
					if(rs.getString("TPRE")!=null)
						std.setTpre(thaiLanguage.UnicodeToMS874(rs.getString("TPRE")));
					if(rs.getString("SNAME")!=null)
						std.setTname(thaiLanguage.UnicodeToMS874(rs.getString("SNAME")));
					if(rs.getString("TFAMILY")!=null)
						std.setTfamily(thaiLanguage.UnicodeToMS874(rs.getString("TFAMILY")));
					if(rs.getString("CNAME")!=null)
						courseName=thaiLanguage.UnicodeToMS874(rs.getString("CNAME"));
					if(rs.getString("FNAME")!=null)
						factName=thaiLanguage.UnicodeToMS874(rs.getString("FNAME"));
					if(rs.getString("DNAME")!=null)
						deptName=thaiLanguage.UnicodeToMS874(rs.getString("DNAME"));
					if(rs.getString("MNAME")!=null)
						majorName=thaiLanguage.UnicodeToMS874(rs.getString("MNAME"));					
			}
			rs.close();
			// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์
			sql = "SELECT * FROM SUPERVISETHESIS WHERE THESIS# = "+thesis.getThesisID()+" "; 
			rs = stmt.executeQuery(sql);
			for(int i = 0;rs.next();i++){	// get supervisor thesis
					if(rs.getString("LECTURER#")!=null)	
						superThesis[i].setLecturerID(rs.getString("LECTURER#"));
					if(rs.getString("SUPERVISESTATUS")!=null)
						superThesis[i].setSuperviseStatus(rs.getString("SUPERVISESTATUS"));
			} // end for
			rs.close();
			
			// get ข้อมุลอาจารย์ผู้ควบคุมวิทยานิพนธ์แต่ละคน
			for(int i=0;i<superThesis.length;i++){
				if(!superThesis[i].getLecturerID().equals("")){
					sql = "SELECT L.LECTURER#,L.NAME_TH,L.SURNAME_TH,L.TITLE_TH,L.ACADEMICAFFILIATION ,"+
							 "F.TNAME AS FNAME ,D.TNAME AS DNAME,M.TNAME MNAME "+
							 "FROM  LECTURER L , FACULTY F , DEPARTMENT D , MAJOR M "+
							 "WHERE L.LECTURER#='"+superThesis[i].getLecturerID()+"'  "+
							 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# = '"+superThesis[i].getLecturerID()+"' ) "+
							 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='"+superThesis[i].getLecturerID()+"' ) "+
							 "AND M.MAJOR# = (SELECT MAJOR# FROM LECTURER WHERE LECTURER# ='"+superThesis[i].getLecturerID()+"' ) ";
					rs = stmt.executeQuery(sql);
					if(rs.next()){
							if(rs.getString("LECTURER#")!=null)						
								lecturer[i].setLecturerID(thaiLanguage.UnicodeToMS874(rs.getString("LECTURER#")));
							if(rs.getString("TITLE_TH")!=null)						
								lecturer[i].setTitle_th(thaiLanguage.UnicodeToMS874(rs.getString("TITLE_TH")));
							if(rs.getString("NAME_TH")!=null)						
								lecturer[i].setName_th(thaiLanguage.UnicodeToMS874(rs.getString("NAME_TH")));
							if(rs.getString("SURNAME_TH")!=null)						
								lecturer[i].setSurname_th(thaiLanguage.UnicodeToMS874(rs.getString("SURNAME_TH")));
							if(rs.getString("ACADEMICAFFILIATION")!=null)						
								lecturer[i].setAcademicAffiliation(thaiLanguage.UnicodeToMS874(rs.getString("ACADEMICAFFILIATION")));
							if(rs.getString("FNAME")!=null)
								LFactName[i]=thaiLanguage.UnicodeToMS874(rs.getString("FNAME"));
							if(rs.getString("DNAME")!=null)
								LDeptName[i]=thaiLanguage.UnicodeToMS874(rs.getString("DNAME"));
							if(rs.getString("MNAME")!=null)
								LMajorName[i]=thaiLanguage.UnicodeToMS874(rs.getString("MNAME"));
					}
					rs.close();
				}
			} // end for get ข้อมุลอาจารย์ผู้ควบคุมวิทยานิพนธ์แต่ละคน

			stmt.close();
			closeDB();


			// show data
			out.println(	"<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\">\n"+
								"<tr>\n"+
								"		<td  colspan=\"2\" align=\"left\" bgcolor=\"#9999CC\" height=\"30\"><font class=\"header\">"+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;ข้อมูลวิทยานินพนธ์")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td colspan=\"2\" height=\"10\"></td>\n"+			// เว้น
								"</tr>\n"+
								"<tr>\n"+
								"		<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสวิทยานิพนธ์</b>&nbsp;")+"</font></td>\n"+
								"		<td width=\"450\" align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thesis.getThesisID()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ปีการศึกษา</b>&nbsp;")+"</font></td>\n"+
								"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\" ><font class=\"insfont\">"+thesis.getAcademicYear()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อเรื่องภาษาไทย</b>&nbsp;")+"</font></td>\n"+
								"		<td  align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thesis.getTopic_th()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อเรื่องภาษาอังกฤษ</b>&nbsp;")+"</font></td>\n"+
								"		<td  align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thesis.getTopic_en()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td  align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>คณะ<b>&nbsp;")+"</font></td>\n"+
								"		<td  align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+TfactName+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td  align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>วันที่อนุมัติ</b>&nbsp;")+"</font></td>\n"+
								"		<td  align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(myDate.getThaiDate(thesis.getApproveDate()))+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td colspan=\"2\" height=\"10\"></td>\n"+		// เว้น
								"</tr>\n"+
								"<tr>\n"+
								"		<td colspan=\"2\" align=\"left\" bgcolor=\"#9999CC\" height=\"30\"><font class=\"header\">"+thaiLanguage.UnicodeToMS874("&nbsp;ข้อมูลนักศึกษาที่ทำวิทยานิพนธ์")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td colspan=\"2\" height=\"10\"></td>\n"+		// เว้น
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสนักศึกษา</b>&nbsp;")+"</font></td>\n"+
								"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+std.getStdID()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อ</b>&nbsp;")+"</font></td>\n"+
								"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+std.getTpre()+std.getTname()+"&nbsp;&nbsp;&nbsp;&nbsp;"+std.getTfamily()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ศึกษาอยู่หลักสูตร</b>&nbsp;")+"</font></td>\n"+
								"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+courseName+"</font></td>\n"+
								"</tr>\n"+
									"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>คณะ</b>&nbsp;")+"</font></td>\n"+
								"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+factName+"</font></td>\n"+
								"</tr>\n"+
									"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ภาควิชา</b>&nbsp;")+"</font></td>\n"+
								"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+deptName+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สาขา</b>&nbsp;")+"</font></td>\n"+
								"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+majorName+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td colspan=\"2\" height=\"10\"></td>\n"+		// เว้น
								"</tr>\n"+
								"<tr>\n"+
								"		<td colspan=\"2\" align=\"left\" bgcolor=\"#9999CC\" height=\"30\"><font class=\"header\">"+thaiLanguage.UnicodeToMS874("&nbsp;ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์")+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"		<td colspan=\"2\" height=\"10\"></td>\n"+		// เว้น
								"</tr>\n");
				for(int i=0;i<superThesis.length;i++){
					if(superThesis[i].getSuperviseStatus().equals(thaiLanguage.MS874ToUnicode("หลัก"))){
						out.println(	"<tr>\n"+
											"		<td colspan=\"2\" align=\"left\" valign=\"bottom\"  bgcolor=\"#D6D6EB\"><font class=\"miniheader\">"+
													thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;&nbsp;&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก")+
											"		</td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสอาจารย์</b>&nbsp;")+"</font></td>\n"+
											"		<td  align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+lecturer[i].getLecturerID()+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อ</b>&nbsp;")+"</font></td>\n"+
											"		<td  align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+lecturer[i].getName_th()+"&nbsp;&nbsp;&nbsp;&nbsp;"+lecturer[i].getSurname_th()+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ตำแหน่งทางวิชาการ</b>&nbsp;")+"</font></td>\n"+
											"		<td  align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+lecturer[i].getAcademicAffiliation()+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สังกัดคณะ</b>&nbsp;")+"</font></td>\n"+
											"		<td  align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+LFactName[i]+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ภาควิชา</b>&nbsp;")+"</font></td>\n"+
											"		<td  align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+LDeptName[i]+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สาขา</b>&nbsp;")+"</font></td>\n"+
											"		<td  align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+LMajorName[i]+"</font></td>\n"+
											"</tr>\n");	
					}					
				}
				int seq=1;
				for(int i=0;i<superThesis.length;i++){	// print อาจารย์ผู้ควบคุมวิยานิพนธ์ร่วม					
					if(superThesis[i].getSuperviseStatus().equals(thaiLanguage.MS874ToUnicode("ร่วม"))){
						out.println(	"<tr>\n"+
											"		<td colspan=\"2\" align=\"left\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">"+
													thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;&nbsp;&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม "+seq)+
											"		</td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสอาจารย์</b>&nbsp;")+"</font></td>\n"+
											"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+lecturer[i].getLecturerID()+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อ</b>&nbsp;")+"</font></td>\n"+
											"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+lecturer[i].getName_th()+"&nbsp;&nbsp;&nbsp;&nbsp;"+lecturer[i].getSurname_th()+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ตำแหน่งทางวิชาการ</b>&nbsp;")+"</font></td>\n"+
											"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+lecturer[i].getAcademicAffiliation()+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สังกัดคณะ</b>&nbsp;")+"</font></td>\n"+
											"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+LFactName[i]+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ภาควิชา</b>&nbsp;")+"</font></td>\n"+
											"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+LDeptName[i]+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
											"		<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สาขา</b>&nbsp;")+"</font></td>\n"+
											"		<td align=\"left\" valign=\"top\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+LMajorName[i]+"</font></td>\n"+
											"</tr>\n");
											
						seq++;
					}					
				}
				out.println(	"<tr>\n"+
									"		<td colspan=\"2\" height=\"10\"></td>\n"+		// เว้น
									"</tr>\n"+
									"<tr>\n"+
									"		<td colspan=\"2\" height=\"3\" bgcolor=\"#9999CC\"></td>\n"+		// end line
									"</tr>\n"+
									"</table>\n");
				out.println("<br><table width=\"650\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"+
									 "<tr>\n"+
										"<td width=\"320\" align=\"right\">\n"+
											"<form action=\"thesisWork\" method=\"post\" name=\"form1\" >\n"+
												"  <input type=\"hidden\" name=\"thesisID\" value=\""+thesis.getThesisID()+"\">"+
									  			"<input name=\"deleteThesis\" type=\"submit\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;ลบข้อมูล&nbsp;&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\" onClick=\"return confirmDel()\">&nbsp;&nbsp;&nbsp;\n"+
											"</form>\n"+
										"</td>\n"+
										"<td width=\"10\"></td>\n"+
										"<td width=\"320\" align=\"left\">\n"+
											"<form action=\"../viewthesis.jsp\" method=\"post\" name=\"form1\" >\n"+
												"<input name=\"cancel\" type=\"submit\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;&nbsp;&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
											"</form>\n"+
										"</td>\n"+
									"</tr>\n"+
									"</table>\n");

			return true;

	} // end viewThesisInfo

//--------------------------------------------------------------------------------------- end viewThesisInfo

//--------------------------------------------------------------------------------------- start listThesis
	public void listThesis(String sqlCommand,PrintWriter out)throws Exception{
		Statement stmt;
		ResultSet rs;
		String thesisID="";
		String topic_th="";
		
		connectDB(out);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sqlCommand);			
		
		out.println("<br><table width=\"650\" border=\"1\" cellspacing=\"0\" bordercolor=\"#9999CC\" cellpadding=\"0\" rules=\"rows\">\n"+
							"<tr>\n"+
							"	<td colspan=\"2\" height=\"30\" bgcolor=\"#9999CC\"><font class=\"header\">"+thaiLanguage.UnicodeToMS874("&nbsp;รายชื่อวิทยานิพนธ์")+"</font></td>\n"+	 
							"</tr>\n"+
							"<tr>\n"+
							"	<td colspan=\"2\" height=\"10\" ></td>\n"+	 // empty
							"</tr>\n"+
							"<tr  height=\"30\">\n"+
							"		<td align=\"left\" valign=\"bottom\" width =\"130\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">"+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;รหัสวิทยานิพนธ์")+"</font></td>\n"+
							"		<td align=\"left\" valign=\"bottom\" width =\"520\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">"+thaiLanguage.UnicodeToMS874("หัวข้อวิทยานิพนธ์")+"</font></td>\n"+
							"</tr>\n");				
		int cnt=0;
		while(rs.next()){
			cnt++;
			if(rs.getString("THESIS#")!=null)						
					thesisID=thaiLanguage.UnicodeToMS874(rs.getString("THESIS#"));
			if(rs.getString("TOPIC_TH")!=null)						
					topic_th=thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_TH"));	
			out.println(	"<tr>\n"+
								"<td align=left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font><a href=\"thesisWork?thesisID="+thesisID+"\" class=\"link1\">"+thesisID+"</a></td>\n"+
								"<td align=left\" valign=\"top\" bgcolor=\"#E5E5F2\"><a href=\"thesisWork?thesisID="+thesisID+"\" class=\"link1\">"+topic_th+"</a></td>\n"+
								"</tr>\n");
		} // end if rs.next
		
		rs.close();
		stmt.close();
		closeDB();

		if(cnt==0){
					out.println(thaiLanguage.UnicodeToMS874("</table><br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลวิทยานิพนธ์ที่ระบุ</font>"));
					out.println("<form action=\"../viewthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
					"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
					"</form>\n");
		}
		
		out.println(	"<tr>\n"+
							"	<td colspan=\"2\" height=\"10\" ></td>\n"+	 // empty
							"</tr>\n"+
							"<tr>\n"+
							"	<td colspan=\"2\" height=\"3\" bgcolor=\"#9999CC\"></td>\n"+	 // empty
							"</tr>\n"+
							"</table>");
		out.println("<br><a href=\"../viewthesis.jsp\" class=\"link1\" >"+thaiLanguage.UnicodeToMS874("ยกเลิก")+"</a>");



	} // end listThesis

	public void changeTopic(HttpServletRequest request,PrintWriter out)throws Exception {
		Thesis thesis = new Thesis();
		PreparedStatement pstmt;

		if(request.getParameter("thesisID")!=null)
			thesis.setThesisID(Integer.parseInt(request.getParameter("thesisID")));
		if(request.getParameter("academicyear")!=null)
			thesis.setAcademicYear(request.getParameter("academicyear"));
		if(request.getParameter("topic_th")!=null)
			thesis.setTopic_th(thaiLanguage.MS874ToUnicode(request.getParameter("topic_th")));
		if(request.getParameter("topic_en")!=null)
			thesis.setTopic_en(thaiLanguage.MS874ToUnicode(request.getParameter("topic_en")));
		if(request.getParameter("faculty")!=null)
			thesis.setFactID(request.getParameter("faculty"));
		if(request.getParameter("approveyear")!=null){
			thesis.setApproveDate(request.getParameter("approvedate")+"/"+request.getParameter("approvemonth")+"/"+request.getParameter("approveyear"));
		}
		 
		String sqlCommand = "UPDATE THESIS SET ACADEMICYEAR = '"+thesis.getAcademicYear()+"' , "+
												"TOPIC_TH = '"+thesis.getTopic_th()+"' , TOPIC_EN ='"+thesis.getTopic_en()+"' , "+
												"APPROVEDATE = '"+thesis.getApproveDate()+"' , FACT# ='"+thesis.getFactID()+"' "+
												"WHERE THESIS# = "+thesis.getThesisID()+"";

		connectDB(out);
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();
		closeDB();

	} // end changeTopic
	public void addJoinSupervisor(String sqlCommand ,PrintWriter out)throws Exception{
		PreparedStatement pstmt;	
			
			connectDB(out);		
			pstmt = con.prepareStatement(sqlCommand);
			pstmt.executeUpdate();
			pstmt.close();
			closeDB();
	}	// addJoinSupervisor
	public boolean Exist(String sqlCommand ,PrintWriter out)throws Exception {
		Statement stmt;
		ResultSet rs;
				connectDB(out);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sqlCommand);
				if(!rs.next()){
					rs.close();
					stmt.close();
					closeDB();
					return false;
				}
				rs.close();
				stmt.close();
				closeDB();
				return true;				
	}

	public void deleteThesis(String sqlCommand ,PrintWriter out)throws Exception{
		PreparedStatement pstmt;	
			
			connectDB(out);		
			pstmt = con.prepareStatement(sqlCommand);
			pstmt.executeUpdate();
			pstmt.close();
			closeDB();
	}	// addJoinSupervisor

	//  ###########    doPost       #################
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();
		if(request.getParameter("getStudent") != null){		// get ข้อมูลนักศึกษา
				String stdID = "";
				Statement stmt;
				ResultSet rs;

				if(request.getParameter("stdID") != null){
						stdID =(String)request.getParameter("stdID");
				}
				
				try{
						getThesisData(request,out);
						// -------------------------  ตรวจสอบว่ามีข้อมูลนักศึกษาอยู่หรือไม่
						String sql = "SELECT * FROM STUDENT WHERE STD# ='"+stdID+"'";
						connectDB(out);
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);
						if(!rs.next()){
							out.println(htmlTemplate.getStart("","<font class=\"pathfont\"><a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์>> <a href=\"../addthesis.jsp\" class=\"pathlink2\">เพิ่มหัวข้อวิทยานิพนธ์</a></font>","เพิ่มหัวข้อวิทยานิพนธ์"));
							out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลนักศึกษาที่ระบุ</font>"));
							out.println("<br><form action=\"../addthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
							out.println(htmlTemplate.getEnd());
							session.setAttribute("notfound","nofound");
							session.setAttribute("thesisData",thesis);
							rs.close();
							closeDB();
							return;	
						}
						rs.close();
						closeDB();
									// printData(out);		/// fro test
						session.setAttribute("getStudent","getStudent");
						session.setAttribute("thesisData",thesis);
						session.setAttribute("stdID",stdID);
						response.sendRedirect("../addthesis.jsp");
				}
				catch(SQLException e){out.println(" getSuper Button SQLException : "+e.getMessage());}
				catch(Exception e){out.println(" getSuper Button Exception : "+e.getMessage());}
		}		// end click button getStudent

		if(request.getParameter("getSuper") != null){		// get ข้อมูลอาจารย์ควบคุมวิทยานิพนธ์หลัก
				String superID = "";
				Statement stmt;
				ResultSet rs;

				if(request.getParameter("superID") != null){
							 superID =(String)request.getParameter("superID");
				}
				
				try{						
						getThesisData(request,out);
						// -------------------------  ตรวจสอบว่ามีข้อมูลอาจารย์อยู่หรือไม่
						String sql = "SELECT * FROM LECTURER WHERE LECTURER# ='"+superID+"'";
						connectDB(out);
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);
						if(!rs.next()){
							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../addthesis.jsp\" class=\"pathlink2\">เพิ่มหัวข้อวิทยานิพนธ์</a>",">เพิ่มหัวข้อวิทยานิพนธ์"));
							out.println(thaiLanguage.UnicodeToMS874("<font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลอาจารย์ที่ระบุ</font>"));
							out.println("<form action=\"../addthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
							out.println(htmlTemplate.getEnd());
							session.setAttribute("notfound","nofound");
							session.setAttribute("thesisData",thesis);
							rs.close();
							closeDB();
							return;
						}
						rs.close();
						closeDB();
										//printData(out);		/// fortest
						session.setAttribute("getSuper","getSuper");
						session.setAttribute("superID",superID);
						session.setAttribute("thesisData",thesis);
						response.sendRedirect("../addthesis.jsp");
				}
				catch(SQLException e){out.println(" getSuper Button SQLException : "+e.getMessage());return;}
				catch(Exception e){out.println(" getSuper Button Exception : "+e.getMessage());return;}
		}   // end click getSuper Button

		if(request.getParameter("getJoin1") != null){		// get ข้อมูลอาจารย์ควบคุมวิทยานิพนธ์ร่วม 1
				String join1ID = "";
				Statement stmt;
				ResultSet rs;

				if(request.getParameter("join1ID") != null){
							 join1ID =(String)request.getParameter("join1ID");
				}
				
				try{	
						getThesisData(request,out);
						// -------------------------  ตรวจสอบว่ามีข้อมูลอาจารย์อยู่หรือไม่
						String sql = "SELECT * FROM LECTURER WHERE LECTURER# ='"+join1ID+"'";
						connectDB(out);
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);
						if(!rs.next()){
							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../addthesis.jsp\" class=\"pathlink2\">เพิ่มหัวข้อวิทยานิพนธ์</a>","เพิ่มหัวข้อวิทยานิพนธ์"));
							out.println(thaiLanguage.UnicodeToMS874("<font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลอาจารย์ที่ระบุ</font>"));
							out.println("<form action=\"../addthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
							out.println(htmlTemplate.getEnd());
							session.setAttribute("notfound","nofound");
							session.setAttribute("thesisData",thesis);
							rs.close();
							closeDB();
							return;
						}
						rs.close();
						closeDB();
										//printData(out);		/// fortest
						session.setAttribute("getJoin1","getJoin1");
						session.setAttribute("join1ID",join1ID);
						session.setAttribute("thesisData",thesis);
						response.sendRedirect("../addthesis.jsp");
				}
				catch(SQLException e){out.println(" getJoin1 Button SQLException : "+e.getMessage());return;}
				catch(Exception e){out.println(" getJoin1 Button Exception : "+e.getMessage());return;}
		}		// end click button getJoin1

		if(request.getParameter("getJoin2") != null){		// get ข้อมูลอาจารย์ควบคุมวิทยานิพนธ์ร่วม 2
				String join2ID = "";
				Statement stmt;
				ResultSet rs;

				if(request.getParameter("join2ID") != null){
							 join2ID =(String)request.getParameter("join2ID");
				}
				
				try{
						getThesisData(request,out);
						// -------------------------  ตรวจสอบว่ามีข้อมูลอาจารย์อยู่หรือไม่
						String sql = "SELECT * FROM LECTURER WHERE LECTURER# ='"+join2ID+"'";
						connectDB(out);
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);
						if(!rs.next()){
							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../addthesis.jsp\" class=\"pathlink2\">เพิ่มหัวข้อวิทยานิพนธ์</a>",">เพิ่มหัวข้อวิทยานิพนธ์"));
							out.println(thaiLanguage.UnicodeToMS874("<font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลอาจารย์ที่ระบุ</font>"));
							out.println("<form action=\"../addthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
							out.println(htmlTemplate.getEnd());
							session.setAttribute("notfound","nofound");
							session.setAttribute("thesisData",thesis);
							rs.close();
							closeDB();
							return;
						}
						rs.close();
						closeDB();
									///printData(out);		/// fortest
						session.setAttribute("getJoin2","getJoin2");
						session.setAttribute("join2ID",join2ID);
						session.setAttribute("thesisData",thesis);
						response.sendRedirect("../addthesis.jsp");
				}
				catch(SQLException e){out.println(" getJoin2 Button SQLException : "+e.getMessage());return;}
				catch(Exception e){out.println(" getJoin2 Button Exception : "+e.getMessage());return;}
		}		// end click button getJoin2

		if(request.getParameter("addThesis") != null){		// เพิ่มข้อมูล Thesis
				ResultSet rs;
				Statement stmt;
				try{						
						getThesisData(request,out);
						// เช็คว่านักศึกษามีหัวข้อวิทยานิพนธ์อยู่แล้วหรือไม่
						String sql = "SELECT * FROM THESIS WHERE STD# ='"+thesis.getStdID()+"'";
						connectDB(out);
						stmt = con.createStatement();
						rs = stmt.executeQuery(sql);
						if(rs.next()){
							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../addthesis.jsp\" class=\"pathlink2\">เพิ่มหัวข้อวิทยานิพนธ์</a>","เพิ่มหัวข้อวิทยานิพนธ์"));
							out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่สามารถเพิ่มหัวข้อวิทยานิพนธ์ได้เนื่องจากนักศึกษาคนนี้มีหัวข้อวิทยานิพนธ์อยู่แล้ว</font>"));
							out.println("<br><form action=\"../addthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
							out.println(htmlTemplate.getEnd());
							rs.close();
							closeDB();
							return;
						}
						rs.close();
						closeDB();
						
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;<a href=\"../addthesis.jsp\" class=\"pathlink2\">เพิ่มหัวข้อมวิทยานิพนธ์</a>","เพิ่มหัวข้อมวิทยานิพนธ์"));
								// printData(out);		// for test
						addThesis(request,out);
						out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">เพิ่มหัวข้อวิทยานิพนธ์เรียบร้อยแล้ว</font>"));
						out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">รหัสวิทยานิพนธ์&nbsp&nbsp:&nbsp&nbsp"+thesis.getThesisID()+"</font>"));
						out.println("<form action=\"../addthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());
						session.removeAttribute("notfound");
						session.removeAttribute("thesisData");


				}
				catch(SQLException e){out.println(" addThesis Button SQLException : "+e.getMessage());return;}
				catch(Exception e){out.println(" addThesis Button Exception : "+e.getMessage());return;}
		}

		if(request.getParameter("thesisCancel") != null){		// ยกเลิก เพิ่มข้อมูล Thesis
				try{
						session.removeAttribute("getStudent");
						session.removeAttribute("getSuper");
						session.removeAttribute("join1ID");
						session.removeAttribute("join2ID");
						session.removeAttribute("notfound");						
						response.sendRedirect("../addthesis.jsp");
				}
				catch(Exception e){out.println(" thesisCancel Button Exception : "+e.getMessage());}
		}
		// ---------------------------------------------------   view Thesis

		if(request.getParameter("viewfromstdID")!=null){	//  ดูหัวข้อโดยใส่รหัสนักศึกษา
				String stdID="";
				String sqlCommand="";
				 if(request.getParameter("stdID")!=null){
						stdID = request.getParameter("stdID");
						sqlCommand = "SELECT * FROM THESIS T, FACULTY F WHERE T.STD#='"+stdID+"' "+
												"AND F.FACT#=(SELECT FACT# FROM THESIS WHERE STD#='"+stdID+"')";

						try{
								out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;<a href=\"../viewthesis.jsp\" class=\"pathlink2\">ดูหัวข้อวิทยานิพนธ์</a>","ดูหัวข้อวิทยานิพนธ์"));
								viewThesisInfo(sqlCommand,out);
								out.println(htmlTemplate.getEnd());

						}
						catch(SQLException e){out.println(" viewThesis SQLException : "+e.getMessage());return;}
						catch(Exception e){out.println(" viewThesis Button Exception : "+e.getMessage());return;}
						
				 
				 }

		} // end request.getParameter("viewfromstdID")

		if(request.getParameter("viewfromthesisID")!=null){	//  ดูหัวข้อโดยใส่รหัสวิทยานิพนธ์
				String thesisID="";
				String sqlCommand="";
				 if(request.getParameter("thesisID")!=null){
						thesisID = request.getParameter("thesisID");					
						
						
						sqlCommand = "SELECT * FROM THESIS T, FACULTY F WHERE T.THESIS#="+thesisID+" "+
													"AND F.FACT#=(SELECT FACT# FROM THESIS WHERE THESIS#="+thesisID+")";

						try{
								out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;<a href=\"../viewthesis.jsp\" class=\"pathlink2\">ดูหัวข้อวิทยานิพนธ์</a>","ดูหัวข้อวิทยานิพนธ์"));
								viewThesisInfo(sqlCommand,out);
								out.println(htmlTemplate.getEnd());
						}
						catch(SQLException e){out.println(" viewThesis SQLException : "+e.getMessage());return;}
						catch(Exception e){out.println(" viewThesis Button Exception : "+e.getMessage());return;}
						
				 
				 }

		}// end request.getParameter("viewfromthesisID")

		if(request.getParameter("viewfromYF")!=null){	// list หัวข้อโดยใส่ปีการศึกษาและคณะมา
				String year="";
				String factID="";
				String factName="";
				String sqlCommand="";
				
				 if(request.getParameter("academicyear")!=null && request.getParameter("faculty")!=null){
						year = request.getParameter("academicyear");
						factID= request.getParameter("faculty");
					try{
								// get ชื่อคณะ
								ResultSet rs;
								Statement stmt;
								String sql ="SELECT TNAME FROM FACULTY WHERE FACT#='"+factID+"' ";
								connectDB(out);
								stmt = con.createStatement();
								rs = stmt.executeQuery(sql);
								if(rs.next()){
									if(rs.getString("TNAME")!=null)
										factName=thaiLanguage.UnicodeToMS874("คณะ"+rs.getString("TNAME"));
								}
								rs.close();
								stmt.close();
								closeDB();
								// end get ชื่อคณะ

								sqlCommand = "SELECT * FROM THESIS WHERE ACADEMICYEAR='"+year+"' "+
													" AND FACT# = '"+factID+"' ORDER BY THESIS#";
						
								out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;<a href=\"../viewthesis.jsp\" class=\"pathlink2\">ดูหัวข้อวิทยานิพนธ์</a>","ดูหัวข้อวิทยานิพนธ์"));
								out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"miniheader\">ปีการศึกษา&nbsp;"+year+"&nbsp;&nbsp;&nbsp;&nbsp;"+factName+"</font>\n"));
								listThesis(sqlCommand,out);
								out.println(htmlTemplate.getEnd());
						}
						catch(SQLException e){out.println(" viewThesis SQLException : "+e.getMessage());return;}
						catch(Exception e){out.println(" viewThesis Button Exception : "+e.getMessage());return;}
						
				 
				 }

		} // end request.getParameter("viewfromYF")

		if(request.getParameter("getChangeTopic")!=null){	// get ข้อมูลThesis แก้ไขหัวข้อวิทยานิพนธ์ 
				String thesisID="";
				Statement stmt;
				ResultSet rs;
				if(request.getParameter("thesisID")!=null){
					thesisID = (String)request.getParameter("thesisID");
					// ตรวจสอบว่ามีหัวข้อวิทยานิพนธ์อยู่หรือไม่
					String sqlCommand = "SELECT * FROM THESIS WHERE THESIS#="+thesisID+"";
					try{
							connectDB(out);
							stmt = con.createStatement();
							rs = stmt.executeQuery(sqlCommand);
							if(!rs.next()){		// ไม่มีข้อมูลอยู่
									out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../changetopic.jsp\" class=\"pathlink2\">แก้ไขหัวข้อวิทยานิพนธ์</a>","แก้ไขหัวข้อวิทยานิพนธ์"));
									out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบหัวข้อวิทยานิพนธ์ตามที่ระบุรหัสวิทยานิพนธ์</font>"));
									out.println("<form action=\"../changetopic.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");								
									out.println(htmlTemplate.getEnd());
									rs.close();
									closeDB();
									return;
							}
							else{
								rs.close();
								closeDB();
								session.setAttribute("getChangeTopic","getChangeTopic");
								session.setAttribute("thesisID",thesisID);
								response.sendRedirect("../changetopic.jsp");
							}
					}
					catch (SQLException e){out.println("getChangeTopic SQLException : "+e.getMessage());return;}
					catch (Exception e){out.println("getChangeTopic Exception : "+e.getMessage());return;}	
				}
		} // end request.getParameter("getEditTopic")

		if(request.getParameter("changeTopic")!=null){	// get เปลียนหัวข้อวิทยานิพนธ์ 
			String thesisID="";
			if(request.getParameter("thesisID")!=null){
					thesisID = (String)request.getParameter("thesisID");	
					try{					
							Statement stmt;
							ResultSet rs;
							String sqlCommand = "SELECT * FROM THESIS WHERE THESIS#="+thesisID+"";
		
							connectDB(out);
							stmt = con.createStatement();
							rs = stmt.executeQuery(sqlCommand);
							if(!rs.next()){		// ไม่มีข้อมูลอยู่
									out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../changetopic.jsp\" class=\"pathlink2\">เปลี่ยนหัวข้อวิทยานิพนธ์</a>","เปลี่ยนหัวข้อวิทยานิพนธ์"));
									out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบหัวข้อวิทยานิพนธ์ ตามที่ระบุรหัสวิทยานิพนธ์</font>"));
									out.println("<form action=\"../changetopic.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");								
									out.println(htmlTemplate.getEnd());
									rs.close();
									closeDB();
									return;
							}
							else{
										changeTopic(request,out);
										out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../changetopic.jsp\" class=\"pathlink2\">เปลี่ยนหัวข้อวิทยานิพนธ์</a>","เปลี่ยนหัวข้อวิทยานิพนธ์"));
										out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">เปลี่ยนหัวข้อวิทยานิพนธ์เรียบร้อยแล้ว</font>"));
										out.println("<form action=\"../changetopic.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");								
										out.println(htmlTemplate.getEnd());
							}
					}
					catch (SQLException e){out.println("changeTopic SQLException : "+e.getMessage());return;}
					catch (Exception e){out.println("changeTopic Exception : "+e.getMessage());return;}	
			}
		}	// end if(request.getParameter("editTopic")!=null)

		if(request.getParameter("cancelChangeTopic")!=null){	// ยกเลิก เปลียนหัวข้อวิทยานิพนธ์ 
			response.sendRedirect("../changetopic.jsp");

		} // end cancelEditTopic

		if(request.getParameter("getChangeSuper")!=null){	// get ข้อมูลThesis เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์
				String thesisID="";
				Statement stmt;
				ResultSet rs;
				if(request.getParameter("thesisID")!=null){
					thesisID = (String)request.getParameter("thesisID");
					// ตรวจสอบว่ามีหัวข้อวิทยานิพนธ์อยู่หรือไม่
					String sqlCommand = "SELECT * FROM THESIS WHERE THESIS#="+thesisID+"";
					try{
							connectDB(out);
							stmt = con.createStatement();
							rs = stmt.executeQuery(sqlCommand);
							if(!rs.next()){		// ไม่มีข้อมูลอยู่
									out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../changesupervisor.jsp\" class=\"pathlink2\" >เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์</a>",">เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์"));
									out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบหัวข้อวิทยานิพนธ์ ตามที่ระบุรหัสวิทยานิพนธ์</font>"));
									out.println("<form action=\"../changesupervisor.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");								
									out.println(htmlTemplate.getEnd());
									rs.close();
									closeDB();
									return;
							}
							else{
								rs.close();
								closeDB();
								session.setAttribute("getChangeSuper","getChangeSuper");
								session.setAttribute("thesisID",thesisID);
								response.sendRedirect("../changesupervisor.jsp");
							}
					}
					catch (SQLException e){out.println("getChangeSuper SQLException : "+e.getMessage());return;}
					catch (Exception e){out.println("getChangeSuper Exception : "+e.getMessage());return;}	
				}
		} // end request.getParameter("getChangeSuper")

		if(request.getParameter("getNewSuper")!=null){	// get ข้อมูลThesis เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์
				String newSuperID="";
				Statement stmt;
				ResultSet rs;
				if(request.getParameter("newSuperID")!=null){
					newSuperID = (String)request.getParameter("newSuperID");
					// ตรวจสอบว่ามีข้อมูลอาจารย์อยู่หรือไม่
					String sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+newSuperID+"' ";
					try{
							connectDB(out);
							stmt = con.createStatement();
							rs = stmt.executeQuery(sqlCommand);
							if(!rs.next()){		// ไม่มีข้อมูลอยู่
									out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../changesupervisor.jsp\" class=\"pathlink2\" >เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์</a>","เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์"));
									out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลอาจารย์ ตามที่ระบุรหัสรหัสอาจารย์</font>"));
									out.println("<form action=\"../changesupervisor.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");								
									out.println(htmlTemplate.getEnd());
									rs.close();
									closeDB();
									return;
							}
							else{
								rs.close();
								closeDB();
								session.setAttribute("getNewSuper","getNewSuper");
								session.setAttribute("newSuperID",newSuperID);
								response.sendRedirect("../changesupervisor.jsp");
							}
					}
					catch (SQLException e){out.println("getNewSuper SQLException : "+e.getMessage());return;}
					catch (Exception e){out.println("getNewSuper Exception : "+e.getMessage());return;}	
				}
		} // end request.getParameter("getChangeSuper")

		if(request.getParameter("changeSuper")!=null){		// update เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์
				String newSuperID="";
				String thesisID="";
				String oldSuperID="";

				PreparedStatement pstmt;
				ResultSet rs;
				if(request.getParameter("thesisID")!=null)
					thesisID = (String)request.getParameter("thesisID");
				if(request.getParameter("superID")!=null)
					oldSuperID  = (String)request.getParameter("superID");
				if(request.getParameter("newSuperID")!=null)
					newSuperID = (String)request.getParameter("newSuperID");

					//  ลบข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์ คนเก่า 
					String sqlCommand = "DELETE  FROM SUPERVISETHESIS WHERE LECTURER#='"+oldSuperID+"' AND THESIS# = "+thesisID+" ";
					try{
							connectDB(out);
							pstmt = con.prepareStatement(sqlCommand);
							pstmt.executeUpdate();
							
							sqlCommand = "INSERT INTO SUPERVISETHESIS( THESIS#,LECTURER#,SUPERVISESTATUS) "+
														" VALUES("+thesisID+", '"+newSuperID+"' , '"+thaiLanguage.MS874ToUnicode("หลัก")+"') ";
							pstmt = con.prepareStatement(sqlCommand);
							pstmt.executeUpdate();
							pstmt.close();
							closeDB();

							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../changesupervisor.jsp\" class=\"pathlink2\" >เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์</a>","เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์"));
							out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์เรียนร้อยแล้ว</font>"));
							out.println("<form action=\"../changesupervisor.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
									   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
		   							   "</form>\n");								
							out.println(htmlTemplate.getEnd());
							
					}
					catch (SQLException e){out.println("changeSuper SQLException : "+e.getMessage());return;}
					catch (Exception e){out.println("changeSuper Exception : "+e.getMessage());return;}	
				

		} // end request.getParameter("changeSuper")

		if(request.getParameter("cancelChangeSuper")!=null){	// ยกเลิก เปลียนอาจารย์ผู้ควบคุมวิทยานิพนธ์
			response.sendRedirect("../changesupervisor.jsp");

		} // end cancel ChangeSuper

		if(request.getParameter("getAddJoinSupervisor")!=null){		// เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม
				ResultSet rs;
				Statement stmt;
				String SthesisID="";	
				int thesisID=0;
				if(request.getParameter("thesisID")!=null)
					SthesisID = (String)request.getParameter("thesisID");
					try{
								thesisID = (int)Integer.parseInt(SthesisID);
					}
					catch(NumberFormatException ne){
									out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../addjoinsupervisor.jsp\" class=\"pathlink2\">เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</a>","เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม"));
									out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">กรุณาใส่รหัสวิทยานิพนธ์เป็นตัวเลข</font>"));
									out.println("<form action=\"../addjoinsupervisor.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");								
									out.println(htmlTemplate.getEnd());
									return;
					}
					// ตรวจสอบข้อมูลวิทยานิพนธ์ว่ามีอยู่หรือไม่
					String sqlCommand = "SELECT * FROM THESIS WHERE THESIS#="+thesisID+"";
					try{
							connectDB(out);
							stmt = con.createStatement();
							rs = stmt.executeQuery(sqlCommand);
							if(!rs.next()){		// ไม่มีข้อมูลอยู่
									out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../addjoinsupervisor.jsp\" class=\"pathlink2\">เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</a>","เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม"));
									out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบหัวข้อวิทยานิพนธ์ ตามที่ระบุรหัสวิทยานิพนธ์</font>"));
									out.println("<form action=\"../addjoinsupervisor.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");								
									out.println(htmlTemplate.getEnd());
									rs.close();
									stmt.close();
									closeDB();
									return;
							}
							else{
								rs.close();
								stmt.close();
								closeDB();
								session.setAttribute("getAddJoinSupervisor","getAddJoinSupervisor");
								session.setAttribute("thesisID",""+thesisID);
								response.sendRedirect("../addjoinsupervisor.jsp");
							}
					}
					catch (SQLException e){out.println("getAddJoinSupervisor SQLException : "+e.getMessage());return;}
					catch (Exception e){out.println("getAddJoinSupervisor Exception : "+e.getMessage());return;}	
					

		} // end request.getParameter("getAddJoinSupervisor")

		if(request.getParameter("getAddJoin1")!=null){		// เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม get ข้อมูลอาจารย์ที่จะเพิ่ม 1
				ResultSet rs;
				Statement stmt;
				String join1ID ="";				
				if(request.getParameter("join1ID")!=null)
					join1ID = (String)request.getParameter("join1ID");

					// ตรวจสอบข้อมูลอาจารย์ว่ามีอยู่หรือไม่
					String sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+join1ID+"' ";
					try{
							connectDB(out);
							stmt = con.createStatement();
							rs = stmt.executeQuery(sqlCommand);
							if(!rs.next()){		// ไม่มีข้อมูลอยู่
									out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../addjoinsupervisor.jsp\" class=\"pathlink2\">เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</a>","เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม"));
									out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลอาจารย์ ตามที่ระบุรหัสอาจารย์</font>"));
									out.println("<form action=\"../addjoinsupervisor.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");								
									out.println(htmlTemplate.getEnd());
									rs.close();
									stmt.close();
									closeDB();
									session.setAttribute("notfound","notfound");
									return;
							}
							else{
								rs.close();
								stmt.close();
								closeDB();
								session.setAttribute("getAddJoin1","getAddJoin1");
								session.setAttribute("join1ID",join1ID);
								response.sendRedirect("../addjoinsupervisor.jsp");
							}
					}
					catch (SQLException e){out.println("getAddJoin1 SQLException : "+e.getMessage());return;}
					catch (Exception e){out.println("getAddJoin1 Exception : "+e.getMessage());return;}	
					
		} // end request.getParameter("getAddJoin1")

		if(request.getParameter("getAddJoin2")!=null){		// เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม get ข้อมูลอาจารย์ที่จะเพิ่ม 2
				ResultSet rs;
				Statement stmt;
				String join2ID ="";				
				if(request.getParameter("join2ID")!=null)
					join2ID = (String)request.getParameter("join2ID");

					// ตรวจสอบข้อมูลวิทยานิพนธ์ว่ามีอยู่หรือไม่
					String sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+join2ID+"' ";
					try{
							connectDB(out);
							stmt = con.createStatement();
							rs = stmt.executeQuery(sqlCommand);
							if(!rs.next()){		// ไม่มีข้อมูลอยู่
									out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../addjoinsupervisor.jsp\" class=\"pathlink2\">เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</a>","เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม"));
									out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลอาจารย์ ตามที่ระบุรหัสอาจารย์</font>"));
									out.println("<form action=\"../addjoinsupervisor.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");								
									out.println(htmlTemplate.getEnd());
									rs.close();
									stmt.close();
									closeDB();
									session.setAttribute("notfound","notfound");
									return;
							}
							else{
								rs.close();
								stmt.close();
								closeDB();
								session.setAttribute("getAddJoin2","getAddJoin2");
								session.setAttribute("join2ID",join2ID);
								response.sendRedirect("../addjoinsupervisor.jsp");
							}
					}
					catch (SQLException e){out.println("getAddJoin2 SQLException : "+e.getMessage());return;}
					catch (Exception e){out.println("getAddJoin2 Exception : "+e.getMessage());return;}	
					
		} // end request.getParameter("getAddJoin2")

		if(request.getParameter("addJoinSupervisor")!=null){		// เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม 
				ResultSet rs;
				Statement stmt;
				String[] joinID ={"",""};
				int thesisID= 0;
				if(request.getParameter("thesisID")!=null)
					thesisID=Integer.parseInt(request.getParameter("thesisID"));
				if((String)request.getParameter("join1ID")!=null || !request.getParameter("join1ID").equals(""))
					joinID[0] = (String)request.getParameter("join1ID");
				if(request.getParameter("join2ID")!=null || !request.getParameter("join2ID").equals(""))
					joinID[1] = (String)request.getParameter("join2ID");
				
				// ตรวจสอบว่ามีข้อมูลอาจารย์อยู่ใน Table SUPERVISETHESIS ตามรหัสวิทยานิพนธืที่ระบุหรือเปล่า หรือยัง
				for(int i=0;i<2;i++){
					if(!joinID[i].equals("")){									
							String sqlCommand = "SELECT * FROM SUPERVISETHESIS WHERE THESIS# = "+thesisID+" "+
																	"AND LECTURER# = '"+joinID[i]+"' ";
							try{
									if(Exist(sqlCommand,out)){ //   มีอยู่แล้ว
											out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../addjoinsupervisor.jsp\" class=\"pathlink2\">เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</a>","เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม"));
											out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">อาจารย์ที่ระบุมา เป็นผู้ควบคุมวิทยานิพนธ์นี้อยู่แล้ว</font>"));
											out.println("<form action=\"../addjoinsupervisor.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
																"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
     															"</form>\n");
											out.println(htmlTemplate.getEnd());
											return;
									}
							}
							catch (SQLException e){out.println("getAddJoin2 SQLException : "+e.getMessage());return;}
							catch (Exception e){out.println("getAddJoin2 Exception : "+e.getMessage());return;}					
					}
				}		// end for

				for(int i=0;i<2;i++){
					if(!joinID[i].equals("")){									
							String sqlCommand = "INSERT INTO SUPERVISETHESIS(THESIS#,LECTURER#,SUPERVISESTATUS) "+
							" VALUES("+thesisID+" , '"+joinID[i]+"' , '"+thaiLanguage.MS874ToUnicode("ร่วม")+"' ) ";
							try{
									addJoinSupervisor(sqlCommand,out);								
							}
							catch (SQLException e){out.println("getAddJoin2 SQLException : "+e.getMessage());return;}
							catch (Exception e){out.println("getAddJoin2 Exception : "+e.getMessage());return;}					
					}
				}		// end for

				out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >><a href=\"../addjoinsupervisor.jsp\" class=\"pathlink2\">เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</a>","เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม"));
				out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วมแล้ว</font>"));
				out.println("<form action=\"../addjoinsupervisor.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
     							   "</form>\n");
				out.println(htmlTemplate.getEnd());
				return;
		} // end request.getParameter("addJoinSupervisor")

		if(request.getParameter("addJoinCancel")!=null){	// ยกเลิก เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม
			
			response.sendRedirect("../addjoinsupervisor.jsp");
		} // end addJoinCancel 

		if(request.getParameter("deleteThesis")!=null){	// ลบข้อมูลวิทยานิพนธ์
				String thesisID="";
				String sqlCommand = "";		
				
				if(request.getParameter("thesisID")!=null){
					try{
							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> วิทยานิพนธ์ >> ลบข้อมูลวิทยานิพนธ์","ลบข้อมูลวิทยานิพนธ์"));
								thesisID=request.getParameter("thesisID");
								sqlCommand="DELETE FROM SUPERVISETHESIS WHERE THESIS#="+thesisID+" ";
								deleteThesis(sqlCommand,out);
								sqlCommand="DELETE FROM THESIS WHERE THESIS#="+thesisID+" ";
							deleteThesis(sqlCommand,out);
							out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">ข้อมูลวิทยานิพนธ์ได้ถูกลบแล้ว</font>"));
							out.println("<form action=\"../viewthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
     							   "</form>\n");
							out.println(htmlTemplate.getEnd());
					}
					catch (SQLException e){out.println("deleteThesis SQLException : "+e.getMessage());return;}
					catch (Exception e){out.println("deleteThesis Exception : "+e.getMessage());return;}	
			}	

		} // end deleteThesis

	}	// end doPost
//  ###########    end doPost    ####################	
	
	
// ############### doGet #######################	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		// get database server
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();

		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		if(session.getAttribute("login")==null){
			response.sendRedirect("loginfail.jsp");
		}
		String sqlCommand="";
		String thesisID="";

		if(request.getParameter("thesisID")!=null){
			thesisID=request.getParameter("thesisID");
			sqlCommand = "SELECT * FROM THESIS T, FACULTY F WHERE T.THESIS#="+thesisID+" "+
												"AND F.FACT#=(SELECT FACT# FROM THESIS WHERE THESIS#="+thesisID+")";

						try{
								out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;<a href=\"../viewthesis.jsp\" class=\"pathlink2\">ดูหัวข้อวิทยานิพนธ์</a>","ดูหัวข้อวิทยานิพนธ์"));
								viewThesisInfo(sqlCommand,out);
								out.println(htmlTemplate.getEnd());
						}
						catch(SQLException e){out.println(" viewThesis SQLException : "+e.getMessage());return;}
						catch(Exception e){out.println(" viewThesis Button Exception : "+e.getMessage());return;}
						
		}
	} // end goGet
// ############### doGet #######################	

} /// ------  end class thesisWork
