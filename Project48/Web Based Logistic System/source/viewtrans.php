<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>ตารางสินค้า</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body bgcolor="#F2F2F2">
<table width="96%" border="0" align="center" cellpadding="1" cellspacing="2" bgcolor="#F2F2F2">
  <tr> 
    <td height="18" bgcolor="#FFCC00"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>รายการสินค้า</strong></font></div></td>
  </tr>
  <tr> 
    <td height="60" valign="top" bgcolor="#CC0033"><table width="100%" height="58" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
        <tr bgcolor="#CC0033"> 
          <td height="16" colspan="6"><div align="center"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>รอการจัดส่ง</strong></font></div></td>
        </tr>
        <tr bgcolor="#FFCC33"> 
          <td width="14%" height="16"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">วันที่ส่ง</font></strong></font></div></td>
          <td width="17%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ผู้รับ</font></strong></font></div></td>
          <td width="35%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ที่อยู่</font></strong></font></div></td>
          <td width="10%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ประเภท</font></strong></font></div></td>
          <td width="15%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">จำนวน(ชิ้น)</font></strong></font></div></td>
          <td width="9%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ราคา</font></strong></font></div></td>
        </tr>
        <? 
			  print"<tr>"; 
		include "connect.php";
		//include "function.php"; 
		$sql="select t.transid, t.rname, t.rsername, t.ratt, t.rmoo, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype   from transition t , packtype p where t.packid=p.packid and cusid='$sess_username' and t.id_status=1 order by t.transid" ;
		$result=mysql_db_query($dbname,$sql);
		if($result){
		$total1=0;
		$price1=0;	
			while($array=mysql_fetch_array($result)){
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
		  $status=$array[id_status];
		  $names=$name.' '.$lname;
		  $address=เลขที่ .' '. $att .' '.หมู่ที่.' '.$moo.' '. ตำบล .' '. $district .' '. อำเภอ .' '.$amphur.' '. จังหวัด .' '.$province.' '. $zipcode;
		  print"
		  <td align=\"center\" bgcolor=\"#ffffdd\">$sdate</td>
          <td align=\"center\" bgcolor=\"#ffffdd\">$names</td>
          <td align=\"left\" bgcolor=\"#ffffdd\">$address</td>
		  <td align=\"center\" bgcolor=\"#ffffdd\">$packtype</td>
          <td align=\"center\" bgcolor=\"#ffffdd\">$total</td>
          <td align=\"right\" bgcolor=\"#ffffdd\">$price - &nbsp;&nbsp;</td>
        </tr>";
		$total1+=$total;
		$price1+=$price;
		}
		}else{
		print"ไม่สามารถชมได้";
		}
		//mysql_close();
		?>
        <tr bgcolor="#FFFFFF"> 
          <td height="20" colspan="4"><div align="right"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รวม</font></strong></div></td>
          <td><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
              <?=$total1?>
              </font></div></td>
          <td><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
              <?=$price1?>
              </font></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="49" valign="top" bgcolor="#F2F2F2">&nbsp;</td>
  </tr>
  <tr> 
    <td height="44" valign="top" bgcolor="#CC0033"><table width="100%" height="58" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
        <tr bgcolor="#CC0033"> 
          <td height="16" colspan="6"><div align="center"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>จัดส่ง</strong></font></div></td>
        </tr>
        <tr bgcolor="#FFCC33"> 
          <td width="14%" height="16"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">วันที่ส่ง</font></strong></font></div></td>
          <td width="17%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ผู้รับ</font></strong></font></div></td>
          <td width="35%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ที่อยู่</font></strong></font></div></td>
          <td width="10%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ประเภท</font></strong></font></div></td>
          <td width="15%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">จำนวน(ชิ้น)</font></strong></font></div></td>
          <td width="9%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ราคา</font></strong></font></div></td>
        </tr>
        <? 
			  print"<tr>"; 
		include "connect.php";
		//include "function.php"; 
		//$sql="select t.transid, t.rname, t.rsername, t.raddr, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype   from transition t , packtype p where t.packid=p.packid and cusid='$sess_username' and t.id_status=2 order by t.transid" ;
		$sql="select t.transid, t.rname, t.rsername, t.ratt, t.rmoo, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype   from transition t , packtype p where t.packid=p.packid and cusid='$sess_username' and t.id_status=2 order by t.transid" ;
		$result=mysql_db_query($dbname,$sql);
		if($result){
		$total1=0;
		$price1=0;	
			while($array=mysql_fetch_array($result)){
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
		  $status=$array[id_status];
		  $names=$name.' '.$lname;
		  $address=เลขที่ .' '. $att .' '.หมู่ที่.' '.$moo.' '. ตำบล .' '. $district .' '. อำเภอ .' '.$amphur.' '. จังหวัด .' '.$province.' '. $zipcode;
		  print"
		  <td align=\"center\" bgcolor=\"#ffffdd\">$sdate</td>
          <td align=\"center\" bgcolor=\"#ffffdd\">$names</td>
          <td align=\"left\" bgcolor=\"#ffffdd\">$address</td>
		  <td align=\"center\" bgcolor=\"#ffffdd\">$packtype</td>
          <td align=\"center\" bgcolor=\"#ffffdd\">$total</td>
          <td align=\"right\" bgcolor=\"#ffffdd\">$price - &nbsp;&nbsp;</td>
        </tr>";
		$total1+=$total;
		$price1+=$price;
		}
		}else{
		print"ไม่สามารถชมได้";
		}
		//mysql_close();
		?>
        <tr bgcolor="#FFFFFF"> 
          <td height="20" colspan="4"><div align="right"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รวม</font></strong></div></td>
          <td><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
              <?=$total1?>
              </font></div></td>
          <td><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
              <?=$price1?>
              </font></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="40" valign="top" bgcolor="#F2F2F2">&nbsp;</td>
  </tr>
  <tr> 
    <td height="60" valign="top" bgcolor="#CC0033"><table width="100%" height="58" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
        <tr bgcolor="#CC0033"> 
          <td height="16" colspan="6"><div align="center"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>ถึงจุดบริการปลายทาง</strong></font></div></td>
        </tr>
        <tr bgcolor="#FFCC33"> 
          <td width="14%" height="16"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">วันที่ส่ง</font></strong></font></div></td>
          <td width="17%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ผู้รับ</font></strong></font></div></td>
          <td width="35%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ที่อยู่</font></strong></font></div></td>
          <td width="10%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ประเภท</font></strong></font></div></td>
          <td width="15%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">จำนวน(ชิ้น)</font></strong></font></div></td>
          <td width="9%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ราคา</font></strong></font></div></td>
        </tr>
        <? 
			  print"<tr>"; 
		//$sql="select t.transid, t.rname, t.rsername, t.raddr, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype   from transition t , packtype p where t.packid=p.packid and cusid='$sess_username' and t.id_status=3 order by t.transid" ;
		$sql="select t.transid, t.rname, t.rsername, t.ratt, t.rmoo, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype   from transition t , packtype p where t.packid=p.packid and cusid='$sess_username' and t.id_status=3 order by t.transid" ;
		$result=mysql_db_query($dbname,$sql);
		if($result){
		$total2=0;
		$price2=0;
			while($array=mysql_fetch_array($result)){
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
		  $status=$array[id_status];
		  $names=$name.' '.$lname;
		  $address=เลขที่ .' '. $att .' '.หมู่ที่.' '.$moo.' '. ตำบล .' '. $district .' '. อำเภอ .' '.$amphur.' '. จังหวัด .' '.$province.' '. $zipcode;
		  print"
		  <td align=\"center\" bgcolor=\"#ffffdd\">$sdate</td>
          <td align=\"center\" bgcolor=\"#ffffdd\">$names</td>
          <td align=\"left\" bgcolor=\"#ffffdd\">$address</td>
		  <td align=\"center\" bgcolor=\"#ffffdd\">$packtype</td>
          <td align=\"center\" bgcolor=\"#ffffdd\">$total</td>
          <td align=\"right\" bgcolor=\"#ffffdd\">$price - &nbsp;&nbsp;</td>
        </tr>";
		$total2+=$total;
		$price2+=$price;
		}
		}else{
		print"ไม่สามารถชมได้";
		}
		//mysql_close();
		?>
        <tr bgcolor="#FFFFFF"> 
          <td height="20" colspan="4"><div align="right"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รวม</font></strong></div></td>
          <td><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
              <?=$total2?>
              </font></div></td>
          <td><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
              <?=$price2?>
              </font></div></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="40" valign="top" bgcolor="#F2F2F2">&nbsp;</td>
  </tr>
  <tr> 
    <td height="63" valign="top" bgcolor="#CC0033"><table width="100%" height="61" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
        <tr bgcolor="#CC0033"> 
          <td colspan="6"><div align="center"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>ส่งลูกค้าเรียบร้อยแล้ว</strong></font></div></td>
        </tr>
        <tr bgcolor="#FFCC33"> 
          <td width="14%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>ถึงวันที่</strong></font></div></td>
          <td width="17%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ผู้รับ</font></strong></font></div></td>
          <td width="35%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ที่อยู่</font></strong></font></div></td>
          <td width="10%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ประเภท</font></strong></font></div></td>
          <td width="15%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">จำนวน(ชิ้น)</font></strong></font></div></td>
          <td width="9%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ราคา</font></strong></font></div></td>
        </tr>
        <? 
			  print"<tr>"; 
		///include "connect.php";
		//include "function.php"; 
		$today=date("Y-n-j");
		//$sql="select t.transid, t.rname, t.rsername, t.raddr, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype   from transition t , packtype p where t.packid=p.packid and cusid='$sess_username' and t.id_status=4   order by t.transid" ;
		$sql="select t.transid, t.rname, t.rsername, t.ratt, t.rmoo, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype   from transition t , packtype p where t.packid=p.packid and cusid='$sess_username' and t.id_status=4 and t.sdate='$today' order by t.transid" ;
		$result=mysql_db_query($dbname,$sql);
		if($result){
		$total3=0;
		$price3=0;
			while($array=mysql_fetch_array($result)){
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
		  $status=$array[id_status];
		  $names=$name.' '.$lname;
		  $address=เลขที่ .' '. $att .' '.หมู่ที่.' '.$moo.' '. ตำบล .' '. $district .' '. อำเภอ .' '.$amphur.' '. จังหวัด .' '.$province.' '. $zipcode;
		  print"<td >$sdate</td>
          <td align=\"center\">$names</td>
          <td align=\"left\">$address</td>
		  <td align=\"center\">$packtype</td>
          <td align=\"center\" >$total</td>
          <td align=\"right\">$price - &nbsp;&nbsp;</td>
        </tr>";
		$total3=$total;
		$price3=$price;
		}
		}else{
		print"ไม่สามารถชมได้";
		}
		//mysql_close();
		?>
        <tr bgcolor="#FFFFFF"> 
          <td height="20" colspan="4"><div align="right"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">รวม</font></strong></div></td>
          <td align="center"> 
            <?=$total3?>
          </td>
          <td align="center"> 
            <?=$price3?>
          </td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
