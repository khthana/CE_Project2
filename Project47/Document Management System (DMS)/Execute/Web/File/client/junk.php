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

$new = "C:/AppServ/www/client/backup/";
$unPath = "C:/AppServ/www/client/unuse/";
//delete junk file///////////////////////////////////////////////////////
if ($cJunk!="") {  
$ca1 = mysql_query("SELECT * FROM file WHERE file.FileID LIKE '$junk'");
$ca2 = mysql_result($ca1,0,"Path");
$ca3 = mysql_result($ca1,0,"FileName");
$oldpath = $ca2."/".$ca3;
if ($ca2!=$unPath) {$ca4 = $junk."_".$ca3;}else{$ca4 = $ca3;}
$newpath = $new.$ca4;
mysql_query("DELETE FROM virtual WHERE virtual.FileID LIKE '$junk'");
mysql_query("DELETE FROM file WHERE FileID LIKE '$junk'");
if (@rename($oldpath,$newpath)) {}else{$err4 = "1"; }
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ลบ Junk File ชื่อ ".$ca3."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
}
//end delete junk file////////////////////////////////////////////////
//delete unuse file///////////////////////////////////////////////////
if (($cUnuse!="")&&($unuse!="ALL")) {
$ca1 = mysql_query("SELECT * FROM file WHERE file.FileID LIKE '$unuse'");
$ca2 = mysql_result($ca1,0,"Path");
$ca3 = mysql_result($ca1,0,"FileName");
$oldpath = $ca2."/".$ca3;
$newpath = $new.$ca3;
mysql_query("DELETE FROM file WHERE file.FileID LIKE '$unuse'");
mysql_query("DELETE FROM virtual WHERE virtual.FileID LIKE '$unuse'");
mysql_query("DELETE FROM permission WHERE permission.ID LIKE '$unuse'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ลบ Unuse File ชื่อ ".$ca3."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
if (@rename($oldpath,$newpath)) {}else{$err5= "1"; }
}
if ($unuse=="ALL") { // if all
$ca1 = mysql_query("SELECT * FROM file WHERE file.Path LIKE '$unPath'");
if (mysql_num_rows($ca1)!=0) {
while ($ca2=mysql_fetch_array($ca1)) {//while
$oldpath = $ca2["Path"]."/".$ca2["FileName"];
$newpath = $new.$ca2["FileName"];
$idd = $ca2["FileID"];
mysql_query("DELETE FROM file WHERE file.FileID LIKE '$idd'");
mysql_query("DELETE FROM virtual WHERE virtual.FileID LIKE '$idd'");
mysql_query("DELETE FROM permission WHERE permission.ID LIKE '$idd'");
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
$LogFile = "[".date ("d-m-Y  H:i:s")."]   ".$user." ลบ Unuse File ชื่อ ".$ca2["FileName"]."<br>";  //echo $LogFile;
$file = fopen("Log/LogFile123.php","r");
$LogFile2 = fgets($file); //echo $LogFile2;
fclose($file);
$file = fopen("Log/LogFile123.php","w");
$LogFile = $LogFile2.$LogFile;  
fputs($file,$LogFile);
fclose($file);
///////////////////////////////////////////LOGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
if (@rename($oldpath,$newpath)) {}else{$err6= "1"; }
}//end while
}
}// end if all
//end unuse file///////////////////////////////////////////////////////
$count = "0";
$count2 = "0";
?>
<html>
<head>
<title>DMS Project : Administrator : Junk File</title>
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
    <td><img src="pictures/admin-head3.gif" width="778" height="69" border="0" usemap="#Map">
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
          <td><p><img src="pictures/managejunkfile.gif" width="300" height="26"><br>
           <?php if($err=="1") {?>
		  <strong><span class="style1">Username ที่คุณต้องการมีคนใช้แล้ว กรุณาตั้ง Username ใหม่ค่ะ </span></strong>
		  <?php $err = "0"; }?>
            <?php if($err=="1") {?>
		  <strong><span class="style1">คุญใส่ Password และ Re-type password ไม่เหมือนกัน กรุณากรอกใหม่ค่ะ </span></strong>
		  <?php $err = "0"; }?>
          </p>
            <table width="95%" border="0" align="center" cellpadding="3" cellspacing="0">
              <tr>
                <th scope="col"><div align="left"><img src="pictures/deletejunk.gif" width="300" height="26"></div></th>
                <th scope="col">&nbsp;</th>
              </tr>
              <tr>
                <th scope="row"><div align="left">
                  <form name="form1" method="post" action="junk.php">
                    <table width="95%"  border="0" align="center" cellpadding="3" cellspacing="0">
                      <tr>
					  <?php 
					  $ch1 = mysql_query("SELECT * FROM file ORDER BY FileID");
					  if (mysql_num_rows($ch1)) {//main if
					  while ($ch2=mysql_fetch_array($ch1)){//main while
					  $ch3 = $ch2["FileID"];
					  $ch4 = mysql_query("SELECT * FROM permission WHERE permission.ID LIKE '$ch3'");
					  if (mysql_num_rows($ch4)==0){//sub if
					  $count = $count+"1";
					  }//end sub if
					  }//end main while
					  }//end mail if
					  ?>
                        <td colspan="2" scope="col"><strong><span class="style1">Found <?php echo $count;?> junk files. </span></strong></td>
                        </tr>
                      <tr>
                        <td width="182" scope="col"><img src="pictures/junkfile.gif" width="182" height="26"></td>
                        <td scope="col"><select name="junk" id="junk">
					  <?php 
					  $ch1 = mysql_query("SELECT * FROM file ORDER BY FileID");
					  if (mysql_num_rows($ch1)) {//main if
					  while ($ch2=mysql_fetch_array($ch1)){//main while
					  $ch3 = $ch2["FileID"];
					  $ch4 = mysql_query("SELECT * FROM permission WHERE permission.ID LIKE '$ch3'");
					  if (mysql_num_rows($ch4)==0){//sub if
					  $ch5 = $ch2["FileName"];
					  ?>
					  <option value="<?php echo $ch3; ?>"><?php echo $ch5; ?></option>
					  <?php
					  }//end sub if
					  }//end main while
					  }//end mail if
					  ?>
                        </select></td>
                      </tr> 
                      <tr>
                        <td scope="row">&nbsp;</td>
                        <td><input name="cJunk" type="submit" id="cJunk" value="Delete">
                          <input type="reset" name="Reset" value="Clear"></td>
                      </tr>
                    </table>
                  </form>
                </div></th>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row"><img src="pictures/deleteunusefile.gif" width="300" height="26"></td>
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td scope="row"><form name="form1" method="post" action="junk.php">
                  <table width="95%"  border="0" align="center" cellpadding="3" cellspacing="0">
                    <tr>
                      <?php 
					  $ch1 = mysql_query("SELECT * FROM file WHERE Path LIKE 'C:/AppServ/www/client/unuse/' ORDER BY FileID");
					  if (mysql_num_rows($ch1)) {//main if
					  while ($ch2=mysql_fetch_array($ch1)){//main while
					  $count2 = $count2+"1";
					  }//end main while
					  }//end mail if
					  ?>
                      <td colspan="2" scope="col"><strong><span class="style1">Found <?php echo $count2;?> unuse files. </span></strong></td>
                    </tr>
                    <tr>
                      <td width="182" scope="col"><img src="pictures/oldversionfile.gif" width="182" height="26"></td>
                      <td scope="col"><select name="unuse" id="unuse">
					  <option value="ALL">ALL</option>
                      <?php 
					  $ch1 = mysql_query("SELECT * FROM file WHERE Path LIKE 'C:/AppServ/www/client/unuse/' ORDER BY FileID");
					  if (mysql_num_rows($ch1)) {//main if
					  while ($ch2=mysql_fetch_array($ch1)){//main while
					  ?>
					  <option value="<?php echo $ch2["FileID"]; ?>"><?php echo $ch2["FileName"]; ?></option>
					  <?php
					  }//end main while
					  }//end mail if
					  ?>
                      </select></td>
                    </tr>
                    <tr>
                      <td scope="row">&nbsp;</td>
                      <td><input name="cUnuse" type="submit" id="cUnuse" value="Delete">
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
