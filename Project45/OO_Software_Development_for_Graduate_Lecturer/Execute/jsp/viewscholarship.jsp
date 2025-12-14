<%@ page contentType="text/html; charset=windows-874"%>
<%
	if(session.getAttribute("login")==null){
		response.sendRedirect("loginfail.jsp");
	}
%>
<html>
<head>
<title>ดูข้อมูลทุนการศึกษา</title>
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
						
            <td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;ทุนการศึกษา&nbsp;>>&nbsp;ดูข้อมูลทุนการศึกษา</font></td>
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
                    <td valign="middle" align="center" ><font class="topic">ดูข้อมูลทุนการศึกษา</font></td>
                  </tr>
                </table>
              </center>				
                <form action="servlet/scholarshipWork" method="post" name="viewScholarshipForm" >
                <center>
                  	<table width="650" border="0" cellspacing="0" cellpadding="0"  rules="rows" >
                    <tr> 
                      <td colspan="5" height="30" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;&nbsp;ระบุรหัสทุนการศึกษา</font></td>
                    </tr>
                    <tr> 
                      <td colspan="5"  height="10" ></td>
                    </tr>
                    <tr> 
                      <td width="126" align="right" valign="bottom"><font class="insfont">รหัสทุนการศึกษา&nbsp;</font></td>
                      <td width="91" align="left" valign="bottom"><input type="text" name="scholarshipID" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="10" maxlength="8"></td>
                      <td width="57">&nbsp;</td>
                      <td width="213">&nbsp;</td>
                      <td width="151"><input type="submit" name="viewScholarship" value="   ตกลง   "  style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checksScholarshipID()"></td>
                    </tr>
                    <tr> 
                      <td colspan="5"  height="10"></td>
                    </tr>
                    <tr> 
                      <td colspan="5" height="30" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;&nbsp;ระบุปีการศึกษา</font></td>
                    </tr>
					<tr> 
                      <td colspan="5"  height="10"></td>
                    </tr>
                    <tr> 
                      <td align="right"  valign="bottom"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td valign="bottom" align="left"><input type="text" name="academicYear" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="10" maxlength="4"></td>
                      <td align="right" valign="bottom"><font class="insfont">&nbsp;</font></td>
                      <td><font class="insfont">&nbsp; </font></td>
                      <td><input type="submit" name="listScholarship" value="   ตกลง   "  style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checksAcademicYear()"></td>
                    </tr>
					<tr> 
                      <td colspan="5"  height="10"></td>
                    </tr>
					<tr> 
                      <td colspan="5"  height="3" bgcolor="#9999CC"></td>
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
		function checksScholarshipID(){        
			var v1 = document.viewScholarshipForm.scholarshipID.value;
			var f = document.viewScholarshipForm;
		    if ( v1.length==0 ){
	           alert("กรุณาใส่รห ัสทุน");
    	       f.scholarshipID.focus();
        	   return false;
        	}
			if(f.scholarshipID.value.lenght != 0){
				if(isNaN(f.scholarshipID.value)){
					alert("กรุณาใส่รหัสทุน เป็นตัวเลขให้ถูกต้อง");
    	      		 f.scholarshipID.focus();
        	  		 return false;
				}
 			}
           return true;
		}	// end function checksScholarshipID
		
		function checksAcademicYear(){        
			var v1 = document.viewScholarshipForm.academicYear.value;
			var f = document.viewScholarshipForm;
		    if ( v1.length !=4 ){
					alert("กรุณาใส่ปีการศึกษาเป็นตัวเลข 4 หลัก ให้ถูกต้อง");
					f.academicYear.focus();
        	   return false;
        	}
			if(f.academicYear.value.lenght != 0){
				if(isNaN(f.academicYear.value)){
					alert("กรุณาใส่ปีการศึกษาเป็นตัวเลข 4 หลัก ให้ถูกต้อง");
    	      		 f.academicYear.focus();
        	  		 return false;
				}
 			}
           return true;
		}	// end function checksScholarshipID
		
		
</script>
</body>
</html>
