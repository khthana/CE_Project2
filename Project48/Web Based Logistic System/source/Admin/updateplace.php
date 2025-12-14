<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<br>
<table width="80%" border="0" align="center">
  <tr> 
    <td><form name="form1" method="post" action="?file=updateplacetable.php">
        <table width="100%" border="0" cellspacing="1">
          <tr> 
            <td colspan="5" bgcolor="#CC0033"><font color="#FFFFFF"><strong>แก้ไขค่าบริการเริ่มต้นแบ่งตามพื้นที่</strong></font></td>
          </tr>
          <tr bgcolor="#FF9933"> 
            <td height="11"><div align="center"><strong>รหัส</strong></div></td>
            <td><div align="center"><strong>จังหวัดต้นทาง</strong></div></td>
            <td><div align="center"><strong>จังหวัดปลายทาง</strong></div></td>
            <td><div align="center"><strong>อัตราราคา</strong></div></td>
            <td width="25%"><div align="center"><strong>การจัดการ</strong></div></td>
          </tr>
          <?
		include "connect.inc.php";
		$sql="select * from place where place_id=$idplace";
		$result=mysql_db_query($dbname,$sql);
		$array=mysql_fetch_array($result);
		?>
          <tr bgcolor="#FFFFFF"> 
            <td width="11%"  align="center"> 
              <?=$array[place_id]?>
            </td>
            <td width="20%" align="center"> 
              <?=$array[send_place]?>
            </td>
            <td width="26%" align="center"> 
              <?=$array[res_place]?>
            </td>
            <td width="18%" align="center"> <input name="rate" type="text" value="<?=$array[place_rate]?>" size="6"> 
			<input name="idplace" value="<?=$array[place_id]?>" type="hidden">
            </td>
            <td><div align="center"> 
                <input type="submit" name="Submit" value="อัพเดท">
                &nbsp;&nbsp;</div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
    <td><div align="center"><a href="?file=packdata.php"><strong>&lt;&lt; หน้าหลัก</strong></a></div></td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
