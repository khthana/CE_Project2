<?php session_start(); ?>
<?php require_once('Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
//find news 1
$query ="SELECT * FROM news where news_order ='1' and published is not null";
$news1 = mysql_query($query, $conn) or die(mysql_error());
$row_news1 = mysql_fetch_assoc($news1) ;
$news_ID1=$row_news1['news_ID'];
$pic1=$row_news1['small_pic'];
$headline1 =$row_news1['headline'];
//find news 2
$query ="SELECT * FROM news where news_order ='2' and published is not null";
$news2 = mysql_query($query, $conn) or die(mysql_error());
$row_news2 = mysql_fetch_assoc($news2) ;
$news_ID2=$row_news2['news_ID'];
$pic2=$row_news2['small_pic'];
$headline2 =$row_news2['headline'];
//find news 3
$query ="SELECT * FROM news where news_order ='3' and published is not null";
$news3 = mysql_query($query, $conn) or die(mysql_error());
$row_news3 = mysql_fetch_assoc($news3) ;
$news_ID3=$row_news3['news_ID'];
$pic3=$row_news3['small_pic'];
$headline3 =$row_news3['headline'];
//find news 4
$query ="SELECT * FROM news where news_order ='4' and published is not null";
$news4 = mysql_query($query, $conn) or die(mysql_error());
$row_news4 = mysql_fetch_assoc($news4) ;
$news_ID4=$row_news4['news_ID'];
$pic4=$row_news4['small_pic'];
$headline4 =$row_news4['headline'];
//find news 5
$query ="SELECT * FROM news where news_order ='5' and published is not null";
$news5 = mysql_query($query, $conn) or die(mysql_error());
$row_news5 = mysql_fetch_assoc($news5) ;
$news_ID5=$row_news5['news_ID'];
$pic5=$row_news5['small_pic'];
$headline5 =$row_news5['headline'];
//find news 6
$query ="SELECT * FROM news where news_order ='6' and published is not null";
$news6 = mysql_query($query, $conn) or die(mysql_error());
$row_news6 = mysql_fetch_assoc($news6) ;
$news_ID6=$row_news6['news_ID'];
$pic6=$row_news6['small_pic'];
$headline6 =$row_news6['headline'];
?>
<script language = "javascript">
function check_blank()
{
if(form1.username.value == ""){
		alert("กรุณากรอก username ค่ะ");
		form1.username.focus();
		return false;
	}
	else if(form1.password.value == ""){
		alert("กรุณากรอก password ค่ะ");
		form1.password.focus();
		return false;
	}
}
</script>
<html>
<head>
<SCRIPT LANGUAGE="JavaScript">
<!-- Begin
function scroll(jumpSpaces,position) {
var msg = "Kmitl E-Learning web site"
var out = ""
if (killScroll) {return false} 
for (var i=0; i<position; i++){
out += msg.charAt(i)}
for (i=1;i<jumpSpaces;i++) {
out += " "}
out += msg.charAt(position)
window.status = out
if (jumpSpaces <= 1) {
position++
if (msg.charAt(position) == ' ') {
position++ }
jumpSpaces = 100-position        
}
else if (jumpSpaces >  3) {
jumpSpaces *= .75}
else {
jumpSpaces--}
if (position != msg.length) {
var cmd = "scroll(" + jumpSpaces + "," + position + ")";
scrollID = window.setTimeout(cmd,5);
} 
else {
scrolling = false
return false}
return true;
}
function startScroller() {
if (scrolling)
if (!confirm('Re-initialize snapIn?'))
return false
killScroll = true
scrolling = true
var killID = window.setTimeout('killScroll=false',6)
scrollID = window.setTimeout('scroll(100,0)',10)
return true
}
var scrollID = Object
var scrolling = false
var killScroll = false
// End -->
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>M a i n p a g e </title>
<style type="text/css">
<!--
body {
	background-image: url();
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {font-size: 12px}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
.style10 {
	color: #006699;
	font-family: Tahoma, sans-serif, verdana, Arial;
}
.style11 {color: #003333}
.style12 {color: #0000FF}
-->
</style>
</head>
<BODY onLoad="startScroller()">
<?php include("index_header.htm"); ?>
<table width="860" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td valign="top">      <div align="center">
        </div>      <div align="left">
          <p>&nbsp;</p>
          </div></td>
    <td valign="top"><table height="730" border="0" cellpadding="0" cellspacing="0" bgcolor="#E6F3FF">
      <tr>
        <td width="192" height="19" colspan="3" >&nbsp;</td>
      </tr>
      <tr>
        <td colspan="3"><?php
	$ID=$HTTP_SESSION_VARS['user_ID'];
	if($ID=="")
	include('login_form.htm');
	else
	include('logout_form.php');
	?></td>
      </tr>
      <tr>
        <td height="57" colspan="3"><div align="center">
            <?php include('calender.php'); ?>
        </div></td>
      </tr>
      <tr>
        <td height="394" colspan="3"><span class="style11">&nbsp;
        </span></td>
      </tr>
    </table></td>
    <td valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td width="489" valign="top"><table width="0" height="0" border="0" cellpadding="0" cellspacing="0" bordercolor="#66CCFF">
      <tr>
        <td colspan="2"><?php include('television.htm');//480*300?>          </td>
        </tr>
      <tr>
        <td width="209" height="10" ></td>   <td width="271" height="10" ></td>
      </tr>
    </table>
      <table border="0" cellpadding="0" cellspacing="0" bgcolor="#F0F0F0">
        <tr>
          <td colspan="7"></td>
        </tr>
        <tr>
          <td colspan="7"></td>
        </tr>
        <tr bgcolor="#F5E7E2">
          <td height="25" colspan="7"><img src="Images/index_content003.gif" width="117" height="21"></td>
        </tr>
        <tr bgcolor="#FF0000">
          <td colspan="7" height="25">
		  <marquee id=x  onmouseover="this.scrollAmount=0" onmouseout="this.scrollAmount=1" scrollAmount="1" scrollDelay="27" truespeed="true"  style="WIDTH: 480 px; HEIGHT: 8px">
		  <span class="style12">    	สวัสดีครับ ยินดีต้อนรับเข้่่่่าสู่เว็บไซต์ E-Learning ของเรา การจะสมัครเรียนต้องเป็นสมาชิกก่อนนะึีครับ โดยคลิกที่เมนู register ด้านบน หรือคลิกที่สมัครเรียนทางด้านขวานะครับ
		  </span>
		  </marquee>
		  </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td width="130">&nbsp;</td>
          <td>&nbsp;</td>
          <td width="130">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="10">&nbsp;</td>
          <td width="130"><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID1; ?>"><img src="Images/news_pic/small_pic/<?php echo $pic1; ?>" width="100" height="100" border="0"></a></div></td>
          <td width="35">&nbsp;</td>
          <td width="130"><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID2; ?>"><img src="Images/news_pic/small_pic/<?php echo $pic2; ?>" width="100" height="100" border="0"></a></div></td>
          <td width="35">&nbsp;</td>
          <td width="130"><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID3; ?>"><img src="Images/news_pic/small_pic/<?php echo $pic3; ?>" width="100" height="100" border="0"></a></div></td>
          <td width="10">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td width="130"><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID1;?>" class="style10"><?php echo $headline1; ?></a></div></td>
          <td>&nbsp;</td>
          <td width="130"><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID2;?>" class="style10"><?php echo $headline2; ?></a></div></td>
          <td>&nbsp;</td>
          <td width="130"><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID3;?>" class="style10"><?php echo $headline3; ?></a></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID4; ?>"><img src="Images/news_pic/small_pic/<?php echo $pic4; ?>" width="100" height="100" border="0"></a></div></td>
          <td>&nbsp;</td>
          <td><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID5; ?>"><img src="Images/news_pic/small_pic/<?php echo $pic5; ?>" width="100" height="100" border="0"></a></div></td>
          <td>&nbsp;</td>
          <td><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID6; ?>"><img src="Images/news_pic/small_pic/<?php echo $pic6; ?>" width="100" height="100" border="0"></a></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="51">&nbsp;</td>
          <td width="130"><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID4;?>" class="style10"><?php echo $headline4; ?></a></div></td>
          <td>&nbsp;</td>
          <td width="130"><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID5;?>" class="style10"><?php echo $headline5; ?></a></div></td>
          <td>&nbsp;</td>
          <td width="130"><div align="center"><a href="news_page.php?news_ID=<?php echo $news_ID6;?>" class="style10"><?php echo $headline6; ?></a></div></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="19">&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td height="19" bgcolor="#E6F3FF">&nbsp;</td>
          <td bgcolor="#E6F3FF">&nbsp;</td>
          <td bgcolor="#E6F3FF">&nbsp;</td>
          <td bgcolor="#E6F3FF">&nbsp;</td>
          <td colspan="2" bgcolor="#E6F3FF"><div align="right"><a href="news_show.php" class="style10">ดูข่าวทั้งหมดคลิกที่นี่&gt;&gt;</a></div></td>
          <td bgcolor="#E6F3FF">&nbsp;</td>
        </tr>
      </table>      
    <p align="center">&nbsp;    </p></td>
  <td width="8" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
  <td width="156" valign="top"><table height="691" border="0" cellpadding="0" cellspacing="0" bgcolor="#E6F3FF">
    <tr>
      <td width="150" height="35">&nbsp;</td>
    </tr>
    <tr>
      <td><a href="signup.php"><img src="Images/&#3626;&#3617;&#3633;&#3588;&#3619;&#3648;&#3619;&#3637;&#3618;&#3609;.gif" width="155" height="70" border="0"></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><a href="how_to_learn.php"><img src="Images/&#3623;&#3636;&#3608;&#3637;&#3585;&#3634;&#3619;&#3648;&#3619;&#3637;&#3618;&#3609;.gif" width="155" height="70" border="0"></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><a href="subject_show.php"><img src="Images/&#3623;&#3636;&#3594;&#3634;&#3607;&#3637;&#3656;&#3648;&#3611;&#3636;&#3604;&#3626;&#3629;&#3609;.gif" width="155" height="70" border="0"></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><a href="personal.php"><img src="Images/&#3610;&#3640;&#3588;&#3621;&#3634;&#3585;&#3619;.gif" width="155" height="70" border="0"></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><a href="elearning_profile.php"><img src="Images/E-Learning.gif" width="155" height="70" border="0"></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><a href="about_us.php"><img src="Images/&#3648;&#3585;&#3637;&#3656;&#3618;&#3623;&#3585;&#3633;&#3610;&#3648;&#3619;&#3634;.gif" width="155" height="70" border="0"></a></td>
    </tr>
    <tr>
      <td height="200">&nbsp;</td>
    </tr>
  </table></td>
  </tr>
  <tr>
    <td width="4" height="0"></td>
    <td width="187"></td>
    <td width="16"></td>
    <td></td>
    <td></td>
    <td></td>
  </tr>
<tr><td colspan="7">
<div align="center">
    <FONT face="MS Sans Serif" color=#000080 size=2>Department of Computer Engineering Faculty of Engineering King Mongkut's Institute of Technology<BR>
  Ladkrabang BKK 10520, Thailand. Tel. +662-739-2400-1 Fax.+662-7392404</FONT></div>
</td>
</tr>
</table>

</body>
</html>
