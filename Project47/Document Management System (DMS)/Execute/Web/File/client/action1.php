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
?>
<html>
<head>
<title>DMS Project : Virtual Folder : <?php if ($priority=="Set Priority") { echo "Set Priority";} if($copy=="Copy to"){echo "Copy File";}  if($move=="Move to") {echo "Move File";} if($delete=="Delete from Virtual") {echo "Delete from virtual folder";}?></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body leftMargin=0 topMargin=0 bgColor=white>
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="pictures/head.gif" width="778" height="69" border="0" usemap="#Map">
      <map name="Map">
        <area shape="rect" coords="135,38,224,59" href="client.php">
        <area shape="rect" coords="237,38,326,58" href="all%20files.php">
        <area shape="rect" coords="436,37,525,57" href="profile.php">
        <area shape="rect" coords="336,37,425,57" href="search.php">
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
          <td>&nbsp;<?php $SetShows = mysql_query("SELECT * FROM file WHERE FileID LIKE '$hidden2'"); 
		  if ((mysql_num_rows($SetShows))!==0) {
		  while ($SetShow=mysql_fetch_array($SetShows)) {
		  //$SetsPath = $SetShow["Path"];
		  $SetsName = $SetShow["FileName"];
		  $SetsShow = $SetsName;
		  }
		  }
		  ?></td>
          <td><p><font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong>
		  <?php if($move=="Move to") {?><img src="pictures/movevirtualfile.gif"><?php } if($copy=="Copy to"){?><img src="pictures/copyvirtualfile.gif"><?php } 
		  if($delete=="Delete from Virtual") {?><img src="pictures/deletevirtualfile.gif"><?php }  
		  if($priority=="Set Priority"){?><img src="pictures/serpriority.gif"><?php echo "<br>&nbsp;For : "; echo $SetsShow;}?>
		  </strong></font></p>
            <form name="form1" method="post" action="client.php<?php if($Folder!="") {echo "?Folder=".$Folder; }?>">
              <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="1">
			  <?php 
			  //if move and copy//////////////////////////////////////////////
			  if (($move=="Move to")||($copy=="Copy to")) {
			  if ($move=="Move to"){$statuss=$move;} else {if ($copy=="Copy to"){$statuss=$copy;}}
			  $action1 = mysql_query("SELECT  DISTINCT VirtualPath FROM virtual WHERE VirtualPath LIKE '$user%'");
			  if ((mysql_num_rows($action1))!==0)  { // if 2
			  while ($orderaction1=mysql_fetch_array($action1)) {
			  ?>
                <tr>
                  <td scope="col"><div align="left">
				  <input name="hidden3" type="hidden" id="hidden3" value="<?php echo $hidden1;?>">
				  <input name="hidden4" type="hidden" id="hidden4" value="<?php echo $hidden2;?>"> 
				  <input name="statuss" type="hidden" id="statuss" value="<?php echo $statuss;?>"> 
				  <?php   $echoorder1 = $orderaction1["VirtualPath"]; 
				    if ($echoorder1!=$hidden1) { ?>
                   <input name="cRadioMove" type="radio" value="<?php echo $echoorder1; ?>">
				   <font size="2" face="MS Sans Serif, Tahoma, sans-serif">
                  <?php 
				  echo $echoorder1;
				  }?></font></div></td>
                </tr>
				<?php
				} // end while loop
				} // end if 2
				} //end if move and copy//////////////////////////////////////
				// Set Priority //////////////////////////////////////////////////////////
				if ($priority=="Set Priority") { 
				?>                 
				<tr>
                 <th scope="col">
				<table width="100%" border="0" align="left" cellpadding="0" cellspacing="2">
				<?php
				$TestPri2 = mysql_query("SELECT * FROM virtual WHERE VirtualPath LIKE 'ALL%' AND FileID LIKE '$hidden2'");
				$TestPri3 = mysql_result($TestPri2,0,"VirtualPath");
				for ($k=1;$k<=$group;$k++) {

				 $TestPri1 = mysql_query("SELECT * FROM folderpermission WHERE  FolderPath LIKE '$TestPri3' AND GroupPermiss LIKE '$k'");
				 if ((mysql_num_rows($TestPri1))!=0) { // if pri1
				
				$SetStatuss = mysql_query("SELECT * FROM permission WHERE ID LIKE '$hidden2' AND GroupAllow LIKE '$k'");

				if ((mysql_num_rows($SetStatuss))!==0)  {
				if ((mysql_num_rows($SetStatuss))==1) { 
				while ($SetSet =mysql_fetch_array($SetStatuss)) {
				$SetStatus = $SetSet["Permiss"];
				} // end while
				} else { echo "ฐานข้อมูลมีปัญหาในการจัดการความสำคัญของไฟล์นี้ โปรแจ้งผู้ให้บริการระบบ"; } // end sub if
				} else { $SetStatus = "NO";} // end main if
				?>
				<tr> 
				<td width="15%" bgcolor="#006633"><strong><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"> <div align="left">
				&nbsp;&nbsp;กลุ่มที่ &nbsp;<?php echo  $k; ?>
				</div></font></strong></td>
				<td width="15%" bgcolor="#DDFFE7"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> <div align="left">
				<input name="cSet[<?php echo $k; ?>]" type="radio" value="SetR[<?php echo $k; ?>]" <?php if($SetStatus=="R") { echo "checked"; } ?>> อ่านอย่างเดียว
				</div></font></td>
				<td width="15%" bgcolor="#DDFFE7"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> <div align="left">
				<input name="cSet[<?php echo $k; ?>]" type="radio" value="SetRW[<?php echo $k; ?>]" <?php if($SetStatus=="RW") { echo "checked"; } ?>>อ่านและเขียน
				</div></font></td>
				<td width="30%" bgcolor="#DDFFE7"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> <div align="left">
				<input name="cSet[<?php echo $k; ?>]" type="radio" value="SetRWS[<?php echo $k; ?>]" <?php if($SetStatus=="RWS") { echo "checked"; } ?>>อ่าน,เขียนและเปลี่ยนPriorityได้
				</div></font></td>
				<td width="15%" bgcolor="#DDFFE7"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> <div align="left">
				<input name="cSet[<?php echo $k; ?>]" type="radio" value="SetNO[<?php echo $k; ?>]" <?php if($SetStatus=="NO") { echo "checked"; } ?>>ไม่มีสิทธิ์
				</div></font></td>
				</tr>
				<?php
				} // end for loop///////////////////////////////////////////////
				} // if pri1
				?>
				  <input name="hidden3" type="hidden" id="hidden3" value="<?php echo $hidden1;?>">
				  <input name="hidden4" type="hidden" id="hidden4" value="<?php echo $hidden2;?>"> 
				  <input name="statuss" type="hidden" id="statuss" value="<?php echo $priority;?>"> 
				</table>
				<div align="left">
				  <p><br>				    
			          </p>
				  </div></th>
                </tr>
                <tr>
                  <th scope="col"><div align="left">
                      <br>
                      <input name="cButtonSet" type="submit" id="cSet" value="OK">
                      <input name="cButtonSet" type="submit" id="cSet" value="Back">
                      <?php //echo $statuss;
				} // end main if//////////////////////////////////////////////// end set priority///////////////////////////////
				?>
                  </div></th>
                </tr>
                <tr>
                  <th scope="col"><div align="left">
				  <?php if($move=="Move to") {  ?>
                    <input name="cButtonMove" type="submit" id="cMove" value="Move">
                    <input name="cButtonMove" type="submit" id="cButtonMove" value="Back">
				  <?php }  else { if($copy=="Copy to") {?>
				    <input name="cButtonCopy" type="submit" id="cMove" value="Copy">
				    <input name="cButtonCopy" type="submit" id="cButtonCopy" value="Back">
				  <?php } else {if($delete=="Delete from Virtual") {?>
				  <input name="hidden3" type="hidden" id="hidden3" value="<?php echo $hidden1;?>">
				  <input name="hidden4" type="hidden" id="hidden4" value="<?php echo $hidden2;?>">  <?php if($delete=="Delete from Virtual") { $statuss="Delete"; } ?>
				  <input name="statuss" type="hidden" id="statuss" value="<?php echo $statuss;?>"> 
				  <font color="#FF0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong>ยืนยันการลบไฟล์ออกจากไดรฟ์เสมือนของคุณ</strong></font><br><br>
				    <input name="cButtonMove" type="submit" id="cMove" value="Sure">
					<input name="cButtonMove" type="submit" id="cMove" value="Back">
				  <?php }}} ?>
                  </div></th>
                </tr>
              </table>
            </form>            <p align="center"><strong><font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"></font></strong></p></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
