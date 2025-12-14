<%@ page import="myutil.server,java.sql.*,myutil.thaiLanguage,thesis.Thesis,student.Student,lecturer.Lecturer"  contentType="text/html; charset=windows-874"%>
<%!	
		private String url ="";
		private  String user = "";
		private  String passwd = "";
		private Thesis thesis = new Thesis();	 
		private String TfactName="";

		// student
		private Student std=new Student();	
		private String stdfactname="";		
		private String stdcoursename="";
		private String stdmajorname="";
		private String stddeptname="";
		// examLecturer
		private Lecturer[] examL = { new Lecturer(),new Lecturer(),new Lecturer(),new Lecturer(),new Lecturer(),new Lecturer()};
		String[] LFactName ={"","","","","",""};
		String[] LDeptName={"","","","","",""};

//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
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
											"<form action=\"../addexamthesis.jsp\" method=\"post\" name=\"form1\" >\n"+
											"<input name=\"ok\" type=\"submit\" value=\"&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">"+
											"</form>"));
					rs.close();
					con.close();
					return;
			}
			rs.close();


			//  get ข้อมูลนักศึกษาที่ทำวิทยานิพนธ์
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
						stdcoursename= rs.getString("CNAME");
					if(rs.getString("FNAME")!=null)
						stdfactname= rs.getString("FNAME");
					if(rs.getString("DNAME")!=null)
						stddeptname= rs.getString("DNAME");
					if(rs.getString("MNAME")!=null)
						stdmajorname=rs.getString("MNAME");					
			}
			rs.close();					
			stmt.close();
			con.close();
		}// end  getThesisInfo		
		//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		public void getExamLecturer1(String LecturerID)throws Exception{		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์ 1
			Statement stmt;
			ResultSet rs;
			Connection con;
			String sql = "SELECT L.LECTURER# ,L.TITLE_TH , L.NAME_TH, L.SURNAME_TH ,L.ACADEMICAFFILIATION, "+
									 " F.FACT# AS FACTID, F.TNAME AS FNAME ,D.DEPT# AS DEPTID, D.TNAME AS DNAME "+
									 " FROM LECTURER L, FACULTY F ,DEPARTMENT D WHERE LECTURER# ='"+LecturerID+"' "+
									 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# ='"+LecturerID+"') "+
									 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='" +LecturerID+"') ";
				
				Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
				con = DriverManager.getConnection(url,user,passwd);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
						examL[0].setLecturerID( rs.getString("LECTURER#"));
						examL[0].setTitle_th( rs.getString("TITLE_TH"));
						examL[0].setName_th( rs.getString("NAME_TH"));
						examL[0].setSurname_th(rs.getString("SURNAME_TH"));
						examL[0].setAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
						examL[0].setFaculty( rs.getString("FACTID"));
						LFactName[0]=rs.getString("FNAME");
						LDeptName[0]=rs.getString("DNAME");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getExamLecturer1
		
		public void getExamLecturer2(String LecturerID)throws Exception{		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์ 2
			Statement stmt;
			ResultSet rs;
			Connection con;
			String sql = "SELECT L.LECTURER# ,L.TITLE_TH , L.NAME_TH, L.SURNAME_TH ,L.ACADEMICAFFILIATION, "+
									 " F.FACT# AS FACTID, F.TNAME AS FNAME ,D.DEPT# AS DEPTID, D.TNAME AS DNAME "+
									 " FROM LECTURER L, FACULTY F ,DEPARTMENT D WHERE LECTURER# ='"+LecturerID+"' "+
									 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# ='"+LecturerID+"') "+
									 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='" +LecturerID+"') ";
				
				Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
				con = DriverManager.getConnection(url,user,passwd);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
						examL[1].setLecturerID( rs.getString("LECTURER#"));
						examL[1].setTitle_th( rs.getString("TITLE_TH"));
						examL[1].setName_th( rs.getString("NAME_TH"));
						examL[1].setSurname_th(rs.getString("SURNAME_TH"));
						examL[1].setAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
						examL[1].setFaculty( rs.getString("FACTID"));
						LFactName[1]=rs.getString("FNAME");
						LDeptName[1]=rs.getString("DNAME");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getExamLecturer2
		
		public void getExamLecturer3(String LecturerID)throws Exception{		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์ 3
			Statement stmt;
			ResultSet rs;
			Connection con;
			String sql = "SELECT L.LECTURER# ,L.TITLE_TH , L.NAME_TH, L.SURNAME_TH ,L.ACADEMICAFFILIATION, "+
									 " F.FACT# AS FACTID, F.TNAME AS FNAME ,D.DEPT# AS DEPTID, D.TNAME AS DNAME "+
									 " FROM LECTURER L, FACULTY F ,DEPARTMENT D WHERE LECTURER# ='"+LecturerID+"' "+
									 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# ='"+LecturerID+"') "+
									 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='" +LecturerID+"') ";
				
				Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
				con = DriverManager.getConnection(url,user,passwd);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
						examL[2].setLecturerID( rs.getString("LECTURER#"));
						examL[2].setTitle_th( rs.getString("TITLE_TH"));
						examL[2].setName_th( rs.getString("NAME_TH"));
						examL[2].setSurname_th(rs.getString("SURNAME_TH"));
						examL[2].setAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
						examL[2].setFaculty( rs.getString("FACTID"));
						LFactName[2]=rs.getString("FNAME");
						LDeptName[2]=rs.getString("DNAME");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getExamLecturer3
		
		
		public void getExamLecturer4(String LecturerID)throws Exception{		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์ 4
			Statement stmt;
			ResultSet rs;
			Connection con;
			String sql = "SELECT L.LECTURER# ,L.TITLE_TH , L.NAME_TH, L.SURNAME_TH ,L.ACADEMICAFFILIATION, "+
									 " F.FACT# AS FACTID, F.TNAME AS FNAME ,D.DEPT# AS DEPTID, D.TNAME AS DNAME "+
									 " FROM LECTURER L, FACULTY F ,DEPARTMENT D WHERE LECTURER# ='"+LecturerID+"' "+
									 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# ='"+LecturerID+"') "+
									 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='" +LecturerID+"') ";
				
				Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
				con = DriverManager.getConnection(url,user,passwd);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
						examL[3].setLecturerID( rs.getString("LECTURER#"));
						examL[3].setTitle_th( rs.getString("TITLE_TH"));
						examL[3].setName_th( rs.getString("NAME_TH"));
						examL[3].setSurname_th(rs.getString("SURNAME_TH"));
						examL[3].setAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
						examL[3].setFaculty( rs.getString("FACTID"));
						LFactName[3]=rs.getString("FNAME");
						LDeptName[3]=rs.getString("DNAME");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getExamLecturer4
		
		public void getExamLecturer5(String LecturerID)throws Exception{		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์ 5
			Statement stmt;
			ResultSet rs;
			Connection con;
			String sql = "SELECT L.LECTURER# ,L.TITLE_TH , L.NAME_TH, L.SURNAME_TH ,L.ACADEMICAFFILIATION, "+
									 " F.FACT# AS FACTID, F.TNAME AS FNAME ,D.DEPT# AS DEPTID, D.TNAME AS DNAME "+
									 " FROM LECTURER L, FACULTY F ,DEPARTMENT D WHERE LECTURER# ='"+LecturerID+"' "+
									 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# ='"+LecturerID+"') "+
									 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='" +LecturerID+"') ";
				
				Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
				con = DriverManager.getConnection(url,user,passwd);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
						examL[4].setLecturerID( rs.getString("LECTURER#"));
						examL[4].setTitle_th( rs.getString("TITLE_TH"));
						examL[4].setName_th( rs.getString("NAME_TH"));
						examL[4].setSurname_th(rs.getString("SURNAME_TH"));
						examL[4].setAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
						examL[4].setFaculty( rs.getString("FACTID"));
						LFactName[4]=rs.getString("FNAME");
						LDeptName[4]=rs.getString("DNAME");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getExamLecturer5
		
		public void getExamLecturer6(String LecturerID)throws Exception{		// get ข้อมูลอาจารย์คุมสอบวิทยานิพนธ์ 6
			Statement stmt;
			ResultSet rs;
			Connection con;
			String sql = "SELECT L.LECTURER# ,L.TITLE_TH , L.NAME_TH, L.SURNAME_TH ,L.ACADEMICAFFILIATION, "+
									 " F.FACT# AS FACTID, F.TNAME AS FNAME ,D.DEPT# AS DEPTID, D.TNAME AS DNAME "+
									 " FROM LECTURER L, FACULTY F ,DEPARTMENT D WHERE LECTURER# ='"+LecturerID+"' "+
									 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# ='"+LecturerID+"') "+
									 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='" +LecturerID+"') ";
				
				Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
				con = DriverManager.getConnection(url,user,passwd);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
						examL[5].setLecturerID( rs.getString("LECTURER#"));
						examL[5].setTitle_th( rs.getString("TITLE_TH"));
						examL[5].setName_th( rs.getString("NAME_TH"));
						examL[5].setSurname_th(rs.getString("SURNAME_TH"));
						examL[5].setAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
						examL[5].setFaculty( rs.getString("FACTID"));
						LFactName[5]=rs.getString("FNAME");
						LDeptName[5]=rs.getString("DNAME");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getExamLecturer6
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
%>

<%						
					if(session.getAttribute("login")==null){
						response.sendRedirect("loginfail.jsp");
					}

				if( (session.getAttribute("getThesisInfo")==null)&&(session.getAttribute("getExamLecturer1")==null )&&(session.getAttribute("getExamLecturer2")==null )
					&&(session.getAttribute("getExamLecturer3")==null )&&(session.getAttribute("getExamLecturer4")==null )&&(session.getAttribute("getExamLecturer5")==null )
					&&(session.getAttribute("getExamLecturer6")==null )&&(session.getAttribute("notFound")==null) ){
				
				thesis.setThesisID(0);
				thesis.setAcademicYear("");
				thesis.setTopic_th("");
				thesis.setTopic_en("");
				thesis.setApproveDate("");
				thesis.setFactID("");
				thesis.setStdID("");
				thesis.setSuperID("");
				thesis.setJoin1ID("");
				thesis.setJoin2ID("");
				TfactName="";
		
				// student
				std.setStdID("");
				std.setEpre("");
				std.setEname("");
				std.setEfamily("");
				std.setTpre("");
				std.setTname("");
				std.setTfamily("");
				std.setPassword("");
				std.setInTerm("");
				std.setInYear("");
				std.setLecturerID("");
				std.setCoID(0);
				std.setFactID("");
				std.setDeptID("");
				std.setMajorID("");
				std.setMinorID("");		
				stdfactname="";		
				stdcoursename="";
				stdmajorname="";
				stddeptname="";
				for(int i=0;i<6;i++){
					examL[i].setLecturerID("");
					examL[i].setTitle_th("");
					examL[i].setName_th("");
					examL[i].setSurname_th("");
					examL[i].setAcademicAffiliation("");
					examL[i].setFaculty("");
					LFactName[i]="";
					LDeptName[i]="";				
				}
				
		}
		session.removeAttribute("notFound");
		server svr= new server();
		url= "jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user =svr.getUsername();
		passwd = svr.getPassword();

		if(session.getAttribute("getThesisInfo")!=null){		// get thesis info
			session.removeAttribute("getThesisInfo");
			String thesisID = "";
			String sqlCommand="";
			if(session.getAttribute("thesisID")!=null){
				thesisID =(String)session.getAttribute("thesisID");
				session.removeAttribute("thesisID");
				try{
						sqlCommand = "SELECT * FROM THESIS T, FACULTY F WHERE T.THESIS#="+thesisID+" "+
													 "AND F.FACT#=(SELECT FACT# FROM THESIS WHERE THESIS#="+thesisID+")";
						getThesisInfo(sqlCommand,out);
				}
				catch (SQLException e){out.println("getThesisInfo JSP SQLException : "+e.getMessage());return;}
				catch (Exception e){out.println("getThesisInfo JSP Exception : "+e.getMessage());return;}	
			}
		}
		else if(session.getAttribute("getExamLecturer1")!=null){	// get lecturer1 info
			session.removeAttribute("getExamLecturer1");
			String lecturerID = "";
			
			if(session.getAttribute("lecturerID")!=null){		// get thesis info
				lecturerID = (String)session.getAttribute("lecturerID");
				session.removeAttribute("lecturerID");
				try{
						getExamLecturer1(lecturerID);
				}
				catch (SQLException e){out.println("getExamLecturer1 JSP SQLException : "+e.getMessage());return;}
				catch (Exception e){out.println("getExamLecturer1 JSP Exception : "+e.getMessage());return;}	
			}
		}	//end session.getAttribute("getExamLecturer1") 
		else if(session.getAttribute("getExamLecturer2")!=null){	// get lecturer2 info
			session.removeAttribute("getExamLecturer2");
			String lecturerID = "";
			
			if(session.getAttribute("lecturerID")!=null){		// get thesis info
				lecturerID = (String)session.getAttribute("lecturerID");
				session.removeAttribute("lecturerID");
				try{
						getExamLecturer2(lecturerID);
				}
				catch (SQLException e){out.println("getExamLecturer2 JSP SQLException : "+e.getMessage());return;}
				catch (Exception e){out.println("getExamLecturer2JSP Exception : "+e.getMessage());return;}	
			}
		}	//end session.getAttribute("getExamLecturer2")
		else if(session.getAttribute("getExamLecturer3")!=null){	// get lecturer3 info
			session.removeAttribute("getExamLecturer3");
			String lecturerID = "";
			
			if(session.getAttribute("lecturerID")!=null){		// get thesis info
				lecturerID = (String)session.getAttribute("lecturerID");
				session.removeAttribute("lecturerID");
				try{
						getExamLecturer3(lecturerID);
				}
				catch (SQLException e){out.println("getExamLecturer3 JSP SQLException : "+e.getMessage());return;}
				catch (Exception e){out.println("getExamLecturer3 JSP Exception : "+e.getMessage());return;}	
			}
		}	//end session.getAttribute("getExamLecturer3") 
		else if(session.getAttribute("getExamLecturer4")!=null){	// get lecturer4 info
			session.removeAttribute("getExamLecturer4");
			String lecturerID = "";
			
			if(session.getAttribute("lecturerID")!=null){		// get thesis info
				lecturerID = (String)session.getAttribute("lecturerID");
				session.removeAttribute("lecturerID");
				try{
						getExamLecturer4(lecturerID);
				}
				catch (SQLException e){out.println("getExamLecturer4 JSP SQLException : "+e.getMessage());return;}
				catch (Exception e){out.println("getExamLecturer4 JSP Exception : "+e.getMessage());return;}	
			}
		}	//end session.getAttribute("getExamLecturer4") 
		else if(session.getAttribute("getExamLecturer5")!=null){	// get lecturer5 info
			session.removeAttribute("getExamLecturer5");
			String lecturerID = "";
			
			if(session.getAttribute("lecturerID")!=null){		// get thesis info
				lecturerID = (String)session.getAttribute("lecturerID");
				session.removeAttribute("lecturerID");
				try{
						getExamLecturer5(lecturerID);
				}
				catch (SQLException e){out.println("getExamLecturer5 JSP SQLException : "+e.getMessage());return;}
				catch (Exception e){out.println("getExamLecturer5 JSP Exception : "+e.getMessage());return;}	
			}
		}	//end session.getAttribute("getExamLecturer5") 
		else if(session.getAttribute("getExamLecturer6")!=null){	// get lecturer6 info
			session.removeAttribute("getExamLecturer6");
			String lecturerID = "";
			
			if(session.getAttribute("lecturerID")!=null){		// get thesis info
				lecturerID = (String)session.getAttribute("lecturerID");
				session.removeAttribute("lecturerID");
				try{
						getExamLecturer6(lecturerID);
				}
				catch (SQLException e){out.println("getExamLecturer6 JSP SQLException : "+e.getMessage());return;}
				catch (Exception e){out.println("getExamLecturer6 JSP Exception : "+e.getMessage());return;}	
			}
		}	//end session.getAttribute("getExamLecturer6") 
%>
<html>
<head>
<title>บันทึกผลการสอบวิทยานิพนธ์</title>
<script language=javascript1.2 SRC="javascript/inslecturer.js">
</script>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="stylesheet/insert.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">
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
		<td valign="middle" height="28">
				<table width="780" border="0" cellspacing="0" cellpadding="0">
				<tr>
						<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;บันทึกผลการสอบวิทยานิพนธ์</font></td>
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
    <td valign="top">     <!-- Cover Main Page-->
		<table width="780" border="0" cellspacing="0" cellpadding="0">
          <tr>             
            <!--- ver line ---><td width="1" align="left" valign="top"  background="image/verdotshort.gif">
            <td width="778" valign="top"> 
              <!-- Insert data -->
              <br>  <br>
				<form action="servlet/examThesisWork" method="post" name="addExamThesisForm">
				<center>
                <table width="400" height="50" bgcolor="#671691" border="1" bordercolor="#9900FF" >
                  <tr> 
                    <td valign="middle" align="center" class="topic">บันทึกผลการสอบวิทยานิพนธ์
					</td>
                  </tr>
                </table></center><br>
				<center>
                  <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows">
                    <tr> 
                      <td colspan="4" height="31" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;ข้อมูลนักศึกษาที่ทำวิยานิพนธ์</font></td>
                    </tr>
                    <tr> 
                      <td colspan="4"  valign="bottom"><table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows" frame="void">
                          <tr> 
                            <td width="100" align="right" valign="bottom"><font class="insfont">รหัสนักศึกษา&nbsp;</font></td>
                            <td width="200" align="left" valign="bottom"><input type="text" name="stdID" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="8" maxlength="8"  value="<%=std.getStdID()%>" <%if(!std.getStdID().equals("")) out.print("readonly=\"true\"");%> ></td>
                            <td width="70" valign="bottom">&nbsp;</td>
                            <td width="280" valign="bottom"><input type="submit" name="getThesisInfo" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkStdID()"></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font> 
                            </td>
                            <td valign="bottom"><input type="text" name="stdname" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=std.getTname()%>" ></td>
                            <td align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="stdsurname" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30"  readonly="true" value="<%=std.getTfamily()%>" ></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">หลักสูตร&nbsp;</font></td>
                            <td colspan="3" align="left" valign="bottom"><input type="text" name="stdcourse" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="50" readonly="true" value="<%=stdcoursename%>" > 
                            </td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">สาขาวิชา&nbsp;</font></td>
                            <td colspan="3" align="left" valign="bottom"><input type="text" name="stdmajor" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="50" readonly="true" value="<%=stdmajorname%>" ></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="stdcourse2" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30"  readonly="true" value="<%=stddeptname%>" ></td>
                            <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td align="left" valign="bottom"> <input type="text" name="stdmajor2" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30"  readonly="true" value="<%=stdfactname%>" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4" height="33" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;ข้อมูลวิยานิพนธ์</font></td>
                    </tr>
                    <tr> 
                      <td width="100" align="right" valign="bottom"><font class="insfont">รหัสวิทยานิพนธ์&nbsp;</font></td>
                      <td width="70" valign="bottom"><input type="text" name="thesisID"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="8" maxlength="8" <%if(thesis.getThesisID()!=0 ) out.print("value=\""+thesis.getThesisID()+"\"");%>></td>
                      <td width="100" align="right" valign="bottom"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td width="380" align="left" valign="bottom"><font class="insfont"> 
                        <input type="text" name="academicyear"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true"  size="5" maxlength="4" <%if(!thesis.getApproveDate().equals("") ) out.print("value=\""+thesis.getAcademicYear()+"\"");%>>
                        &nbsp;</font></td>
                    </tr>
                    <tr> 
                      <td  align="right" valign="bottom"><font class="insfont">ชื่อเรื่องภาษาไทย&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><input type="text" name="topic_th"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true"  size="80" <%if(!thesis.getApproveDate().equals("") ) out.print(thaiLanguage.MS874ToUnicode("value=\""+thesis.getTopic_th()+"\""));%>></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">ชื่อเรื่องภาษาอังกฤษ&nbsp;</font></td>
                      <td colspan="3"  valign="bottom"><input type="text" name="topic_en"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true"  size="80" <%if(!thesis.getApproveDate().equals("") ) out.print(thaiLanguage.MS874ToUnicode("value=\""+thesis.getTopic_en()+"\""));%>></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont" >คณะ&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><select name="faculty" disabled>
                          <option value="01" <%if( thesis.getThesisID()!=0  && thesis.getFactID().equals("01")) out.print("selected");%>>วิศวกรรมศาสตร์&nbsp;</option>
                          <option value="02" <%if(thesis.getThesisID()!=0 && thesis.getFactID().equals("02")) out.print("selected");%>>สถาปัตยกรรมศาสตร์&nbsp;</option>
                          <option value="03" <%if(thesis.getThesisID()!=0 && thesis.getFactID().equals("03")) out.print("selected");%>>ครุศาสตร์อุตสาหกรรม&nbsp;</option>
                          <option value="04" <%if(thesis.getThesisID()!=0 && thesis.getFactID().equals("04")) out.print("selected");%>>วิทยาศาสตร์&nbsp;</option>
                          <option value="05" <%if(thesis.getThesisID()!=0 && thesis.getFactID().equals("05")) out.print("selected");%>>เทคโนโลยีการเกษตร&nbsp;</option>
                          <option value="06" <%if(thesis.getThesisID()!=0 && thesis.getFactID().equals("06")) out.print("selected");%>>โครงการคณะอุตสาหกรรมเกษตร</option>
                          <option value="07" <%if(thesis.getThesisID()!=0 && thesis.getFactID().equals("07")) out.print("selected");%>>เทคโนโลยีสารสนเทศ&nbsp;</option>
                        </select></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">อนุมัติเมื่อวันที่&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><select name="approvedate" disabled>
                          <option value="01" <%if(!thesis.getApproveDate().equals("") && thesis.getApproveDate().substring(8,10).equals("01")) out.print("selected");%>>1</option>
                          <option value="02" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("02")) out.print("selected");%>>2</option>
                          <option value="03" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("03")) out.print("selected");%>>3</option>
                          <option value="04" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("04")) out.print("selected");%>>4</option>
                          <option value="05" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("05")) out.print("selected");%>>5</option>
                          <option value="06" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("06")) out.print("selected");%>>6</option>
                          <option value="07" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("07")) out.print("selected");%>>7</option>
                          <option value="08" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("08")) out.print("selected");%>>8</option>
                          <option value="09" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("09")) out.print("selected");%>>9</option>
                          <option value="10" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("10")) out.print("selected");%>>10</option>
                          <option value="11" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("11")) out.print("selected");%>>11</option>
                          <option value="12" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("12")) out.print("selected");%>>12</option>
                          <option value="13" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("13")) out.print("selected");%>>13</option>
                          <option value="14" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("14")) out.print("selected");%>>14</option>
                          <option value="15" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("15")) out.print("selected");%>>15</option>
                          <option value="16" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("16")) out.print("selected");%>>16</option>
                          <option value="17" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("17")) out.print("selected");%>>17</option>
                          <option value="18" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("18")) out.print("selected");%>>18</option>
                          <option value="19" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("19")) out.print("selected");%>>19</option>
                          <option value="20" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("20")) out.print("selected");%>>20</option>
                          <option value="21" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("21")) out.print("selected");%>>21</option>
                          <option value="22" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("22")) out.print("selected");%>>22</option>
                          <option value="23" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("23")) out.print("selected");%>>23</option>
                          <option value="24" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("24")) out.print("selected");%>>24</option>
                          <option value="25" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("25")) out.print("selected");%>>25</option>
                          <option value="26" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("26")) out.print("selected");%>>26</option>
                          <option value="27" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("27")) out.print("selected");%>>27</option>
                          <option value="28" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("28")) out.print("selected");%>>28</option>
                          <option value="29" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("29")) out.print("selected");%>>29</option>
                          <option value="30" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("30")) out.print("selected");%>>30</option>
                          <option value="31" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(8,10).equals("31")) out.print("selected");%>>31&nbsp;&nbsp;</option>
                        </select> <font class="insfont">&nbsp;&nbsp;&nbsp;&nbsp;เดือน 
                        </font> <select name="approvemonth" disabled>
                          <option value="01" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("01")) out.print("selected");%>>มกราคม</option>
                          <option value="02" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("02")) out.print("selected");%>>กุมภาพันธ์</option>
                          <option value="03" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("03")) out.print("selected");%>>มีนาคม</option>
                          <option value="04" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("04")) out.print("selected");%>>เมษายน</option>
                          <option value="05" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("05")) out.print("selected");%>>พฤษภาคม</option>
                          <option value="06" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("06")) out.print("selected");%>>มิถุนายน</option>
                          <option value="07" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("07")) out.print("selected");%>>กรกฎาคม</option>
                          <option value="08" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("08")) out.print("selected");%>>สิงหาคม</option>
                          <option value="09" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("09")) out.print("selected");%>>กันยายน</option>
                          <option value="10" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("10")) out.print("selected");%>>ตุลาคม</option>
                          <option value="11" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(5,7).equals("11")) out.print("selected");%>>พฤษจิกายน&nbsp;&nbsp;</option>
                          <option value="12" <%if(!thesis.getApproveDate().equals("")   && thesis.getApproveDate().substring(3,5).equals("12")) out.print("selected");%>>ธันวาคม</option>
                        </select> <font class="insfont">&nbsp;&nbsp;พ.ศ.&nbsp; 
                        </font> <input name="approveyear" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="5" readonly="true" maxlength="4" value="<%if(!thesis .getApproveDate().equals("")  && !thesis.getApproveDate().substring(0,4).equals("0000")) out.print(""+( Integer.parseInt(thesis.getApproveDate().substring(0,4))+543) );%>"></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="left" height="31" bgcolor="#9999CC"  valign="bottom"><font class="header">&nbsp;กรรมการคุมสอบ</font></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="right" valign="bottom"><table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="100" align="right" valign="bottom"><font class="insfont">1.&nbsp;&nbsp;&nbsp;รหัสอาจารย์&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturerID1"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;<%if(!examL[0].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>"  size="10" maxlength="8" <%if(!examL[0].getLecturerID().equals("") ) out.print("value=\""+examL[0].getLecturerID()+"\" readonly=\"true\" ");%>></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom"><input type="submit" name="getExamLecturer1" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkLecturerID(document.addExamThesisForm.examlecturerID1)"></td>
                          </tr>
                          <tr> 
                            <td height="26" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturername1"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[0].getLecturerID().equals("") ) out.print("value=\""+examL[0].getAcademicAffiliation()+examL[0].getName_th()+"\" ");%>></td>
                            <td width="64" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="277" align="left" valign="bottom"><font class="insfont"> 
                              <input type="text" name="examlecturersurname1"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[0].getLecturerID().equals("") ) out.print("value=\""+examL[0].getSurname_th()+"\" ");%>>
                              </font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"s><input type="text" name="examlefactname1"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[0].getLecturerID().equals("") ) out.print("value=\""+LFactName[0]+"\" ");%>></td>
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="examdeptname1"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[0].getLecturerID().equals("") ) out.print("value=\""+LDeptName[0]+"\" ");%>></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="right" valign="bottom"><table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="100" align="right" valign="bottom"><font class="insfont">2.&nbsp;&nbsp;&nbsp;รหัสอาจารย์&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturerID2"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;<%if(!examL[1].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>"  size="10" maxlength="8" <%if(!examL[1].getLecturerID().equals("") ) out.print("value=\""+examL[1].getLecturerID()+"\" readonly=\"true\" ");%>></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom"><input type="submit" name="getExamLecturer2" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkLecturerID(document.addExamThesisForm.examlecturerID2)"></td>
                          </tr>
                          <tr> 
                            <td height="24" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturername2"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30"  <%if(!examL[1].getLecturerID().equals("") ) out.print("value=\""+examL[1].getAcademicAffiliation()+examL[1].getName_th()+"\" ");%>></td>
                            <td width="64" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="277" align="left" valign="bottom"><font class="insfont"> 
                              <input type="text" name="examlecturersurname2"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[1].getLecturerID().equals("") ) out.print("value=\""+examL[1].getSurname_th()+"\" ");%>>
                              </font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"s><input type="text" name="examlefactname2"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[1].getLecturerID().equals("") ) out.print("value=\""+LFactName[1]+"\" ");%>></td>
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="examdeptname2"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[1].getLecturerID().equals("") ) out.print("value=\""+LDeptName[1]+"\" ");%>></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="right" valign="bottom"><table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="100" align="right" valign="bottom"><font class="insfont">3.&nbsp;&nbsp;&nbsp;รหัสอาจารย์&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturerID3"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;<%if(!examL[2].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>"  size="10" maxlength="8"  <%if(!examL[2].getLecturerID().equals("") ) out.print("value=\""+examL[2].getLecturerID()+"\" readonly=\"true\" ");%>></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom"><input type="submit" name="getExamLecturer3" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkLecturerID(document.addExamThesisForm.examlecturerID3)"></td>
                          </tr>
                          <tr> 
                            <td height="24" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturername3"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30"  <%if(!examL[2].getLecturerID().equals("") ) out.print("value=\""+examL[2].getAcademicAffiliation()+examL[2].getName_th()+"\" ");%>></td>
                            <td width="64" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="277" align="left" valign="bottom"><font class="insfont"> 
                              <input type="text" name="examlecturersurname3"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[2].getLecturerID().equals("") ) out.print("value=\""+examL[2].getSurname_th()+"\" ");%>>
                              </font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"s><input type="text" name="examlefactname3"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[2].getLecturerID().equals("") ) out.print("value=\""+LFactName[2]+"\" ");%>></td>
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="examdeptname3"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[2].getLecturerID().equals("") ) out.print("value=\""+LDeptName[2]+"\" ");%>></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="right" valign="bottom"><table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="100" align="right" valign="bottom"><font class="insfont">4.&nbsp;&nbsp;&nbsp;รหัสอาจารย์&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturerID4"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;<%if(!examL[3].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>"  size="10" maxlength="8" <%if(!examL[3].getLecturerID().equals("") ) out.print("value=\""+examL[3].getLecturerID()+"\" readonly=\"true\" ");%>></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom"><input type="submit" name="getExamLecturer4" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkLecturerID(document.addExamThesisForm.examlecturerID4)"></td>
                          </tr>
                          <tr> 
                            <td height="24" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturername4"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30"  <%if(!examL[3].getLecturerID().equals("") ) out.print("value=\""+examL[3].getAcademicAffiliation()+examL[3].getName_th()+"\" ");%>></td>
                            <td width="64" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="277" align="left" valign="bottom"><font class="insfont"> 
                              <input type="text" name="examlecturersurname4"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[3].getLecturerID().equals("") ) out.print("value=\""+examL[3].getSurname_th()+"\" ");%>>
                              </font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"s><input type="text" name="examlefactname4"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[3].getLecturerID().equals("") ) out.print("value=\""+LFactName[3]+"\" ");%>></td>
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="examdeptname4"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[3].getLecturerID().equals("") ) out.print("value=\""+LDeptName[3]+"\" ");%>></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="right" valign="bottom"><table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="100" align="right" valign="bottom"><font class="insfont">5.&nbsp;&nbsp;&nbsp;รหัสอาจารย์&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturerID5"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;<%if(!examL[4].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>"  size="10" maxlength="8" <%if(!examL[4].getLecturerID().equals("") ) out.print("value=\""+examL[4].getLecturerID()+"\" readonly=\"true\" ");%>></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom"><input type="submit" name="getExamLecturer5" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkLecturerID(document.addExamThesisForm.examlecturerID5)"></td>
                          </tr>
                          <tr> 
                            <td height="24" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturername5"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30"  <%if(!examL[4].getLecturerID().equals("") ) out.print("value=\""+examL[4].getAcademicAffiliation()+examL[4].getName_th()+"\" ");%>></td>
                            <td width="64" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="277" align="left" valign="bottom"><font class="insfont"> 
                              <input type="text" name="examlecturersurname5"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[4].getLecturerID().equals("") ) out.print("value=\""+examL[4].getSurname_th()+"\" ");%>>
                              </font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"s><input type="text" name="examlefactname5"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[4].getLecturerID().equals("") ) out.print("value=\""+LFactName[4]+"\" ");%>></td>
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="examdeptname5"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[4].getLecturerID().equals("") ) out.print("value=\""+LDeptName[4]+"\" ");%>></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="left"><table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="100" align="right" valign="bottom"><font class="insfont">6.&nbsp;&nbsp;&nbsp;รหัสอาจารย์&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturerID6"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;<%if(!examL[5].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>"  size="10" maxlength="8" <%if(!examL[5].getLecturerID().equals("") ) out.print("value=\""+examL[5].getLecturerID()+"\" readonly=\"true\" ");%>></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom"><input type="submit" name="getExamLecturer6" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkLecturerID(document.addExamThesisForm.examlecturerID6)"></td>
                          </tr>
                          <tr> 
                            <td height="24" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"><input type="text" name="examlecturername6"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30"  <%if(!examL[5].getLecturerID().equals("") ) out.print("value=\""+examL[5].getAcademicAffiliation()+examL[5].getName_th()+"\" ");%>></td>
                            <td width="64" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="277" align="left" valign="bottom"><font class="insfont"> 
                              <input type="text" name="examlecturersurname6"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[5].getLecturerID().equals("") ) out.print("value=\""+examL[5].getSurname_th()+"\" ");%>>
                              </font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td width="209" align="left" valign="bottom"s><input type="text" name="examlefactname6"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[5].getLecturerID().equals("") ) out.print("value=\""+LFactName[5]+"\" ");%>></td>
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="examdeptname6"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="30" <%if(!examL[5].getLecturerID().equals("") ) out.print("value=\""+LDeptName[5]+"\" ");%>></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4" height="31" bgcolor="#9999CC" align="left" valign="bottom"><font class="header">&nbsp;ผลการสอบ</font></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom" ><font class="insfont">วันที่สอบ&nbsp;</font></td>
                      <td colspan="3" align="left" valign="bottom"><select name="examday">
                          <option value="01" selected >1</option>
                          <option value="02" >2</option>
                          <option value="03" >3</option>
                          <option value="04" >4</option>
                          <option value="05" >5</option>
                          <option value="06" >6</option>
                          <option value="07" >7</option>
                          <option value="08"  >8</option>
                          <option value="09" >9</option>
                          <option value="10" >10</option>
                          <option value="11" >11</option>
                          <option value="12" >12</option>
                          <option value="13" >13</option>
                          <option value="14" >14</option>
                          <option value="15" >15</option>
                          <option value="16" >16</option>
                          <option value="17" >17</option>
                          <option value="18" >18</option>
                          <option value="19" >19</option>
                          <option value="20" >20</option>
                          <option value="21" >21</option>
                          <option value="22" >22</option>
                          <option value="23" >23</option>
                          <option value="24" >24</option>
                          <option value="25" >25</option>
                          <option value="26" >26</option>
                          <option value="27" >27</option>
                          <option value="28" >28</option>
                          <option value="29" >29</option>
                          <option value="30" >30</option>
                          <option value="31" >31&nbsp;&nbsp;</option>
                        </select> <font class="insfont">&nbsp;&nbsp;&nbsp;&nbsp;เดือน 
                        </font> <select name="exammonth">
                          <option value="01" >มกราคม</option>
                          <option value="02">กุมภาพันธ์</option>
                          <option value="03" >มีนาคม</option>
                          <option value="04" >เมษายน</option>
                          <option value="05" >พฤษภาคม</option>
                          <option value="06" >มิถุนายน</option>
                          <option value="07" >กรกฎาคม</option>
                          <option value="08" >สิงหาคม</option>
                          <option value="09" >กันยายน</option>
                          <option value="10" >ตุลาคม</option>
                          <option value="11" >พฤษจิกายน&nbsp;&nbsp;</option>
                          <option value="12" >ธันวาคม</option>
                        </select> <font class="insfont">&nbsp;&nbsp;พ.ศ.&nbsp; 
                        </font> <input name="examyear" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="5" maxlength="4" ></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom" ><font class="insfont">เวลา&nbsp;</font></td>
                      <td colspan="3" align="left" valign="bottom"><select name="time">
                          <option value="01" selected >01&nbsp;&nbsp;</option><option value="02" >02&nbsp;</option><option value="03" >03&nbsp;</option><option value="04" >04&nbsp;</option><option value="05" >05&nbsp;</option>
						  <option value="06"  >06&nbsp;</option><option value="07" >07&nbsp;</option><option value="08" >08&nbsp;</option><option value="09" >09&nbsp;</option><option value="10" >10&nbsp;</option>
						  <option value="11"  >11&nbsp;</option><option value="12" >12&nbsp;</option><option value="13" >13&nbsp;</option><option value="14" >14&nbsp;</option><option value="15" >15&nbsp;</option>
						  <option value="16"  >16&nbsp;</option><option value="17" >17&nbsp;</option><option value="18" >18&nbsp;</option><option value="19" >19&nbsp;</option><option value="20" >20&nbsp;</option>
						  <option value="21" >21&nbsp;</option><option value="22" >22&nbsp;</option><option value="23" >23&nbsp;</option><option value="24" >24&nbsp;</option>
                        </select>&nbsp;.&nbsp;<select name="minute">
                          <option value="00" selected >00&nbsp;</option><option value="01" >01&nbsp;</option><option value="02" >02&nbsp;</option><option value="03" >03&nbsp;</option><option value="04" >04&nbsp;</option>
						  <option value="05" >05&nbsp;</option><option value="06"  >06&nbsp;</option><option value="07" >07&nbsp;</option><option value="08" >08&nbsp;</option><option value="09" >09&nbsp;</option>
						  <option value="10" >10&nbsp;</option><option value="11"  >11&nbsp;</option><option value="12" >12&nbsp;</option><option value="13" >13&nbsp;</option><option value="14" >14&nbsp;</option>
                          <option value="15" >15&nbsp;</option><option value="16"  >16&nbsp;</option><option value="17" >17&nbsp;</option><option value="18" >18&nbsp;</option><option value="19" >19&nbsp;</option>
                          <option value="20" >20&nbsp;</option><option value="21" >21&nbsp;</option><option value="22" >22&nbsp;</option><option value="23" >23&nbsp;</option><option value="24" >24&nbsp;</option>
                          <option value="25" >25&nbsp;</option><option value="26" >26&nbsp;</option><option value="27" >27&nbsp;</option><option value="28" >28&nbsp;</option><option value="29" >29&nbsp;</option>
						  <option value="30" >30&nbsp;</option><option value="31"  >31&nbsp;</option><option value="32" >32&nbsp;</option><option value="33" >33&nbsp;</option><option value="34" >34&nbsp;</option>
						  <option value="35" >35&nbsp;</option><option value="36" >36&nbsp;</option><option value="37" >37&nbsp;</option><option value="38" >38&nbsp;</option><option value="39" >39&nbsp;</option>
                          <option value="40" >40&nbsp;</option><option value="41" >41&nbsp;</option><option value="42" >42&nbsp;</option><option value="43" >43&nbsp;</option><option value="44" >44&nbsp;</option>
                          <option value="45" >45&nbsp;</option><option value="46" >46&nbsp;</option><option value="47" >47&nbsp;</option><option value="48" >48&nbsp;</option><option value="49" >49&nbsp;</option>
                          <option value="50" >50&nbsp;</option><option value="51" >51&nbsp;</option><option value="52" >52&nbsp;</option><option value="53" >53&nbsp;</option><option value="54" >54&nbsp;</option>
                          <option value="55" >55&nbsp;</option><option value="56" >56&nbsp;</option><option value="57" >57&nbsp;</option><option value="58" >58&nbsp;</option><option value="59" >59&nbsp;</option>
						
						</select><font class="insfont">&nbsp;น.</font></td>
                    </tr>
                    <tr> 
                      <td align="right"  valign="bottom"><font class="insfont">ค่าระดับคะแนน&nbsp;</font></td>
                      <td colspan="3" align="left" valign="bottom"><select name="examPoint">
                          <option value="O"  selected>O&nbsp;&nbsp;&nbsp;</option>
                          <option value="G" >G&nbsp;&nbsp;&nbsp;</option>
                          <option value="P" >P&nbsp;&nbsp;&nbsp;</option>
                          <option value="F" >F&nbsp;&nbsp;&nbsp;</option>
                        </select> <FONT class="insfont">&nbsp;&nbsp;&nbsp;&nbsp;O(ดีเยี่ยม) 
                        = 4&nbsp;&nbsp;,&nbsp;&nbsp;G(ดี) = 3&nbsp;&nbsp;,&nbsp;&nbsp;P(ผ่าน) 
                        = 2&nbsp;&nbsp;,&nbsp;&nbsp;F(ไม่ผ่าน) = 1 </FONT></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom" ><font class="insfont">สถานที่สอบ&nbsp;</font></td>
                      <td colspan="3" align="left"><input type="text" name="examlocation"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="75" ></td>
                    </tr>
                  </table>            
                  <br>
                  <input name="addExamThesis" type="submit" value="&nbsp;&nbsp;&nbsp;บันทึก&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checks()">
				  &nbsp;&nbsp;
                  <input name="cancelExamThesis" type="submit" value="&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;">
                <br>
				</center>
				</form>
				</td>
            <!-- Insert data -->
            <td width="1" valign="top" background="image/verdotshort.gif"></td>
            <!-- Right --> 
			</tr>            
        </table>
		</td>    <!-- Cover Main Page-->
  </tr>
</table>
</center>
<script language="JavaScript">
	function checkStdID(){
			var v1 = document.addExamThesisForm.stdID;
			
			if( v1.value.length != 8 ){
					 alert("กรุณาใส่รหัสนักศึกษาเป็นตัวเลข 8 หลัก");
    	      		 v1.focus();
        	  		 return false;
			}
			if( v1.value.length != 0){
				if( isNaN(v1.value) ){
					 alert("กรุณาใส่รหัสนักศึกษาเป็นตัวเลข ให้ถูกต้อง");
    	      		 v1.focus();
        	  		 return false;
				}
 			}	
			return true;	
	}	// end  checkScholarshipID()

	function checkLecturerID( v ){			
			if( v.value.length != 8 ){
					 alert("กรุณาใส่รหัสอาจารย์ 8 หลัก");
    	      		 v.focus();
        	  		 return false;
			}
			return true;
	}	// end  checkLecturerID()
	
	function checks(){
		var va = document.addExamThesisForm.thesisID;
		var date = document.addExamThesisForm.examyear;
		var d = document.addExamThesisForm;
		if( !checkStdID() ){
				return false;
		}
		if( va.value.length == 0 ){
			 	alert("กรุณาคลิ๊ก ตกลง เพื่อดึงข้อมูลวิทยานิพนธ์ ");
          		document.addExamThesisForm.getThesisInfo.focus();
				return false;
		}
		if( (d.examlecturerID1.value == 0 ) && (d.examlecturerID2.value == 0 ) && (d.examlecturerID3.value == 0 ) && (d.examlecturerID4.value == 0 )
				&& (d.examlecturerID5.value == 0 ) && (d.examlecturerID6.value == 0 ) )
		{
			 	alert("กรุณาระบุกรรมการคุมสอบ");
				d.examlecturerID1.focus();
				return false;	
		}
		if( date.value.length !=4 ){
			 	alert("กรุณาระบุ ปี ที่สอบเป็นตัวเลข 4 หลัก" );
          		date.focus();
				return false;
		}
		if( date.value.length != 0){
				if(isNaN(date.value)){
					 alert("กรุณาใส่ปีที่สอบเป็นตัวเลข 4  หลักให้ถูกต้อง");
    	      		 date.focus();
        	  		 return false;
				}
 		}	
		
		return true;
	}
</script>
</body>
</html>
