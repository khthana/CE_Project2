<?
	include("config.inc.php");

	// ติดต่อ database เพื่ออ่านข้อมูล
	mysql_connect($host,$user,$passwd);
	$sql = "select * from member where username='$Username'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);

		if($NRow==0) { echo "Error"; exit(); }
	
	$row = mysql_fetch_array($result);
	
	// กำหนดค่าตัวแปร เพื่อนำไปแสดง
	$Username = $row["username"];
	$Email = $row["email"];
	$ICQ = $row["icq"];
	$Fullname = $row["fullname"];
	$Nickname=$row["nickname"];
	$TEL=$row["tel"];
	$Pager=$row["pager"];
	$Addr=$row["addr"];
	$Homepage=$row["homepage"];
	$Faculty=$row["faculty"];
	$Department=$row["department"];
	$Branch=$row["branch"];
	$Year=$row["year"];
	$Class=$row["class"];
	$ID=$row["id"];

?>

<html>
<head>
<title>ข้อมูลสมาชิก</title>
<link rel="stylesheet" type="text/css" href="style.css">	
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
</head>
<body bgcolor="#FFFFFF">

<table width="100%" border="0" cellspacing="0" cellpadding="0" height="50">
  <tr> 
    <td height="51" width="20%">&nbsp;</td>
    <td height="51" width="53%"><img src="images/logo_big.gif" width="467" height="54"></td>
    <td height="51" width="15%" align="center" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href="../index.html">หน้าแรก</a></b></font></td>
    <td height="51" width="12%"  align ="left" valign="bottom"><font face="MS Sans Serif, Microsoft Sans Serif" size="2"><b><a href='javascript:window.close()'>ปิดหน้านี้ </a></b></font></td>
  </tr>
</table>
<hr color=1E90FF>


<div align="center"> 
    
  <table width="65%" border="1" cellspacing="0" cellpadding="0" bordercolor="#0033FF" height="30">
    <tr bgcolor="#CCCCFF"> 
      <td height="25" bgcolor="#9999FF"> 
        <div align="center"><font face="MS Sans Serif"><b><font size="3" color="#FFFFFF">ข้อมูลสมาชิก</font></b></font></div>
      </td>
    </tr>
  </table>  
  <table width="65%" border="1" cellspacing="0" cellpadding="3" bordercolor="#0033FF">
    <tr> 
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">Username</font></b></font></td>
      <td width="25%" height="30"> 
        <? echo"$Username";?>
      </td>
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">Email</font></b></font></td>
      <td width="39%" height="30"> 
        <? echo " $Email";?>
      </td>
    </tr>
    <tr> 
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">ICQ</font></b></font></td>
      <td width="25%"> 
        <? echo " $ICQ";?>
      </td>
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">Homepage</font></b></font><font color="#FFFFFF" size="1"><b> 
        </b></font></td>
      <td width="39%"> 
        <? echo " $Homepage";?>
      </td>
    </tr>
    <tr> 
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">ชื่อ-นามสกุล</font></b></font></td>
      <td width="25%"> 
        <? echo " $Fullname";?>
      </td>
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">ชื่อเล่น</font></b></font></td>
      <td width="39%"> 
        <? echo " $Nickname";?>
      </td>
    </tr>
    <tr> 
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">คณะ</font></b></font></td>
      <td width="25%" height="30"> 
        <? echo " $Faculty";?>
      </td>
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">ภาควิชา 
        </font> </b> </font></td>
      <td width="39%" height="30"> 
        <? echo " $Department";?>
      </td>
    </tr>
    <tr> 
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">สาขาวิชา</font></b></font></td>
      <td width="25%" height="30"> 
        <? echo " $Branch";?>
      </td>
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">ปี</font></b></font></td>
      <td width="39%" height="30"> 
        <? echo " $Year";?>
      </td>
    </tr>
    <tr> 
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">ห้อง</font></b></font></td>
      <td width="25%" height="30"> 
        <? echo " $Class";?>
      </td>
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">รหัสนักศึกษา</font></b></font></td>
      <td width="39%" height="30"> 
        <? echo " $ID";?>
      </td>
    </tr>
    <tr> 
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">โทรศัพท์</font></b></font></td>
      <td width="25%" height="30"> 
        <? echo " $TEL";?>
      </td>
      <td width="18%" height="30" bgcolor="#99CCFF"><font face="MS Sans Serif" size="1" color="#000099"><b><font color="#FFFFFF">เพจเจอร์</font></b></font></td>
      <td width="39%" height="30"> 
        <? echo " $Pager";?>
      </td>
    </tr>
  </table>
  <table width="65%" border="1" cellspacing="0" cellpadding="2" bordercolor="#0033FF">
    <tr> 
      <td height="71" width="18%" bgcolor="#99CCFF" valign="top"><font face="MS Sans Serif" size="2" color="#000099"><b><font color="#FFFFFF" size="1">สถานที่ติดต่อได</font><font color="#FFFFFF">้</font></b></font></td>
      <td height="71" width="82%"> 
        <? echo " $Addr";?>
      </td>
    </tr>
  </table>
</div>
<hr color=1E90FF>
  <table width="100%" border="0" height="53">
    <tr> 
      <td height="36" valign="top"> 
        <div align="center"><font color="#0000FF" size="1">Department of Computer Engineering 
          Faculty of Engineering King Mongkut's Institute of Technology<br>
          Ladkrabang BKK 10520, Thailand. Tel. +662-3269969 Fax.+662-7392400</font><br>
        </div>
      </td>
    </tr>
  </table>
  </body>
</html>