<%@ page contentType="text/html; charset=windows-874"%>
<%
	if(session.getAttribute("login")==null){
		response.sendRedirect("loginfail.jsp");
	}
%>
<html>
<head>
<title>ดูประวัติผู้สำเร็จการศึกษา</title>
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
						<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;ผู้สำเร็จการศึกษา&nbsp;>>&nbsp;ดูประวัติผู้สำเร็จการศึกษา</font></td>
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
                    <td valign="middle" align="center" class="topic">ดูประวัติผู้สำเร็จการศึกษา</td>
                  </tr>
                </table>
              </center>				
                <form action="servlet/alumniWork" method="post" name="viewAlumniForm" >
                <center>
				    <table width="650" border="0" cellspacing="0" cellpadding="0"  rules="rows" >
                    <tr> 
                      <td colspan="5" height="30" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;&nbsp;ระบุรหัสนักศึกษา</font></td>
                    </tr>
                    <tr> 
                      <td colspan="5"  height="10" ></td>
                    </tr>
                    <tr> 
                      <td width="126" align="right" valign="bottom"><font class="insfont">รหัสนักศึกษา&nbsp;</font></td>
                      <td width="91" align="left" valign="bottom"><input type="text" name="stdID" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="10" maxlength="8"></td>
                      <td width="57">&nbsp;</td>
                      <td width="213">&nbsp;</td>
                      <td width="151"><input type="submit" name="viewAlumniFromStdID" value="   ตกลง   "  style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkStdID()"></td>
                    </tr>
                    <tr> 
                      <td colspan="5"  height="10"></td>
                    </tr>
                    <tr> 
                      <td colspan="5" height="30" bgcolor="#9999CC" valign="bottom"><font class="header">&nbsp;&nbsp;ระบุปีการศึกษาและคณะ</font></td>
                    </tr>
					<tr> 
                      <td colspan="5"  height="10"></td>
                    </tr>
                    <tr> 
                      <td align="right"  valign="bottom"><font class="insfont">ปีการศึกษา&nbsp;</font></td>
                      <td valign="bottom" align="left"><input type="text" name="academicYear" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="10" maxlength="4"></td>
                      <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                      <td><font class="insfont">
                        <select name="fact" >
                          <option value="วิศวกรรมศาสตร์" selected>วิศวกรรมศาสตร์&nbsp;</option>
                          <option value="สถาปัตยกรรมศาสตร์">สถาปัตยกรรมศาสตร์&nbsp;</option>
                          <option value="ครุศาสตร์อุตสาหกรรม">ครุศาสตร์อุตสาหกรรม&nbsp;</option>
                          <option value="วิทยาศาสตร์">วิทยาศาสตร์&nbsp;</option>
                          <option value="เทคโนโลยีการเกษตร">เทคโนโลยีการเกษตร&nbsp;</option>
                          <option value="โครงการคณะอุตสาหกรรมเกษตร">โครงการคณะอุตสาหกรรมเกษตร&nbsp;</option>
                          <option value="เทคโนโลยีสารสนเทศ">เทคโนโลยีสารสนเทศ&nbsp;</option>
                        </select>
                        </font></td>
                      <td><input type="submit" name="viewAlumniFromYF" value="   ตกลง   "  style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkYear()"></td>
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
		function checkStdID(){        
			var v1 = document.viewAlumniForm.stdID.value;
		    if ( v1.length!=8 ){
	           alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8  หลัก ให้ถูกต้อง");
    	       document.viewAlumniForm.stdID.focus();
        	   return false;
        	}
			if( v1.length != 0){
				if(isNaN(v1)){
	           alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8  หลัก ให้ถูกต้อง");
    	       document.viewAlumniForm.stdID.focus();
        	  		 return false;
				}
 			}
			return true;
		}	// end function checksID
		
		function checkYear(){        
			var v1 = document.viewAlumniForm.academicYear.value;
			
		    if ( v1.length!=4 ){
	           alert("กรุณาใส่ปีการศึกษา เป็นตัวเลข 4 หลัก ให้ถูกต้อง");
    	       document.viewAlumniForm.academicYear.focus();
        	   return false;
        	}	
			if( v1.length != 0){
				if(isNaN(v1)){
					 alert("กรุณาใส่ปีการศึกษา เป็นตัวเลข 4 หลัก ให้ถูกต้อง");
    	      		 document.viewAlumniForm.academicYear.focus();
        	  		 return false;
				}
 			}		
		 	else
           		return true;
		}	// end function checksID		
</script>
</body>
</html>
