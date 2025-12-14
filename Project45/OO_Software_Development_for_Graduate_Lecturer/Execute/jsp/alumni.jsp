<%@ page contentType="text/html; charset=windows-874"%>
<html>
<head>
<title>ทำเนียบผู้สำเร็จการศึกษา</title>
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
		<td valign="top" height="113" background="image/alumniband.gif">
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
				<form name="alumniForm" method="post" action="servlet/alumniWork">
                <table width="650" border="0" cellspacing="0" cellpadding="0">
                  <tr> 
                    <td colspan="5" align="center" ><font  class="topic">บัณฑิตวิทยาลัย</font></td>
                  </tr>
                  <tr> 
                    <td colspan="5" align="center"><font class="topic">สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง</font></td>
                  </tr>
                  <tr> 
                    <td width="140">&nbsp;</td>
                    <td width="93">&nbsp;</td>
                    <td width="53">&nbsp;</td>
                    <td  >&nbsp;</td>
                    <td width="150">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td align="right" valign="bottom"><font class="myfont">ปีการศึกษา&nbsp;</font></td>
                    <td align="left" valign="bottom"><input type="text" name="academicYear" style="BORDER:#2B2C6F thin solid;COLOR:#000000;" maxlength="4" size="10"></td>
                    <td align="right" valign="bottom"><font class="myfont">คณะ&nbsp;</font></td>
                    <td width="214"><font class="insfont">
                      <select name="factName" >
                        <option value="วิศวกรรมศาสตร์" selected>วิศวกรรมศาสตร์&nbsp;</option>
                        <option value="สถาปัตยกรรมศาสตร์">สถาปัตยกรรมศาสตร์&nbsp;</option>
                        <option value="ครุศาสตร์อุตสาหกรรม">ครุศาสตร์อุตสาหกรรม&nbsp;</option>
                        <option value="วิทยาศาสตร์">วิทยาศาสตร์&nbsp;</option>
                        <option value="เทคโนโลยีการเกษตร">เทคโนโลยีการเกษตร&nbsp;</option>
                        <option value="โครงการคณะอุตสาหกรรมเกษตร">โครงการคณะอุตสาหกรรมเกษตร&nbsp;</option>
                        <option value="เทคโนโลยีสารสนเทศ">เทคโนโลยีสารสนเทศ&nbsp;</option>
                      </select>
                      </font></td>
                    <td width="150"><input type="submit" name="getListAlumni" value="    ตกลง    " style="BORDER:#2B2C6F thin solid;BACKGROUND-COLOR:#BECFF0;COLOR:#000000;" onClick="return checkYear()"></td>                    
                  </tr>
                  <tr> 
                    <td colspan="5">&nbsp;</td>
                  </tr>
                </table>				
				</form>
				<table width="649" border="0" cellspacing="0" cellpadding="0">
  				<tr>
    				<td height="30"></td>
  				</tr>
				<tr>
				    <td   background="image/onerow.gif" height="179" ></td>
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
	function checkYear(){
			var v1 = document.alumniForm.academicYear;
			if( v1.value.length != 4){
						 alert("กรุณาใส่ปีการศึกาษาเป็นตัวเลข 4 หลัก");
    	      			 v1.focus();
	       	  			 return false;			
			}
			if( v1.value.length != 0){
					if(isNaN(v1.value)){
						 alert("กรุณาใส่ปีการศึกาษาเป็นตัวเลข 4 หลัก");
    	      			 v1.focus();
        	  			 return false;
					}
 			}
         	return true;
	}	// end function checksID		
		
</script>
</body>
</html>
