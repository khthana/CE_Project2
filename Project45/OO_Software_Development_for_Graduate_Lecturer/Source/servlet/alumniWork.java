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
import alumni.Alumni;
import alumni.checkFinish;


public class alumniWork extends HttpServlet{
	
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

//--------------------------------------------------------------------------------------- start getAlumniInfo
	//return sqlCommand
	public String getAlumniInfo(HttpServletRequest request,PrintWriter out)throws Exception{
			Alumni alumni = new Alumni();
			String column="";
			String value="";
			
			if(request.getParameter("stdID")!=null){
				alumni.setAlumniID(thaiLanguage.MS874ToUnicode(request.getParameter("stdID")));
				column=column+"ALUMNI#";
				value="'"+alumni.getAlumniID()+"'";
			}
			if(request.getParameter("academicYear")!=null){
				alumni.setAcademicYear(thaiLanguage.MS874ToUnicode(request.getParameter("academicYear")));
				column=column+" , ACADEMICYEAR";
				value=value+" , '"+alumni.getAcademicYear()+"'";
			}
			if(request.getParameter("stdtitle")!=null){
				alumni.setTitle(thaiLanguage.MS874ToUnicode(request.getParameter("stdtitle")));
				column=column+" , TITLE";
				value=value+" , '"+alumni.getTitle()+"'";
			}
			if(request.getParameter("std_name")!=null){
				alumni.setName(thaiLanguage.MS874ToUnicode(request.getParameter("std_name")));
				column=column+" , NAME";
				value=value+" , '"+alumni.getName()+"'";
			}
			if(request.getParameter("std_surname")!=null){
				alumni.setSurname(thaiLanguage.MS874ToUnicode(request.getParameter("std_surname")));
				column=column+" , SURNAME";
				value=value+" , '"+alumni.getSurname()+"'";
			}
			if(request.getParameter("sex")!=null){
				alumni.setSex(thaiLanguage.MS874ToUnicode(request.getParameter("sex")));
				column=column+" , SEX";
				value=value+" , '"+alumni.getSex()+"'";
			}
			if(request.getParameter("course")!=null){
				alumni.setCourseName(thaiLanguage.MS874ToUnicode(request.getParameter("course")));
				column=column+" , COURSE";
				value=value+" , '"+alumni.getCourseName()+"'";
			}
			if(request.getParameter("major")!=null){
				alumni.setMajorName(thaiLanguage.MS874ToUnicode(request.getParameter("major")));
				column=column+" , MAJOR";
				value=value+" , '"+alumni.getMajorName()+"'";
			}
			if(request.getParameter("faculty")!=null){
				alumni.setFactName(thaiLanguage.MS874ToUnicode(request.getParameter("faculty")));
				column=column+" , FACULTY";
				value=value+" , '"+alumni.getFactName()+"'";
			}
			if(request.getParameter("department")!=null){
				alumni.setDeptName(thaiLanguage.MS874ToUnicode(request.getParameter("department")));
				column=column+" , DEPARTMENT";
				value=value+" , '"+alumni.getDeptName()+"'";
			}
			if(request.getParameter("research")!=null){
				alumni.setResearchType(thaiLanguage.MS874ToUnicode(request.getParameter("research")));
				column=column+" , RESEARCHTYPE";
				value=value+" , '"+alumni.getResearchType()+"'";
			}
			if(request.getParameter("research_name_th")!=null){
				alumni.setResearchTopic_th(thaiLanguage.MS874ToUnicode(request.getParameter("research_name_th")));
				column=column+" , TOPIC_TH";
				value=value+" , '"+alumni.getResearchTopic_th()+"'";
			}
			if(request.getParameter("research_name_en")!=null){
				alumni.setResearchTopic_en(thaiLanguage.MS874ToUnicode(request.getParameter("research_name_en")));
				column=column+" , TOPIC_EN";
				value=value+" , '"+alumni.getResearchTopic_en()+"'";
			}
			if(request.getParameter("superAcademicAffiliation")!=null){
				alumni.setSuperAcademicAffiliation(thaiLanguage.MS874ToUnicode(request.getParameter("superAcademicAffiliation")));
				column=column+" , SUPERVISOR_AA";
				value=value+" , '"+alumni.getSuperAcademicAffiliation()+"'";
			}
			if(request.getParameter("super_name")!=null){
				alumni.setSuperName(thaiLanguage.MS874ToUnicode(request.getParameter("super_name")));
				column=column+" , SUPERVISORNAME";
				value=value+" , '"+alumni.getSuperName()+"'";
			}
			if(request.getParameter("super_surname")!=null){
				alumni.setSuperSurname(thaiLanguage.MS874ToUnicode(request.getParameter("super_surname")));
				column=column+" , SUPERVISORSURNAME";
				value=value+" , '"+alumni.getSuperSurname()+"'";
			}
			if(request.getParameter("join1AcademicAffiliation")!=null){
				alumni.setJoin1AcademicAffiliation(thaiLanguage.MS874ToUnicode(request.getParameter("join1AcademicAffiliation")));
				column=column+" , J_SUPERVISOR1_AA";
				value=value+" , '"+alumni.getJoin1AcademicAffiliation()+"'";
			}
			if(request.getParameter("join_super_name1")!=null){
				alumni.setJoin1Name(thaiLanguage.MS874ToUnicode(request.getParameter("join_super_name1")));
				column=column+" , J_SUPERVISOR1_NAME";
				value=value+" , '"+alumni.getJoin1Name()+"'";
			}
			if(request.getParameter("join_super_surname1")!=null){
				alumni.setJoin1Surname(thaiLanguage.MS874ToUnicode(request.getParameter("join_super_surname1")));
				column=column+" , J_SUPERVISOR1_SURNAME";
				value=value+" , '"+alumni.getJoin1Surname()+"'";
			}
			if(request.getParameter("join2AcademicAffiliation")!=null){
				alumni.setJoin2AcademicAffiliation(thaiLanguage.MS874ToUnicode(request.getParameter("join2AcademicAffiliation")));
				column=column+" , J_SUPERVISOR2_AA";
				value=value+" , '"+alumni.getJoin2AcademicAffiliation()+"'";
			}
			if(request.getParameter("join_super_name2")!=null){
				alumni.setJoin2Name(thaiLanguage.MS874ToUnicode(request.getParameter("join_super_name2")));
				column=column+" , J_SUPERVISOR2_NAME";
				value=value+" , '"+alumni.getJoin2Name()+"'";
			}
			if(request.getParameter("join_super_surname2")!=null){
				alumni.setJoin2Surname(thaiLanguage.MS874ToUnicode(request.getParameter("join_super_surname2")));
				column=column+" , J_SUPERVISOR2_SURNAME";
				value=value+" , '"+alumni.getJoin2Surname()+"'";
			}
			if(!request.getParameter("birthyear").equals("")){
				alumni.setBirthday(request.getParameter("birthday")+"/"+request.getParameter("birthmonth")+"/"+request.getParameter("birthyear"));
				column=column+" , BIRTHDAY";
				value=value+" , '"+alumni.getBirthday()+"'";
			}
			else{
				alumni.setBirthday(request.getParameter("birthday")+"/"+request.getParameter("birthmonth")+"/0000");
				column=column+" , BIRTHDAY";
				value=value+" , '"+alumni.getBirthday()+"'";
			}

			// OldBaechelor
			if(request.getParameter("oldB_degree")!=null){
				alumni.setOldBaechelorDegree(thaiLanguage.MS874ToUnicode(request.getParameter("oldB_degree")));
				column=column+" , OLD_BDEGREE";
				value=value+" , '"+alumni.getOldBaechelorDegree()+"'";
			}
			if(request.getParameter("oldB_institute")!=null){
				alumni.setOldBaechelorIntitute(thaiLanguage.MS874ToUnicode(request.getParameter("oldB_institute")));
				column=column+" , OLD_BINSTITUTE";
				value=value+" , '"+alumni.getOldBaechelorIntitute()+"'";
			}
			if(request.getParameter("oldB_year")!=null){
				alumni.setOldBaechelorYear(thaiLanguage.MS874ToUnicode(request.getParameter("oldB_year")));
				column=column+" , OLD_BYEAR";
				value=value+" , '"+alumni.getOldBaechelorYear()+"'";
			}

			// OldMaster
			if(request.getParameter("oldM_degree")!=null){
				alumni.setOldMasterDegree(thaiLanguage.MS874ToUnicode(request.getParameter("oldM_degree")));
				column=column+" , OLD_MDEGREE";
				value=value+" , '"+alumni.getOldMasterDegree()+"'";
			}
			if(request.getParameter("oldM_institute")!=null){
				alumni.setOldMasterIntitute(thaiLanguage.MS874ToUnicode(request.getParameter("oldM_institute")));
				column=column+" , OLD_MINSTITUTE";
				value=value+" , '"+alumni.getOldMasterIntitute()+"'";
			}
			if(request.getParameter("oldM_year")!=null){
				alumni.setOldMasterYear(thaiLanguage.MS874ToUnicode(request.getParameter("oldM_year")));
				column=column+" , OLD_MYEAR";
				value=value+" , '"+alumni.getOldMasterYear()+"'";
			}

			if(request.getParameter("paper")!=null){
				alumni.setPaper(thaiLanguage.MS874ToUnicode(request.getParameter("paper")));
				column=column+" , PAPER";
				value=value+" , '"+alumni.getPaper()+"'";
			}
			if(request.getParameter("award")!=null){
				alumni.setAward(thaiLanguage.MS874ToUnicode(request.getParameter("award")));
				column=column+" , AWARD";
				value=value+" , '"+alumni.getAward()+"'";
			}
			if(request.getParameter("experience")!=null){
				alumni.setExperience(thaiLanguage.MS874ToUnicode(request.getParameter("experience")));
				column=column+" , EXPERIENCE";
				value=value+" , '"+alumni.getExperience()+"'";
			}
			if(request.getParameter("work")!=null){
				alumni.setWork(thaiLanguage.MS874ToUnicode(request.getParameter("work")));
				column=column+" , WORK";
				value=value+" , '"+alumni.getWork()+"'";
			}
			if(request.getParameter("office_address")!=null){
				alumni.setOfficeAddress(thaiLanguage.MS874ToUnicode(request.getParameter("office_address")));
				column=column+" , OFFICEADDRESS";
				value=value+" , '"+alumni.getOfficeAddress()+"'";
			}
			if(request.getParameter("office_telophone")!=null){
				alumni.setOfficeTelephone(thaiLanguage.MS874ToUnicode(request.getParameter("office_telophone")));
				column=column+" , OFFICETELEPHONE";
				value=value+" , '"+alumni.getOfficeTelephone()+"'";
			}
			if(request.getParameter("address")!=null){
				alumni.setAddress(thaiLanguage.MS874ToUnicode(request.getParameter("address")));
				column=column+" , ADDRESS";
				value=value+" , '"+alumni.getAddress()+"'";
			}
			if(request.getParameter("telephone")!=null){
				alumni.setTelephone(thaiLanguage.MS874ToUnicode(request.getParameter("telephone")));
				column=column+" , TELEPHONE";
				value=value+" , '"+alumni.getTelephone()+"'";
			}
			if(request.getParameter("email")!=null){
				alumni.setEmail(thaiLanguage.MS874ToUnicode(request.getParameter("email")));
				column=column+" , EMAIL";
				value=value+" , '"+alumni.getEmail()+"'";
			}

			String sqlCommand = "INSERT INTO ALUMNI ("+column+") VALUES("+value+")";
			return sqlCommand;
		
	} // end getAlumniInfo
//--------------------------------------------------------------------------------------- end getAlumniInfo

//--------------------------------------------------------------------------------------- start addAlumni
	public void addAlumni(String sqlCommand,PrintWriter out)throws Exception{
		connectDB(out);		
		PreparedStatement pstmt;
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();
		closeDB();	
	}
//--------------------------------------------------------------------------------------- end addAlumni

//--------------------------------------------------------------------------------------- start addAlumni
	public void deleteAlumni(String stdID,PrintWriter out)throws Exception{
		String sqlCommand = "DELETE FROM ALUMNI WHERE ALUMNI# ='"+stdID+"' ";
		connectDB(out);		
		PreparedStatement pstmt;
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();
		closeDB();	
	}
//--------------------------------------------------------------------------------------- end addAlumni

//--------------------------------------------------------------------------------------- start viewAlumni
	public void viewAlumni(String sqlCommand,PrintWriter out)throws Exception{
		ResultSet rs;
		Statement stmt;
		Alumni alumni = new Alumni();
		//  get ข้อมูลประวัตินักศึกษาที่จบไปแล้ว
		
		connectDB(out);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sqlCommand);
		if(rs.next()){		// มีข้อมูล
		
			if(rs.getString("ALUMNI#")!=null){
				alumni.setAlumniID(thaiLanguage.UnicodeToMS874(rs.getString("ALUMNI#")));
			}
			if(rs.getString("ACADEMICYEAR")!=null){
				alumni.setAcademicYear(thaiLanguage.UnicodeToMS874(rs.getString("ACADEMICYEAR")));
			}
			if(rs.getString("TITLE")!=null){
				alumni.setTitle(thaiLanguage.UnicodeToMS874(rs.getString("TITLE")));
			}
			if(rs.getString("NAME")!=null){
				alumni.setName(thaiLanguage.UnicodeToMS874(rs.getString("NAME")));
			}
			if(rs.getString("SURNAME")!=null){
				alumni.setSurname(thaiLanguage.UnicodeToMS874(rs.getString("SURNAME")));
			}
			if(rs.getString("SEX")!=null){
				alumni.setSex(thaiLanguage.UnicodeToMS874(rs.getString("SEX")));
			}
			if(rs.getString("COURSE")!=null){
				alumni.setCourseName(thaiLanguage.UnicodeToMS874(rs.getString("COURSE")));
			}
			if(rs.getString("MAJOR")!=null){
				alumni.setMajorName(thaiLanguage.UnicodeToMS874(rs.getString("MAJOR")));
			}
			if(rs.getString("FACULTY")!=null){
				alumni.setFactName(thaiLanguage.UnicodeToMS874(rs.getString("FACULTY")));
			}
			if(rs.getString("DEPARTMENT")!=null){
				alumni.setDeptName(thaiLanguage.UnicodeToMS874(rs.getString("DEPARTMENT")));
			}
			if(rs.getString("RESEARCHTYPE")!=null){
				alumni.setResearchType(thaiLanguage.UnicodeToMS874(rs.getString("RESEARCHTYPE")));
			}
			if(rs.getString("TOPIC_TH")!=null){
				alumni.setResearchTopic_th(thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_TH")));
			}
			if(rs.getString("TOPIC_EN")!=null){
				alumni.setResearchTopic_en(thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_EN")));
			}
			if(rs.getString("SUPERVISOR_AA")!=null){
				alumni.setSuperAcademicAffiliation(thaiLanguage.UnicodeToMS874(rs.getString("SUPERVISOR_AA")));
			}
			if(rs.getString("SUPERVISORNAME")!=null){
				alumni.setSuperName(thaiLanguage.UnicodeToMS874(rs.getString("SUPERVISORNAME")));
			}
			if(rs.getString("SUPERVISORSURNAME")!=null){
				alumni.setSuperSurname(thaiLanguage.UnicodeToMS874(rs.getString("SUPERVISORSURNAME")));
			}
			if(rs.getString("J_SUPERVISOR1_AA")!=null){
				alumni.setJoin1AcademicAffiliation(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR1_AA")));
			}
			if(rs.getString("J_SUPERVISOR1_NAME")!=null){
				alumni.setJoin1Name(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR1_NAME")));
			}
			if(rs.getString("J_SUPERVISOR1_SURNAME")!=null){
				alumni.setJoin1Surname(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR1_SURNAME")));
			}
			if(rs.getString("J_SUPERVISOR2_AA")!=null){
				alumni.setJoin2AcademicAffiliation(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR2_AA")));
			}
			if(rs.getString("J_SUPERVISOR2_NAME")!=null){
				alumni.setJoin2Name(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR2_NAME")));
			}
			if(rs.getString("J_SUPERVISOR2_SURNAME")!=null){
				alumni.setJoin2Surname(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR2_SURNAME")));
			}
			if(!rs.getString("BIRTHDAY").equals("")){
				alumni.setBirthday(thaiLanguage.UnicodeToMS874(myDate.getThaiDate(rs.getString("BIRTHDAY"))));
			}	

			// OldBaechelor
			if(rs.getString("OLD_BDEGREE")!=null){
				alumni.setOldBaechelorDegree(thaiLanguage.UnicodeToMS874(rs.getString("OLD_BDEGREE")));
			}
			if(rs.getString("OLD_BINSTITUTE")!=null){
				alumni.setOldBaechelorIntitute(thaiLanguage.UnicodeToMS874(rs.getString("OLD_BINSTITUTE")));
			}
			if(rs.getString("OLD_BYEAR")!=null){
				alumni.setOldBaechelorYear(thaiLanguage.UnicodeToMS874(rs.getString("OLD_BYEAR")));
			}

			// OldMaster
			if(rs.getString("OLD_MDEGREE")!=null){
				alumni.setOldMasterDegree(thaiLanguage.UnicodeToMS874(rs.getString("OLD_MDEGREE")));
			}
			if(rs.getString("OLD_MINSTITUTE")!=null){
				alumni.setOldMasterIntitute(thaiLanguage.UnicodeToMS874(rs.getString("OLD_MINSTITUTE")));
			}
			if(rs.getString("OLD_MYEAR")!=null){
				alumni.setOldMasterYear(thaiLanguage.UnicodeToMS874(rs.getString("OLD_MYEAR")));
			}

			if(rs.getString("PAPER")!=null){
				alumni.setPaper(thaiLanguage.UnicodeToMS874(rs.getString("PAPER")));
			}
			if(rs.getString("AWARD")!=null){
				alumni.setAward(thaiLanguage.UnicodeToMS874(rs.getString("AWARD")));
			}
			if(rs.getString("EXPERIENCE")!=null){
				alumni.setExperience(thaiLanguage.UnicodeToMS874(rs.getString("EXPERIENCE")));
			}
			if(rs.getString("WORK")!=null){
				alumni.setWork(thaiLanguage.UnicodeToMS874(rs.getString("WORK")));
			}
			if(rs.getString("OFFICEADDRESS")!=null){
				alumni.setOfficeAddress(thaiLanguage.UnicodeToMS874(rs.getString("OFFICEADDRESS")));
			}
			if(rs.getString("OFFICETELEPHONE")!=null){
				alumni.setOfficeTelephone(thaiLanguage.UnicodeToMS874(rs.getString("OFFICETELEPHONE")));
			}
			if(rs.getString("ADDRESS")!=null){
				alumni.setAddress(thaiLanguage.UnicodeToMS874(rs.getString("ADDRESS")));
			}
			if(rs.getString("TELEPHONE")!=null){
				alumni.setTelephone(thaiLanguage.UnicodeToMS874(rs.getString("TELEPHONE")));
			}
			if(rs.getString("EMAIL")!=null){
				alumni.setEmail(thaiLanguage.UnicodeToMS874(rs.getString("EMAIL")));
			}
		} // end if(rs.next())
		rs.close();
		stmt.close();
		closeDB();

		// แสดงข้อมูลประวัตินักศึกษาที่จบไปแล้ว

		out.println(htmlTemplate.getStart("","<font class=\"pathfont\"><a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> สำเร็จการศึกษา >> <a href=\"../viewalumni.jsp\" class=\"pathlink2\">ดูประวัติผู้สำเร็จการศึกษา</a></font>","ประวัติผู้สำเร็จการศึกษา"));

		out.println(	"<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\">\n"+
							"<tr> \n"+
							"   <td colspan=\"2\" align=\"left\" height=\"30\" bgcolor=\"#9999CC\" valign=\"bottom\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ประวัติการศึกษา")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td colspan=\"2\"  height=\"10\"></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td align=\"right\" valign=\"top\" width=\"200\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ปีการศึกษาที่จบ</b>")+"&nbsp;</font></td>\n"+
							"	<td align=\"left\" valign=\"top\" width=\"450\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getAcademicYear()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\" >"+thaiLanguage.UnicodeToMS874("<b>รหัสนักศึกษา</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\"  bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getAlumniID()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อ</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getTitle()+alumni.getName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+alumni.getSurname()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>เพศ</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getSex()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>หลักสูตร</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getCourseName()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สาขา</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getMajorName()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>คณะ</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getFactName()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ภาควิชา</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getDeptName()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>งานวิจัย</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getResearchType()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่องานวิจัย(ไทย)</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getResearchTopic_th()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่องานวิจัย(อังกฤษ)</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getResearchTopic_en()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>อาจารย์ผู้ควบคุม</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getSuperAcademicAffiliation()+alumni.getSuperName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+alumni.getSuperSurname()+"</font></td>\n"+
							"</tr>\n");
				if(!alumni.getJoin1Name().equals("")){
					out.print(	"<tr>\n"+
									"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>อาจารย์ผู้ควบคุมร่วม</b>")+"&nbsp;</font></td>\n"+
									"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getJoin1AcademicAffiliation()+alumni.getJoin1Name()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+alumni.getJoin1Surname()+"</font>\n"	);
				}
				if(!alumni.getJoin2Name().equals("")){
					out.print(	"<br><font class=\"insfont\">"+alumni.getJoin2AcademicAffiliation()+alumni.getJoin2Name()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+alumni.getJoin2Surname()+"</font></td>\n"+
									"</tr>\n");
				}
				else{
					out.println("</td>\n</tr>\n");
				}
			
			out.print(	"<tr>\n"+
							"	<td colspan=\"2\"  height=\"10\"></td>\n"+	// empty row
							"</tr>\n"+
							"<tr> \n"+
							"   <td colspan=\"2\" align=\"left\" height=\"30\" bgcolor=\"#9999CC\" valign=\"bottom\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ประวัตินักศึกษา")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td colspan=\"2\"  height=\"10\"></td>\n"+	// empty row
							"</tr>\n"+				
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>วัน/เดือน/ปี เกิด</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getBirthday()+"</font></td>\n"+
							"</tr>\n"+
							"<tr> \n"+
							"   <td colspan=\"2\" align=\"left\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;&nbsp;&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ประวัติการศึกษาปริญาตรี")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\" >"+thaiLanguage.UnicodeToMS874("<b>วุฒิการศึกษาปริญญาตรี</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getOldBaechelorDegree()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สถานศึกษา</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getOldBaechelorIntitute()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ปีที่สำเร็จ</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getOldBaechelorYear()+"</font></td>\n"+
							"</tr>\n"+
							"<tr> \n"+
							"   <td colspan=\"2\" align=\"left\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;&nbsp;&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ประวัติการศึกษาปริญาโท")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>วุฒิการศึกษาปริญญาโท</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getOldMasterDegree()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สถานศึกษา</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getOldMasterIntitute()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ปีที่สำเร็จ</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getOldMasterYear()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ผลงานวิชาการ</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getPaper()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รางวัลหรือทุนที่เคยได้รับ</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getAward()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ประสบการณ์ทำงาน</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getExperience()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>อาชีพปัจจุบัน</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getWork()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สถานที่ทำงาน</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getOfficeAddress()+"<br>"+thaiLanguage.UnicodeToMS874("<b>โทรศัพท์</b>&nbsp;&nbsp;")+alumni.getOfficeTelephone()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ที่อยู่ปัจจุบัน</b>")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+alumni.getAddress()+"<br>"+thaiLanguage.UnicodeToMS874("<b>โทรศัพท์</b>&nbsp;&nbsp;")+alumni.getTelephone()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>email</b>&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><a href=\"mailto:"+alumni.getEmail()+"\" class=\"inslink\">"+alumni.getEmail()+"</a></td>\n"+
							"</tr>\n"+							
							"<tr>\n"+
							"	<td colspan=\"2\"  height=\"10\"></td>\n"+	// empty row
							"</tr>\n"+
							"<tr>\n"+
							"	<td colspan=\"2\"  height=\"3\" bgcolor=\"#9999CC\"></td>\n"+	// line end
							"</tr>\n"+
							"</table>\n");
					out.println(	"<br><form action=\"alumniWork\" method=\"post\" name=\"form1\" >\n"+
										"<input type=\"hidden\" name=\"stdID\" value=\""+alumni.getAlumniID()+"\">"+
										"<input type=\"submit\" name=\"deleteAlumni\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;ลบข้อมูล&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\" onClick=\"return confirmDel()\">\n"+
										"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
										"<input type=\"submit\" name=\"cancelView\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");

					out.println(htmlTemplate.getEnd());

	} //  end viewAlumni
//--------------------------------------------------------------------------------------- end viewAlumni

//--------------------------------------------------------------------------------------- start listAlumni
	public void listAlumni(String sqlCommand,String academicYear,String fact,PrintWriter out)throws Exception{
		ResultSet rs;
		Statement stmt;
		Alumni alumni = new Alumni();
		//  list ข้อมูลประวัตินักศึกษาที่จบไปแล้วตามปีการศึกษาที่จบ และ คณะ
		
		out.println(htmlTemplate.getStart("","<font class=\"pathfont\"><a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> สำเร็จการศึกษา >> <a href=\"../viewalumni.jsp\" class=\"pathlink2\">ดูประวัติผู้สำเร็จการศึกษา</a></font>","รายชื่อประวัติผู้สำเร็จการศึกษา"));
		out.println(	thaiLanguage.UnicodeToMS874("<br><font class=\"miniheader\" >ปีการศึกษา&nbsp;&nbsp;"+academicYear+
							"&nbsp;&nbsp;&nbsp;&nbspคณะ&nbsp;&nbsp;"+fact+"</font><br>"));
	
		out.println(	"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" rules=\"rows\" bordercolor=\"#9999CC\">\n"+
								"<tr>\n"+
								"<td height=\"30\" align=\"left\" colspan=\"3\" bgcolor=\"#9999CC\"><font class=\"header\">"+	thaiLanguage.UnicodeToMS874("รายชื่อนักศึกษาที่จบการศึกษา")+"</font></td>\n"+	// empty
								"</tr>\n"+
								"<tr>\n"+
								"<td height=\"10\" colspan=\"3\"></td>\n"+	// empty
								"</tr>\n"+
								"<tr> \n"+
								"	<td class=\"miniheader\" width=\"120\" bgcolor=\"#D6D6EB\" height=\"30\" align=\"left\" valign=\"bottom\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("รหัสนักศึกษา")+"</td>\n"+
								"   <td class=\"miniheader\" width=\"220\" bgcolor=\"#D6D6EB\" align=\"left\" valign=\"bottom\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ชื่อ - นามสกุล")+"</td>\n"+
								"   <td class=\"miniheader\" width=\"310\" bgcolor=\"#D6D6EB\" align=\"left\" valign=\"bottom\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ภาควิชา")+"</td>\n"+
								"</tr>\n");
		connectDB(out);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sqlCommand);
		int cnt=0;
		while(rs.next()){		// มีข้อมูล
			cnt++;
			if(rs.getString("ALUMNI#")!=null){
				alumni.setAlumniID(thaiLanguage.UnicodeToMS874(rs.getString("ALUMNI#")));
			}
			if(rs.getString("ACADEMICYEAR")!=null){
				alumni.setAcademicYear(thaiLanguage.UnicodeToMS874(rs.getString("ACADEMICYEAR")));
			}
			if(rs.getString("TITLE")!=null){
				alumni.setTitle(thaiLanguage.UnicodeToMS874(rs.getString("TITLE")));
			}
			if(rs.getString("NAME")!=null){
				alumni.setName(thaiLanguage.UnicodeToMS874(rs.getString("NAME")));
			}
			if(rs.getString("SURNAME")!=null){
				alumni.setSurname(thaiLanguage.UnicodeToMS874(rs.getString("SURNAME")));
			}
			if(rs.getString("DEPARTMENT")!=null){
				alumni.setDeptName(thaiLanguage.UnicodeToMS874(rs.getString("DEPARTMENT")));
			}
		
			out.println(	"<tr>\n"+
								"   <td align=\"left\" valign=\"top\" class=\"insfont\" bgcolor=\"#E5E5F2\">&nbsp;&nbsp;&nbsp;<a href=\"alumniWork?stdID="+alumni.getAlumniID()+"\" class=\"link1\">"+alumni.getAlumniID()+"</a></td>\n"+
								"    <td align=\"left\" valign=\"top\" class=\"insfont\" bgcolor=\"#E5E5F2\">&nbsp;&nbsp;&nbsp;<a href=\"alumniWork?stdID="+alumni.getAlumniID()+"\" class=\"link1\">"+alumni.getTitle()+alumni.getName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+alumni.getSurname()+"</a></td>\n"+
								"    <td align=\"left\" valign=\"top\" class=\"insfont\" bgcolor=\"#E5E5F2\" style=\"font:16px\">&nbsp;&nbsp;&nbsp;"+alumni.getDeptName()+"</td>\n"+
								"</tr>\n");
		
		}	// end if(rs.next())
		if(cnt==0){	/// ไม่มีข้อมูลเลย
				out.println(	thaiLanguage.UnicodeToMS874("<tr><td colspan=\"3\" align=\"center\"><br><font style=\"font:16px\" color=\"#FF0000\">ไม่พบข้อมูล</font><br>"));
				out.println(	"<br><form action=\"../viewalumni.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
									"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form><br></td></tr>\n");		
		}
		out.println(	"<tr>\n"+
							"<td height=\"10\" colspan=\"3\"></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"<td height=\"3\" colspan=\"3\" align=\"left\" valign=\"bottom\" bgcolor=\"#9999CC\"></td>\n"+
							"</tr></table>");
		out.println("<br><a href=\"../viewalumni.jsp\" class=\"link1\" >"+thaiLanguage.UnicodeToMS874("ยกเลิก")+"</a>");
		out.println(htmlTemplate.getEnd());
	}	// end listAlumni
//--------------------------------------------------------------------------------------- end listAlumni

//--------------------------------------------------------------------------------------- start getGPA
	public String getGPA(String stdID,PrintWriter out)throws Exception{
		ResultSet rs;
		Statement stmt;
		String GPA="";

		connectDB(out);
		stmt = con.createStatement();	

		String sqlCommand = "SELECT GPA FROM STUDENT WHERE STD# ='"+stdID+"' ";
		rs = stmt.executeQuery(sqlCommand);
		if(rs.next()){		// มีข้อมูล
				if(rs.getString("GPA")!=null)
					GPA = rs.getString("GPA");
				else 
					GPA = "ไม่มีข้อมูล";
		}
		
		rs.close();
		stmt.close();
		closeDB();
		return GPA;

	} // end getGPA
//--------------------------------------------------------------------------------------- end getGPA	

//--------------------------------------------------------------------------------------- start getThesisComplete
	public String getThesisComplete(String stdID,PrintWriter out)throws Exception{
		ResultSet rs;
		Statement stmt;
		String complete="";

		connectDB(out);
		String sqlCommand = "SELECT COMPLETE FROM THESIS WHERE STD# ='"+stdID+"' ";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sqlCommand);
		if(rs.next()){		// มีข้อมูล
			if(rs.getString("COMPLETE")!=null){
				if(rs.getString("COMPLETE").equals("YES"))
					complete = "YES";
				else
					complete = "NO";
			}
			else
				complete = "NO";

		} // end if rs.next()
		else // ไม่มีวิทยานิพนธ์
			complete = "ไม่มีวิทยานิพนธ์";

		rs.close();
		stmt.close();
		closeDB();
		return complete;
	} // end getThesisComplete
//--------------------------------------------------------------------------------------- end getThesisComplete

//--------------------------------------------------------------------------------------- start getCheckFinist
	public checkFinish getCheckFinist(String stdID,PrintWriter out)throws Exception{
		ResultSet rs;
		Statement stmt;

		checkFinish cf = new checkFinish();
		cf.setStdID(stdID);
		connectDB(out);
		stmt = con.createStatement();

		String sql = 	"SELECT S.STD#, S.TPRE, S.TNAME, S.TFAMILY, S.SEX , S.STDSTATUS, C.TNAME AS CNAME,  "+
												"M.TNAME AS MNAME, F.TNAME AS FNAME, D.TNAME AS DNAME  "+
												"FROM STUDENT S , COURSE C , MAJOR M , FACULTY F , DEPARTMENT D  "+
												"WHERE STD# ='"+cf.getStdID()+"'  "+
												"AND C.CO# = ( SELECT CO# FROM STUDENT WHERE STD# ='"+cf.getStdID()+"')  "+
												"AND M.MAJOR# = ( SELECT MAJOR# FROM STUDENT WHERE STD# ='"+cf.getStdID()+"')  "+
												"AND F.FACT# = ( SELECT FACT# FROM STUDENT WHERE STD# ='"+cf.getStdID()+"')  "+
												"AND D.DEPT# = ( SELECT DEPT# FROM STUDENT WHERE STD# ='"+cf.getStdID()+"')  ";
		rs = stmt.executeQuery(sql);
				if(rs.next()){
							if(rs.getString("TPRE")!=null)		
								cf.setTitle(thaiLanguage.MS874ToUnicode(rs.getString("TPRE")));
							if(rs.getString("TNAME")!=null)		
								cf.setName(thaiLanguage.MS874ToUnicode(rs.getString("TNAME")));
							if(rs.getString("TFAMILY")!=null)		
								cf.setSurname(thaiLanguage.MS874ToUnicode(rs.getString("TFAMILY")));							
							if(rs.getString("CNAME")!=null)		
								cf.setCourseName(thaiLanguage.MS874ToUnicode(rs.getString("CNAME")));
							if(rs.getString("MNAME")!=null)		
								cf.setMajorName(thaiLanguage.MS874ToUnicode(rs.getString("MNAME")));
							if(rs.getString("FNAME")!=null)		
								cf.setFactName(thaiLanguage.MS874ToUnicode(rs.getString("FNAME")));
							if(rs.getString("DNAME")!=null)		
								cf.setDeptName(thaiLanguage.MS874ToUnicode(rs.getString("DNAME")));
							if(rs.getString("STDSTATUS")!=null)		
								cf.setAlumniStatus(rs.getString("STDSTATUS"));
				
				}
		rs.close();
		
		sql = "SELECT * FROM  THESIS WHERE STD#= '"+cf.getStdID()+"' ";
		rs=stmt.executeQuery(sql);
		if(rs.next()){								
					if(rs.getString("THESIS#")!=null)
						cf.setThesisID(rs.getInt("THESIS#"));	
					if(rs.getString("TOPIC_TH")!=null)
						cf.setTopic_th(rs.getString("TOPIC_TH"));
					if(rs.getString("TOPIC_EN")!=null)
						cf.setTopic_en(rs.getString("TOPIC_EN"));
		}
		rs.close();
		stmt.close();
		closeDB();

		cf.setGPA(getGPA(cf.getStdID(),out));
		cf.setThesisComplete(getThesisComplete(cf.getStdID(),out));		
		return cf;	
	} // end getCheckFinist
//--------------------------------------------------------------------------------------- end getCheckFinist

//--------------------------------------------------------------------------------------- start approveFinish
	public void approveFinish(String stdID,PrintWriter out)throws Exception{

		PreparedStatement pstmt;		
		
		connectDB(out);		

		String sqlCommand = "UPDATE STUDENT SET STDSTATUS = 'A' WHERE STD# = '"+stdID+"' ";
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();
		closeDB();	
		connectDB(out);		
	
	}		// approveFinish
//--------------------------------------------------------------------------------------- end approveFinish



	//  ###########    doPost       #################
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();
		
		if(request.getParameter("getStdInfo") != null){		// get ข้อมูลนีกศึกษา
			if(session.getAttribute("login")==null){
				response.sendRedirect("../loginfail.jsp");
				return;
			}
			String stdID = request.getParameter("stdID");
			String academicYear = request.getParameter("academicYear");
			// ตรวจสอบดูว่ามีข้อมูลนักศึกษาอยู่หรือเปล่า
			Statement stmt;
			ResultSet rs;
			try{
					connectDB(out);
					String sqlCommand = "SELECT * FROM STUDENT WHERE STD#='"+stdID+"' ";
					stmt = con.createStatement();
					rs = stmt.executeQuery(sqlCommand);
					if(rs.next()){	// มีข้อมูลอยู่
							rs.close();
							stmt.close();
							closeDB();
							session.setAttribute("getStdInfo",stdID);
							session.setAttribute("academicYear",academicYear);
							response.sendRedirect("../addalumni.jsp");
					}
					else{	// ไม่มีข้อมูลนักศึกษาอยู่
							rs.close();
							stmt.close();
							closeDB();
							out.println(htmlTemplate.getStart("","<font class=\"pathfont\"><a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> สำเร็จการศึกษา >> <a href=\"../addalumni.jsp\" class=\"pathlink2\">บันทึกประวัติผู้สำเร็จการศึกษา</a></font>","บันทึกประวัติผู้สำเร็จการศึกษา"));
							out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลนักศึกษาที่ระบุ</font>"));
							out.println(	"<br><form action=\"../addalumni.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
												"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
												"</form>\n");								
							out.println(htmlTemplate.getEnd());
							return;							
					}
			}
			catch (SQLException e){out.println("request.getParameter(\"getStdInfo\") SQLException in thesisWork.java  : "+e.getMessage());return;}
			catch (Exception e){out.println("request.getParameter(\"getStdInfo\") Exception in thesisWork.java : "+e.getMessage());return;} 
		} //   if(request.getParameter("getStdInfo")
		else if(request.getParameter("addAlumni") != null){		//		เพิ่มข้อมูลผู้สำเร็จการศึกษา
			String alumniID = request.getParameter("stdID");
			if(session.getAttribute("login")==null){
				response.sendRedirect("../loginfail.jsp");
				return;
			}
			//	 เช็คข้อมูลว่ามีอยู่แล้วหรืไม่หรือไม่
			String sqlCommand = "SELECT * FROM ALUMNI WHERE ALUMNI#='"+alumniID+"' ";
			try{
				if(isExist(sqlCommand,out)){  /// มีข้อมูลอยู่แล้ว
					out.println(htmlTemplate.getStart("","<font class=\"pathfont\"><a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> สำเร็จการศึกษา >> <a href=\"../addalumni.jsp\" class=\"pathlink2\">บันทึกประวัติผู้สำเร็จการศึกษา</a></font>","บันทึกประวัติผู้สำเร็จการศึกษา"));
					out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่สามารถบันทึกประวัตินักศึกษาคนนี้ได้<br>เนื่องจากมีประวัตินักศึกษาคนนี้อยู่แล้ว</font>"));
					out.println(	"<br><form action=\"../addalumni.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
					out.println(htmlTemplate.getEnd());
					return;
				}

			// บันทึกประวัตินักศึกษา
				sqlCommand = getAlumniInfo(request,out);
				addAlumni(sqlCommand,out);

				out.println(htmlTemplate.getStart("","<font class=\"pathfont\"><a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> สำเร็จการศึกษา >> <a href=\"../addalumni.jsp\" class=\"pathlink2\">บันทึกประวัติผู้สำเร็จการศึกษา</a></font>","บันทึกประวัติผู้สำเร็จการศึกษา"));
				out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">บันทึกประวัติผู้สำเร็จการศึกษาเรียบร้อยแล้ว</font>"));
				out.println(	"<br><form action=\"../addalumni.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
				out.println(htmlTemplate.getEnd());
				return;


			}
			catch (SQLException e){out.println("request.getParameter(\"getStdInfo\") SQLException in thesisWork.java  : "+e.getMessage());return;}
			catch (Exception e){out.println("request.getParameter(\"getStdInfo\") Exception in thesisWork.java : "+e.getMessage());return;} 
			
		}  //   end if(request.getParameter("addAlumni")	
		
		else if(request.getParameter("viewAlumniFromStdID") != null){	// ดูข้อมูลผู้สำเร็จการศึกษา ตามรหัสนักศึกษา
			if(session.getAttribute("login")==null){
				response.sendRedirect("../loginfail.jsp");
				return;
			}			
			String stdID=request.getParameter("stdID");
			String sqlCommand = "SELECT * FROM ALUMNI WHERE ALUMNI# ='"+stdID+"' ";
			try{
				if(!isExist(sqlCommand,out)){  /// ไม่มีข้อมูลอยู่
					out.println(htmlTemplate.getStart("","<font class=\"pathfont\"><a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> สำเร็จการศึกษา >> <a href=\"../viewalumni.jsp\" class=\"pathlink2\">ดูประวัติผู้สำเร็จการศึกษา</a></font>","ดูประวัติผู้สำเร็จการศึกษา"));
					out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบประวัติผู้สำเร็จการศึกษา ตามที่ระบุรหัสนักศึกษามา</font>"));
					out.println(	"<br><form action=\"../viewalumni.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
					out.println(htmlTemplate.getEnd());
					return;
				}
							
				// ดูประวัตินักศึกษา
				sqlCommand = "SELECT * FROM ALUMNI WHERE ALUMNI# ='"+stdID+"' ";
				viewAlumni(sqlCommand,out);
			}
			catch (SQLException e){out.println("request.getParameter(\"viewAlumniFromStdID\") SQLException in thesisWork.java  : "+e.getMessage());return;}
			catch (Exception e){out.println("request.getParameter(\"viewAlumniFromStdID\") Exception in thesisWork.java : "+e.getMessage());return;} 
		}  //   end if(request.getParameter("viewAlumniFromStdID")

		else if(request.getParameter("viewAlumniFromYF") != null){	// ดูข้อมูลผู้สำเร็จการศึกษา ตามปีการศึกษา และ คณะ
			if(session.getAttribute("login")==null){
				response.sendRedirect("../loginfail.jsp");
				return;
			}
			
			String academicYear=request.getParameter("academicYear");
			String fact = thaiLanguage.MS874ToUnicode(request.getParameter("fact"));
			String sqlCommand =	"SELECT * FROM ALUMNI WHERE ACADEMICYEAR ='"+academicYear+"' "+
													"AND FACULTY = '"+fact+"' ORDER BY NAME";
				// ดูประวัตินักศึกษา
			try{
				listAlumni(sqlCommand,academicYear,fact,out);
			}
			catch (SQLException e){out.println("request.getParameter(\"viewAlumniFromYF\") SQLException in thesisWork.java  : "+e.getMessage());return;}
			catch (Exception e){out.println("request.getParameter(\"viewAlumniFromYF\") Exception in thesisWork.java : "+e.getMessage());return;} 
		}  //   end if(request.getParameter("viewAlumniFromYF")
		
		else if(request.getParameter("deleteAlumni") != null){	// ลบข้อมูลผู้สำเร็จการศึกษา
				if(session.getAttribute("login")==null){
					response.sendRedirect("../loginfail.jsp");
					return;
				}				
				String stdID = "";
				if(request.getParameter("stdID")!=null)
					stdID= (request.getParameter("stdID"));
				try{
					deleteAlumni(stdID,out);
				}
				catch (SQLException e){out.println("request.getParameter(\"deleteAlumni\") SQLException in thesisWork.java  : "+e.getMessage());return;}
				catch (Exception e){out.println("request.getParameter(\"deleteAlumni\") Exception in thesisWork.java : "+e.getMessage());return;} 

				out.println(htmlTemplate.getStart("","<font class=\"pathfont\"><a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> สำเร็จการศึกษา >> <a href=\"../viewalumni.jsp\" class=\"pathlink2\">ดูประวัติผู้สำเร็จการศึกษา</a></font>","ดูประวัติผู้สำเร็จการศึกษา"));
				out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"insfont\" style=\"font:16px\">ลบข้อมูลเรียบร้อยแล้ว</font>"));
				out.println(	"<br><form action=\"../viewalumni.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
				out.println(htmlTemplate.getEnd());				
	
		}  //   end if(request.getParameter("deleteAlumni")

		else if(request.getParameter("cancelView") != null){	// ยกเลิกลบข้อมูลผู้สำเร็จการศึกษา
			if(session.getAttribute("login")==null){
				response.sendRedirect("../loginfail.jsp");
				return;
			}			
			response.sendRedirect("../viewalumni.jsp");
	
		}  //   end if(request.getParameter("cancelView")

		else if(request.getParameter("cancelAddAlumni") != null){	// ยกเลิกเพิ่มข้อมูลผู้สำเร็จการศึกษา
			if(session.getAttribute("login")==null){
				response.sendRedirect("../loginfail.jsp");
				return;
			}
			response.sendRedirect("../addalumni.jsp");
	
		}  //   end if(request.getParameter("ancelAddAlumni")
		else if(request.getParameter("getCheckFinish")!=null){	// อนุมัติจบการศึกษา
			String stdID ="";
			checkFinish cf;
			if(request.getParameter("stdID")!=null)
				stdID = request.getParameter("stdID");
			try{

					String sqlCommand = "SELECT * FROM STUDENT WHERE STD# ='"+stdID+"' ";

					if(!isExist(sqlCommand,out)){  /// ไม่มีข้อมูลอยู่
						out.println(htmlTemplate.getStart("","<font class=\"pathfont\"><a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> สำเร็จการศึกษา >> <a href=\"../checkfinish.jsp\" class=\"pathlink2\">อนุมัติจบการศึกษา</a></font>","อนุมัติจบการศึกษา"));
						out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลการศึกษา</font>"));
						out.println(	"<br><form action=\"../checkfinish.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
											"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");								
						out.println(htmlTemplate.getEnd());
						return;
					}

					cf=getCheckFinist(stdID,out);
					session.setAttribute("finishInfo",cf);
					response.sendRedirect("../checkfinish.jsp");
					return;
			}
			catch (SQLException e){out.println("request.getParameter(\"getCheckFinish\") SQLException in servlet  : "+e.getMessage());return;}
			catch (Exception e){out.println("request.getParameter(\"getCheckFinish\") Exception in servlet : "+e.getMessage());return;} 

		}	// if(request.getParameter("getCheckFinish")

		else if(request.getParameter("approveFinish")!=null){	// อนุมัติจบการศึกษา			
				
				String stdID = request.getParameter("stdID");
				String academicYear = request.getParameter("academicYear");		
				try{			
						approveFinish(stdID,out);
				}
				catch (SQLException e){out.println("request.getParameter(\"approveFinish\") SQLException in servlet alumniWork : "+e.getMessage());return;}
				catch (Exception e){out.println("request.getParameter(\"approveFinish\") Exception in servlet alumniWork : "+e.getMessage());return;} 

				session.setAttribute("getStdInfo",stdID);
				session.setAttribute("academicYear",academicYear);
				response.sendRedirect("../addalumni.jsp");		

		} // end if(request.getParameter("approveFinish")

		else if(request.getParameter("cancelFinish")!=null){	// ยกเลิกอนุมัติจบการศึกษา			
				session.removeAttribute("finishInfo");
				response.sendRedirect("../checkfinish.jsp");

		} // end if(request.getParameter("cancelFinish")

		else if(request.getParameter("getListAlumni")!=null){	// ของทำเนียบผู้สำเร็จการศึกษา
				String academicYear = request.getParameter("academicYear");
				String factName = thaiLanguage.MS874ToUnicode(request.getParameter("factName"));
				try{
						getListAlumni(academicYear,factName,out);
				}
				catch (SQLException e){out.println("request.getParameter(getAlumni) SQLException in thesisWork.java  : "+e.getMessage());return;}
				catch (Exception e){out.println("request.getParameter(getAlumni) Exception in thesisWork.java : "+e.getMessage());return;} 
		}

	
	} // end doPost

//-----------------------------------------------------------------------------------------------------  start getListAlumni
	public void getListAlumni(String academicYear,String factName,PrintWriter out)throws Exception{  //  ของทำเนียบผู้สำเร็จการศึกษา
			ResultSet rs;
			Statement stmt;
			Alumni alumni = new Alumni();
			//  list ข้อมูลประวัตินักศึกษาที่จบไปแล้วตามปีการศึกษาที่จบ และ คณะ ของทำเนียบอาจารย์บัณฑิต
		
			out.println(htmlTemplate.getListStart("alumniband.gif","ทำเนียบผู้สำเร็จการศึกษา"));
			out.println(thaiLanguage.UnicodeToMS874("<font  class=\"topic\">บัณฑิตวิทยาลัย<br>สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</font>"));
			
			out.println(	"<br><br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\" rules=\"rows\">\n"+
								"<tr>\n"+
								"	<td valign=\"bottom\" align=\"center\" bgcolor=\"#9999CC\"><font class=\"topic\" ><b>"+thaiLanguage.UnicodeToMS874("ปีการศึกษา&nbsp;&nbsp;"+academicYear+
									"&nbsp;&nbsp;&nbsp;&nbspคณะ&nbsp;&nbsp;"+factName)+"</b></font></td>\n"+
								"</tr>\n"+
								"	<td valign=\"top\" align=\"left\" height=\"10\"></td>\n"+  // empty
								"</tr>\n"+
								"<tr>\n"+	 // Cover
								"	<td valign=\"top\" align=\"left\" height=\"10\">\n"+	// Cover
								"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\"  frame=\"void\" rules=\"rows\">\n"+
								"<tr> \n"+
								"	<td width=\"120\" bgcolor=\"#D6D6EB\" height=\"30\" align=\"left\" valign=\"bottom\"><font class=\"topic\" style=\"font:18px\">&nbsp;&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("<b>รหัสนักศึกษา</b>")+"</font></td>\n"+
								"   <td width=\"220\" bgcolor=\"#D6D6EB\" align=\"left\" valign=\"bottom\"><font class=\"topic\" style=\"font:18px\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อ - นามสกุล</b>")+"</font></td>\n"+
								"   <td width=\"310\" bgcolor=\"#D6D6EB\" align=\"left\" valign=\"bottom\"><font class=\"topic\" style=\"font:18px\">"+thaiLanguage.UnicodeToMS874("<b>ภาควิชา</b>")+"</font></td>\n"+
								"</tr>\n");
			
			String sqlCommand =	"SELECT * FROM ALUMNI WHERE ACADEMICYEAR ='"+academicYear+"' "+
													"AND FACULTY = '"+factName+"' ORDER BY NAME";
			connectDB(out);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sqlCommand);
			int cnt=0;
			while(rs.next()){		// มีข้อมูล
				cnt++;
				if(rs.getString("ALUMNI#")!=null){
					alumni.setAlumniID(thaiLanguage.UnicodeToMS874(rs.getString("ALUMNI#")));
				}
				if(rs.getString("ACADEMICYEAR")!=null){
					alumni.setAcademicYear(thaiLanguage.UnicodeToMS874(rs.getString("ACADEMICYEAR")));
				}
				if(rs.getString("TITLE")!=null){
					alumni.setTitle(thaiLanguage.UnicodeToMS874(rs.getString("TITLE")));
				}
				if(rs.getString("NAME")!=null){
					alumni.setName(thaiLanguage.UnicodeToMS874(rs.getString("NAME")));
				}
				if(rs.getString("SURNAME")!=null){
					alumni.setSurname(thaiLanguage.UnicodeToMS874(rs.getString("SURNAME")));
				}
				if(rs.getString("DEPARTMENT")!=null){
					alumni.setDeptName(thaiLanguage.UnicodeToMS874(rs.getString("DEPARTMENT")));
				}
		
				out.println(	"<tr>\n"+
								"   <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\">&nbsp;&nbsp;<a href=\"alumniWork?getViewAlumni="+alumni.getAlumniID()+"\" class=\"mylink\">"+alumni.getAlumniID()+"</a></td>\n"+
								"    <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><a href=\"alumniWork?getViewAlumni="+alumni.getAlumniID()+"\" class=\"mylink\">"+alumni.getTitle()+alumni.getName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+alumni.getSurname()+"</a></td>\n"+
								"    <td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"myfont\">"+alumni.getDeptName()+"</font></td>\n"+
								"</tr>\n");
		
			}	// end while(rs.next())
			if(cnt==0){	/// ไม่มีข้อมูลเลย
				out.println(	thaiLanguage.UnicodeToMS874("<tr><td colspan=\"3\" align=\"center\"><br><font  style=\"font:16px\" color=\"#FF0000\">ไม่พบข้อมูล</font><br>"));
				out.println(	"<br><form action=\"../alumni.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
									"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form><br></td></tr>\n");		
			}
		out.println(	"</table>\n"+
							"</td>\n"+		// Cover
							"</tr>\n"+		// Cover
							"<tr>\n"+
							"<td height=\"10\"></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+
							"<td height=\"3\" align=\"left\" valign=\"bottom\" bgcolor=\"#9999CC\"></td>\n"+
							"</tr></table>\n");
		if(cnt!=0){
				out.println(	"<br><form action=\"../alumni.jsp\" method=\"post\" name=\"form1\" >\n"+
									"<input name=\"ok\" type=\"submit\" value=\"&nbsp;&nbsp;&nbsp;back&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
									"</form>");
		}
			out.println(htmlTemplate.getListEnd());
	} // end getListAlumni

//-----------------------------------------------------------------------------------------------------  end getListAlumni

//--------------------------------------------------------------------------------------- start getViewAlumni ของทำเนียบนักศึกษาที่สำเร็จการศึกษา
	public void getViewAlumni(String alumniID,PrintWriter out)throws Exception{
		ResultSet rs;
		Statement stmt;
		Alumni alumni = new Alumni();
		
		//  get ข้อมูลประวัตินักศึกษาที่จบไปแล้ว
		
		alumni.setAlumniID(alumniID);

		connectDB(out);
		stmt = con.createStatement();

		String sqlCommand = "SELECT * FROM ALUMNI WHERE ALUMNI# ='"+alumni.getAlumniID()+"' ";
		rs = stmt.executeQuery(sqlCommand);
		if(rs.next()){		// มีข้อมูล
		
			if(rs.getString("ALUMNI#")!=null){
				alumni.setAlumniID(thaiLanguage.UnicodeToMS874(rs.getString("ALUMNI#")));
			}
			if(rs.getString("ACADEMICYEAR")!=null){
				alumni.setAcademicYear(thaiLanguage.UnicodeToMS874(rs.getString("ACADEMICYEAR")));
			}
			if(rs.getString("TITLE")!=null){
				alumni.setTitle(thaiLanguage.UnicodeToMS874(rs.getString("TITLE")));
			}
			if(rs.getString("NAME")!=null){
				alumni.setName(thaiLanguage.UnicodeToMS874(rs.getString("NAME")));
			}
			if(rs.getString("SURNAME")!=null){
				alumni.setSurname(thaiLanguage.UnicodeToMS874(rs.getString("SURNAME")));
			}
			if(rs.getString("SEX")!=null){
				alumni.setSex(thaiLanguage.UnicodeToMS874(rs.getString("SEX")));
			}
			if(rs.getString("COURSE")!=null){
				alumni.setCourseName(thaiLanguage.UnicodeToMS874(rs.getString("COURSE")));
			}
			if(rs.getString("MAJOR")!=null){
				alumni.setMajorName(thaiLanguage.UnicodeToMS874(rs.getString("MAJOR")));
			}
			if(rs.getString("FACULTY")!=null){
				alumni.setFactName(thaiLanguage.UnicodeToMS874(rs.getString("FACULTY")));
			}
			if(rs.getString("DEPARTMENT")!=null){
				alumni.setDeptName(thaiLanguage.UnicodeToMS874(rs.getString("DEPARTMENT")));
			}
			if(rs.getString("RESEARCHTYPE")!=null){
				alumni.setResearchType(thaiLanguage.UnicodeToMS874(rs.getString("RESEARCHTYPE")));
			}
			if(rs.getString("TOPIC_TH")!=null){
				alumni.setResearchTopic_th(thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_TH")));
			}
			if(rs.getString("TOPIC_EN")!=null){
				alumni.setResearchTopic_en(thaiLanguage.UnicodeToMS874(rs.getString("TOPIC_EN")));
			}
			if(rs.getString("SUPERVISOR_AA")!=null){
				alumni.setSuperAcademicAffiliation(thaiLanguage.UnicodeToMS874(rs.getString("SUPERVISOR_AA")));
			}
			if(rs.getString("SUPERVISORNAME")!=null){
				alumni.setSuperName(thaiLanguage.UnicodeToMS874(rs.getString("SUPERVISORNAME")));
			}
			if(rs.getString("SUPERVISORSURNAME")!=null){
				alumni.setSuperSurname(thaiLanguage.UnicodeToMS874(rs.getString("SUPERVISORSURNAME")));
			}
			if(rs.getString("J_SUPERVISOR1_AA")!=null){
				alumni.setJoin1AcademicAffiliation(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR1_AA")));
			}
			if(rs.getString("J_SUPERVISOR1_NAME")!=null){
				alumni.setJoin1Name(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR1_NAME")));
			}
			if(rs.getString("J_SUPERVISOR1_SURNAME")!=null){
				alumni.setJoin1Surname(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR1_SURNAME")));
			}
			if(rs.getString("J_SUPERVISOR2_AA")!=null){
				alumni.setJoin2AcademicAffiliation(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR2_AA")));
			}
			if(rs.getString("J_SUPERVISOR2_NAME")!=null){
				alumni.setJoin2Name(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR2_NAME")));
			}
			if(rs.getString("J_SUPERVISOR2_SURNAME")!=null){
				alumni.setJoin2Surname(thaiLanguage.UnicodeToMS874(rs.getString("J_SUPERVISOR2_SURNAME")));
			}
			if(!rs.getString("BIRTHDAY").equals("")){
				alumni.setBirthday(thaiLanguage.UnicodeToMS874(myDate.getThaiDate(rs.getString("BIRTHDAY"))));
			}	

			// OldBaechelor
			if(rs.getString("OLD_BDEGREE")!=null){
				alumni.setOldBaechelorDegree(thaiLanguage.UnicodeToMS874(rs.getString("OLD_BDEGREE")));
			}
			if(rs.getString("OLD_BINSTITUTE")!=null){
				alumni.setOldBaechelorIntitute(thaiLanguage.UnicodeToMS874(rs.getString("OLD_BINSTITUTE")));
			}
			if(rs.getString("OLD_BYEAR")!=null){
				alumni.setOldBaechelorYear(thaiLanguage.UnicodeToMS874(rs.getString("OLD_BYEAR")));
			}

			// OldMaster
			if(rs.getString("OLD_MDEGREE")!=null){
				alumni.setOldMasterDegree(thaiLanguage.UnicodeToMS874(rs.getString("OLD_MDEGREE")));
			}
			if(rs.getString("OLD_MINSTITUTE")!=null){
				alumni.setOldMasterIntitute(thaiLanguage.UnicodeToMS874(rs.getString("OLD_MINSTITUTE")));
			}
			if(rs.getString("OLD_MYEAR")!=null){
				alumni.setOldMasterYear(thaiLanguage.UnicodeToMS874(rs.getString("OLD_MYEAR")));
			}

			if(rs.getString("PAPER")!=null){
				alumni.setPaper(thaiLanguage.UnicodeToMS874(rs.getString("PAPER")));
			}
			if(rs.getString("AWARD")!=null){
				alumni.setAward(thaiLanguage.UnicodeToMS874(rs.getString("AWARD")));
			}
			if(rs.getString("EXPERIENCE")!=null){
				alumni.setExperience(thaiLanguage.UnicodeToMS874(rs.getString("EXPERIENCE")));
			}
			if(rs.getString("WORK")!=null){
				alumni.setWork(thaiLanguage.UnicodeToMS874(rs.getString("WORK")));
			}
			if(rs.getString("OFFICEADDRESS")!=null){
				alumni.setOfficeAddress(thaiLanguage.UnicodeToMS874(rs.getString("OFFICEADDRESS")));
			}
			if(rs.getString("OFFICETELEPHONE")!=null){
				alumni.setOfficeTelephone(thaiLanguage.UnicodeToMS874(rs.getString("OFFICETELEPHONE")));
			}
			if(rs.getString("ADDRESS")!=null){
				alumni.setAddress(thaiLanguage.UnicodeToMS874(rs.getString("ADDRESS")));
			}
			if(rs.getString("TELEPHONE")!=null){
				alumni.setTelephone(thaiLanguage.UnicodeToMS874(rs.getString("TELEPHONE")));
			}
			if(rs.getString("EMAIL")!=null){
				alumni.setEmail(thaiLanguage.UnicodeToMS874(rs.getString("EMAIL")));
			}
		} // end if(rs.next())
		else{
				rs.close();
				stmt.close();
				closeDB();
				out.println(htmlTemplate.getListStart("alumniband.gif","ทำเนียบผู้สำเร็จการศึกษา"));
				out.println(	thaiLanguage.UnicodeToMS874("<br><font style=\"font:16px\" color=\"#FF0000\">ไม่พบข้อมูล</font><br>"));
				out.println(	"<br><form action=\"../alumni.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
									"<input type=\"submit\" name=\"ok\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form><br>\n");	
				out.println(htmlTemplate.getListEnd());
				return;
		}
		rs.close();
		stmt.close();
		closeDB();

		// แสดงข้อมูลประวัตินักศึกษาที่จบไปแล้ว
		out.println(htmlTemplate.getListStart("alumniband.gif","ทำเนียบผู้สำเร็จการศึกษา"));
		out.println(thaiLanguage.UnicodeToMS874("<font  class=\"topic\">บัณฑิตวิทยาลัย<br>สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</font>"));
		out.println(	thaiLanguage.UnicodeToMS874("<br><font class=\"topic\" >ปีการศึกษาที่จบ&nbsp;&nbsp;"+alumni.getAcademicYear()+
							"&nbsp;&nbsp;&nbsp;&nbspคณะ&nbsp;&nbsp;"+alumni.getFactName()+"</font><br>"));

		out.println(	"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#E8EBF6\">\n"+
							"<tr> \n"+
							"   <td colspan=\"2\" align=\"left\" height=\"30\" bgcolor=\"#9999CC\" valign=\"bottom\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ประวัติการศึกษา")+"</font></td>\n"+
							"</tr>\n"+							
							"<tr>\n"+
							"	<td align=\"right\" valign=\"bottom\" width=\"200\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ปีการศึกษาที่จบ")+"&nbsp;</font></td>\n"+
							"	<td align=\"left\" valign=\"bottom\" width=\"450\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getAcademicYear()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("รหัสนักศึกษา")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getAlumniID()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ชื่อ")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getTitle()+alumni.getName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+alumni.getSurname()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("เพศ")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getSex()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("หลักสูตร")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getCourseName()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("สาขา")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getMajorName()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("คณะ")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getFactName()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ภาควิชา")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getDeptName()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("งานวิจัย")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getResearchType()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ชื่องานวิจัย(ไทย)")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getResearchTopic_th()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ชื่องานวิจัย(อังกฤษ)")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getResearchTopic_en()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("อาจารย์ผู้ควบคุม")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getSuperAcademicAffiliation()+alumni.getSuperName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+alumni.getSuperSurname()+"</font></td>\n"+
							"</tr>\n");
				if(!alumni.getJoin1Name().equals("")){
					out.print(	"<tr>\n"+
									"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("อาจารย์ผู้ควบคุมร่วม")+"&nbsp;</font></td>\n"+
									"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getJoin1AcademicAffiliation()+alumni.getJoin1Name()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+alumni.getJoin1Surname()+"</font></td>\n"+
									"</tr>\n");
				}
				if(!alumni.getJoin2Name().equals("")){
					out.print(	"<tr>\n"+
									"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"></td>\n"+
									"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getJoin2AcademicAffiliation()+alumni.getJoin2Name()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+alumni.getJoin2Surname()+"</font></td>\n"+
									"</tr>\n");
				}
							
			out.print(	"<tr> \n"+
							"   <td colspan=\"2\" align=\"left\" height=\"30\" bgcolor=\"#9999CC\" valign=\"bottom\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ประวัตินักศึกษา")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("วัน/เดือน/ปี เกิด")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getBirthday()+"</font></td>\n"+
							"</tr>\n"+
							"<tr> \n"+
							"   <td colspan=\"2\" align=\"left\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">&nbsp;&nbsp;&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ประวัติการศึกษาปริญาตรี")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("วุฒิการศึกษาปริญญาตรี")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getOldBaechelorDegree()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("สถานศึกษา")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getOldBaechelorIntitute()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ปีที่สำเร็จ")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getOldBaechelorYear()+"</font></td>\n"+
							"</tr>\n"+
							"<tr> \n"+
							"   <td colspan=\"2\" align=\"left\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">&nbsp;&nbsp;&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ประวัติการศึกษาปริญาโท")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("วุฒิการศึกษาปริญญาโท")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getOldMasterDegree()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("สถานศึกษา")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getOldMasterIntitute()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ปีที่สำเร็จ")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getOldMasterYear()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ผลงานวิชาการ")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getPaper()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("รางวัลหรือทุนที่เคยได้รับ")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getAward()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ประสบการณ์ทำงาน")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getExperience()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("อาชีพปัจจุบัน")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getWork()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("สถานที่ทำงาน")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getOfficeAddress()+"<br>"+thaiLanguage.UnicodeToMS874("โทรศัพท์&nbsp;&nbsp;")+alumni.getOfficeTelephone()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ที่อยู่ปัจจุบัน")+"&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">"+alumni.getAddress()+"<br>"+thaiLanguage.UnicodeToMS874("โทรศัพท์&nbsp;&nbsp;")+alumni.getTelephone()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"  <td align=\"right\" valign=\"bottom\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">email&nbsp;</font></td>\n"+
							"  <td align=\"left\" valign=\"bottom\" bgcolor=\"#CBD2F4\"><a class=\"amail\" href=\"mailto:"+alumni.getEmail()+"\">"+alumni.getEmail()+"</a></td>\n"+
							"</tr>\n"+
							"<tr> \n"+
							"   <td colspan=\"2\" align=\"left\" height=\"10\" bgcolor=\"#9999CC\" valign=\"bottom\"></td>\n"+
							"</tr>\n"+
							"</table><br>\n");
					out.println(	"<form action=\"alumniWork\" method=\"post\" name=\"form1\" ><br>\n"+
										"<input type=\"hidden\" name=\"academicYear\" value=\""+alumni.getAcademicYear()+"\">"+
										"<input type=\"hidden\" name=\"factName\" value=\""+alumni.getFactName()+"\">"+
										"<input type=\"submit\" name=\"getListAlumni\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;&nbsp;back&nbsp;&nbsp;&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");

					out.println(htmlTemplate.getListEnd());

	} //  end getViewAlumni
//--------------------------------------------------------------------------------------- end getViewAlumni ของทำเนียบนักศึกษาที่สำเร็จการศึกษา

	// ############### doGet #######################	
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		// get database server
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("stdID")!=null){

			if(session.getAttribute("login")==null){
				response.sendRedirect("../loginfail.jsp");
				return;
			}
			String stdID=request.getParameter("stdID");
			String sqlCommand = "SELECT * FROM ALUMNI WHERE ALUMNI# ='"+stdID+"' ";
			try{
				if(!isExist(sqlCommand,out)){  /// ไม่มีข้อมูลอยู่
					out.println(htmlTemplate.getStart("","<font class=\"pathfont\"><a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> สำเร็จการศึกษา >> <a href=\"../viewalumni.jsp\" class=\"pathlink2\">ดูประวัติผู้สำเร็จการศึกษา</a></font>","ดูประวัติผู้สำเร็จการศึกษา"));
					out.println(thaiLanguage.UnicodeToMS874("<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบประวัติผู้สำเร็จการศึกษา ตามที่ระบุรหัสนักศึกษามา</font>"));
					out.println(	"<br><form action=\"../viewalumni.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
					out.println(htmlTemplate.getEnd());
					return;
				}
							
				// ดูประวัตินักศึกษา
				sqlCommand = "SELECT * FROM ALUMNI WHERE ALUMNI# ='"+stdID+"' ";
				viewAlumni(sqlCommand,out);
			}
			catch (SQLException e){out.println("request.getParameter(\"viewAlumniFromStdID\") SQLException in thesisWork.java  : "+e.getMessage());return;}
			catch (Exception e){out.println("request.getParameter(\"viewAlumniFromStdID\") Exception in thesisWork.java : "+e.getMessage());return;} 
		} // end if(request.getParameter("stdID"))

		if(request.getParameter("getViewAlumni")!=null){	// ของทำเนียบผู้สำเร็จการศึกษา
			String alumniID=request.getParameter("getViewAlumni");
			String sqlCommand = "SELECT * FROM ALUMNI WHERE ALUMNI# ='"+alumniID+"' ";
			try{
						getViewAlumni(alumniID,out);
			}
			catch (SQLException e){out.println("request.getParameter(\"viewAlumniFromStdID\") SQLException in thesisWork.java  : "+e.getMessage());return;}
			catch (Exception e){out.println("request.getParameter(\"viewAlumniFromStdID\") Exception in thesisWork.java : "+e.getMessage());return;} 

		}	// if(request.getParameter("getViewAlumni")

	} // end doGet

}  // end class alumniWork