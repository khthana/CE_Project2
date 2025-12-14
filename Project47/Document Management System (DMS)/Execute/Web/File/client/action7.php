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
?>
<html>
<head>
<title>DMS Project : All Files : <?php if($cCreateFolder=="Create Folder") {echo "Create Folder";} if($cDeleteFolder=="Delete Folder"){echo "Delete Folder";}
if  ($cPriorityFolder=="Set Folder Priority") {echo "Set Priority for Folder";}
 ?></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body leftMargin=0 topMargin=0 bgColor=white>
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="pictures/head2.gif" width="778" height="69" border="0" usemap="#Map">
      <map name="Map">
        <area shape="rect" coords="135,38,224,59" href="client.php">
        <area shape="rect" coords="237,38,326,58" href="all%20files.php">
        <area shape="rect" coords="435,38,524,58" href="profile.php">
        <area shape="rect" coords="337,38,426,58" href="search.php">
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
          <td><p><font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong>
		  <?php  if($cCreateFolder=="Create Folder") {?><img src="pictures/createfolder.gif"><?php } if($cDeleteFolder=="Delete Folder"){?><img src="pictures/deletefolder.gif"><?php } 
		  if  ($cPriorityFolder=="Set Folder Priority") {?><img src="pictures/setfolderpriority.gif"><?php }
		  ?>
		  </strong></font></p>
            <form name="form1" method="post" action="all files.php<?php if($Folder!="") {echo "?Folder=".$Folder; }?>">
              <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1">
			  <?php 
			  //if create and delete virtual folder//////////////////////////////////////////////
			  if (($cCreateFolder=="Create Folder")||($cDeleteFolder=="Delete Folder")) {
			  if ($cCreateFolder=="Create Folder"){$statuss=$cCreateFolder;} else {if ($cDeleteFolder=="Delete Folder"){$statuss=$cDeleteFolder;}}
			  $action1 = mysql_query("SELECT  DISTINCT VirtualPath FROM virtual WHERE VirtualPath LIKE 'ALL%'");
			  if ((mysql_num_rows($action1))!==0)  { // if 2
			  while ($orderaction1=mysql_fetch_array($action1)) {//while loop
			   $echoorder1 = $orderaction1["VirtualPath"]; 
			   $stringSet = explode("/",$echoorder1);
			   $countstringSet = count($stringSet)-"1";
			   if (($countstringSet<=2)&&($statuss=="Create Folder")) { //if path over folw
					$permissionfolders = mysql_query("SELECT * FROM folderpermission WHERE FolderPath LIKE '$echoorder1' AND GroupPermiss LIKE '$usergroup'");
					$PerCon = mysql_result($permissionfolders,0,"Permission"); 
					if (((mysql_num_rows($permissionfolders))==1)&&(($PerCon=="RW")||($PerCon=="RWS"))) {// check folder permission
			  ?>
                <tr>
                  <td scope="col"><div align="left">
				  <input name="statuss" type="hidden" id="statuss" value="<?php echo $statuss;?>"> 
                   <input name="cVirtualSet" type="radio" value="<?php echo $echoorder1; ?>">
				   <font size="2" face="MS Sans Serif, Tahoma, sans-serif">
                  <?php 
				  echo $echoorder1;
				  ?></font>
				  </div></td>
                </tr>
				<?php
				} // end check permission
				} //end if path over flow
				if (($statuss=="Delete Folder")&&($countstringSet>=2)) { //if delete
					$permissionfolders = mysql_query("SELECT * FROM folderpermission WHERE FolderPath LIKE '$echoorder1' AND GroupPermiss LIKE '$usergroup'");
					$PerCon = mysql_result($permissionfolders,0,"Permission"); 
					if (((mysql_num_rows($permissionfolders))==1)&&(($PerCon=="RW")||($PerCon=="RWS"))) {// check folder permission
			  ?>
                <tr>
                  <td scope="col"><div align="left">
				  <input name="statuss" type="hidden" id="statuss" value="<?php echo $statuss;?>"> 
                   <input name="cVirtualSet" type="radio" value="<?php echo $echoorder1; ?>">
				   <font size="2" face="MS Sans Serif, Tahoma, sans-serif">
                  <?php 
				  echo $echoorder1;
				  ?></font>
				  </div></td>
                </tr>
				<?php
				}
				}//end if delete
				} // end while loop
				} // end if 2
				} //end if create and delete virtual folder//////////////////////////////////////
				//////////////////////////////////////////////////////////////// Set Folder Permission
				if  (($cPriorityFolder=="Set Folder Priority")&&($cSelect!="")) { ?>
                <tr>
                  <td valign="top" scope="col"><div align="left">
				เปลี่ยน Priority ของโฟลเดอร์ <font color="#FF0000"><strong><?php echo $cSelect; ?></strong></font><br>
				<br>
                  </div></td>
                </tr>
				
                <tr>
                  <td valign="top" scope="col">
                  <div align="left">
				   <font size="2" face="MS Sans Serif, Tahoma, sans-serif">                   <table width="100%" border="0" align="left" cellpadding="0" cellspacing="2">
				<?php
				for ($k=1;$k<=$group;$k++) {
				$SetF1 = mysql_query("SELECT * FROM folderpermission WHERE FolderPath LIKE '$cSelect' AND GroupPermiss LIKE '$k'");
				if ((mysql_num_rows($SetF1))==1) { $SetF2 = mysql_result($SetF1,0,"permission");}
				if ((mysql_num_rows($SetF1))==0) { $SetF2 = "NO";}
				?>
				<tr> 
				<td width="15%" bgcolor="#006633"><strong><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"> <div align="left">
				&nbsp;&nbsp;กลุ่มที่ &nbsp;<?php echo  $k; ?>
				</div></font></strong></td>
				<td width="15%" bgcolor="#DDFFE7"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> <div align="left">
				<input name="cSet[<?php echo $k; ?>]" type="radio" value="SetR[<?php echo $k; ?>]" <?php if($SetF2=="R") { echo "checked"; } ?>> อ่านอย่างเดียว
				</div></font></td>
				<td width="15%" bgcolor="#DDFFE7"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> <div align="left">
				<input name="cSet[<?php echo $k; ?>]" type="radio" value="SetRW[<?php echo $k; ?>]" <?php if($SetF2=="RW") { echo "checked"; } ?>>อ่านและเขียน
				</div></font></td>
				<td width="30%" bgcolor="#DDFFE7"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> <div align="left">
				<input name="cSet[<?php echo $k; ?>]" type="radio" value="SetRWS[<?php echo $k; ?>]" <?php if($SetF2=="RWS") { echo "checked"; } ?>>อ่าน,เขียนและเปลี่ยนPriorityได้
				</div></font></td>
				<td width="15%" bgcolor="#DDFFE7"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> <div align="left">
				<input name="cSet[<?php echo $k; ?>]" type="radio" value="SetNO[<?php echo $k; ?>]" <?php if($SetF2=="NO") { echo "checked"; } ?>>ไม่มีสิทธิ์
				</div></font></td>
				</tr>
				<?php
				} // end for loop///////////////////////////////////////////////
				?>
				</table></font></div></td>
                </tr>
				<tr>
                  <td valign="top" scope="col">
                  <div align="left">
				   <font size="2" face="MS Sans Serif, Tahoma, sans-serif">                   <br>
				   <input name="cSelect" type="hidden" id="hiddens1" value="<?php echo $cSelect;?>"> 
				   <input name="cChange" type="submit" id="cChange" value="Change">
				   <input name="cBacks" type="submit" id="cBacks" value="Back">
				   </font></div></td>
                </tr>

				<?php }
				////////////////////////////////////////////////////////////////end Set Folder Permission
				if  (($cPriorityFolder=="Set Folder Priority")&&($cSelect=="")) {  ?>
				<input name="cBacks" type="submit" id="cBacks" value="Back">
				<?php } ?>
				
                <tr>
                  <th scope="col"><div align="left">
                    <?php if($statuss=="Create Folder") { ?><br><font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif"> ชื่อแฟ้มที่ต้องการสร้าง : </font>
					<input name="CreateText1" type="text" id="CreateText1" size="30" maxlength="100">
                    <br>
                    <br>
                    <input name="cSubmit" type="submit" id="cSubmit" value="Create">
                    <input name="cSubmit" type="submit" id="cSubmit" value="Back">
                    <?php } ?>
                    <?php if($statuss=="Delete Folder") { ?><br><input name="cSubmit" type="submit" id="cSubmit" value="Delete">
                    <input name="cSubmit" type="submit" id="cSubmit" value="Back"><br><br>
					<font color="#FF0000" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>คำเตือน!! การลบแฟ้มเสมือน จะทำการลบแฟ้มและไฟล์เสมือนย่อยภายในโดยอัตโนมัติ</strong></font>
                    <?php } ?>
                  </div></th>
                </tr>
                <tr>
                  <th scope="col"><div align="left"></div></th>
                </tr>
              </table>
            </form>            <p align="center"><strong><font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"></font></strong></p></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
