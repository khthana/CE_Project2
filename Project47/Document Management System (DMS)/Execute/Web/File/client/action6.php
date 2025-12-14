<?php // if ($cAddFile == "Add File") {
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

$cRadioMove = "";
$statuss = "";
?>
<html>
<head>
<title>DMS Project : All Files : Add to Virtual Folder</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body leftMargin=0 topMargin=0 bgColor=white>
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="pictures/head2.gif" width="778" height="69" border="0" usemap="#Map">
      <map name="Map">
        <area shape="rect" coords="135,38,224,59" href="client.php">
        <area shape="rect" coords="237,38,326,58" href="all%20files.php">
        <area shape="rect" coords="436,37,525,57" href="profile.php">
        <area shape="rect" coords="335,38,424,58" href="search.php">
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
          <td><p><font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong><?php if ($cAddFile == "Insert File") { ?>
		  <img src="pictures/insertfile.gif" width="300" height="26"><?php } ?><?php if ($IDadd != "") { ?><img src="pictures/addfiletovirtualdrive.gif" width="300" height="26"><?php } ?></strong></font><br>
              <br>
            </p><form action="all%20files.php<?php if($Folder!="") {echo "?Folder=".$Folder; }?>" method="post" enctype="multipart/form-data" name="form3">
			<?php  if ($IDadd != "") {  ?>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <?php
						  $add = mysql_query("SELECT DISTINCT VirtualPath FROM virtual WHERE VirtualPath LIKE '$user%' ORDER BY VirtualPath");
						 // echo mysql_num_rows($add);
						  if ((mysql_num_rows($add))!==0) {
						  while ($AddPath=mysql_fetch_array($add)) {
						  ?>
              
              <tr> <?php $addd = $AddPath["VirtualPath"];  ?>
                <td colspan="4"><input name="AddValue" type="radio" value="<?php echo $addd; ?>" <?php if($addd==$user."/") {echo " checked";}?>><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><?php echo $addd; ?></font></td>
              </tr><?php }} ?>
              <tr> 
                <td colspan="4" valign="top"> 
                    <p>
                      <br>
                      <input name="IDadd" type="hidden" id="IDadd" value="<?php echo $IDadd; ?>">
                    </p>
                    <table width="100%"  border="0" cellspacing="0" cellpadding="1">
                      <tr>
                        <th width="11%" valign="top" scope="row">&nbsp;</th>
                        <td width="89%">&nbsp;</td>
                      </tr>
                    </table>
                    <p>
                      <input name="cIDadd" type="submit" id="cIDadd" value="Add">
                      <input name="cIDadd" type="submit" id="cIDadd" value="Back">
</p>
                  </td>
              </tr>
            </table>
            <?php } ?>
            </form> </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
