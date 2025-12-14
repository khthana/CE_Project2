<?
session_start();
	require("config.inc.php");
?>
<html>
<head>
<title>แก้ไขข้อมูลสมัครสมาชิก</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
body {  margin: 0px  0px; padding: 0px  0px}
a:link { color: #005CA2; text-decoration: none}
a:visited { color: #005CA2; text-decoration: none}
a:active { color: #0099FF; text-decoration: underline}
a:hover { color: #0099FF; text-decoration: underline}
-->
</style>
</head>

<body bgcolor="#FFFFFF">
<?
	// ข้อมูลสมาชิก
	mysql_connect($host,$user,$passwd);
	$sql = "select * from member where username='$SESSION[membername]'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	if($NRow==0) { 
									err_msg("Error : Method","กรุณา Login ก่อนเข้าระบบแก้ไขข้อมูล");
								}
	$row = mysql_fetch_array($result);
    $Username = $row["username"];
	$Email = $row["email"];
	$ICQ = $row["icq"];
	$Fullname = $row["fullname"];
	$Nickname=$row["nickname"];
	$TEL=$row["tel"];
	$Pager=$row["pager"];
	$Addr=$row["addr"];
	$Homepage=$row["homepage"];
	$Faculty=$row["faculty"];
	$Department=$row["department"];
	$Branch=$row["branch"];
	$Year=$row["year"];
	$Class=$row["class"];
	$ID=$row["id"];

?>
<form method=post action="register.php" name="webForm" onsubmit="return check()">
  <table cellspacing=0 cellpadding=3 width="102%" bgcolor=#f5bb41 
            border=0 height="52">
    <tbody> 
    <tr> 
      <td colspan=2 height="26" bgcolor="#99ccff"> 
        <center>
          <font size=+2><b><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#0000FF">แก้ไขข้อมูลสมาชิก</font></b></font> 
        </center>
        <font size=2></font> </td>
    </tr>
    <tr> 
      <td colspan=2 height=2 bgcolor="#000066"></td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Username</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <? echo"$Username";  ?>
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">รหัสผ่าน 
        </font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input type=password maxlength=20 
                  name=password size="20">
        &nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font size="1" face="MS Sans Serif, Microsoft Sans Serif">ยืนยัน 
        รหัสผ่าน</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input type=password maxlength=20 
                  name=repassword size="20">
        &nbsp;</td>
    </tr>
    <tr> 
      <td height="23" width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Email 
        </font></td>
      <td height="23" width="87%" bgcolor="#eeeeee"> 
        <input maxlength=50 name=email size="20" value="<?echo $Email ?>">
        &nbsp;</td>
    </tr>
    <tr> 
      <td colspan=2 height=2 bgcolor="#000066"></td>
    </tr>
    <tr bgcolor="#99ccff"> 
      <td colspan=2><font size=+2><b><font face="MS Sans Serif, Microsoft Sans Serif" size="2">ข้อมูลสมาชิก</font></b></font></td>
    </tr>
    <tr> 
      <td colspan=2 height=2 bgcolor="#000066"></td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">ชื่อ 
        - นามสกุล</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=fullname value="<?echo $Fullname?>">
        &nbsp;</td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">ชื่อเล่น</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=nickname value="<?echo $Nickname?>">
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">ICQ</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=icq size="20" value="<?echo $ICQ?>">
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">Homepage</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=homepage size="20" value="<?echo $Homepage?>">
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">เพจเจอร์</font> 
      </td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=pager size="20" value="<?echo $Pager;?>">
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">โทรศัพท์</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=tel size="20" value="<?echo $TEL?>">
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">รหัสนักศึกษา</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=id size="20" value="<?echo $ID?>">
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">คณะ</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=faculty size="20" value="<?echo $Faculty?>">
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">ภาควิชา</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=department size="20" value="<?echo $Department?>">
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">สาขาวิชา</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=branch size="20" value="<?echo $Branch?>">
      </td>
    </tr>
    <tr> 
      <td height="15" width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">ชั้นปี</font></td>
      <td height="15" width="87%" bgcolor="#eeeeee"> 
        <input name=year size="20" value="<?echo $Year?>">
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">ห้อง</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=class size="20" value="<?echo $Class?>">
      </td>
    </tr>
    <tr> 
      <td width="13%" bgcolor="#eeeeee"><font face="MS Sans Serif, Microsoft Sans Serif" size="1">สถานที่ติดต่อได้</font></td>
      <td width="87%" bgcolor="#eeeeee"> 
        <input name=addr size="60" value="<? echo $Addr ; ?>">
      </td>
    </tr>
    <tr> 
      <td colspan=2 height=2 bgcolor="#000066"></td>
    </tr>
    <tr> 
      <td colspan=2 height=2 bgcolor="#000066"></td>
    </tr>
    <tr bgcolor="#99ccff"> 
      <td align=middle colspan=2 height="43"> 
        <p align="center"> 
          <input type="hidden" name="action" value="edit">
          <input type="hidden" name="username" value=<?echo $Username ?>>
          <input type="submit" name="Submit" value="บันทึกข้อมูล">
        <p align="center"></p>
      </td>
    </tr>
    </tbody> 
  </table>
</form>
<script language="JavaScript">
<!--
function check()
{
      var v1 = document.webForm.username.value;
      var v2 = document.webForm.password.value;
      var v3 = document.webForm.repassword.value;
	  var v4 = document.webForm.email.value;
        if ( v1.length==0)
           {
           alert("กรุณากำหนด Username");
           document.webForm.username.focus();           
           return false;
           }
        else if (v2.length==0)
           {
           alert("กรุณากำหนด Password");
           document.webForm.password.focus();           
		   return false;
           }
        else if (v3.length==0)
           {
           alert("กรุณาป้อน Password อีกครั้ง");
           document.webForm.repassword.focus();           
		   return false;
           }
		else if (v4.length==0)
           {
           alert("กรุณาป้อน Email Address");
           document.webForm.email.focus();           
		   return false;
           }
        else
           return true;
}
//-->
</script>
</body>
</html>
<?
function err_msg($topic,$detial) {
	echo "<center>";
	echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
	echo "<tr><td align=center>";
	echo "<font size=2 face='MS Sans Serif'>";
	echo "<font size=3 color=red><b>$topic</b></font><br><br>";
	echo $detial;
	echo "</font></td></tr></table>";
	echo "<br>";
	echo "<font size=2 face='MS Sans Serif'>";

		echo "[<a href='javascript:history.back(1)'>Back</a>]";
	
	
	echo "</font><br><br>";
		echo "</center>";
	exit();
}
?>
