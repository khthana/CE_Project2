<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="98%" border="0" align="center">
  <tr>
    <td height="211" valign="top"><table width="100%" border="0">
        <tr> 
          <td height="62"><table width="100%" height="58" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bgcolor="#FFFFFF">
              <tr bgcolor="#CC0033"> 
                <td height="18" colspan="6"><div align="center"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>รายการสินค้าที่รับ</strong></font></div></td>
              </tr>
              <tr bgcolor="#FFCC33"> 
                <td width="14%" height="16"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>รหัสสินค้า</strong></font></div></td>
                <td width="17%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ผู้ส่ง</font></strong></font></div></td>
                <td width="27%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ที่อยู่</font></strong></font></div></td>
                <td width="17%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">ประเภท</font></strong></font></div></td>
                <td width="7%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong><font size="2" face="MS Sans Serif, Tahoma, sans-serif">จำนวน</font></strong></font></div></td>
                <td width="18%"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;<strong>สถานะ</strong></font></div></td>
              </tr>
              <? 
			  print"<tr>"; 
		include "connect.php";
		//include "function.php"; 
		$sql1="select * from customers where cusid='$sess_username' ";
		$result1=mysql_db_query($dbname,$sql1);
		$object1=mysql_fetch_object($result1);
		$sql="select t.cusid, t.transid, t.rname, t.rsername, t.ratt, t.rmoo, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype, s.type_status   from transition t , packtype p, pstatus s where t.packid=p.packid and t.id_status=s.id_status and t.rname='$object1->name' and t.rsername='$object1->lname' and t.ratt='$object1->att' and t.rmoo='$object1->moo' and t.id_status<>4 order by t.transid" ;
		$result=mysql_db_query($dbname,$sql);
		if($result){
		$total1=0;
		$price1=0;	
			while($array=mysql_fetch_array($result)){
			//$cusid=$array[cusid];
		 $transid=$array[transid];
		 $packtype=$array[packtype];
		  $total=$array[total];
		  $sdate=$array[sdate];
		  $rdate=$array[rdate];
		  $status=$array[id_status];
		  $type=$array[type_status];
		 $sql2="select * from customers where cusid='$array[cusid]' ";
		 $result2=mysql_db_query($dbname,$sql2);
		 $object2=mysql_fetch_object($result2);
		 	$names=$object2->name. " ".$object2->lname;
		 	 $address=เลขที่ .' '. $object2->address.' '. ตำบล .' '. $object2->district .' '. อำเภอ .' '.$object2->amphur.' '. จังหวัด .' '.$object2->province.' '. $object2->zipcode;
		 
		  print"
		  <td align=\"center\" bgcolor=\"#ffffdd\">$transid</td>
          <td align=\"center\" bgcolor=\"#ffffdd\">$names</td>
          <td align=\"left\" bgcolor=\"#ffffdd\">$address</td>
		  <td align=\"center\" bgcolor=\"#ffffdd\">$packtype</td>
          <td align=\"center\" bgcolor=\"#ffffdd\">$total</td>
          <td align=\"center\" bgcolor=\"#ffffdd\">$type</td>
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
                    </font></div></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <form name="form1" method="post" action="">
        <p align="center"> 
          <select name="select">
            <option value="รหัสสินค้า" selected>รหัสสินค้า</option>
          <? $sql="select t.cusid, t.transid, t.rname, t.rsername, t.ratt, t.rmoo, t.rdistrict , t.ramphur, t.rprovince, t.rzipcode, t.total, t.price, t.sdate, t.rdate, t.id_status, p.packtype, s.type_status   from transition t , packtype p, pstatus s where t.packid=p.packid and t.id_status=s.id_status and t.rname='$object1->name' and t.rsername='$object1->lname' and t.ratt='$object1->att' and t.rmoo='$object1->moo' and t.id_status<>4 order by t.transid" ;
		$result=mysql_db_query($dbname,$sql);
		while($object=mysql_fetch_object($result))
		{
		print"
		<option value=\"$object->transid\" selected>$object->transid</option>
		";
		}
		?>
		  </select>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <input type="text" name="textfield">
          <input type="submit" name="Submit" value="Submit">
        </p>
        </form></td>
  </tr>
</table>
</body>
</html>
