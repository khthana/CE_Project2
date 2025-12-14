<?php
session_start();
session_register("user");
session_register("pass");
$host="localhost";
$link=mysql_connect($host,$user);

if(!$link) {
exit("ไม่สามารถเชื่อมต่อกับ server ได้ เนื่องจาก password หรือ username ของท่านไม่ถูกต้อง");
}

mysql_select_db("dms");
$mdpass = md5($pass);
$password = mysql_query("SELECT  * FROM user WHERE Username='$user' AND Password='$mdpass'");
if ((mysql_num_rows($password)==0)||($user!="admin")) {exit("<a href=admin.php><strong><font color=#FF0000 size=3>Username หรือ Password ของท่านไม่ถูกต้อง 
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
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
if ($endd!="1") {
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ล๊อคอินเข้าใช้ระบบ<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
$endd = "1"; session_register("endd");
}
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
//create user///////////////////////////////////////////////////////
if ($cCreate!="") {  if ($spass==$srepass) {
$test1 = mysql_query("SELECT * FROM user WHERE UserName LIKE '$suser'");
if((mysql_num_rows($test1))==0) { $spass2 = md5($spass.$suser);
mysql_query("INSERT INTO user (user.UserID,user.UserName,user.Password,user.Position,user.Detail,user.Group,user.UserStatus) VALUES ('','$suser','$spass2','$sposition','$saddress','$sgroup','$sability')");
$path1 = $suser."/";
mysql_query("INSERT INTO virtual (VirtualPath,FileID) VALUES ('$path1','0')");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." สร้าง user ".$suser."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
} else { $err3 = "1"; } }else{$err4 = "1"; }
}
//end create user////////////////////////////////////////////////
//delete user///////////////////////////////////////////////////////
if (($cDelete!="")&&($userdel!="admin")) {
mysql_query("DELETE FROM user WHERE UserName LIKE '$userdel'");
$delvir = $userdel."/%";
mysql_query("DELETE FROM virtual WHERE VirtualPath LIKE '$delvir'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ลบ user ".$userdel."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}
//end delete user////////////////////////////////////////////////

?>
<html>
<head>
<title>DMS Project : Administrator : Manage User</title>
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
    <td><img src="pictures/admin-head1.gif" width="778" height="69" border="0" usemap="#Map">
      <map name="Map">
        <area shape="rect" coords="135,38,224,59" href="admin2.php">
        <area shape="rect" coords="237,38,326,58" href="groups.php">
        <area shape="rect" coords="436,38,525,58" href="pro.php">
        <area shape="rect" coords="336,38,425,58" href="junk.php">
        <area shape="rect" coords="635,38,724,58" href="admin.php?Log=1">
        <area shape="rect" coords="538,36,628,59" href="Log/LogFile123.php" target="_blank">
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
          <td><p><img src="pictures/manageuser.gif" width="300" height="26"><br>
            <?php if($err3=="1") {?>
		  <strong><span class="style1">Username ที่คุณต้องการมีคนใช้แล้ว กรุณาตั้ง Username ใหม่ค่ะ </span></strong>
		  <?php $err3 = "0"; }?>
            <?php if($err4=="1") {?>
		  <strong><span class="style1">คุญใส่ Password และ Re-type password ไม่เหมือนกัน กรุณากรอกใหม่ค่ะ </span></strong>
		  <?php $err4 = "0"; }?>
          </p>
            <table width="95%" border="0" align="center" cellpadding="3" cellspacing="0">
              <tr>
                <th scope="col"><div align="left"><img src="pictures/createuser.gif" width="300" height="26"></div></th>
                <th scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th scope="row"><div align="left">
                  <form name="form1" method="post" action="admin2.php">
                    <table width="95%"  border="0" align="center" cellpadding="3" cellspacing="0">
                      <tr>
                        <td width="182" scope="col"><img src="pictures/username.gif" width="182" height="26"></td>
                        <td scope="col"><input name="suser" type="text" id="suser" size="20" maxlength="20"></td>
                      </tr>
                      <tr>
                        <td width="182" scope="row"><img src="pictures/password.gif" width="182" height="26"></td>
                        <td><input name="spass" type="password" id="spass" size="8" maxlength="8"></td>
                      </tr>
                      <tr>
                        <td width="182" scope="row"><img src="pictures/re-typepassword.gif" width="182" height="26"></td>
                        <td><input name="srepass" type="password" id="srepass" size="8" maxlength="8"></td>
                      </tr>
                      <tr>
                        <td width="182" scope="row"><img src="pictures/position.gif" width="182" height="26"></td>
                        <td><input name="sposition" type="text" id="sposition" size="30" maxlength="30"></td>
                      </tr>
                      <tr>
                        <td width="182" scope="row"><img src="pictures/address.gif" width="182" height="26"></td>
                        <td><input name="saddress" type="text" id="saddress" size="50" maxlength="300"></td>
                      </tr>
                      <tr>
                        <td width="182" scope="row"><img src="pictures/group.gif" width="182" height="26"></td>
                        <td><select name="sgroup" id="sgroup"><?php for($k=1;$k<=$group;$k++) {?>
                          <option value="<?php echo $k; ?>"><?php echo $k; ?></option> <?php }?>
                        </select></td>
                      </tr>
                      <tr>
                        <td width="182" scope="row"><img src="pictures/ability.gif" width="182" height="26"></td>
                        <td><select name="sability" id="sability">
                          <option value="w">Web only</option>
                          <option value="sw">Web &amp; Scanner</option>
                        </select></td>
                      </tr>
                      <tr>
                        <td scope="row">&nbsp;</td>
                        <td><input name="cCreate" type="submit" id="cCreate" value="Create">
                          <input type="reset" name="Reset" value="Clear"></td>
                      </tr>
                    </table>
                  </form>
                </div></th>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row"><img src="pictures/deletetuser.gif" width="300" height="26"></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row"><form name="form1" method="post" action="admin2.php">
                  <table width="95%"  border="0" align="center" cellpadding="3" cellspacing="0">
                    <tr>
                      <td width="182" scope="col"><img src="pictures/username.gif" width="182" height="26"></td>
                      <td scope="col"><select name="userdel" id="userdel">
					  <?php 
					  $del = mysql_query("SELECT * FROM user ORDER BY UserName");
					  if (mysql_num_rows($del)!=0) {
					  while ($del2 = mysql_fetch_array($del)) {
					  if ($del2["UserName"]!="admin") {
					   ?>
                        <option value="<?php echo $del2["UserName"];?>"><?php echo $del2["UserName"];?></option>
						<?php }}} ?>
                      </select></td>
                    </tr>
                    <tr>
                      <td scope="row">&nbsp;</td>
                      <td><input name="cDelete" type="submit" id="cDelete" value="Delete">
                        <input type="reset" name="Reset" value="Clear"></td>
                    </tr>
                  </table>
                </form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
