<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<br>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="16" colspan="6" bgcolor="#CC0033"><div align="center"><strong><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif">ตารางสินค้าประจำวัน</font></strong></div></td>
  </tr>
  <tr> 
    <td width="15%" height="18" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รหัสสินค้า</font></strong></div></td>
    <td width="20%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ผู้รับ</font></strong></div></td>
    <td width="27%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ที่อยู่</font></strong></div></td>
    <td width="15%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ประเภท</font></strong></div></td>
    <td width="12%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">จำนวนชิ้น</font></strong></div></td>
    <td width="11%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ราคา</font></strong></div></td>
  </tr>
  <? 
		include "chksession.php";
		print"<tr bgcolor=\"#FFF2C6\">"; 
		include "connect.php";
		$today=date("Y-n-j");
		$sql = "select t.transid, t.rname, t.rsername, t.ratt, t.rmoo, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype  from transition t , packtype p where t.packid=p.packid  order by t.transid"; 
		$result=mysql_db_query($dbname,$sql);
		if($result){
		$packtotal=0;
		$pricetotal=0;
			while($array=mysql_fetch_array($result)){
 $transid=$array[transid];
	   $name=$array[rname];
		  $lname=$array[rsername];
		  $att=$array[ratt];
		  $moo=$array[rmoo];
		  $district=$array[rdistrict];
		  $amphur=$array[ramphur];
		  $province=$array[rprovince];
		  $zipcode=$array[rzipcode];
		 $packtype=$array[packtype];
		  $total=$array[total];
		  $price=$array[price];
		  $sdate=$array[sdate];
		  $rdate=$array[rdate];
		  $status=$array[status];
		  $type_status=$array[type_status];
		  $names=$name.' '.$lname;
		  $address=เลขที่ .' '. $att .' '.หมู่ที่.' '.ตำบล .' '. $district .' '. อำเภอ .' '.$amphur.' '. จังหวัด .' '.$province.' '. $zipcode;
		  //$sdate=displaydate($sdate);
		  print"<td bgcolor=\"#FFF2C6\"  valign='top' align='center'>$transid</td>
          <td align=\"center\" valign='top' bgcolor=\"#FFF2C6\">$names</td>
          <td align=\"left\" bgcolor=\"#FFF2C6\">$address</td>
		  <td align=\"center\"  valign='top' bgcolor=\"#FFF2C6\">$packtype</td>
          <td align=\"center\"  valign='top' bgcolor=\"#FFF2C6\">$total</td>
          <td align=\"right\"  valign='top' bgcolor=\"#FFF2C6\">$price - &nbsp;&nbsp;</td>
		   </tr>";
		$packtotal+=$total;
		$pricetotal+=$price;
		}
		}else{
		print"ไม่สามารถชมได้";
		}
		mysql_close();
		?>
  <tr bgcolor="#FFFFCC" > 
    <td height="18" colspan="4"><div align="right"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รวม</font></strong></div></td>
    <td><div align="center"> 
        <?=$packtotal?>
      </div></td>
    <td><div align="right"><? print"$pricetotal - &nbsp;&nbsp;"?></div></td>
  </tr>
</table>
</body>
</html>
