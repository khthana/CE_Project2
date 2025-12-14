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

//manage group/////////////////////////////////////////////////////////////////
if ($groups=="Change") { //if
$file = fopen("group.txt","w");
$LogFile = $cGroups;  
fputs($file,$LogFile);
fclose($file);

if ($cGroups<$group) {//sub if
$j = $cGroups+1;
for ($u=$j;$u<=$group;$u++){//for
//echo $u;
mysql_query("DELETE FROM user WHERE user.Group LIKE '$u'");
mysql_query("DELETE FROM permission WHERE GroupAllow LIKE '$u'");
mysql_query("DELETE FROM folderpermission WHERE GroupPermiss LIKE '$u'");
}//end for
}//end sub if
elseif($cGroups>$group){
$j=$group+1;
for ($u=$j;$u<=$cGroups;$u++){ //echo $u;
mysql_query("INSERT INTO folderpermission (FolderPath,GroupPermiss,Permission) VALUES ('ALL/','$u','R')");
}
}
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." จำนวน Group ทั้งหมดจาก ".$group." เป็น ".$cGroups." Group<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$group = $cGroups;
session_register(group);
}//end if
//end manage group/////////////////////////////////////////////////////////

//change user group///////////////////////////////////////////////////////
if ($cGroup!="") {
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." เปลี่ยน User ".$userg." เป็น Group ".$groupg."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
mysql_query("UPDATE user SET user.Group='$groupg' WHERE UserName LIKE '$userg'");
}
//end change user group////////////////////////////////////////////////
//move user group///////////////////////////////////////////////////////
if (($cMove!="")&&($cFrom!=$cTo)) {
mysql_query("UPDATE user SET user.Group='$cTo' WHERE user.Group LIKE '$cFrom'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." เปลี่ยน User ทั้งหมดจาก Group ".$cFrom." เป็น Group ".$cTo."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}
//end move user group////////////////////////////////////////////////
//delete user group///////////////////////////////////////////////////////
if ($cDelete!="") {
mysql_query("DELETE FROM user WHERE user.Group LIKE '$cDelGroup'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ลบ User ทั้งหมดใน Group ".$cDelGroup."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}
//end delete user group////////////////////////////////////////////////
?>
<html>
<head>
<title>DMS Project : Administrator : Manage Group</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style1 {
	font-family: "MS Sans Serif", Tahoma, sans-serif;
	font-size: x-small;
	color: #000099;
}
.style2 {color: #FF0000}
.style4 {font-family: "MS Sans Serif", Tahoma, sans-serif; font-size: x-small; color: #000099; font-weight: bold; }
-->
</style></head>

<body leftMargin=0 topMargin=0 bgColor=white>
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="pictures/admin-head2.gif" width="778" height="69" border="0" usemap="#Map">
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
          <td><p><img src="pictures/managegroup.gif" width="300" height="26"><br>
                      </p>
            <table width="95%" border="0" align="center" cellpadding="3" cellspacing="0">
              <tr>
                <td scope="col">
                  <form name="form2" method="post" action="groups.php">
                    <p><span class="style4">ขณะนี้มีกลุ่มทั้งหมด </span><font  color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong><?php echo $group; ?></strong></font><span class="style4"> กลุ่ม<br>
                      เปลี่ยนจำนวนกลุ่มทั้งหมดให้เป็น </span>                        <select name="cGroups" id="cGroups">
					<?php for ($h=20;$h>=1;$h--) {?>
                      <option value="<?php echo $h;?>"><?php echo $h; ?></option>
					  <?php } ?>
                              </select>
                        <strong><span class="style1">กลุ่ม 
                        <input name="groups" type="submit" id="groups" value="Change">
                        <br>
                        <span class="style2">คำเตือน! การลดจำนวนกลุ่ม จะทำให้กลุ่มและข้อมูลของ User ในกลุ่มที่ถูกลบหายไป</span></span></strong></p>
                </form></td>
                <th scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th scope="col"><div align="left"><img src="pictures/changegroup.gif" width="300" height="26"></div></th>
                <th scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th scope="row"><div align="left">
                  <form name="form1" method="post" action="groups.php">
                    <table width="95%"  border="0" align="center" cellpadding="3" cellspacing="0">
                      <tr>
                        <td width="182" scope="col"><img src="pictures/username.gif" width="182" height="26"></td>
                        <td scope="col"><select name="userg" id="userg">
                            <?php 
					  $g = mysql_query("SELECT * FROM user ORDER BY UserName");
					  if (mysql_num_rows($g)!=0) {
					  while ($g2 = mysql_fetch_array($g)) {
					  if ($g2["UserName"]!="admin") {
					   ?>
                            <option value="<?php echo $g2["UserName"];?>"><?php echo $g2["UserName"];?></option>
                            <?php }}} ?>
                        </select></td>
                      </tr>
                      <tr>
                        <td scope="row"><img src="pictures/group.gif" width="182" height="26"></td>
                        <td><select name="groupg" id="groupg">
                            <?php for($k=1;$k<=$group;$k++) {?>
                            <option value="<?php echo $k; ?>"><?php echo $k; ?></option>
                            <?php }?>
                        </select></td>
                      </tr>
                      <tr>
                        <td scope="row">&nbsp;</td>
                        <td><input name="cGroup" type="submit" id="cGroup" value="Change">
                            <input type="reset" name="Reset" value="Clear"></td>
                      </tr>
                    </table>
                  </form>
                </div></th>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row"><img src="pictures/moveallusergroup.gif" width="300" height="26"></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row"><form name="form1" method="post" action="groups.php">
                  <table width="95%"  border="0" align="center" cellpadding="3" cellspacing="0">
                    <tr>
                      <td scope="col"><strong><span class="style1">ย้าย User ทั้งหมดจาก Group 
                        <select name="cFrom" id="cFrom">
                            <?php for($k=1;$k<=$group;$k++) {?>
                            <option value="<?php echo $k; ?>"><?php echo $k; ?></option>
                            <?php }?>
                        </select> 
                        ไปยัง Group 
                        <select name="cTo" id="cTo">
                            <?php for($k=1;$k<=$group;$k++) {?>
                            <option value="<?php echo $k; ?>"><?php echo $k; ?></option>
                            <?php }?>
                        </select>
</span></strong></td>
                      </tr>
                    <tr>
                      <td scope="row"><input name="cMove" type="submit" id="cMove" value="Move">
                        <input type="reset" name="Reset" value="Clear"></td>
                      </tr>
                  </table>
                </form></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row"><img src="pictures/deletegroup.gif" width="300" height="26"></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row"><form name="form1" method="post" action="groups.php">
                  <table width="95%"  border="0" align="center" cellpadding="3" cellspacing="0">
                    <tr>
                      <td scope="col"><strong><span class="style1">ลบ User ทั้งหมดใน Group
                              <select name="cDelGroup" id="cDelGroup">
                            <?php for($k=1;$k<=$group;$k++) {?>
                            <option value="<?php echo $k; ?>"><?php echo $k; ?></option>
                            <?php }?>
                          </select>
                              <br>
                              <br>
                              <span class="style2">คำเตือน! User ทั้งหมดที่อยู่ใน Group จะถูกลบและไม่สามารถนำกลับคืนมาได้ </span>
</span></strong></td>
                    </tr>
                    <tr>
                      <td scope="row"><input name="cDelete" type="submit" id="cDelete" value="Delete">
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
