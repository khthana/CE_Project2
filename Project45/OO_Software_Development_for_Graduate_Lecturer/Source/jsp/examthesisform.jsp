<%@ page import="myutil.server,myutil.myDate,java.sql.*,myutil.thaiLanguage,thesis.Thesis,student.Student,lecturer.Lecturer,thesis.examThesis" contentType="text/html; charset=windows-874"%>
<%
		
		if(session.getAttribute("login")==null){
			response.sendRedirect("loginfail.jsp");
		}

		server svr= new server();
		String user =svr.getUsername();
		String passwd = svr.getPassword();
		String url= "jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		Connection con;
		ResultSet rs;
		Statement stmt;
		examThesis exThesis = new examThesis();
		
		
		String stdID ="";
		String date="";
		if(session.getAttribute("stdID")!=null)
			stdID=(String)session.getAttribute("stdID");
		if(session.getAttribute("date")!=null)
			date=(String)session.getAttribute("date");
		session.removeAttribute("stdID");
		session.removeAttribute("date");
		
		try{
		
		
		// get ข้อมูลนักวิทยานิพนธ์
		
		Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
		con = DriverManager.getConnection(url,user,passwd);
		
		String sqlCommand = "SELECT * FROM THESIS T, FACULTY F WHERE T.STD#='"+stdID+"' ";
	
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
		}
		else{				// ไม่มีข้อมูลอยู่
				out.println("<br><font class=\"insfont\" color=\"FF0000\">ไม่พบข้อมูลการสอบวิทยานิพนธ์</font>");
				out.println("<form action=\"viewexamthesis.jsp\" method=\"post\" name=\"form1\" ><br>\n"+
								   "<input type=\"submit\" name=\"ok\" value=\"    "+thaiLanguage.MS874ToUnicode("ตกลง")+"    \" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\">\n"+
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
			stmt.close();
			con.close();
			
		}	// catch
		catch (ClassNotFoundException e){out.println("ClassNotFoundException in examthesisform.jsp : "+e.getMessage());return;}
		catch (SQLException e){out.println("SQLException in examthesisform.jsp : "+e.getMessage());return;}
		catch (Exception e){out.println("Exception in examthesisform.jsp : "+e.getMessage());return;}		


//--------------------------------------------------------------------------------------- end viewExamThesis		
		
%>

<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="stylesheet/reportForm.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">
	<table width="620"  border="0" cellspacing="0" cellpadding="0">
  	<tr style="font:16px">
    	<td align="left" valign="top">
		<table width="620" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td colspan="3" align="center"><font class="header"><b>บัณฑิตวิทยาลัย<br>
            สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง<br>
            ใบรับรองวิทยานิพนธ์<br>
            ---------------------</b></font></td>
        </tr>
        <tr> 
          <td width="140" align="left" valign="bottom"  height="5"></td>
          <td width="80" align="left" valign="bottom"></td>
          <td  width="400" align="left" valign="bottom"></td>
        </tr>
        <tr> 
          <td align="left" valign="top"><font class="header"><b>หัวข้อวิทยานิพนธ์</b></font></td>
          <td colspan="2" align="left" valign="top"><font class="header"> 
            <%out.println(thaiLanguage.MS874ToUnicode(exThesis.getTopic_th()));%>
            <br>
            <%=thaiLanguage.MS874ToUnicode(exThesis.getTopic_en())%></font> </td>
        </tr>
        <tr> 
          <td align="left" valign="bottom"><font class="header"><b>ชื่อนักศึกษา</b></font></td>
          <td colspan="2" align="left" valign="bottom"><font class="header"><%=thaiLanguage.MS874ToUnicode(exThesis.getStdTitle()+exThesis.getStdName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getStdSurname())%></font></td>
        </tr>
        <tr> 
          <td align="left" valign="bottom"><font class="header"><b>รหัสประจำตัว</b></font></td>
          <td colspan="2" align="left" valign="bottom"><font class="header"><%=exThesis.getStdID()%></font></td>
        </tr>
        <tr> 
          <td align="left" valign="top"><font class="header"><b>ปริญญา</b></font></td>
          <td colspan="2" align="left" valign="top"><font class="header"><%=exThesis.getStdCourseName()%></font></td>
        </tr>
        <tr> 
          <td align="left" valign="bottom"><font class="header"><b>สาขาวิชา</b></font></td>
          <td colspan="2" align="left" valign="bottom"><font class="header"><%=exThesis.getStdMajorName()%></font></td>
        </tr>
        <tr> 
          <td colspan="2" align="left" valign="top"><font class="header"><b>อาจารย์ผู้ควบคุมวิทยานิพนธ์</b></font></td>
          <td width="400"  valign="top"><font class="header"><%=exThesis.getSuperAcademicAffiliation()+exThesis.getSuperName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getSuperSurname()%></font></td>
        </tr>
        <%
			if(!exThesis.getJoin1Name().equals("")){
				out.print("<tr>\n"+
						        "<td colspan=\"2\" align=\"left\" valign=\"top\"><font class=\"header\">&nbsp;<b>อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</b></font></td>\n"+
								"<td width=\"380\" align=\"left\" valign=\"top\"><font class=\"header\">"+exThesis.getJoin1AcademicAffiliation()+exThesis.getJoin1Name()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getJoin1Surname());
				if(!exThesis.getJoin2Name().equals("")){								
								out.print("<br>"+exThesis.getJoin2AcademicAffiliation()+exThesis.getJoin2Name()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getJoin2Surname()+
												"</font></td>\n"+
        										"</tr>");
				}
				else{
					out.print("<font></td>\n"+
        						"</tr>");
				}
			}	
		%>
        <tr> 
          <td colspan="3" align="left" valign="bottom"> <table width="550" border="1px" cellspacing="0" cellpadding="0" bordercolor="#000000">
              <tr> 
                <td width="333" align="center" valign="top"><font class="header"><b>คณะกรรมการสอบวิทยานิพนธ์</b></font></td>
                <td width="217" align="center"><font class="header"><b>ลายมือชื่อ</b></font></td>
              </tr>
              <tr> 
                <td valign="top" align="left"><font class="header"> 
                  <%
					if(!exThesis.getExamLName1().equals(""))
						out.print("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLAcademicAffiliation1()+exThesis.getExamLName1()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname1());
					if(!exThesis.getExamLName2().equals(""))
						out.print("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLAcademicAffiliation2()+exThesis.getExamLName2()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname2());
					if(!exThesis.getExamLName3().equals(""))
						out.print("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLAcademicAffiliation3()+exThesis.getExamLName3()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname3());
					if(!exThesis.getExamLName4().equals(""))
						out.print("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLAcademicAffiliation4()+exThesis.getExamLName4()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname4());
					if(!exThesis.getExamLName5().equals(""))
						out.print("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLAcademicAffiliation5()+exThesis.getExamLName5()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname5());
					if(!exThesis.getExamLName6().equals(""))
						out.print("<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLAcademicAffiliation6()+exThesis.getExamLName6()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+exThesis.getExamLSurname6());											
				%>
                  </font></td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td colspan="3" align="left" valign="bottom">&nbsp;</td>
        </tr>
        <tr> 
          <td align="left" valign="bottom"><font class="header"><b>วัน/เดือน/ปี&nbsp;ที่สอบ</b></font></td>
          <td colspan="2" align="left" valign="bottom"><font class="header"><%=thaiLanguage.MS874ToUnicode(myDate.getThaiDate(exThesis.getExamDate()))%> 
            &nbsp;&nbsp;เวลา&nbsp;&nbsp;<%=exThesis.getExamTime()%>&nbsp;น.&nbsp;&nbsp;เป็นต้นไป</font> 
          </td>
        </tr>
        <tr> 
          <td align="left" valign="top"><font class="header"><b>สถานที่สอบ</b></font></td>
          <td colspan="2" align="left" valign="top"><font class="header">ณ&nbsp;&nbsp;<%=exThesis.getExamLocation()%>&nbsp;</font></td>
        </tr>
		<tr> 
          <td colspan="3" align="left" valign="bottom">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2" align="left" valign="bottom">&nbsp;</td>
          <td width="400" align="center"><font class="header"><b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;บัณฑิตวิทยาลัยรับรองแล้ว<br>
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(รศ.ดร.บุญวัฒน์&nbsp;&nbsp;&nbsp;อัตชู) 
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;คณะบดีบัณฑิตวิทยาลัย 
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วันที่..........เดือน...............................พ.ศ................. 
            </b></font></td>
        </tr>
      </table>
      </td>
  	</tr>
	</table>

</body>
</html>
