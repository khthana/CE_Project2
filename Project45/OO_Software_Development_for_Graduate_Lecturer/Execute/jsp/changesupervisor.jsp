<%@ page import="myutil.server,java.sql.*,myutil.thaiLanguage,thesis.Thesis,java.io.*,thesis.superviseThesis,lecturer.Lecturer,student.Student" contentType="text/html; charset=windows-874"%>
<html>
<head>
<title>เปลี่ยนอาจารย์ผู้ควบคุมวิทยานิพนธ์</title>
<script language=javascript1.2 SRC="javascript/inslecturer.js">
</script>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="stylesheet/insert.css" rel="stylesheet" type="text/css">
</head>
<%!
			private String url ="";
			private String user = "";
			private String passwd = "";		
			

			private Thesis thesis = new Thesis();		
			private String TfactName="";
			// for student
			private Student std = new Student();
			private String factName="";
			private String deptName="";
			private String majorName="";
			private String courseName="";
			// for old Lecturer
			private Lecturer lecturer = new Lecturer();
			private superviseThesis superThesis=new superviseThesis();
			private String LFactName="";
			private String LDeptName="";
			private String LMajorName="";						
			
						
		public void getThesisInfo(String sqlCommand,JspWriter out)throws Exception{  // แสดงข้อมูล Thesis แต่ละอัน
			Connection con;
			Statement stmt;
			ResultSet rs;			
			String sql="";

			Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
			con = DriverManager.getConnection(url,user,passwd);
			stmt = con.createStatement();
			
			rs = stmt.executeQuery(sqlCommand);			
			if(rs.next()){
				// get Thesis from database
				if(rs.getInt("THESIS#")!=0)
					thesis.setThesisID(rs.getInt("THESIS#"));
				if(rs.getString("ACADEMICYEAR")!=null)
					thesis.setAcademicYear(rs.getString("ACADEMICYEAR"));
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
					out.println( thaiLanguage.UnicodeToMS874("<br><br><font style=\"font:14px\" color=\"#FF0000\">ไม่พบข้อมูลวิทยานิพนธ์</font><br>\n"+
											"<form action=\"../viewthesis.jsp\" method=\"post\" name=\"form1\" >\n"+
											"<input name=\"ok\" type=\"submit\" value=\"&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
											"</form>"));
					rs.close();
					con.close();
					return;
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
						std.setStdID(rs.getString("STD#"));
					if(rs.getString("TPRE")!=null)
						std.setTpre( rs.getString("TPRE"));
					if(rs.getString("SNAME")!=null)
						std.setTname( rs.getString("SNAME"));
					if(rs.getString("TFAMILY")!=null)
						std.setTfamily( rs.getString("TFAMILY"));
					if(rs.getString("CNAME")!=null)
						courseName= rs.getString("CNAME");
					if(rs.getString("FNAME")!=null)
						factName= rs.getString("FNAME");
					if(rs.getString("DNAME")!=null)
						deptName= rs.getString("DNAME");
					if(rs.getString("MNAME")!=null)
						majorName=rs.getString("MNAME");					
			}
			rs.close();
			// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก
			sql = "SELECT * FROM SUPERVISETHESIS WHERE THESIS# = "+thesis.getThesisID()+"  AND  SUPERVISESTATUS ='"+thaiLanguage.MS874ToUnicode("หลัก")+"' "; 
			rs = stmt.executeQuery(sql);
			if(rs.next()){	// get supervisor thesis คนเก่า
					if(rs.getString("LECTURER#")!=null)
						superThesis.setLecturerID(rs.getString("LECTURER#"));
					if(rs.getString("SUPERVISESTATUS")!=null)
						superThesis.setSuperviseStatus(rs.getString("SUPERVISESTATUS"));
			} // end  if		
			rs.close();
			
			sql = "SELECT L.LECTURER#,L.NAME_TH,L.SURNAME_TH,L.TITLE_TH,L.ACADEMICAFFILIATION ,"+
							 "F.TNAME AS FNAME ,D.TNAME AS DNAME,M.TNAME MNAME "+
							 "FROM  LECTURER L , FACULTY F , DEPARTMENT D , MAJOR M "+
							 "WHERE L.LECTURER#='"+superThesis.getLecturerID()+"'  "+
							 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# = '"+superThesis.getLecturerID()+"' ) "+
							 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='"+superThesis.getLecturerID()+"' ) "+
							 "AND M.MAJOR# = (SELECT MAJOR# FROM LECTURER WHERE LECTURER# ='"+superThesis.getLecturerID()+"' ) ";
			rs = stmt.executeQuery(sql);
					
			if(rs.next()){		// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก
					if(rs.getString("LECTURER#")!=null)						
							lecturer.setLecturerID( rs.getString("LECTURER#"));
					if(rs.getString("TITLE_TH")!=null)						
							lecturer.setTitle_th( rs.getString("TITLE_TH"));
					if(rs.getString("NAME_TH")!=null)						
							lecturer.setName_th( rs.getString("NAME_TH"));
					if(rs.getString("SURNAME_TH")!=null)						
							lecturer.setSurname_th( rs.getString("SURNAME_TH"));
					if(rs.getString("ACADEMICAFFILIATION")!=null)						
							lecturer.setAcademicAffiliation( rs.getString("ACADEMICAFFILIATION"));
					if(rs.getString("FNAME")!=null)
							LFactName= rs.getString("FNAME");
					if(rs.getString("DNAME")!=null)
							LDeptName= rs.getString("DNAME");
					if(rs.getString("MNAME")!=null)
							LMajorName=rs.getString("MNAME");
					}
					rs.close();
			
			
			
			stmt.close();
			con.close();
		}// end  getThesisInfo		

%>
<%

		if(session.getAttribute("login")==null){
			response.sendRedirect("loginfail.jsp");
		}

		server svr= new server();
		url= "jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user =svr.getUsername();
		passwd = svr.getPassword();

		String thesisID="";
				
		// for new lecturer
		Lecturer MnewLecturer = new Lecturer();
		superviseThesis MnewSuper =new superviseThesis();
		String MnewFactName="";
		String MnewDeptName="";
		String MnewMajorName="";
		
		
		if(session.getAttribute("getNewSuper")==null && session.getAttribute("getChangeSuper")==null){
				thesis = new Thesis();		
				TfactName="";
			// for student
				std = new Student();
				factName="";
				deptName="";
				majorName="";
				courseName="";
			// for old Lecturer
				lecturer = new Lecturer();
				superThesis=new superviseThesis();
				LFactName="";
				LDeptName="";
				LMajorName="";
			
		}
		else if(session.getAttribute("getChangeSuper")!=null){
				session.removeAttribute("getChangeSuper");
				
				if(session.getAttribute("thesisID")!=null){
					thesisID=(String )session.getAttribute("thesisID");
					session.removeAttribute("thesisID");
					String sqlCommand = "SELECT * FROM THESIS T, FACULTY F WHERE T.THESIS#="+thesisID+" "+
												"AND F.FACT#=(SELECT FACT# FROM THESIS WHERE THESIS#="+thesisID+")";
					try{					
							getThesisInfo(sqlCommand,out);
					}
					catch (ClassNotFoundException e){out.println("ClassNotFoundException : "+e.getMessage());return;}
					catch (SQLException e){out.println("SQLException : "+e.getMessage());return;}
					catch (Exception e){out.println("Exception : "+e.getMessage());return;}				
					
				} // end if session.getAttribute("thesisID")!=null
		 } // end if session.getAttribute("getEditTopic")!=null
		 else if(session.getAttribute("getNewSuper")!=null){
		 		Connection con;
				Statement stmt;
				ResultSet rs;
		 
		 		String newSuperID = "";
				session.removeAttribute("getNewSuper");
				if(session.getAttribute("newSuperID")!=null){
					newSuperID = (String )session.getAttribute("newSuperID");
					session.removeAttribute("newSuperID");
					
					Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
					con = DriverManager.getConnection(url,user,passwd);
					stmt = con.createStatement();
					
					String sql = "SELECT L.LECTURER#,L.NAME_TH,L.SURNAME_TH,L.TITLE_TH,L.ACADEMICAFFILIATION ,"+
							 "F.TNAME AS FNAME ,D.TNAME AS DNAME,M.TNAME MNAME "+
							 "FROM  LECTURER L , FACULTY F , DEPARTMENT D , MAJOR M "+
							 "WHERE L.LECTURER#='"+newSuperID+"'  "+
							 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# = '"+newSuperID+"' ) "+
							 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='"+newSuperID+"' ) "+
							 "AND M.MAJOR# = (SELECT MAJOR# FROM LECTURER WHERE LECTURER# ='"+newSuperID+"' ) ";
					rs = stmt.executeQuery(sql);										
					if(rs.next()){
							if(rs.getString("LECTURER#")!=null)						
									MnewLecturer.setLecturerID( rs.getString("LECTURER#"));
							if(rs.getString("TITLE_TH")!=null)						
									MnewLecturer.setTitle_th( rs.getString("TITLE_TH"));
							if(rs.getString("NAME_TH")!=null)						
									MnewLecturer.setName_th( rs.getString("NAME_TH"));
							if(rs.getString("SURNAME_TH")!=null)						
									MnewLecturer.setSurname_th( rs.getString("SURNAME_TH"));
							if(rs.getString("ACADEMICAFFILIATION")!=null)						
									MnewLecturer.setAcademicAffiliation( rs.getString("ACADEMICAFFILIATION"));
							if(rs.getString("FNAME")!=null)
									MnewFactName= rs.getString("FNAME");
							if(rs.getString("DNAME")!=null)
									MnewDeptName= rs.getString("DNAME");
							if(rs.getString("MNAME")!=null)
									MnewMajorName=rs.getString("MNAME");
					} // END IF RS.NEXT()
					rs.close();
					stmt.close();
					con.close();					
				}  //if(session.getAttribute("newSuperID")!=null)
		} // end  if(session.getAttribute("getNewSuper")!=null)
		 

%>
<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" >
<center>
  <table width="780" border="0" cellspacing="0" cellpadding="0" background="image/background.gif" height="100%">
    <tr>
		<td valign="top"><br></td>
	</tr>
  	<tr>
		<td valign="top" background="image/band.gif" height="113">
		</td>
	</tr>
	<tr>
		
      <td valign="bottom" height="28"> <font class="pathfont">
	  			<table width="780" border="0" cellspacing="0" cellpadding="0">
				<tr>
						<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;เปลียนอาจารย์ผู้ควบคุมวิทยานิพนธ์</font></td>
    					<td width="110" align="right" valign="bottom"><a class="pathlink2" href="servlet/login?logout=logout">Logout</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  				</tr>
				</table>	 
	  </td>
	</tr>
	<tr>
		<td valign="top" background="image/hordotshort.gif" height="1">		
		</td>
	</tr>
	<tr>
      <td  valign="top"> 
        <!-- Cover Main Page-->
        <table width="780" border="0" cellspacing="0" cellpadding="0" height="100%">
          <tr>             
				
            <td width="1" height="100%" align="left" valign="top" background="image/verdotshort.gif"></td>
			<td width="778"  valign="top"> 
              <!-- Insert data -->
              <br>
			  <center>
                <table width="400" height="50" bgcolor="#671691" border="1" bordercolor="#9900FF" >
                  <tr> 
                    <td valign="middle" align="center" class="topic">เปลียนอาจารย์ผู้ควบคุมวิทยานิพนธ์</td>
                  </tr>
                </table>
              </center>				
                <form action="servlet/thesisWork" method="post" name="changeSupervisorForm" >
                <center>
					<br>
					
                  <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows">
                    <tr> 
                      <td colspan="3" height="15" bgcolor="#9999CC"><font class="header">&nbsp;ใส่รหัสวิทยานิพนธ์</font></td>
                    </tr>
                    <tr> 
                      <td align="right"  valign="bottom"><font class="insfont">รหัสวิทยานิพนธ์&nbsp; 
                        </font></td>
                      <td  valign="bottom"><input type="text" name="thesisID"  style="BORDER:#2B2C6F thin solid;COLOR:#000000; <%if(thesis .getThesisID()!=0) out.print("BACKGROUND:#DCEBF7;");%>" size="6" maxlength="4" <%if(thesis .getThesisID()!=0) out.print("value=\""+thesis.getThesisID()+"\"  readonly=\"true\"");%>></td>
                      <td valign="bottom" ><input type="submit" name="getChangeSuper" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkThesisID( )"></td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="16" bgcolor="#9999CC"><font class="header">&nbsp;ข้อมูลวิทยานิพนธ์</font> 
                      </td>
                    </tr>
                    <tr> 
                      <td width="105" align="right"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td width="245" valign="bottom"><input type="text" name="academicyear"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="6" maxlength="4" <%if(!thesis .getApproveDate().equals("")) out.print("value=\""+thesis.getAcademicYear()+"\"");%>></td>
                      <td width="300" valign="bottom">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td align="right"><font class="insfont">ชื่อเรื่องภาษาไทย&nbsp;</font></td>
                      <td colspan="2" valign="bottom"><input type="text" name="topic_th"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="80" <%if(!thesis .getApproveDate().equals("")) out.print(thaiLanguage.MS874ToUnicode("value=\""+thesis.getTopic_th()+"\""));%>></td>
                    </tr>
                    <tr> 
                      <td align="right"><font class="insfont">ชื่อเรื่องภาษาอังกฤษ&nbsp;</font></td>
                      <td colspan="2" valign="bottom"><input type="text" name="topic_en"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="80" <%if(!thesis .getApproveDate().equals("")) out.print(thaiLanguage.MS874ToUnicode("value=\""+thesis.getTopic_en()+"\""));%>></td>
                    </tr>
                    <tr> 
                      <td align="right"><font class="insfont">คณะ&nbsp;</font></td>
                      <td colspan="2" valign="bottom"><select name="faculty"  disabled>
                          <option value="01" <%if(!thesis .getApproveDate().equals("") && thesis.getFactID().equals("01")) out.print("selected");%>>วิศวกรรมศาสตร์&nbsp;</option>
                          <option value="02" <%if(!thesis .getApproveDate().equals("") && thesis.getFactID().equals("02")) out.print("selected");%>>สถาปัตยกรรมศาสตร์&nbsp;</option>
                          <option value="03" <%if(!thesis .getApproveDate().equals("") && thesis.getFactID().equals("03")) out.print("selected");%>>ครุศาสตร์อุตสาหกรรม&nbsp;</option>
                          <option value="04" <%if(!thesis .getApproveDate().equals("") && thesis.getFactID().equals("04")) out.print("selected");%>>วิทยาศาสตร์&nbsp;</option>
                          <option value="05" <%if(!thesis .getApproveDate().equals("") && thesis.getFactID().equals("05")) out.print("selected");%>>เทคโนโลยีการเกษตร&nbsp;</option>
                          <option value="06" <%if(!thesis .getApproveDate().equals("") && thesis.getFactID().equals("06")) out.print("selected");%>>โครงการคณะอุตสาหกรรมเกษตร</option>
                          <option value="07" <%if(!thesis .getApproveDate().equals("") && thesis.getFactID().equals("07")) out.print("selected");%>>เทคโนโลยีสารสนเทศ&nbsp;</option>
                        </select></td>
                    </tr>
                    <tr> 
                      <td align="right"><font class="insfont">อนุมัติเมื่อวันที่&nbsp;</font></td>
                      <td colspan="2"><select name="approvedate" disabled>
                          <option value="01" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("01")) out.print("selected");%>>1</option>
                          <option value="02" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("02")) out.print("selected");%>>2</option>
                          <option value="03" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("03")) out.print("selected");%>>3</option>
                          <option value="04" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("04")) out.print("selected");%>>4</option>
                          <option value="05" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("05")) out.print("selected");%>>5</option>
                          <option value="06" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("06")) out.print("selected");%>>6</option>
                          <option value="07" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("07")) out.print("selected");%>>7</option>
                          <option value="08" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("08")) out.print("selected");%>>8</option>
                          <option value="09" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("09")) out.print("selected");%>>9</option>
                          <option value="10" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("10")) out.print("selected");%>>10</option>
                          <option value="11" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("11")) out.print("selected");%>>11</option>
                          <option value="12" <%if(!thesis .getApproveDate().equals("")&& thesis.getApproveDate().substring(8,10).equals("12")) out.print("selected");%>>12</option>
                          <option value="13" <%if(!thesis .getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("13")) out.print("selected");%>>13</option>
                          <option value="14" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("14")) out.print("selected");%>>14</option>
                          <option value="15" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("15")) out.print("selected");%>>15</option>
                          <option value="16" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("16")) out.print("selected");%>>16</option>
                          <option value="17" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("17")) out.print("selected");%>>17</option>
                          <option value="18" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("18")) out.print("selected");%>>18</option>
                          <option value="19" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("19")) out.print("selected");%>>19</option>
                          <option value="20" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("20")) out.print("selected");%>>20</option>
                          <option value="21" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("21")) out.print("selected");%>>21</option>
                          <option value="22" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("22")) out.print("selected");%>>22</option>
                          <option value="23" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("23")) out.print("selected");%>>23</option>
                          <option value="24" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("24")) out.print("selected");%>>24</option>
                          <option value="25" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("25")) out.print("selected");%>>25</option>
                          <option value="26" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("26")) out.print("selected");%>>26</option>
                          <option value="27" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("27")) out.print("selected");%>>27</option>
                          <option value="28" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("28")) out.print("selected");%>>28</option>
                          <option value="29" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("29")) out.print("selected");%>>29</option>
                          <option value="30" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("30")) out.print("selected");%>>30</option>
                          <option value="31" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(8,10).equals("31")) out.print("selected");%>>31</option>
                        </select> <font class="insfont">&nbsp;&nbsp;เดือน </font> 
                        <select name="approvemonth" disabled>
                          <option value="01" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("01")) out.print("selected");%>>มกราคม</option>
                          <option value="02" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("02")) out.print("selected");%>>กุมภาพันธ์</option>
                          <option value="03" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("03")) out.print("selected");%>>มีนาคม</option>
                          <option value="04" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("04")) out.print("selected");%>>เมษายน</option>
                          <option value="05" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("05")) out.print("selected");%>>พฤษภาคม</option>
                          <option value="06" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("06")) out.print("selected");%>>มิถุนายน</option>
                          <option value="07" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("07")) out.print("selected");%>>กรกฎาคม</option>
                          <option value="08" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("08")) out.print("selected");%>>สิงหาคม</option>
                          <option value="09" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("09")) out.print("selected");%>>กันยายน</option>
                          <option value="10" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("10")) out.print("selected");%>>ตุลาคม</option>
                          <option value="11" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("11")) out.print("selected");%>>พฤษจิกายน</option>
                          <option value="12" <%if(!thesis .getApproveDate().equals("")  && thesis.getApproveDate().substring(5,7).equals("12")) out.print("selected");%>>ธันวาคม</option>
                        </select> <font class="insfont">&nbsp;&nbsp;พ.ศ.&nbsp; 
                        </font> <input name="approveyear" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="5" readonly="true" maxlength="4" value="<%if(!thesis .getApproveDate().equals("")  && !thesis.getApproveDate().substring(6).equals("0000")) out.print(""+( Integer.parseInt(thesis.getApproveDate().substring(0,4))+543) );%>"></td>
                    </tr>
                    <tr> 
                      <td colspan="3"  bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;ข้อมูลนักศึกษาที่ทำวิยานิพนธ์</font></td>
                    </tr>
                    <tr> 
                      <td colspan="3" align="left"> <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows" frame="void">
                          <tr> 
                            <td width="105" align="right"><font class="insfont">รหัสนักศึกษา&nbsp;</font> 
                            </td>
                            <td width="179" align="left" valign="bottom"><input type="text" name="stdID" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="8" maxlength="8"  readonly="true"  value="<%=std.getStdID()%>" ></td>
                            <td width="57">&nbsp;</td>
                            <td width="299">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font> 
                            </td>
                            <td valign="bottom"><input type="text" name="stdname" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="28" readonly="true" value="<%=std.getTpre()+std.getTname()%>" ></td>
                            <td align="right"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="stdsurname" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="28"  readonly="true" value="<%=std.getTfamily()%>" ></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">หลักสูตร&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="stdcourse" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="28" readonly="true" value="<%=courseName%>" ></td>
                            <td align="right" valign="bottom"><font class="insfont">สาขาวิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="stdmajor" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="45" readonly="true" value="<%=majorName%>" ></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="stdcourse" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="28"  readonly="true" value="<%=deptName%>" ></td>
                            <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="stdmajor" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="45"  readonly="true" value="<%=factName%>" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="3" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก 
                        (เก่า)</font>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="3" align="left"> <table width="645" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td colspan="2" align="left"><font class="miniheader">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก 
                              (เก่า) </font></td>
                            <td width="46" align="right">&nbsp;</td>
                            <td width="272">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">รหัสอาจารย์&nbsp;</font> 
                            </td>
                            <td align="left" valign="bottom"><input type="text" name="superID" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="8" readonly="true" maxlength="8" value="<%=lecturer.getLecturerID()%>" ></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ตำแหน่งทางวิชาการ&nbsp;</font> 
                            </td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <input name="supaffiliation" type="radio" value="lecturer"  readonly="true" onClick="return noClink()" <%if(lecturer.getAcademicAffiliation().equals("อาจารย์")) out.print("checked");%> >
                              อาจารย์&nbsp;&nbsp;&nbsp; 
                              <input name="supaffiliation" type="radio" value="Asst_Prof" readonly="true" onClick="return noClink()" <%if(lecturer.getAcademicAffiliation().equals("ผ.ศ.")) out.print("checked");%>>
                              ผ.ศ.&nbsp;&nbsp;&nbsp; 
                              <input name="supaffiliation" type="radio" value="Assoc_Prof" readonly="true" onClick="return noClink()" <%if(lecturer.getAcademicAffiliation().equals("ร.ศ.")) out.print("checked");%>>
                              ร.ศ.&nbsp;&nbsp;&nbsp; 
                              <input name="supaffiliation" type="radio" value="Prof" readonly="true" onClick="return noClink()" <%if(lecturer.getAcademicAffiliation().equals("ศ.")) out.print("checked");%>>
                              ศ.</font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <%
									if(!lecturer.getAcademicAffiliation().equals("อาจารย์")&&!lecturer.getAcademicAffiliation().equals("ผ.ศ.")&&!lecturer.getAcademicAffiliation().equals("ร.ศ.")&&!lecturer.getAcademicAffiliation().equals("ศ.")&&!lecturer.getAcademicAffiliation().equals(""))
										out.print("<input name=\"supaffiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\" checked>อื่นๆ&nbsp;");
									else
										out.print("<input name=\"supaffiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\">อื่นๆ&nbsp;");
							%>
                              </font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <input name="supaffiliation_affi_other" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true"  value="<%if(!lecturer.getAcademicAffiliation().equals("อาจารย์")&&!lecturer.getAcademicAffiliation().equals("ผ.ศ.")&&!lecturer.getAcademicAffiliation().equals("ร.ศ.")&&!lecturer.getAcademicAffiliation().equals("ศ.")&&!lecturer.getAcademicAffiliation().equals("")) out.print(lecturer.getAcademicAffiliation());%>">
                              </font></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="222" valign="bottom"><input type="text" name="supervise_name"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=lecturer.getName_th()%>" ></td>
                            <td align="right"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="supervise_surname"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30"  readonly="true" value="<%=lecturer.getSurname_th()%>" ></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right"><font class="insfont">คณะ&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="supervise_faculty"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=LFactName%>" ></td>
                            <td align="right"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="supervise_dept"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="40" readonly="true" value="<%=LDeptName%>" 
							></td>
                          </tr>
                        </table></td>
                    </tr>
					<tr> 
                      <td colspan="3" valign="bottom" bgcolor="#9999CC"><font class="header">&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก ( ใหม่ )</font>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="5"> <table width="645" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td colspan="4" align="left"><font class="miniheader">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก ( ใหม่ )</font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">รหัสอาจารย์&nbsp;</font> 
                            </td>
                            <td align="left" valign="bottom"><input type="text" name="newSuperID" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="8" maxlength="8" <%if(!MnewLecturer.getLecturerID().equals("")){out.print("value=\""+MnewLecturer.getLecturerID()+"\"  readonly=\"true\" ");}%>></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom"><input type="submit" name="getNewSuper" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkNewSuperID()"></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ตำแหน่งทางวิชาการ&nbsp;</font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <input name="newSuperAffiliation" type="radio" value="lecturer" readonly="true"  onClick="return noClink()" <%if( MnewLecturer.getAcademicAffiliation().equals("อาจารย์")) out.print("checked");%>>
                              อาจารย์&nbsp;&nbsp;&nbsp; 
                              <input name="newSuperAffiliation" type="radio" value="Asst_Prof" readonly="true" onClick="return noClink()" <%if( MnewLecturer.getAcademicAffiliation().equals("ผ.ศ.")) out.print("checked");%>>
                              ผ.ศ.&nbsp;&nbsp;&nbsp; 
                              <input name="newSuperAffiliation" type="radio" value="Assoc_Prof" readonly="true" onClick="return noClink()" <%if( MnewLecturer.getAcademicAffiliation().equals("ร.ศ.")) out.print("checked");%>>
                              ร.ศ.&nbsp;&nbsp;&nbsp; 
                              <input name="newSuperAffiliation" type="radio" value="Prof" readonly="true" onClick="return noClink()" <%if( MnewLecturer.getAcademicAffiliation().equals("ศ.")) out.print("checked");%>>
                              ศ.</font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <%
									if(! MnewLecturer.getAcademicAffiliation().equals("อาจารย์")&&! MnewLecturer.getAcademicAffiliation().equals("ผ.ศ.")&&! MnewLecturer.getAcademicAffiliation().equals("ร.ศ.")&&! MnewLecturer.getAcademicAffiliation().equals("ศ.")&&! MnewLecturer.getAcademicAffiliation().equals(""))
										out.print("<input name=\"join1affiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\" checked>อื่นๆ&nbsp;");
									else
										out.print("<input name=\"join1affiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\">อื่นๆ&nbsp;");
							%>
                              </font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <input name="newSuper_affi_other" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true"  value="<%if(! MnewLecturer.getAcademicAffiliation().equals("อาจารย์")&&! MnewLecturer.getAcademicAffiliation().equals("ผ.ศ.")&&! MnewLecturer.getAcademicAffiliation().equals("ร.ศ.")&&! MnewLecturer.getAcademicAffiliation().equals("ศ.")&&! MnewLecturer.getAcademicAffiliation().equals("")) out.print( MnewLecturer.getAcademicAffiliation());%>">
                              </font></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="222" valign="bottom"><input type="text" name="newSuperName"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%= MnewLecturer.getName_th()%>" ></td>
                            <td width="46" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="272" valign="bottom"><input type="text" name="newSuperSurname"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true"  value="<%= MnewLecturer.getSurname_th()%>" ></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="newSuperFaculty"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=MnewFactName%>" ></td>
                            <td align="right"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="newSuperDept"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="40" readonly="true" value="<%= MnewDeptName%>" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="5" valign="top">&nbsp; </td>
                    </tr>
                  </table>
				  <br>
                  <input type="submit" name="changeSuper" value="เปลี่ยนอาจารย์" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checks( )">
                  &nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="cancelChangeSuper" value="     ยกเลิก     " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" >
                </center>
				</form>
               <br>      			  
				</td>
            <!-- Insert data --> 
            <!-- Right --> 
             <td width="1" background="image/verdotshort.gif" valign="top" ></td>
        </table>
        </table></td><!-- Cover Main Page-->
  </tr>
</table>
</center>
<script language="JavaScript">
		
		function checkThesisID(){
			var f = document.changeSupervisorForm;
			if(f.thesisID.value.length==0){
					alert("กรุณาใส่รหัสวิทยานิพนธ์ ");
    	      		f.thesisID.focus();
        	   		return false;
			}
			if(f.thesisID.value.lenght != 0){
				if(isNaN(f.thesisID.value)){
					 alert("กรุณาใส่รหัสวิทยานิพนธ์ เป็นตัวเลขให้ถูกต้อง");
    	      		 document.changeSupervisorForm.thesisID.focus();
        	  		 return false;
				}
 			}
			return true;
		} // end function checkThesisID
		
		function checkNewSuperID(){
			var f = document.changeSupervisorForm.newSuperID;			
			if (f.value.length != 8){
					alert("กรุณาใส่รหัสอาจารย์ผู้ควบคุมวิทยานิพนธ์คนใหม่ 8 หลัก");
    	      		f.focus();
        	   		return false;
			}
			return true;
			
		} //end functin checks
		
		function checks(){
			if( !checkThesisID() ){
				return false;
			}
			if( !checkNewSuperID() ){
				return false;
			}
			return true;
		} // end function checkThesisID
		
</script>
</body>
</html>
