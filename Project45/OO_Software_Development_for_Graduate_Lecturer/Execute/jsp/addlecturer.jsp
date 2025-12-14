<%@ page contentType="text/html; charset=windows-874"%>
<%
	if(session.getAttribute("login")==null){
		response.sendRedirect("loginfail.jsp");
	}
%>
<html>
<head>
<title>เพิ่มข้อมูลอาจารย์บัณฑิต</title>
<script language=javascript SRC="javascript/inslecturer.js">
</script>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="stylesheet/insert.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">
<center>
<table width="780" border="0" cellspacing="0" cellpadding="0" background="image/background.gif" height="100%">
	<tr>
		<td width="780" valign="top"><br></td>
	</tr>
  	<tr>
		<td valign="top" background="image/band.gif" height="113">
		</td>
	</tr>
	<tr>
		<td valign="middle" height="30">
				<table width="780" border="0" cellspacing="0" cellpadding="0">
				<tr>
						<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;อาจารย์บัณฑิต&nbsp;>>&nbsp;เพิ่มข้อมูลอาจารย์บัณฑิต</font></td>
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
            <td width="1" rowspan="6" align="left" valign="top" background="image/verdotshort.gif"></td>
            <!--- empty after ver line --->
            <td width="778" rowspan="6" valign="top" align="left"> <!-- Insert data -->              
              <br>
			  	<center>
                <table width="300" height="50" bgcolor="#671691" border="1" bordercolor="#9900FF">
                  <tr> 
                    <td valign="middle" align="center" class="topic"> เพิ่มข้อมูลอาจารย์บัณฑิต 
                    </td>
                  </tr>
                </table>
				</center>				
				<form action="servlet/LecturerWork" method="post" name="addLecturerForm" >
				<center>
                  <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows">
                    <tr> 
                      <td colspan="4" height="31" bgcolor="#9999CC"> <font class="header">&nbsp;ประวัติส่วนตัว</font> 
                      </td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"> <font class="insfont">รหัสอาจารย์</font><font class="insfont">&nbsp;</font>	
                      </td>
                      <td colspan="3" valign="bottom"> <input name="lecturerID" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="10" maxlength="8"> 
                      </td>
                    </tr>
                    <tr> 
                      <td width="105" valign="bottom" align="right"> 
                        <!-- name thai -->
                        <font class="insfont">ชื่อ&nbsp;</font> </td>
                      <td width="286" valign="bottom"> <select name="title_th"  onChange="TitleThChange()">
                          <option value="นาย" selected>นาย</option>
                          <option value="นาง">นาง</option>
                          <option value="นางสาว" >นางสาว</option>
                          <option value="อื่นๆ">อื่นๆ</option>
                        </select> &nbsp; <input name="name_th" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="25"> 
                      </td>
                      <td width="68" align="right" valign="bottom"><font class="insfont">นามสกุล 
                        &nbsp;</font> </td>
                      <td width="185" align="left" valign="bottom"><font class="insfont"> 
                        <input type="text" name="surname_th" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="25">
                        </font></td>
                    <tr> 
                      <td valign="bottom" align="right"> 
                        <!-- name english -->
                        <font class="insfont">&nbsp;name&nbsp;</font> </td>
                      <td valign="bottom"><select name="title_en" onChange="TitleEnChange()" >
                          <option value="Mr." selected>Mr. &nbsp; &nbsp; &nbsp; </option>
                          <option value="Mis.">Mis.</option>
                          <option value="Miss.">Miss.</option>
                          <option value="other">Other</option>
                        </select> &nbsp; <input name="name_en" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="25"> 
                      <td align="right" valign="bottom"><font class="insfont">Surname&nbsp;</font> 
                      </td>
                      <td align="left" valign="bottom"><input name="surname_en" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="25"></td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right">&nbsp; </td>
                      <td colspan="3" valign="bottom"> <font class="insfont"> 
                        เพศ&nbsp;&nbsp;&nbsp; 
                        <input name="sex" type="radio" value="ชาย" checked>
                        ชาย &nbsp;&nbsp 
                        <input name="sex" type="radio" value="หญิง">
                        หญิง </font> </td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"> <font class="insfont">&nbsp;</font> 
                      </td>
                      <td valign="bottom" colspan="3"> <font class="insfont">วัน 
                        เดือน ปีเกิด&nbsp;&nbsp;&nbsp;&nbsp;วันที่&nbsp; 
                        <select name="birthdate">
                          <option value="1" selected>1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                          <option value="6">6</option>
                          <option value="7">7</option>
                          <option value="8">8</option>
                          <option value="9">9</option>
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
                        &nbsp;&nbsp;เดือน 
                        <select name="birthmonth"  style="font:14px">
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
                        <input name="birthyear" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="6" maxlength="4">
                        </font> </td>
                    </tr>
                    <tr> 
                      <td align="right" valign="top"> <font class="insfont">สถานที่ติดต่อ&nbsp; 
                        </font> </td>
                      <td  colspan="3" align="left" valign="top"><font class="insfont"> 
                        <textarea name="contact_address" rows="3" cols="50" style="BORDER: #2B2C6F thin solid;COLOR:#000000;"></textarea>                      
                        </font></td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">โทรศัพท์&nbsp;</font> 
                      </td>
                      <td colspan="3"> <font class="insfont"> 
                        <input name="telephone" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="15">
                        &nbsp; &nbsp;โทรสาร&nbsp; 
                        <input name="fax" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="13">
                        </font> </td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">E-mail&nbsp;</font></td>
                      <td colspan="3"><input name="email" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="41"> 
                        <font class="insfont">&nbsp;&nbsp;URL&nbsp; 
                        <input name="url" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="33"></font>
                       </td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="left" valign="bottom"><font class="insfont">&nbsp;ตำแหน่งทางวิชาการ&nbsp;</font> 
                        <font class="insfont"> 
                        <input name="academicaffiliation" type="radio" value="อาจารย์" checked>
                        อาจารย์&nbsp;&nbsp; &nbsp;&nbsp; 
                        <input name="academicaffiliation" type="radio" value="ผ.ศ.">
                        ผ.ศ.&nbsp;&nbsp; &nbsp;&nbsp; 
                        <input name="academicaffiliation" type="radio" value="ร.ศ.">
                        ร.ศ.&nbsp;&nbsp; &nbsp;&nbsp; 
                        <input name="academicaffiliation" type="radio" value="ศ.">
                        ศ.&nbsp;&nbsp; &nbsp;&nbsp; 
                        <input name="academicaffiliation" type="radio" value="other">
                        อื่นๆ&nbsp; 
                        <input name="academic_affi_other" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="31">
                        </font><font class="insfont">&nbsp; </font> </td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">ตำแหน่งบริหาร&nbsp;</font></td>
                      <td colspan="3" align="left" valign="bottom"><input name="adminposition" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="50"></td>
                    </tr>
                    <tr> 
                      <td valign="bottom" align="right"><font class="insfont">คุณวุฒิ&nbsp;</font> 
                      </td>
                      <td colspan="3" valign="bottom"> <input name="qualification" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="50"> 
                        <font class="insfont"> (&nbsp;ระบุปริญญาสูงสุด&nbsp;) 
                        </font></td>
                    </tr>
                    <tr> 
                      <td valign="bottom" colspan="4"> <font class="insfont"> 
                        &nbsp;&nbsp;&nbsp;&nbsp;ประสบการณ์ทำงาน/การสอน/วิจัย&nbsp;	
                        &nbsp; 
                        <input name="experience" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="3" maxlength="2">
                        &nbsp;&nbsp;ปี </font> </td>
                    </tr>
                    <tr> 
                      <td valign="top" colspan="4"> <table cellpadding="0" cellspacing="0" border="0" width="650">
                          <tr> 
                            <td height="22" colspan="2" valign="bottom"> <font class="miniheader"> 
                              &nbsp;ความเชี่ยวชาญเฉพาะ/งานวิจัย&nbsp;(&nbsp;พิมพ์ไทยหรืออังกฤษก็ได้&nbsp;)</font>	
                            </td>
                          </tr>
                          <tr> 
                            <td width="108" align="right" valign="top"> <font class="insfont">1.&nbsp;&nbsp;</font> 
                            </td>
                            <td valign="bottom" width="542"> <input name="expertise1" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80"> 
                            </td>
                          </tr>
                          <tr> 
                            <td valign="top" align="right"> <font class="insfont">2.&nbsp;&nbsp;</font> 
                            </td>
                            <td valign="bottom" width="542"> <input name="expertise2" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80"> 
                            </td>
                          </tr>
                          <tr> 
                            <td valign="top" align="right"> <font class="insfont">3.&nbsp;&nbsp;</font> 
                            </td>
                            <td valign="bottom" width="542"> <input name="expertise3" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80"> 
                            </td>
                          </tr>
                          <tr> 
                            <td valign="top" align="right"> <font class="insfont">4.&nbsp;&nbsp;</font> 
                            </td>
                            <td valign="bottom" width="542"> <input name="expertise4" type="text" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80"> 
                            </td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4" height="15" bgcolor="#9999CC"> <font class="header">&nbsp;ประวัติการศึกษา</font> 
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="4"> <table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="103"><font class="miniheader">&nbsp;ปริญญาตรี</font></td>
                            <td width="192">&nbsp;</td>
                            <td width="112">&nbsp;</td>
                            <td width="153">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ปีการศึกษาที่จบ&nbsp;</font></td>
                            <td><input type="text" name="B_Year" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="6" maxlength="4" align="center"> 
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">สถาบันการศึกษา&nbsp;</font></td>
                            <td colspan="3"><input type="text" name="B_Institute" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60"></td>
                          </tr>
                          <tr> 
                            <td align="right"><font class="insfont">สาขา</font>&nbsp;</td>
                            <td colspan="3"><input type="text" name="B_Major" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60"></td>
                          </tr>
                          <tr> 
                            <td align="right"><font class="insfont">ชื่อปริญญา</font>&nbsp;</td>
                            <td colspan="3"><input type="text" name="B_Degree" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="4"><table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="103"><font class="miniheader">&nbsp;ปริญญาโท</font></td>
                            <td width="192">&nbsp;</td>
                            <td width="112">&nbsp;</td>
                            <td width="153">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ปีการศึกษาที่จบ&nbsp;</font></td>
                            <td><input type="text" name="M_Year" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="6" maxlength="4" align="center"> 
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">สถาบันการศึกษา&nbsp;</font></td>
                            <td colspan="3"><input type="text" name="M_Institute" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60"></td>
                          </tr>
                          <tr> 
                            <td align="right"><font class="insfont">สาขา</font>&nbsp;</td>
                            <td colspan="3"><input type="text" name="M_Major" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60"></td>
                          </tr>
                          <tr> 
                            <td align="right"><font class="insfont">ชื่อปริญญา</font>&nbsp;</td>
                            <td colspan="3"><input type="text" name="M_Degree" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60"></td>
                          </tr>
                        </table></td>
                    <tr> 
                      <td  colspan="4"> <table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="103"><font class="miniheader">&nbsp;ปริญญาเอก</font></td>
                            <td width="192">&nbsp;</td>
                            <td width="112">&nbsp;</td>
                            <td width="153">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ปีการศึกษาที่จบ&nbsp;</font></td>
                            <td><input type="text" name="D_Year" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="6" maxlength="4" align="center"> 
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">สถาบันการศึกษา&nbsp;</font></td>
                            <td colspan="3"><input type="text" name="D_Institute" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60"></td>
                          </tr>
                          <tr> 
                            <td align="right"><font class="insfont">สาขา</font>&nbsp;</td>
                            <td colspan="3"><input type="text" name="D_Major" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60"></td>
                          </tr>
                          <tr> 
                            <td align="right"><font class="insfont">ชื่อปริญญา</font>&nbsp;</td>
                            <td colspan="3"><input type="text" name="D_Degree" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td  colspan="4"> <table width="650" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="103"><font class="miniheader">&nbsp;อื่นๆ</font></td>
                            <td width="192">&nbsp;</td>
                            <td width="112">&nbsp;</td>
                            <td width="153">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">ปีการศึกษาที่จบ&nbsp;</font></td>
                            <td><input type="text" name="O_Year" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="6" maxlength="4" align="center"> 
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right" valign="bottom"><font class="insfont">สถาบันการศึกษา&nbsp;</font></td>
                            <td colspan="3"><input type="text" name="O_Institute" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60" maxlength="4"></td>
                          </tr>
                          <tr> 
                            <td align="right"><font class="insfont">สาขา</font>&nbsp;</td>
                            <td colspan="3"><input type="text" name="O_Major" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60" maxlength="4"></td>
                          </tr>
                          <tr> 
                            <td align="right"><font class="insfont">ชื่อปริญญา</font>&nbsp;</td>
                            <td colspan="3"><input type="text" name="O_Degree" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="60" maxlength="4"></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <!--- Graduate Member Record -->
                      <td colspan="4" height="30" bgcolor="#9999CC"> <font class="header">&nbsp;ข้อมูลการเป็นอาจารย์ประจำบัณฑิตวิทยาลัย</font> 
                      </td>
                    </tr>
                    <tr> 
                      <td colspan="4" valign="bottom"> <table cellpadding="0" cellspacing="0" border="1" bordercolor="#9966CC" width="650" rules="rows" frame="void">
                          <tr> 
                            <td width="115" valign="bottom"><font class="insfont">&nbsp; 
                              </font></td>
                            <td width="270" valign="bottom"><font class="insfont">สถานภาพการเป็นอาจารย์บัณฑิต&nbsp;</font></td>
                            <td width="275"> <font class="insfont"> 
                              <input name="member_status" type="radio" value="ประจำ" checked>
                              ประจำ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                              <input name="member_status" type="radio" value="พิเศษ">
                              พิเศษ</font> </td>
                          </tr>
                          <tr> 
                            <td valign="bottom"> <font class="insfont">&nbsp; 
                              </font> </td>
                            <td valign="bottom"><font class="insfont">สอนในหลักสูตร&nbsp;(&nbsp;เลือกได้มากกว่า&nbsp;1&nbsp;ข้อ&nbsp;)&nbsp;</font></td>
                            <td> <font class="insfont"> 
                              <input name="mastercourse" type="checkbox" value="Y">
                              ปริญญาโท&nbsp;&nbsp;&nbsp; 
                              <input name="doctorcourse" type="checkbox" value="Y">
                              ปริญญาเอก </font> </td>
                          </tr>
                          <tr> 
                            <td valign="bottom"> <font class="insfont"> &nbsp; 
                              </font> </td>
                            <td valign="bottom"><font class="insfont">สอบวิทยานิพนธ์&nbsp;(&nbsp;เลือกได้มากกว่า&nbsp;1&nbsp;ข้อ&nbsp;)&nbsp;</font></td>
                            <td> <font class="insfont"> 
                              <input name="masterexam" type="checkbox" value="Y">
                              ปริญญาโท&nbsp;&nbsp;&nbsp; 
                              <input name="doctorexam" type="checkbox" value="Y">
                              ปริญญาเอก </font> </td>
                          </tr>
                          <tr> 
                            <td valign="bottom"> <font class="insfont"> &nbsp;&nbsp;&nbsp; 
                              </font> </td>
                            <td valign="bottom"><font class="insfont">ควบคุมวิทยานิพนธ์&nbsp;(&nbsp;เลือกได้มากกว่า&nbsp;1&nbsp;ข้อ&nbsp;)</font></td>
                            <td> <font class="insfont"> 
                              <input name="masterthesis" type="checkbox" value="Y">
                              ปริญญาโท&nbsp;&nbsp;&nbsp; 
                              <input name="doctorthesis" type="checkbox" value="Y">
                              ปริญญาเอก </font> </td>
                          </tr>
                          <tr> 
                            <td align="right"  valign="bottom"><font class="insfont">สังกัดคณะ&nbsp;</font></td>
                            <td colspan="2"><font class="insfont"> 
                              <select name="faculty" onChange="departmentChange(this,addLecturerForm.department,addLecturerForm.major)">
                                <option value="00" selected>เลือก&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                <option value="01">วิศวกรรมศาสตร์&nbsp;</option>
                                <option value="02">สถาปัตยกรรมศาสตร์&nbsp;</option>
                                <option value="03">ครุศาสตร์อุตสาหกรรม&nbsp;</option>
                                <option value="04">วิทยาศาสตร์&nbsp;</option>
                                <option value="05">เทคโนโลยีการเกษตร&nbsp;</option>
                                <option value="06">โครงการคณะอุตสาหกรรมเกษตร&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</option>
                                <option value="07">เทคโนโลยีสารสนเทศ&nbsp;</option>
                              </select>
                              </font></td>
                          </tr>
                          <tr> 
                            <td align="right"  valign="bottom"> <font class="insfont">ภาควิชา&nbsp;</font></td>
                            <td colspan="2"><font class="insfont"> 
                              <select name="department" onChange="majorChange(addLecturerForm.faculty,this,addLecturerForm.major)">
                            	<option value="00" selected>เลือก&nbsp;&nbsp;&nbsp;</option>
							  </select>
                              </font></td>
                          </tr>
                          <tr> 
                            <td align="right"  valign="bottom"> <font class="insfont">สาขาวิชา&nbsp;</font> 
                            </td>
                            <td colspan="2"><font class="insfont"> 
                              <select name="major">
							  	<option value="00" selected>เลือก&nbsp;&nbsp;&nbsp;</option>
                              </select>
                              </font> </td>
                          </tr>
                          <tr> 
                            <!--- start teach in curiculum -->
                            <td colspan="3"> <table border="0" cellspacing="0" cellpadding="0" width="650">
                                <tr> 
                                  <td valign="top" colspan="4"> <font class="miniheader">&nbsp;ปัจจุบันสอน/สอบ/ควบคุมวิทยานิพนธ์ในหลักสูตร 
                                    </font> </td>
                                </tr>
                                <tr> 
                                  <!-- 1 -->
                                  <td width="85" align="right" valign="bottom"> 
                                    <font class="insfont"> 1.&nbsp;หลักสูตรคณะ&nbsp; 
                                    </font> </td>
                                  <td width="185" valign="bottom"><select name="teach_faculty1" onchange="majorChange21(this,document.addLecturerForm.teach_major1,document.addLecturerForm.teach_course1)">
                                      <option value="00" selected>เลือก&nbsp;&nbsp;&nbsp;</option>
                                      <option value="01">วิศวกรรมศาสตร์</option>
                                      <option value="02">สถาปัตยกรรมศาสตร์</option>
                                      <option value="03">ครุศาสตร์อุตสาหกรรม</option>
                                      <option value="04">วิทยาศาสตร์</option>
                                      <option value="05">เทคโนโลยีการเกษตร</option>
                                      <option value="06">โครงการคณะอุตสาหกรรมเกษตร</option>
                                      <option value="07">เทคโนโลยีสารสนเทศ</option>
                                    </select> </td>
                                  <td valign="bottom" width="30" align="right"> 
                                    <font class="insfont">สาขา&nbsp;</font> </td>
                                  <td width="350" valign="bottom"> <select name="teach_major1" onChange="courseChange1(document.addLecturerForm.teach_faculty1,this,document.addLecturerForm.teach_course1)">
                                    	<option value="00" selected>เลือก&nbsp;&nbsp;&nbsp;</option>
									</select> </td>
                                </tr>
                                <tr> 
                                  <td valign="bottom" align="right"> <font class="insfont">ชื่อหลักสูตร&nbsp;</font> 
                                  </td>
                                  <td colspan="3" valign="bottom"><select name="teach_course1">
                                    	<option value="00" selected>เลือก&nbsp;&nbsp;&nbsp;</option>
									</select> </td>
                                </tr>
                                <tr> 
                                  <!-- 2 -->
                                  <td valign="bottom" align="right"> <font class="insfont"> 
                                    2.&nbsp;หลักสูตรคณะ&nbsp; </font> </td>
                                  <td valign="bottom"><select name="teach_faculty2" onchange="majorChange22(this,document.addLecturerForm.teach_major2,document.addLecturerForm.teach_course2)">
                                      <option value="00" selected>เลือก</option>
                                      <option value="01">วิศวกรรมศาสตร์</option>
                                      <option value="02">สถาปัตยกรรมศาสตร์</option>
                                      <option value="03">ครุศาสตร์อุตสาหกรรม</option>
                                      <option value="04">วิทยาศาสตร์</option>
                                      <option value="05">เทคโนโลยีการเกษตร</option>
                                      <option value="06">โครงการคณะอุตสาหกรรมเกษตร</option>
                                      <option value="07">เทคโนโลยีสารสนเทศ</option>
                                    </select> </td>
                                  <td valign="bottom" align="right"><font class="insfont">สาขา&nbsp;</font> 
                                  </td>
                                  <td  valign="bottom"><select name="teach_major2" onChange="courseChange2(document.addLecturerForm.teach_faculty2,this,document.addLecturerForm.teach_course2)">
                                    	<option value="00" selected>เลือก&nbsp;&nbsp;&nbsp;</option>
									</select> </td>
                                </tr>
                                <tr> 
                                  <td valign="bottom" align="right"> <font class="insfont">ชื่อหลักสูตร&nbsp; 
                                    </font> </td>
                                  <td colspan="3" valign="bottom"> <select name="teach_course2">
                                    	<option value="00" selected>เลือก&nbsp;&nbsp;&nbsp;</option>
									</select></td>
                                </tr>
                                <tr> 
                                  <!-- 3 -->
                                  <td valign="bottom" align="right"> <font class="insfont"> 
                                    3.&nbsp;หลักสูตรคณะ&nbsp; </font> </td>
                                  <td valign="bottom"><select name="teach_faculty3" onChange="majorChange23(this,document.addLecturerForm.teach_major3,document.addLecturerForm.teach_course3)">
                                      <option value="00" selected>เลือก</option>
                                      <option value="01">วิศวกรรมศาสตร์</option>
                                      <option value="02">สถาปัตยกรรมศาสตร์</option>
                                      <option value="03">ครุศาสตร์อุตสาหกรรม</option>
                                      <option value="04">วิทยาศาสตร์</option>
                                      <option value="05">เทคโนโลยีการเกษตร</option>
                                      <option value="06">โครงการคณะอุตสาหกรรมเกษตร</option>
                                      <option value="07">เทคโนโลยีสารสนเทศ</option>
                                    </select> </td>
                                  <td valign="bottom" align="right"><font class="insfont">สาขา&nbsp;</font> 
                                  </td>
                                  <td  valign="bottom"><select name="teach_major3" onChange="courseChange3(document.addLecturerForm.teach_faculty3,this,document.addLecturerForm.teach_course3)">
                                    	<option value="00" selected>เลือก&nbsp;&nbsp;&nbsp;</option>
									</select> </td>
                                </tr>
                                <tr> 
                                  <td valign="bottom" align="right"> <font class="insfont">ชื่อหลักสูตร&nbsp; 
                                    </font> </td>
                                  <td colspan="3" valign="bottom"> <select name="teach_course3">
                                    	<option value="00" selected>เลือก&nbsp;&nbsp;&nbsp;</option>
									</select></td>
                                </tr>
                              </table>
                              <!--- end start teach in curiculum -->
                            </td>
                          </tr>
                        </table>
                        <!--- Graduate data -->
                      </td>
                    </tr>
                  </table>
                  <br>
                  <input name="inslecturer" type="submit" value="&nbsp;&nbsp;&nbsp;บันทึก&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;"  onClick="return checks()">
                  &nbsp;&nbsp; &nbsp;&nbsp; 
                  <input name="cancel" type="submit" value="&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;">
                  <br></center>
                </form>				
              </td><!-- Insert data -->
            
            <td width="1" rowspan="6" valign="top" background="image/verdotshort.gif"></td><!-- Right -->
          </tr>          
        </table>         
        </table></td>    <!-- Cover Main Page-->
  </tr>
</table>
</center>
<script language="JavaScript">
		function checks(){ 
			var v1 = document.addLecturerForm.lecturerID;
			var f = document.addLecturerForm;
		    if (v1.value.length!=8){
	           	 alert("กรุณาใส่รห ัสอาจารย์  8 หลัก");
    	       	 v1.focus();
        	   	 return false;
        	}
			if( f.birthyear.value.lenght != 0 ){
				if( isNaN( f.birthyear.value ) ){
					 alert("กรุณาใส่ข้อมูลเป็นตัวเลขให้ถูกต้อง");
    	      		 document.addLecturerForm.birthyear.focus();
        	  		 return false;
				}
 			}
			if( f.experience.value.lenght != 0 ){
				if( isNaN( f.experience.value ) ){
					 alert("กรุณาใส่ข้อมูลเป็นตัวเลขให้ถูกต้อง");
    	      		 document.addLecturerForm.experience.focus();
        	  		 return false;
				}
 			}
			if(f.faculty.value == 00){
				 	alert("กรุณาเลือกคณะที่สังกัด");
    	      		document.addLecturerForm.faculty.focus();
        	  		return false;
			}
			return true;
		   		   
		}	// end function checksID
		
		function TitleThChange(){
			var f=document.addLecturerForm;	
			var titleTh=document.addLecturerForm.title_th;
			var titleEn=document.addLecturerForm.title_en;
			switch(titleTh.selectedIndex){
					case 0	: { titleEn.options[0].selected=true; f.sex[0].checked=true;break;}
					case 1	: { titleEn.options[1].selected=true; f.sex[1].checked=true; break;}
					case 2	: { titleEn.options[2].selected=true; f.sex[1].checked=true;break;}
					case 3	: {var tmp=prompt("กรอกคำนำหน้าชื่อ ภาษาไทย","");titleTh.options[3].text=(tmp==null)?"อื่นๆ":tmp;f.sex[0].checked=true;}
			}
		}	// end function TitleChange
		
		function TitleEnChange(){
			var f=document.addLecturerForm;	
			var titleTh=document.addLecturerForm.title_th;
			var titleEn=document.addLecturerForm.title_en;
			switch(titleEn.selectedIndex){
					case 0	: { titleTh.options[0].selected=true; f.sex[0].checked=true;break;}
					case 1	: { titleTh.options[1].selected=true; f.sex[1].checked=true; break;}
					case 2	: { titleTh.options[2].selected=true; f.sex[1].checked=true;break;}
					case 3	: {var tmp=prompt("กรอกคำนำหน้าชื่อ ภาษาอังกฤษ","");titleEn.options[3].text=(tmp==null)?"อื่นๆ":tmp;f.sex[0].checked=true;}
			}
		}	// end function TitleChange	
</script>
</body>
</html>
