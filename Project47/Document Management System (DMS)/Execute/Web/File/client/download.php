<?php 
session_start(); 

$host="localhost";
$link=mysql_connect($host,$user);

if(!$link) {
exit("ไม่สามารถเชื่อมต่อกับ server ได้ เนื่องจาก password หรือ username ของท่านไม่ถูกต้อง");
}

mysql_select_db("dms");
$mdpass = md5($pass.$user);
$password = mysql_query("SELECT  * FROM user WHERE Username='$user' AND Password='$mdpass'");
if (mysql_num_rows($password)==0) {exit("<a href=../><strong><font color=#FF0000 size=3>Username หรือ Password ของท่านไม่ถูกต้อง 
กรุณากรอกใหม่อีกครั้ง</font></strong>");}
//echo "an = ".$an;
$CheckPriority = md5($user.$dw); 
if ($CheckPriority == $cUse) {
?>
<html>
<head>

<?php if($Submit!="Download") {?>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<?php } else { ?>
<meta  HTTP-EQUIV="Refresh" CONTENT="2; URL=<?php echo $dw; ?>"> <?php
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ได้ดาวโหลดไฟล์ ID ".$ID." ชื่อ ".$an." เพื่อนำไปเปลี่ยนแปลง<br>";  
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
?>
	  <?php } ?>
<title>DMS Project : Download for Modify</title>
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
</head>

<body bgColor=white>

<div align="center">
<?php
$test1 = mysql_query("SELECT * FROM file WHERE FileStatus LIKE '$user'");
$Count = "0";
if ((mysql_num_rows($test1))!=0) {
while ($test2 = mysql_fetch_array($test1)){
$Count = $Count+"1";
}// echo $Count;
}//echo $Count;
?>
<?php if ($Count<="4") { if($Submit!="Download") {?>
  <form action="download.php" method="post" enctype="application/x-www-form-urlencoded" name="form1" target="_top">
    <table width="50%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th valign="top" scope="col">&nbsp;</th>
        <td scope="col"><p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p></td>
      </tr>
      <tr>
        <th width="27%" valign="top" scope="col"><div align="right">ข้อตกลง :&nbsp;&nbsp;</div></th>
        <td width="73%" scope="col"><div align="left">เมื่อดาวโหลดไฟล์เพื่อไปแก้ไข จะต้องส่งคืนไฟล์ทุกครั้งครับ และสามารถดาวโหลด ไฟล์ได้มากที่สุด 5 ไฟล์ครับ </div></td>
      </tr>
      <tr>
        <th scope="row">&nbsp;</th>
        <td><p>&nbsp;</p>
            <p>
              <input type="submit" name="Submit" value="Download">
            </p></td>
      </tr>
    </table>
    <input name="dw" type="hidden" value="<?php echo $dw; ?>">
    <input name="cUse" type="hidden" value="<?php echo $cUse; ?>">
	<input name="ID" type="hidden" value="<?php echo $ID; ?>">
    <input name="an" type="hidden" id="an" value="<?php echo $an; ?>">
  </form>
  <?php } else { ?>
  <?php 
  mysql_query("UPDATE file SET FileStatus='$user' WHERE FileID LIKE '$ID'");
  ?>
  <span class="style1">กรุณานำไฟล์ส่งคืนในภายหลังด้วยค่ะ</span>  <?php }  } else
  {?><span class="style1">คุณไม่สามารถดาวโหลดไฟล์เพื่อนำไปแก้ไขได้ เนื่องจากคุณมีไฟล์ค้างส่งครบ 5 ไฟล์ค่ะ<br>กรุณาคืนไฟล์เก่าก่อนดาวโหลดด้วยค่ะ</span><?php }
  ?>
</div>
</body>
</html> <?php } ?>
