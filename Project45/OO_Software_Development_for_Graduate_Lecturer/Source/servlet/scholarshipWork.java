
/*
	@jaikla
*/
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import myutil.thaiLanguage;
import myutil.htmlTemplate;
import myutil.myDate;
import myutil.server;
import scholarship.*;
import student.Student;
public class scholarshipWork extends HttpServlet{

	private String url = "";
	private String user = "";
	private String passwd = "";
	private Connection con;

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

//--------------------------------------------------------------------------------------- start connectDB
	public boolean isExist(String sqlCommand,PrintWriter out)throws Exception{
		Statement stmt;
		ResultSet rs;
		//**************  ตรวจสอบว่ามีขอ้มูลอยู่หรือไม่
		connectDB(out);
		stmt = con.createStatement();
		rs = stmt.executeQuery(sqlCommand);
		if(rs.next()){			
			rs.close();
			stmt.close();
			closeDB();
			return true;
		}
		else{
			rs.close();
			stmt.close();
			closeDB();
			return false;
		}
	}
//--------------------------------------------------------------------------------------- end closeDB

//--------------------------------------------------------------------------------------- start getScholarshipInfo from webpage
	public paperScholarship getScholarshipInfo(HttpServletRequest request,PrintWriter out)throws Exception{
				
		Scholarship schship = new Scholarship();
			if(request.getParameter("scholarshipType")!=null){
				schship.setType(thaiLanguage.MS874ToUnicode(request.getParameter("scholarshipType")));
			}			
			if(request.getParameter("academicYear")!=null){
				schship.setAcademicYear(thaiLanguage.MS874ToUnicode(request.getParameter("academicYear")));			
			}
			if(!request.getParameter("name").equals("") && request.getParameter("name")!=null){
				schship.setName(thaiLanguage.MS874ToUnicode(request.getParameter("name")));				
			}
			if(request.getParameter("provider")!=null)
				schship.setProvider(thaiLanguage.MS874ToUnicode(request.getParameter("provider")));			
			if(!request.getParameter("number").equals("") && request.getParameter("number")!=null )
				schship.setNumberScholarship(Integer.parseInt(request.getParameter("number")));			
			if(!request.getParameter("money").equals("") && request.getParameter("money")!=null)
				schship.setMoney(Integer.parseInt(request.getParameter("money")));
			if(request.getParameter("duration")!=null)
				schship.setDuration(request.getParameter("duration"));
			if(!request.getParameter("year").equals("") && request.getParameter("year")!=null){
				schship.setDate(request.getParameter("day")+"/"+request.getParameter("month")+"/"+request.getParameter("year"));
			}			
			

			// condition
			if(!request.getParameter("condition1").equals("") && request.getParameter("condition1")!=null)
				schship.setCondition(thaiLanguage.MS874ToUnicode(request.getParameter("condition1")),0);
			if(!request.getParameter("condition2").equals("") && request.getParameter("condition2")!=null )
				schship.setCondition(thaiLanguage.MS874ToUnicode(request.getParameter("condition2")),1);
			if(!request.getParameter("condition3").equals("") && request.getParameter("condition3")!=null )
				schship.setCondition(thaiLanguage.MS874ToUnicode(request.getParameter("condition3")),2);
			if(!request.getParameter("condition4").equals("") && request.getParameter("condition4")!=null)
				schship.setCondition(thaiLanguage.MS874ToUnicode(request.getParameter("condition4")),3);
			if(!request.getParameter("condition5").equals("") && request.getParameter("condition5")!=null)
				schship.setCondition(thaiLanguage.MS874ToUnicode(request.getParameter("condition5")),4);
			if(!request.getParameter("condition6").equals("") && request.getParameter("condition6")!=null)
				schship.setCondition(thaiLanguage.MS874ToUnicode(request.getParameter("condition6")),5);
			if(!request.getParameter("condition7").equals("") && request.getParameter("condition7")!=null)
				schship.setCondition(thaiLanguage.MS874ToUnicode(request.getParameter("condition7")),6);
			if(!request.getParameter("condition8").equals("") && request.getParameter("condition8")!=null)
				schship.setCondition(thaiLanguage.MS874ToUnicode(request.getParameter("condition8")),7);
			if(!request.getParameter("condition9").equals("") && request.getParameter("condition9")!=null)
				schship.setCondition(thaiLanguage.MS874ToUnicode(request.getParameter("condition9")),8);
			if(!request.getParameter("condition10").equals("") && request.getParameter("condition10")!=null)
				schship.setCondition(thaiLanguage.MS874ToUnicode(request.getParameter("condition10")),9);		
		
		return schship;
	}
//--------------------------------------------------------------------------------------- end getScholarshipInfo from web page

//--------------------------------------------------------------------------------------- start addScholarship
	public void addScholarship(String sqlCommand ,Scholarship schship,PrintWriter out)throws Exception{
		PreparedStatement pstmt;
		Statement stmt;
		ResultSet rs;
		String sql="";

		
		connectDB(out);
		// **************  ตรวจสอบว่ามีทุนการศึกษาอันนี้แล้วหรือไม่ **************่
		if(schship.getType().equals("ทุนการศึกษา")){	// ทุนการศึกษา
				String dateCondition="";
				if(!schship.getDate().equals(""))
					dateCondition="AND DATE='"+schship.getDate()+"' ";
				sql =	"SELECT SCHOLARSHIP# FROM SCHOLARSHIP WHERE "+
							"NAME='"+schship.getName()+"' AND PROVIDER='"+schship.getProvider()+"' "+
							"AND ACADEMICYEAR='"+schship.getAcademicYear()+"' "+dateCondition;
		}
		else{ // ทุนทำวิทยานิพนธ์ , ทุนเสนอบทความทางวิชาการ
				sql = "SELECT SCHOLARSHIP# FROM SCHOLARSHIP WHERE TYPE =  '"+schship.getType()+"' "+
											"AND ACADEMICYEAR='"+schship.getAcademicYear()+"' ";
		}

		//out.println("sql select 1 : "+sqlCommand); // test
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		if(rs.next()){	
			out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../addscholarship.jsp\" class = \"pathlink2\">เพิ่มรายชื่อทุนการศึกษา</a>","เพิ่มรายชื่อทุนการศึกษา"));
			out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"FF0000\" style=\"font:16px\">ไม่สามารถเพิ่มรายชื่อทุนการศึกษานี้ได้<br>"+
																							"เนื่องจากทุนนี้ ในปีการศึกษานี้มีอยู่แล้ว</font>"));
			out.println(	"<br><form action=\"../addscholarship.jsp\" method=\"post\" name=\"form1\" >\n"+
								"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
								"</form>\n");								
			out.println(htmlTemplate.getEnd());
			rs.close();
			stmt.close();
			return;
		}
		rs.close();
		stmt.close();

		// *************** insert ทุนการศึกษาลง table SCHOLARSHIP ***************
		
//		out.println("sqlCommand : "+sqlCommand);		// test
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();	


		// ***************  select รหัสทุนการศึกาษา( scholarship#) ที่เพิ่ง insert ไป จาก table SCHOLARSHIP  ***************
		if(schship.getType().equals("ทุนการศึกษา")){	 // ทุนการศึกษา
				String dateCondition="";
				if(!schship.getDate().equals(""))
					dateCondition="AND DATE='"+schship.getDate()+"' ";
				sqlCommand = "SELECT SCHOLARSHIP# FROM SCHOLARSHIP WHERE TYPE = '"+schship.getType()+"' "+
											"AND NAME='"+schship.getName()+"' AND PROVIDER='"+schship.getProvider()+"' "+
											"AND ACADEMICYEAR='"+schship.getAcademicYear()+"' "+dateCondition;
		}
		else{ // ทุนทำวิทยานิพนธ์ , ทุนเสนอบทความทางวิชาการ
				sqlCommand = "SELECT SCHOLARSHIP# FROM SCHOLARSHIP WHERE TYPE =  '"+schship.getType()+"' "+
											"AND ACADEMICYEAR='"+schship.getAcademicYear()+"' ";
		}

		// out.println("sql select 2 : "+sqlCommand); // test
		stmt = con.createStatement();
		rs = stmt.executeQuery(sqlCommand);
		if(rs.next()){
			schship.setScholarshipID(rs.getInt("SCHOLARSHIP#"));
		}

		// insert เงื่อนไข ลง table SCHOLARSHIPCON
		connectDB(out);
		for(int i=0;i<schship.getCondition().length;i++){
			if(!schship.getCondition(i).equals("")){
					sqlCommand = "INSERT INTO SCHOLARSHIPCON(SCHOLARSHIP#,CONDITION) "+
												"VALUES("+schship.getScholarshipID()+", '"+schship.getCondition(i)+"' )";
//					out.println("<br>condition : "+sqlCommand);	// test
					pstmt = con.prepareStatement(sqlCommand);
					pstmt.executeUpdate();
					pstmt.close();
			}
		}
		closeDB();

			closeDB();
			out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../addscholarship.jsp\" class = \"pathlink2\">เพิ่มรายชื่อทุนการศึกษา</a>","เพิ่มรายชื่อทุนการศึกษา"));
			out.println(thaiLanguage.UnicodeToMS874(	"<br><font class=\"insfont\" style=\"font:16px\">เพิ่มรายชื่อทุนการศึกษาเรียบร้อยแล้ว<br>"+
																							"รหัสทุนคือ&nbsp;<b>"+schship.getScholarshipID()+"<b></font>"));
			out.println(	"<br><form action=\"../addscholarship.jsp\" method=\"post\" name=\"form1\" >\n"+
								"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
								"</form>\n");								
			out.println(htmlTemplate.getEnd());
		

		
	} // end addScholarship
//--------------------------------------------------------------------------------------- end addScholarship

//--------------------------------------------------------------------------------------- start deleteScholarhip
	public void deleteScholarhip(String sqlCommand ,String scholarshipID,PrintWriter out)throws Exception{
		PreparedStatement pstmt;
		Statement stmt;
		ResultSet rs;
		Scholarship schship = new Scholarship();
		
		schship.setScholarshipID(Integer.parseInt(scholarshipID));
		connectDB(out);
		stmt=con.createStatement();

		// ดึงข้อมูล ประเภททุนการศึกษา
		String sql="SELECT TYPE FROM SCHOLARSHIP WHERE SCHOLARSHIP#="+schship.getScholarshipID()+"";
		rs = stmt.executeQuery(sql);
		if(rs.next()){		// มีข้อมูลอยู่
			if(rs.getString("TYPE")!=null)
				schship.setType(thaiLanguage.MS874ToUnicode(rs.getString("TYPE")));
		}
		rs.close();
		stmt.close();
		
		// ลบข้อมูลเงื่อนไขของทุนการศึกษา
		sql = "DELETE FROM SCHOLARSHIPCON WHERE SCHOLARSHIP#="+schship.getScholarshipID()+"";
		pstmt = con.prepareStatement(sql);
		pstmt.executeUpdate();
		pstmt.close();	

		// ลบข้อมูลทุนการศึกษา
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();	

		closeDB();
		
		// แสดงข้อความ ลบข้อมูลเรียบร้อย
		out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> ลบข้อมูลทุนการศึกษา","ลบข้อมูลทุนการศึกษา"));
		out.println(thaiLanguage.UnicodeToMS874(	"<br><font class=\"insfont\" style=\"font:16px\">ลบข้อมูล"+schship.getType()+"เรียบร้อยแล้ว</font>"));
		out.println(	"<br><form action=\"../viewscholarship.jsp\" method=\"post\" name=\"form1\" >\n"+
							"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
							"</form>\n");								
		out.println(htmlTemplate.getEnd());


	} // end deleteScholarhip
//--------------------------------------------------------------------------------------- end deleteScholarhip

//--------------------------------------------------------------------------------------- start listScholarship
	public void listScholarship(String academicYear,PrintWriter out)throws Exception{
		Statement stmt;
		ResultSet rs;
		
		Scholarship schship = new Scholarship();
		schship.setAcademicYear(academicYear);

		connectDB(out);
		stmt=con.createStatement();

		out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholarship.jsp\" class = \"pathlink2\">ดูข้อมูลทุนการศึกษา</a>","ข้อมูลทุนการศึกษา"));
		out.println(thaiLanguage.UnicodeToMS874(	"<br><font class=\"miniheader\">ทุนการศึกษา ปีการศึกษา&nbsp;"+schship.getAcademicYear()+"</font>"));
		out.println(thaiLanguage.UnicodeToMS874("<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\"  bordercolor=\"#9999CC\"  rules=\"rows\">\n"+
		"<tr>\n"+
		"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"30\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;รายชื่อทุนการศึกษา</font></td>\n"+	// empty
		"</tr>\n"+
		"<tr>\n"+
		"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"10\" ></td>\n"+	// empty
		"</tr>\n"+
		"<tr> \n"+
		"	<td width=\"150\" align=\"left\" valign=\"middle\"  bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;&nbsp;&nbsp;รหัสทุน</font></td>\n"+
		"	<td width=\"500\" align=\"left\" valign=\"middle\"  bgcolor=\"#D6D6EB\"><font class=\"miniheader\">ชื่อทุน</font></td>\n"+
		"</tr>"));
		String sqlCommand="SELECT * FROM SCHOLARSHIP WHERE ACADEMICYEAR ='"+schship.getAcademicYear()+"' ORDER BY SCHOLARSHIP#";
		rs = stmt.executeQuery(sqlCommand);
		int cnt = 0;
		while(rs.next()){		// มีข้อมูลอยู่
			if(rs.getInt("SCHOLARSHIP#")+"" != null)
				schship.setScholarshipID(rs.getInt("SCHOLARSHIP#"));
			if(rs.getString("NAME") != null)
				schship.setName(thaiLanguage.UnicodeToMS874(rs.getString("NAME")));
			
			out.println(	"<tr>\n"+
								"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\">&nbsp;&nbsp;&nbsp;<a href=\"scholarshipWork?scholarshipID="+schship.getScholarshipID()+"\" class=\"link1\">"+schship.getScholarshipID()+"</a></td>\n"+
								"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><a href=\"scholarshipWork?scholarshipID="+schship.getScholarshipID()+"\" class=\"link1\">"+schship.getName()+"</a></td>\n"+
								"</tr>\n");
			cnt++;
		}
		if(cnt==0){	// ไม่มีข้อมูลอยู่
			out.println(	"<tr>\n"+
								"<td colspan=\"2\" align=\"center\" valign=\"middle\">");
			out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลทุนการศึกษา</font>"));
			out.println(	"<br><form action=\"../viewscholarship.jsp\" method=\"post\" name=\"form1\" >\n"+
								"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
								"</form>\n");
			out.print(		"</td>\n"+
								"</tr>\n");
			rs.close();
			stmt.close();
			closeDB();
			return;
		}
		out.println(	"<tr>\n"+
							"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"10\" ></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+
							"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"3\" bgcolor=\"#9999CC\"></td>\n"+	// line end
							"</tr>\n"+
							"</table>");
		out.println("<br><a href=\"../viewscholarship.jsp\" class=\"link1\" >"+thaiLanguage.UnicodeToMS874("ยกเลิก")+"</a>");
		rs.close();
		stmt.close();
		closeDB();

		out.println(htmlTemplate.getEnd());

	} // end listScholarship
//--------------------------------------------------------------------------------------- end listScholarship

//--------------------------------------------------------------------------------------- start viewScholarship
	public void viewScholarship(int scholarshipID,PrintWriter out)throws Exception{
		Statement stmt;
		ResultSet rs;
		String sqlCommand="";
		Scholarship schship = new Scholarship();
		schship.setScholarshipID(scholarshipID);
		
		connectDB(out);
		stmt=con.createStatement();
		// ดึงข้อมูลทุนการศึกษา จาก table SCHOLARSHIP
		sqlCommand = "SELECT * FROM SCHOLARSHIP WHERE "+
									"SCHOLARSHIP#="+schship.getScholarshipID()+" ";		
		rs = stmt.executeQuery(sqlCommand);
		if(rs.next()){		// มีข้อมูลอยู่
			if(rs.getInt("SCHOLARSHIP#")+"" != null )
				schship.setScholarshipID(rs.getInt("SCHOLARSHIP#"));
			if(rs.getString("NAME")!=null)
				schship.setName(thaiLanguage.UnicodeToMS874(rs.getString("NAME")));
			if(rs.getString("ACADEMICYEAR")!=null)
				schship.setAcademicYear(rs.getString("ACADEMICYEAR"));
			if(rs.getString("PROVIDER") != null)
				schship.setProvider(thaiLanguage.UnicodeToMS874(rs.getString("PROVIDER")));
			if(rs.getString("DATE")!=null)
				schship.setDate(thaiLanguage.UnicodeToMS874(myDate.getThaiDate(rs.getString("DATE"))));
			if(rs.getInt("MONEY")+"" !=null)
				schship.setMoney(rs.getInt("MONEY"));
			if(rs.getInt("NUMBERSCHOLARSHIP")+"" != null)
				schship.setNumberScholarship(rs.getInt("NUMBERSCHOLARSHIP"));
			if(rs.getString("DURATION")!=null)
				schship.setDuration(rs.getString("DURATION"));
			if(rs.getString("TYPE")!=null)
				schship.setType(rs.getString("TYPE"));		
		}
		else{					// ไม่มีข้อมูลอยู่
			out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholarship.jsp\" class = \"pathlink2\">ดูข้อมูลทุนการศึกษา</a>","ดูข้อมูลทุนการศึกษา"));
			out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลทุนการศึกษา</font>"));
			out.println(	"<br><form action=\"../viewscholarship.jsp\" method=\"post\" name=\"form1\" >\n"+
								"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
								"</form>\n");								
			out.println(htmlTemplate.getEnd());
			rs.close();
			stmt.close();
			closeDB();
			return;
		}
		rs.close();		

		// แสดงผลข้มูลทุนการศึกษา
		out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholarship.jsp\" class = \"pathlink2\">ดูข้อมูลทุนการศึกษา</a>","ข้อมูลทุนการศึกษา"));
		out.println(	"<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\">\n"+
							"<tr>\n"+
							"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"30\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("ข้อมูลทุนการศึกษา")+"</font><font class=\"insfont\">&nbsp;</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"10\" ></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+
							"		<td width=\"150\" valign=\"top\" align=\"right\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสทุน</b>")+"&nbsp;</font></td>\n"+
							"	    <td width=\"500\" valign=\"top\" align=\"left\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schship.getScholarshipID()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"		<td width=\"150\" valign=\"top\" align=\"right\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ประเภททุน</b>")+"&nbsp;</font></td>\n"+
							"	    <td width=\"500\" valign=\"top\" align=\"left\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(schship.getType())+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	    <td valign=\"top\" align=\"right\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ปีการศึกษา</b>")+"&nbsp;</font></td>\n"+
							"	    <td valign=\"top\" align=\"left\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schship.getAcademicYear()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	    <td valign=\"top\" align=\"right\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อทุน</b>")+"&nbsp;</font></td>\n"+
							"	    <td valign=\"top\" align=\"left\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schship.getName()+"</font></td>\n"+
							"</tr>\n");

		if( thaiLanguage.MS874ToUnicode(schship.getType()).equals("ทุนการศึกษา") ){	// ทุนการศึกษา
		out.println(	"<tr>\n"+
							"	    <td valign=\"top\" align=\"right\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ผู้ให้ทุน</b>")+"&nbsp;</font></td>\n"+
							"	    <td valign=\"top\" align=\"left\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schship.getProvider()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	    <td valign=\"top\" align=\"right\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>วันที่ให้ทุน</b>")+"&nbsp;</font></td>\n"+
							"	    <td valign=\"top\" align=\"left\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schship.getDate()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	    <td valign=\"top\" align=\"right\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>จำนวนทุน</b>")+"&nbsp;</font></td>\n"+
							"	    <td valign=\"top\" align=\"left\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schship.getNumberScholarship()+"&nbsp; "+thaiLanguage.UnicodeToMS874("ทุน")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	    <td valign=\"top\" align=\"right\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ทุนละ</b>")+"&nbsp;</font></td>\n"+
							"	    <td valign=\"top\" align=\"left\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schship.getMoney()+"&nbsp;"+thaiLanguage.UnicodeToMS874("บาท")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	    <td valign=\"top\" align=\"right\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ระยะเวลา</b>")+"&nbsp;</font></td>\n"+
							"	    <td valign=\"top\" align=\"left\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schship.getDuration()+"&nbsp;"+thaiLanguage.UnicodeToMS874("ปี")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"10\" ></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+
							"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"30\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("เงื่อนไขการรับทุน")+"</font><font class=\"insfont\">&nbsp;</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"10\" ></td>\n"+	// empty
							"</tr>\n");
		
		sqlCommand = "SELECT * FROM SCHOLARSHIPCON WHERE SCHOLARSHIP# ="+schship.getScholarshipID()+"";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sqlCommand);
		int i = 0;
		while(rs.next()){
			if(rs.getString("CONDITION")!=null){
				schship.setCondition(thaiLanguage.UnicodeToMS874(rs.getString("CONDITION")),i);
				out.println(	"<tr>\n"+
									"	    <td valign=\"top\" align=\"right\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>"+(i+1)+".</b>&nbsp;</font></td>\n"+
									"	    <td valign=\"top\" align=\"left\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schship.getCondition(i)+"</font></td>\n"+
									"</tr>\n");
				i++;
			}
		}
		stmt.close();
		closeDB();
		} // end if type = ทุนการศึกษา

		out.println(	"<tr>\n"+
							"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"10\" ></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+
							"<td colspan=\"2\" align=\"left\" valign=\"middle\" height=\"3\" bgcolor=\"#9999CC\"></td>\n"+	// line end
							"</tr>\n"+
							"</table>\n");
		out.println(	"<br><form action=\"scholarshipWork\" method=\"post\" name=\"form1\" >\n"+
							"  <input type=\"hidden\" name=\"scholarshipID\" value=\""+schship.getScholarshipID()+"\">"+
							"	<input type=\"submit\" name=\"deleteScholarship\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;ลบข้อมูล&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\" onClick=\"return confirmDel()\">\n"+
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+	
							"	<input type=\"submit\" name=\"cancelViewScholarship\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
							"</form>\n");								
							
							
		
		out.println( htmlTemplate.getEnd() );
	
	} // end addScholarship
//--------------------------------------------------------------------------------------- end viewScholarship

//--------------------------------------------------------------------------------------- end retrieveScholarshipInfo
public paperScholarship retrieveScholarshipInfo(int scholarshipID,PrintWriter out)throws Exception{
	Statement stmt;
	ResultSet rs;
	Scholarship schship = new Scholarship();

	schship.setScholarshipID(scholarshipID);
	connectDB(out);
	stmt = con.createStatement();
	String sqlCommand = "SELECT * FROM SCHOLARSHIP WHERE SCHOLARSHIP#="+schship.getScholarshipID()+"";
	rs = stmt.executeQuery(sqlCommand);
	if(rs.next()){
		if(rs.getString("NAME")!=null)
			schship.setName(rs.getString("NAME"));
		if(rs.getString("TYPE")!=null)
			schship.setType(rs.getString("TYPE"));
		if(rs.getString("ACADEMICYEAR")!=null)
			schship.setAcademicYear(rs.getString("ACADEMICYEAR"));
		if(rs.getInt("NUMBERSCHOLARSHIP")+"" !=null )
			schship.setNumberScholarship(rs.getInt("NUMBERSCHOLARSHIP"));
		if(rs.getInt("MONEY")+"" !=null)
			schship.setMoney(rs.getInt("MONEY"));
		if(rs.getString("DURATION")!=null)
			schship.setDuration(rs.getString("DURATION"));
	}
	rs.close();
	stmt.close();
	closeDB();

	return schship;

} // end retrieveScholarshipInfo
//--------------------------------------------------------------------------------------- end retrieveScholarshipInfo

//--------------------------------------------------------------------------------------- Start retrieveScholarInfo
public Student retrieveScholarInfo(String stdID,PrintWriter out)throws Exception{
	Statement stmt;
	ResultSet rs;
	Student std = new Student();

	std.setStdID(stdID);
	connectDB(out);
	stmt = con.createStatement();
	String sqlCommand = 	"SELECT S.STD#, S.TPRE, S.TNAME, S.TFAMILY, S.SEX , C.TNAME AS CNAME,  "+
											"M.TNAME AS MNAME, F.TNAME AS FNAME, D.TNAME AS DNAME  "+
											"FROM STUDENT S , COURSE C , MAJOR M , FACULTY F , DEPARTMENT D  "+
											"WHERE STD# ='"+std.getStdID()+"'  "+
											"AND C.CO# = ( SELECT CO# FROM STUDENT WHERE STD# ='"+std.getStdID()+"')  "+
											"AND M.MAJOR# = ( SELECT MAJOR# FROM STUDENT WHERE STD# ='"+std.getStdID()+"')  "+
											"AND F.FACT# = ( SELECT FACT# FROM STUDENT WHERE STD# ='"+std.getStdID()+"')  "+
											"AND D.DEPT# = ( SELECT DEPT# FROM STUDENT WHERE STD# ='"+std.getStdID()+"')  ";
	rs = stmt.executeQuery(sqlCommand);
	if(rs.next()){
		if(rs.getString("TPRE")!=null)		
				std.setTpre(thaiLanguage.MS874ToUnicode(rs.getString("TPRE")));
		if(rs.getString("TNAME")!=null)		
				std.setTname(thaiLanguage.MS874ToUnicode(rs.getString("TNAME")));
		if(rs.getString("TFAMILY")!=null)		
				std.setTfamily(thaiLanguage.MS874ToUnicode(rs.getString("TFAMILY")));		
		if(rs.getString("CNAME")!=null)		
				std.setCourseName(thaiLanguage.MS874ToUnicode(rs.getString("CNAME")));
		if(rs.getString("MNAME")!=null)		
				std.setMajorName(thaiLanguage.MS874ToUnicode(rs.getString("MNAME")));
		if(rs.getString("FNAME")!=null)		
				std.setFactName(thaiLanguage.MS874ToUnicode(rs.getString("FNAME")));
		if(rs.getString("DNAME")!=null)		
				std.setDeptName(thaiLanguage.MS874ToUnicode(rs.getString("DNAME")));
	}
	rs.close();
	stmt.close();
	closeDB();

	return std;

} // end retrieveScholarshipInfo
//--------------------------------------------------------------------------------------- end retrieveScholarInfo

//--------------------------------------------------------------------------------------- start addScholar
public void addScholar(String sqlCommand ,PrintWriter out)throws Exception{
		PreparedStatement pstmt;
		connectDB(out);
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();	
		closeDB();		
}
//--------------------------------------------------------------------------------------- end addScholar

//--------------------------------------------------------------------------------------- start listScholarFromScholarshipID
public void listScholarFromScholarshipID(int scholarshipID,PrintWriter out)throws Exception{
		Scholarship schship = new Scholarship();
		Student std =new Student();
		schship.setScholarshipID(scholarshipID);
		
		Statement stmt;
		ResultSet rs;			
		
		String sqlCommand = "SELECT * FROM SCHOLARSHIP WHERE SCHOLARSHIP# ="+schship.getScholarshipID()+"";
		connectDB(out);
		stmt = con.createStatement();
		rs=stmt.executeQuery(sqlCommand);
		while( rs.next() ){
			if( rs.getInt("SCHOLARSHIP#")+"" != null)
				schship.setScholarshipID( rs.getInt("SCHOLARSHIP#") );
			if( rs.getString("NAME") != null)
				schship.setName( rs.getString("NAME") );
			if( rs.getString("TYPE") != null)
				schship.setType( rs.getString("TYPE") );
			if( rs.getString("ACADEMICYEAR") != null)
				schship.setAcademicYear( rs.getString("ACADEMICYEAR") );
			if( rs.getInt("NUMBERSCHOLARSHIP")+"" != null)
				schship.setNumberScholarship( rs.getInt("NUMBERSCHOLARSHIP") );
			if( rs.getInt("MONEY")+"" != null)
				schship.setMoney( rs.getInt("MONEY") );
			if( rs.getString("DURATION") != null)
				schship.setDuration( rs.getString("DURATION") );
		}
		rs.close();
		out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุน</a>","ดูรายชื่อนักศึกษาที่ได้รับทุน"));
		// แสดงผลข้อมูลทุนการศึกษา
		out.println(	"<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\">\n"+
							"<tr>\n"+
							"	<td colspan=\"2\" height=\"31\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874(schship.getType())+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+
							"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสทุน</b>")+"&nbsp;</font></td>\n"+
							"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\" >"+schship.getScholarshipID()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ประเภททุน</b>")+"&nbsp;</font></td>\n"+
							"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(schship.getType())+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อทุน</b>")+"&nbsp;</font></td>\n"+
							"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(schship.getName())+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ปีการศึกษา</b>")+"&nbsp;</font></td>\n"+
							"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(schship.getAcademicYear())+"</font></td>\n"+
							"</tr>\n");
		if( thaiLanguage.MS874ToUnicode(schship.getType()).equals(thaiLanguage.MS874ToUnicode("ทุนการศึกษา")) ){
			out.println(thaiLanguage.UnicodeToMS874("<tr>\n<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>จำนวนทุน</b>&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schship.getNumberScholarship()+"&nbsp;ทุน&nbsp;&nbsp;&nbsp;<b>ทุนละ</b>&nbsp;"+schship.getMoney()+
								"&nbsp;บาท&nbsp;&nbsp;&nbsp;<b>ระยะเวลา</b>&nbsp;"+schship.getDuration()+"&nbsp;ปี</font></td>\n"+
								"</tr>\n"));
		}
		out.println("<tr>\n"+
							"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
							"</tr>\n");
		
	
		// list รายชื่อสักศึกษาที่ได้รับทุนนี้
		String sql ="SELECT S.STD#, S.TPRE, S.TNAME, S.TFAMILY "+
							"FROM STUDENT S "+
							"WHERE S.STD# IN ( SELECT STD# FROM SCHOLARSHIPOFFER WHERE SCHOLARSHIP# = "+schship.getScholarshipID()+") "+
							"ORDER BY S.STD#";
				
		// แสดงหัวข้อรายชื่อนักศึกษาที่ได้รับทุน
		out.println(	"<tr>\n"+
							"	<td colspan=\"2\" height=\"31\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("รายชื่อนักศึกษาที่ได้รับ"+schship.getType())+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+	 // Cover 
							"<td colspan=\"2\" align=\"left\" valign=\"top\">\n"+   // Cover
							"		<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\"  rules=\"rows\" frame=\"void\">\n"+
							"		<tr>\n"+
							"			<td width=\"180\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;&nbsp;&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("รหัสนักศึกษา")+"</font></td>\n"+
							"			<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;"+thaiLanguage.UnicodeToMS874("ชื่อนักศึกษา")+"</font></td>\n"+
							"		</tr>\n");
				
			rs = stmt.executeQuery(sql);
			int cnt = 0;
			while(rs.next()){
				if(rs.getString("STD#")!=null)		
						std.setStdID(thaiLanguage.UnicodeToMS874(rs.getString("STD#")));
				if(rs.getString("TPRE")!=null)		
						std.setTpre(thaiLanguage.UnicodeToMS874(rs.getString("TPRE")));
				if(rs.getString("TNAME")!=null)		
						std.setTname(thaiLanguage.UnicodeToMS874(rs.getString("TNAME")));
				if(rs.getString("TFAMILY")!=null)		
						std.setTfamily(thaiLanguage.UnicodeToMS874(rs.getString("TFAMILY")));			

				// แสดงรายชื่อนักศึกษาที่ได้รับทุนนี้
				out.println(	"<tr>\n"+
									"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
												"<a href=\"scholarshipWork?viewScholarID="+std.getStdID()+"&viewScholarshipID="+schship.getScholarshipID()+" \" class=\"link1\" >"+std.getStdID()+"</a></font></td>\n"+
									"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;&nbsp;<a href=\"scholarshipWork?viewScholarID="+std.getStdID()+"&viewScholarshipID="+
												schship.getScholarshipID()+" \" class=\"link1\" >"+thaiLanguage.UnicodeToMS874(std.getTpre()+std.getTname()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+std.getTfamily())+"</a></font></td>\n"+
									"</tr>\n");
				cnt++;
			}
			rs.close();
			stmt.close();
			closeDB();
			if( cnt == 0 ){	// ไม่มีรายชื่อนักศึกษาได้รับทุนนี้
					out.println(	"<tr>\n"+
										"	<td  colspan=\"2\" align=\"center\" valign=\"top\"><br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\">\n"+
										"	<font color=\"#FF0000\" style=\"font:16px\">"+thaiLanguage.UnicodeToMS874("ไม่มีรายชื่อนักศึกษาที่ได้รับทุนนี้")+"</font>\n"+
										"	<br><br><input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"	</form></td>\n"+	
										"</tr>\n");				
			}		

			out.println(	"	</table>\n"+
								"</td>\n"+	// Cover
								"</tr>\n"+	// Cover
								"<tr>\n"+
								"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
								"</tr>\n"+
								"<tr>\n"+
								"	<td height=\"3\" colspan=\"2\" align=\"right\" valign=\"top\" bgcolor=\"#9999CC\"></td>\n"+	// empty
								"</tr>\n");					

			out.println("</table>\n");

			out.println("<br><a href=\"../viewscholar.jsp\" class=\"link1\" >"+thaiLanguage.UnicodeToMS874("ยกเลิก")+"</a>");
			out.println(htmlTemplate.getEnd());
}
//--------------------------------------------------------------------------------------- end listScholarFromScholarshipID

//--------------------------------------------------------------------------------------- start listScholarFromYear
public void listScholarFromYear( String academicYear,PrintWriter out )throws Exception{

		Statement stmt;
		ResultSet rs;
		
		Scholarship schship = new Scholarship();
		schship.setAcademicYear(academicYear);
		
		out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุน</a>","ดูรายชื่อนักศึกษาที่ได้รับทุน"));
		out.println(thaiLanguage.UnicodeToMS874("<br><font class=\"miniheader\">รายชื่อทุน&nbsp;ปีการศึกษา&nbsp;"+academicYear+"</font>") );			
		out.println("<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\" rules=\"rows\">\n"+
							"<tr>\n"+
							"	<td colspan=\"2\" height=\"31\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("รายชื่อทุน")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+
							"	<td width=\"100\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\">&nbsp;&nbsp;&nbsp;"+thaiLanguage.UnicodeToMS874("รหัสทุน")+"&nbsp;</font></td>\n"+
							"	<td width=\"550\" align=\"left\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"miniheader\" >"+thaiLanguage.UnicodeToMS874("ชื่อทุน")+"</font></td>\n"+
							"</tr>\n");
		connectDB(out);
		stmt = con.createStatement();
		String sqlCommand = "SELECT * FROM SCHOLARSHIP WHERE ACADEMICYEAR= '"+academicYear+"' ORDER BY TYPE";
		rs = stmt.executeQuery(sqlCommand);
		int cnt = 0;
		while(rs.next()){
			if(rs.getString("SCHOLARSHIP#") != null)
				schship.setScholarshipID(rs.getInt("SCHOLARSHIP#") );
			if(rs.getString("ACADEMICYEAR") != null)
				schship.setAcademicYear(rs.getString("ACADEMICYEAR") );
			if(rs.getString("NAME") != null)
				schship.setName(thaiLanguage.UnicodeToMS874(rs.getString("NAME")) );
			
			out.println(	"<tr>\n"+
								"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+
											"<a href=\"scholarshipWork?listScholarshipID="+schship.getScholarshipID()+"\" class=\"link1\">"+schship.getScholarshipID()+"</a></font></td>\n"+
								"	<td align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><a href=\"scholarshipWork?listScholarshipID="+schship.getScholarshipID()+"\" class=\"link1\">"+schship.getName()+"</a></td>\n"+
								"</tr>\n");
			cnt++;
		}
		rs.close();
		stmt.close();
		closeDB();
		if(cnt == 0 ){	// ไม่มีรายชื่อทุนการศึกษาในปีการศึกษาที่ระบุมา
				out.println(	"<tr>\n"+
									"	<td colspan=\"2\" align=\"center\" valign=\"top\">"+
									"	<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\">\n"+
									"	<font color=\"#FF0000\" style=\"font:16px\">"+thaiLanguage.UnicodeToMS874("ไม่มีรายชื่อทุนการศึกษาในปีการศึกษาที่ระบุมา")+"</font>\n"+
									"	<br><br><input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"	</form></td></tr>\n"	);
		}

		out.println(	"<tr>\n"+
							"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+
							"	<td height=\"3\" colspan=\"2\" align=\"right\" valign=\"top\" bgcolor=\"#9999CC\"></td>\n"+	// empty
							"</tr>\n");					
		out.println("</table>\n");
		out.println("<br><a href=\"../viewscholar.jsp\" class=\"link1\" >"+thaiLanguage.UnicodeToMS874("ยกเลิก")+"</a>");
		out.println(htmlTemplate.getEnd());

}
//--------------------------------------------------------------------------------------- end listScholarFromYear

//--------------------------------------------------------------------------------------- start listScholarFromStdID
public void listScholarFromStdID(String stdID ,PrintWriter out)throws Exception{
	ResultSet rs;
	Statement stmt;
	ScholarshipOffer schshipOffer = new ScholarshipOffer();
	Student std =new Student();
	std.setStdID(stdID);
	
	connectDB(out);
	stmt = con.createStatement();
	
	out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุน</a>","ดูรายชื่อนักศึกษาที่ได้รับทุน"));
	out.println(		"<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\">\n"+
							"<tr>\n"+
							"	<td colspan=\"2\" height=\"31\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("ข้อมูลนักศึกษา")+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
							"</tr>\n");
	// get ข้อมูลนักศึกษา
	String	sqlCommand = 	"SELECT S.STD#, S.TPRE, S.TNAME, S.TFAMILY, S.SEX , C.TNAME AS CNAME,  "+
								"M.TNAME AS MNAME, F.TNAME AS FNAME, D.TNAME AS DNAME  "+
								"FROM STUDENT S , COURSE C , MAJOR M , FACULTY F , DEPARTMENT D  "+
								"WHERE STD# ='"+std.getStdID()+"'  "+
								"AND C.CO# = ( SELECT CO# FROM STUDENT WHERE STD# ='"+std.getStdID()+"')  "+
								"AND M.MAJOR# = ( SELECT MAJOR# FROM STUDENT WHERE STD# ='"+std.getStdID()+"')  "+
								"AND F.FACT# = ( SELECT FACT# FROM STUDENT WHERE STD# ='"+std.getStdID()+"')  "+
								"AND D.DEPT# = ( SELECT DEPT# FROM STUDENT WHERE STD# ='"+std.getStdID()+"')  ";			
	rs = stmt.executeQuery(sqlCommand);
	if(rs.next()){
			if(rs.getString("STD#")!=null)
					std.setStdID(rs.getString("STD#"));
			if(rs.getString("TPRE")!=null)		
					std.setTpre(thaiLanguage.UnicodeToMS874(rs.getString("TPRE")));
			if(rs.getString("TNAME")!=null)		
					std.setTname(thaiLanguage.UnicodeToMS874(rs.getString("TNAME")));
			if(rs.getString("TFAMILY")!=null)		
					std.setTfamily(thaiLanguage.UnicodeToMS874(rs.getString("TFAMILY")));
			if(rs.getString("CNAME")!= null)
					std.setCourseName(thaiLanguage.UnicodeToMS874(rs.getString("CNAME")));
			if(rs.getString("MNAME")!= null)
					std.setMajorName(thaiLanguage.UnicodeToMS874(rs.getString("MNAME")));
			if(rs.getString("FNAME")!= null)
					std.setFactName(thaiLanguage.UnicodeToMS874(rs.getString("FNAME")));
			if(rs.getString("DNAME")!= null)
					std.setDeptName(thaiLanguage.UnicodeToMS874(rs.getString("DNAME")));
	}
	else{	// ไม่มีรายชื่อนักศึกษาได้รับทุนนี้
			rs.close();
			stmt.close();
			closeDB();
			out.println(	"<tr>\n"+
								"	<td  colspan=\"2\" align=\"center\" valign=\"top\"><br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\">\n"+
								"	<font color=\"#FF0000\" style=\"font:16px\">"+thaiLanguage.UnicodeToMS874("ไม่มีข้อมูลนักศึกษา")+"</font>\n"+
								"	<br><br><input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
								"	</form></td>\n"+	
								"</tr>\n");				
			out.println("</table>\n");
			out.println(htmlTemplate.getEnd());
			return;
	}
	rs.close();

	// แสดงข้อมูลนักศึกษาที่ได้รับทุน
			out.println(	"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสนักศึกษา</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+std.getStdID()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อ</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+std.getTpre()+std.getTname()+"&nbsp;&nbsp;&nbsp;&nbsp;"+std.getTfamily()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ศึกษาอยู่หลักสูตร</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+std.getCourseName()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สาขา</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+std.getMajorName()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>คณะ</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+std.getFactName()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ภาควิชา</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+std.getDeptName()+"</font></td>\n"+
								"</tr>\n");

	// get ข้อมุลทุนการศึกษาที่เคยได้รับ

	out.println(	"<tr>\n"+			 // Cover
						"	<td height=\"10\" colspan=\"2\" align=\"left\" valign=\"top\">\n"+ // Cover
						"<table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" frame=\"void\" bordercolor=\"#9999CC\" rules=\"rows\">\n"+
						"<tr>\n"+
						"	<td colspan=\"4\" height=\"31\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("ทุนการศึกษาที่ได้รับ")+"</font></td>\n"+
						"</tr>\n"+
						"<tr>\n"+
						"	<td height=\"10\" colspan=\"4\" align=\"right\" valign=\"top\"></td>\n"+	// empty
						"</tr>\n"+	
						"<tr> \n"+
						"	<td width=\"75\"  align=\"left\" valign=\"bottom\" bgcolor=\"#D6D6EB\">&nbsp;&nbsp;<font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสทุน</b>")+"</font></td>\n"+
						"	<td width=\"355\"  align=\"left\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อทุน</b>")+"</font></td>\n"+
						"	<td width=\"110\"  align=\"left\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>วันที่ได้รับอนุมัติ</b>")+"</font></td>\n"+
						"	<td width=\"110\"  align=\"left\" valign=\"bottom\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ปีการศึกษา</b>")+"</font></td>\n"+
						"</tr>\n");
	sqlCommand = "SELECT S.SCHOLARSHIP# , S.ACADEMICYEAR, S.NAME ,SO.DATE FROM SCHOLARSHIP S ,SCHOLARSHIPOFFER SO "+
								"WHERE SO.STD# = '"+std.getStdID()+"' AND S.SCHOLARSHIP# = SO.SCHOLARSHIP# "+
								"ORDER BY S.SCHOLARSHIP# ";
	
	rs = stmt.executeQuery(sqlCommand);
	int cnt =0;
	while(rs.next()){
		if(rs.getInt("SCHOLARSHIP#")+"" != null)
				schshipOffer.setScholarshipID(rs.getInt("SCHOLARSHIP#") );
		if(rs.getString("ACADEMICYEAR") != null)
				schshipOffer.setScholarshipYear(rs.getString("ACADEMICYEAR") );
		if(rs.getString("NAME") != null)
				schshipOffer.setScholarshipName(thaiLanguage.UnicodeToMS874(rs.getString("NAME")) );
		if(rs.getString("DATE") != null)
				schshipOffer.setOfferDate(rs.getString("DATE"));
		
		out.println(	"	<td width=\"75\"  align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\">&nbsp;&nbsp;<a href=\"scholarshipWork?viewScholarID="+std.getStdID()+"&viewScholarshipID="+schshipOffer.getScholarshipID()+" \" class=\"link2\" >"+schshipOffer.getScholarshipID()+"</a></td>\n"+
							"	<td width=\"355\"  align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><a href=\"scholarshipWork?viewScholarID="+std.getStdID()+"&viewScholarshipID="+schshipOffer.getScholarshipID()+" \" class=\"link2\" >"+schshipOffer.getScholarshipName()+"</a></td>\n"+
							"	<td width=\"110\"  align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(myDate.getThaiDate(schshipOffer.getOfferDate() ))+"</font></td>\n"+
							"	<td width=\"110\"  align=\"left\" valign=\"bottom\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schshipOffer.getScholarshipYear()+"</font></td>\n"+
							"</tr>\n");					
		cnt++;
	}
	rs.close();
	stmt.close();
	closeDB();

	if(cnt==0){
			out.println(	"<tr>\n"+
								"	<td colspan=\"4\" align=\"center\" valign=\"top\">"+
								"	<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\">\n"+
								"	<font color=\"#FF0000\" style=\"font:16px\">"+thaiLanguage.UnicodeToMS874("ไม่มีรายชื่อทุนการศึกษาที่เคยได้รับ")+"</font>\n"+
								"	<br><br><input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
								"	</form></td></tr>\n"	);
	}


	
	out.println("</table>\n"+
						"</td>\n"+	 // Cover
						"</tr>\n"+  // Cover
						"<tr>\n"+
						"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
						"</tr>\n"+
						"<tr>\n"+
						"	<td height=\"3\" colspan=\"2\" align=\"right\" valign=\"top\" bgcolor=\"#9999CC\"></td>\n"+	// empty
						"</tr>\n");					
	out.println("</table>\n");
	out.println("<br><a href=\"../viewscholar.jsp\" class=\"link1\" >"+thaiLanguage.UnicodeToMS874("ยกเลิก")+"</a>");
	out.println(htmlTemplate.getEnd());
}
//--------------------------------------------------------------------------------------- end listScholarFromStdID
	//  ###########    doPost       #################
	public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		server svr= new server();
		url="jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user=svr.getUsername();
		passwd=svr.getPassword();
		
		if(request.getParameter("addScholarship") != null){		//  เพิ่มข้อมูลทุนการศึกษา
			Scholarship schship;
			String sqlCommand="";
			try{					
					if(thaiLanguage.MS874ToUnicode(request.getParameter("scholarshipType")).equals("ทุนการศึกษา")){
						schship = (Scholarship)getScholarshipInfo(request,out);
						String column="NAME , PROVIDER , ACADEMICYEAR , DURATION , TYPE";
						String value=	" '"+schship.getName()+"' , '"+schship.getProvider()+"' , '"+schship.getAcademicYear()+"' , '"+
								schship.getDuration()+"' , '"+schship.getType()+"' ";
								if(!schship.getDate().equals("")){
									column=column+" ,  DATE";
									value=value+", '"+schship.getDate()+"' ";
								}
								if(schship.getMoney() != 0){
									column=column+" ,  MONEY";
									value=value+", "+schship.getMoney()+" ";
								}
								if(schship.getNumberScholarship() != 0){
									column=column+" ,  NUMBERSCHOLARSHIP";
									value=value+", "+schship.getNumberScholarship()+" ";
								}
						sqlCommand =	 "INSERT INTO SCHOLARSHIP("+column+") "+
													 "VALUES("+value+")";
						
						// out.println(thaiLanguage.UnicodeToMS874(sqlCommand));		// test
						addScholarship(sqlCommand,schship,out);
						
					}
					if(thaiLanguage.MS874ToUnicode(request.getParameter("scholarshipType")).equals("ทุนสนับสนุนทำวิทยานิพนธ์") || 
						thaiLanguage.MS874ToUnicode(request.getParameter("scholarshipType")).equals("ทุนเสนอบทความทางวิชาการ") ){
						
						schship = new Scholarship();
						schship.setType(thaiLanguage.MS874ToUnicode(request.getParameter("scholarshipType")));
						schship.setAcademicYear(thaiLanguage.MS874ToUnicode(request.getParameter("academicYear")));
						schship.setName(schship.getType());
						sqlCommand = "INSERT INTO SCHOLARSHIP( NAME, TYPE , ACADEMICYEAR ) VALUES( '"+schship.getName()+"','"+schship.getType()+"' ,"+
													" '"+schship.getAcademicYear()+"' )";
						//out.println(thaiLanguage.UnicodeToMS874(sqlCommand));
						addScholarship(sqlCommand,schship,out);
						
					}					
			}
			catch (SQLException e){out.println("addScholarship SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("addScholarship Exception in servlet  : "+e.getMessage());return;}	
		}	// end request.getParameter("addScholarship")

		if(request.getParameter("cancelAddScholarship") != null){		//  ยกเลิกเพิ่มข้อมูลทุนการศึกษา
			response.sendRedirect("../addscholarship.jsp");
			return;
		} // end request.getParameter("cancelAddScholarship")

		if(request.getParameter("listScholarship") != null){		//  list ข้อมูลทุนการศึกษา
			try{
					String academicYear = "";
					if(request.getParameter("academicYear") != null)
						academicYear = request.getParameter("academicYear");
					listScholarship(academicYear,out);

			}			
			catch (SQLException e){out.println("viewScholarship SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("viewScholarship Exception in servlet  : "+e.getMessage());return;}	
		}	// end request.getParameter("listScholarship")

		if(request.getParameter("viewScholarship") != null){		//  ดูข้อมูลทุนการศึกษา
			try{
					int scholarshipID = 0;
					if(request.getParameter("scholarshipID") != null)
						scholarshipID = Integer.parseInt(request.getParameter("scholarshipID"));

					viewScholarship(scholarshipID,out);

			}
			catch (NumberFormatException e){
				out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholarship.jsp\" class = \"pathlink2\">ดูข้อมูลทุนการศึกษา</a>","ดูข้อมูลทุนการศึกษา"));
				out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">กรุณาใส่รหัสข้อมูลทุนการศึกษาเป็นตัวเลข</font>"));
				out.println(	"<br><form action=\"../viewscholarship.jsp\" method=\"post\" name=\"form1\" >\n"+
									"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
				out.println(htmlTemplate.getEnd());	
				return;
			}
			catch (SQLException e){out.println("viewScholarship SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("viewScholarship Exception in servlet  : "+e.getMessage());return;}	
		}	// end request.getParameter("viewScholarship")
		
		if(request.getParameter("deleteScholarship") != null){		//  ลบข้อมูลทุนการศึกษา
			try{
				String scholarshipID="";
				if(request.getParameter("deleteScholarship")!=null)
					scholarshipID = (request.getParameter("scholarshipID"));
				String sqlCommand = "DELETE FROM SCHOLARSHIP WHERE SCHOLARSHIP#="+scholarshipID+ "";
				deleteScholarhip(sqlCommand,scholarshipID,out);
			}
			catch (SQLException e){out.println("deleteScholarship  SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("deleteScholarship Exception in servlet  : "+e.getMessage());return;}	
		} // end request.getParameter("deleteScholarship")

		if(request.getParameter("cancelViewScholarship") != null){		//  ยกเลิกดูข้อมูลทุนการศึกษา
			response.sendRedirect("../viewscholarship.jsp");
			return;
		} // end request.getParameter("cancelViewScholarship")
		
		if(request.getParameter("retrieveScholarshipInfo") != null){		//  retrive ข้อมูลทุนการศึกษาที่จะให้ทุน
		try{
				Scholarship schship = new Scholarship();
				int scholarshipID = Integer.parseInt(request.getParameter("scholarshipID"));
				// ตรวสอบข้อมูลทุนการศึกษาว่ามีอยู่หรือไม่
				String sqlCommand = "SELECT * FROM SCHOLARSHIP WHERE SCHOLARSHIP#="+scholarshipID+"";
				if( !isExist(sqlCommand,out) ){	// ไม่มีข้อมูลทุนอยู่
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../addscholar.jsp\" class = \"pathlink2\">เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</a>","เพิ่มรายชื่อนักศึกษาที่ได้รับทุน"));
						out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่มีข้อมูลทุนการศึกษาที่ระบุมา</font>"));
						out.println(	"<br><form action=\"../addscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
											"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
											"</form>\n");
						out.println(htmlTemplate.getEnd());
						return;
				}
				
				schship = (Scholarship)retrieveScholarshipInfo(scholarshipID,out);
				session.setAttribute("scholarshipInfo",schship);
				response.sendRedirect("../addscholar.jsp");
				return;
		}
		catch (NumberFormatException e){
				out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../addscholar.jsp\" class = \"pathlink2\">เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</a>","เพิ่มรายชื่อนักศึกษาที่ได้รับทุน"));
				out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">กรุณาใส่รหัสข้อมูลทุนการศึกษาเป็นตัวเลข</font>"));
				out.println(	"<br><form action=\"../addscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
									"<input type=\"submit\" name=\"notFoundAddscholarInfo\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");
				out.println(htmlTemplate.getEnd());
				return;
		}
		catch (SQLException e){out.println("viewScholarship SQLException in servlet : "+e.getMessage());return;}
		catch (Exception e){out.println("viewScholarship Exception in servlet  : "+e.getMessage());return;}
		} // end request.getParameter("retrieveScholarshipInfo")

		if(request.getParameter("retrieveScholarInfo") != null){		//  retrive ข้อมูลนักศึกษาที่ได้รับทุน
				
				try{
						Student std  = new Student();
						String stdID = request.getParameter("stdID");
						// ตรวสอบข้อมูลทุนการศึกษาว่ามีอยู่หรือไม่
						String sqlCommand = "SELECT * FROM STUDENT WHERE STD#='"+stdID+"' ";
						if( !isExist(sqlCommand,out) ){	// ไม่มีข้อมูลทุนอยู่
								out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../addscholar.jsp\" class = \"pathlink2\">เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</a>","เพิ่มรายชื่อนักศึกษาที่ได้รับทุน"));
								out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่มีข้อมูลนีกศึกษาที่ระบุมา</font>"));
								out.println(	"<br><form action=\"../addscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
													"<input type=\"submit\" name=\"notFoundAddscholarInfo\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
													"</form>\n");
								out.println(htmlTemplate.getEnd());
								return;
						}
				
						std = retrieveScholarInfo(stdID,out);
						session.setAttribute("stdInfo",std);
						response.sendRedirect("../addscholar.jsp");
						return;
			}
			catch (SQLException e){out.println("retrieveScholarInfo SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("retrieveScholarInfo Exception in servlet  : "+e.getMessage());return;}
		} // end request.getParameter("retrieveScholarInfo")
		
		if(request.getParameter("addScholar") != null){		//  เพิ่มรายชื่อนักศึกษาที่ได้รับทุนการศึกษา
			try{
					paperScholarshipOffer schshipOffer = new paperScholarshipOffer();
					String scholarshipID = request.getParameter("scholarshipID");
					String stdID = request.getParameter("stdID");
					String type = thaiLanguage.MS874ToUnicode(request.getParameter("type"));
					// ตรวจสอบว่ามีข้อมูลทุนและ ข้อมูลนักศึกษาอยู่หรือไม่
					
					String sqlCommand = "SELECT * FROM SCHOLARSHIP WHERE SCHOLARSHIP# = "+scholarshipID+" ";
					if(!isExist(sqlCommand,out)){	 // ไม่มีข้อมูลทุนการศึกษาอยู่
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../addscholar.jsp\" class = \"pathlink2\">เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</a>","เพิ่มรายชื่อนักศึกษาที่ได้รับทุน"));
						out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ทุนการศึกษาที่ระบุมาไม่มีอยู่ในฐานข้อมูล</font>"));
						out.println(	"<br><form action=\"../addscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
									"<input type=\"submit\" name=\"notFoundAddscholarInfo\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());	
						return;
					}
					
					sqlCommand = "SELECT * FROM STUDENT WHERE STD# = '"+stdID+"' ";
					if(!isExist(sqlCommand,out)){	 // ไม่มีข้อมูลนักศึกษาอยู่
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../addscholar.jsp\" class = \"pathlink2\">เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</a>","เพิ่มรายชื่อนักศึกษาที่ได้รับทุน"));
						out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ข้อมูลศึกษาที่ระบุมาไม่มีอยู่ในฐานข้อมูล</font>"));
						out.println(	"<br><form action=\"../addscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
									"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
						out.println(htmlTemplate.getEnd());
						return;
					}
					
					//  get ข้อมูลทุนการศึกษา
					sqlCommand ="";
					String colDate = "";
					String valueDate ="";
					
					if(type.equals("ทุนการศึกษา")){	// type ทุนการศึกษา
						schshipOffer.setScholarshipID(Integer.parseInt(request.getParameter("scholarshipID")));
						schshipOffer.setScholarshipType(thaiLanguage.MS874ToUnicode(request.getParameter("type")));
						schshipOffer.setStdID(request.getParameter("stdID"));
						schshipOffer.setOfferAcademicYear(request.getParameter("academicYear"));
						if(!request.getParameter("offerYear").equals("")){
							schshipOffer.setOfferDate(request.getParameter("offerDay")+"/"+request.getParameter("offerMonth")+"/"+request.getParameter("offerYear"));	
							colDate = ",DATE";
							valueDate = ",'"+schshipOffer.getOfferDate()+"' ";
						}
						sqlCommand = "INSERT INTO SCHOLARSHIPOFFER (STD#,SCHOLARSHIP#,SCHOLARSHIPOFFERTYPE, ACADEMICYEAR"+colDate+") "+ 
													"VALUES ('"+schshipOffer.getStdID()+"',"+schshipOffer.getScholarshipID()+",'"+schshipOffer.getScholarshipType()+
													"','"+schshipOffer.getOfferAcademicYear()+"' "+valueDate+" ) ";

					}
					else{	// type ทุนทำวิทยานิพนธ์ กับ ทุนเสนอบทความทางวิชาการ
						schshipOffer.setScholarshipID(Integer.parseInt(request.getParameter("scholarshipID")));
						schshipOffer.setScholarshipType(thaiLanguage.MS874ToUnicode(request.getParameter("type")));
						schshipOffer.setStdID(thaiLanguage.MS874ToUnicode(request.getParameter("stdID")));
						schshipOffer. setOfferAcademicYear(request.getParameter("academicYear"));
						schshipOffer.setScholarshipMoney(Integer.parseInt(request.getParameter("money")));
						if(!request.getParameter("offerYear").equals("")){
							schshipOffer.setOfferDate(request.getParameter("offerDay")+"/"+request.getParameter("offerMonth")+"/"+request.getParameter("offerYear"));
							colDate = ",DATE";
							valueDate = ",'"+schshipOffer.getOfferDate()+"' ";
						}
						sqlCommand = "INSERT INTO SCHOLARSHIPOFFER (STD#,SCHOLARSHIP#,SCHOLARSHIPOFFERTYPE, ACADEMICYEAR,MONEY"+colDate+") "+ 
													"VALUES ('"+schshipOffer.getStdID()+"',"+schshipOffer.getScholarshipID()+",'"+schshipOffer.getScholarshipType()+
													"','"+schshipOffer.getOfferAcademicYear()+"', "+schshipOffer.getScholarshipMoney()+valueDate+" ) ";
					}				
					
					// ตรวจสอบว่านักศึกษาเคยรับทุนวิทยานิพนธ์แล้วหรือยัง
					if(schshipOffer.getScholarshipType().equals("ทุนสนับสนุนทำวิทยานิพนธ์")){
						String sql = "SELECT * FROM SCHOLARSHIPOFFER WHERE STD# ='"+schshipOffer.getStdID()+"' "; 
						if( isExist(sql,out) ){
							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../addscholar.jsp\" class = \"pathlink2\">เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</a>","เพิ่มรายชื่อนักศึกษาที่ได้รับทุน"));
							out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่สามารถเพิ่มรายชื่อนักศึกษาคนนี้ได้<br>เนื่องจากนักศึกษาคนนี้เคยได้รับทุนสนับสนุนทำวิทยานิพนธ์แล้ว</font>"));
							out.println(	"<br><form action=\"../addscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
									"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
							out.println(htmlTemplate.getEnd());
							return;
						}
					}
					
					// ตรวจสอบว่าเคยได้รับทุนนี้แล้วหรือยัง
					
						String sql = "SELECT * FROM SCHOLARSHIPOFFER WHERE STD# ='"+schshipOffer.getStdID()+"' AND SCHOLARSHIP# = "+schshipOffer.getScholarshipID()+""; 
						if( isExist(sql,out) ){
							out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../addscholar.jsp\" class = \"pathlink2\">เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</a>","เพิ่มรายชื่อนักศึกษาที่ได้รับทุน"));
							out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่สามารถเพิ่มรายชื่อนักศึกษาคนนี้ได้<br>เนื่องจากนักศึกษาคนนี้เคยได้รับทุนนี้แล้ว</font>"));
							out.println(	"<br><form action=\"../addscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
									"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
							out.println(htmlTemplate.getEnd());
							return;
						}
			

					// เพิ่มข้อมูลทุนการศึกษาลงฐานข้อมูล									
					addScholar(sqlCommand,out);
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../addscholar.jsp\" class = \"pathlink2\">เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</a>","เพิ่มรายชื่อนักศึกษาที่ได้รับทุน"));
					out.println(thaiLanguage.UnicodeToMS874(	"<br><font class=\"insfont\" style=\"font:16px\">เพิ่มรายชื่อนักศึกษาที่ได้รับ"+schshipOffer.getScholarshipType()+"เรียบร้อยแล้ว</font>"));
					out.println(	"<br><form action=\"../addscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
					out.println(htmlTemplate.getEnd());
							
					return;
			}
			catch (NumberFormatException e){out.println("addScholar NumberFormatException in servlet : "+e.getMessage());return;}	
			catch (SQLException e){out.println("addScholar SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("addScholar Exception in servlet  : "+e.getMessage());return;}	
		} // end request.getParameter("addScholar")
			
		if(request.getParameter("cancelAddScholar") != null){		//  ยกเลิกเพิ่มรายชื่อนักศึกษาที่ได้รับทุนการศึกษา
			Scholarship schship = new Scholarship();
			Student std = new Student();
			session.setAttribute("scholarshipInfo",schship);
			session.setAttribute("stdInfo",std);			
			response.sendRedirect("../addscholar.jsp");

		} // end request.getParameter("cancelAddScholar")
	
		if(request.getParameter("listScholarFromSchshipID") != null){		//  ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษาตามรหัสทุนการศึกษา
			try{
					int scholarshipID = Integer.parseInt(request.getParameter("scholarshipID"));
					
					// ตรวจสอบว่ามทุนการศึกษาอันนี้อยู่หรือไม่
					String sql= "SELECT * FROM SCHOLARSHIP WHERE SCHOLARSHIP# = "+scholarshipID+"";
					if( !isExist(sql,out) ){
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษา</a>","ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษา"));
						out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลทุนการศึกษาที่ระบุมา</font>"));
						out.println(	"<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
						out.println(htmlTemplate.getEnd());
						return;
					}

					listScholarFromScholarshipID(scholarshipID,out);

			}	
			catch (NumberFormatException e){
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษา</a>","ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษา"));
					out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">กรุณาใส่รหัสทุนการศึกษา เป็นตัวเลข</font>"));
					out.println(	"<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
					out.println(htmlTemplate.getEnd());
					return;
			}	
			catch (SQLException e){out.println("addScholar SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("addScholar Exception in servlet  : "+e.getMessage());return;}
		} // end request.getParameter("listScholarFromSchshipID")	

		if(request.getParameter("listScholarFromYear") != null){		//  List รายชื่อนักศึกษาที่ได้รับทุน ตามรายชื่อทุนการศึกษา  ตามปีการศึกษา
			try{
					String academicYear = request.getParameter("academicYear");
					listScholarFromYear(academicYear,out);
			}
			catch (SQLException e){out.println("addScholar SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("addScholar Exception in servlet  : "+e.getMessage());return;}
		} // end if(request.getParameter("listScholarFromYear")

		if(request.getParameter("deleteScholar") != null){		//  ลบข้อมูลนักศึกษาที่ได้รับทุน
				try{
						String scholarshipID = request.getParameter("scholarshipID");
						String stdID = request.getParameter("stdID");
						String sqlCommand =	"DELETE FROM SCHOLARSHIPOFFER WHERE STD# ='"+stdID+"' "+
														"AND SCHOLARSHIP# = "+scholarshipID+" ";
						deleteScholar(sqlCommand,out);
				}
				catch (SQLException e){out.println("deleteScholar SQLException in servlet : "+e.getMessage());return;}
				catch (Exception e){out.println("deleteScholar Exception in servlet  : "+e.getMessage());return;}
		}	// end if(request.getParameter("cancelDeleteScholar") 

		if(request.getParameter("cancelDeleteScholar") != null){		//  ยกเลิกลบข้อมูลนักศึกษาที่ได้รับทุน
				
				response.sendRedirect("../viewscholar.jsp");
					
		}	// end if(request.getParameter("cancelDeleteScholar") 
		
		if(request.getParameter("listScholarFromStdID") != null){		// list รายชื่อทุนการศึกษาที่นักศึกษาเคยได้รับ
			try{
					String stdID = request.getParameter("stdID");
					listScholarFromStdID(stdID,out);
			}
			catch (SQLException e){out.println("listScholarFromStdID SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("listScholarFromStdID Exception in servlet  : "+e.getMessage());return;}
		} // end request.getParameter("listScholarFromStdID")

	}	// end doPost
	

	
	// -------------------------------------------------------------------------------------------------------------------- start viewScholar
	public void viewScholar(String stdID ,int scholarshipID ,PrintWriter out)throws Exception{
		ScholarshipOffer schshipOffer = new ScholarshipOffer();
		schshipOffer.setScholarshipID(scholarshipID);
		schshipOffer.setStdID(stdID);
		
		Statement stmt;
		ResultSet rs;			
		
		String sqlCommand =	"SELECT S.SCHOLARSHIP#, S.NAME , S.TYPE, S.ACADEMICYEAR, S.NUMBERSCHOLARSHIP "+
												", S.MONEY, S.DURATION, SO.DATE, SO.MONEY AS OMONEY "+
												"FROM SCHOLARSHIP S, SCHOLARSHIPOFFER SO "+
												"WHERE S.SCHOLARSHIP# ="+schshipOffer.getScholarshipID()+" AND S.SCHOLARSHIP# = SO.SCHOLARSHIP# ";
		connectDB(out);
		stmt = con.createStatement();
		rs=stmt.executeQuery(sqlCommand);
		while( rs.next() ){
			if( rs.getInt("SCHOLARSHIP#")+"" != null)
				schshipOffer.setScholarshipID( rs.getInt("SCHOLARSHIP#") );
			if( rs.getString("NAME") != null)
				schshipOffer.setScholarshipName( rs.getString("NAME") );
			if( rs.getString("TYPE") != null)
				schshipOffer.setScholarshipType( rs.getString("TYPE") );
			if( rs.getString("ACADEMICYEAR") != null)
				schshipOffer.setScholarshipYear( rs.getString("ACADEMICYEAR") );
			if( rs.getInt("NUMBERSCHOLARSHIP")+"" != null)
				schshipOffer.setNumberScholarship( rs.getInt("NUMBERSCHOLARSHIP") );
			if( rs.getInt("MONEY")+"" != null)
				schshipOffer.setScholarshipMoney( rs.getInt("MONEY") );
			if( rs.getString("DURATION") != null)
				schshipOffer.setScholarshipDuration( rs.getString("DURATION") );
			if( rs.getInt("OMONEY")+"" !=null)
				schshipOffer.setOfferMoney( rs.getInt("OMONEY") );
				if( rs.getString("DATE")+"" !=null)
				schshipOffer.setOfferDate( rs.getString("DATE") );
		}
		rs.close();

		out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุน</a>","ดูรายชื่อนักศึกษาที่ได้รับทุน"));
		// แสดงผลข้อมูลทุนการศึกษา
		out.println(	"<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#9999CC\">\n"+
							"<tr>\n"+
							"	<td colspan=\"2\" height=\"31\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874(schshipOffer.getScholarshipType())+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
							"</tr>\n"+
							"<tr>\n"+
							"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสทุน</b>")+"&nbsp;</font></td>\n"+
							"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\" >"+schshipOffer.getScholarshipID()+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ประเภททุน</b>")+"&nbsp;</font></td>\n"+
							"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(schshipOffer.getScholarshipType())+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อทุน</b>")+"&nbsp;</font></td>\n"+
							"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(schshipOffer.getScholarshipName())+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ปีการศึกษา</b>")+"&nbsp;</font></td>\n"+
							"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(schshipOffer.getScholarshipYear())+"</font></td>\n"+
							"</tr>\n");
		if( thaiLanguage.MS874ToUnicode(schshipOffer.getScholarshipType()).equals(thaiLanguage.MS874ToUnicode("ทุนการศึกษา")) ){
			out.println(thaiLanguage.UnicodeToMS874("<tr>\n<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\"><b>จำนวนทุน</b>&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schshipOffer.getNumberScholarship()+"&nbsp;ทุน&nbsp;&nbsp;&nbsp;<b>ทุนละ</b>&nbsp;"+schshipOffer.getScholarshipMoney()+
								"&nbsp;บาท&nbsp;&nbsp;&nbsp;<b>ระยะเวลา</b>&nbsp;"+schshipOffer.getScholarshipDuration()+"&nbsp;ปี</font></td>\n"+
								"</tr>\n"));
		}
		else{
					/*	sqlCommand = "SELECT MONEY FROM SCHOLARSHIPOFFER WHERE SCHOLARSHIP# ="+schshipOffer.getScholarshipID()+
						" AND STD# ='"+schshipOffer.getStdID()+"' ";
						stmt = con.createStatement();
						rs=stmt.executeQuery(sqlCommand);
						if( rs.next() ){
							schshipOffer.setScholarshipMoney(rs.getInt("MONEY"));
						}
						rs.close(); */
						out.println(	"<tr>\n"+
											"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>จำนวนเงิน</b>")+"&nbsp;</font></td>\n"+
											"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(schshipOffer.getOfferMoney()+"&nbsp;บาท")+"</font></td>\n"+
											"</tr>\n");
		}
		out.println(	"<tr>\n"+
							"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>วันที่ได้รับอนุมัติ</b>")+"&nbsp;</font></td>\n"+
							"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874(myDate.getThaiDate(schshipOffer.getOfferDate()))+"</font></td>\n"+
							"</tr>\n"+
							"<tr>\n"+
							"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
							"</tr>\n");	
		
		
		//  get ข้อมูลนักศึกษาที่ได้รับทุนนี้
		String	sql = 	"SELECT S.STD#, S.TPRE, S.TNAME, S.TFAMILY, S.SEX , C.TNAME AS CNAME,  "+
								"M.TNAME AS MNAME, F.TNAME AS FNAME, D.TNAME AS DNAME  "+
								"FROM STUDENT S , COURSE C , MAJOR M , FACULTY F , DEPARTMENT D  "+
								"WHERE STD# ='"+schshipOffer.getStdID()+"'  "+
								"AND C.CO# = ( SELECT CO# FROM STUDENT WHERE STD# ='"+schshipOffer.getStdID()+"')  "+
								"AND M.MAJOR# = ( SELECT MAJOR# FROM STUDENT WHERE STD# ='"+schshipOffer.getStdID()+"')  "+
								"AND F.FACT# = ( SELECT FACT# FROM STUDENT WHERE STD# ='"+schshipOffer.getStdID()+"')  "+
								"AND D.DEPT# = ( SELECT DEPT# FROM STUDENT WHERE STD# ='"+schshipOffer.getStdID()+"')  ";			
			rs = stmt.executeQuery(sql);
			if(rs.next()){
				if(rs.getString("STD#")!=null)
						schshipOffer.setStdID(thaiLanguage.UnicodeToMS874(rs.getString("STD#")));
				if(rs.getString("TPRE")!=null)		
						schshipOffer.setStdTitle(thaiLanguage.UnicodeToMS874(rs.getString("TPRE")));
				if(rs.getString("TNAME")!=null)		
						schshipOffer.setStdName(thaiLanguage.UnicodeToMS874(rs.getString("TNAME")));
				if(rs.getString("TFAMILY")!=null)		
						schshipOffer.setStdSurname(thaiLanguage.UnicodeToMS874(rs.getString("TFAMILY")));
				if(rs.getString("CNAME")!= null)
						schshipOffer.setStdCourseName(thaiLanguage.UnicodeToMS874(rs.getString("CNAME")));
				if(rs.getString("MNAME")!= null)
						schshipOffer.setStdMajorName(thaiLanguage.UnicodeToMS874(rs.getString("MNAME")));
				if(rs.getString("FNAME")!= null)
						schshipOffer.setStdFactName(thaiLanguage.UnicodeToMS874(rs.getString("FNAME")));
				if(rs.getString("DNAME")!= null)
						schshipOffer.setStdDeptName(thaiLanguage.UnicodeToMS874(rs.getString("DNAME")));
			}
			else{	// ไม่มีรายชื่อนักศึกษาได้รับทุนนี้
					rs.close();
					stmt.close();
					closeDB();

					out.println(	"<tr>\n"+
										"	<td  colspan=\"2\" align=\"center\" valign=\"top\"><br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\">\n"+
										"	<font color=\"#FF0000\" style=\"font:16px\">"+thaiLanguage.UnicodeToMS874("ไม่มีข้อมูลนักศึกษา")+"</font>\n"+
										"	<br><br><input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"	</form></td>\n"+	
										"</tr>\n");				
					out.println("</table>\n");
					out.println(htmlTemplate.getEnd());
					return;
			}
			rs.close();
			stmt.close();
			closeDB();

			// แสดงข้อมูลนักศึกษาที่ได้รับทุน
			out.println(	"<tr>\n"+
								"	<td colspan=\"2\" height=\"31\" bgcolor=\"#9999CC\"><font class=\"header\">&nbsp;"+thaiLanguage.UnicodeToMS874("ข้อมูลนักศึกษาที่ได้รับ"+schshipOffer.getScholarshipType())+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>รหัสนักศึกษา</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schshipOffer.getStdID()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ชื่อ</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schshipOffer.getStdTitle()+schshipOffer.getStdName()+"&nbsp;&nbsp;&nbsp;&nbsp;"+schshipOffer.getStdSurname()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ศึกษาอยู่หลักสูตร</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schshipOffer.getStdCourseName()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>สาขา</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schshipOffer.getStdMajorName()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>คณะ</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schshipOffer.getStdFactName()+"</font></td>\n"+
								"</tr>\n"+
								"<tr>\n"+
								"	<td width=\"180\" align=\"right\" valign=\"top\" bgcolor=\"#D6D6EB\"><font class=\"insfont\">"+thaiLanguage.UnicodeToMS874("<b>ภาควิชา</b>")+"&nbsp;</font></td>\n"+
								"	<td width=\"470\" align=\"left\" valign=\"top\" bgcolor=\"#E5E5F2\"><font class=\"insfont\">"+schshipOffer.getStdDeptName()+"</font></td>\n"+
								"</tr>\n");
			
			out.println(	"<tr>\n"+
								"	<td height=\"10\" colspan=\"2\" align=\"right\" valign=\"top\"></td>\n"+	// empty
								"</tr>\n"+
								"<tr>\n"+
								"	<td height=\"3\" colspan=\"2\" align=\"right\" valign=\"top\" bgcolor=\"#9999CC\"></td>\n"+	// end 
								"</tr>\n");					

			out.println("</table>\n");
			out.println(	"<br><form action=\"scholarshipWork\" method=\"post\" name=\"form1\" >\n"+
							"  <input type=\"hidden\" name=\"scholarshipID\" value=\""+schshipOffer.getScholarshipID()+"\">"+
							"  <input type=\"hidden\" name=\"stdID\" value=\""+schshipOffer.getStdID()+"\">"+
							"	<input type=\"submit\" name=\"deleteScholar\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;ลบข้อมูล&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\" onClick=\"return confirmDel()\">\n"+
							"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+	
							"	<input type=\"submit\" name=\"cancelDeleteScholar\" value=\""+thaiLanguage.UnicodeToMS874("&nbsp;&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;&nbsp;")+"\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
							"</form>\n");	
			out.println(htmlTemplate.getEnd());
	}
	// ---------------------------------------------------------------------------- end viewScholar
	
	//--------------------------------------------------------------------------------------- start deleteScholarhip
	public void deleteScholar(String sqlCommand ,PrintWriter out)throws Exception{
		PreparedStatement pstmt;
		Statement stmt;
		ResultSet rs;
		
		connectDB(out);
		stmt=con.createStatement();		

		// ลบข้อมูลนักศึกษาที่ได้รับทุนการศึกษา
		pstmt = con.prepareStatement(sqlCommand);
		pstmt.executeUpdate();
		pstmt.close();	

		closeDB();
		
		// แสดงข้อความ ลบข้อมูลเรียบร้อย
		out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> ลบข้อมูลนักสึกษาที่ได้รับทุน","ลบข้อมูลนักศึกษาที่ได้รับทุน"));
		out.println(thaiLanguage.UnicodeToMS874(	"<br><font class=\"insfont\" style=\"font:16px\">ลบข้อมูลเรียบร้อยแล้ว</font>"));
		out.println(	"<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
							"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
							"</form>\n");								
		out.println(htmlTemplate.getEnd());


	} // end deleteScholarhip
//--------------------------------------------------------------------------------------- end deleteScholarhip
	
	
	
	
	
	// ################ doGet ##########################
	public void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
		
		HttpSession session=request.getSession(true);
		PrintWriter out = response.getWriter();
		
		if(request.getParameter("scholarshipID")!=null){		// doget ดูรายชื่อนักศึกษาที่ได้รับทุน viewScholarship
			int scholarshipID = 0;
			scholarshipID = Integer.parseInt(request.getParameter("scholarshipID"));
			try{					
					viewScholarship(scholarshipID,out);
			}
			catch (NumberFormatException e){
				out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholarship.jsp\" class = \"pathlink2\">ดูข้อมูลทุนการศึกษา</a>","ดูข้อมูลทุนการศึกษา"));
				out.println(thaiLanguage.UnicodeToMS874(	"<br><font class=\"insfont\" color=\"FF0000\" style=\"font:16px\">กรุณาใส่รหัสข้อมูลทุนการศึกษาเป็นตัวเลข</font>"));
				out.println(	"<br><form action=\"../viewscholarship.jsp\" method=\"post\" name=\"form1\" >\n"+
									"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
									"</form>\n");								
				out.println(htmlTemplate.getEnd());	
				return;
			}
			catch (SQLException e){out.println("doGet scholarshipID SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("doGet scholarshipID Exception in servlet  : "+e.getMessage());return;}
			
		} // end request.getParameter("scholarshipID")
	
		if(request.getParameter("viewScholarID") != null && request.getParameter("viewScholarshipID")!=null ){	// ดูข้อมูลนักศึกษาที่ได้รับทุน
			
			try{
				int scholarshipID = Integer.parseInt(request.getParameter("viewScholarshipID"));
				String stdID = 	request.getParameter("viewScholarID");
				String sql = "SELECT * FROM SCHOLARSHIP WHERE SCHOLARSHIP# = "+scholarshipID+" ";
				
				if( !isExist(sql,out) ){	// ไม่มีรหัสทุนอันนี้อยู่
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุน</a>","ดูรายชื่อนักศึกษาที่ได้รับทุน"));
					out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบรหัสทุนนี้</font>"));
					out.println(	"<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
					out.println(htmlTemplate.getEnd());
					return;
				}

				sql = "SELECT * FROM STUDENT WHERE STD# = '"+stdID+"' ";
				if( !isExist(sql,out) ){	// ไม่มีรหัสนักศึกษาอันนี้อยู่
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุน</a>","ดูรายชื่อนักศึกษาที่ได้รับทุน"));
					out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบรหัสนักศึกษาคนนี้</font>"));
					out.println(	"<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
					out.println(htmlTemplate.getEnd());
					return;
				}

				// ตรวจสอบว่านักศึกษาได้รับทุนที่ระบุมาหรือเปล่า
				sql ="SELECT * FROM SCHOLARSHIPOFFER WHERE STD# ='"+stdID+"' "+
						"AND SCHOLARSHIP# = "+scholarshipID+"";
				if( !isExist(sql,out) ){	// ไม่มีรายชื่อนักศึกษาคนนี้ที่ได้รับทุน
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุน</a>","ดูรายชื่อนักศึกษาที่ได้รับทุน"));
					out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่มีรายชื่อนักศึกษาคนนี้ ได้รับทุนที่ระบุมา</font>"));
					out.println(	"<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
					out.println(htmlTemplate.getEnd());
					return;
				}	


				viewScholar(stdID,scholarshipID,out);

			}catch (NumberFormatException e){
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษา</a>","ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษา"));
					out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">กรุณาใส่รหัสทุนการศึกษา เป็นตัวเลข</font>"));
					out.println(	"<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
					out.println(htmlTemplate.getEnd());
					return;
			}
			catch (SQLException e){out.println("viewScholarID SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("viewScholarID Exception in servlet  : "+e.getMessage());return;}

		} // end request.getParameter("viewScholarID")

		if(request.getParameter("listScholarshipID") != null ){	// ดูข้อมูลนักศึกษาที่ได้รับทุน ตามปีการศึกษา
			try{
					int scholarshipID =Integer.parseInt(request.getParameter("listScholarshipID"));
//					out.println("scholarshipID : "+scholarshipID);		test
					String sql= "SELECT * FROM SCHOLARSHIP WHERE SCHOLARSHIP# = "+scholarshipID+"";
					if( !isExist(sql,out) ){
						out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษา</a>","ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษา"));
						out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">ไม่พบข้อมูลทุนการศึกษาที่ระบุมา</font>"));
						out.println(	"<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
						out.println(htmlTemplate.getEnd());
						return;
					}

					listScholarFromScholarshipID(scholarshipID,out);

			}catch (NumberFormatException e){
					out.println(htmlTemplate.getStart("","<a href=\"../home.jsp\" class=\"pathlink2\">Home</a> >> ทุนการศึกษา >> <a href=\"../viewscholar.jsp\" class = \"pathlink2\">ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษา</a>","ดูรายชื่อนักศึกษาที่ได้รับทุนการศึกษา"));
					out.println(thaiLanguage.UnicodeToMS874(	"<br><font color=\"#FF0000\" style=\"font:16px\">กรุณาระบุรหัสทุนการศึกษา เป็นตัวเลข</font>"));
					out.println(	"<br><form action=\"../viewscholar.jsp\" method=\"post\" name=\"form1\" >\n"+
										"<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.UnicodeToMS874("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
										"</form>\n");								
					out.println(htmlTemplate.getEnd());
					return;
			}
			catch (SQLException e){out.println("viewScholarID SQLException in servlet : "+e.getMessage());return;}
			catch (Exception e){out.println("viewScholarID Exception in servlet  : "+e.getMessage());return;}
		}

	} // end doGet

}	// end class examThesisWork