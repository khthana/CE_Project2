<%@ page contentType="text/html; charset=windows-874"%>
<%
	if(session.getAttribute("login")==null){
		response.sendRedirect("loginfail.jsp");
	}
%>
<html>
<head>
<title>บันทึกประวัตินักศึกษาที่สำเร็จการศึกษา</title>
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
                <form action="index.jsp" method="post" name="lecturerInfoForm" >
                <center>
                  			<table width="650" border="0" cellspacing="0" cellpadding="0">
  							<tr>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
  							</tr>
  							<tr>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
  							</tr>
  							<tr>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
    							<td>&nbsp;</td>
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
		function checksID(){        
			var v1 = document.addStdHistoryForm.stdID.value;
		    if ((v1.length==0)||(v1.length<8)){
	           alert("กรุณาใส่รห ัสนักศึกษา 8 ตัว ให้ถูกต้อง");
    	       document.addStdHistoryForm.stdID.focus();
        	   return false;
        	}
		 else
           return true;
		}	// end function checksID
		
		function TitleChange(){
			var f=document.addAlumniForm;	
			var title=document.addAlumniForm.stdtitle;
			switch(title.selectedIndex){
					case 0	: {f.sex[0].checked=false;f.sex[0].checked=false;break;}
					case 1	: {f.sex[0].checked=true; break;}
					case 2	: {f.sex[1].checked=true;break;}
					case 3	: {f.sex[1].checked=true; break;}
					case 4	: {var tmp=prompt("กรอกคำนำหน้าชื่อ ","");title.options[4].text=(tmp==null)?"อื่นๆ":tmp;f.sex[0].checked=false;f.sex[0].checked=false;}
			}
		}	// end function TitleChange
		
</script>
</body>
</html>
