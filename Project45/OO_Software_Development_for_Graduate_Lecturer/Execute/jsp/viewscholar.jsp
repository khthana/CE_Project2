<%@ page contentType="text/html; charset=windows-874"%>
<%
	if(session.getAttribute("login")==null){
		response.sendRedirect("loginfail.jsp");
	}
%>
<html>
<head>
<title>ดูรายชื่อนักศึกษาที่ได้รับทุน</title>
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
            		<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;ทุนการศึกษา&nbsp;>>&nbsp;ดูรายชื่อนักศึกษาที่ได้รับทุน</font></td>
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
                    <td valign="middle" align="center" ><font class="topic">ดูรายชื่อนักศึกษาที่ได้รับทุน</font></td>
                  </tr>
                </table>
              </center>				
                <form action="servlet/scholarshipWork" method="post" name="viewScholarForm" >
                <center>
                  			
                  <table width="650" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td colspan="5" height="31" bgcolor="#9999CC"><font class="header">&nbsp;ระบุรหัสทุน</font></td>
                    </tr>
                    <tr> 
                      <td colspan="5" align="right" valign="bottom" height="10"></td>
                    </tr>                    
                    <tr> 
                      <td width="138" align="right" valign="bottom"><font class="insfont">รหัสทุน&nbsp;</font></td>
                      <td width="87" align="left" valign="bottom"><input name="scholarshipID" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="10" maxlength="8"></td>
                      <td width="72">&nbsp;</td>
                      <td width="222">&nbsp;</td>
                      <td width="131" align="left" valign="bottom"><input type="submit" name="listScholarFromSchshipID" value="&nbsp;&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkScholarshipID()"></td>
                    </tr>
                    <tr> 
                      <td colspan="5" align="right" valign="bottom" height="10"></td>
                    </tr>
					 <tr> 
                      <td colspan="5" height="31" bgcolor="#9999CC"><font class="header">&nbsp;ระบุปีการศึกษา</font></td>
                    </tr>
					<tr> 
                      <td colspan="5" align="right" valign="bottom" height="10"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td align="left" valign="bottom"><input name="academicYear" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="10" maxlength="4"></td>
                      <td align="right" valign="bottom"><font class="insfont">&nbsp;</font></td>
                      <td>&nbsp;</td>
                      <td align="left" valign="bottom"><input type="submit" name="listScholarFromYear" value="&nbsp;&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkAcademicYear( )"></td>
                    </tr>
                    <tr> 
                      <td colspan="5" align="right" valign="bottom" height="10"></td>
                    </tr>
                    <tr> 
                      <td colspan="5" height="31" bgcolor="#9999CC"><font class="header">&nbsp;ระบุรหัสนักศึกษา</font></td>
                    </tr>
                    <tr> 
                      <td colspan="5" align="right" valign="bottom" height="10"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">รหัสนักศึกษา&nbsp;</font></td>
                      <td align="left" valign="bottom"><input name="stdID" type="text" style="BORDER: #2B2C6F thin solid;COLOR:#000000;" size="10" maxlength="8"></td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td align="left" valign="bottom"><input type="submit" name="listScholarFromStdID" value="&nbsp;&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkStdID( )"></td>
                    </tr>                   
                    <tr> 
                      <td colspan="5" align="right" valign="bottom" height="10"></td>
                    </tr>
                    <tr> 
                      <td colspan="5" align="right" valign="bottom" height="3" bgcolor="#9999CC"></td>
                    </tr>
                  </table>	
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
		function checkStdID(){
			var v1 = document.viewScholarForm.stdID.value;
			
			if( v1.length !=8 ){
					 alert("กรุณาใส่รหัสนักศึกษาเป็นตัวเลข 8 หลัก");
    	      		 document.viewScholarForm.stdID.focus();
        	  		 return false;
			}
			if( v1.length != 0){
				if(isNaN(v1)){
					  alert("กรุณาใส่รหัสนักศึกษาเป็นตัวเลข 8 หลัก");
    	      		 document.viewScholarForm.stdID.focus();
        	  		 return false;
				}
 			}
			return true;
		}	// end  checkStdID()
		
		function checkScholarshipID(){
			var v1 = document.viewScholarForm.scholarshipID.value;
			
			if( v1.length==0 ){
					 alert("กรุณาใส่รหัสทุนการศึกษา ");
    	      		 document.viewScholarForm.scholarshipID.focus();
        	  		 return false;
			}
			if( v1.length != 0){
				if(isNaN(v1)){
					  alert("กรุณาใส่รหัสนทุน เป็นตัวเลข ");
    	      		 document.viewScholarForm.scholarshipID.focus();
        	  		 return false;
				}
 			}
			return true;
		}	// end  checkScholarshipID()
		
		
		function checkAcademicYear( ){			
			var v1 = document.viewScholarForm.academicYear.value;
			if( v1.length!=4 ){
					 alert("กรุณาใส่ปีการศึกษาเป็นตัวเลข 4 หลัก ");
    	      		 document.viewScholarForm.academicYear.focus();
        	  		 return false;
			}
			if( v1.length != 0){
				if(isNaN(v1)){
					 alert("กรุณาใส่ปีการศึกษาเป็นตัวเลข 4 หลัก ");
    	      		document.viewScholarForm.academicYear.focus();
        	  		return false;
				}
 			}
			return true;
		}	// end   checkAcademicYear()		
		
</script>
</body>
</html>
