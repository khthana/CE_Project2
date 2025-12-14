<%@ page import="myutil.server,java.sql.*,myutil.thaiLanguage,thesis.Thesis,java.io.*,thesis.superviseThesis,lecturer.Lecturer,student.Student"  contentType="text/html; charset=windows-874"%>
<%!	
		int join=0;
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

		// super
		private Lecturer lecturer = new Lecturer();
		private superviseThesis superThesis=new superviseThesis();
		private String LFactName="";
		private String LDeptName="";
		private String LMajorName="";

		// join1
		private Lecturer[] joinLecturer = {new Lecturer(),new Lecturer()};
		private superviseThesis[] joinThesis = {new superviseThesis(),new superviseThesis()};
		private String[] joinFactName={"",""};
		private String[] joinDeptName={"",""};
		private String[] joinMajorName={"",""};		
		
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
						stdcoursename= rs.getString("CNAME");
					if(rs.getString("FNAME")!=null)
						stdfactname= rs.getString("FNAME");
					if(rs.getString("DNAME")!=null)
						stddeptname= rs.getString("DNAME");
					if(rs.getString("MNAME")!=null)
						stdmajorname=rs.getString("MNAME");					
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
			// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม
			sql = "SELECT * FROM SUPERVISETHESIS WHERE THESIS# = "+thesis.getThesisID()+"  AND  SUPERVISESTATUS ='"+thaiLanguage.MS874ToUnicode("ร่วม")+"' "; 
			rs = stmt.executeQuery(sql);
			int k=0;
			
			while(rs.next()){	// get  ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม
					if(rs.getString("LECTURER#")!=null)
						joinThesis[k].setLecturerID(rs.getString("LECTURER#"));
					if(rs.getString("SUPERVISESTATUS")!=null)
						joinThesis[k].setSuperviseStatus(rs.getString("SUPERVISESTATUS"));				
					k++;
			} // end  if		
			rs.close();
			join=0;
			for(int i = 0;i<joinThesis.length;i++){
					if(!joinThesis[i].getLecturerID().equals(""))	{
							 sql = "SELECT L.LECTURER#,L.NAME_TH,L.SURNAME_TH,L.TITLE_TH,L.ACADEMICAFFILIATION ,"+
							 "F.TNAME AS FNAME ,D.TNAME AS DNAME,M.TNAME MNAME "+
							 "FROM  LECTURER L , FACULTY F , DEPARTMENT D , MAJOR M "+
							 "WHERE L.LECTURER#='"+joinThesis[i].getLecturerID()+"'  "+
							 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# = '"+joinThesis[i].getLecturerID()+"' ) "+
							 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='"+joinThesis[i].getLecturerID()+"' ) "+
							 "AND M.MAJOR# = (SELECT MAJOR# FROM LECTURER WHERE LECTURER# ='"+joinThesis[i].getLecturerID()+"' ) ";
							rs = stmt.executeQuery(sql);					
							if(rs.next()){		// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก
									join++;
									if(rs.getString("LECTURER#")!=null)						
											joinLecturer[i].setLecturerID( rs.getString("LECTURER#"));
									if(rs.getString("TITLE_TH")!=null)						
											joinLecturer[i].setTitle_th( rs.getString("TITLE_TH"));
									if(rs.getString("NAME_TH")!=null)						
											joinLecturer[i].setName_th( rs.getString("NAME_TH"));
									if(rs.getString("SURNAME_TH")!=null)						
											joinLecturer[i].setSurname_th( rs.getString("SURNAME_TH"));
									if(rs.getString("ACADEMICAFFILIATION")!=null)						
											joinLecturer[i].setAcademicAffiliation( rs.getString("ACADEMICAFFILIATION"));
									if(rs.getString("FNAME")!=null)
											joinFactName[i]= rs.getString("FNAME");
									if(rs.getString("DNAME")!=null)
											joinDeptName[i]= rs.getString("DNAME");
									if(rs.getString("MNAME")!=null)
											joinMajorName[i]=rs.getString("MNAME");
							}
							rs.close();				
					}				
			}// end for
			stmt.close();
			con.close();
		}// end  getThesisInfo
		
		//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		public void getJoin1(String join1ID)throws Exception{		// get ข้อมูลอาจารย์ควบคุมวิทยานิพนธ์ร่วม1
			Statement stmt;
				ResultSet rs;
				Connection con;
				String sql = "SELECT L.LECTURER# ,L.TITLE_TH , L.NAME_TH, L.SURNAME_TH ,L.ACADEMICAFFILIATION, "+
									 " F.FACT# AS FACTID, F.TNAME AS FNAME ,D.DEPT# AS DEPTID, D.TNAME AS DNAME "+
									 " FROM LECTURER L, FACULTY F ,DEPARTMENT D WHERE LECTURER# ='"+join1ID+"' "+
									 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# ='"+join1ID+"') "+
									 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='"+join1ID+"') ";
				
				Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
				con = DriverManager.getConnection(url,user,passwd);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
						joinLecturer[0].setLecturerID( rs.getString("LECTURER#"));
						joinLecturer[0].setTitle_th( rs.getString("TITLE_TH"));
						joinLecturer[0].setName_th( rs.getString("NAME_TH"));
						joinLecturer[0].setSurname_th(rs.getString("SURNAME_TH"));
						joinLecturer[0].setAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
						joinLecturer[0].setFaculty( rs.getString("FACTID"));
						joinFactName[0]=rs.getString("FNAME");
						joinDeptName[0]=rs.getString("DNAME");
						joinDeptName[0]=rs.getString("DEPTID");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getJoin1
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		public void getJoin2(String join2ID)throws Exception{		// get ข้อมูลอาจารย์ควบคุมวิทยานิพนธ์ร่วม2
			Statement stmt;
				ResultSet rs;
				Connection con;
				String sql = "SELECT L.LECTURER# ,L.TITLE_TH , L.NAME_TH, L.SURNAME_TH ,L.ACADEMICAFFILIATION, "+
									 " F.FACT# AS FACTID, F.TNAME AS FNAME ,D.DEPT# AS DEPTID, D.TNAME AS DNAME "+
									 " FROM LECTURER L, FACULTY F ,DEPARTMENT D WHERE LECTURER# ='"+join2ID+"' "+
									 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# ='"+join2ID+"') "+
									 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='"+join2ID+"') ";
				
				Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
				con = DriverManager.getConnection(url,user,passwd);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
					if(rs.next()){
						joinLecturer[1].setLecturerID( rs.getString("LECTURER#"));
						joinLecturer[1].setTitle_th( rs.getString("TITLE_TH"));
						joinLecturer[1].setName_th( rs.getString("NAME_TH"));
						joinLecturer[1].setSurname_th(rs.getString("SURNAME_TH"));
						joinLecturer[1].setAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
						joinLecturer[1].setFaculty( rs.getString("FACTID"));
						joinFactName[1]=rs.getString("FNAME");
						joinDeptName[1]=rs.getString("DNAME");
						joinDeptName[1]=rs.getString("DEPTID");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getJoin2
			//------------------------------
%>

<%	//------------------------------
		
		if(session.getAttribute("login")==null){
			response.sendRedirect("loginfail.jsp");
		}

		if( (session.getAttribute("getAddJoinSupervisor")==null)&&(session.getAttribute("getAddJoin1")==null )&&(session.getAttribute("getAddJoin2")==null ) ){
				join=0;
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

				// super
				lecturer.setLecturerID("");
				lecturer.setTitle_th("");
				lecturer.setName_th("");
				lecturer.setSurname_th("");
				lecturer.setAcademicAffiliation("");
				superThesis.setLecturerID("");
				superThesis.setThesisID(0);
				superThesis.setSuperviseStatus("");
				LFactName="";
				LDeptName="";
				LMajorName="";

				// join
				for(int i=0;i<2;i++){
					joinLecturer[i].setLecturerID("");
					joinLecturer[i].setTitle_th("");
					joinLecturer[i].setName_th("");
					joinLecturer[i].setSurname_th("");
					joinLecturer[i].setAcademicAffiliation("");
					joinThesis[i].setLecturerID("");
					joinThesis[i].setThesisID(0);
					joinThesis[i].setSuperviseStatus("");
					joinFactName[i]="";
					joinDeptName[i]="";
					joinMajorName[i]="";
				}
				
		}
		session.removeAttribute("notfound");
		server svr= new server();
		url= "jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();	 
		user =svr.getUsername();
		passwd = svr.getPassword();

		if(session.getAttribute("getAddJoinSupervisor")!=null){		// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม 1	
			
			session.removeAttribute("getAddJoinSupervisor");
			String thesisID = "";
			
			if(session.getAttribute("thesisID")!=null){
				thesisID = (String)session.getAttribute("thesisID");
				session.removeAttribute("thesisID");
				String sqlCommand = "SELECT * FROM THESIS T, FACULTY F WHERE T.THESIS#="+thesisID+" "+
												"AND F.FACT#=(SELECT FACT# FROM THESIS WHERE THESIS#="+thesisID+")";
				try{
						 getThesisInfo(sqlCommand,out);				
				}
				catch (ClassNotFoundException e){out.println("ClassNotFoundException : "+e.getMessage());return;}
				catch (SQLException e){out.println("SQLException : "+e.getMessage());return;}
				catch (Exception e){out.println("Exception : "+e.getMessage());return;}											
										
			}
		}
		else if(session.getAttribute("getAddJoin1")!=null){		// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม 1
				String join1ID="";
				try{
						session.removeAttribute("getAddJoin1");
						join1ID = "";
						if(session.getAttribute("join1ID")!=null){
							join1ID = (String)session.getAttribute("join1ID");
							session.removeAttribute("join1ID");
							getJoin1(join1ID);
						}
				}
				catch(SQLException e){out.println(" SQLException in add thesis getJoin1 : "+e.getMessage());}
				catch(Exception e){out.println(" Exception in add thesis getJoin1 : "+e.getMessage());}
		
		}		// end getJoin 1
//-----------------------------		
		else if(session.getAttribute("getAddJoin2")!=null){		// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม 2
				String join2ID="";
				try{
						session.removeAttribute("getAddJoin2");
						join2ID = "";
						if(session.getAttribute("join2ID")!=null){
							join2ID = (String)session.getAttribute("join2ID");
							session.removeAttribute("join2ID");
							getJoin2(join2ID);
						}
				}
				catch(SQLException e){out.println(" SQLException in add thesis getJoin2 : "+e.getMessage());}
				catch(Exception e){out.println(" Exception in add thesis getJoin2 : "+e.getMessage());}
		}		// end getJoin 2
//-----------------------------		

%>
<html>
<head>
<title>เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</title>
<script language=javascript SRC="javascript/changesup.js">
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
		<td valign="bottom" height="28">
				<table width="780" border="0" cellspacing="0" cellpadding="0">
				<tr>
						<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</font></td>
    					<td width="110" align="right" valign="bottom"><a class="pathlink2" href="servlet/login?logout=logout">Logout</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  				</tr>
				</table>
			
		</td>
	</tr>
	<tr>
		<td valign="top" background="image/hordotshort.gif"height="1">		
		</td>
	</tr>
	<tr>
    <td valign="top">     <!-- Cover Main Page-->
		<table width="780" border="0" cellspacing="0" cellpadding="0">
          <tr> 
           <td width="1" align="left" valign="top" background="image/verdotshort.gif">
            <td width="778" valign="top"> 
              <!-- Insert data -->
              <br> <center>
                <table width="400" height="50" bgcolor="#671691" border="1" bordercolor="#9900FF" >
                  <tr> 
                    <td valign="middle" align="center" class="topic"> เพิ่มอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</td>
                  </tr>
                </table>
				</center>
				<br>
				<form action="servlet/thesisWork" method="post" name="addJoinForm">
					<center>
                  <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows">                    
                    <tr> 
                      <td colspan="3" height="31" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;ข้อมูลวิทยานิพนธ์</font> 
                      </td>
                    </tr>
					<tr> 
                      <td  valign="bottom"  align="right"><font class="insfont">รหัสวิทยานิพนธ์&nbsp;</font></td>
                      <td  valign="bottom"><input type="text" name="thesisID"  style="BORDER:#2B2C6F thin solid;COLOR:#000000; <%if(thesis .getThesisID()!=0) out.print("BACKGROUND:#DCEBF7;");%>" size="8" maxlength="8" <%if(thesis .getThesisID()!=0) out.print("value=\""+thesis.getThesisID()+"\"  readonly=\"true\"");%>></td>
                      <td  valign="bottom"><input type="submit" name="getAddJoinSupervisor" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkThesisID()"></td>
                    </tr>
                    <tr> 
                      <td width="105" align="right" valign="bottom"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td width="245" valign="bottom"><input type="text" name="academicyear"  style="BORDER:#2B2C6F thin solid;COLOR:#000000; BACKGROUND:#DCEBF7;" size="8" maxlength="4" readonly="true" <%if(!thesis .getApproveDate().equals("")) out.print("value=\""+thesis.getAcademicYear()+"\"");%>></td>
                      <td width="300" valign="bottom">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="97" align="right" valign="bottom"><font class="insfont">ชื่อเรื่องภาษาไทย&nbsp;</font></td>
                      <td colspan="2" valign="bottom"><input type="text" name="topic_th"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="80" <%if(!thesis .getApproveDate().equals("")) out.print(thaiLanguage.MS874ToUnicode("value=\""+thesis.getTopic_th()+"\""));%>></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">ชื่อเรื่องภาษาอังกฤษ&nbsp;</font></td>
                      <td colspan="2" valign="bottom"><input type="text" name="topic_en"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" readonly="true" size="80" <%if(!thesis .getApproveDate().equals("")) out.print(thaiLanguage.MS874ToUnicode("value=\""+thesis.getTopic_en()+"\""));%>></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
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
                      <td align="right" valign="bottom"><font class="insfont">อนุมัติเมื่อวันที่&nbsp;</font></td>
                      <td colspan="2" valign="bottom"><select name="approvedate" disabled>
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
                        </select>
                        <font class="insfont">&nbsp;&nbsp;เดือน </font> <select name="approvemonth" disabled>
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
                        </select>
                        <font class="insfont">&nbsp;&nbsp;พ.ศ.&nbsp; </font> <input name="approveyear" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="5" readonly="true" maxlength="4" value="<%if(!thesis .getApproveDate().equals("")  && !thesis.getApproveDate().substring(6).equals("0000")) out.print(""+( Integer.parseInt(thesis.getApproveDate().substring(0,4))+543) );%>"></td>
                    </tr>
                    <tr> 
                      <td colspan="3" height="31" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;ข้อมูลนักศึกษาที่ทำวิยานิพนธ์</font></td>
                    </tr>
                    <tr> 
                      <td colspan="3" align="left" valign="bottom"> <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows" frame="void">
                          <tr> 
                            <td width="103" align="right" valign="bottom"><font class="insfont">รหัสนักศึกษา&nbsp;</font> 
                            </td>
                            <td width="180" align="left" valign="bottom"><input type="text" name="stdID" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="8" maxlength="8"  value="<%=std.getStdID()%>"  readonly="true" ></td>
                            <td width="57">&nbsp;</td>
                            <td width="296" valign="bottom">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font> 
                            </td>
                            <td valign="bottom"><input type="text" name="stdname" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="28" readonly="true" value="<%=std.getTname()%>" ></td>
                            <td align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="stdsurname" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="28"  readonly="true" value="<%=std.getTfamily()%>" ></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">หลักสูตร&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="stdcourse" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="28" readonly="true" value="<%=stdcoursename%>" ></td>
                            <td align="right" valign="bottom"><font class="insfont">สาขาวิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="stdmajor" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="45" readonly="true" value="<%=stdmajorname%>" ></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="stdcourse" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="28"  readonly="true" value="<%=stddeptname%>" ></td>
                            <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="stdmajor" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="45"  readonly="true" value="<%=stdfactname%>" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="3"height="31" bgcolor="#9999CC"  valign="bottom"><font class="header">&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์</font>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="3" align="left" valign="bottom"> <table width="645" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td colspan="2" align="left" valign="bottom"><font class="miniheader">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก</font></td>
                            <td width="50" align="right" valign="bottom">&nbsp;</td>
                            <td width="272" valign="bottom">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">รหัสอาจารย์&nbsp;</font> 
                            </td>
                            <td align="left" valign="bottom"><input type="text" name="superID" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="8" maxlength="8"  readonly="true" value="<%=lecturer.getLecturerID()%>" ></td>
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
                              ร.ศ.&nbsp;&nbsp; 
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
                            <td width="105" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="218" valign="bottom"><input type="text" name="supervise_name"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=lecturer.getName_th()%>" ></td>
                            <td align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="supervise_surname"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30"  readonly="true" value="<%=lecturer.getSurname_th()%>" ></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="supervise_faculty"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=LFactName%>" ></td>
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="supervise_dept"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="40" readonly="true" value="<%=LDeptName%>" 
							></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="5"> <table width="645" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td colspan="4" align="left" valign="bottom"><font class="miniheader">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม&nbsp;1</font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">รหัสอาจารย์&nbsp;</font> 
                            </td>
                            <td align="left" valign="bottom"><input type="text"<% if(join==0) out.print(" name=\"join1ID\""); else{ out.print(" name=\"join1\"");}%>  style="BORDER: #2B2C6F thin solid;COLOR:#000000; <%if(!joinLecturer[0].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="8" maxlength="8" value="<%=joinLecturer[0].getLecturerID()%>"  <%if(!joinLecturer[0].getLecturerID().equals("")) out.print("readonly=\"true\"");%> >
							<% if(join!=0) out.print("<input name=\"join1ID\" type=\"hidden\" value=\"\">");%>
							</td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom">
								 <%
							 		if(joinLecturer[0].getLecturerID().equals(""))
										out.print("<input type=\"submit\" name=\"getAddJoin1\" value=\"  ตกลง  \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\" onClick=\"return checkJoin1ID( )\">");
                          		%>
							</td>
						  </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ตำแหน่งทางวิชาการ&nbsp;</font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <input name="join1affiliation" type="radio" value="lecturer" readonly="true"  onClick="return noClink()" <%if(joinLecturer[0].getAcademicAffiliation().equals("อาจารย์")) out.print("checked");%>>
                              อาจารย์&nbsp;&nbsp;&nbsp; 
                              <input name="join1affiliation" type="radio" value="Asst_Prof" readonly="true" onClick="return noClink()" <%if(joinLecturer[0].getAcademicAffiliation().equals("ผ.ศ.")) out.print("checked");%>>
                              ผ.ศ.&nbsp;&nbsp;&nbsp; 
                              <input name="join1affiliation" type="radio" value="Assoc_Prof" readonly="true" onClick="return noClink()" <%if(joinLecturer[0].getAcademicAffiliation().equals("ร.ศ.")) out.print("checked");%>>
                              ร.ศ.&nbsp;&nbsp; 
                              <input name="join1affiliation" type="radio" value="Prof" readonly="true" onClick="return noClink()" <%if(joinLecturer[0].getAcademicAffiliation().equals("ศ.")) out.print("checked");%>>
                              ศ.</font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <%
									if(!joinLecturer[0].getAcademicAffiliation().equals("อาจารย์")&&!joinLecturer[0].getAcademicAffiliation().equals("ผ.ศ.")&&!joinLecturer[0].getAcademicAffiliation().equals("ร.ศ.")&&!joinLecturer[0].getAcademicAffiliation().equals("ศ.")&&!joinLecturer[0].getAcademicAffiliation().equals(""))
										out.print("<input name=\"join1affiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\" checked>อื่นๆ&nbsp;");
									else
										out.print("<input name=\"join1affiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\">อื่นๆ&nbsp;");
							%>
                              </font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <input name="join1affiliation_affi_other" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000; <%if(!joinLecturer[0].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="30" <%if(!joinLecturer[0].getLecturerID().equals("")) out.print("readonly=\"true\"");%>  value="<%if(!joinLecturer[0].getAcademicAffiliation().equals("อาจารย์")&&!joinLecturer[0].getAcademicAffiliation().equals("ผ.ศ.")&&!joinLecturer[0].getAcademicAffiliation().equals("ร.ศ.")&&!joinLecturer[0].getAcademicAffiliation().equals("ศ.")&&!joinLecturer[0].getAcademicAffiliation().equals("")) out.print(joinLecturer[0].getAcademicAffiliation());%>">
                              </font></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="218" valign="bottom"><input type="text" name="join1_name"  style="BORDER: #2B2C6F thin solid;COLOR:#000000; <%if(!joinLecturer[0].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="30"<%if(!joinLecturer[0].getLecturerID().equals("")) out.print("readonly=\"true\"");%> value="<%=joinLecturer[0].getName_th()%>" ></td>
                            <td width="50" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="272" valign="bottom"><input type="text" name="join1_sername"  style="BORDER: #2B2C6F thin solid;COLOR:#000000; <%if(!joinLecturer[0].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="30" <%if(!joinLecturer[0].getLecturerID().equals("")) out.print("readonly=\"true\"");%>  value="<%=joinLecturer[0].getSurname_th()%>" ></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="join1_faculty"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;<%if(!joinLecturer[0].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="30"  value="<%=joinFactName[0]%>"   <%if(!joinLecturer[0].getLecturerID().equals("")) out.print("readonly=\"true\"");%>></td>
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="join1_dept"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;<%if(!joinLecturer[0].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="40"  value="<%=joinDeptName[0]%>" <%if(!joinLecturer[0].getLecturerID().equals("")) out.print("readonly=\"true\"");%> ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="5"> <table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="21" colspan="4" align="left" valign="bottom"><font class="miniheader">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม&nbsp;2</font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">รหัสอาจารย์&nbsp;</font> 
                            </td>
                            <td align="left" valign="bottom"><input type="text" <% if(join<=1) out.print("name=\"join2ID\" "); else out.print("name=\"join2\" ");%> style="BORDER: #2B2C6F thin solid;COLOR:#000000;<%if(!joinLecturer[1].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="8" maxlength="8" value="<%=joinLecturer[1].getLecturerID()%>" <%if(!joinLecturer[1].getLecturerID().equals("")) out.print("readonly=\"true\"");%>>
								<% if(join>1) out.print("<input name=\"join2ID\" type=\"hidden\" value=\"\">");%>
							</td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom">
								 <%
							 		if(joinLecturer[1].getLecturerID().equals(""))
											out.print("<input type=\"submit\" name=\"getAddJoin2\" value=\"  ตกลง  \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\" onClick=\"return checkValue(document.addThesisForm.join2ID)\">");
                          		%>
						  	</td>
						  </tr>
                          <tr> 
                            <td align="right"  valign="bottom"><font class="insfont">ตำแหน่งทางวิชาการ&nbsp;</font> 
                            </td>
                            <td align="left"  valign="bottom"><font class="insfont"> 
                              <input name="join2affiliation" type="radio" value="lecturer" readonly="true"  onClick="return noClink()" <%if(joinLecturer[1].getAcademicAffiliation().equals("อาจารย์")) out.print("checked");%>>
                              อาจารย์&nbsp;&nbsp;&nbsp; 
                              <input name="join2affiliation" type="radio" value="Asst_Prof" readonly="true" onClick="return noClink()" <%if(joinLecturer[1].getAcademicAffiliation().equals("ผ.ศ.")) out.print("checked");%>>
                              ผ.ศ.&nbsp;&nbsp;&nbsp; 
                              <input name="join2affiliation" type="radio" value="Assoc_Prof" readonly="true" onClick="return noClink()" <%if(joinLecturer[1].getAcademicAffiliation().equals("ร.ศ.")) out.print("checked");%>>
                              ร.ศ.&nbsp; &nbsp; 
                              <input name="join2affiliation" type="radio" value="Prof" readonly="true" onClick="return noClink()" <%if(joinLecturer[1].getAcademicAffiliation().equals("ศ.")) out.print("checked");%>>
                              ศ.</font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <%
									if(!joinLecturer[1].getAcademicAffiliation().equals("อาจารย์")&&!joinLecturer[1].getAcademicAffiliation().equals("ผ.ศ.")&&!joinLecturer[1].getAcademicAffiliation().equals("ร.ศ.")&&!joinLecturer[1].getAcademicAffiliation().equals("ศ.")&&!joinLecturer[1].getAcademicAffiliation().equals(""))
										out.print("<input name=\"join2affiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\" checked>อื่นๆ&nbsp;");
									else
										out.print("<input name=\"join2affiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\">อื่นๆ&nbsp;");
							%>
                              </font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <input name="join2affiliation_affi_other" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;<%if(!joinLecturer[1].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="30"<%if(!joinLecturer[1].getLecturerID().equals("")) out.print("readonly=\"true\"");%>  value="<%if(!joinLecturer[1].getAcademicAffiliation().equals("อาจารย์")&&!joinLecturer[1].getAcademicAffiliation().equals("ผ.ศ.")&&!joinLecturer[1].getAcademicAffiliation().equals("ร.ศ.")&&!joinLecturer[1].getAcademicAffiliation().equals("ศ.")&&!joinLecturer[1].getAcademicAffiliation().equals("")) out.print(joinLecturer[1].getAcademicAffiliation());%>">
                              </font></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="220" valign="bottom"><input type="text" name="join2_name"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;<%if(!joinLecturer[1].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="30"  <%if(!joinLecturer[1].getLecturerID().equals("")) out.print("readonly=\"true\"");%> value="<%=joinLecturer[1].getName_th()%>"></td>
                            <td width="48" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="277" valign="bottom"><input type="text" name="join2_sername"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;<%if(!joinLecturer[1].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="30" <%if(!joinLecturer[1].getLecturerID().equals("")) out.print("readonly=\"true\"");%> value="<%=joinLecturer[1].getSurname_th()%>"></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="join2_faculty"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;<%if(!joinLecturer[1].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="30" <%if(!joinLecturer[1].getLecturerID().equals("")) out.print("readonly=\"true\"");%> value="<%=joinFactName[1]%>"></td>
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td valign="bottom"><input type="text" name="join2_dept"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;<%if(!joinLecturer[1].getLecturerID().equals("")) out.print("BACKGROUND:#DCEBF7;");%>" size="40" <%if(!joinLecturer[1].getLecturerID().equals("")) out.print("readonly=\"true\"");%> value="<%=joinDeptName[1]%>"></td>
                          </tr>
                        </table></td>
                    </tr>
                  </table>
                  <br>
                  <input name="addJoinSupervisor" type="submit" value="เพิ่มอาจารย์" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" <%if(join == 2 ) out.print("disabled");%> onClick="return check()">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <input type="submit" name="addJoinCancel" value="&nbsp;&nbsp;&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;">
                  <br>
				  </center>
				</form>         
             </td>
            <!-- Insert data -->
            <td width="1"  valign="top" background="image/verdotshort.gif"></td>
            <!-- Right -->          
        </table>         
        </table></td>    <!-- Cover Main Page-->
  </tr>
</table>
</center>
<script language="JavaScript">

		function checkThesisID(){
			var v1 = document.addJoinForm.thesisID;
			if( v1.value.length==0 ){
					alert("กรุณาใส่รหัสวิทยานิพนธ์");
					v1.focus();
        	   		return false;
			}
			if( v1.value.length != 0){
				if(isNaN(v1.value)){
					 alert("กรุณาใส่รหัสทุนการศึกษาเป็นตัวเลข ให้ถูกต้อง");
    	      		 v1.focus();
        	  		 return false;
				}
 			}
			return true;
		} //   end  checkThesisID( )
		
		
		function check(){
			var v1 = document.addJoinForm.thesisID;
			var v2 = document.addJoinForm.stdID;
			
			if( v1.value.length==0 ){
					alert("กรุณาใส่รหัสวิทยานิพนธ์");
					v1.focus();
        	   		return false;
			}
			if( v1.value.length != 0){
				if(isNaN(v1.value)){
					 alert("กรุณาใส่รหัสทุนการศึกษาเป็นตัวเลข ให้ถูกต้อง");
    	      		 v1.focus();
        	  		 return false;
				}
 			}
			if( v2.value.length==0 ){
					alert("กรุณาคลิ๊ก ตกลง เพื่อดึงข้อมูลวิทยานิพนธ์");
					document.addJoinForm.getAddJoinSupervisor.focus();
        	   		return false;
			}
			return true;
		
		
		}	// end check
		
</script>


</body>
</html>
