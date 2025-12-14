<?
session_start();

include("config.inc.php");
include("md5.js");

$member=0;
if($name&&$pwd)
{
//echo"name=$name<br>";
//echo"pwd=$pwd<br>";
//echo"code=$codeedit<br>";
	mysql_connect($host,$user,$passwd);

$sql="	select member.username,password from member,poster where member.username=poster.username and member.username='$name'  and code='$codeedit' ";
	$result=mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	if($NRow==0)
	{ 
		$member=0;
		
	
	}
	else
	{
			$row = mysql_fetch_array($result);
			
/////
			$pwd1=$row["password"];
			$pwd1=MD5($pwd1).$challenge;
			$pwd1=MD5($pwd1);
			
			//			echo "pwd1=$pwd1<br>";

			// ตรวจสอบว่า Password ถูกหรือไม่	
			if($name==$row["username"] && $pwd==$pwd1) 
				{ 
					$member=1;
					session_register("member");
					}
 		}	
//////////
}

if($member==1)
{?><title>แก้ไขประกาศ</title>
<table width="640" border="1" cellspacing="0" cellpadding="0" height="30" bordercolor="#000080" align="center">
  <tr bgcolor="#FFCCFF"> 
    <td> 
      <div align="center"><b><font face="MS Sans Serif" size="3" color="#003300">แก้ไขประกาศ</font></b></div>
    </td>
  </tr>
</table>
<?
	//กำหนดไฟล์ที่ใช้ show		
	$dfile=substr($codeedit,0,1);
	switch($dfile){
	case "B" :	include("editpost/editbook.php");
							break;
    case "E"  : include("editpost/editequ.php");
							break;
	case "V" :   include("editpost/editvehicle.php");
						break;
	case "H" :   include("editpost/editaddress.php");
						break;
	case "F" :include("editpost/editfriends.php");
						break;
	case "N" :include("editpost/editnews.php");
						break;
	case "A" : include("editpost/editetc.php");
						break;
	case "L" : include("editpost/editlost.php");
						break;							
										}
}else{
?>
<table width="50%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>


<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="53%"><img src="images/logo_big.gif" width="467" height="54"></td>
    <td height="51" width="15%" align="center" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href="../index.html">หน้าแรก</a></b></font></td>
    <td height="51" width="12%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>
  </tr>
</table>
<hr color=1E90FF>

<table width="50%" border="1" cellspacing="0" cellpadding="0" align="center" bgcolor="#FFFFCC" bordercolor="#FF33FF">
  <tr>
    <td height="80"> 
      <div align="center"><b><font face="MS Sans Serif" size="3" color="#FF33FF">มีข้อผิดพลาดกรุณาตรวจสอบ</font></b></div>
    </td>
  </tr>
</table>

 <hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF" size=2>Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
<?
}

?>