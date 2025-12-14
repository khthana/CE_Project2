<?php 
		session_start() ; 
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Register</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style2 {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
}
.style8 {font-family: Arial, Helvetica, sans-serif}
.style9 {font-size: 12px}
.style3 {color: #ffffff}
body,td,th {
	font-family: Arial, Helvetica, sans-serif;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style10 {color: #ed1b23}
-->
</style>
<script language="JavaScript" type="text/JavaScript">

function checkSubmit(form) {
	Checkbox = document.form1.accept.checked;
	if (!Checkbox ) { 
		alert('กรุณายินยอมตกลงตามเงื่อนไขการให้บริการ');
		return false;
	} else {
		return true;
	}
}

</script>
</head>

<body>
<form name="form1" method="post" action="regis.php" onSubmit="return checkSubmit(this.form)">
  <table width="545" height="474" border="0" cellspacing="0">
    <tr>
      <td height="51" colspan="2"><img src="images/Regis_form_header.jpg" width="545" height="59"></td>
    </tr>
    <tr>
      <td width="157" height="52"><img src="images/Regis_form_01.jpg" width="157" height="50"></td>
      <td width="386" align="left" valign="top" class="style2">        
        <input name="tusername" type="text" id="tusername"
			<?php
					echo (isset($_SESSION['ss_UserName'] )?
							  ("value = '" . $_SESSION['ss_UserName'] . "'") : " " );
			?>>
        <span class="style6 "><span class="style10">		
        <?php
			($_SESSION['ss_Username_Msg']  != "") ? print "*".$_SESSION['ss_Username_Msg']  : "";
		?>
      </span><br>
      ชื่อที่ใช้เพื่อ Sign in โดยต้องเป็น 0-9, a-z, A-Z,_ เท่านั้นขนาด 3-20 ตัวอักษร</span></p></td>
    </tr>
    <tr >
      <td height="39" align="left" valign="top" background="02_1.jpg"><img src="images/Regis_form_02.jpg" width="157" height="50"></td>
      <td align="left" valign="top" bgcolor="#EBEBEB" class="style2"><span class="style8">
        <input name="tpassword" type="password" size="30" maxlength="20">
        <span class="style9"><span class="style10">		
        <?php
			($_SESSION['ss_Password_Msg'] != "") ? print "*".$_SESSION['ss_Password_Msg'] : "";
		?>
      </span><br>
	ใช้ในการ Sign in โดยต้องเป็น 0-9, a-z, A-Z เท่านั้นขนาด 5-20 ตัวอักษร</span> </span></td>
    </tr>
    <tr>
      <td height="39"><img src="images/Regis_form_03.jpg" width="157" height="50"></td>
      <td align="left" valign="top" class="style2"><span class="style8">
<input name="trepassword" type="password" size="30" maxlength="20">
<span class="style9"><span class="style10">		
        <?php
			($_SESSION['ss_RePassword_Valid'] == "repass blank") ? print"*กรุณาใส่ Password ให้ตรงกันด้วย" : "" ;
		?>
      </span><br>
	กันความผิดพลาดนะคะ</span> </span></td>
    </tr>
    <tr >
      <td height="54" bgcolor="#D7D7D7"><img src="images/Regis_form_04.jpg" width="157" height="50"></td>
      <td align="left" valign="top" bgcolor="#D7D7D7" class="style2"><span class="style8">
        <input name="ttitle" type="text" size="50" maxlength="100"
		  		  <?php
					echo (isset($_SESSION['ss_Title'] )?
							  ("value = '" . $_SESSION['ss_Title'] . "'") : " " );
				  ?>>
        <span class="style9"><span class="style10">		
        <?php
			($_SESSION['ss_Title_Msg']  != "") ? print "*".$_SESSION['ss_Title_Msg']  : "";
		?>
      </span><br>
ชื่อTitle ของBlog ของเรา</span></span></td>
    </tr>
    <tr>
      <td><img src="images/Regis_form_05.jpg" width="157" height="50"></td>
      <td align="left" valign="top" class="style2"><span class="style8">
        <input name="tcomname" type="text" size="30" maxlength="20"
		  	<?php
					echo (isset($_SESSION['ss_CommentName'] )?
							  ("value = '" . $_SESSION['ss_CommentName'] . "'") : " " );
			?>>
        <span class="style9"> <span class="style10">		
        <?php
			($_SESSION['ss_Alias_Msg']   != "") ? print "*".$_SESSION['ss_Alias_Msg']   : "";
		?>
      </span><br>
เป็นชื่อที่จะใช้เวลาไป Comment ใน Blog ของคนอื่น</span></span></td>
    </tr>
    <tr>
      <td bgcolor="#C1C1C1"><img src="images/Regis_form_06.jpg" width="157" height="50"></td>
      <td align="left" valign="top" class="style2" bgcolor="#C1C1C1"><span class="style8">
        <input name="temail" type="text" id="temail" size="20" maxlength="40"
		  <?php
					echo (isset($_SESSION['ss_Email'] )?
							  ("value = '" . $_SESSION['ss_Email'] . "'") : " " );
			?>>
        <span class="style9"><span class="style10">		
        <?php
			($_SESSION['ss_Email_Msg'] !="") ? print "*".$_SESSION['ss_Email_Msg']  : "";
		?>
      </span><br>
ต้องเป็น Email ที่ใช้อยู่จริงนะคะ เพราะต้องใช้ยืนยันการสมัคร</span></span></td>
    </tr>
    <tr>
      <td height="57"><img src="images/Regis_form_07.jpg" width="157" height="50"></td>
      <td align="left" valign="middle" class="style2">
			<?php
					$alphanum  = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
					$rand = substr(str_shuffle($alphanum), 0, 5);
					$_SESSION['ss_Temp'] = $rand;
					#print $rand;
		  ?>
<img src="imgstring2.php" align="absbottom">&nbsp;&nbsp;
        <input name="tseccode" type="text" size="5" maxlength="5">
      <span class="style9"><span class="style10">		
	  <?php
	  	$_SESSION['ss_SecCode_Valid'] == "mismatch" ? print "*กรุณาใส่ข้อความให้ตรงกับภาพด้านซ้ายด้วย" : "" ;
	  ?></span><br>
      ใส่ข้อความที่เห็นในภาพด้านซ้าย </span></td>
    </tr>
    <tr >
      <td bgcolor="#ACACAC">&nbsp; </td>
      <td align="left" valign="top" class="style2" bgcolor="#ACACAC"><br>
        <input name="accept" type="checkbox" id="accept" value="yes">      
ข้าพเจ้าได้อ่านและยินยอมตกลงตาม <a href="http://www.storythai.com/term.html" target="_blank">เงื่อนไขการให้บริการ</a> <br>
<br>
<input type="submit" name="Submit" value="Submit">
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <input type="reset" name="Submit2" value="Reset"> <br>
<br>   
</tr>
  </table>
</form>
</body>
</html>
