<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="98%" height="202" border="0" align="center">
  <tr> 
    <td height="72" valign="top" bgcolor="#CC0033"> <table width="100%" border="0" cellspacing="1">
        <tr bgcolor="#CC0033"> 
          <td height="21" colspan="4"><font color="#FFFFFF"><strong>อัตราค่าขนส่งสินค้าแบ่งตามชนิดสินค้า</strong></font></td>
        </tr>
        <tr bgcolor="#FF9933"> 
          <td height="21"><div align="center"><strong>รหัส</strong></div></td>
          <td><div align="center"><strong>ชนิดสินค้า</strong></div></td>
          <td><div align="center"><strong>อัตราราคา</strong></div></td>
          <td width="35%"><div align="center"><strong>การจัดการ</strong></div></td>
        </tr>
        <?
include "connect.inc.php";
  $sql="select * from packtype order by packid";
  $result=mysql_db_query($dbname,$sql);
  while($array=mysql_fetch_array($result))
  {
  $packid=$array[packid];
  ?>
        <tr bgcolor="#FFFFFF"> 
          <td width="9%" height="22"  align="center"> 
            <?=$array[packid]?>
          </td>
          <td width="37%" align="center"> 
            <?=$array[packtype]?>
          </td>
          <td width="19%" align="center"> <? print"$array[packrate]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;บาท";?> 
          </td>
          <td><div align="center"><img src="images/img/i_newtopic.gif" width="16" height="16" align="absmiddle"> 
              <? print"<a href=\"?file=updatepack.php&packid=$array[packid]\"><font color=\"#0000FF\">แก้ไขข้อมูล</font>&nbsp;</a>"; ?> &nbsp;&nbsp;&nbsp;<img src="images/img/icon_err.gif" width="16" height="16" align="absmiddle"> 
              <? print" <a href=\"deletepack.php?packid=$packid\" onclick=\"return confirm('ท่านต้องการลบรายการนี้ใช่หรือไม่ ?')\"><font color=\"#FF0000\">ลบรายการ </font></a> " ; ?></div></td>
        </tr>
        <?
		}
  ?>
      </table></td>
  </tr>
  <tr> 
    <td height="24" valign="top"><div align="right"><font size="4"><strong><img src="images/img/wwebB.gif" width="16" height="16" align="absbottom"><a href="?file=addpack.php">เพิ่มรายการชนิดสินค้า</a></strong></font></div></td>
  </tr>
  <tr> 
    <td height="72" valign="top" bgcolor="#CC0033"><table width="100%" border="0" cellspacing="1">
        <tr> 
          <td colspan="5" bgcolor="#CC0033"><font color="#FFFFFF"><strong>อัตราค่าบริการเริ่มต้นแบ่งตามพื้นที่</strong></font></td>
        </tr>
        <tr bgcolor="#FF9933"> 
          <td height="11"><div align="center"><strong>รหัส</strong></div></td>
          <td><div align="center"><strong>จังหวัดต้นทาง</strong></div></td>
          <td><div align="center"><strong>จังหวัดปลายทาง</strong></div></td>
          <td><div align="center"><strong>อัตราราคา</strong></div></td>
          <td width="29%"><div align="center"><strong>การจัดการ</strong></div></td>
        </tr>
        <?
		$sql="select * from place order by place_id ASC";
		$result=mysql_db_query($dbname,$sql);
		while($array=mysql_fetch_array($result))
		{
		
		?>
        <tr bgcolor="#FFFFFF"> 
          <td width="10%"  align="center"> 
            <?=$array[place_id]?>
          </td>
          <td width="21%" align="center"> 
            <?=$array[send_place]?>
          </td>
          <td width="25%" align="center"> 
            <?=$array[res_place]?>
          </td>
          <td width="15%" align="center"> <? print"$array[place_rate]&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;บาท";?> 
          </td>
          <td><div align="center"><img src="images/img/i_newtopic.gif" width="16" height="16" align="absmiddle"><? print"<a href=\"?file=updateplace.php&idplace=$array[place_id]\"> 
              <font color=\"#0000FF\">แก้ไขข้อมูล</font></a>"; ?>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/img/icon_err.gif" width="16" height="16" align="absmiddle"> 
              <? print" <a href=\"deleteplace.php?place=$array[place_id]\" onclick=\"return confirm('ท่านต้องการลบรายการนี้ใช่หรือไม่ ?')\"><font color=\"#FF0000\">ลบรายการ </font></a> " ; ?></div></td>
        </tr>
        <?
		}
		?>
      </table></td>
  </tr>
  <tr>
    <td height="24" valign="top"><div align="right"><font size="4"><strong><img src="images/img/wwebB.gif" width="16" height="16" align="absbottom"><a href="?file=addplace.php">เพิ่มพื้นที่การส่งสินค้า</a></strong></font></div></td>
  </tr>
</table>
</body>
</html>
