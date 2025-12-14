<html>
<head>
<title>user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="../nissan/nissan.css" type="text/css" media="screen">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../nissan/nissan.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #990000;
	font-weight: bold;
}
.style3 {
	color: #666666;
}
.style4 {color: #666666}
.style6 {color: #666666; font-weight: bold; }
.style7 {color: #333333}
-->
</style>
</head>

<body>
<?
		session_start();
		session_register("$username");
		if($username!=NULL){
?>
<table border="0" cellpadding="2" cellspacing="0" bgcolor="#33CCFF">
  <tr> 
    <td><form action="index2.php?data=changepwd&username=<?=$username;?>&pwd=<?=$pwd;?>"method="post" name="form1" id="form1">
        <table width="100%" border="0" cellspacing="0" cellpadding="1">
          <tr> 
            <td width="47%" align="right"><font color="#FFFFFF">รหัสผ่านเดิม:</font></td>
            <td width="53%"><input name="old_pwd" type="password" id="old_pwd" size="15"></td>
          </tr>
          <tr> 
            <td align="right"><font color="#FFFFFF">รหัสผ่านใหม่ :</font></td>
            <td><input name="new_pwd" type="password" id="new_pwd" style="height:18px;" size="15"></td>
          </tr>
          <tr> 
            <td><font color="#FFFFFF">ยืนยันระหัสผ่าน</font></td>
            <td align="left"><input name="rep_pwd" type="password" id="rep_pwd" size="15"></td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td align="left"><input type="submit" name="Submit" value="Submit"></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <?
  		}else
			echo "กรุณาล็อกอินก่อน";
  ?>
  <tr> 
    <td align="center" valign="top">&nbsp;</td>
  </tr>
</table>
</body>
</html>
