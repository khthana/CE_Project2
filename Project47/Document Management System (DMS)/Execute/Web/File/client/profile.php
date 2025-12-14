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

$groupre = mysql_query("SELECT * FROM user WHERE UserName LIKE '$user'");
if ((mysql_num_rows($groupre))!==0) {
while ($groupre2=mysql_fetch_array($groupre)) {
$usergroup = $groupre2["Group"];
session_register("usergroup");
}
}
$file = fopen("group.txt","r");
$group = fgets($file); 
session_register("group");
//change password/////////////////////////////////////////
if ($cPass!="") {
$check1 = md5($old.$user);
$cc = mysql_query("SELECT * FROM user WHERE UserName LIKE '$user'");
$check2 = mysql_result($cc,0,"Password");
if ($check1==$check2) {
if($new==$new2){ $NewPass = md5($new.$user);
mysql_query("UPDATE user SET Password='$NewPass' WHERE UserName='$user'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ได้ทำการเปลี่ยน Password <br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}else{$err2="1";}
}else {$err1 = "1";}
}
//end chenge password //////////////////////////////////
//change address///////////////////////////////////////////
if ($cAddress!="") {
mysql_query("UPDATE user SET Detail='$add' WHERE UserName LIKE '$user'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." เปลี่ยน Address เป็น ".$add."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}
//end change address///////////////////////////////////
?>
<html>
<head>
<title>DMS Project : Profile</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style1 {
	font-family: "MS Sans Serif", Tahoma, sans-serif;
	font-size: x-small;
	color: #FF0000;
}
-->
</style></head>

<body leftMargin=0 topMargin=0 bgColor=white>
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="pictures/head4.gif" width="778" height="69" border="0" usemap="#Map">
      <map name="Map">
        <area shape="rect" coords="135,38,224,59" href="client.php">
        <area shape="rect" coords="237,38,326,58" href="all%20files.php">
        <area shape="rect" coords="436,38,525,58" href="profile.php">
        <area shape="rect" coords="336,38,425,58" href="search.php">
        <area shape="rect" coords="537,38,626,58" href="../index.php?Log=1">
      </map>
      </td>
  </tr>
  <tr> 
    <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="3%">&nbsp;</td>
          <td width="97%">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><p><img src="pictures/changeprofile.gif" width="300" height="26"><br>
          <?php if ($err1=="1"){ ?><strong><span class="style1">ท่านกรอก Password เดิมผิด กรุณากรอกใหม่ค่ะ</span></strong><?php $err1 = "0";}?>
		  <?php if ($err2=="1"){ ?><strong><span class="style1">ท่านกรอก Password ใหม่ไม่ตรงกัน กรุณากรอกใหม่ค่ะ</span></strong><?php $err2 = "0";}?>
            </p>
            <table width="95%" border="0" align="center" cellpadding="3" cellspacing="0">
              <tr>
                <th scope="col"><div align="left"><img src="pictures/changepassword.gif" width="300" height="26"></div></th>
                <th scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th scope="row"><div align="left">
                  <form name="form1" method="post" action="profile.php">
                    <table width="95%"  border="0" align="center" cellpadding="3" cellspacing="0">
                      <tr>
                        <td width="182" scope="col"><img src="pictures/oldpassword.gif" width="182" height="26"></td>
                        <td scope="col"><input name="old" type="password" id="old"></td>
                      </tr>
                      <tr>
                        <td width="182" scope="row"><img src="pictures/newpassword.gif" width="182" height="26"></td>
                        <td><input name="new" type="password" id="new"></td>
                      </tr>
                      <tr>
                        <td width="182" scope="row"><img src="pictures/retype.gif" width="182" height="26"></td>
                        <td><input name="new2" type="password" id="new2"></td>
                      </tr>
                      <tr>
                        <td width="182" scope="row"><input name="cPass" type="submit" id="cPass" value="Change">
                          <input type="reset" name="Reset" value="Clear"></td>
                        <td>&nbsp;</td>
                      </tr>
                    </table>
                  </form>
                </div></th>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row"><img src="pictures/changeaddress.gif" width="300" height="26"></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row"><form name="form2" method="post" action="profile.php">
                  <table width="95%"  border="0" align="center" cellpadding="3" cellspacing="0">
                    <tr>
                      <td scope="col"><textarea name="add" cols="50" rows="5" id="add"><?php
					  $res = mysql_query("SELECT * FROM user WHERE UserName LIKE '$user'");
					  $res2 = mysql_result($res,0,"Detail");
					  echo $res2;
					  ?></textarea></td>
                    </tr>
                    <tr>
                      <td scope="row"><input name="cAddress" type="submit" id="cAddress" value="Change">
                        <input type="reset" name="Reset" value="Clear"></td>
                    </tr>
                  </table>
                </form></td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
