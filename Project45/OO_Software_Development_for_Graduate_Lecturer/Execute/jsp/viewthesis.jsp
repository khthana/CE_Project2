<%@ page contentType="text/html; charset=windows-874"%>
<%
	if(session.getAttribute("login")==null){
		response.sendRedirect("loginfail.jsp");
	}
%>
<html>
<head>
<title>ดูหัวข้อวิทยานิพนธ์</title>
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
						<td width="670" align="left" valign="bottom"><font class="pathfont"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;วิทยานิพนธ์&nbsp;>>&nbsp;ดูหัวข้อวิทยานิพนธ์</font></font></td>
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
                    <td valign="middle" align="center" class="topic">ดูหัวข้อวิทยานิพนธ์</td>
                  </tr>
                </table>
              </center>				
                <form action="servlet/thesisWork" method="post" name="viewThesisForm" >
                <center>
						
                  <table width="650" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td colspan="6" bgcolor="#9999CC" height="30"><font class="header">&nbsp;&nbsp;ระบุปีการศึกษา 
                        และ คณะ</font></td>
                    </tr>
                    <tr> 
                      <td colspan="6" height="10"></td>
                    </tr>
                    <tr> 
                      <td width="34">&nbsp;</td>
                      <td width="95" align="right" valign="bottom"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td width="100" valign="bottom"><input type="text" name="academicyear" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" maxlength="4" size="10"></td>
                      <td width="39" align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                      <td width="235" align="left" valign="bottom"><select name="faculty">
                          <option value="01" >วิศวกรรมศาสตร์&nbsp;</option>
                          <option value="02" >สถาปัตยกรรมศาสตร์&nbsp;</option>
                          <option value="03" >ครุศาสตร์อุตสาหกรรม&nbsp;</option>
                          <option value="04" >วิทยาศาสตร์&nbsp;</option>
                          <option value="05" >เทคโนโลยีการเกษตร&nbsp;</option>
                          <option value="06" >โครงการคณะอุตสาหกรรมเกษตร</option>
                          <option value="07" >เทคโนโลยีสารสนเทศ&nbsp;</option>
                        </select></td>
                      <td width="147"><input type="submit" name="viewfromYF" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkYear()"></td>
                    </tr>
                    <tr> 
                      <td colspan="6" height="10"></td>
                    </tr>
                    <tr> 
                      <td colspan="6" bgcolor="#9999CC" height="30"><font class="header">&nbsp;&nbsp;ระบุรหัสนักศึกษา</font></td>
                    </tr>
                    <tr> 
                      <td colspan="6" height="10"></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                      <td align="right"  valign="bottom"><font class="insfont">รหัสนักศึกษา&nbsp;</font></td>
                      <td colspan="2"><input type="text" name="stdID" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" maxlength="8" size="10"></td>
                      <td>&nbsp;</td>
                      <td><input type="submit" name="viewfromstdID" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkStdID()"></td>
                    </tr>
                    <tr> 
                      <td colspan="6" height="10"></td>
                    </tr>
                    <tr> 
                      <td colspan="6" bgcolor="#9999CC" height="30"><font class="header">&nbsp;&nbsp;ระบุรหัสวิทยานิพนธ์</font></td>
                    </tr>
                    <tr> 
                      <td colspan="6" height="10"></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                      <td align="right"  valign="bottom"><font class="insfont">รหัสวิทยานิพนธ์&nbsp;</font></td>
                      <td colspan="2"><input type="text" name="thesisID" style="BORDER:#2B2C6F thin solid;COLOR:#000000;"  size="10"></td>
                      <td>&nbsp;</td>
                      <td><input type="submit" name="viewfromthesisID" value="  ตกลง  " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkThesisID()"></td>
                    </tr>
                    <tr> 
                      <td colspan="6" height="10"></td>
                    </tr>
                   
                    <tr> 
                      <td colspan="6" height="3" bgcolor="#9999CC"></td>
                    </tr>                   
                  </table>

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
				
			function checkYear(){
			var f = document.viewThesisForm;
			if(f.academicyear.value.length!=4){
					alert("กรุณาใส่ปีการศึกษาเป็นตัวเลข 4 หลักให้ถูกต้อง");
    	      		f.academicyear.focus();
        	   		return false;
			}
			if(f.academicyear.value.lenght != 0){
				if(isNaN(f.academicyear.value)){
					alert("กรุณาใส่ปีการศึกษาเป็นตัวเลขให้ถูกต้อง");
    	      		 document.viewThesisForm.academicyear.focus();
        	  		 return false;
				}
 			}
					return true;
			
		} //end functin checkYear
		
		function checkStdID(){
			var f = document.viewThesisForm;
			if(f.stdID.value.length!=8){
					alert("กรุณาใส่รหัสนักศึกษาเป็นตัวเลข  8 หลักให้ถูกต้อง");
    	      		f.stdID.focus();
        	   		return false;
			}
			if( f.stdID.value.length != 0){
				if(isNaN(f.stdID.value)){
					 alert("กรุณาใส่รหัสนักศึกษาเป็นตัวเลข  8 หลักให้ถูกต้อง");
    	      		 f.stdID.focus();
        	  		 return false;
				}
 			}
					return true;
			
		} //end functin checkStdID
		
		function checkThesisID(){
			var f = document.viewThesisForm;
			if(f.thesisID.value.length==0){
					alert("กรุณาใส่รหัสวิทยานิพนธ์ เป็นตัวเลขให้ถูกต้อง");
    	      		f.thesisID.focus();
        	   		return false;
			}
			if(f.thesisID.value.lenght != 0){
				if(isNaN(f.thesisID.value)){
					alert("กรุณาใส่รหัสวิทยานิพนธ์ เป็นตัวเลขให้ถูกต้อง");
    	      		 document.viewThesisForm.thesisID.focus();
        	  		 return false;
				}
 			}
					return true;
			
		} //end functin checkThesisID
		
		function checkLecturerID(){
			var f = document.viewThesisForm;
			if(f.lecturerID.value.length==0){
					alert("กรุณาใส่รหัสอาจารย์ ");
    	      		f.lecturerID.focus();
        	   		return false;
			}
					return true;
			
		} //end functin checkLecturerID
		
</script>
</body>
</html>
