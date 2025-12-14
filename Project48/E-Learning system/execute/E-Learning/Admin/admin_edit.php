<script language="javascript" type="text/JavaScript">
function Check() {
	var name= document.getElementById("name");
	var surname = document.getElementById("surname");
	var username = document.getElementById("username");
	var password = document.getElementById("password");
	if (name.value == ""){
		alert("กรุณากรอก ชื่อ");
		name.focus();
		return false;
	}
	else if (surname.value == ""){
		alert("กรุณากรอก นามสกุล");
		surname.focus();
		return false;
	}
	else if (username.value.length < 6){
		alert("username ไม่ถูกต้อง");
		username.focus();
		return false;
	}
	else if (password.value.length < 6){
		alert("password ไม่ถูกต้อง");
		password.focus();
		return false;
	}
}
</script>
</html>
<html>
<head>
<?php //include('header_index.htm') ?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Edit Admin</title>
<style type="text/css">
<!--
body {
	background-image: url(Images/bg.gif);
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

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<body>
<?php require_once('../Connections/conn.php'); ?>
<?php	//if submit update to users table and admin table
	if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="Submit"))
	{	
		mysql_select_db($database_conn,$conn);
		//update to user table
		$query ="UPDATE users SET username='$username',password='$password' where user_ID ='$id' ";
		$result = mysql_query($query,$conn) or die(mysql_error());
		//update to admin table
		$query ="UPDATE admin SET name='$name',surname='$surname' where user_ID ='$id' ";
		$result = mysql_query($query,$conn) or die(mysql_error());
		echo"<meta http-equiv='refresh' content='0;URL=userlists.php'>";
		}
?>
<?php
mysql_select_db($database_conn, $conn);
$query_admin_rs = "SELECT * FROM `admin` where user_ID='$id' ";
$admin_rs = mysql_query($query_admin_rs, $conn) or die(mysql_error());
$row_admin_rs = mysql_fetch_assoc($admin_rs);
$totalRows_admin_rs = mysql_num_rows($admin_rs);

mysql_select_db($database_conn, $conn);
$query_user_rs = "SELECT * FROM users where user_ID='$id' ";
$user_rs = mysql_query($query_user_rs, $conn) or die(mysql_error());
$row_user_rs = mysql_fetch_assoc($user_rs);
$totalRows_user_rs = mysql_num_rows($user_rs);
?>
<table width="770" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp; </td>
  <td><img src="../Images/administrator_edit_form.gif" width="510" height="72"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="30">&nbsp; </td>
    <td width="578"><form action="admin_edit.php" method="post" name="form1">
      <table width="511" border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF" background="Images/bg.gif" bgcolor="#FFFFFF">
        <tr>
          <td bgcolor="#66CCFF">&#3594;&#3639;&#3656;&#3629;</td>
          <td><input name="name" type="text" id="name" value="<?php echo $row_admin_rs['name']; ?>" maxlength="30"></td>
        </tr>
        <tr>
          <td width="138" bgcolor="#66CCFF">&#3609;&#3634;&#3617;&#3626;&#3585;&#3640;&#3621;</td>
          <td width="367"><input name="surname" type="text" id="surname" value="<?php echo $row_admin_rs['surname']; ?>" maxlength="30"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Username</td>
          <td><input name="username" type="text" id="username" readonly="" value="<?php echo $row_user_rs['username']; ?>" maxlength="12">
              <input name="ตรวจสอบ" type="button" id="ตรวจสอบ" onClick="MM_openBrWindow('../username_check.php','check','status=yes,width=320,height=210')" value="ตรวจสอบ"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Password</td>
          <td><input name="password" type="text" id="password" value="<?php echo $row_user_rs['password']; ?>" maxlength="12">            
          <span class="style6"> *&#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span></td>
        </tr>
        <tr>
          <td height="28" colspan="2" bgcolor="#66CCFF"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <input name="Submit" type="submit" onClick=" return Check()" value="Submit">
&nbsp;&nbsp;&nbsp;              
<input name="Reset" type="reset" id="Reset" value="Reset">
          <input name="id" type="hidden" id="id" value="<?php echo $id; ?>">
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
<?php
mysql_free_result($admin_rs);

mysql_free_result($user_rs);
?>
