<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE></TITLE>
</HEAD>

<BODY BGCOLOR="#FFFFFF">
<?
  include("config.inc.php");
  include("smtpmail.php");
   //ติดต่อฐานข้อมูล
$user_f=$name;

//echo"user=$user<br>";
//echo"email=$email<Br>";
   mysql_connect($host,$user,$passwd);

	$sql = "select username,password,email from member where username='$user_f'  and email='$email'  ";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
  if($NRow==0){
      	
		echo"<br><br>";
		echo "<center>";
		echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
		echo "<tr><td align=center>";
		echo "<font size=2 face='MS Sans Serif'>";
        echo "<font size=3 color=red><b>ไม่มีคุณ $user_f อยู่ในรายชื่อสมาชิก</b></font><br><br>";
		echo "กรุณาตรวจสอบด้วยครับ";
		echo "</font></td></tr></table>";
		echo "<br><hr width=500 color=blue>";
		echo "<font size=2 face='MS Sans Serif'>";
		echo "[<a href='javascript:history.back(1)'>Back</a>]";
		echo "</center>";
		exit();
	  
		}
		else{
			$row = mysql_fetch_array($result);
             $password=$row["password"];

//echo"$password";

$subject="From Ladkrabang's Marketplace to ".$user_f;

$msg="Username=$user_f \n Password=$password \n ";
//if(mail($email , $subject , $msg , "From : ". "Ladkrabangmarketplace"))

$from="webmaster@ce.kmitl.ac.th";

if(! smail($from,$email,$subject,$msg) )	

{
?>
<table width="60%" border="1" cellspacing="0" cellpadding="0" align="center" height="26" bgcolor="#66FFCC" bordercolor="#0000FF">
  <tr> 
    <td height="42">
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#0000FF"><br>ได้ทำการส่งรหัสผ่าน<br><br>
        </font></b><font color="#000000" size="1">ให้คุณ <b><font color="#FF00FF"><? echo $user_f ?></font></b><br><br>
        เรียบร้อยแล้ว <br></font></font></div>
    </td>
  </tr>
</table>
<?
} else {
?>
<table width="60%" border="1" cellspacing="0" cellpadding="0" align="center" height="26" bgcolor="#FFCCFF" bordercolor="#FF0000">
  <tr> 
    <td height="42">
      <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><font color="#0000FF"><br>ไม่สามารถส่งรหัสผ่าน<br><br>
        </font></b><font color="#000000" size="1">ให้คุณ</font><font color="#000000"> 
        <b><font color="#FF00FF"><? echo $user_f ?></font></b><br><br>
        <font size="1">ได้ครับกรุณาตรวจสอบ<br> </font></font></font></div>
    </td>
  </tr>
</table>
<?
}				
				
	}

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
</BODY>
</HTML>
