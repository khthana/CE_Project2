<%@ page contentType="text/html; charset=windows-874"%>
<%
	if(session.getAttribute("login")==null){
		response.sendRedirect("loginfail.jsp");
	}
%>
<html>
<head>
<title>ดูข้อมูลอาจารย์บัณฑิต</title>
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
						<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;อาจารย์บัณฑิต&nbsp;>>&nbsp;ดูข้อมูลอาจารย์บัณฑิต</font></td>
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
                    <td valign="middle" align="center" class="topic">ดูข้อมูลอาจารย์บัณฑิต</td>
                  </tr>
                </table>
              </center>				
                <form action="servlet/lecturerInfo" method="post" name="lecturerInfoForm" >
                <center>
                  <table width="650" border="0" bordercolor="#9966CC" cellspacing="0" cellpadding="0" rules="rows">
                    <tr> 
                      <td colspan="5" bgcolor="#9999CC" height="30"><font class="header">&nbsp;&nbsp;ระบุรหัสอาจารย์</font></td>
                    </tr>
                    <tr> 
                      <td colspan="5"  height="10"></td>
                    </tr>
                    <tr> 
                      <td width="90"  align="right" valign="bottom"><font class="insfont">รหัสอาจารย์&nbsp;</font></td>
                      <td  align="left" valign="bottom"> <input type="text" name="lecturerID" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" maxlength="8" size="10"></td>
                      <td colspan="2">&nbsp;</td>
                      <td width="125"><input type="submit" name="idok" value="    ตกลง    " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checksLecID()"></td>
                    </tr>
                    <tr> 
                      <td colspan="5"  height="10"></td>
                    </tr>
                    <tr> 
                      <td colspan="5" bgcolor="#9999CC" height="30"><font class="header" >&nbsp;&nbsp;ระบุชื่อ 
                        - นามสกุลอาจารย์</font></td>
                    </tr>
                    <tr> 
                      <td colspan="5"  height="10"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">ชื่อ&nbsp;</font></td>
                      <td align="left" valign="bottom"><input type="text" name="name" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" size="25"></td>
                      <td width="49" align="right" valign="bottom"><font class="insfont">นาสกุล&nbsp;</font></td>
                      <td width="209" valign="bottom" align="left"><input type="text" name="surname" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" maxlength="8" size="25"></td>
                      <td><input type="submit" name="nameok" value="    ตกลง    " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkLecName()"></td>
                    </tr>
                    <tr> 
                      <td colspan="5"  height="10"></td>
                    </tr>
                    <tr> 
                      <td colspan="5" bgcolor="#9999CC" height="30"><font class="header">&nbsp;&nbsp;ระบุคณะ</font></td>
                    </tr>
                    <tr> 
                      <td colspan="5" height="10"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">คณะ&nbsp;</font></td>
                      <td colspan="2" ><font class="insfont"> 
                        <select name="fact" >
                          <option value="01" selected>วิศวกรรมศาสตร์&nbsp;</option>
                          <option value="02">สถาปัตยกรรมศาสตร์&nbsp;</option>
                          <option value="03">ครุศาสตร์อุตสาหกรรม&nbsp;</option>
                          <option value="04">วิทยาศาสตร์&nbsp;</option>
                          <option value="05">เทคโนโลยีการเกษตร&nbsp;</option>
                          <option value="06">โครงการคณะอุตสาหกรรมเกษตร&nbsp;</option>
                          <option value="07">เทคโนโลยีสารสนเทศ&nbsp;</option>
                        </select>
                        </font></td>
                      <td >&nbsp;</td>
                      <td ><input type="submit" name="factok" value="    ตกลง    " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;"></td>
                    </tr>
                    <tr> 
                      <td colspan="5" height="10"></td>
                    </tr>
                  </table>				 
				  <table width="650" border="0" cellspacing="0" cellpadding="0">
  				  <tr>
    					<td height="3"  bgcolor="#9999CC"></td>
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
		function checksLecID(){        
			var v1 = document.lecturerInfoForm.lecturerID.value;
		    if ( v1.length!=8 ){
	           alert("กรุณาใส่รห ัสอาจารย์ 8 หลักให้ถูกต้อง");
    	       document.lecturerInfoForm.lecturerID.focus();
        	   return false;
        	}
		 else
           return true;
		}	// end function checksID
		
		function checkLecName(){        
			var v1 = document.lecturerInfoForm.name.value;
			var v2 = document.lecturerInfoForm.surname.value;
		    if ( v1.length==0 ){
	           alert("กรุณาใส่ชื่อ");
    	       document.lecturerInfoForm.name.focus();
        	   return false;
        	}
			 if ( v2.length==0 ){
	           alert("กรุณาใส่นามสกุล");
    	       document.lecturerInfoForm.surname.focus();
        	   return false;
        	}
		 else
           return true;
		}	// end function checksID
		
</script>
</body>
</html>
