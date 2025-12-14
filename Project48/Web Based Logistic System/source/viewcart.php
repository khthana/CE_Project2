<body bgcolor="#FFCC00" background="images/bg01.gif"><table width=87% border=1 align='center' cellpadding=0 cellspacing=0 bordercolor="#FFCC00" bgcolor="#FFCC33">
  <tr> 
    <td width="19%"  rowspan=2 bgcolor="#FFCC33"><img src='images/Logistic_01.gif' width=148 height=68 > 
    </td>
    <td height="47" bgcolor="#FFCC33" >&nbsp;<img src='images/Logistic_02.gif' width=93 height=45  ><img src='images/Logistic_03.gif' width=90 height=45 ><img src='images/Logistic_04.gif' width=97 height=45 ><img src='images/Logistic_05.gif' width=104 height=45 ><img src='images/Logistic_06.gif' width=90 height=45 ><img src='images/Logistic_07.gif' width=57 height=45 ></td>
  </tr>
  <tr> 
    <td height='18' bgcolor='#FFCC00'><div align="center"><strong></strong></div></td>
  </tr>
  <tr bgcolor="#FFCC33" > 
    <td height='16' colspan='2'> <div align="right"></div></td>
  </tr>
  <tr> 
    <td height='18' colspan='2' valign='top'> <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
        <tr> 
          <td height="18"> 
            <?
	session_start();
	require('connect.php');
	$sql="select t.id_temp,t.cusid, t.nameres, t.surres, t.ratt, t.rmoo, t.rdistrict, t.ramphur, t.rprovince, t.rzipcode, t.sdate, t.total, t.price, t.id_session, p.packtype from temp t , packtype p where t.packid=p.packid and t.id_session='$session_id' order by t.id_temp";
	$result=mysql_db_query($dbname,$sql);
	$count=0;
	print"<table border=\"0\" width=\"100%\" >
					<tr align=\"center\"  style=\"font-weight: bold;\" bgcolor=\"#FFCC66\">
					<font size=\"1\" face=\"MS Sans Serif, Tahoma, sans-serif\">
						<td><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"> ลำดับ</font></td>
						<td><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"> รหัสผู้ส่ง</font></td>
						<td><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">ผู้รับ</font></td>
						<td><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">ที่อยู่</font></td>
						<td><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">วันที่ส่ง</font></td>
						<td><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">ชนิด</font></td>
						<td><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">จำนวน</font></td>
						<td><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"> ราคา</font></td>		
						<td><font face=\"MS Sans Serif, Tahoma, sans-serif\" size=\"2\"><b>จัดการสินค้า</font></td>
						</font></tr>";
			while($object=mysql_fetch_object($result)){
				$count++;
				$name=$object->nameres." ".$object->surres;
				$address= $object->ratt." ".$object->rmoo." ". $object->rdistrict." ". $object->ramphur." ". $object->rprovince." ". $object->rzipcode;
			print"<tr>
						<td align=\"center\"><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"> $count</font></td>
						<td align=\"center\"><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"> $object->cusid</font></td>
						<td align=\"center\"><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"> $name</font></td>
						<td align=\"center\"><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">$address</font></td>
						<td align=\"center\"><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"> $object->sdate</font></td>
						<td align=\"center\"><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"> $object->packtype</font></td>
						<td align=\"center\"><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"> $object->total</font></td>
						<td align=\"center\"><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"> $object->price</font></td>
						<td align=\"center\"><font face=\"MS Sans Serif, Tahoma, sans-serif\" size=\"2\"><a href=\"?file=befortemp.php&id_temp=$object->id_temp\">แก้ไขรายการสินค้า</a>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a href=\"deletetocart.php?id_temp=$object->id_temp\" onclick=\"return confirm('คุณต้องการยกเลิกรายการนี้ใช่หรือไม่')\">นำออก</a></font></td>
						</font></tr>";
						$total+=$object->price;
						$idcus=$object->cusid;
			}
					mysql_close();
					if($count==0){
						print"<tr>
									<td colspan=\"14\" rowspan=\"1\" align=\"center\"><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\" color='red'> <strong>-->>ไม่มีสินค้าในรายการ<<--</strong></font></td>
								<tr>";
					}
				print"<tr>
				            <td colspan=\"6\" rowspan=\"1\">&nbsp;</td>
						</tr>
						<tr  style=\"font-weight: bold;\">
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							 <td colspan=\"4\" rowspan=\"1\" align=\"center\"><font size=\"3\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\">รวมรายการทั้งสิ้น $total บาท</font></td>			
					   </tr>";
			    print"<tr>
							<td colspan=\"6\" rowspan=\"1\">&nbsp; </td>
						</tr>";
					 
			    print"<tr>
								
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							<td colspan=\"6\" rowspan=\"1\" align=\"center\"><font size=\"2\" face=\"Microsoft Sans Serif, MS Sans Serif, sans-serif\"color=\"blue\"><a href=\"index.php?file=usertool.php&file2=senddetail.php&file4=formsend2.php\"><b>ทำรายการต่อ</b></a>&nbsp; &nbsp; &nbsp;  <a href=\"confirm.php?total=$total&idcus=$idcus\">ออกใบส่งสินค้า</b></a></font></td>						
						</td>
						</tr>";
						
	print"</table>";		
?>
          </td>
        </tr>
      </table></td>
  </tr>
  <tr bgcolor="#FFCC33"> 
    <td height='16' colspan='2' valign='top'><div align="right"><strong></strong></div></td>
  </tr>
</table>
