<%@ page contentType="text/html; charset=windows-874"%>
<html>
<head>
<title>ทำเนียบอาจารย์บัณฑิต</title>
<script language=javascript1.2 SRC="javascript/inslecturer.js">
</script>

<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="stylesheet/lecturer.css" rel="stylesheet" type="text/css">
</head>

<body leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0">
<center>
  <table width="780" border="0" cellspacing="0" cellpadding="0" background="image/background.gif" height="100%">
    <tr>
		<td valign="top" height="30"></td>
	</tr>
  	<tr>
		<td valign="top" height="113" background="image/lecturerband.gif">
		</td>
	</tr>
	<tr>		
      <td  valign="middle" height="28">&nbsp; </td>
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
					
                <table width="650" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td colspan="3" align="center" ><font  class="topic">บัณฑิตวิทยาลัย</font></td>
                  </tr>
                  <tr> 
                    <td colspan="3" align="center"><font class="topic">สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</font></td>
                  </tr>
                  <tr> 
                    <td width="258">&nbsp;</td>
                    <td width="292">&nbsp;</td>
                    <td width="100">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                    <td><a href="servlet/lecturerInfo?stdGetFactID=01" class="mylink">คณะวิศวกรรมศาสตร์</a></td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                    <td><a href="servlet/lecturerInfo?stdGetFactID=02" class="mylink">คณะสถาปัตยกรรมศาสตร์</a></td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                    <td><a  href="servlet/lecturerInfo?stdGetFactID=03" class="mylink">คณะครุศาสตร์อุตสาหกรรม</a></td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                    <td><a href="servlet/lecturerInfo?stdGetFactID=04" class="mylink">คณะวิทยาศาสตร์</a></td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                    <td><a  href="servlet/lecturerInfo?stdGetFactID=05" class="mylink">คณะเทคโนโลยีการเกษตร</a></td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                    <td><a  href="servlet/lecturerInfo?stdGetFactID=06" class="mylink">โครงการคณะอุตสาหกรรมเกษตร</a></td>
                    <td>&nbsp;</td>
                  </tr>
                  <tr> 
                    <td>&nbsp;</td>
                    <td><a  href="servlet/lecturerInfo?stdGetFactID=07" class="mylink">คณะเทคโนโลยีสารสนเทศ</a></td>
                    <td>&nbsp;</td>
                  </tr>
                </table>

                </center>
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
