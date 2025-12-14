<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="99%" border="0" align="center" cellspacing="0">
  <tr> 
    <td height="18" valign="top" bgcolor="#F2F2F2"><div align="center"> 
        <p><strong><font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
          ตารางสินค้ารอการยืนยันการตวจสอบ</font></strong></p>
      </div></td>
  </tr>
  <tr> 
    <td height="54" valign="top" bgcolor="#CC0033"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="16" colspan="7" bgcolor="#CC0033"><div align="left"><strong><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif">ตารางสินค้า</font></strong></div></td>
        </tr>
        <tr> 
          <td width="8%" height="18" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รหัสสินค้า</font></strong></div></td>
          <td width="20%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ผู้รับ</font></strong></div></td>
          <td width="27%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ที่อยู่</font></strong></div></td>
          <td width="11%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ประเภท</font></strong></div></td>
          <td width="12%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">จำนวน</font></strong></div></td>
          <td width="7%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ราคา</font></strong></div></td>
          <td width="15%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ตรวจสอบ</font></strong></div></td>
        </tr>
        <? 
		include "chksession.php";
		print"<tr bgcolor=\"#FFF2C6\">"; 
		include "connect.php";
		$today=date("Y-n-j");
		$sql = "select t.transid, t.rname, t.rsername, t.ratt, t.rmoo, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype ,s.send_place from transition t , packtype p, place s where t.packid=p.packid and t.place_id=s.place_id and t.sdate='$today' and s.send_place='$sess_place' and t.id_status=1 order by t.transid"; 
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
		  $names=$name.' '.$lname;
		  $address=เลขที่ .' '. $att .' '.หมู่ที่.' '.ตำบล .' '. $district .' '. อำเภอ .' '.$amphur.' '. จังหวัด .' '.$province.' '. $zipcode;
		  $sdate=displaydate($sdate);
		  print"<td bgcolor=\"#FFF2C6\"  valign='top' align='center'>$transid</td>
          <td align=\"center\" valign='top' bgcolor=\"#FFF2C6\">$names</td>
          <td align=\"left\" bgcolor=\"#FFF2C6\">$address</td>
		  <td align=\"center\"  valign='top' bgcolor=\"#FFF2C6\">$packtype</td>
          <td align=\"center\"  valign='top' bgcolor=\"#FFF2C6\">$total</td>
          <td align=\"right\"  valign='top' bgcolor=\"#FFF2C6\">$price - &nbsp;&nbsp;</td>
		  <td align=\"center\"  valign='top' bgcolor=\"#FFF2C6\"><a href =confirmlog.php?transid=$transid><font color='red'><b>ยืนยัน</font></a></td>
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
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="22" valign="top" bgcolor="#FFFFFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="18" valign="top" bgcolor="#FFFFFF"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>สินค้าที่จัดส่ง</strong></font></div></td>
  </tr>
  <tr>
    <td height="54" valign="top" bgcolor="#CC0033"><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td height="17" colspan="7" bgcolor="#CC0033"><div align="left"><strong><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif">ตารางสินค้า</font></strong></div></td>
        </tr>
        <tr> 
          <td width="8%" height="18" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รหัสสินค้า</font></strong></div></td>
          <td width="20%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ผู้รับ</font></strong></div></td>
          <td width="27%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ที่อยู่</font></strong></div></td>
          <td width="11%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ประเภท</font></strong></div></td>
          <td width="12%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">จำนวน</font></strong></div></td>
          <td width="7%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ราคา</font></strong></div></td>
          <td width="15%" bgcolor="#FFCC33"><div align="center"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">สถานะ</font></strong></div></td>
        </tr>
        <? 
		print"<tr bgcolor=\"#FFF2C6\">"; 
		include "connect.php";
		$today=date("Y-n-j");
		//$sql = "select t.transid, t.rname, t.rsername, t.ratt, t.rmoo, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype ,s.type_status from transition t , packtype p, place s where t.packid=p.packid and t.place_id=s.place_id and t.sdate='$today' and s.send_place='$sess_place' and t.id_status=2 order by t.transid"; 
		
		$sql = "select t.transid, t.rname, t.rsername, t.ratt, t.rmoo, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, s.type_status, p.packtype from transition t, pstatus s , packtype p, place pl where t.place_id=pl.place_id and t.id_status=s.id_status and t.packid=p.packid  and t.sdate='$today' and pl.send_place='$sess_place' and t.id_status=2  order by t.transid"; 
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
    
		  $sdate=displaydate($sdate);
		  print"<td bgcolor=\"#FFF2C6\"  valign='top' align='center'>$transid</td>
          <td align=\"center\" valign='top' bgcolor=\"#FFF2C6\">$names</td>
          <td align=\"left\" bgcolor=\"#FFF2C6\">$address</td>
		  <td align=\"center\"  valign='top' bgcolor=\"#FFF2C6\">$packtype</td>
          <td align=\"center\"  valign='top' bgcolor=\"#FFF2C6\">$total</td>
          <td align=\"right\"  valign='top' bgcolor=\"#FFF2C6\">$price - &nbsp;&nbsp;</td>
		  <td align=\"center\"  valign='top' bgcolor=\"#FFF2C6\"><font color='red'>$type_status</td>
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
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
