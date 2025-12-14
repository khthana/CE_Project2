<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>

<body>
<?
include "connect.inc.php";
$sql="select * from station order by id_station";
$result=mysql_db_query($dbname,$sql);
?>
<br>
<table width="98%" border="0" align="center">
  <tr> 
    <td bgcolor="#CC0033"><table width="100%" border="0" align="center" cellspacing="0">
        <tr bgcolor="#CC0033"> 
          <td height="18" colspan="9"><div align="center"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>ข้อมูลสถานีบริการขนส่งสินค้า</strong></font></div></td>
        </tr>
        <tr bgcolor="#FF9933"> 
          <td width="6%"><div align="center"><strong><font color="#000000">เลขที่</font></strong></div></td>
          <td width="6%"><div align="center"><strong><font color="#000000">หมู่ที่</font></strong></div></td>
          <td width="11%"><div align="center"><strong>ถนน</strong></div></td>
          <td width="11%"><div align="center"><strong><font color="#000000">ตำบล</font></strong></div></td>
          <td width="13%"><div align="center"><strong><font color="#000000">อำเภอ</font></strong></div></td>
          <td width="11%"><div align="center"><strong><font color="#000000">จังหวัด</font></strong></div></td>
          <td width="10%"><div align="center"><strong><font color="#000000">รหัสไปรษณีย์</font></strong></div></td>
          <td width="9%"><div align="center"><strong><font color="#000000">โทรศัพท์</font></strong></div></td>
          <td width="23%"><div align="center"><strong><font color="#000000">การจัดการ</font></strong></div></td>
        </tr>
        <?
  while($object=mysql_fetch_object($result))
  {
  print"<tr bgcolor=#FFE7D7>
    <td align=center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->sta_number</font></td>
    <td align=center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->sta_moo</font></td>
    <td align=center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->sta_road</font></td>
    <td align=center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->sta_district</font></td>
    <td align=center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->sta_amphur</font></td>
    <td align=center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->sta_province</font></td>
    <td align=center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->sta_zipcode</font></td>
    <td align=center><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->sta_telephone</font></td>
	<td align=center><img src=\"images/img/i_newtopic.gif\" align=\"absmiddle\"><a href=?file=updatestation.php&id=$object->id_station><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\" color=blue>แก้ไขข้อมูล</a>&nbsp;&nbsp;&nbsp;<img src=\"images/img/icon_err.gif\" align=\"absmiddle\"><font color=red>ลบข้อมูล</font></td>
  </tr>";
  }
  ?>
        <tr bgcolor=#FFE7D7> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="22"><div align="right"><img src="images/img/wwebB.gif" width="16" height="16" align="absbottom"><strong>เพิ่มสถานีบริการ</strong></div></td>
  </tr>
</table>
</body>
</html>
