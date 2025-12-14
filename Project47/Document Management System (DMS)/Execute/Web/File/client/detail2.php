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
<title>DMS Project : All Files : <?php if ($cAddFile == "Insert File") {echo "Insert File";}?></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body leftMargin=0 topMargin=0 bgColor=white>
<table width="778" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="pictures/head.gif" width="778" height="69" border="0" usemap="#Map">
      <map name="Map">
        <area shape="rect" coords="135,38,224,59" href="client.php">
        <area shape="rect" coords="237,38,326,58" href="all%20files.php">
        <area shape="rect" coords="437,37,526,57" href="profile.php">
        <area shape="rect" coords="336,36,425,56" href="search.php">
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
          <td><p><font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong><img src="pictures/editdetail.gif" width="300" height="26"><br>
            File : <?php 
			$show = mysql_query("SELECT * FROM file WHERE FileID LIKE '$editt'");
			$show1 = mysql_result($show,0,"FileName");
			$show2 = mysql_result($show,0,"Detail");
			echo $show1;
			?>
          </strong></font></p>
            <form name="form1" method="post" action="client.php">
<textarea name="cEditText" cols="50" rows="5" id="cEditText"><?php echo $show2; ?></textarea>              
<br>
              <input name="editt" type="hidden" id="editt" value="<?php echo $editt; ?>">
              <br>
              <input name="cEdit" type="submit" id="cEdit" value="Change">
              <input type="submit" name="Submit" value="Back">
              <input name="Folder" type="hidden" id="Folder" value="<?php echo $Folder; ?>">            
            </form></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
