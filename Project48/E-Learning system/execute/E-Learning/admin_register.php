<script language="javascript" type="text/JavaScript">
function Check() {
	var name= document.getElementById("name");
	var surname = document.getElementById("surname");
	var username = document.getElementById("username");
	var password = document.getElementById("password");
	var confirm_password = document.getElementById("confirm_password");
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
		alert("กรุณากรอก username");
		username.focus();
		return false;
	}
	else if (password.value.length < 6){
		alert("password ไม่ถูกต้อง");
		password.focus();
		return false;
	}
	else if (confirm_password.value.length < 6){
		alert("Confirm Password ไม่ถูกต้อง");
		confirm_password.focus();
		return false;
	}
	else if(password.value!=confirm_password.value){
	alert("พาสเวิร์ดกับคอนเฟิมพาสเวิร์ดไม่ตรงกัน กรุณากรอกใหม่ค่ะ");
	confirm_password.focus();
	return false;
	}
}
</script>
</html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Admin registration</title>
<style type="text/css">
<!--
body {
	background-image: url(Admin/Images/bg.gif);
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
<?php 
	if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="Submit"))
	{	
	 	require_once('Connections/conn.php');
		mysql_select_db($database_conn,$conn);
		//add to users table
		$query ="INSERT INTO users (username,password,status) VALUES ('$username','$password','$status')";
		$result = mysql_query($query,$conn) or die(mysql_error());
		//find user_ID
		$query ="select * from users order by user_ID desc";
		$user_ID=mysql_query($query,$conn) or die(mysql_error());
		$row_rsUser_ID=mysql_fetch_assoc($user_ID);
		$user_ID=$row_rsUser_ID['user_ID'];
		//add to table admin
		$query ="INSERT INTO admin (user_ID,name,surname) VALUES ('$user_ID','$name','$surname')";
		$result = mysql_query($query,$conn) or die(mysql_error());
		echo"<meta http-equiv='refresh' content='0;URL=index.php'>";
		}
		?>
<table width="770" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td><img src="Images/Administrator_registration.gif" width="510" height="72"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="30"><p class="style8">&nbsp;</p>
    </td>
    <td width="631"><form action="admin_register.php" method="post" name="form1">
      <table width="511" border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF" background="Admin/Images/bg.gif" bgcolor="#FFFFFF">
        <tr>
          <td bgcolor="#66CCFF">&#3594;&#3639;&#3656;&#3629;</td>
          <td><input name="name" type="text" id="name" maxlength="30"></td>
        </tr>
        <tr>
          <td width="138" bgcolor="#66CCFF">&#3609;&#3634;&#3617;&#3626;&#3585;&#3640;&#3621;</td>
          <td width="367"><input name="surname" type="text" id="surname" maxlength="30">
            </td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Username</td>
          <td><input name="username" type="text" id="username" readonly="" maxlength="12">
            <input name="ตรวจสอบ" type="button" id="ตรวจสอบ" onClick="MM_openBrWindow('username_check.php','check','status=yes,top=250,left=350,width=320,height=210')" value="ตรวจสอบ"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Password</td>
          <td><input name="password" type="password" id="password" maxlength="12">            
          <span class="style6"> * &#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Confirm Password </td>
          <td><input name="confirm_password" type="password" id="confirm_password" maxlength="12">
            <span class="style6"> *&#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span>            </td>
        </tr>
        <tr>
          <td height="28" colspan="2" bgcolor="#66CCFF"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input name="Submit" type="submit" onClick=" return Check()" value="Submit">
&nbsp;&nbsp;&nbsp;              
<input name="Reset" type="reset" id="Reset" value="Reset">
          <input name="status" type="hidden" id="status" value="admin">
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