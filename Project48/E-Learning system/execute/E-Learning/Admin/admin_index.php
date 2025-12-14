<?php session_start(); ?>
<?php require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_admin = "SELECT * FROM `admin` where user_ID='$user_ID' ";
$admin = mysql_query($query_admin, $conn) or die(mysql_error());
$row_admin = mysql_fetch_assoc($admin);
$totalRows_admin = mysql_num_rows($admin);
 session_start(); ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>A d m i n I n d e x</title>
<style type="text/css">
<!--
.style1 {	font-size: 24px;
	color: #000000;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style2 {font-size: 36px; color: #00CCFF; font-weight: bold; }
.style3 {
	color: #FFFFFF;
	font-weight: bold;
}
.style4 {
	color: #FF3399;
	font-size: 24px;
	font-weight: bold;
}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
</head>
<body onLoad="MM_preloadImages('../Images/news.gif','../Images/user.gif','../Images/subject.gif','../Images/registration.gif','../Images/webboard.gif')">
<?php
include('admin_header.htm');?>
<div align="left">
<table width="860" border="0" cellpadding="0" cellspacing="0" bgcolor="#FF98BB">
<tr>
  <td width="195"><table border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td  bgcolor="#FF3399"  colspan="2"><marquee id=x  onMouseOver="this.scrollAmount=0" onMouseOut="this.scrollAmount=1" scrollamount="1" scrolldelay="27" truespeed="true"  style="WIDTH: 196 px; HEIGHT: 8px">
        <span class="style3">Select menu you want</span>
      </marquee></td>
      </tr>
    <tr>
      <td rowspan="5"><img src="../Images/Admin_leftmenu.gif" width="40" height="268"></td>
      <td><a href="newslists.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('news','','../Images/news.gif',1)"><img src="../Images/news0.gif" name="news" width="156" height="52" border="0"></a></td>
    </tr>
    <tr>
      <td><a href="userlists.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('user','','../Images/user.gif',1)"><img src="../Images/user0.gif" name="user" width="156" height="54" border="0"></a></td>
    </tr>
    <tr>
      <td><a href="subjectlists.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('subject','','../Images/subject.gif',1)"><img src="../Images/subject0.gif" name="subject" width="156" height="54" border="0"></a></td>
    </tr>
    <tr>
      <td><a href="registerlists.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('registration','','../Images/registration.gif',1)"><img src="../Images/register0.gif" name="registration" width="156" height="54" border="0"></a></td>
    </tr>
    <tr>
      <td height="54" ><a href="../webboard/admindel.php" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('webboard','','../Images/webboard.gif',1)"><img src="../Images/webboard0.gif" name="webboard" width="156" height="54" border="0"></a></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
    <tr>
      <td height="19">&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
    <tr>
      <td height="19">&nbsp;</td>
      <td >&nbsp;</td>
    </tr>
  </table></td>
<td width="575"> <table width="659" height="381" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><div align="center"><img src="../Images/administrator3.gif" width="288" height="231"></div></td>
      </tr>
      <tr>
        <td><p align="center" class="style1 style4">ยินดีต้อนรับ</p>          <p align="center" class="style4">คุณ&nbsp; <?php echo $row_admin['name']; echo"&nbsp"; echo $row_admin['surname']; ?></p></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
  </table></td>
</tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><div align="center"><FONT face="MS Sans Serif" color=#000080 size=2>Department of Computer Engineering Faculty of Engineering King Mongkut's Institute of Technology<BR>
  Ladkrabang BKK 10520, Thailand. Tel. +662-739-2400-1 Fax.+662-7392404</FONT></div></td>
    </tr>
  </table>
</div>
</body>
</html><?php
mysql_free_result($admin);
?>   


