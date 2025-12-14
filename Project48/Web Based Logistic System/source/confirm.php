<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
if($total=="")
{
print"<meta http-equiv=\"refresh\" content=\"0;url=viewcart.php\">";       exit();
}
session_start();
include "connect.php";
include "function.php";
$sql="select * from customers where cusid='$idcus' ";
$result=mysql_db_query($dbname,$sql);
if($result)
{
		$array=mysql_fetch_array($result);
		$name=$array[name];
		$lname=$array[lname];
		$moo=$array[moo];
		$att=$array[att];
		$district=$array[district];
		$amphur=$array[amphur];
		$province=$array[province];
		$zipcode=$array[zipcode];
		}
		?>
<table width="100%" border="0" align="center">
  <tr bgcolor="#CCCCCC"> 
    <td height="44" colspan="4"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong><font size="5">ใบส่งสินค้า</font><br>
        <font size="3">Web-base Logistic System</font><br>
        </strong></font></div></td>
  </tr>
  <tr> 
    <td colspan="4"><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">วันที่&nbsp; 
        <? $today = date("Y-n-j");  
		$day=displaydate($today);
		 print"$day";?>
        &nbsp;&nbsp; </font></div></td>
  </tr>
  <tr> 
    <td colspan="4"><div align="left"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>รายละเอียดผู้ส่ง:</strong></font></div></td>
  </tr>
  <tr> 
    <td width="20%"><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ชื่อ 
        :</font></div></td>
    <td colspan="3"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;คุณ</font><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong> 
      <? print "$name";?></strong> &nbsp;นามสกุล&nbsp;&nbsp;&nbsp;<strong><? print"$lname"; ?></strong></font></td>
  </tr>
  <tr> 
    <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;ที่อยู่ 
        :</font></div></td>
    <td colspan="3"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;เลขที่&nbsp; 
      <strong> 
      <?=$att?>
      </strong> หมู่ที่&nbsp;<strong> 
      <?=$moo?>
      </strong>&nbsp;ตำบล <strong> 
      <?=$district?>
      </strong> &nbsp;&nbsp;&nbsp;อำเภอ <strong> 
      <?=$amphur?>
      </strong> &nbsp;&nbsp;&nbsp; จังหวัด <strong> 
      <?=$province?>
      </strong> &nbsp;&nbsp;&nbsp;รหัสไปรณีย์ <strong> 
      <?=$zipcode?>
      </strong> </font></td>
  </tr>
  <tr> 
    <td height="18" colspan="4"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
  </tr>
  <tr> 
    <td height="18" colspan="4"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>รายการสินค้าที่ส่ง 
      :</strong></font><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
  </tr>
  <tr> 
    <td height="92" colspan="4"><table width="100%" border="0">
        <tr bgcolor="#CCCCCC"> 
          <td width="4%" ><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ที่</font></strong></div></td>
          <td width="10%" ><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รหัสสินค้า</font></strong></div></td>
          <td width="17%" ><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ผู้รับ</font></strong></div></td>
          <td width="24%"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ที่อยู่</font></strong></div></td>
          <td width="12%" ><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ประเภท</font></strong></div></td>
          <td width="8%" ><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">จำนวน</font></strong></div></td>
          <td width="25%"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ราคา</font></strong></div></td>
        </tr>
        <?
  	$sql="select  t.*, p.packtype from temp t, packtype p  where t.packid=p.packid and id_session='$session_id' order by  id_temp ASC";
	$result=mysql_db_query($dbname,$sql);
	$num=mysql_num_rows($result);
	$count=0;
	while($object=mysql_fetch_object($result)){
				$count++;
				$totals+=$object->total;
				$prices+=$object->price;
			$name=$object->nameres." ".$object->surres;
			$address= $object->ratt." ".$object->rmoo." ". $object->rdistrict." ". $object->ramphur." ". $object->rprovince." ". $object->rzipcode;
	print"
        <tr> 
          <td align=\"center\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$count</font></td>
		  <td align=\"center\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->id_temp</font></td>
          <td align='center'><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$name</font></td>
          <td align='center'><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$address</font></td>
         <td align='center'><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->packtype</font></td>
		 <td align='center'><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->total</font></td>
          <td align='center'><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\">$object->price</font></td>
        </tr>";
		
		}
		mysql_close($link);
	if($num<=0){
	print"<tr>
		<td colspan=\"11\" rowspan=\"1\" align=\"center\"><font size=\"2\" face=\"MS Sans Serif, Tahoma, sans-serif\" color='red'>------------  ไม่มีสินค้าที่ส่ง  -----------</font></td>";
}
?>
        <tr> 
          <td></td>
          <td></td>
          <td></td>
          <td colspan="4" rowspan="1" align="center">&nbsp;</td>
        </tr>
        <tr> 
          <td height="20"></td>
          <td></td>
          <td></td>
          <td colspan="5"><div align="right"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">รวมทั้งสิ้น 
              <strong> 
              <?=$totals?>
              </strong>ชิ้น</font></div></td>
        </tr>
        <tr> 
          <td height="20"></td>
          <td></td>
          <td></td>
          <td colspan="5"><div align="right"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">ค่าขนส่ง 
              <strong> 
              <?=$prices?>
              </strong> บาท</font></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="142" colspan="4" valign="">&nbsp;</td>
  </tr>
  <tr>
    <td height="26" align="right"></td>
    <td align="right">&nbsp;</td>
    <td align="right"></td>
    <td align="right">-------------------------------------<br>
      <font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>พนักงานรับสินค้า&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr> 
    <td height="26" align="right"></td>
    <td width="4%" align="right">&nbsp;</td>
    <td width="53%" align="right"></td>
    <td width="23%" align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><a onClick="window.print()">[ 
      ออกใบรายการ ]</a> <? print"<a href=\"sendtable.php?totals=$totals&id_cus=$idcus\">[ ยืนยันการส่งสินค้า ]<b></b></a>"; ?></font> 
    </td>
  </tr>
</table>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
