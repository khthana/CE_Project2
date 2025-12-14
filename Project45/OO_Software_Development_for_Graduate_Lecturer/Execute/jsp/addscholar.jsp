<%@ page import="myutil.server,java.sql.*,myutil.thaiLanguage,java.io.*,student.Student,scholarship.*" contentType="text/html; charset=windows-874"%>
<%!
			private Scholarship schship = new Scholarship();
			private Student std = new Student();
%>

<%
	if(session.getAttribute("login")==null){
		response.sendRedirect("loginfail.jsp");
	}
	if( session.getAttribute("scholarshipInfo")==null && session.getAttribute("stdInfo")==null && request.getParameter("notFoundAddscholarInfo") == null){
			schship = new Scholarship();
			std = new Student();		
	}
	
	if(session.getAttribute("scholarshipInfo")!=null){
		schship = (Scholarship)session.getAttribute("scholarshipInfo");
		session.removeAttribute("scholarshipInfo");
	}
	if(session.getAttribute("stdInfo")!=null){
		std = (Student)session.getAttribute("stdInfo");
		session.removeAttribute("stdInfo");
	}
	
%>
<html>
<head>
<title>เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</title>
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
		
      <td  valign="middle" height="28">
	  			<table width="780" border="0" cellspacing="0" cellpadding="0">
				<tr>
						
            <td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;ทุนการศึกษา&nbsp;>>&nbsp;เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</font></td>
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
                    <td valign="middle" align="center" ><font class="topic">เพิ่มรายชื่อนักศึกษาที่ได้รับทุน</font></td>
                  </tr>
                </table>
              </center>				
                <form action="servlet/scholarshipWork" method="post" name="addScholarForm" >
                <center>
                  	
                  <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows">
                    <tr> 
                      <td colspan="4" height="31" bgcolor="#9999CC"><font class="header">&nbsp;ข้อมูลทุนการศึกษา</font></td>
                    </tr>
                    <tr> 
                      <td  align="right" valign="bottom"><font class="insfont">รหัสทุน&nbsp;</font></td>
                      <td><input name="scholarshipID" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;<%if(schship.getScholarshipID() != 0) out.print("BACKGROUND-COLOR:#D9E3F6;");%>" size="8" maxlength="8"<%if(schship.getScholarshipID() != 0) out.print(" value=\""+schship.getScholarshipID()+"\" readonly=\"true\" " );%>></td>
                      <td>&nbsp;</td>
                      <td><input type="submit" name="retrieveScholarshipInfo" value="&nbsp;&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkScholarshipID()"></td>
                    </tr>
                    <tr> 
                      <td width="115" height="26" align="right" valign="bottom"><font class="insfont">ประเภททุน&nbsp;</font></td>
                      <td width="215" ><input name="type" type="text"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;" size="25" maxlength="8" readonly="true" value="<%=schship.getType()%>"></td>
                      <td width="100" align="right" valign="bottom"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td width="220" valign="bottom"><input name="Aacademicyear" type="text"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;" size="5" maxlength="4" readonly="true" value="<%=schship.getAcademicYear()%>"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">ชื่อทุน&nbsp;</font></td>
                      <td colspan="3"><input type="name" name="textfield"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;" size="60" readonly="true" value="<%=schship.getName()%>"></td>
                    </tr>					
			<%
					if( schship.getType().equals("") || schship.getType().equals("ทุนการศึกษา") ){
					
					String s=	"<tr>\n"+					
	                     				"<td align=\"right\"  valign=\"bottom\"><font class=\"insfont\">จำนวนทุน&nbsp;</font></td>\n"+										
					                    "<td colspan=\"3\"><input name=\"number\" type=\"text\" style=\"BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;\" readonly=\"true\" size=\"6\"  value=\""; if(schship.getNumberScholarship() != 0 ) s=s+schship.getNumberScholarship(); s=s+" \"> \n"+
										"<font class=\"insfont\">&nbsp;&nbsp;ทุนละ&nbsp; \n"+
                        				"<input name=\"Amoney\" type=\"text\"style=\"BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;\" readonly=\"true\" size=\"12\" value=\""; if(schship.getMoney() != 0 ) s=s+schship.getMoney(); s=s+ "\">\n"+
                      					"&nbsp;บาท&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ระยะเวลา&nbsp; \n"+
                        				"<input name=\"duration\" type=\"text\" style=\"BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;\" readonly=\"true\" size=\"3\" value=\""+schship.getDuration()+"\" >\n"+
                      					"&nbsp;ปี </font></td>\n"+
                    					"</tr>";
					out.print(s);
					}
			%>
                    <tr> 
                      <td colspan="4"height="31" bgcolor="#9999CC"><font class="header">&nbsp;ข้อมูลนักศึกษาที่ได้รับทุน</font></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">รหัสนักศึกษา&nbsp;</font></td>
                      <td align="left"><input name="stdID" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;<% if(!std.getStdID().equals("")) out.print("BACKGROUND-COLOR:#BECFF0;COLOR:#000000;");%>" size="8" maxlength="8"  <%if(!std.getStdID().equals("")) out.print("value=\""+std.getStdID()+"\"readonly=\"true\" ");%>></td>
                      <td align="left">&nbsp;</td>
                      <td align="left"><input type="submit" name="retrieveScholarInfo" value="&nbsp;&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkStdID()"></td>
                    </tr>
                    <tr> 
                      <td colspan="4" valign="top"> <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows" frame="void">
                          <tr> 
                            <td width="115" align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                            <td width="215"  valign="bottom"><input type="text" name="studentname" style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;" readonly="true" size="30" value="<%=std.getTpre()+std.getTname()%>"></td>
                            <td width="60" align="right" valign="bottom"><font class="insfont">นามสกุล&nbsp;</font></td>
                            <td width="260" valign="bottom"><input type="text" name="studentsurname"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;" readonly="true" size="30" value="<%=std.getTfamily()%>"></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                            <td> <input type="text" name="stdfaculty" style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;" readonly="true" size="30" value="<%=std.getFactName()%>"></td>
                            <td align="right" valign="bottom"><font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td><input type="text" name="stddepartment"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;" readonly="true" size="38" value="<%=std.getDeptName()%>"></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">หลักสูตร&nbsp;</font></td>
                            <td colspan="3"><input type="text" name="stdcourse"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;" readonly="true" size="60" value="<%=std.getCourseName()%>"></td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">สาขาวิชา&nbsp;</font></td>
                            <td colspan="3"><input type="text" name="stdmajor"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;BACKGROUND-COLOR:#D9E3F6;" readonly="true" size="60" value="<%=std.getMajorName()%>" ></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4"height="31" bgcolor="#9999CC"><font class="header">&nbsp;ข้อมูลการให้ทุน</font></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td colspan="3" align="left" valign="bottom"><input name="academicYear" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="6" maxlength="4" >
                        <font class="insfont">&nbsp;วันที่อนุมัติให้ทุน</font> 
                        <font class="insfont"> 
                        <select name="offerDay">
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
                        <select name="offerMonth">
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
                        <input name="offerYear" type="text" size="5" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" maxlength="4">
                        </font></td>
                    </tr>
                    <%
						if( !schship.getType().equals("") && !schship.getType().equals("ทุนการศึกษา") ){
                      		out.print(	"<tr>\n"+
												"<td align=\"right\" valign=\"bottom\"><font class=\"insfont\">จำนวนเงิน&nbsp;</font></td>\n"+
                      							"<td colspan=\"3\"><input name=\"money\" type=\"text\" style=\"BORDER: #2B2C6F thin solid;COLOR:#000000;\" size=\"12\" maxlength=\"12\" ><font class=\"insfont\">&nbsp;บาท</font></td>\n"+
                    							"</tr>\n");
						}
					%>
                  </table>
				  <br>
                  	<input name="addScholar" type="submit" value="&nbsp;&nbsp;บันทึก&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checks()">
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                  <input name="cancelAddScholar" type="submit" value="&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" >
                  
                </center>
				</form>               
			   <br><br>			  
				</td>
            <!-- Insert data --> 
            <!-- Right --> 
             <td width="1" background="image/verdotshort.gif" valign="top" ></td>
        </table>
        </table></td>
  </tr>
</table>
</center>
<script language="JavaScript">
		function TitleChange(){
			var f=document.addScholarForm;	
			var title=document.addScholarForm.stdtitle;
			switch(title.selectedIndex){					
					case 3	: {var tmp=prompt("กรอกคำนำหน้าชื่อ ","");title.options[3].text=(tmp==null)?"อื่นๆ":tmp;}
			}
		}	// end function TitleChange
		
		function checkScholarshipID(){
			var v1 = document.addScholarForm.scholarshipID.value;
			
			if( v1.length == 0){
					 alert("กรุณาใส่รหัสทุนการศึกษา");
    	      		 document.addScholarForm.scholarshipID.focus();
        	  		 return false;
			}
			if( v1.length != 0){
				if(isNaN(v1)){
					 alert("กรุณาใส่รหัสทุนการศึกษาเป็นตัวเลข ให้ถูกต้อง");
    	      		 document.addScholarForm.scholarshipID.focus();
        	  		 return false;
				}
 			}
			return true;
		}	// end  checkScholarshipID()
		
		function checkStdID(){
			var v1 = document.addScholarForm.stdID.value;
			
			if( v1.length != 8 ){
					 alert("กรุณาใส่รหัสนักศึกษาเป็นตัวเลข 8 หลัก");
    	      		 document.addScholarForm.stdID.focus();
        	  		 return false;
			}
			if( v1.length != 0){
				if(isNaN(v1)){
					 alert("กรุณาใส่รหัสนักศึกษาเป็นตัวเลข ให้ถูกต้อง");
    	      		 document.addScholarForm.stdID.focus();
        	  		 return false;
				}
 			}	
			return true;	
		}	// end  checkScholarshipID()
		
		function checks(){
			var v1 = document.addScholarForm.offerYear.value;
			var v2 = document.addScholarForm.academicYear.value;
			var d1 = document.addScholarForm;
				if( !checkScholarshipID() )
					return false;
				if( !checkStdID() )
					return false;
				if( v2.length != 4 ){
						 alert("กรุณาใส่ข้อมูลปีการศึกษาเป็นตัวเลข 4 หลัก");
    	      			 document.addScholarForm.academicYear.focus();
        	  			 return false;
				}
				if( v2.length != 0){
					if(isNaN(v2)){
						 alert("กรุณาใส่ข้อมูลปีการศึกษาเป็นตัวเลข 4 หลัก");
    	      			 document.addScholarForm.academicYear.focus();
        	  			 return false;
					}
				}
				if( v1.length != 0){					
					if( isNaN(v1) || v1.length!=4 ){
						 alert("กรุณาใส่ข้อมูลเป็นตัวเลข 4 หลัก ");
    		      		 document.addScholarForm.offerYear.focus();
        		  		 return false;
					}
				}					
				if ( d1[d1.length-3].name == "money" ){
						var v3 = document.addScholarForm.money.value;
						if( isNaN(v3) || v3.length == 0 ){
								 alert("กรุณาใส่จำนวนเงิน เป็นตัวเลข");
    		    		  		 document.addScholarForm.money.focus();
		        		  		 return false;
						}
				}		
				return true;			
		}	// end checks()
		
</script>
</body>
</html>
