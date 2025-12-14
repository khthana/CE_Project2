<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
session_start();
include "connect.php";
$sql="select * from customers where cusid='$sess_username' ";
$result=mysql_db_query($dbname,$sql);
$object=mysql_fetch_object($result);

?>
<table width="99%" height="195" border="0" align="center" cellspacing="0">
  <tr>
    <td height="195" bgcolor="#FFCC00"><table width="100%" height="193" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr bgcolor="#FFCC00"> 
          <td height="16" colspan="3"><div align="center"><strong><font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif">.:: 
              ข้อมูลสมาชิก </font><font size="2" face="MS Sans Serif, Tahoma, sans-serif">::.</font></strong></div></td>
        </tr>
        <tr> 
          <td width="11%">&nbsp;</td>
          <td width="43%" height="24"><strong>รหัสสมาชิก :</strong> &nbsp;<? print"$object->cusid";?></td>
          <td width="46%"><img src="images/img/i_sheet.gif" width="15" height="11" align="absmiddle">&nbsp;<a href="?file=datatool.php&file2=updatecustomer.php"><font color="#FF0000"><strong>แก้ไข 
            Password</strong></font></a></td>
        </tr>
        <tr> 
          <td >&nbsp;</td>
          <td colspan="2"><strong>ชื่อสถานประกอบการ :</strong> &nbsp;<? print"$object->busname"; ?></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><strong>ชื่อ :</strong> &nbsp;<? print"$object->name";?></td>
          <td><strong>นามสกุล :</strong> &nbsp;<? print"$object->lname";?></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><strong>เลขที่ :</strong> &nbsp;<? print"$object->att";?></td>
          <td><strong>หมู่ที่ :</strong> &nbsp;<? print"$object->moo";?></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><strong>ตำบล/แขวง :</strong> &nbsp;<? print"$object->district";?></td>
          <td><strong>อำเภอ/เขต :</strong> &nbsp;<? print"$object->amphur";?></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><strong>จังหวัด :</strong> &nbsp;<? print"$object->province";?></td>
          <td><strong>รหัสไปรษณีย์ :</strong> &nbsp;<? print"$object->zipcode";?></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><strong>โทรศัพท์ :</strong> &nbsp;<? print"$object->telephone";?></td>
          <td><strong>มือถือ :</strong> &nbsp;<? print"$object->mobile";?></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td height="20">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td height="20">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
