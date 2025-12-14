<%@ page import="myutil.server,java.sql.*,myutil.thaiLanguage,thesis.Thesis"  contentType="text/html; charset=windows-874"%>

<%!		
		private String url ="";
		private String user = "";
		private String passwd = "";
		// student
		private String stdID="";
		private String stdtitle="";
		private String stdname="";
		private String stdsurname="";
		private String stdfactname="";
		private String stdfactID="";
		private String stdcoursename="";
		private int stdcourseID=0;
		private String stdmajorname="";
		private String stdmajorID="";
		private String stddeptname="";
		private String stddeptID="";		
		// super
		private String superID="";
		private String suptitle="";
		private String supname="";
		private String supsurname="";
		private String supaffiliation="";
		private String supfactname="";
		private String supfactID="";
		private String supdeptname="";
		private String supdeptID="";
		// join1
		private String join1ID="";
		private String join1title="";
		private String join1name="";
		private String join1surname="";
		private String join1affiliation="";
		private String join1factname="";
		private String join1factID="";
		private String join1deptname="";
		private String join1deptID="";
		// join2
		private String join2ID="";
		private String join2title="";
		private String join2name="";
		private String join2surname="";
		private String join2affiliation="";
		private String join2factname="";
		private String join2factID="";
		private String join2deptname="";
		private String join2deptID="";
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
		public void getStudent(String stdID)throws Exception{		// get ข้อมูลนีกศึกษา			
				Statement stmt;
				ResultSet rs;
				Connection con;
				String sql = "SELECT S.STD# ,S.TPRE AS TITLE_TH , S.TNAME AS NAME_TH, S.TFAMILY AS SURNAME_TH, "+
									 "F.FACT# AS FACTID, F.TNAME AS FNAME ,D.DEPT# AS DEPTID, D.TNAME AS DNAME ,"+
									 "M.MAJOR# AS MAJORID ,M.TNAME AS MNAME ,C.CO# AS COURSEID ,C.TNAME AS CNAME "+
									 "FROM STUDENT S, FACULTY F ,DEPARTMENT D ,MAJOR M ,COURSE C "+
									 "WHERE STD# ='"+stdID+"' "+
									 "AND F.FACT#=(SELECT FACT# FROM STUDENT WHERE STD# ='"+stdID+"') "+
									 "AND D.DEPT#=(SELECT DEPT# FROM STUDENT WHERE STD# ='"+stdID+"') "+
									 "AND M.MAJOR#=(SELECT MAJOR# FROM STUDENT WHERE STD# ='"+stdID+"') "+
									 "AND C.CO#=(SELECT CO# FROM STUDENT WHERE STD# ='"+stdID+"') ";
				
				Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
				con = DriverManager.getConnection(url,user,passwd);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
						stdID= rs.getString("STD#");
						stdtitle=rs.getString("TITLE_TH");
						stdname=rs.getString("NAME_TH");
						stdsurname=rs.getString("SURNAME_TH");
						stdfactname=rs.getString("FNAME");
						stdfactID=rs.getString("FACTID");
						stddeptname=rs.getString("DNAME");
						stddeptID=rs.getString("DEPTID");
						stdmajorname=rs.getString("MNAME");
						stdmajorID=rs.getString("MAJORID");
						stdcoursename=rs.getString("CNAME");
						stdcourseID=rs.getInt("COURSEID");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getStudent
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		public void getSuper(String superID)throws Exception{		// get ข้อมูลอาจารย์ควบคุมวิทยานิพนธ์หลัก
			Statement stmt;
				ResultSet rs;
				Connection con;
				String sql = "SELECT L.LECTURER# ,L.TITLE_TH , L.NAME_TH, L.SURNAME_TH ,L.ACADEMICAFFILIATION, "+
									 " F.FACT# AS FACTID, F.TNAME AS FNAME ,D.DEPT# AS DEPTID, D.TNAME AS DNAME "+
									 " FROM LECTURER L, FACULTY F ,DEPARTMENT D WHERE LECTURER# ='"+superID+"' "+
									 "AND F.FACT#=(SELECT FACT# FROM LECTURER WHERE LECTURER# ='"+superID+"') "+
									 "AND D.DEPT#=(SELECT DEPT# FROM LECTURER WHERE LECTURER# ='"+superID+"') ";
				
				Class.forName("COM.ibm.db2.jdbc.net.DB2Driver").newInstance();
				con = DriverManager.getConnection(url,user,passwd);
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				if(rs.next()){
						superID= rs.getString("LECTURER#");
						suptitle=rs.getString("TITLE_TH");
						supname=rs.getString("NAME_TH");
						supsurname=rs.getString("SURNAME_TH");
						supaffiliation=rs.getString("ACADEMICAFFILIATION");
						supfactname=rs.getString("FNAME");
						supfactID=rs.getString("FACTID");
						supdeptname=rs.getString("DNAME");
						supdeptID=rs.getString("DEPTID");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getSuper
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
						join1ID= rs.getString("LECTURER#");
						join1title=rs.getString("TITLE_TH");
						join1name=rs.getString("NAME_TH");
						join1surname=rs.getString("SURNAME_TH");
						join1affiliation=rs.getString("ACADEMICAFFILIATION");
						join1factname=rs.getString("FNAME");
						join1factID=rs.getString("FACTID");
						join1deptname=rs.getString("DNAME");
						join1deptID=rs.getString("DEPTID");
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
						join2ID= rs.getString("LECTURER#");
						join2title=rs.getString("TITLE_TH");
						join2name=rs.getString("NAME_TH");
						join2surname=rs.getString("SURNAME_TH");
						join2affiliation=rs.getString("ACADEMICAFFILIATION");
						join2factname=rs.getString("FNAME");
						join2factID=rs.getString("FACTID");
						join2deptname=rs.getString("DNAME");
						join2deptID=rs.getString("DEPTID");
				}
				rs.close();
				stmt.close();
				con.close();
		}		// end getJoin2		
%>

<%	
	
		if(session.getAttribute("login")==null){
			response.sendRedirect("loginfail.jsp");
		}
	
		if( (session.getAttribute("getStudent")==null)&&(session.getAttribute("getSuper")==null )&&(session.getAttribute("getJoin2")==null )&&(session.getAttribute("getJoin1")==null)&&(session.getAttribute("notfound")==null) ){
				// student
				stdID="";  stdtitle="";	stdname=""; stdsurname=""; 	stdfactname="";   stdfactID="";	stdcoursename="";  
				stdcourseID=0;  stdmajorname="";  stdmajorID="";  stddeptname="";  stddeptID="";		
				// super  
				superID="";  suptitle="";	supname="";  supsurname="";  supaffiliation="";	supfactname="";
				supfactID="";	supdeptname="";  supdeptID="";
				// join1
				join1ID="";   join1title="";   join1name="";   join1surname="";   join1affiliation="";  join1factname="";
		  		join1factID="";	  join1deptname="";  join1deptID="";  
			  	// join2
				join2ID="";   join2title="";  join2name="";   join2surname="";    join2affiliation="";  join2factname="";
				join2factID="";    join2deptname="";  join2deptID="";
				session.removeAttribute("thesisData");
		}
		Thesis thesis=null;
		server svr= new server();
		url= "jdbc:db2://"+svr.getDBServerIP()+":"+svr.getDBServerPort()+"/"+svr.getDBName();
		user =svr.getUsername();
		passwd = svr.getPassword();

		if(session.getAttribute("thesisData")!=null){
					thesis=(Thesis)session.getAttribute("thesisData");
		}
//-----------------------------				
		if(session.getAttribute("getStudent")!=null){	// get ข้อมูลนักศึกษา
			try{
						session.removeAttribute("getStudent");
						stdID = "";
						if(session.getAttribute("stdID")!=null){
							stdID = (String)session.getAttribute("stdID");
							session.removeAttribute("stdID");
							getStudent(stdID);
						}
				}
				catch(SQLException e){out.println(" SQLException in add thesis getStudent : "+e.getMessage());}
				catch(Exception e){out.println(" Exception in add thesis getStudent : "+e.getMessage());}
		
		}		//	end getStudent
//-----------------------------	
		else if(session.getAttribute("getSuper")!=null){		// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก
				try{
						session.removeAttribute("getSuper");
						superID = "";
						if(session.getAttribute("superID")!=null){
							superID = (String)session.getAttribute("superID");
							session.removeAttribute("superID");
							getSuper(superID);
						}
				}
				catch(SQLException e){out.println(" SQLException in add thesis getSuper: "+e.getMessage());}
				catch(Exception e){out.println(" Exception in add thesis getSuper: "+e.getMessage());}
		}		// end getSuper
//------------------------------		
		else if(session.getAttribute("getJoin1")!=null){		// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม 1
				try{
						session.removeAttribute("getJoin1");
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
		else if(session.getAttribute("getJoin2")!=null){		// get ข้อมูลอาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม 2
		
				try{
						session.removeAttribute("getJoin2");
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
<title>เพิ่มหัวข้อวิทยานิพนธ์ </title>
<script language=javascript1.2 SRC="javascript/inslecturer.js">
</script>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="stylesheet/insert.css" rel="stylesheet" type="text/css">
</head>

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
		<td valign="bottom" height="28">
				<table width="780" border="0" cellspacing="0" cellpadding="0">
				<tr>
						<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;เพิ่มหัวข้อวิทยานิพนธ์</font></td>
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
            
            <!--- ver line ---><td width="1" rowspan="6" align="left" valign="top" background="image/verdotshort.gif">            
            <td width="778" rowspan="6" valign="top"> 
              <!-- Insert data -->
              <br> <center>
                <table width="400" height="50" bgcolor="#671691" border="1" bordercolor="#9900FF" >
                  <tr> 
                    <td valign="middle" align="center" class="topic">เพิ่มหัวข้อวิทยานิพนธ์
					</td>
                  </tr>
                </table>
				</center>
				<br>
				<form action="servlet/thesisWork" method="post" name="addThesisForm">
					<center>
                  <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows">
                    <tr> 
                      <td colspan="2" height="31" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;ข้อมูลวิทยานิพนธ์</font> 
                      </td>
                    </tr>
					 <tr> 
                      <td width="103" align="right"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td width="547"><input type="text" name="academicyear"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="5" maxlength="4" <%if(thesis!=null) out.print("value=\""+thesis.getAcademicYear()+"\"");%>></td>
                    </tr>
                    <tr> 
                      <td width="103" align="right"><font class="insfont">ชื่อเรื่องภาษาไทย&nbsp;</font></td>
                      <td width="547"><input type="text" name="topic_th"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" <%if(thesis!=null) out.print(thaiLanguage.MS874ToUnicode("value=\""+thesis.getTopic_th()+"\""));%>></td>
                    </tr>
                    <tr> 
                      <td align="right"><font class="insfont">ชื่อเรื่องภาษาอังกฤษ&nbsp;</font></td>
                      <td ><input type="text" name="topic_en"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" <%if(thesis!=null) out.print(thaiLanguage.MS874ToUnicode("value=\""+thesis.getTopic_en()+"\""));%>></td>
                    </tr>
                    <tr> 
                      <td align="right"><font class="insfont">คณะ&nbsp;</font></td>
                      <td><select name="faculty">
                          <option value="01" <%if(thesis!=null && thesis.getFactID().equals("01")) out.print("selected");%>>วิศวกรรมศาสตร์&nbsp;</option>
                          <option value="02" <%if(thesis!=null && thesis.getFactID().equals("02")) out.print("selected");%>>สถาปัตยกรรมศาสตร์&nbsp;</option>
                          <option value="03" <%if(thesis!=null && thesis.getFactID().equals("03")) out.print("selected");%>>ครุศาสตร์อุตสาหกรรม&nbsp;</option>
                          <option value="04" <%if(thesis!=null && thesis.getFactID().equals("04")) out.print("selected");%>>วิทยาศาสตร์&nbsp;</option>
                          <option value="05" <%if(thesis!=null && thesis.getFactID().equals("05")) out.print("selected");%>>เทคโนโลยีการเกษตร&nbsp;</option>
                          <option value="06" <%if(thesis!=null && thesis.getFactID().equals("06")) out.print("selected");%>>โครงการคณะอุตสาหกรรมเกษตร</option>
                          <option value="07" <%if(thesis!=null && thesis.getFactID().equals("07")) out.print("selected");%>>เทคโนโลยีสารสนเทศ&nbsp;</option>
                        </select></td>
                    </tr>
                    <tr> 
                      <td align="right"><font class="insfont">อนุมัติเมื่อวันที่&nbsp;</font></td>
                      <td><select name="approvedate">
                          <option value="01" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("01")) out.print("selected");%>>1</option>
                          <option value="02" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("02")) out.print("selected");%>>2</option>
                          <option value="03" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("03")) out.print("selected");%>>3</option>
                          <option value="04" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("04")) out.print("selected");%>>4</option>
                          <option value="05" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("05")) out.print("selected");%>>5</option>
                          <option value="06" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("06")) out.print("selected");%>>6</option>
                          <option value="07" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("07")) out.print("selected");%>>7</option>
                          <option value="08" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("08")) out.print("selected");%>>8</option>
                          <option value="09" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("09")) out.print("selected");%>>9</option>
                          <option value="10" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("10")) out.print("selected");%>>10</option>
                          <option value="11" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("11")) out.print("selected");%>>11</option>
                          <option value="12" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("12")) out.print("selected");%>>12</option>
                          <option value="13" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("13")) out.print("selected");%>>13</option>
                          <option value="14" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("14")) out.print("selected");%>>14</option>
                          <option value="15" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("15")) out.print("selected");%>>15</option>
                          <option value="16" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("16")) out.print("selected");%>>16</option>
                          <option value="17" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("17")) out.print("selected");%>>17</option>
                          <option value="18" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("18")) out.print("selected");%>>18</option>
                          <option value="19" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("19")) out.print("selected");%>>19</option>
                          <option value="20" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("20")) out.print("selected");%>>20</option>
                          <option value="21" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("21")) out.print("selected");%>>21</option>
                          <option value="22" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("22")) out.print("selected");%>>22</option>
                          <option value="23" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("23")) out.print("selected");%>>23</option>
                          <option value="24" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("24")) out.print("selected");%>>24</option>
                          <option value="25" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("25")) out.print("selected");%>>25</option>
                          <option value="26" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("26")) out.print("selected");%>>26</option>
                          <option value="27" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("27")) out.print("selected");%>>27</option>
                          <option value="28" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("28")) out.print("selected");%>>28</option>
                          <option value="29" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("29")) out.print("selected");%>>29</option>
                          <option value="30" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("30")) out.print("selected");%>>30</option>
                          <option value="31" <%if(thesis !=null  && thesis.getApproveDate().substring(0,2).equals("31")) out.print("selected");%>>31</option>
                        </select> <font class="insfont">&nbsp;&nbsp;เดือน </font> 
                        <select name="approvemonth">
                          <option value="01" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("01")) out.print("selected");%>>มกราคม</option>
                          <option value="02" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("02")) out.print("selected");%>>กุมภาพันธ์</option>
                          <option value="03" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("03")) out.print("selected");%>>มีนาคม</option>
                          <option value="04" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("04")) out.print("selected");%>>เมษายน</option>
                          <option value="05" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("05")) out.print("selected");%>>พฤษภาคม</option>
                          <option value="06" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("06")) out.print("selected");%>>มิถุนายน</option>
                          <option value="07" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("07")) out.print("selected");%>>กรกฎาคม</option>
                          <option value="08" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("08")) out.print("selected");%>>สิงหาคม</option>
                          <option value="09" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("09")) out.print("selected");%>>กันยายน</option>
                          <option value="10" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("10")) out.print("selected");%>>ตุลาคม</option>
                          <option value="11" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("11")) out.print("selected");%>>พฤษจิกายน</option>
                          <option value="12" <%if(thesis !=null  && thesis.getApproveDate().substring(3,5).equals("12")) out.print("selected");%>>ธันวาคม</option>
                        </select> <font class="insfont">&nbsp;&nbsp;พ.ศ.&nbsp; 
                        </font> <input name="approveyear" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="5" maxlength="4" value="<%if(thesis !=null  && !thesis.getApproveDate().substring(6).equals("0000")) out.print(thesis.getApproveDate().substring(6));%>"></td>
                    </tr>
					<tr> 
                      <td colspan="2" height="31" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;ข้อมูลนักศึกษาที่ทำวิยานิพนธ์</font></td>
                    </tr>
					<tr> 
                      <td colspan="2" align="left"> <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows" frame="void">
                          <tr> 
                            <td width="103" align="right"><font class="insfont">รหัสนักศึกษา&nbsp;</font> 
                            </td>
                            <td width="180" align="left" valign="bottom"><input type="text" name="stdID" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="8" maxlength="8"  value="<%=stdID%>" <%if(!stdID.equals("")) out.print("readonly=\"true\"");%> ></td>
                            <td width="57">&nbsp;</td>
                            <td width="296"><input type="submit" name="getStudent" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkStdID()"></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font> 
                            </td>
                            <td><input type="text" name="stdname" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="28" readonly="true" value="<%=stdname%>" ></td>
                            <td align="right"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td><input type="text" name="stdsurname" style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="28"  readonly="true" value="<%=stdsurname%>" ></td>
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
                      <td colspan="2"height="31" bgcolor="#9999CC"  valign="bottom"><font class="header">&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์</font>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td colspan="2" align="left"> <table width="645" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td colspan="2" align="left"><font class="miniheader">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์หลัก</font></td>
                            <td width="54" align="right">&nbsp;</td>
                            <td width="272">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">รหัสอาจารย์&nbsp;</font> 
                            </td>
                            <td align="left" valign="bottom"><input type="text" name="superID" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="8" maxlength="8" value="<%=superID%>" <%if(!superID.equals("")) out.print("readonly=\"true\"");%>></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom"><input type="submit" name="getSuper" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkLecturerID(document.addThesisForm.superID)"></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ตำแหน่งทางวิชาการ&nbsp;</font> 
                             </td>
                            <td align="left" valign="bottom"><font class="insfont">
                              <input name="supaffiliation" type="radio" value="lecturer"  readonly="true" onClick="return noClink()" <%if(supaffiliation.equals("อาจารย์")) out.print("checked");%> >อาจารย์&nbsp;&nbsp;&nbsp;
                              <input name="supaffiliation" type="radio" value="Asst_Prof" readonly="true" onClick="return noClink()" <%if(supaffiliation.equals("ผ.ศ.")) out.print("checked");%>>ผ.ศ.&nbsp;&nbsp;&nbsp;
                              <input name="supaffiliation" type="radio" value="Assoc_Prof" readonly="true" onClick="return noClink()" <%if(supaffiliation.equals("ร.ศ.")) out.print("checked");%>>ร.ศ.&nbsp;&nbsp;&nbsp;
                              <input name="supaffiliation" type="radio" value="Prof" readonly="true" onClick="return noClink()" <%if(supaffiliation.equals("ศ.")) out.print("checked");%>>ศ.</font></td>
                            <td align="left" valign="bottom"><font class="insfont">
							<%
									if(!supaffiliation.equals("อาจารย์")&&!supaffiliation.equals("ผ.ศ.")&&!supaffiliation.equals("ร.ศ.")&&!supaffiliation.equals("ศ.")&&!supaffiliation.equals(""))
										out.print("<input name=\"supaffiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\" checked>อื่นๆ&nbsp;");
									else
										out.print("<input name=\"supaffiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\">อื่นๆ&nbsp;");
							%>
							</font></td>
                            <td align="left" valign="bottom"><font class="insfont">
                              <input name="supaffiliation_affi_other" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true"  value="<%if(!supaffiliation.equals("อาจารย์")&&!supaffiliation.equals("ผ.ศ.")&&!supaffiliation.equals("ร.ศ.")&&!supaffiliation.equals("ศ.")&&!supaffiliation.equals("")) out.print(supaffiliation);%>">
                              </font></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="214"><input type="text" name="supervise_name"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=supname%>" ></td>
                            <td align="right"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td><input type="text" name="supervise_sername"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30"  readonly="true" value="<%=supsurname%>" ></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right"><font class="insfont">คณะ&nbsp;</font></td>
                            <td><input type="text" name="supervise_faculty"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=supfactname%>" ></td>
                            <td align="right"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td><input type="text" name="supervise_dept"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="40" readonly="true" value="<%=supdeptname%>" 
							></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4"> <table width="645" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td colspan="4" align="left"><font class="miniheader">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม&nbsp;1</font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">รหัสอาจารย์&nbsp;</font> 
                            </td>
                            <td align="left" valign="bottom"><input type="text" name="join1ID" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="8" maxlength="8" value="<%=join1ID%>" <%if(!join1ID.equals("")) out.print("readonly=\"true\"");%> ></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom"><input type="submit" name="getJoin1" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkLecturerID(document.addThesisForm.join1ID)"></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ตำแหน่งทางวิชาการ&nbsp;</font></td>
                            <td align="left" valign="bottom"><font class="insfont">
                              <input name="join1affiliation" type="radio" value="lecturer" readonly="true"  onClick="return noClink()" <%if(join1affiliation.equals("อาจารย์")) out.print("checked");%>>อาจารย์&nbsp;&nbsp;&nbsp;
                              <input name="join1affiliation" type="radio" value="Asst_Prof" readonly="true" onClick="return noClink()" <%if(join1affiliation.equals("ผ.ศ.")) out.print("checked");%>>ผ.ศ.&nbsp;&nbsp;&nbsp;
                              <input name="join1affiliation" type="radio" value="Assoc_Prof" readonly="true" onClick="return noClink()" <%if(join1affiliation.equals("ร.ศ.")) out.print("checked");%>>ร.ศ.&nbsp;&nbsp;&nbsp;
                              <input name="join1affiliation" type="radio" value="Prof" readonly="true" onClick="return noClink()" <%if(join1affiliation.equals("ศ.")) out.print("checked");%>>ศ.</font></td>
                            <td align="left" valign="bottom"><font class="insfont">
                             <%
									if(!join1affiliation.equals("อาจารย์")&&!join1affiliation.equals("ผ.ศ.")&&!join1affiliation.equals("ร.ศ.")&&!join1affiliation.equals("ศ.")&&!join1affiliation.equals(""))
										out.print("<input name=\"join1affiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\" checked>อื่นๆ&nbsp;");
									else
										out.print("<input name=\"join1affiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\">อื่นๆ&nbsp;");
							%>
							  </font></td>
                            <td align="left" valign="bottom"><font class="insfont">
                              <input name="join1affiliation_affi_other" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true"  value="<%if(!join1affiliation.equals("อาจารย์")&&!join1affiliation.equals("ผ.ศ.")&&!join1affiliation.equals("ร.ศ.")&&!join1affiliation.equals("ศ.")&&!join1affiliation.equals("")) out.print(join1affiliation);%>">
                              </font></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="214"><input type="text" name="join1_name"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=join1name%>" ></td>
                            <td width="54" align="right"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="272"><input type="text" name="join1_sername"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true"  value="<%=join1surname%>" ></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right"><font class="insfont">คณะ&nbsp;</font></td>
                            <td><input type="text" name="join1_faculty"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=join1factname%>" ></td>
                            <td align="right"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td><input type="text" name="join1_dept"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="40" readonly="true" value="<%=join1deptname%>" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4"> <table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="21" colspan="4" align="left"><font class="miniheader">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;อาจารย์ผู้ควบคุมวิทยานิพนธ์ร่วม&nbsp;2</font></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">รหัสอาจารย์&nbsp;</font> </font> 
                            </td>
                            <td align="left" valign="bottom"><input type="text" name="join2ID" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="8" maxlength="8" value="<%=join2ID%>" <%if(!join2ID.equals("")) out.print("readonly=\"true\"");%>></td>
                            <td align="left" valign="bottom">&nbsp;</td>
                            <td align="left" valign="bottom"><input type="submit" name="getJoin2" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkLecturerID(document.addThesisForm.join2ID)"></td>
                          </tr>
                          <tr> 
                            <td align="right"  valign="bottom"><font class="insfont">ตำแหน่งทางวิชาการ&nbsp;</font> 
                            </td>
                            <td align="left"  valign="bottom"><font class="insfont">
                              <input name="join2affiliation" type="radio" value="lecturer" readonly="true"  onClick="return noClink()" <%if(join2affiliation.equals("อาจารย์")) out.print("checked");%>>อาจารย์&nbsp;&nbsp;&nbsp;
                              <input name="join2affiliation" type="radio" value="Asst_Prof" readonly="true" onClick="return noClink()" <%if(join2affiliation.equals("ผ.ศ.")) out.print("checked");%>>ผ.ศ.&nbsp;&nbsp;&nbsp;
                              <input name="join2affiliation" type="radio" value="Assoc_Prof" readonly="true" onClick="return noClink()" <%if(join2affiliation.equals("ร.ศ.")) out.print("checked");%>>ร.ศ.&nbsp; &nbsp;&nbsp;
                              <input name="join2affiliation" type="radio" value="Prof" readonly="true" onClick="return noClink()" <%if(join2affiliation.equals("ศ.")) out.print("checked");%>>ศ.</font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <%
									if(!join2affiliation.equals("อาจารย์")&&!join2affiliation.equals("ผ.ศ.")&&!join2affiliation.equals("ร.ศ.")&&!join2affiliation.equals("ศ.")&&!join2affiliation.equals(""))
										out.print("<input name=\"join2affiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\" checked>อื่นๆ&nbsp;");
									else
										out.print("<input name=\"join2affiliation\" type=\"radio\" value=\"other\" readonly=\"true\" onClick=\"return noClink()\">อื่นๆ&nbsp;");
							%>
							</font></td>
                            <td align="left" valign="bottom"><font class="insfont"> 
                              <input name="join2affiliation_affi_other" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true"  value="<%if(!join2affiliation.equals("อาจารย์")&&!join2affiliation.equals("ผ.ศ.")&&!join2affiliation.equals("ร.ศ.")&&!join2affiliation.equals("ศ.")&&!join2affiliation.equals("")) out.print(join2affiliation);%>">
                              </font></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="214"><input type="text" name="join2_name"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=join2name%>"></td>
                            <td width="54" align="right"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="277"><input type="text" name="join2_sername"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=join2surname%>"></td>
                          </tr>
                          <tr> 
                            <td width="105" align="right"><font class="insfont">คณะ&nbsp;</font></td>
                            <td><input type="text" name="join2_faculty"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="30" readonly="true" value="<%=join2factname%>"></td>
                            <td align="right"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td><input type="text" name="join2_dept"  style="BORDER: #2B2C6F thin solid;COLOR:#000000;BACKGROUND:#DCEBF7;" size="40" readonly="true" value="<%=join2deptname%>"></td>
                          </tr>
                        </table></td>
                    </tr>      
					</table> 
                  <br>
                  <input name="addThesis" type="submit" value="&nbsp;&nbsp;บันทึก&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return check( )">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <input type="submit" name="thesisCancel" value="&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;">
                  <br>				 
                  </center>
				</form>                    
                
              </td>
            <!-- Insert data -->
            <td width="1" valign="top" background="image/verdotshort.gif"></td><!-- Right -->            
          </tr>
         
        </table>         
        </table></td>    <!-- Cover Main Page-->
  </tr>
</table>
</center>
<script language="JavaScript">
		function checkStdID(){        
				var v1 = document.addThesisForm.stdID.value;
				if ( v1.length != 8){
					alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8 หลัก ให้ถูกต้อง");
        			document.addThesisForm.stdID.focus();
           			return false;
        		}
				if( v1.length != 0){
					if(isNaN(v1)){
						alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8 หลัก ให้ถูกต้อง");
        				document.addThesisForm.stdID.focus();
						return false;
					}
 				}		 		
           		return true;
		}

		function noClink(){
			return false;
		}	// end scheckStdID
		
		function checkLecturerID(v1){
		
				if ( v1.value.length != 8){
					alert("กรุณาใส่รหัสอาจารย์ 8 หลัก ให้ถูกต้อง");
        			v1.focus();
           			return false;
        		}
				return true;
		}	// end checkLecturerID		
		
		function check(){
				var f=document.addThesisForm;
				var v1=document.addThesisForm.academicyear;
				var v2=document.addThesisForm.approveyear;
				var v3 = document.addThesisForm.stdID;
				var v4 = document.addThesisForm.superID;
				if ( v1.value.length != 4){		//  check ปีการศึกษา
					alert("กรุณาใส่ปีการศึกษาเป็นตัวเลข 4 หลัก ให้ถูกต้อง");
			        v1.focus();
           			return false;
        		}
				if( v1.value.length != 0){		//  check ปีการศึกษา
					if( isNaN(v1.value) ){
						alert("กรุณาใส่ปีการศึกษาเป็นตัวเลข 4 หลัก ให้ถูกต้อง");
        				v1.focus();
						return false;
					}
 				}
				if ( v2.value.length != 4){		//  check ปีที่อนุมัติ
					alert("กรุณาใส่ปีที่อนุมัติเป็นตัวเลข 4 หลัก ให้ถูกต้อง");
			        v2.focus();
           			return false;
        		}
				if( v2.value.length != 0){		//  check ปีที่อนุมัติ
					if( isNaN(v2.value) ){
						alert("กรุณาใส่ปีที่อนุมัติเป็นตัวเลข 4 หลัก ให้ถูกต้อง");
        				v2.focus();
						return false;
					}
 				}
				if ( v3.value.length != 8){	// check  รหัสนักศึกษา
					alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8 หลัก ให้ถูกต้อง");
        			v3.focus();
           			return false;
        		}
				if( v3.value.length != 0){	// check  รหัสนักศึกษา
					if(isNaN(v3.value)){
						alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8 หลัก ให้ถูกต้อง");
        				v3.focus();
						return false;
					}
 				}
				if ( v4.value.length != 8){		// check รหัสนักศึกษา
					alert("กรุณาใส่รหัสอาจารย์ 8 หลัก ให้ถูกต้อง");
        			v4.focus();
           			return false;
        		}				
							
				return true;
		}
</script>


</body>
</html>
