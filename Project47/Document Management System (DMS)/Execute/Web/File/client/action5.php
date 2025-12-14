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
    <td><img src="pictures/head2.gif" width="778" height="69" border="0" usemap="#Map">
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
          <td><p><font color="#CC0000" size="3" face="MS Sans Serif, Tahoma, sans-serif"><strong><?php if ($cAddFile == "Insert File") { ?><img src="pictures/insertfile.gif">
		  <?php } ?><?php if ($IDadd != "") { ?><img src="pictures/addfiletovirtualdrive.gif"><?php } ?></strong></font><br>
              <br>
            </p><form action="all%20files.php?Folder=<?php echo $Folder; ?>" method="post" enctype="multipart/form-data" name="form3">
			<?php  if (($cAddFile == "Insert File")||($IDadd!="")) {  ?>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
						  <?php
						  $add = mysql_query("SELECT DISTINCT VirtualPath FROM virtual WHERE VirtualPath LIKE 'ALL%' ORDER BY VirtualPath");
						 // echo mysql_num_rows($add);
						  if ((mysql_num_rows($add))!==0) {
						  while ($AddPath=mysql_fetch_array($add)) {
						  $addd = $AddPath["VirtualPath"];  
						  $TestPri = mysql_query("SELECT * FROM folderpermission WHERE FolderPath LIKE '$addd' AND GroupPermiss LIKE '$usergroup'");
						  if (mysql_num_rows($TestPri)!=0) {
						  ?>
              
              <tr> <?php 
			 /* $CheckPP = mysql_query("SELECT * FROM folderpermission WHERE FolderPath='$addd'");
			  $CheckShow = mysql_result($CheckPP,0,"Permission"); 
			  if ($CheckShow!="R") {*/
			  ?>
                <td colspan="4"><input name="AddValue" type="radio" value="<?php echo $addd; ?>" <?php if($addd=="ALL/") {echo " checked";}?>><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><?php echo $addd; ?></font></td>
              </tr><?php }}}//} 
			  ?>
              <tr> 
                <td colspan="4" valign="top"> 
                    <p>
                      
                      <br>
                      <input type="hidden" name="MAX_FILE_SIZE" value="2000000">
                      <input name="IDadd" type="hidden" id="IDadd" value="<?php echo $IDadd; ?>">
                    </p>
                    <table width="100%"  border="0" cellspacing="0" cellpadding="1">
                      <tr>
                        <th width="11%" scope="col"><div align="left">File :&nbsp;&nbsp;</div></th>
                        <th width="89%" scope="col"><div align="left">
                            <input type="file" name="cUploadFile">
                        </div></th>
                      </tr>
                      <tr>
                        <th valign="top" scope="row"><div align="left">Detail : </div></th>
                        <td><textarea name="cDetailFile" cols="50" rows="5"></textarea></td>
                      </tr>
                    </table>
                    <p>
                      <input name="cAddFile" type="submit" id="cAddFile" value="Add">
                      <input name="cAddFile" type="submit" id="cAddFile" value="Back">
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
