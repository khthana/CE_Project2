import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import lecturer.Lecturer;
import myutil.server;
import myutil.thaiLanguage;
import myutil.htmlTemplate;
public class lecturerInfo extends HttpServlet{
	private String url = "";
	private String user = "";
	private String passwd = "";
	private Connection con;
	private Statement stmt;
	private ResultSet rs;

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

	public void closeDB(){
		try{
			con.close( );
        }catch (SQLException e){System.err.print(e.getMessage());return;}
	}
	// -------------------   ดูข้อมูลอาจารย์ ------------------------------------------------------------------------------------------------
	public boolean getLecturerInfo(String sqlCommand,String lecID,PrintWriter out)throws Exception{
	String lecturerID="";
	String title_th="";
	String name_th="";
	String surname_th="";
	String title_en="";
	String name_en="";
	String surname_en="";
	String sex="";
	String birthday="";
	String adminPosition="";
	String contactAddress="";
	String telephone="";
	String fax="";
	String email="";
	String url="";
	String academicAffiliation="";
	String qualification="";
	String experience="";
	String[] expertise={"","","","","","","","","",""};		// -- array
	String B_institute="";
	String B_year="";
	String B_major="";
	String B_degree="";
	String M_institute="";
	String M_year="";
	String M_major="";
	String M_degree="";
	String D_institute="";
	String D_year="";
	String D_major="";
	String D_degree="";
	String O_institute="";
	String O_year="";
	String O_major="";
	String O_degree="";
	String memberStatus="";
	String M_teachCourse="";
	String M_examThesis="";
	String M_superviseThesis="";
	String D_teachCourse="";
	String D_examThesis="";
	String D_superviseThesis="";
	String faculty="";
	String factID="";
	String department="";
	String deptID="";
	String major="";
	String majorID="";
	int courseID[] ={0,0,0,0,0,0,0,0,0,0};
	String[] cfactID={"","","","","","","","","",""};
	String[] cmajorID={"","","","","","","","","",""};
	String[] teachFaculty={"","","","","","","","","",""};
	String[] teachCourse={"","","","","","","","","",""};
	String[] teachMajor={"","","","","","","","","",""};
			
			connectDB(out);
			//   select data from table expertise
			stmt = con.createStatement();
			String sql="SELECT * FROM  LECTUREREXPERTISE WHERE LECTURER#='"+lecID+"'";
			rs = stmt.executeQuery(sql);
			int i=0;
			//out.println("get expertise "+sql);  // for test
			while(rs.next()){
				if(rs.getString("EXPERTISE")!=null)
					expertise[i] = thaiLanguage.UnicodeToMS874(rs.getString("EXPERTISE"));
				i++;
			}
			rs.close();			
			//out.println("end get expertise");  // for test

			//   select data from table courseteaching
			sql="SELECT * FROM	COURSETEACHING WHERE LECTURER#='"+lecID+"'";
			rs = stmt.executeQuery(sql);
			i=0;
			while(rs.next()){
				courseID[i] = rs.getInt("CO#");
				i++;
			}
			rs.close();
			
			

			// select ชื่อ หลักสูตร ชื่อคณะ ชื่อสาขา 
			for (int j=0;j<courseID.length;j++){
				if(courseID[j]!=0){
					sql = "SELECT C.TNAME  AS CNAME, F.TNAME  AS FNAME, M.TNAME AS MNAME FROM COURSE C,FACULTY F,MAJOR M "+
							 "WHERE C.CO#="+courseID[j]+" AND F.FACT#= (select FACT# from COURSE  where CO#="+courseID[j]+") "+
							 "AND M.MAJOR# = (select MAJOR# from COURSE  where CO#="+courseID[j]+") ";
					rs = stmt.executeQuery(sql);
					if(rs.next()){
						if(rs.getString("CNAME")!=null)
							teachCourse[j] = thaiLanguage.UnicodeToMS874(rs.getString("CNAME"));
						if(rs.getString("FNAME")!=null)
							teachFaculty[j] =thaiLanguage.UnicodeToMS874(rs.getString("FNAME"));
						if(rs.getString("MNAME")!=null)
							teachMajor[j] =thaiLanguage.UnicodeToMS874(rs.getString("MNAME"));
					}
					rs.close();
				}
			}

			rs = stmt.executeQuery(sqlCommand);			
			int cnt=0;
			while(rs.next()){
					cnt++;
					if(rs.getString("LECTURER#")!=null)
						lecturerID=thaiLanguage.UnicodeToMS874(rs.getString("LECTURER#"));
					if(rs.getString("TITLE_TH")!=null)
						title_th=thaiLanguage.UnicodeToMS874(rs.getString("TITLE_TH"));
					if(rs.getString("NAME_TH")!=null)
						name_th=thaiLanguage.UnicodeToMS874(rs.getString("NAME_TH"));
					if(rs.getString("SURNAME_TH")!=null)
						surname_th=thaiLanguage.UnicodeToMS874(rs.getString("SURNAME_TH"));
					if(rs.getString("TITLE_EN")!=null)
						title_en=thaiLanguage.UnicodeToMS874(rs.getString("TITLE_EN"));
					if(rs.getString("NAME_EN")!=null)
						name_en=thaiLanguage.UnicodeToMS874(rs.getString("NAME_EN"));
					if(rs.getString("SURNAME_EN")!=null)
						surname_en=thaiLanguage.UnicodeToMS874(rs.getString("SURNAME_EN"));
					if(rs.getString("SEX")!=null)
						sex=thaiLanguage.UnicodeToMS874(rs.getString("SEX"));
					if(rs.getDate("BIRTHDAY").toString()!=null)
						birthday=thaiLanguage.UnicodeToMS874(rs.getString("BIRTHDAY"));
					if(rs.getString("CONTACTADDRESS")!=null)
						contactAddress=thaiLanguage.UnicodeToMS874(rs.getString("CONTACTADDRESS"));
					if(rs.getString("TELEPHONE")!=null)
						telephone=thaiLanguage.UnicodeToMS874(rs.getString("TELEPHONE"));
					if(rs.getString("FAX")!=null)
						fax=thaiLanguage.UnicodeToMS874(rs.getString("FAX"));
					if(rs.getString("EMAIL")!=null)
						email=thaiLanguage.UnicodeToMS874(rs.getString("EMAIL"));
					if(rs.getString("URL")!=null)
						url=thaiLanguage.UnicodeToMS874(rs.getString("URL"));
					if(rs.getString("ACADEMICAFFILIATION")!=null)
						academicAffiliation=thaiLanguage.UnicodeToMS874(rs.getString("ACADEMICAFFILIATION"));
					if(rs.getString("ADMINPOSITION")!=null)
						adminPosition=thaiLanguage.UnicodeToMS874(rs.getString("ADMINPOSITION"));
					if(rs.getString("QUALIFICATION")!=null)
						qualification=thaiLanguage.UnicodeToMS874(rs.getString("QUALIFICATION"));
					if(rs.getString("EXPERIENCE")!=null)
						experience=thaiLanguage.UnicodeToMS874(rs.getString("EXPERIENCE"));
					if(rs.getString("B_INSTITUTE")!=null)
						B_institute=thaiLanguage.UnicodeToMS874(rs.getString("B_INSTITUTE"));
					if(rs.getString("B_YEAR")!=null)
						B_year=thaiLanguage.UnicodeToMS874(rs.getString("B_YEAR"));
					if(rs.getString("B_MAJOR")!=null)
						B_major=thaiLanguage.UnicodeToMS874(rs.getString("B_MAJOR"));
					if(rs.getString("B_DEGREE")!=null)
						B_degree=thaiLanguage.UnicodeToMS874(rs.getString("B_DEGREE"));
					if(rs.getString("M_INSTITUTE")!=null)
						M_institute=thaiLanguage.UnicodeToMS874(rs.getString("M_INSTITUTE"));
					if(rs.getString("M_YEAR")!=null)
						M_year=thaiLanguage.UnicodeToMS874(rs.getString("M_YEAR"));
					if(rs.getString("M_MAJOR")!=null)
						M_major=thaiLanguage.UnicodeToMS874(rs.getString("M_MAJOR"));
					if(rs.getString("M_DEGREE")!=null)
						M_degree=thaiLanguage.UnicodeToMS874(rs.getString("M_DEGREE"));
					if(rs.getString("D_INSTITUTE")!=null)
						D_institute=thaiLanguage.UnicodeToMS874(rs.getString("D_INSTITUTE"));
					if(rs.getString("D_YEAR")!=null)
						D_year=thaiLanguage.UnicodeToMS874(rs.getString("D_YEAR"));
					if(rs.getString("D_MAJOR")!=null)
						D_major=thaiLanguage.UnicodeToMS874(rs.getString("D_MAJOR"));
					if(rs.getString("D_DEGREE")!=null)
						D_degree=thaiLanguage.UnicodeToMS874(rs.getString("D_DEGREE"));
					if(rs.getString("O_INSTITUTE")!=null)
						O_institute=thaiLanguage.UnicodeToMS874(rs.getString("O_INSTITUTE"));
					if(rs.getString("O_YEAR")!=null)
						O_year=thaiLanguage.UnicodeToMS874(rs.getString("O_YEAR"));
					if(rs.getString("O_MAJOR")!=null)
						O_major=thaiLanguage.UnicodeToMS874(rs.getString("O_MAJOR"));
					if(rs.getString("O_DEGREE")!=null)
						O_degree=thaiLanguage.UnicodeToMS874(rs.getString("O_DEGREE"));
					if(rs.getString("MEMBERSTATUS")!=null)
						memberStatus=thaiLanguage.UnicodeToMS874(rs.getString("MEMBERSTATUS"));
					
					if(rs.getString("M_TEACHCOURSE")!=null){
						if(rs.getString("M_TEACHCOURSE").equals("Y"))
							M_teachCourse=thaiLanguage.UnicodeToMS874("ปริญญาโท");
						else
							M_teachCourse="";
					}
					if(rs.getString("D_TEACHCOURSE")!=null){
						if(rs.getString("D_TEACHCOURSE").equals("Y"))
							D_teachCourse=thaiLanguage.UnicodeToMS874(",ปริญญาเอก");
						else
							D_teachCourse="";
					}
					if(rs.getString("M_SUPERVISETHESIS")!=null){
						if(rs.getString("M_SUPERVISETHESIS").equals("Y"))
							M_superviseThesis=thaiLanguage.UnicodeToMS874("ปริญญาโท");
						else
							M_superviseThesis="";
					}
					if(rs.getString("D_SUPERVISETHESIS")!=null){
						if(rs.getString("D_SUPERVISETHESIS").equals("Y"))
							D_superviseThesis=thaiLanguage.UnicodeToMS874(",ปริญญาเอก");
						else
							D_superviseThesis="";
					}
					if(rs.getString("M_EXAMTHESIS")!=null){
						if(rs.getString("M_EXAMTHESIS").equals("Y"))
							M_examThesis=thaiLanguage.UnicodeToMS874("ปริญญาโท");
						else
							M_examThesis="";
					}
					if(rs.getString("D_EXAMTHESIS")!=null){
						if(rs.getString("D_EXAMTHESIS").equals("Y"))
							D_examThesis=thaiLanguage.UnicodeToMS874(",ปริญญาเอก");
						else
							D_examThesis="";
					}
					if(rs.getString("FACT#")!=null)
						factID=rs.getString("FACT#");
					if(rs.getString("DEPT#")!=null)
						deptID=rs.getString("DEPT#");
					if(rs.getString("MAJOR#")!=null)
						majorID=rs.getString("MAJOR#");
			}   // end while
			rs.close();
			if(cnt==0){	// ไม่พบข้อมูลอาจารย์
					out.println( thaiLanguage.UnicodeToMS874("<br><br><font style=\"font:14px\" color=\"#FF0000\">ไม่พบข้อมูลอาจารย์บัณฑิตที่ระบุ</font><br>\n"+
											"<form action=\"../lecturerinfo.jsp\" method=\"post\" name=\"form1\" >\n"+
											"<input name=\"ok\" type=\"submit\" value=\"&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
											"</form>"));
					rs.close();
					closeDB();
					return false;
			}
			if(!factID.equals("")&&!deptID.equals("")&&!majorID.equals("")){			// selecct from faculty ,department ,major
					sql="SELECT F.TNAME AS FNAME ,D.TNAME AS DNAME, M.TNAME AS MNAME "+
							"FROM FACULTY F,DEPARTMENT D,MAJOR M "+
							"WHERE F.FACT# = '"+factID+"' AND D.DEPT# = '"+deptID+"' AND D.FACT#= '"+factID+"' "+
							"AND M.MAJOR# = '"+majorID+"' AND M.DEPT# = '"+deptID+"'"; 
					rs = stmt.executeQuery(sql);
					while(rs.next()){
							if(rs.getString("FNAME")!=null)
								faculty=thaiLanguage.UnicodeToMS874(rs.getString("FNAME"));
							if(rs.getString("DNAME")!=null)
								department=thaiLanguage.UnicodeToMS874(rs.getString("DNAME"));
							if(rs.getString("MNAME")!=null)
								major=thaiLanguage.UnicodeToMS874(rs.getString("MNAME"));
					}
		
			}
			rs.close();
			closeDB();

			// แสดงข้อมูลอาจารย์
			out.println("<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\">\n"+
									"<tr>\n"+
								    "<td bgcolor=\"#9999CC\" height=\"30\" width=\"150\" colspan=\"2\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("ประวัติส่วนตัว")+"</font></td>\n"+
									"</tr>\n"+									
									"<tr>\n"+
									    "<td width=\"200\" height=\"10\"></td>\n"+	// empty
									    "<td width=\"450\"></td>\n"+									   
									"</tr>\n"+
									"<tr>\n"+	 // รหัสอาจารย์
										"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("รหัสอาจารย์")+"</b>&nbsp;</font></td>\n"+
									    "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+lecturerID+"</font></td>\n"+									    
									"</tr>\n"+
									"<tr>\n"+	 // ชื่อภาษาไทย
										"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ชื่อ")+"</b>&nbsp;</font></td>\n"+
										"<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+title_th+
										name_th+"&nbsp;&nbsp;&nbsp;&nbsp;"+
										surname_th+"</font></td>\n"+
									"</tr>\n"+
									"<tr>\n"+	 // ชื่อภาษาอังกฤษ
									    "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>Name&nbsp;</b></font></td>\n"+
									    "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+title_en+
										name_en+"&nbsp;&nbsp;&nbsp;&nbsp;"+surname_en+"</font></td>\n"+									    
									"</tr>\n"+
									"<tr>\n"+	 // เพศ
									    "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("เพศ")+"&nbsp;</b></font></td>\n"+
									    "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+sex+"</font></td>\n"+
									"</tr>\n"+
									"<tr>\n"+	 // วันเกิด
									    "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("เกิดวันที่")+"&nbsp;</b></font></td>\n"+
									    "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\" ><font class=\"insfont\">&nbsp;"+birthday+"</font></td>\n"+										
									"</tr>\n"+
									"<tr>\n"+
									    "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สถานที่ติดต่อ")+"&nbsp;</b></font></td>\n"+
									    "<td  align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+contactAddress+"</font></td>\n"+						
									"</tr>\n"+
									"<tr>\n"+
									    "<td align=\"right\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("โทรศัพท์")+"&nbsp;</b></font></td>\n"+
									    "<td align=\"left\"  valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+telephone+""+
											"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("<b>โทรสาร</b>")+"&nbsp;"+
											""+fax+"</font>\n"+
									    "</td>\n"+
									"</tr>\n"+
									"<tr>\n"+
									    "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("email")+"&nbsp;</b></font></td>\n"+
									    "<td  align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;</font><a href=\"mailto:"+email+"\" class=\"inslink\">"+email+"</a></td>\n"+
									"</tr>\n"+
									"<tr>\n"+
									    "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("url")+"&nbsp;</b></font></td>\n"+
									    "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\" ><font class=\"insfont\">&nbsp;</font><a href=\""+url+"\" target=\"_blank\" class=\"inslink\">"+url+"</a></td>\n"+	
									"</tr>\n"+
									"<tr>\n"+
									    "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ตำแหน่งทางวิชาการ")+"&nbsp;</b></font></td>\n"+
									    "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\" ><font class=\"insfont\">&nbsp;"+academicAffiliation+"</font></td>\n"+
									"</tr>\n"+
									"<tr>\n"+
									    "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ตำแหน่งบริหาร")+"&nbsp;</b></font></td>\n"+
									    "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\" ><font class=\"insfont\">&nbsp;"+adminPosition+"</font></td>\n"+
									"</tr>\n"+
									"<tr>\n"+
									    "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("คุณวุฒิ")+"&nbsp;</b></font></td>\n"+
									    "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\" ><font class=\"insfont\">&nbsp;"+qualification+"</font></td>\n"+
									"</tr>\n"+
									"<tr>\n"+
									    "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ประสบการณ์ทำงาน/การสอน/วิจัย")+"&nbsp;</b></font></td>\n"+
									    "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\" ><font class=\"insfont\">&nbsp;"+experience+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;ปี")+"</font></td>\n"+
									"</tr>\n");
					
							int ex = 0;
							for(int j=0;j<expertise.length;j++){	//   print expertise
								if(!expertise[j].equals("")){
									ex++;
									out.println("<tr>\n"+
													   "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ความเชี่ยวชาญเฉพาะ/งานวิจัย")+(j+1)+"&nbsp;</b></font></td>\n"+
													   "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\" ><font class=\"insfont\">&nbsp;"+expertise[j]+"</font></td>\n"+
													   "</tr>\n");
								}						
							}
							if(ex==0){
								out.println("<tr>\n"+
													   "<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ความเชี่ยวชาญเฉพาะ/งานวิจัย")+"&nbsp;</b></font></td>\n"+
													   "<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\" ><font class=\"insfont\">&nbsp;</font></td>\n"+
													   "</tr>\n");
							}
							
					out.println( "<tr>\n"+	 // empty
									    "<td height=\"10\" colspan=\"2\"></td>\n"+
										"</tr>\n"+
										"<tr>\n"+	 // หัวข้อประวัติการศึกษา
											"<td bgcolor=\"#9999CC\" height=\"30\" colspan=\"2\"> <font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("ประวัติการศึกษา")+"</font></td>\n"+
										"</tr>\n"+
										"<tr>\n"+ // empty
										    "<td  height=\"10\" colspan=\"2\"></td>\n"+
										"</tr>\n");
					if( (!B_year.equals(""))||(!B_institute.equals(""))||(!B_major.equals(""))||(!B_degree.equals("")) ){	//  ปริญญาตรี
						out.println(	"<tr>\n"+	 
										   "<td colspan=\"2\">\n"+
												"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\" frame=\"void\">\n"+
												"<tr>\n"+
													"<td colspan=\"2\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"> <font class=\"miniheader\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("การศึกษาปริญญาตรี")+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ปีการศึกษาที่จบ")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+B_year+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สถาบันการศึกษา")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+B_institute+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สาขา")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+B_major+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ปริญญาที่ได้รับ")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+B_degree+"</font></td>\n"+
												"</tr>\n"+
												"</table>\n"+
											"</td>\n"+
											"</tr>\n");		
					}
					if( (!M_year.equals(""))||(!M_institute.equals(""))||(!M_major.equals(""))||(!M_degree.equals("")) ){	//  ปริญญาตรีโท
						out.println(	"<tr>\n"+	 
										   "<td colspan=\"2\">\n"+
												"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\" frame=\"void\">\n"+
												"<tr>\n"+
													"<td colspan=\"2\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"> <font class=\"miniheader\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("การศึกษาปริญญาโท")+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ปีการศึกษาที่จบ")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+M_year+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สถาบันการศึกษา")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+M_institute+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สาขา")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+M_major+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ปริญญาที่ได้รับ")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+M_degree+"</font></td>\n"+
												"</tr>\n"+
												"</table>\n"+
											"</td>\n"+
											"</tr>\n");		
					}
					if( (!D_year.equals(""))||(!D_institute.equals(""))||(!D_major.equals(""))||(!D_degree.equals("")) ){	//  ปริญญา	เอก
						out.println(	"<tr>\n"+	 
										   "<td colspan=\"2\">\n"+
												"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\" frame=\"void\">\n"+
												"<tr>\n"+
													"<td colspan=\"2\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"> <font class=\"miniheader\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("การศึกษาปริญญาเอก")+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ปีการศึกษาที่จบ")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+D_year+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สถาบันการศึกษา")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+D_institute+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สาขา")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+D_major+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ปริญญาที่ได้รับ")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+D_degree+"</font></td>\n"+
												"</tr>\n"+
												"</table>\n"+
											"</td>\n"+
											"</tr>\n");
					}
					if( (!O_year.equals(""))||(!O_institute.equals(""))||(!O_major.equals(""))||(!O_degree.equals("")) ){	//  ปริญญาตรีอื่นๆ
						out.println(	"<tr>\n"+	 
										   "<td colspan=\"2\">\n"+
												"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\"  bordercolor=\"#9999CC\" frame=\"void\">\n"+
												"<tr>\n"+
													"<td colspan=\"2\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"> <font class=\"miniheader\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("การศึกษาปริญญาอื่นๆ")+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ปีการศึกษาที่จบ")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+O_year+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สถาบันการศึกษา")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+O_institute+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สาขา")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+O_major+"</font></td>\n"+
												"</tr>\n"+
												"<tr>\n"+
													"<td width=\"200\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ปริญญาที่ได้รับ")+"&nbsp;</b></font></td>\n"+
													"<td width=\"450\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+O_degree+"</font></td>\n"+
												"</tr>\n"+
												"</table>\n"+
											"</td>\n"+
											"</tr>\n");		
					}
					out.println(		"<tr>\n"+  // empty
											    "<td height=\"10\" colspan=\"2\"></td>\n"+
											"</tr>\n"+
											"<tr>\n"+	 // หัวข้อข้อมูลการเป็นอาจารย์ประจำบัณฑิตวิทยาลัย
												"<td bgcolor=\"#9999CC\" height=\"30\" colspan=\"2\"> <font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("ข้อมูลการเป็นอาจารย์ประจำบัณฑิตวิทยาลัย")+"</font></td>\n"+
											"</tr>\n"+ // empty
											"<tr>\n"+
											    "<td height=\"10\" colspan=\"2\"></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
												"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สถานภาพอาจารย์บัณฑิต")+"&nbsp;</b></font></td>\n"+
												"<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+memberStatus+"</font></td>\n"+
											"</tr>\n"+
											"<tr>\n"+
												"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สอนในหลักสูตร&nbsp;ระดับ")+"&nbsp;</b></font></td>\n"+
												"<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+M_teachCourse+"&nbsp;"+D_teachCourse+"</font></td>\n"+
											"</tr>\n"+
												"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สอบวิทยานิพนธ์&nbsp;ระดับ")+"&nbsp;</b></font></td>\n"+
												"<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+M_examThesis+"&nbsp;"+D_examThesis+"</font></td>\n"+
											"</tr>\n"+
											"</tr>\n"+
												"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ควบคุมวิทยานิพนธ์&nbsp;ระดับ")+"&nbsp;</b></font></td>\n"+
												"<td  align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+M_superviseThesis+"&nbsp;"+D_superviseThesis+"</font></td>\n"+
											"</tr>\n"+
											"</tr>\n"+
												"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สังกัดคณะ")+"&nbsp;</b></font></td>\n"+
												"<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+faculty+"</font></td>\n"+
											"</tr>\n"+
											"</tr>\n"+
												"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ภาควิชา")+"&nbsp;</b></font></td>\n"+
												"<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+department+"</font></td>\n"+
											"</tr>\n"+
											"</tr>\n"+
												"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สาขา")+"&nbsp;</b></font></td>\n"+
												"<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+major+"</font></td>\n"+
											"</tr>\n");
					
					for (int m=0;m<teachCourse.length;m++){		// สอนในหลักสูตร
						if(!(teachCourse[m].equals(""))){
							out.println("</tr>\n"+
			  										"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สอนหลักสูตรคณะ&nbsp;")+(m+1)+".&nbsp;</b></font></td>\n"+
													"<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+teachFaculty[m]+"</font></td>\n"+
											   "</tr>\n"+
											   "</tr>\n"+
													"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("สาขา")+"&nbsp;</b></font></td>\n"+
													"<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+teachMajor[m]+"</font></td>\n"+
											  "</tr>\n"+
											  "</tr>\n"+
													"<td align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+thaiLanguage.UnicodeToMS874("ชื่อหลักสูตร")+"&nbsp;</b></font></td>\n"+
													"<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;"+teachCourse[m]+"</font></td>\n"+
											  "</tr>\n");
						}
					}
					out.println("<tr>\n"+
			   								"<td height=\"10\"></td>\n"+
											"<td></td>\n"+											
									  "</tr>\n"+
									  "<tr>\n"+
			   							"<td colspan=\"2\" height=\"3\" bgcolor=\"#9999CC\"></td>\n"+
									  "</tr>\n"+
									  "</table><br>"+
									 "<table width=\"650\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"+
									 "<tr>\n"+
										"<td width=\"320\" align=\"right\">\n"+
											"<form action=\"LecturerWork\" method=\"post\" name=\"form1\" >\n"+
												"<input type=\"hidden\" name=\"lecturerID\" value=\""+thaiLanguage.MS874ToUnicode(lecturerID)+"\">"+
									  			"<input name=\"deletelecturer\" type=\"submit\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;ลบข้อมูล&nbsp;&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\" onClick=\"return confirmDel()\">&nbsp;&nbsp;&nbsp;\n"+
											"</form>\n"+
										"</td>\n"+
										"<td width=\"10\"></td>\n"+
										"<td width=\"320\" align=\"left\">\n"+
											"<form action=\"../lecturerinfo.jsp\" method=\"post\" name=\"form1\" >\n"+
												"<input name=\"cancel\" type=\"submit\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;&nbsp;&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
											"</form>\n"+
										"</td>\n"+
									"</tr>\n"+
									"</table>\n");

			return true;
	} // end getLecturerInfo
//--------------------------------------------------------------------------- end end getLecturerInfo

//------------------------------------------------------------------------------------------start listLecturerName
	public void listLecturerName(String name,String surname,PrintWriter out)throws Exception{
		ResultSet rs;
		Statement stmt;
		Lecturer lec = new Lecturer();
		String sqlCommand = 	"SELECT L.LECTURER#,L.ACADEMICAFFILIATION, L.NAME_TH, L.SURNAME_TH, "+
									"L.NAME_EN, L.SURNAME_EN, F.TNAME "+ 
									"FROM LECTURER L,FACULTY F  WHERE ( (L.NAME_TH= '"+name+"'  AND  L.SURNAME_TH='"+surname+"' )  "+
									"OR ( L.NAME_EN='"+name+"' AND L.SURNAME_EN='"+surname+"' ) )"+
									"AND (F.FACT# = L.FACT#) "+
									"ORDER BY F.FACT# ";
		
		out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> อาจารย์บัณฑิต >> <a href=\"../lecturerinfo.jsp\" class = \"pathlink2\">ดูข้อมูลอาจารย์บัณฑิต</a>","ข้อมูลอาจารย์บัณฑิต"));
		out.println("<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\" rules=\"rows\">\n"+
							"<tr>\n"+
							"	<td height=\"31\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("รายชื่ออาจารย์บัณฑิต")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td height=\"10\" align=\"right\" valign=\"top\"></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+	 // Cover 
							"	<td align=\"left\" valign=\"top\">\n"+		// Cover
							"	<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\" rules=\"rows\"  frame=\"void\">\n"+
							"	<tr>\n"+
							"	<td width=\"150\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("รหัสอาจารย์")+"&nbsp;</font></td>\n"+
							"	<td width=\"250\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\" >&nbsp;"+thaiLanguage.UnicodeToMS874("ชื่อ")+"</font></td>\n"+
							"	<td width=\"250\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\" >&nbsp;"+thaiLanguage.UnicodeToMS874("คณะ")+"</font></td>\n"+
							"</tr>\n");
		
		connectDB(out);
		stmt = con.createStatement();
		// selec factName
		
		
		
		
		rs = stmt.executeQuery(sqlCommand);
		int cnt = 0;
		while(rs.next() ){
			cnt++;
			if(rs.getString("LECTURER#") != null )
				lec.setLecturerID(rs.getString("LECTURER#"));
			if(rs.getString("ACADEMICAFFILIATION") != null )
				lec.setAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
			if(rs.getString("NAME_TH") != null )
				lec.setName_th(rs.getString("NAME_TH"));
			if(rs.getString("SURNAME_TH") != null )
				lec.setSurname_th(rs.getString("SURNAME_TH"));
			if(rs.getString("NAME_EN") != null )
				lec.setName_en(rs.getString("NAME_EN"));
			if(rs.getString("SURNAME_EN") != null )
				lec.setSurname_en(rs.getString("SURNAME_EN"));
			if(rs.getString("TNAME") != null )
				lec.setFactName(rs.getString("TNAME"));
			
			out.println(	"	<tr>\n"+
								"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"miniheader\">&nbsp;&nbsp;</font><a href=\"lecturerInfo?lecturerID="+lec.getLecturerID()+"\" class=\"link1\">"+lec.getLecturerID()+"</a></td>\n");
			if( name.equals(lec.getName_th()) && surname.equals(lec.getSurname_th())  ){			// ชื่อภาษาไทย
						out.println("	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"miniheader\" >&nbsp;</font><a href=\"lecturerInfo?lecturerID="+lec.getLecturerID()+"\" class=\"link1\">"+
											thaiLanguage.UnicodeToMS874(lec.getAcademicAffiliation()+lec.getName_th()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+lec.getSurname_th())+"</a></td>\n");
			}
			else{	// ชื่อภาษาอังกฤษ
						out.println("	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"miniheader\" >&nbsp;</font><a href=\"lecturerInfo?lecturerID="+lec.getLecturerID()+"\" class=\"link1\">"+
											thaiLanguage.UnicodeToMS874(lec.getName_en()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+lec.getSurname_en())+"</a></td>\n");
			}
			out.println(	"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\" style=\"font:16px\" >&nbsp;"+thaiLanguage.UnicodeToMS874(lec.getFactName())+"</font></td>\n"+
								"</tr>\n");
		
		} // end while
		rs.close();
		stmt.close();
		closeDB();
		if (cnt==0){		// ไม่พบข้อมูลอาจารย์		
				out.println(	"<tr>\n"+
									"	<td  colspan=\"3\" align=\"center\" valign=\"top\"><br><form action=\"../lecturerinfo.jsp\" method=\"post\" name=\"form1\">\n"+
									"	<font color=\"#FF0000\" style=\"font:16px\">"+thaiLanguage.UnicodeToMS874("ไม่มีรายชื่ออาจารย์ที่ระบุมา")+"</font>\n"+
									"	<br><br><input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"	</form></td>\n"+	
									"</tr>\n");	
		}
		


		// แสดงรายชื่ออาจารย์
		out.println(	"	</table>\n"+
								"</td>\n"+	// Cover
								"</tr>\n"+	// Cover
								"<tr>\n"+
								"	<td height=\"10\" align=\"right\" valign=\"top\"></td>\n"+	// empty
								"</tr>\n"+
								"<tr>\n"+
								"	<td height=\"3\" align=\"right\" valign=\"top\" bgcolor=\"#9999CC\"></td>\n"+	// empty
								"</tr>\n");
			out.println("</table>\n");
			out.println("<br><a href=\"../lecturerinfo.jsp\" class=\"link1\" >"+thaiLanguage.UnicodeToMS874("ยกเลิก")+"</a>");
			out.println(htmlTemplate.getEnd());
		


	} // end istLecturerName
//------------------------------------------------------------------------------------------end listLecturerName


	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException
	{
		// get database server
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		String sqlCommand="";
		String fact="";
		if(session.getAttribute("login")==null){		// check login
			response.sendRedirect("../loginfail.jsp");
			return;
		}
		if(request.getParameter("idok") != null){			///   get from lecturerID
			String lecturerID =	request.getParameter("lecturerID");
			sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+lecturerID+"'";
			try{
				out.println(htmlTemplate.getStart("ข้อมูลอาจารย์บัณฑิต","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;อาจารย์บัณฑิต&nbsp;>>&nbsp;<a href=\"../lecturerinfo.jsp\" class=\"pathlink2\">ดูข้อมูลอาจารย์บัณฑิต</a>","ข้อมูลอาจารย์บัณฑิต"));
				if(!getLecturerInfo(sqlCommand,lecturerID,out)){
					out.println(htmlTemplate.getEnd());
					return;
				}
				out.println(htmlTemplate.getEnd());
			}
			catch (SQLException e){out.println("SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("Exception : "+e.getMessage());return;}	
		}	// end request.getParameter("idok")
		
		if(request.getParameter("nameok") != null){			/// get from name and surname
			String name=thaiLanguage.MS874ToUnicode(request.getParameter("name"));
			String lecturerID="";
			String surname=thaiLanguage.MS874ToUnicode(request.getParameter("surname"));
			try{		
					//   list lecturer from name and sur=name
					listLecturerName(name,surname,out);
					out.println(htmlTemplate.getEnd());

			}catch (SQLException e){out.println("SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("Exception : "+e.getMessage());return;}			
		} // end (request.getParameter("nameok")
		
		if(request.getParameter("factok")!=null){	// get รายชื่ออาจารย์ตามคณะ
			if(request.getParameter("fact")!=null)
				fact=request.getParameter("fact");
			sqlCommand = "SELECT L.LECTURER#,L.ACADEMICAFFILIATION,L.NAME_TH,L.SURNAME_TH ,D.TNAME "+
										"FROM LECTURER L, DEPARTMENT D WHERE L.FACT#='"+fact+"' AND "+
										"D.DEPT#= L.DEPT#  ORDER BY L.NAME_TH";
			try{
						out.println(htmlTemplate.getStart("ข้อมูลอาจารย์บัณฑิต","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;อาจารย์บัณฑิต&nbsp;>>&nbsp;<a href=\"../lecturerinfo.jsp\" class=\"pathlink2\">ดูข้อมูลอาจารย์บัณฑิต</a>","ข้อมูลอาจารย์บัณฑิต"));
						listLecturer(sqlCommand,fact,out);
						out.println(htmlTemplate.getEnd());

			}
			catch (SQLException e){out.println("SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("Exception : "+e.getMessage());return;}
		} // end getParameter("factok")

	}// end doPost

// end doPost -----------------------------------------------------------------------------------------------------------------------------------------------
	public void listLecturer(String sqlCommand,String fact,PrintWriter out)throws Exception{
			connectDB(out);
			stmt = con.createStatement();			
			rs = stmt.executeQuery(sqlCommand);
			int cnt=0;
			Lecturer lec = new Lecturer();
			String factName="";
			if(fact.equals("01"))
				factName="คณะวิศวกรรมศาสตร์";
			else if(fact.equals("02"))
				factName="คณะสถาปัตยกรรมศาสตร์";
			else if(fact.equals("03"))
				factName="คณะครุศาสตร์อุตสาหกรรม";
			else if(fact.equals("04"))
				factName="คณะวิทยาศาสตร์";
			else if(fact.equals("05"))
				factName="คณะเทคโนโลยีการเกษตร";
			else if(fact.equals("06"))
				factName="โครงการคณะอุตสาหกรรมเกษตร";
			else if(fact.equals("07"))
				factName="คณะเทคโนโลยีสารสนเทศ";

			out.println(	"<br><table width=\"500\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"+
					"<tr>\n"+
					"		<td valign=\"bottom\" align=\"center\"><font class=\"miniheader\">"+thaiLanguage.UnicodeToMS874(factName)+"</font></td>\n"+
					"</tr>\n"+
					"</table>\n");


			out.println(	"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\" rules=\"rows\">\n"+
								"<tr>\n"+
								"	<td align=\"left\" valign=\"middle\" height=\"30\" colspan=\"3\"  bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("รายชื่ออาจารย์")+"</font></td>"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td align=\"left\" height=\"10\" colspan=\"3\"></td>"+	// empty
								"</tr>\n"+
								"<tr>\n"+
								"	<td align=\"left\" width=\"120\" bgcolor=\"#D6D6EB\" height=\"30\"><font class=\"miniheader\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("รหัสอาจารย์")+"</font></td>"+
								"	<td align=\"left\" width=\"220\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;"+thaiLanguage.UnicodeToMS874("ชื่อ - นามสกุล")+"</font></td>"+
								"	<td align=\"left\" width=\"310\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;"+thaiLanguage.UnicodeToMS874("ภาควิชา")+"</font></td>"+
								"</tr>\n");
			while (rs.next())
			{
				if(rs.getString("LECTURER#")!=null)
					lec.setLecturerID(thaiLanguage.UnicodeToMS874(rs.getString("LECTURER#")));
				if(rs.getString("ACADEMICAFFILIATION")!=null)
					lec.setAcademicAffiliation(thaiLanguage.UnicodeToMS874(rs.getString("ACADEMICAFFILIATION")));
				if(rs.getString("NAME_TH")!=null)
					lec.setName_th(thaiLanguage.UnicodeToMS874(rs.getString("NAME_TH")));
				if(rs.getString("SURNAME_TH")!=null)
					lec.setSurname_th(thaiLanguage.UnicodeToMS874(rs.getString("SURNAME_TH")));
				if(rs.getString("TNAME")!=null)
					lec.setDeptName(thaiLanguage.UnicodeToMS874(rs.getString("TNAME")));
				
				cnt++;
				out.println(	"<tr>\n"+
									"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"font2\">&nbsp;&nbsp;&nbsp;</font><a href=\"lecturerInfo?lecturerID="+lec.getLecturerID()+"\" class=\"link1\">"+lec.getLecturerID()+"</a></td>\n"+
									"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"font2\">&nbsp;<a href=\"lecturerInfo?lecturerID="+lec.getLecturerID()+"\" class=\"link1\">"+lec.getAcademicAffiliation()+lec.getName_th()+"&nbsp;&nbsp;&nbsp;&nbsp;"+lec.getSurname_th()+"</a></font></td>\n"+
									"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"font2\">&nbsp;"+lec.getDeptName()+"</font></td>\n"+
									"</tr>\n");
	
			}			
			
			if(cnt==0){	// ไม่พบข้อมูลอาจารย์
					out.println( thaiLanguage.UnicodeToMS874("<tr><td colspan=\"3\" align=\"center\" valign=\"top\"><br><font style=\"font:16px\" color=\"#FF0000\">ไม่พบข้อมูลอาจารย์บัณฑิตที่ระบุ</font><br>\n"+
											"<form action=\"../lecturerinfo.jsp\" method=\"post\" name=\"form1\" >\n"+
											"<input name=\"ok\" type=\"submit\" value=\"&nbsp;&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
											"</form></td></tr>"));					
			}
		out.println(	"<tr>\n"+
							"	<td align=\"left\" height=\"10\" colspan=\"3\"></td>"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td align=\"left\" height=\"3\" bgcolor=\"#9999CC\" colspan=\"3\"></td>"+
							"</tr>\n"+
							"</table>\n");
		out.println("<br><a href=\"../lecturerinfo.jsp\" class=\"link1\" >"+thaiLanguage.UnicodeToMS874("ยกเลิก")+"</a>");

		rs.close();
		stmt.close();
		closeDB();
	} // end listLecturer
//---------------------------------------------------------------------------------------------------------------	end listLecturer


//---------------------------------------------------------------------------------------    start stdListLecturer	// ของทำเนียบอาจารย์
public void stdListLecturer(String sqlCommand,String fact,PrintWriter out)throws Exception{
			connectDB(out);
			stmt = con.createStatement();			
			rs = stmt.executeQuery(sqlCommand);
			int cnt=0;
			Lecturer lec = new Lecturer();
			String factName="";
			if(fact.equals("01"))
				factName="คณะวิศวกรรมศาสตร์";
			else if(fact.equals("02"))
				factName="คณะสถาปัตยกรรมศาสตร์";
			else if(fact.equals("03"))
				factName="คณะครุศาสตร์อุตสาหกรรม";
			else if(fact.equals("04"))
				factName="คณะวิทยาศาสตร์";
			else if(fact.equals("05"))
				factName="คณะเทคโนโลยีการเกษตร";
			else if(fact.equals("06"))
				factName="โครงการคณะอุตสาหกรรมเกษตร";
			else if(fact.equals("07"))
				factName="คณะเทคโนโลยีสารสนเทศ";

			out.println(thaiLanguage.UnicodeToMS874("<font  class=\"topic\">บัณฑิตวิทยาลัย<br>สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</font>"));
			
			out.println(	"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" rules=\"rows\" bordercolor=\"#9999CC\">\n"+
								"<tr>\n"+
								"	<td valign=\"bottom\" align=\"center\" bgcolor=\"#9999CC\" colspan=\"3\"><font class=\"topic\">"+thaiLanguage.UnicodeToMS874(factName)+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td height=\"10\"></td>\n"+		// empty
								"</tr>\n"+
								"<tr>\n"+	 // Cover
								"	<td valign=\"top\" align=\"left\">\n"+ // Cover
								"	<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" rules=\"rows\" bordercolor=\"#9999CC\"  frame=\"void\">\n"+
								"	<tr>\n"+
								"		<td align=\"left\" valign=\"bottom\" width=\"120\" bgcolor=\"#D6D6EB\" height=\"30\"></td>"+
								"		<td align=\"left\" valign=\"bottom\" width=\"220\" bgcolor=\"#D6D6EB\"><font class=\"topic\" style=\"font:18px\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อ - นามสกุล</b>")+"</font></td>"+
								"		<td align=\"left\" valign=\"bottom\" width=\"310\" bgcolor=\"#D6D6EB\"><font class=\"topic\" style=\"font:18px\">"+thaiLanguage.UnicodeToMS874("<b>ภาควิชา</b>")+"</font></td>"+
								"	</tr>\n");
			while (rs.next())
			{
				if(rs.getString("LECTURER#")!=null)
					lec.setLecturerID(thaiLanguage.UnicodeToMS874(rs.getString("LECTURER#")));
				if(rs.getString("ACADEMICAFFILIATION")!=null)
					lec.setAcademicAffiliation(thaiLanguage.UnicodeToMS874(rs.getString("ACADEMICAFFILIATION")));
				if(rs.getString("NAME_TH")!=null)
					lec.setName_th(thaiLanguage.UnicodeToMS874(rs.getString("NAME_TH")));
				if(rs.getString("SURNAME_TH")!=null)
					lec.setSurname_th(thaiLanguage.UnicodeToMS874(rs.getString("SURNAME_TH")));
				if(rs.getString("TNAME")!=null)
					lec.setDeptName(thaiLanguage.UnicodeToMS874(rs.getString("TNAME")));
				
				cnt++;
				out.println(	"<tr>\n"+
									"	<td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"></td>\n"+
									"	<td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"myfont\"><a href=\"lecturerInfo?stdGetLecturerID="+lec.getLecturerID()+"\"class=\"mylink\">"+lec.getAcademicAffiliation()+lec.getName_th()+"&nbsp;&nbsp;&nbsp;&nbsp;"+lec.getSurname_th()+"</a></font></td>\n"+
									"	<td align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"myfont\">"+lec.getDeptName()+"</font></td>\n"+
									"</tr>\n");
	
			}			
			
			if(cnt==0){	// ไม่พบข้อมูลอาจารย์
					out.println( thaiLanguage.UnicodeToMS874("<tr><td colspan=\"3\" align=\"center\" valign=\"top\"><br><font style=\"font:16px\" color=\"#FF0000\">ไม่พบข้อมูลอาจารย์บัณฑิต</font><br>\n"+
											"<form action=\"../lecturer.jsp\" method=\"post\" name=\"form1\" >\n"+
											"<input name=\"ok\" type=\"submit\" value=\"&nbsp;&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
											"</form></td></tr>"));					
			}
			out.println(	"</table>\n"+
								"</td>\n"+	// Cover
								"</tr>\n"+		// Cover
								"<tr>\n"+
								"	<td align=\"left\" height=\"10\" colspan=\"3\"></td>"+	// empty 
								"</tr>\n"+
								"<tr>\n"+
								"	<td align=\"left\" height=\"3\" bgcolor=\"#9999CC\" colspan=\"3\"></td>"+
								"</tr>\n"+
								"</table>\n");
			if(cnt!=0){
				out.println(	"<br><form action=\"../lecturer.jsp\" method=\"post\" name=\"form1\" >\n"+
									"<input name=\"ok\" type=\"submit\" value=\"&nbsp;&nbsp;&nbsp;back&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
									"</form>");
			}
		rs.close();
		stmt.close();
		closeDB();
	} // end stdListLecturer

//	--------------------------------------------------------------------------------------------- end stdListLecturer 	// ของทำเนียบอาจารย

//	--------------------------------------------------------------------------------------------- start stdViewLecturer 	// ของทำเนียบอาจารย
public boolean stdViewLecturer(String lecturerID,PrintWriter out)throws Exception{

			Lecturer lecturer = new Lecturer();
			lecturer.setLecturerID(lecturerID);
			String sqlCommand =	"SELECT L.LECTURER#,L.NAME_TH , L.SURNAME_TH , L.ACADEMICAFFILIATION , "+
													"L.EXPERIENCE , L.MEMBERSTATUS ,F.FACT#, F.TNAME AS FNAME , D.TNAME AS DNAME , "+
													"M.TNAME AS MNAME FROM LECTURER L ,FACULTY F ,DEPARTMENT D ,MAJOR M "+
													"WHERE L.LECTURER# ='"+lecturer.getLecturerID()+"' "+
													"AND F.FACT# = ( SELECT FACT# FROM LECTURER WHERE LECTURER#='"+lecturer.getLecturerID()+"' ) "+
													"AND D.DEPT# = ( SELECT DEPT# FROM LECTURER WHERE LECTURER#='"+lecturer.getLecturerID()+"' ) "+
													"AND M.MAJOR# = ( SELECT MAJOR# FROM LECTURER WHERE LECTURER#='"+lecturer.getLecturerID()+"' ) ";
			
			
			connectDB(out);
			stmt = con.createStatement();			
			rs = stmt.executeQuery(sqlCommand);
			int cnt=0;
			if(rs.next()){ 
					if(rs.getString("LECTURER#")!=null)
						lecturer.setLecturerID(thaiLanguage.UnicodeToMS874(rs.getString("LECTURER#")));
					if(rs.getString("NAME_TH")!=null)
						lecturer.setName_th(thaiLanguage.UnicodeToMS874(rs.getString("NAME_TH")));
					if(rs.getString("SURNAME_TH")!=null)
						lecturer.setSurname_th(thaiLanguage.UnicodeToMS874(rs.getString("SURNAME_TH")));
					if(rs.getString("ACADEMICAFFILIATION")!=null)
						lecturer.setAcademicAffiliation(thaiLanguage.UnicodeToMS874(rs.getString("ACADEMICAFFILIATION")));
					if(rs.getString("EXPERIENCE")!=null)
						lecturer.setExperience(thaiLanguage.UnicodeToMS874(rs.getString("EXPERIENCE")));
					if(rs.getString("MEMBERSTATUS")!=null)
						lecturer.setMemberStatus(thaiLanguage.UnicodeToMS874(rs.getString("MEMBERSTATUS")));
					if(rs.getString("FACT#")!=null)
						lecturer.setFaculty(thaiLanguage.UnicodeToMS874(rs.getString("FACT#")));
					if(rs.getString("FNAME")!=null)
						lecturer.setFactName(thaiLanguage.UnicodeToMS874(rs.getString("FNAME")));
					if(rs.getString("DNAME")!=null)
						lecturer.setDeptName(thaiLanguage.UnicodeToMS874(rs.getString("DNAME")));
					if(rs.getString("MNAME")!=null)
						lecturer.setMajorName(thaiLanguage.UnicodeToMS874(rs.getString("MNAME")));					
			}
			else{	// ไม่พบข้อมูลอาจารย์
				rs.close();
				stmt.close();
				closeDB();
				out.println(	thaiLanguage.UnicodeToMS874("<br><font style=\"font:16px\" color=\"#FF0000\">ไม่พบข้อมูล</font><br>"));
				out.println(	"<br><form action=\"../lecturer.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
									"<input type=\"submit\" name=\"ok\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form><br>\n");	
				out.println(htmlTemplate.getListEnd());
				return false;
		}
			rs.close();
			sqlCommand = "SELECT * FROM LECTUREREXPERTISE WHERE LECTURER#='"+lecturer.getLecturerID()+"' ";
			rs = stmt.executeQuery(sqlCommand);
			int index = 0;
			while(rs.next()){
					lecturer.setExpertise(thaiLanguage.UnicodeToMS874(rs.getString("EXPERTISE")),index);
					index++;

			}
			rs.close();
			stmt.close();
			con.close();
			out.println(thaiLanguage.UnicodeToMS874("<font  class=\"topic\">บัณฑิตวิทยาลัย<br>สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</font>"));
			out.println(	"<table width=\"500\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\n"+
								"<tr>\n"+
								"	<td valign=\"bottom\" align=\"center\"><font class=\"topic\">"+thaiLanguage.UnicodeToMS874("คณะ")+lecturer.getFactName()+"</font></td>\n"+
								"</tr>\n"+
								"</table>\n");
			out.println(	"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#E8EBF6\">\n"+
				                  	"<tr>\n"+
									"<td colspan=\"2\"align=\"left\" height=\"30\" bgcolor=\"#9999CC\" valign=\"bottom\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ข้อมูลอาจารย์บัณฑิต")+"</font></td>\n"+
									"</tr>\n"+				
									"<tr>\n"+
                    				"<td width=\"220\" height=\"25\" align=\"right\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ชื่อ")+"&nbsp;</font></td>\n"+
                    				"<td align=\"left\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\" >&nbsp;"+lecturer.getAcademicAffiliation()+lecturer.getName_th()+
												"&nbsp;&nbsp;&nbsp;&nbsp;"+lecturer.getSurname_th()+"</font></td>\n"+
                  					"</tr>\n"+
                  					"<tr>\n"+
                    				"<td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("สังกัดคณะ")+"&nbsp;</font></td>\n"+
                    				"<td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">&nbsp;"+lecturer.getFactName()+"</font></td>\n"+
                  					"</tr>\n"+
									"<tr>\n"+
                    				"<td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ภาควิชา")+"&nbsp;</font></td>\n"+
                    				"<td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">&nbsp;"+lecturer.getDeptName()+"</font></td>\n"+
                  					"</tr>\n"+
									"<tr>\n"+
                    				"<td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("สาขา")+"&nbsp;</font></td>\n"+
                    				"<td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">&nbsp;"+lecturer.getMajorName()+"</font></td>\n"+
                  					"</tr>\n"+
									"<tr>\n"+
                    				"<td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("สถานะอาจารย์บัณฑิต")+"&nbsp;</font></td>\n"+
                    				"<td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">&nbsp;"+lecturer.getMemberStatus()+"</font></td>\n"+
                  					"</tr>\n"+
									"<tr>\n"+
                    				"<td align=\"right\" valign=\"top\" bgcolor=\"#B3BEF5\"><font class=\"myfont2\">"+thaiLanguage.UnicodeToMS874("ความเชี่ยวชาญเฉพาะ")+"&nbsp;</font></td>\n"+
                    				"<td align=\"left\" valign=\"top\" bgcolor=\"#CBD2F4\"><font class=\"myfont2\">");
									index = 0;
									while(!lecturer.getExpertise(index).equals("")){
											out.println("&nbsp;"+(index+1)+".&nbsp;"+lecturer.getExpertise(index)+"<br>");
											index++;
									}
									out.println("</font></td>\n"+
                  					"</tr>\n"+
									"<tr> \n"+
									"   <td colspan=\"2\" align=\"left\" height=\"10\" bgcolor=\"#9999CC\" valign=\"bottom\"></td>\n"+
									"</tr>\n"+
                					"</table>");
				
				out.println(	"<br><form action=\"lecturerInfo\" method=\"get\" name=\"form1\" >\n"+
									"<input type=\"hidden\" name=\"stdGetFactID\" value=\""+lecturer.getFaculty()+"\" >"+
									"<input name=\"ok\" type=\"submit\" value=\"&nbsp;&nbsp;&nbsp;back&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
									"</form>");
			
				return true;

} // end stdViewLecturer
//	--------------------------------------------------------------------------------------------- end stdViewLecturer 	// ของทำเนียบอาจารย



	// ##################  doGet ##################
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		
		// get database server
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		String sqlCommand="";
		String lecturerID="";
		lecturerID="";
		
		if(request.getParameter("lecturerID")!=null){
			
			if(session.getAttribute("login")==null){		// check login
				response.sendRedirect("../loginfail.jsp");
				return;
			}

			lecturerID = request.getParameter("lecturerID");
			sqlCommand = "SELECT * FROM LECTURER WHERE LECTURER#='"+lecturerID+"'";
			try{
				out.println(htmlTemplate.getStart("ข้อมูลอาจารย์บัณฑิต","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a>&nbsp;>>&nbsp;อาจารย์บัณฑิต&nbsp;>>&nbsp;<a href=\"../lecturerinfo.jsp\" class=\"pathlink2\">ดูข้อมูลอาจารย์บัณฑิต</a>","ข้อมูลอาจารย์บัณฑิต"));
				if(!getLecturerInfo(sqlCommand,lecturerID,out)){
					out.println(htmlTemplate.getEnd());
					return;
				}
				out.println(htmlTemplate.getEnd());
			}
			catch (SQLException e){out.println("SQLException : "+e.getMessage());return;}
			catch (Exception e){out.println("Exception : "+e.getMessage());return;}	
		} //end if getParameter("lecturerID")

		if(request.getParameter("stdGetFactID")!=null){				// ของทำเนียบอาจารย์บัณฑิต
			String factID= request.getParameter("stdGetFactID");
			sqlCommand = "SELECT L.LECTURER#,L.ACADEMICAFFILIATION,L.NAME_TH,L.SURNAME_TH ,D.TNAME "+
										"FROM LECTURER L, DEPARTMENT D WHERE L.FACT#='"+factID+"' AND "+
										"D.DEPT#= L.DEPT#  ORDER BY L.NAME_TH";
			try{
						out.println(htmlTemplate.getListStart("lecturerband.gif","ทำเนียบอาจารย์บัณฑิต"));
						stdListLecturer(sqlCommand,factID,out);
						out.println(htmlTemplate.getListEnd());
			}
			catch (SQLException e){out.println("SQLException in lecturerInfo.java : "+e.getMessage());return;}
			catch (Exception e){out.println("Exception in lecturerInfo.java : "+e.getMessage());return;}	
		}  //  end if(request.getParameter("stdGetFactID")

		if(request.getParameter("stdGetLecturerID")!=null){			// ของทำเนียบอาจารย์บัณฑิต
			lecturerID= request.getParameter("stdGetLecturerID");
			try{
						out.println(htmlTemplate.getListStart("lecturerband.gif","ทำเนียบอาจารย์บัณฑิต"));
						if(stdViewLecturer(lecturerID,out))
							out.println(htmlTemplate.getListEnd());
						return;
			}
			catch (SQLException e){out.println("SQLException in lecturerInfo.java : "+e.getMessage());return;}
			catch (Exception e){out.println("Exception in lecturerInfo.java : "+e.getMessage());return;}	
		}  //  end if(request.getParameter("stdGetLecturerID")
		
	}	// end doGet

} // end class lecturerInfo










