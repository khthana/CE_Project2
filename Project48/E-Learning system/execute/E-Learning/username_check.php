<script>
function Check(){
	var username = document.getElementById("username");
	if (username.value.length < 6){
		alert("Username ต่ำกว่า 6 ตัวอักษร");
		username.focus();
		return false;
	}
}
</script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>check username</title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 10px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {
	color: #6699FF;
	font-weight: bold;
}
.style2 {color: #FF0000}
</style>
</head>
<body>
<?php if($print==1){ 
 require_once("Connections/conn.php");
mysql_select_db($database_conn,$conn);
$query ="Select * from users where username like '$username'";
$output =mysql_query($query,$conn) or die(mysql_error());
$total_row=mysql_num_rows($output);
if($total_row<>0){?>
<script>alert("username นี้มีคนใช้แล้วครับ"); </script>
<?php }
else {?>
  <script>alert("username นี้ใช้ได้ครับ");
				 opener.document.form1.username.value="<?php echo $username;?>";
		      	 window.close();
  </script>
<?php }//else
}//if print==1?>
<div align="center">
  <table width="238" height="186" border="1" cellpadding="0" cellspacing="0" bordercolor="#66CCFF">
    <tr>
      <td width="234"><div align="center" class="style1">
        <p>กรอก Username</p>
        </div></td>
    </tr>
    <tr>
      <td height="163"><form action="username_check.php" onSubmit="return Check();" method="post" name="form2" id="form2"  >
          <p align="center">&nbsp;            </p>
          <p align="center">
            <input name="username" type="text" id="username" maxlength="12">
                    </p>
          <p align="center">
            <input name="Submit" type="submit" value="Submit" >
            <input name="print" type="hidden" id="print" value="1">
          </p>
      </form>
      <p align="center"><SPAN class=style2>*อยู่ระหว่าง 6-12 ตัวอักษร</SPAN></p></td>
    </tr>
  </table>
</div>
</body>
</html>
