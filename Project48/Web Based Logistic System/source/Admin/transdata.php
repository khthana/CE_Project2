<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="98%" border="0" align="center">
  <tr>
    <td bgcolor="#CC0033"><table width="100%" border="0" align="center" cellspacing="1">
        <tr bgcolor="#CC0033"> 
          <td colspan="5"><font color="#FFFFFF"><strong>ตารางการขนส่งสินค้าประจำวัน</strong></font></td>
        </tr>
        <tr bgcolor="#FF9933"> 
          <td height="22"><div align="center"><strong>รหัส</strong></div></td>
          <td bgcolor="#FF9933"><div align="center"><strong>ผู้ส่ง</strong></div></td>
          <td><div align="center"><strong>ผู้รับ</strong></div></td>
          <td><div align="center"><strong>ชิ้น</strong></div></td>
          <td width="31%"><div align="center"><strong>การจัดการ</strong></div></td>
        </tr>
        <?
  	include "connect.inc.php";
		$sql = 'SELECT * FROM `transition` order by transid ';
		$result=mysql_db_query($dbname,$sql);
		while($array=mysql_fetch_array($result))
		{
		
		?>
        <tr bgcolor="#FFFFFF"> 
          <td width="10%" height="22"  align="center">
            <?=$array[transid]?>
          </td>
          <td width="21%" align="center">
            <?=$array[cusid]?>
          </td>
          <td width="20%" align="center">
            <?=$array[rname]?>
          </td>
          <td width="18%" align="center">
            <?=$array[total]?>
          </td>
          <td><div align="center"><img src="images/img/wwebB.gif" align="absmiddle"> 
              <font color="#0000FF">แก้ไขรายการ</font>&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/img/icon_err.gif" width="16" height="16" align="absmiddle"> 
              <? print "<a href=\"?file=deletetrans.php&transid=$array[transid]\"><font color=\"#FF0000\">ลบรายการ</font> </a>"; ?></div></td>
        </tr>
        <?
		}
		?>
      </table></td>
  </tr>
</table>
</body>
</html>
