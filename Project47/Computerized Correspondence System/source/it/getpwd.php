<html>
<head>
<title>user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style5 {color: #FFFFFF}
-->
</style>
</head>

<body>
<?
		session_start();
		session_register("$username");
		if($username!=NULL){
?>
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" bgcolor="#E5E5E5">
  <tr> 
    <td><form action="index2.php?data=changepwd&username=<?=$username;?>&pwd=<?=$pwd;?>"method="post" name="form1" id="form1">
        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="38" bgcolor="#990000">&nbsp;<img src="images/icon2/ico509.gif" width="16" height="13">&nbsp;<span class="style4 style5"><strong>แก้ไขรหัสผ่าน</strong></span></td>
          </tr>
        </table>
        <table width="100%" border="0" cellpadding="1" cellspacing="0" bordercolor="#FFFFFF">
          <tr> 
            <td width="47%" align="right" class="title"><font color="#FFFFFF" class="title">รหัสผ่านเดิม:</font></td>
            <td width="53%"><input name="old_pwd" type="password" id="old_pwd" size="15"></td>
          </tr>
          <tr> 
            <td align="right" class="title"><font class="title">รหัสผ่านใหม่ :</font></td>
            <td><input name="new_pwd" type="password" id="new_pwd" style="height:18px;" size="15"></td>
          </tr>
          <tr> 
            <td align="right" class="title">ยืนยันระหัสผ่าน</td>
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
</table>
</body>
</html>
