<%@ page import="myutil.thaiLanguage,alumni.checkFinish" contentType="text/html; charset=windows-874"%>
<%		
		if(session.getAttribute("login")==null){
			response.sendRedirect("loginfail.jsp");
			session.removeAttribute("login");
		}
		checkFinish cf=new checkFinish();
		if(session.getAttribute("finishInfo")!=null){
			cf=(checkFinish)session.getAttribute("finishInfo");
			session.removeAttribute("finishInfo");
		}
		
%>
<html>
<head>
<title>อนุมัติจบการศึกษา</title>
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
            			<td width="670" align="left" valign="bottom"><font class="pathfont">&nbsp;&nbsp;<a href="home.jsp" class="pathlink2">Home</a>&nbsp;>>&nbsp;สำเร็จการศึกษา&nbsp;>>&nbsp;อนุมัติจบการศึกษา</font></td>
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
                    <td valign="middle" align="center" ><font class="topic">อนุมัติจบการศึกษา</font></td>
                  </tr>
                </table>
              </center>				
                <form action="servlet/alumniWork" method="post" name="checkFinishForm" >
                <center>
                  <table width="650" border="0" cellspacing="0" cellpadding="0" >
                    <tr> 
                      <td colspan="3" align="left" valign="bottom"height="30" bgcolor="#9999CC" ><font class="header">&nbsp;&nbsp;ระบุรหัสนักศึกษา</font></td>
                    </tr>
                    <tr> 
                      <td width="166" align="right" valign="bottom" height="10"></td>
                      <td width="306" align="left" valign="bottom"></td>
                      <td width="178" align="left"  valign="bottom"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom"><font class="insfont">รหัสนักศึกษา&nbsp;</font></td>
                      <td width="306" align="left" valign="bottom"><input type="text" name="stdID" style="BORDER:#2B2C6F thin solid;COLOR:#000000; <%if( !cf.getStdID().equals("")) out.print("BACKGROUND:#DCEBF7;"); %>" size="10" maxlength="8" <%if( !cf.getStdID().equals("")) out.print("value=\""+cf.getStdID()+"\" readonly=\"true\""); %> ></td>
                      <td width="178" align="left"  valign="bottom"><input name="getCheckFinish" type="submit" value="&nbsp;&nbsp;&nbsp;&nbsp;ตกลง&nbsp;&nbsp;&nbsp;&nbsp;" style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checksID()"></td>
                    </tr>
                    <tr> 
                      <td align="right" valign="bottom" height="10"></td>
                      <td width="306" align="left" valign="bottom"></td>
                      <td width="178" align="left"  valign="bottom"></td>
                    </tr>
                    <tr> 
                      <td colspan="3" align="right" valign="bottom" height="3" bgcolor="#9999CC"></td>
                    </tr>
                  </table>
				  <% 
				  			if( !cf.getStdID().equals("")){
							
								out.println("<br><table width=\"650\" border=\"1\" cellspacing=\"0\" cellpadding=\"0\" bordercolor=\"#E8EBF6\">\n"+
                    								"<tr> \n"+
													"	<td align=\"right\" valign=\"bottom\" width=\"200\"   bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>ชื่อ</b>&nbsp;</font></td>\n"+
                				      				"	<td width=\"450\" align=\"left\" valign=\"bottom\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">"+cf.getTitle()+cf.getName()+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+cf.getSurname()+"</font></td>\n"+                      
                    								"</tr>\n"+
													"<tr> \n"+
													"	<td align=\"right\" valign=\"bottom\"    bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>ศึกษาอยู่หลักศูตร</b>&nbsp;</font></td>\n"+
                				      				"	<td    align=\"left\" valign=\"bottom\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">"+cf.getCourseName()+"</font></td>\n"+                      
                    								"</tr>\n"+								
													"<tr> \n"+
													"	<td align=\"right\" valign=\"bottom\"    bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>สาขา</b>&nbsp;</font></td>\n"+
                				      				"	<td    align=\"left\" valign=\"bottom\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">"+cf.getMajorName()+"</font></td>\n"+                      
                    								"</tr>\n"+								
													"<tr> \n"+
													"	<td align=\"right\" valign=\"bottom\"    bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>คณะ</b>&nbsp;</font></td>\n"+
                				      				"	<td    align=\"left\" valign=\"bottom\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">"+cf.getFactName()+"</font></td>\n"+                      
                    								"</tr>\n"+								
													"<tr> \n"+
													"	<td align=\"right\" valign=\"bottom\"    bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>ภาควิชา</b>&nbsp;</font></td>\n"+
                				      				"	<td    align=\"left\" valign=\"bottom\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">"+cf.getDeptName()+"</font></td>\n"+                      
                    								"</tr>\n"+
													"<tr> \n"+
													"	<td align=\"right\" valign=\"bottom\"    bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>GPA </b>&nbsp;</font></td>\n"+
                				      				"	<td    align=\"left\" valign=\"bottom\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">"+cf.getGPA()+"</font></td>\n"+                      
                    								"</tr>\n"+
													"<tr> \n"+
                				      				"	<td align=\"right\" valign=\"top\" bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>หัวข้อวิทยานิพนธ์( ไทย )</b>&nbsp;</font></td>\n"+
                      								"	<td align=\"left\" valign=\"top\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">"+cf.getTopic_th()+"</font></td>\n"+                      
                    								"</tr>\n"+
													"<tr> \n"+
                				      				"	<td align=\"right\" valign=\"top\" bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>หัวข้อวิทยานิพนธ์( อังกฤษ )</b>&nbsp;</font></td>\n"+
                      								"	<td align=\"left\" valign=\"top\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">"+cf.getTopic_en()+"</font></td>\n"+                      
	                  								"</tr>\n"+													
				                    				"<tr> \n"+
                				      				"	<td align=\"right\" valign=\"bottom\" bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>ส่งวิทยานิพนธ์</b>&nbsp;</font></td>\n"+
                      								"	<td align=\"left\" valign=\"bottom\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">"+cf.getThesisComplete()+"</font></td>\n"+                      
                    								"</tr>\n");
				                  				
									if(cf.getAlumniStatus().equals("A") ){	//   จบการศึกษาไปแล้ว
													out.println("<tr> \n"+
                				      				"	<td align=\"right\" valign=\"bottom\" bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>สถานะการศึกษา</b>&nbsp;</font></td>\n"+
                      								"	<td align=\"left\" valign=\"bottom\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">สำเร็จการศึกษาแล้ว</font></td>\n"+                      
                    								"</tr>\n");
									}
									else{		//   ยังศึกษาอยู่
													out.println("<tr> \n"+
                				      				"	<td align=\"right\" valign=\"bottom\" bgcolor=\"#CAD1F8\"><font class=\"insfont\"><b>สถานะการศึกษา</b>&nbsp;</font></td>\n"+
                      								"	<td align=\"left\" valign=\"bottom\" bgcolor=\"#E1E5F9\"><font class=\"insfont\">กำลังศึกษาอยู่</font></td>\n"+                      
                    								"</tr>\n");
									}
									
									out.println("</table>\n");
									out.println("<br><input type=\"hidden\" name=\"academicYear\" value=\"\">\n ");
									if( !cf.getAlumniStatus().equals("A") ){	// ยังศึกษาอยู่
											out.println("<input name=\"approveFinish\" type=\"submit\" value=\"&nbsp;&nbsp;อนุมัติจบ&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\" >\n"+
																"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n");
									}
									out.println("<input name=\"cancelFinish\" type=\"submit\" value=\"&nbsp;&nbsp;&nbsp;&nbsp;ยกเลิก&nbsp;&nbsp;&nbsp;&nbsp;\" style=\"BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;\" >\n" );
							}
				  %>
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
		function checksID(){        
			var v1 = document.checkFinishForm.stdID.value;
		    if ( v1.length!=8 ){
	           		alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8 หลักให้ถูกต้อง");
    	       		document.checkFinishForm.stdID.focus();
        	   		return false;
        	}
			if( v1.length != 0){
				if(isNaN(v1)){
	           			alert("กรุณาใส่รห ัสนักศึกษาเป็นตัวเลข 8 หลักให้ถูกต้อง");
    	       			document.checkFinishForm.stdID.focus();
        	  		 	return false;
				}
 			}
           return true;
		}	// end function checksID	
		
</script>
</body>
</html>
