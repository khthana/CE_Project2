<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<?php require_once('Connections/conn.php'); ?>
<?php
function dateThai($date){
	$_month_name = array("01"=>"มกราคม","02"=>"กุมภาพันธ์","03"=>"มีนาคม","04"=>"เมษายน","05"=>"พฤษภาคม","06"=>"มิถุนายน","07"=>"กรกฎาคม","08"=>"สิงหาคม","09"=>"กันยายน","10"=>"ตุลาคม","11"=>"พฤศจิกายน","12"=>"ธันวาคม");
	$yy=substr($date,0,4);$mm=substr($date,5,2);$dd=substr($date,8,2);$time=substr($date,11,8);
	$yy+=543;
	$dateT=intval($dd)." ".$_month_name[$mm]." ".$yy." ".$time;
	return $dateT;
	}
?>
<?php
mysql_select_db($database_conn, $conn);
$query_rsNews = "SELECT * FROM news WHERE news_ID='$news_ID'";
$rsNews = mysql_query($query_rsNews, $conn) or die(mysql_error());
$row_rsNews = mysql_fetch_assoc($rsNews);
$totalRows_rsNews = mysql_num_rows($rsNews);

?>
<style type="text/css">
<!--
.style8 {font-size: 12}
.style19 {
	font-size: 24px;
	color: #0000FF;
}
body {
	background-image: url(Images/bg.gif);
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</td>
<div align="center"><span class="style8">
  </tr>
  </table>
  </td>
  </tr>
  </table>
</span>
  <table width="600" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="16"><div align="center"><img src="images/news_pic/large_pic/<?php echo $row_rsNews['large_pic']; ?>" >&nbsp;</div></td>
    </tr>
    <tr>
      <td><div align="center" class="style19"><?php echo $row_rsNews['headline']; ?></div></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>        
        <div align="center">
         <?php //find string length
		 $length=strlen($row_rsNews['story_text']);
		 //$spacebar=str_replace(" test","t ",$test,$count);
		 $numrow=($length)/174; 
		 ?> 
		 <textarea name="textfield" cols="90" rows="<?php echo $numrow;?>"><?php echo $row_rsNews['story_text']; ?></textarea>
            <span class="headlines style8">
        </span></div></td></tr>
    <tr>
      <td><div align="right">โพสเมื่อ <?php echo $row_rsNews['published']; ?> </div></td>
    </tr>
  </table>
  <span class="style8">  </span>
</div>
</body>
<!-- InstanceEnd --></html>
<?php
mysql_free_result($rsNews);
?>
