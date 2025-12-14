<%@ page contentType="text/html; charset=windows-874"%>
<%
			if(session.getAttribute("login")==null){
				response.sendRedirect("loginfail.jsp");
				session.removeAttribute("login");
			}
%>
<html>
<head>
<title>เพิ่มรายชื่อทุนการศึกษา</title>
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
            			<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;ทุนการศึกษา&nbsp;>>&nbsp;เพิ่มรายชื่อทุนการศึกษา</font> </td>
    					<td width="110" align="right" valign="bottom"><a class="pathlink2" href="servlet/login?logout=logout">Logout</a>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  				</tr>
				</table>
	   
      </td>
	</tr>
	<tr>
		<td valign="top"  background="image/hordotshort.gif" height="1">		
		</td>
	</tr>
	<tr>
    <td valign="top">     <!-- Cover Main Page-->
		<table width="780" border="0" cellspacing="0" cellpadding="0">
          <tr>            
            <!--- ver line ---><td width="1" align="left" valign="top"  background="image/verdotshort.gif">           
            <td width="778" valign="top"> <!-- Insert data -->              
              <br> <center>
                <table width="400" height="50" bgcolor="#671691" border="1" bordercolor="#9900FF" >
                  <tr> 
                    <td valign="middle" align="center" ><font class="topic">เพิ่มรายชื่อทุนการศึกษา</font>
                    </td>
                  </tr>
                </table></center><br>
				<form action="servlet/scholarshipWork" method="post" name="addScholarshipForm">
				<center>
                  <table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#9966CC" rules="rows">
                    <tr> 
                      <td colspan="4" height="31" bgcolor="#9999CC"><font class="header">&nbsp;ข้อมูลทุนการศึกษา</font> 
                      </td>
                    </tr>
                    <tr> 
                      <td width="103" align="right" valign="bottom"><font class="insfont">ประเภททุน&nbsp;</font></td>
                      <td width="200"> 
					  <select name="scholarshipType" onChange="checkType()">
					  	<option value="ทุนการศึกษา" selected>ทุนการศึกษา</option>
						<option value="ทุนสนับสนุนทำวิทยานิพนธ์">ทุนสนับสนุนทำวิทยานิพนธ์</option>
						<option value="ทุนเสนอบทความทางวิชาการ">ทุนเสนอบทความทางวิชาการ</option>
					  </select>
                      </td>
                      <td width="91" align="right" valign="bottom"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td width="246" valign="bottom"><input name="academicYear" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="6" maxlength="4" ></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">ชื่อทุน&nbsp;</font></td>
                      <td colspan="3"  valign="bottom"><input type="text" name="name"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="400"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">แหล่งที่มา&nbsp;</font></td>
                      <td colspan="3"  valign="bottom"><input type="text" name="provider"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="400" ></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">จำนวนทุน&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><input name="number" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="6" maxlength="4"> 
                        <font class="insfont">&nbsp;&nbsp;ทุนละ&nbsp; 
                        <input name="money" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="12" maxlength="10">
                        &nbsp;บาท&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ระยะเวลา&nbsp; 
                        <input name="duration" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="4" maxlength="2">
                        &nbsp;ปี </font> </td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">วันที่ให้ทุน&nbsp;</font></td>
                      <td colspan="3" valign="bottom"><font class="insfont"> 
                        <select name="day">
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
                        <select name="month">
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
                        &nbsp;&nbsp;พ.ศ.&nbsp; <input name="year" type="text" size="6" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" maxlength="4">
                        </font></td>
                    </tr>
                    <tr> 
                      <td colspan="4" align="left" valign="bottom" height="30" bgcolor="#9999CC"><font class="header">&nbsp;เงื่อนไขการรับทุน</font></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">เงื่อนไขที่1&nbsp;</font></td>
                      <td colspan="3"><input type="text" name="condition1"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="500"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">เงื่อนไขที่2&nbsp;</font></td>
                      <td colspan="4"><input type="text" name="condition2"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="500"></td>
                    </tr>
                    <tr n> 
                      <td align="right" valign="bottom"><font class="insfont">เงื่อนไขที่3&nbsp;</font></td>
                      <td colspan="4"><input type="text" name="condition3"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="500"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">เงื่อนไขที่4&nbsp;</font></td>
                      <td colspan="4"><input type="text" name="condition4"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="500"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">เงื่อนไขที่5&nbsp;</font></td>
                      <td colspan="4"><input type="text" name="condition5"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="500"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">เงื่อนไขที่6&nbsp;</font></td>
                      <td colspan="4"><input type="text" name="condition6"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="500"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">เงื่อนไขที่7&nbsp;</font></td>
                      <td colspan="4"><input type="text" name="condition7"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="500"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">เงื่อนไขที่8&nbsp;</font></td>
                      <td colspan="4"><input type="text" name="condition8"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="500"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">เงื่อนไขที่9&nbsp;</font></td>
                      <td colspan="4"><input type="text" name="condition9"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="500"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">เงื่อนไขที่10&nbsp;</font></td>
                      <td colspan="4"><input type="text" name="condition10"  style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="80" maxlength="500" ></td>
                    </tr>
                  </table>
				  <br>
                  <input name="addScholarship" type="submit" value="&nbsp;&nbsp;&nbsp;บันทึก&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checks()">
				  &nbsp;&nbsp;
                  <input name="cancelAddScholarship" type="submit" value="&nbsp;&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" >
                </center>
				<br><br>
				</form>
          </td>
            <!-- Insert data -->
            <td width="1" rowspan="6" valign="top" background="image/verdotshort.gif"></td>
            <!-- Right -->
          </tr>          
        </table>         
        </table></td>    <!-- Cover Main Page-->
  </tr>
</table>
</center>
<script language="JavaScript">

		function checks(){        
			var v1 = document.addScholarshipForm.academicYear.value;
			var f 	= document.addScholarshipForm;
			
		    if ( v1.length!=4 ){
	           alert("กรุณาใส่ปีการศึกษา 4 หลัก");
    	       document.addScholarshipForm.academicYear.focus();
        	   return false;
        	}
			if( v1.length != 0 ){
				if(isNaN( v1 )){
					 alert("กรุณาใส่ข้่อมูลเป็นตัวเลขให้ถูกต้อง ");
    	      		 document.addScholarshipForm.academicYear.focus();
        	  		 return false;
				}
 			}
			if(f.number.value.lenght != 0){
				if(isNaN(f.number.value)){
					 alert("กรุณาใส่ข้่อมูลเป็นตัวเลขให้ถูกต้อง ");
    	      		 document.addScholarshipForm.number.focus();
        	  		 return false;
				}
 			}
			if(f.money.value.lenght != 0){
				if(isNaN(f.money.value)){
					 alert("กรุณาใส่ข้่อมูลเป็นตัวเลขให้ถูกต้อง ");
    	      		 document.addScholarshipForm.money.focus();
        	  		 return false;
				}
 			}
			if(f.duration.value.lenght != 0){
				if(isNaN(f.duration.value)){
					 alert("กรุณาใส่ข้่อมูลเป็นตัวเลขให้ถูกต้อง ");
    	      		 document.addScholarshipForm.duration.focus();
        	  		 return false;
				}
 			}
	/*		if( (f.year.value.lenght > 0 ) && (f.year.value.lenght < 4) ){ 
					 alert("กรุณาใส่ปีเป็นตัวเลข 4 หลักให้ถูกต้อง" );
    	      		 f.year.focus();
        	  		 return false;
 			}						*/
			if( f.year.value.lenght != 0 ){ 
				if( isNaN( f.year.value ) ){
					 alert("กรุณาใส่ปีเป็นตัวเลข 4 หลักให้ถูกต้อง" );
    	      		 f.year.focus();
        	  		 return false;
				}
 			}	
           return true;
		
		}	// end function checksID 		
		
		function checkType(){
			var v1 = document.addScholarshipForm;				
			var type = document.addScholarshipForm.scholarshipType;
			switch(type.selectedIndex){
					case 0	: {
							for (i=2;i<v1.length-2;i++){
									v1[i].disabled=false;
							}
							v1[2].value=""; 
							break;
					}
					case 1	: {
							for (i=2;i<v1.length-2;i++){
									v1[i].disabled=true; 									
							}							
							v1[2].value="ทุนสนับสนุนทำวิทยานิพนธ์"; 						
							break;
					}
					case 2	: {
							for (i=2;i<v1.length-2;i++){
									v1[i].disabled=true;									
							}							
							v1[2].value="ทุนเสนอบทความทางวิชาการ"; 							
							break;
					}
			} // end switch
				
		} // en function test
		
		

		
		
</script>	
</body>
</html>
