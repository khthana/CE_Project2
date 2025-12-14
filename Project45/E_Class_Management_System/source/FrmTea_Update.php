<?php 
	require('./libraries/grab_globals.lib.php'); 
	session_start(); 
?>
<html>
<head>
<title>ฟอร์มเปลี่ยนแปลงข้อมูลส่วนตัว</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body class="text">
<?php
	include("./config.inc.php");
	$sql = "SELECT * FROM member WHERE STATUS = 'teacher' AND ID = '$TID' ";
	$query = mysql_query($sql,$con);
	$row = mysql_fetch_object($query);
	$user = $row->USERNAME ;
	session_register("user"); 
?>
<script language="JavaScript">
<!--
	function checkblank() {
		if(document.profile.fname.value==''){
			alert("  คุณยังไม่ได้กรอกชื่อ ");
					document.profile.fname.focus();
			return false;
		 }
		 if(document.profile.lname.value==''){
			alert("  คุณยังไม่ได้กรอกนามสกุล ");
					document.profile.lname.focus();
			return false;
		 }
		 if(document.profile.birthday.value==''){
			alert("  คุณยังไม่ได้กรอกวันเกิด ");
					document.profile.birthday.focus();
			return false;
		 }
		 if(document.profile.email.value==''){
			alert("  คุณยังไม่ได้กรอก email ");
					document.profile.email.focus();
			return false;
		 }
		 if(document.profile.faculty.value==''){
			alert("  คุณยังไม่ได้กรอกระดับการศึกษา");
					document.profile.faculty.focus();
			return false;
		 }
		if(document.profile.branch.value==''){
			alert("  คุณยังไม่ได้กรอกสาขาที่จบ ");
					document.profile.branch.focus();
			return false;
		 }
	}
	 function go_change(){
	 	 window.open("Frmchange_pwd.php","mine","toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,left=50,top=50,width=400,height=300");
	 }
// -->  
</script>
            <table border="0" cellspacing="0" cellpadding="0" align="center" width="500">
              <form name = "profile" action = "UpdateProfile.php?ID=<?php echo $ID ?>&status=teacher&TID=<?php echo $TID ?>" method = "post">
                <tr> 
                  <td class="title"><font color="#CC9900">My Profile</font></td>
                </tr>
                <tr> 
                  <td bgcolor="#000000" colspan="2"><img src="images/dot.gif" width="1" height="1"></td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="3"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="10"><img src="Picture/cn2s_lt.gif" width="10" height="11"></td>
                        <td bgcolor="#869DB9" width="100%"><img src="images/dot.gif" width="1" height="1"></td>
                        <td width="10"><img src="Picture/cn2s_rt.gif" width="10" height="11"></td>
                      </tr>
                    </table></td>
                </tr>
                <tr bgcolor="#869DB9"> 
                  <td colspan="3" bgcolor="#869DB9"> <table width="100%" border="0" cellspacing="1" cellpadding="4">
                      <tr> 
                        <td colspan="2" bgcolor="#FAF7EA"> <table width="100%" border="0" cellspacing="1" cellpadding="4">
                            <tr> 
                              <td bgcolor="#E9E9E9" class="text" width="150" align="right"><b class="text_left"> 
                                ชื่อ</b></td>
                              <td bgcolor="#E9E9E9" class = "text" width="361"><input name="fname" type="text" id="fname" value=<?php echo $row->FULLNAME ?> maxlength="20" > 
                              </td>
                            </tr>
                            <tr> 
                              <td bgcolor="#E9E9E9" class="text" align="right"><strong>นามสกุล</strong></td>
                              <td bgcolor="#E9E9E9" class="text"><input name="lname" type="text" id="lname" value="<?php echo $row->LASTNAME ?>" maxlength="20"></td>
                            </tr>
                            <tr> 
                              <td bgcolor="#E9E9E9" class="text" width="150" align="right"><b> 
                                Username</b></td>
                              <td bgcolor="#E9E9E9" class="text" width="361"><?php echo $row->USERNAME ?> 
                              </td>
                            </tr>
                            <tr> 
                              <td bgcolor="#E9E9E9" class="text" width="150" align="right"><b> 
                                Password </b></td>
                              <td bgcolor="#E9E9E9" width="361" class="text"> 
                                <input name="button" type="button" class="button_dyn" onclick = "go_change()" value="Change Password"> 
                              </td>
                            </tr>
                          </table></td>
                      </tr>
                      <tr> 
                        <td width="146" align="right" bgcolor="#FAF7EA" class="text"> 
                          <b>วันเกิด</b></td>
                        <td bgcolor="#FAF7EA" class = "text" width="335"><input name="birthday" type="text"  value="<?php echo $row->BIRTHDAY ?>">
                          <font color="#FF0000"> &nbsp;(yyyy-dd-mm)</font></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#FAF7EA" align="right"  class="text"> <b>เพศ</b></td>
                        <td width="335" bgcolor="#FAF7EA" class="text"><?php echo $row->SEX ?></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#869DB9" colspan="2" class="text"><strong><font color="#FFFFFF">ข้อมูลการติดต่อ 
                          </font> </strong></td>
                      </tr>
                      <tr> 
                        <td valign="top" bgcolor="#FAF7EA" align="right" class="text"><strong>ที่อยู่</strong></td>
                        <td bgcolor="#FAF7EA" class="text"><?php echo $row->ADDRESS ?></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#FAF7EA" align="right" class="text"> <b>โทรศัพท์</b></td>
                        <td bgcolor="#FAF7EA" class="text"> <input type="text" name="tel" maxlength="30" size="30" value="<?php echo $row->PHONE ?>"></td>
                      </tr>
                      <tr> 
                        <td bgcolor="#FAF7EA" align="right" class="text"> <b>E-mail 
                          </b></td>
                        <td bgcolor="#FAF7EA" class="text"> <input type="text" name="email" maxlength="30" size="30" value="<?php echo $row->EMAIL ?>"> 
                        </td>
                      </tr>
                      <tr> 
                        <td bgcolor="#FAF7EA" align="right" class="text"><b>เบอร์ 
                          icq </b></td>
                        <td bgcolor="#FAF7EA" class="text"> <input name="icq" type="text" id="icq" value="<?php echo $row->ICQ ?>" size="30" maxlength="30"></td>
                      </tr>
                      <tr> 
                        <td colspan="2" valign="top" bgcolor="#869DB9" class="text"><strong><font color="#FFFFFF">ข้อมูลการทำงาน</font></strong></td>
                      </tr>
                      <tr> 
                        <td valign="top" bgcolor="#FAF7EA" align="right" class="text"> 
                          <b>ประวัติการสอน</b></td>
                        <td bgcolor="#FAF7EA" class="text"><textarea name="teach" cols="30" rows="3" id="teach"><?php echo $row->TEACHING ?></textarea></td>
                      </tr>
                      <tr> 
                        <td valign="top" bgcolor="#FAF7EA" align="right" class="text"> 
                          <strong>ประวัติการอบรม</strong> </td>
                        <td bgcolor="#FAF7EA" class="text"><textarea name="train" cols="30" rows="2" id="train"><?php echo $row->TRAINING ?></textarea></td>
                      </tr>
                      <tr> 
                        <td valign="top" bgcolor="#FAF7EA" align="right" class="text"> 
                          <strong>ประวัติการทำงาน </strong></td>
                        <td bgcolor="#FAF7EA" class="text"><textarea name="work" cols="30" rows="2" id="work"><?php echo $row->WORKING ?></textarea></td>
                      </tr>
                      <tr> 
                        <td valign="top" bgcolor="#FAF7EA" align="right" class="text"> 
                          <strong>ประวัติการดูงาน</strong> </td>
                        <td bgcolor="#FAF7EA" class="text"><textarea name="workshop" cols="30" rows="2" id="workshop"><?php echo $row->WORKSHOP ?></textarea></td>
                      </tr>
                      <tr> 
                        <td colspan="2" valign="top" bgcolor="#869DB9" class="text"><b> 
                          <font color="#FFFFFF">ประวัติการศึกษา</font></b></td>
                      </tr>
                      <tr> 
                        <td valign="top" bgcolor="#FAF7EA" align="right" class="text"> 
                          <b>ระดับการศึกษา</b></td>
                        <td bgcolor="#FAF7EA" class="text"><input type="text" name="faculty" maxlength="20" size="30" value = "<?php echo $row->EDUCATE ?>"></td>
                      </tr>
                      <tr> 
                        <td valign="top" bgcolor="#FAF7EA" align="right" class="text"> 
                          <b>สาขาที่จบ</b> </td>
                        <td width="335" bgcolor="#FAF7EA" class="text"><input name="branch" type="text" id="branch" value = "<?php echo $row->BRANCH ?>" size="30" maxlength="20"></td>
                      </tr>
                      <tr bgcolor="#E0DDBC"> 
                        <td colspan="2"> <p class="text">&nbsp;</p></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td colspan="3">&nbsp;</td>
                </tr>
                <tr> 
                  <td valign="top" colspan="2" width="445"> <input type="submit" name="Submit" value="Update" class="button"  onClick="return checkblank()">
        <input type="hidden" name="TeaUpdate" value="update"> 
        <input type="reset" name="Reset" value="Cancel" class="button">
					<input name="close" type="button" value=" Close"  onClick="window.close()" class="button"> 
                  </td>
                </tr>
              </form>
            </table>
</body>
</html>
