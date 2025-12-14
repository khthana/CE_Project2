<%@ page  import="myutil.server,java.sql.*,myutil.thaiLanguage,thesis.Thesis,java.io.*,thesis.superviseThesis,lecturer.Lecturer,student.Student,alumni.Alumni" contentType="text/html; charset=windows-874"%>
<%
		
		if(session.getAttribute("login")==null){
			response.sendRedirect("loginfail.jsp");
		}	
				
		server svr= new server();
		String url= "jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();	 
		String user =svr.getUsername();
		String passwd = svr.getPassword();		
		Alumni alumni = new Alumni();
		
		if(session.getAttribute("getStdInfo")!=null){
				alumni.setAlumniID((String)session.getAttribute("getStdInfo"));
				if(session.getAttribute("academicYear")!=null)
						alumni.setAcademicYear((String)session.getAttribute("academicYear"));
				session.removeAttribute("getStdInfo");
				session.removeAttribute("academicYear");
				try{
						Statement stmt;
						ResultSet rs;
						Connection con;
						
						Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
						con = DriverManager.getConnection(url,user,passwd);
						stmt = con.createStatement();
						
						String sql = 	"SELECT S.STD#, S.TPRE, S.TNAME, S.TFAMILY, S.SEX , C.TNAME AS CNAME,  "+
												"M.TNAME AS MNAME, F.TNAME AS FNAME, D.TNAME AS DNAME  "+
												"FROM STUDENT S , COURSE C , MAJOR M , FACULTY F , DEPARTMENT D  "+
												"WHERE STD# ='"+alumni.getAlumniID()+"'  "+
												"AND C.CO# = ( SELECT CO# FROM STUDENT WHERE STD# ='"+alumni.getAlumniID()+"')  "+
												"AND M.MAJOR# = ( SELECT MAJOR# FROM STUDENT WHERE STD# ='"+alumni.getAlumniID()+"')  "+
												"AND F.FACT# = ( SELECT FACT# FROM STUDENT WHERE STD# ='"+alumni.getAlumniID()+"')  "+
												"AND D.DEPT# = ( SELECT DEPT# FROM STUDENT WHERE STD# ='"+alumni.getAlumniID()+"')  ";
						rs = stmt.executeQuery(sql);
						if(rs.next()){
							if(rs.getString("TPRE")!=null)		
								alumni.setTitle(thaiLanguage.MS874ToUnicode(rs.getString("TPRE")));
							if(rs.getString("TNAME")!=null)		
								alumni.setName(thaiLanguage.MS874ToUnicode(rs.getString("TNAME")));
							if(rs.getString("TFAMILY")!=null)		
								alumni.setSurname(thaiLanguage.MS874ToUnicode(rs.getString("TFAMILY")));
							if(rs.getString("SEX")!=null)		
								alumni.setSex(thaiLanguage.MS874ToUnicode(rs.getString("SEX")));
							if(rs.getString("CNAME")!=null)		
								alumni.setCourseName(thaiLanguage.MS874ToUnicode(rs.getString("CNAME")));
							if(rs.getString("MNAME")!=null)		
								alumni.setMajorName(thaiLanguage.MS874ToUnicode(rs.getString("MNAME")));
							if(rs.getString("FNAME")!=null)		
								alumni.setFactName(thaiLanguage.MS874ToUnicode(rs.getString("FNAME")));
							if(rs.getString("DNAME")!=null)		
								alumni.setDeptName(thaiLanguage.MS874ToUnicode(rs.getString("DNAME")));
						}
						rs.close();
						
						sql = "SELECT * FROM  THESIS WHERE STD#= '"+alumni.getAlumniID()+"' ";
						rs=stmt.executeQuery(sql);
						if(rs.next()){
								alumni.setResearchType("วิทยานิพนธ์");
							if(rs.getString("THESIS#")!=null)
								alumni.setThesisID(rs.getInt("THESIS#"));	
							if(rs.getString("TOPIC_TH")!=null)
								alumni.setResearchTopic_th(rs.getString("TOPIC_TH"));
							if(rs.getString("TOPIC_EN")!=null)
								alumni.setResearchTopic_en(rs.getString("TOPIC_EN"));
						}
						rs.close();
						
						sql= " SELECT LECTURER# , ACADEMICAFFILIATION , NAME_TH ,SURNAME_TH FROM LECTURER "+
								 "	WHERE LECTURER# = ( SELECT LECTURER# FROM SUPERVISETHESIS WHERE THESIS# ="+alumni.getThesisID()+" AND SUPERVISESTATUS='หลัก' )";
						rs = stmt.executeQuery(sql);
						if(rs.next()){						
								if(rs.getString("LECTURER#")!=null)
									alumni.setSuperID(rs.getString("LECTURER#"));
								if(rs.getString("ACADEMICAFFILIATION")!=null)
									alumni.setSuperAcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
								if(rs.getString("NAME_TH")!=null)
									alumni.setSuperName(rs.getString("NAME_TH"));
								if(rs.getString("SURNAME_TH")!=null)
									alumni.setSuperSurname(rs.getString("SURNAME_TH"));								
						}
						rs.close();
						
						sql= " SELECT LECTURER# , ACADEMICAFFILIATION , NAME_TH ,SURNAME_TH FROM LECTURER "+
								 "	WHERE LECTURER# IN ( SELECT LECTURER# FROM SUPERVISETHESIS WHERE THESIS# ="+alumni.getThesisID()+" AND SUPERVISESTATUS='ร่วม' ) ";
						rs = stmt.executeQuery(sql);
						for(int i=0;rs.next();i++){
							if( i==0 ){							
								if(rs.getString("LECTURER#")!=null)
									alumni.setJoin1ID(rs.getString("LECTURER#"));
								if(rs.getString("ACADEMICAFFILIATION")!=null)
									alumni.setJoin1AcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
								if(rs.getString("NAME_TH")!=null)
									alumni.setJoin1Name(rs.getString("NAME_TH"));
								if(rs.getString("SURNAME_TH")!=null)
									alumni.setJoin1Surname(rs.getString("SURNAME_TH"));
							}
							if( i==1 ){							
								if(rs.getString("LECTURER#")!=null)
									alumni.setJoin2ID(rs.getString("LECTURER#"));
								if(rs.getString("ACADEMICAFFILIATION")!=null)
									alumni.setJoin2AcademicAffiliation(rs.getString("ACADEMICAFFILIATION"));
								if(rs.getString("NAME_TH")!=null)
									alumni.setJoin2Name(rs.getString("NAME_TH"));
								if(rs.getString("SURNAME_TH")!=null)
									alumni.setJoin2Surname(rs.getString("SURNAME_TH"));
							}						
						}		
						rs.close();				
						stmt.close();
						con.close();
					
					
					
				}  // end  try			
				catch (ClassNotFoundException e){out.println("ClassNotFoundException in addalumni.jsp : "+e.getMessage());return;}
				catch (SQLException e){out.println("SQLException in addalumni.jsp : "+e.getMessage());return;}
				catch (Exception e){out.println("Exception in addalumni.jsp : "+e.getMessage());return;}
				
		} // end if(session.getAttribute("getStdInfo")
		
%>
<html>
<head>
<title>บันทึกประวัติผู้สำเร็จการศึกษา</title>
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
		<td valign="bottom" height="28">
			<table width="780" border="0" cellspacing="0" cellpadding="0">
				<tr>
						<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;สำเร็จการศึกษา&nbsp;>>&nbsp;บันทึกประวัติผู้สำเร็จการศึกษา</font></td>
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
      <td valign="top"> 
        <table width="780" border="0" cellspacing="0" cellpadding="0">
          <tr>             
            <td width="1" align="left" valign="top" background="image/verdotshort.gif"></td>
            <td width="778"  valign="top"> <br>
			  <center>
                <table width="400" height="50" bgcolor="#671691" border="1" bordercolor="#9900FF" >
                  <tr> 
                    <td valign="middle" align="center" class="topic">บันทึกประวัติผู้สำเร็จการศึกษา</td>
                  </tr>
                </table>
				</center>
				
                <form action="servlet/alumniWork" method="post" name="addAlumniForm" >
                <center>
				  <table border="1" cellspacing="0" cellpadding="0" width="650" bordercolor="#9966CC" rules="rows">
                    <tr> 
                      <td align="left" valign="bottom" colspan="4" bgcolor="#9999CC"><font class="header">&nbsp;ปีการศึกษาที่จบ</font> 
                      </td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom" ><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td align="left" valign="bottom" ><input name="academicYear" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="8" maxlength="4" value="<%=alumni.getAcademicYear()%>" ></td>
                      <td align="left" valign="bottom" >&nbsp;</td>
                      <td align="left" valign="bottom" >&nbsp;</td>
                    </tr>
                    <tr> 
                      <td align="left" valign="bottom" colspan="4" bgcolor="#9999CC"><font class="header">&nbsp;ข้อมูลการศึกษาของนักศึกษา</font> 
                      </td>
                    </tr>
                    <tr> 
                      <td width="130" height="26" align="right" valign="bottom"> 
                        <font class="insfont">รหัสประจำตัว&nbsp;</font> </td>
                      <td width="220" valign="bottom"> <input name="stdID" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="8" maxlength="8" value="<%=alumni.getAlumniID()%>" <%/*if(!alumni.getAlumniID().equals("")) out.print(" readonly=\"true\"");*/%>> 
                        &nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" name="getStdInfo" value="&nbsp;&nbsp;&nbsp;&nbsp;Ok&nbsp;&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkStdID()"></td>
                      <td width="80">&nbsp;</td>
                      <td width="220">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"> <font class="insfont">ชื่อ 
                        <select name="stdtitle" onChange="TitleChange()">
                          <option value="นาย" <%if(alumni.getTitle().equals("นาย")) out.print("selected"); %> >นาย</option>
                          <option value="นาง" <%if(alumni.getTitle().equals("นาง")) out.print("selected"); %>>นาง</option>
                          <option value="นางสาว" <%if(alumni.getTitle().equals("นางสาว"))out.print("selected"); %>>นางสาว</option>
						  <%
						  		if(!alumni.getTitle().equals("นาย") && !alumni.getTitle().equals("นาง") && !alumni.getTitle().equals("นางสาว") && !alumni.getTitle().equals(""))
                          			out.print("<option value=\""+alumni.getTitle()+"\" selected>"+alumni.getTitle()+"</option>");
								else
									out.print("<option value=\"อื่นๆ\">อื่นๆ</option>");
						%>
                        </select>
                        &nbsp;</font></td>
                      <td valign="bottom"> <input type="text" name="std_name" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="25" value="<%=alumni.getName()%>"> 
                      </td>
                      <td width="80" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                      <td valign="bottom"> <input  type="text" name="std_surname" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="25" value="<%=alumni.getSurname()%>"> 
                      </td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">เพศ&nbsp;</font></td>
                      <td colspan="2" valign="bottom"> <input name="sex" type="radio" value="ชาย"<%if(alumni.getSex().equals("ชาย")) out.print("checked");%> > 
                        <font class="insfont">ชาย</font> <input name="sex" type="radio" value="หญิง" <%if(alumni.getSex().equals("หญิง")) out.print("checked");%>> 
                        <font class="insfont">หญิง</font> </td>
                      <td valign="bottom">&nbsp;</td>
                    </tr>					
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">หลักสูตร&nbsp;</font> 
                      </td>
                      <td colspan="3" valign="bottom"><input type="text" name="course" size="60"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getCourseName()%>"> 
                      </td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">สาขา&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><input type="text" name="major" size="60"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getMajorName()%>"></td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">คณะ&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><input type="text" name="faculty" size="60" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getFactName()%>"></td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">ภาควิชา&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><input name="department" type="text" size="60"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getDeptName()%>"></td>
                    </tr>
                    <tr> 
                      <td colspan="4" valign="top"> <table width="560" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="130" align="right"><font class="insfont">งานวิจัย&nbsp;</font></td>
                            <td width="130"><font class="insfont"><input name="research" type="radio" value="วิทยานิพนธ์" <%if(alumni.getResearchType().equals("วิทยานิพนธ์")) out.print("checked");%>>วิทยานิพนธ์</font></td>
                            <td width="300"><font class="insfont"><input name="research" type="radio" value="โครงการพัฒนาระบบงาน" <%if(!alumni.getResearchType().equals("วิทยานิพนธ์") && !alumni.getResearchType().equals("")) out.print("checked");%>>โครงการพัฒนาระบบงาน&nbsp;(น.ศ.แผน&nbsp;ข.) </font></td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                            <td colspan="2"><font class="insfont"> 
                              <input name="research" type="radio" value="โครงการศึกษากรณีพิเศษ">โครงการศึกษากรณีพิเศษ&nbsp;(น.ศ.แผน&nbsp;ข.) </font> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td align="right"><font class="insfont">ชื่องานวิจัย&nbsp;(ไทย)&nbsp;</font></td>
                      <td colspan="3" valign="bottom" align="left"><input name="research_name_th" type="text" size="79"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getResearchTopic_th()%>"></td>
                    </tr>
                    <tr align="right"> 
                      <td><font class="insfont">ชื่องานวิจัย&nbsp;(อังกฤษ)&nbsp;</font></td>
                      <td colspan="3" align="left" valign="bottom"><input name="research_name_en" type="text" size="79"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getResearchTopic_en()%>"></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="4" valign="top" align="left"> <table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td colspan="6"><font  class="miniheader">&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์/อาจารย์ที่ปรึกษาโครงการ</font></td>
                          </tr>
                          <tr> 
                            <td width="130" align="right" valign="bottom"> <font class="insfont">ตำแหน่งทางวิขาการ&nbsp;</font> 
                            </td>
                            <td width="117" align="left" valign="bottom"><input name="superAcademicAffiliation" type="text" size="15"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getSuperAcademicAffiliation()%>"></td>
                            <td width="31" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="154" valign="bottom"><input name="super_name" type="text" size="20"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getSuperName()%>"></td>
                            <td width="50" valign="bottom" align="right"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="168"><input type="text" name="super_surname" size="20"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getSuperSurname()%>"></td>
                          </tr>
                          <tr> 
                            <td colspan="6"><font class="miniheader">&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม</font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ตำแหน่งทางวิขาการ&nbsp;</font> 
                            </td>
                            <td align="left" valign="bottom"><input name="join1AcademicAffiliation" type="text" size="15"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getJoin1AcademicAffiliation()%>"></td>
                            <td align="right" valign="bottom"><font class="insfont">1.ชื่อ&nbsp;</font></td>
                            <td  valign="bottom"><input name="join_super_name1" type="text" size="20"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getJoin1Name()%>"></td>
                            <td align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td ><input type="text" name="join_super_surname1" size="20"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getJoin1Surname()%>"></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ตำแหน่งทางวิขาการ&nbsp;&nbsp;</font> 
                            </td>
                            <td align="left" valign="bottom"><input name="join2AcademicAffiliation" type="text" size="15"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getJoin2AcademicAffiliation()%>"></td>
                            <td align="right" valign="bottom"><font class="insfont">2.ชื่อ&nbsp;</font></td>
                            <td  valign="bottom"><input name="join_super_name2" type="text" size="20"style="BORDER:#2B2C6F thin solid;COLOR:#000000;" value="<%=alumni.getJoin2Name()%>"></td>
                            <td  align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="join_super_surname2" size="20"style="BORDER:#2B2C6F thin solid;COLOR:#000000;"  value="<%=alumni.getJoin2Surname()%>"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr align="right"> 
                      <td colspan="4" bgcolor="#9999CC" valign="bottom" align="left"><font class="header">&nbsp;ประวัตินักศึกษา</font></td>
                    </tr>
                    <tr>
                    <td align="right" valign="bottom"><font class="insfont">วัน&nbsp;เดือน&nbsp;ปีเกิด&nbsp;</font></td>
                      <td colspan="3" align="left"><font class="insfont"> วันที่&nbsp; 
                        <select name="birthday">
                        <option value="01" selected>1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                        <option value="13">13</option>
                        <option value="14">14</option>
                        <option value="15">15</option>
                        <option value="16">16</option>
                        <option value="17">17</option>
                        <option value="18">18</option>
                        <option value="19">19</option>
                        <option value="20">20</option>
                        <option value="21">21</option>
                        <option value="22">22</option>
                        <option value="23">23</option>
                        <option value="24">24</option>
                        <option value="25">25</option>
                        <option value="26">26</option>
                        <option value="27">27</option>
                        <option value="28">28</option>
                        <option value="29">29</option>
                        <option value="30">30</option>
                        <option value="31">31</option>
                      </select>
                      &nbsp;&nbsp;เดือน&nbsp; 
                      <select name="birthmonth">
                        <option value="01" selected>มกราคม</option>
                        <option value="02">กุมภาพันธ์</option>
                        <option value="03">มีนาคม</option>
                        <option value="04">เมษายน</option>
                        <option value="05">พฤษภาคม</option>
                        <option value="06">มิถุนายน</option>
                        <option value="07">กรกฎาคม</option>
                        <option value="08">สิงหาคม</option>
                        <option value="09">กันยายน</option>
                        <option value="10">ตุลาคม</option>
                        <option value="11">พฤษจิกายน</option>
                        <option value="12">ธันวาคม</option>
                      </select>
                      &nbsp;&nbsp;พ.ศ.&nbsp; 
                      <input name="birthyear" type="text" size="5" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" maxlength="4">
                      </font></td>
					  </tr>
                    <tr> 
                      <td colspan="4" align="left" valign="top"> <table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">วุฒิการศึกษาปริญญาตรี&nbsp;</font></td>
                            <td colspan="2"> <input type="text" name="oldB_degree" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="50"></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td  width="130" align="right" valign="bottom"><font class="insfont">สถานศึกษา&nbsp;</font></td>
                            <td width="320"><input type="text" name="oldB_institute" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="50"></td>
                            <td width="70" valign="bottom" align="right"><font class="insfont">ปีที่สำเร็จ&nbsp;</font></td>
                            <td width="130"><input type="text" name="oldB_year" size="5" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" maxlength="4"></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">วุฒิการศึกษาปริญญาโท&nbsp;</font></td>
                            <td colspan="2"> <input type="text" name="oldM_degree" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="50"></td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">สถานศึกษา&nbsp;</font></td>
                            <td align="left" valign="bottom" ><input type="text" name="oldM_institute" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="50"></td>
                            <td  valign="bottom" align="right"><font class="insfont">ปีที่สำเร็จ&nbsp;</font></td>
                            <td  align="left" valign="bottom" ><input type="text" name="oldM_year" size="5" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" maxlength="4"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="left" valign="bottom"> <table width="636" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="636" align="left" valign="bottom"><font class="insfont">&nbsp;&nbsp; 
                              &nbsp; ผลงานทางวิชาการที่ได้รับการตีพิมพ์ 
                              <input name="paper" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="70">
                              </font></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">รางวัลหรือทุนที่เคยได้รับ&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><input name="award" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="79"></td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">ประสบการณ์การทำงาน&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><input name="experience" type="text" size="79" style="BORDER:#2B2C6F thin solid;COLOR:#000000;"></td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">อาชีพปัจจุบัน&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><input type="text" name="work" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="79"></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="left" valign="top"> <table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="130" align="right" valign="top"><font class="insfont">สถานที่ทำงาน&nbsp;</font> 
                            </td>
                            <td width="520" valign="top"><textarea name="office_address" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" cols="50" rows="3"></textarea></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">&nbsp;&nbsp;</font><font class="insfont">โทรศัพท์&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="office_telophone" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="25"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="left" valign="top"><table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="130" align="right" valign="top"><font class="insfont">ที่อยู่ปัจจุบัน&nbsp;</font> 
                            </td>
                            <td width="520" valign="top"><textarea name="address" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" cols="50" rows="3"></textarea></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">โทรศัพท์&nbsp;</font></td>
                            <td align="left" valign="bottom"><input type="text" name="telephone" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="25"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">e-mail&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><input type="text" name="email" size="52" style="BORDER:#2B2C6F thin solid;COLOR:#000000;"></td>
                    </tr>
                  </table>
				 <br>
                  <input name="addAlumni" type="submit" value="&nbsp;&nbsp;บันทึก&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checks()">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <input type="submit" name="cancelAddAlumni" value="&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;">
                  <br>
                </center>
				</form>
                <br>              			  
				</td>			    
            <!-- Insert data -->            
            <!-- Right -->              
             <td width="1" background="image/verdotshort.gif" valign="top" ></td>    			
        </table>         
        </table></td>    <!-- Cover Main Page-->
  </tr>
</table>
</center>
<script language="JavaScript">
		function checks(){ 
			var v1 = document.addAlumniForm.stdID.value;
			var v2 = document.addAlumniForm.academicYear.value;
			var f=document.addAlumniForm;
		    if(v2.length!=4){
				alert("กรุณาใส่ปีการศึกษาเป้นตัวเลข 4 หลัก ");
    	       document.addAlumniForm.academicYear.focus();
        	   return false;
			}
			if( v2.length != 0){
				if(isNaN(v2)){
					  alert("กรุณาใส่ปีการศึกษาเป้นตัวเลข 4 หลัก ");
    	      		 document.addAlumniForm.academicYear.focus();
        	  		 return false;
				}
 			}
			if (v1.length!=8){
	           		alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8 หลัก ");
    	       		document.addAlumniForm.stdID.focus();
        	   		return false;
        	}
			if( v1.length != 0){
				if(isNaN(v1)){
					  	alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8 หลัก ");
    	      		 	document.addAlumniForm.stdID.focus();
        	  		 	return false;
				}
 			}
			if( f.sex[0].checked==false && f.sex[1].checked == false){
					alert("กรุณาเลือกเพศ");
    	       		 f.sex[0].focus();
        	   		return false;
			}
		 	if( f.research[0].checked==false && f.research[1].checked == false && f.research[2].checked == false){
					alert("กรุณาเลือกงานวิจัย");
    	       		 f.research[0].focus();
        	   		return false;
			}
			 if(f.birthyear.value.length > 0 &&f.birthyear.value.length < 4){
					  	alert("กรุณาใส่ปีการศึกษาเป็นจัวเลข 4 หลัก");
    	      		 	document.addAlumniForm.birthyear.focus();
        	  		 	return false;				
 			}			
		    if(f.birthyear.value.length != 0){
				if(isNaN(f.birthyear.value)){
					  	alert("กรุณาใส่ปีการศึกษาเป็นจัวเลข 4 หลัก");
    	      		 	document.addAlumniForm.birthyear.focus();
        	  		 	return false;
				}
 			}
			if(f.oldB_year.value.length >0 && f.oldB_year.value.length <4){
					  	alert("กรุณาใส่ปีเป็นจัวเลข 4 หลัก");
    	      		 	document.addAlumniForm.oldB_year.focus();
        	  		 	return false;
 			}
			if(f.oldB_year.value.length != 0){
				if(isNaN(f.oldB_year.value)){
					  	alert("กรุณาใส่ปีเป็นจัวเลข 4 หลัก");
    	      		 	document.addAlumniForm.oldB_year.focus();
        	  		 	return false;
				}
 			}
			 if(f.oldM_year.value.length > 0 && f.oldM_year.value.length < 4){
					  	alert("กรุณาใส่ปีเป็นจัวเลข 4 หลัก");
    	      		 	document.addAlumniForm.oldM_year.focus();
        	  		 	return false;
 			}
			 if(f.oldM_year.value.length != 0){
				if(isNaN(f.oldM_year.value)){
					  	alert("กรุณาใส่ปีเป็นจัวเลข 4 หลัก");
    	      		 	document.addAlumniForm.oldM_year.focus();
        	  		 	return false;
				}
 			}
		    return true;
		}	// end function checksID
		
		function checkStdID(){
			var v1 = document.addAlumniForm.stdID.value;
			if (v1.length!=8){
				alert("กรุณาใส่รห ัสนักศึกษา 8 หลัก ");
				document.addAlumniForm.stdID.focus();
    	    	return false;
        	}
			if( v1.length != 0){
				if(isNaN(v1)){
					  	alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8 หลัก ");
    	      		 	document.addAlumniForm.stdID.focus();
        	  		 	return false;
				}
 			}
		 	else	
	       		return true;
				
		} // end checkStdID
		
		
		function TitleChange(){
			var f=document.addAlumniForm;	
			var title=document.addAlumniForm.stdtitle;
			switch(title.selectedIndex){
					case 0	: {f.sex[0].checked=true;break;}
					case 1	: {f.sex[1].checked=true; break;}
					case 2	: {f.sex[1].checked=true;break;}
					case 3	: {var tmp=prompt("กรอกคำนำหน้าชื่อ ","");title.options[3].text=(tmp==null)?"อื่นๆ":tmp;f.sex[0].checked=true;}
			}
		}	// end function TitleChange
		
</script>
</body>
</html>
