<?php session_start(); ?>
<?php require_once('../connections/conn.php'); ?>
<script language="javascript" type="text/JavaScript">
function Check() {
	var old_pass = document.getElementById("old_pass");
	var confirm_old_pass = document.getElementById("confirm_old_pass");
	var new_pass = document.getElementById("new_pass");
	var confirm_new_pass = document.getElementById("confirm_new_pass");
		
	if (old_pass.value.length < 6){
		alert("Old Passwordไม่ถูกต้อง");
		old_pass.focus();
		return false;
	}
	else if (confirm_old_pass.value.length < 6){
		alert("Confirm Old Passwordไม่ถูกต้อง");
		confirm_old_pass.focus();
		return false;
	}
	else if (new_pass.value.length < 6){
		alert("New Passwordไม่ถูกต้อง");
		new_pass.focus();
		return false;
	}
	else if (confirm_new_pass.value.length < 6){
		alert("Confirm New Passwordไม่ถูกต้อง");
		confirm_new_pass.focus();
		return false;
	}
	else if (old_pass.value!=confirm_old_pass.value ){
		alert("Old Password และ Confirm Old Passwordไม่ตรงกัน");
		confirm_old_pass.focus();
		return false;
	  }
		
	else if (new_pass.value!=confirm_new_pass.value ){
		alert("new Password และ Confirm new Passwordไม่ตรงกัน");
		confirm_new_pass.focus();
		return false;
	}
}
</script>
</html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Edit Admin</title>
<style type="text/css">
<!--
body {
	background-image: url();
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style6 {color: #FF0000}
.style8 {font-size: 24px}
.style10 {
	color: #FF6633;
	font-size: 36px;
	font-weight: bold;
}
-->
</style>

</head>
<body>
<?php	//if submit update to users table 
	if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="Submit"))
	{	
		mysql_select_db($database_conn,$conn);
		//check old password correct?
		$query ="Select * from users where password like '$old_pass'";
		$output =mysql_query($query,$conn) or die(mysql_error());
		$total_row=mysql_num_rows($output);
		if($total_row>0){
		//update to user table
		$query ="UPDATE users SET password='$new_pass' where user_ID ='$_SESSION[user_ID]' ";
		$result = mysql_query($query,$conn) or die(mysql_error());
		echo"<meta http-equiv='refresh' content='0;URL=student_index.php'>";
		}else{?><script>alert("Old Password ไม่ถูกครับ กรุณากรอกใหม่");</script> <?php }
	}
?>
<table width="770" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td height="61"><div align="center"></div>      
      <p class="style10">&nbsp;</p>
    </td>
  <td height="61"><span class="style10"><img src="../Images/password_edit_form.gif" width="510" height="72"></span></td>
    <td height="61">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td width="83"><p class="style8">&nbsp;</p>
    </td>
    <td width="578"><form action="password_edit.php" method="post" name="form1">
      <table width="511" border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF" bgcolor="#FFFFFF">
        <tr>
          <td bgcolor="#66CCFF">Old Password </td>
          <td><input name="old_pass" type="password" id="old_pass" maxlength="12">
              <span class="style6">*&#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span></td>
        </tr>
        <tr>
          <td width="154" bgcolor="#66CCFF">Confirm Old Password </td>
          <td width="351"><input name="confirm_old_pass" type="password" id="confirm_old_pass" maxlength="12">
              <span class="style6">*&#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">New Password</td>
          <td><span class="style6">
            <input name="new_pass" type="password" id="new_pass" maxlength="12">
        *&#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Confirm New Password </td>
          <td><span class="style6">
            <input name="confirm_new_pass" type="password" id="confirm_new_pass" maxlength="12">
        *&#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span></td>
        </tr>
        <tr>
          <td height="28" colspan="2" bgcolor="#66CCFF"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
                  <input name="Submit" type="submit" onClick=" return Check()" value="Submit">
&nbsp;&nbsp;&nbsp; &nbsp;
          <input name="Reset" type="reset" id="Reset" value="Reset">
          </div></td>
        </tr>
      </table>
      <p>หมายเหตุ :<span class="style6"> กรุณากรอกข้อมูลให้ครบทุกช่องครับ</span></p>
    </form></td>
    <td width="109">&nbsp;</td>
  </tr>
</table>
</body>
</html>
