<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
include "connect.inc.php";
$sql="select * from station where id_station='$id'";
$result=mysql_db_query($dbname,$sql);
 $object=mysql_fetch_object($result);
?>
<table width="98%" border="0" align="center">
  <tr>
    <td height="118" valign="top"><form name="form1" method="post" action="?file=updatestaiontable.php">
        <table width="100%" border="0" align="center" cellspacing="0">
          <tr> 
            <td bgcolor="#CC0033" valign="top"><table width="100%" border="0" align="center" cellspacing="0">
                <tr bgcolor="#CC0033"> 
                  <td height="18" colspan="8"><div align="center"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>แก้ไขข้อมูลสถานีบริการขนส่งสินค้า</strong></font></div></td>
                </tr>
                <tr bgcolor="#FFFFFF" > 
                  <td width="9%"><div align="center"><strong><font color="#000000">เลขที่</font></strong> 
                      : </div></td>
                  <td width="11%"> <input name="number" type="text" size="5" value="<? print"$object->sta_number";?>"> 
                  </td>
                  <td width="11%"><div align="center"><strong><font color="#000000">หมู่ที่</font></strong> 
                      : </div></td>
                  <td width="13%"> <input name="moo" type="text" id="moo" value="<?=$object->sta_moo?>" size="5"> 
                  </td>
                  <td width="14%"><div align="center"><strong>ถนน</strong> :</div></td>
                  <td width="12%"> <input name="road" type="text" id="road" value="<?=$object->sta_road?>" size="12"> 
                  </td>
                  <td width="12%"><div align="center"><strong><font color="#000000">ตำบล</font></strong> 
                      : </div></td>
                  <td width="18%"> <input name="district" type="text" id="district" value="<?=$object->sta_district?>" size="12"> 
                  </td>
                </tr>
                <tr bgcolor="#FFFFFF" > 
                  <td height="24" align="center"><strong><font color="#000000">อำเภอ :</font></strong></td>
                  <td><input name="amphur" type="text" id="amphur" value="<?=$object->sta_amphur?>" size="12" ></td>
                  <td align="center"><strong><font color="#000000">จังหวัด :</font></strong></td>
                  <td><input name="province" type="text" id="province" value="<?=$object->sta_province?>" size="12"></td>
                  <td align="center"><strong><font color="#000000">รหัสไปรษณีย์ 
                    :</font></strong></td>
                  <td><input name="zipcode" type="text" id="zipcode" value="<?=$object->sta_zipcode?>" size="10"></td>
                  <td align="center"><strong><font color="#000000">โทรศัพท์ :</font></strong></td>
                  <td><input name="telephone" type="text" id="telephone" value="<?=$object->sta_telephone?>" size="9">
				  <input type="hidden" name="id" value="<? print"$object->id_station"; ?>">
				  </td>
                </tr>
                <tr bgcolor="#FFFFFF" > 
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
                <tr bgcolor="#FFFFFF" > 
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td><input type="submit" name="Submit" value="อัพเดทข้อมูล"></td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
    <td><div align="center"><img src="images/img/readymade2.gif" width="32" height="32" align="absmiddle"> 
        <a href="?file=stationdata.php"><strong>หน้าหลัก</strong></a></div></td>
  </tr>
</table>
</body>
</html>
