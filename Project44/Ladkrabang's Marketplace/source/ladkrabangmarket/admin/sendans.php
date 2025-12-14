<?
session_start();
if($administrator[0]=='1')
{
?>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
<link rel="stylesheet" type="text/css" href="../style.css">	
</head>
<body bgcolor="#FFFFFF">
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="18%">&nbsp;</td>
    <td height="51" width="65%"><img src="../images/logo_big.gif" width="467" height="54"></td>
 
    <td height="51" width="17%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ 
      </a></b></font></td>
  </tr>
</table>
<hr color=1E90FF>

<?
   include("../config.inc.php");	
	include("smtpmail.php");

	mysql_connect($host,$user,$passwd);




$msg = "Subject : $subject \n\n $message \n\n จาก : LadkrabangMarketPlace";


$from="webmaster@ce.kmitl.ac.th";

//if(mail($mailto , $subject , $msg , "From : ". $name)) {
if(! smail($from,$mailto,$subject,$msg) ){
	
	
	?>
<table width="60%" border="1" cellspacing="0" cellpadding="0" align="center" height="26" bgcolor="#FFFFCC" bordercolor="#FF00FF">
  <tr> 
    <td height="42">
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#0000FF"><br>
        <font color="#FF0000">ได้ทำการส่งอีเมล์</font><br>
        <br>
        </font></b><font color="#FF0000" size="1">ถึง <b>
        <? echo $mailto ?>
        </b><br>
        <br>
        เรียบร้อยแล้ว <br>
        </font></font></div>
    </td>
  </tr>
</table>

<?
	$sql2 = "UPDATE toadmin SET ans=1  WHERE no='$noans' ";
	$result = mysql_db_query($dbname,$sql2);
} else {
?>
	<table width="60%" border="1" cellspacing="0" cellpadding="0" align="center" height="26" bgcolor="#FFCCFF" bordercolor="#FF0000">
  <tr> 
    <td height="42">
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#0000FF"><br>
        ไม่สามารถส่งอีเมล์<br>
        <br>
        </font></b><font color="#000000" size="1">ให้คุณ</font><font color="#000000"> 
        <b><font color="#FF00FF"><? echo $user ?></font></b><br><br>
        <font size="1">ได้ครับกรุณาตรวจสอบ<br> </font></font></font></div>
    </td>
  </tr>
</table>

<?
}
mysql_close();
?>
  <hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF">Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>

</body>
</html>
<?
}else
{
echo"<CENTER><H1>ไม่อนุญาตให้เข้าสู่ระบบ</h1></CENTER> ";
}?>